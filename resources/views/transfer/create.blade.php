<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Transfer Funds</title>

  <!-- Bootstrap 5 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

  <style>
    body, html {
      height: 100%;
    }
    .container {
      max-width: 600px;
    }
    .card-header {
      background-color: #17a2b8; /* bootstrap info color */
      color: white;
      font-weight: 600;
      font-size: 1.25rem;
      text-align: center;
    }
    .form-group label {
      font-weight: 500;
    }
    .input-group-text {
      background-color: #e9ecef;
    }
    .btn-info {
      background-color: #17a2b8;
      border-color: #17a2b8;
      min-width: 100px;
    }
    .btn-info:hover {
      background-color: #138496;
      border-color: #117a8b;
    }
    .alert {
      margin-bottom: 20px;
    }
    .invalid-feedback {
      display: block;
    }
    .spinner-border {
      vertical-align: text-bottom;
    }

    
    .card-header {
   
    color: white;
    padding: 0.75rem 1.25rem;
    }

   
    .card-header .btn-light {
    background-color: rgba(138, 2, 126, 0.96);
    color: white;
    border: 1px solid rgba(12, 40, 197, 0.9);
    border-radius: 4px;
    padding: 0.25rem 0.5rem;
    font-size: 0.875rem;
    transition: all 0.2s ease;
    }

    .card-header .btn-light:hover {
    background-color: rgba(17, 182, 174, 1);
    transform: translateY(-1px);
    }

   
    .card-header .btn-light i {
    margin-right: 0.25rem;
    }

    
    @media (max-width: 576px) {
    .card-header .btn-light {
        padding: 0.2rem 0.4rem;
        font-size: 0.75rem;
    }
    .card-header .btn-light i {
        margin-right: 0.15rem;
    }
    }
  </style>
</head>
<body>

  <!-- Center container vertically and horizontally -->
  <div class="d-flex vh-100">
    <div class="container my-auto">
      <div class="row justify-content-center">
        <div class="col-12">
          <div class="card shadow-sm">
            <div class="card-header d-flex justify-content-between align-items-center">
            <div>Transfer Funds</div>
            <a href="/" class="btn btn-sm btn-light">
                <i class="bi bi-house-door me-1"></i>Home
            </a>
            </div>
            <div class="card-body">
              <!-- Laravel session error -->
              @if (session('error'))
                <div class="alert alert-danger">
                  {{ session('error') }}
                </div>
              @endif

              <form id="transferForm" method="POST" action="{{ route('transfer.store') }}">
                @csrf

                <div class="mb-3 row">
                  <label for="recipient_id" class="col-md-4 col-form-label text-md-end">Recipient</label>
                  <div class="col-md-6">
                    <select id="recipient_id" class="form-select @error('recipient_id') is-invalid @enderror" name="recipient_id" required>
                      <option value="">Select User</option>
                      @foreach ($users as $user)
                        <option value="{{ $user->id }}" {{ old('recipient_id') == $user->id ? 'selected' : '' }}>
                          {{ $user->name }} ({{ $user->email }})
                        </option>
                      @endforeach
                    </select>
                    @error('recipient_id')
                      <span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>
                    @enderror
                  </div>
                </div>

                <div class="mb-3 row">
                  <label for="amount" class="col-md-4 col-form-label text-md-end">Amount</label>
                  <div class="col-md-6">
                    <div class="input-group">
                      <span class="input-group-text">$</span>
                      <input id="amount" type="number" step="0.01" class="form-control @error('amount') is-invalid @enderror" name="amount" value="{{ old('amount') }}" required>
                      @error('amount')
                        <span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>
                      @enderror
                    </div>
                  </div>
                </div>

                <div class="mb-0 row">
                  <div class="col-md-6 offset-md-4 d-flex align-items-center">
                    <button type="submit" class="btn btn-info position-relative" id="submitBtn">
                      <span class="spinner-border spinner-border-sm me-2 d-none" role="status" aria-hidden="true" id="loadingSpinner"></span>
                      <span id="btnText">Transfer</span>
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
  </div>

  <!-- Bootstrap 5 JS Bundle (Popper included) -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  <script>
    document.getElementById('transferForm').addEventListener('submit', function(e) {
      const submitBtn = document.getElementById('submitBtn');
      const spinner = document.getElementById('loadingSpinner');
      const btnText = document.getElementById('btnText');

      // Disable the button and show spinner
      submitBtn.disabled = true;
      spinner.classList.remove('d-none');
      btnText.textContent = 'Transferring...';
    });
  </script>

</body>
</html>
