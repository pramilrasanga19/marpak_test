<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>User Dashboard</title>

  <!-- Bootstrap 5 CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  
  <!-- Font Awesome for icons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  
  <style>
    :root {
      --primary-color: #4361ee;
      --secondary-color: #3f37c9;
      --accent-color: #4cc9f0;
      --light-color: #f8f9fa;
      --dark-color: #212529;
      --success-color: #4bb543;
      --warning-color: #ff9500;
      --danger-color: #ff3b30;
    }
    
    body {
      font-family: 'Poppins', sans-serif;
      background-color: #f5f7fa;
      color: var(--dark-color);
    }
    
    .dashboard-container {
      max-width: 1200px;
      margin: 2rem auto;
      padding: 0 15px;
    }
    
    .card {
      border: none;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
      overflow: hidden;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    
    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
    }
    
    .card-header {
      background-color: var(--primary-color);
      color: white;
      font-weight: 600;
      padding: 1.25rem 1.5rem;
      border-bottom: none;
    }
    
    .card-body {
      padding: 2rem;
    }
    
    .balance-card {
      background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
      color: white;
      border-radius: 10px;
      padding: 1.5rem;
      margin-bottom: 2rem;
      position: relative;
      overflow: hidden;
    }
    
    .balance-card::before {
      content: '';
      position: absolute;
      top: -50%;
      right: -50%;
      width: 200px;
      height: 200px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 50%;
    }
    
    .balance-card h4 {
      font-weight: 600;
      margin-bottom: 0.5rem;
    }
    
    .balance-amount {
      font-size: 2.2rem;
      font-weight: 700;
    }
    
    .action-btn {
      border-radius: 8px;
      padding: 0.75rem 1.5rem;
      font-weight: 500;
      transition: all 0.3s ease;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      min-width: 180px;
    }
    
    .action-btn i {
      font-size: 1.1rem;
    }
    
    .btn-primary {
      background-color: var(--primary-color);
      border-color: var(--primary-color);
    }
    
    .btn-primary:hover {
      background-color: var(--secondary-color);
      border-color: var(--secondary-color);
    }
    
    .btn-warning {
      background-color: var(--warning-color);
      border-color: var(--warning-color);
      color: white;
    }
    
    .btn-warning:hover {
      background-color: #e08a00;
      border-color: #e08a00;
      color: white;
    }
    
    .btn-info {
      background-color: var(--accent-color);
      border-color: var(--accent-color);
      color: white;
    }
    
    .btn-info:hover {
      background-color: #3ab7de;
      border-color: #3ab7de;
      color: white;
    }
    
    .btn-secondary {
      background-color: #6c757d;
      border-color: #6c757d;
    }
    
    .btn-secondary:hover {
      background-color: #5a6268;
      border-color: #5a6268;
    }
    
    .table {
      border-radius: 10px;
      overflow: hidden;
    }
    
    .table thead {
      background-color: var(--primary-color);
      color: white;
    }
    
    .table th {
      font-weight: 500;
      padding: 1rem;
    }
    
    .table td {
      padding: 1rem;
      vertical-align: middle;
    }
    
    .table tbody tr {
      transition: background-color 0.2s ease;
    }
    
    .table tbody tr:hover {
      background-color: rgba(67, 97, 238, 0.05);
    }
    
    .alert {
      border-radius: 8px;
      padding: 1rem 1.5rem;
    }
    
    .section-title {
      font-weight: 600;
      margin-bottom: 1.5rem;
      position: relative;
      padding-bottom: 0.5rem;
    }
    
    .section-title::after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 0;
      width: 50px;
      height: 3px;
      background-color: var(--primary-color);
      border-radius: 3px;
    }
    
    /* Animation for balance card */
    @keyframes pulse {
      0% { transform: scale(1); }
      50% { transform: scale(1.02); }
      100% { transform: scale(1); }
    }
    
    .balance-card {
      animation: pulse 4s infinite;
    }
    
    /* Responsive adjustments */
    @media (max-width: 768px) {
      .action-btn {
        width: 100%;
      }
      
      .card-body {
        padding: 1.5rem;
      }
      
      .balance-amount {
        font-size: 1.8rem;
      }
    }
  </style>
</head>
<body>

