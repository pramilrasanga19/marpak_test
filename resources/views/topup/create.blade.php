<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Top Up Account</title>

  <!-- Bootstrap 5 CSS CDN -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

  <!-- Your custom CSS -->
  <link href="{{ asset('css/top-up.css') }}" rel="stylesheet" />

  <style>
    body {
      background-color: #f4f7fa;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      min-height: 100vh;
      padding: 30px 0;
    }

    .container {
      max-width: 600px;
    }

    .card {
      border-radius: 12px;
      box-shadow: 0 8px 18px rgba(0, 0, 0, 0.1);
      background-color: #fff;
      transition: box-shadow 0.3s ease;
    }
    .card:hover {
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
    }

    .card-header {
      background-color: #0d6efd; /* Bootstrap primary */
      color: white;
      font-weight: 700;
      font-size: 1.5rem;
      padding: 1.25rem 2rem;
      border-radius: 12px 12px 0 0;
      text-align: center;
    }

    .form-group label {
      font-weight: 600;
      color: #333;
    }

    .input-group-text {
      background-color: #e9ecef;
      font-weight: 600;
      color: #495057;
      border-radius: 0.375rem 0 0 0.375rem;
    }

    .form-control {
      border-radius: 0 0.375rem 0.375rem 0;
    }

    .btn-primary {
      background-color: #0d6efd;
      border: none;
      font-weight: 600;
      border-radius: 8px;
      padding: 10px 30px;
      box-shadow: 0 4px 10px rgb(13 110 253 / 0.4);
      transition: background-color 0.3s ease, box-shadow 0.3s ease;
      display: inline-flex;
      align-items: center;
      gap: 8px;
    }
    .btn-primary:hover {
      background-color: #0b5ed7;
      box-shadow: 0 6px 18px rgb(11 94 215 / 0.6);
    }

    .btn-secondary {
      border-radius: 8px;
      padding: 10px 30px;
      font-weight: 600;
      margin-left: 10px;
    }

    .invalid-feedback {
      font-weight: 600;
      color: #dc3545;
    }

    /* Spinner size adjustment */
    .spinner-border.spinner-border-sm {
      width: 1rem;
      height: 1rem;
      border-width: 0.15em;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="row justify-content-center">
    <div class="col-12">
      <div class="card shadow-sm">
        <div class="card-header">Top Up Account</div>

        <div class="card-body">
          <form id="topUpForm" method="POST" action="{{ route('topup.store') }}">
            @csrf

            <div class="mb-3 row">
              <label for="amount" class="col-md-4 col-form-label text-md-end">Amount</label>
              <div class="col-md-6">
                <div class="input-group">
                  <span class="input-group-text">$</span>
                  <input
                    id="amount"
                    type="number"
                    step="0.01"
                    name="amount"
                    value="{{ old('amount') }}"
                    class="form-control @error('amount') is-invalid @enderror"
                    required
                    autofocus
                    placeholder="Enter amount to top up"
                  />
                  @error('amount')
                    <span class="invalid-feedback" role="alert">
                      <strong>{{ $message }}</strong>
                    </span>
                  @enderror
                </div>
              </div>
            </div>

            <div class="row mb-0">
              <div class="col-md-6 offset-md-4 d-flex align-items-center">
                <button type="submit" class="btn btn-primary" id="submitBtn">
                  <span
                    class="spinner-border spinner-border-sm me-2 d-none"
                    role="status"
                    aria-hidden="true"
                    id="loadingSpinner"
                  ></span>
                  <span id="btnText">Top Up</span>
                </button>
                <a href="{{ route('home') }}" class="btn btn-secondary">Cancel</a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Bootstrap 5 JS Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
  document.getElementById('topUpForm').addEventListener('submit', function (e) {
    const submitBtn = document.getElementById('submitBtn');
    const spinner = document.getElementById('loadingSpinner');
    const btnText = document.getElementById('btnText');

    // Disable button to prevent multiple submits
    submitBtn.disabled = true;
    spinner.classList.remove('d-none');
    btnText.textContent = 'Processing...';
  });
</script>

</body>
</html>
