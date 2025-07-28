<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Financial Transactions | Account History</title>

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <style>
    :root {
      --primary-color: #3498db;
      --secondary-color: #f8f9fa;
      --hover-color: #2980b9;
      --border-radius: 0.375rem;
    }
    
    body {
      background-color: #f5f7fa;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    .card {
      border: none;
      border-radius: var(--border-radius);
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
      transition: transform 0.3s ease;
    }
    
    .card:hover {
      transform: translateY(-2px);
    }
    
    .card-header {
      background-color: var(--primary-color);
      color: white;
      font-weight: 600;
      font-size: 1.25rem;
      border-radius: var(--border-radius) var(--border-radius) 0 0 !important;
      padding: 1rem 1.5rem;
    }
    
    .table-responsive {
      overflow-x: auto;
    }
    
    .table {
      margin-bottom: 0;
    }
    
    .table thead th {
      background-color: var(--secondary-color);
      font-weight: 600;
      white-space: nowrap;
    }
    
    .table-hover tbody tr:hover {
      background-color: rgba(52, 152, 219, 0.05);
    }
    
    .btn-primary {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
    }
    
    .btn-primary:hover {
      background-color: var(--hover-color);
      border-color: var(--hover-color);
    }
    
    .btn-secondary {
      background-color: #6c757d;
      border-color: #6c757d;
    }
    
    .pagination-controls {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    
    @media (max-width: 768px) {
      .card-header {
        font-size: 1.1rem;
        padding: 0.75rem 1rem;
      }
      
      .table th, .table td {
        padding: 0.5rem;
        font-size: 0.9rem;
      }
      
      .btn {
        padding: 0.375rem 0.75rem;
        font-size: 0.875rem;
      }
    }
    
    @media (max-width: 576px) {
      .container {
        padding-left: 10px;
        padding-right: 10px;
      }
      
      .card-body {
        padding: 0.75rem;
      }
      
      .table-responsive {
        border: none;
      }
    }

    .card-header .btn-light {
  background-color: rgba(255, 255, 255, 0.2);
  color: white;
  border-color: rgba(255, 255, 255, 0.3);
}

.card-header .btn-light:hover {
  background-color: rgba(255, 255, 255, 0.3);
  color: white;
}

@media (max-width: 576px) {
  .card-header .btn-light {
    padding: 0.25rem 0.5rem;
    font-size: 0.8rem;
  }
}
  </style>
</head>
<body>

<div class="container py-4">
  <div class="row justify-content-center">
    <div class="col-12 col-lg-10 col-xl-8">
      <div class="card shadow-sm">
        <div class="card-header d-flex justify-content-between align-items-center">
        <div>
            <i class="bi bi-clock-history me-2"></i>Transaction History
        </div>
        <a href="/" class="btn btn-sm btn-light">
            <i class="bi bi-house-door me-1"></i>Home
        </a>
        </div>

        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-striped table-hover align-middle">
              <thead>
                <tr>
                  <th scope="col">#</th>
                  <th scope="col">Date</th>
                  <th scope="col">Type</th>
                  <th scope="col">Amount</th>
                  <th scope="col">Description</th>
                  <th scope="col">Related User</th>
                </tr>
              </thead>
              <tbody id="transactions-body">
                @include('transactions.partials.transactions_rows', ['transactions' => $transactions])
              </tbody>
            </table>
          </div>

          <div class="d-flex justify-content-between mt-4">
            <button id="show-less" class="btn btn-secondary" disabled>
              <i class="bi bi-chevron-left me-1"></i>Previous
            </button>
            <span class="align-self-center text-muted small">Page {{ $transactions->currentPage() }}</span>
            <button id="show-more" class="btn btn-primary" {{ $transactions->hasMorePages() ? '' : 'disabled' }}>
              Next<i class="bi bi-chevron-right ms-1"></i>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
  let currentPage = {{ $transactions->currentPage() }};

  $('#show-more').click(function() {
    currentPage++;
    loadPage(currentPage);
  });

  $('#show-less').click(function() {
    if(currentPage > 1) {
      currentPage--;
      loadPage(currentPage);
    }
  });

  function loadPage(page) {
    $.ajax({
      url: "{{ route('transactions.index') }}",
      type: 'GET',
      data: { page: page },
      dataType: 'json',
      beforeSend: function() {
        $('#transactions-body').html('<tr><td colspan="6" class="text-center py-4"><div class="spinner-border text-primary" role="status"><span class="visually-hidden">Loading...</span></div></td></tr>');
      },
      success: function(response) {
        $('#transactions-body').html(response.html);
        $('#show-more').prop('disabled', !response.hasMorePages);
        $('#show-less').prop('disabled', page <= 1);
        $('.pagination-info').text('Page ' + page);
      },
      error: function() {
        alert('Failed to load transactions. Please try again.');
        if(page > currentPage) currentPage--;
        else if(page < currentPage) currentPage++;
      }
    });
  }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>