<div class="dashboard-container">
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
          <div>
            <i class="fas fa-tachometer-alt me-2"></i>Dashboard
          </div>
          <form method="POST" action="{{ route('logout') }}">
            @csrf
            <button type="submit" class="btn btn-sm btn-outline-danger" style="background-color:red; color:white;">
              <i class="fas fa-sign-out-alt me-1"></i> Logout
            </button>
          </form>
        </div>

        <div class="card-body">
          @if (session('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
              <i class="fas fa-check-circle me-2"></i>
              {{ session('success') }}
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          @endif

          <div class="balance-card">
            <h4><i class="fas fa-wallet me-2"></i>Current Balance</h4>
            <div class="balance-amount">${{ number_format(auth()->user()->balance, 2) }}</div>
          </div>

          <div class="d-flex justify-content-between mb-4 flex-wrap gap-3">
            <a href="{{ route('topup.create') }}" class="btn btn-primary action-btn">
              <i class="fas fa-money-bill-wave"></i> Top Up Account
            </a>
            <a href="{{ route('payment.create') }}" class="btn btn-warning action-btn">
              <i class="fas fa-file-invoice-dollar"></i> Pay Bills
            </a>
            <a href="{{ route('transfer.create') }}" class="btn btn-info action-btn">
              <i class="fas fa-exchange-alt"></i> Transfer Funds
            </a>
            <a href="{{ route('transactions.index') }}" class="btn btn-secondary action-btn">
              <i class="fas fa-history"></i> View Transactions
            </a>
          </div>

          <h5 class="section-title">
            <i class="fas fa-clock me-2"></i>Recent Transactions
          </h5>
          <div class="table-responsive">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th><i class="far fa-calendar me-2"></i>Date</th>
                  <th><i class="fas fa-tags me-2"></i>Type</th>
                  <th><i class="fas fa-dollar-sign me-2"></i>Amount</th>
                  <th><i class="fas fa-align-left me-2"></i>Description</th>
                </tr>
              </thead>
              <tbody>
                @forelse ($recentTransactions as $transaction)
                  <tr>
                    <td>{{ $transaction->created_at->format('m/d/Y H:i') }}</td>
                    <td>
                      @if($transaction->type === 'deposit')
                        <span class="badge bg-success">
                          <i class="fas fa-arrow-down me-1"></i> {{ ucfirst($transaction->type) }}
                        </span>
                      @elseif($transaction->type === 'withdrawal')
                        <span class="badge bg-danger">
                          <i class="fas fa-arrow-up me-1"></i> {{ ucfirst($transaction->type) }}
                        </span>
                      @else
                        <span class="badge bg-info">
                          <i class="fas fa-exchange-alt me-1"></i> {{ ucfirst($transaction->type) }}
                        </span>
                      @endif
                    </td>
                    <td>${{ number_format($transaction->amount, 2) }}</td>
                    <td>{{ $transaction->description }}</td>
                  </tr>
                @empty
                  <tr>
                    <td colspan="4" class="text-center py-4">
                      <i class="far fa-folder-open fa-2x mb-3" style="color: #6c757d;"></i>
                      <p class="mb-0">No transactions yet.</p>
                    </td>
                  </tr>
                @endforelse
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
  // Add some interactive elements
  document.addEventListener('DOMContentLoaded', function() {
    // Add animation to action buttons on hover
    const actionButtons = document.querySelectorAll('.action-btn');
    
    actionButtons.forEach(button => {
      button.addEventListener('mouseenter', function() {
        this.style.transform = 'translateY(-3px)';
      });
      
      button.addEventListener('mouseleave', function() {
        this.style.transform = 'translateY(0)';
      });
    });
    
    // Add click effect to table rows
    const tableRows = document.querySelectorAll('tbody tr');
    
    tableRows.forEach(row => {
      row.addEventListener('click', function() {
        // You could add functionality to view transaction details here
        console.log('Transaction clicked:', this);
      });
    });
    
    // Balance card animation on page load
    const balanceCard = document.querySelector('.balance-card');
    if (balanceCard) {
      balanceCard.style.opacity = '0';
      balanceCard.style.transform = 'translateY(20px)';
      
      setTimeout(() => {
        balanceCard.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
        balanceCard.style.opacity = '1';
        balanceCard.style.transform = 'translateY(0)';
      }, 100);
    }
  });
</script>

</body>
</html>