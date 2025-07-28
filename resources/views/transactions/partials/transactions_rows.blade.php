@php
    // Calculate starting index for the current page
    $start = ($transactions->currentPage() - 1) * $transactions->perPage();
@endphp

@forelse ($transactions as $transaction)
  <tr>
    <td>{{ $start + $loop->iteration }}</td> {{-- Row number --}}
    <td>{{ $transaction->created_at->format('m/d/Y H:i') }}</td>
    <td>{{ ucfirst($transaction->type) }}</td>
    <td>${{ number_format($transaction->amount, 2) }}</td>
    <td>{{ $transaction->description }}</td>
    <td>
      @if($transaction->relatedUser && $transaction->relatedUser->name)
        {{ $transaction->relatedUser->name }}
      @else
        {{ $transaction->description ?? '-' }}
      @endif
    </td>
  </tr>
@empty
  <tr>
    <td colspan="6">No transactions found.</td> {{-- Adjust colspan to 6 --}}
  </tr>
@endforelse
