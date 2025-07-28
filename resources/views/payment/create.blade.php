<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Pay Bills</title>

  <!-- Bootstrap CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

  <!-- Your custom CSS -->
  <link href="{{ asset('resources/css/pay-bills.css') }}" rel="stylesheet" />

  <style>
    /* Minor style improvements */
    .container {
      margin-top: 50px;
      max-width: 600px;
    }

    .card-header {
      background-color: #ffc107;
      color: #212529;
      font-weight: 600;
      font-size: 1.4rem;
      text-align: center;
      border-bottom: 2px solid #e0a800;
    }

    .form-group label {
      font-weight: 500;
    }

    .input-group-text {
      background-color: #fff3cd;
      border-color: #ffc107;
      color: #856404;
      font-weight: 600;
    }

    .btn-warning {
      min-width: 120px;
      font-weight: 600;
      transition: background-color 0.3s ease;
    }

    .btn-warning:hover {
      background-color: #e0a800;
      border-color: #d39e00;
    }

    .alert {
      margin-bottom: 20px;
    }

    .invalid-feedback {
      display: block;
    }

    @media (max-width: 576px) {
      .col-md-4,
      .col-md-6 {
        text-align: left !important;
        margin-bottom: 12px;
      }
    }

   
    .card-header {
    background-color: var(--primary-color);
    color: rgba(4, 80, 110, 0.81);
    }

    .card-header .btn-light {
    background-color:rgba(4, 80, 110, 0.85);
    color: white;
    border-color: rgba(32, 4, 110, 0.87);
    transition: all 0.2s ease;
    }

    .card-header .btn-light:hover {
    background-color: rgba(56, 6, 114, 0.84);
    transform: translateY(-1px);
    }

    /* Mobile responsiveness */
    @media (max-width: 576px) {
    .card-header .btn-light {
        padding: 0.25rem 0.5rem;
        font-size: 0.8rem;
    }
    .card-header .btn-light i {
        margin-right: 0 !important; /* Remove right margin on small screens */
    }
    }
  </style>
</head>
<body>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
        <div>Pay Bills</div>
        <a href="/" class="btn btn-sm btn-light">
            <i class="bi bi-house-door me-1"></i>Home
        </a>
        </div>
        <div class="card-body">
          @if (session('error'))
            <div class="alert alert-danger">
              {{ session('error') }}
            </div>
          @endif

          <form id="payBillForm" method="POST" action="{{ route('payment.store') }}">
            @csrf

            <div class="form-group row mb-3">
              <label for="biller_id" class="col-md-4 col-form-label text-md-end">Biller</label>

              <div class="col-md-6">
                <select id="biller_id" class="form-select @error('biller_id') is-invalid @enderror" name="biller_id" required>
                  <option value="">Select Biller</option>
                  @foreach ($billers as $biller)
                    <option value="{{ $biller->id }}" {{ old('biller_id') == $biller->id ? 'selected' : '' }}>
                      {{ $biller->name }}
                      @if($biller->fee_percentage > 0)
                        ({{ $biller->fee_percentage }}% fee)
                      @endif
                    </option>
                  @endforeach
                </select>

                @error('biller_id')
                  <span class="invalid-feedback" role="alert">
                    <strong>{{ $message }}</strong>
                  </span>
                @enderror
              </div>
            </div>

            <div class="form-group row mb-3">
              <label for="amount" class="col-md-4 col-form-label text-md-end">Amount</label>

              <div class="col-md-6">
                <div class="input-group">
                  <span class="input-group-text">$</span>
                  <input id="amount" type="number" step="0.01" class="form-control @error('amount') is-invalid @enderror" name="amount" value="{{ old('amount') }}" required>
                  @error('amount')
                    <span class="invalid-feedback" role="alert">
                      <strong>{{ $message }}</strong>
                    </span>
                  @enderror
                </div>
              </div>
            </div>

            <div class="form-group row mb-0">
              <div class="col-md-6 offset-md-4 d-flex align-items-center">
                <button type="submit" class="btn btn-warning position-relative" id="submitBtn">
                  <span class="spinner-border spinner-border-sm me-2 d-none" role="status" aria-hidden="true" id="loadingSpinner"></span>
                  <span id="btnText">Pay Bill</span>
                </button>
                <a href="{{ route('home') }}" class="btn btn-secondary ms-3">Cancel</a>
              </div>
            </div>
          </form>

        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
  document.getElementById('payBillForm').addEventListener('submit', function(e) {
    const submitBtn = document.getElementById('submitBtn');
    const spinner = document.getElementById('loadingSpinner');
    const btnText = document.getElementById('btnText');

    // Disable the submit button and show spinner
    submitBtn.disabled = true;
    spinner.classList.remove('d-none');
    btnText.textContent = 'Processing...';
  });
</script>

</body>
</html>
