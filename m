Return-Path: <linux-renesas-soc+bounces-24336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 482EFC4126F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 07 Nov 2025 18:50:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0BD7188D8B1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Nov 2025 17:50:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A55331A6E;
	Fri,  7 Nov 2025 17:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwN0/2co"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F156207A22;
	Fri,  7 Nov 2025 17:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762537808; cv=none; b=MIXi2F0SvLGrLibJtu/Qe5XbmmPLaoItA08eCL0d0Fz6qvHgVE3gz8XbkHVJ/vQYAZlkw12J3zFq1Zlv6a7A+vKPoTuudt8M/7TSfHGdjZcaWe2r1wQgCMFZS/+IuWh6tlD1uM8bbhyH1EjlFWaazpGjKKB0a2ZNL8V2L+j5v60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762537808; c=relaxed/simple;
	bh=qwOodP/5x1cLJTKNu9BoI3+Z+jnZGDSbAh6AAftJ9EU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MDCRO7DNIPalo81ekbX9KpE+2U2V85NXYIlD4f6FpCFtWGhpi9B+oRwI57Ii+hvRqxR1+utdDiuUQvCINfLzn9MF2Ho5b9kYe8Uum6A4AYpePLnpUKUAlWH67F2fTk0Tfpr1F8Y7wG0eT+Hpt9jSIjf6skHpIfGymtjUPxJB/+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwN0/2co; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A598C19423;
	Fri,  7 Nov 2025 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762537807;
	bh=qwOodP/5x1cLJTKNu9BoI3+Z+jnZGDSbAh6AAftJ9EU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mwN0/2coA4Qf/IpWvb+0v8FoX9cr8GFvrLJJe+4Bbi7LwojS9l7Hq8FLSt9FgqQwb
	 3vxKFGdOfW7lT3Pu+/gjHvTJl7G9V6z2jPT2YqogO5dyFosHVYpgi16S/SfoPjLXJK
	 R5jsdf7vbg+ykR0caNdoUkYtABaHVQyKTYf6Rq2lsn2PKzz4Obq3//flygKqSKwwh0
	 WU+rBGCDZAPCucxy3Qu0jiStshzGLUL5ug3ebSFozrS9mRcvGQhDotlZ/RxBkiW992
	 pmikayXdT2Dd+1z2nw8KDHski2STK+282bf8MvOOHPOg5HHnVggAmAGppTVK+jIq+D
	 +zKAhWz5NNXIw==
Date: Fri, 7 Nov 2025 17:50:02 +0000
From: Simon Horman <horms@kernel.org>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next,v2 7/7] net: ravb: Use common defines for time
 stamping control
Message-ID: <aQ4xSv9629XF-Bt3@horms.kernel.org>
References: <20251104222420.882731-1-niklas.soderlund+renesas@ragnatech.se>
 <20251104222420.882731-8-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251104222420.882731-8-niklas.soderlund+renesas@ragnatech.se>

On Tue, Nov 04, 2025 at 11:24:20PM +0100, Niklas Söderlund wrote:
> Instead of translating to/from driver specific flags for packet time
> stamp control use the common flags directly. This simplifies the driver
> as the translating code can be removed while at the same time making it
> clear the flags are not flags written to hardware registers.
> 
> The change from a device specific bit-field track variable to the common
> enum datatypes forces us to touch the ravb_rx_rcar_hwstamp() in a non
> trivial way. To make this cleaner and easier to understand expand the
> nested conditions.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

...

> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index 5477bb5c69ae..1680e94b9242 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -950,13 +950,14 @@ static void ravb_rx_rcar_hwstamp(struct ravb_private *priv, int q,
>  				 struct ravb_ex_rx_desc *desc,
>  				 struct sk_buff *skb)
>  {
> -	u32 get_ts = priv->tstamp_rx_ctrl & RAVB_RXTSTAMP_TYPE;
>  	struct skb_shared_hwtstamps *shhwtstamps;
>  	struct timespec64 ts;
> +	bool get_ts;
>  
> -	get_ts &= (q == RAVB_NC) ?
> -		RAVB_RXTSTAMP_TYPE_V2_L2_EVENT :
> -		~RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
> +	if (q == RAVB_NC)
> +		get_ts = priv->tstamp_rx_ctrl == HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
> +	else
> +		get_ts = priv->tstamp_rx_ctrl != HWTSTAMP_FILTER_PTP_V2_L2_EVENT;
>  
>  	if (!get_ts)
>  		return;

Hi Niklas,

It is Friday evening and I'm exercising a new tool, so please forgive me if
this analysis is wrong. But it seems that there are cases where there old
bit-based logic and the new integer equality based logic don't match.

1. If q == RAVB_NC then previously timestamping would occur
   for HWTSTAMP_FILTER_ALL, because:

   (RAVB_TXTSTAMP_ENABLED | RAVB_RXTSTAMP_TYPE_ALL) &
    RAVB_RXTSTAMP_TYPE & RAVB_RXTSTAMP_TYPE_V2_L2_EVENT =
   (0x10 | 0x6) & 0x06 & 0x02 = 0x2, which is non-zero.

   But with the new logic timestamping does not occur because:

   HWTSTAMP_FILTER_ALL == HWTSTAMP_FILTER_PTP_V2_L2_EVENT is false

2. If q != RAVB_NC then previously timestamping would not occur
   for HWTSTAMP_FILTER_NONE because:

   0 & RAVB_RXTSTAMP_TYPE & RAVB_RXTSTAMP_TYPE_V2_L2_EVENT = 0

   But with the new logic timestamping does occur because:

   HWTSTAMP_FILTER_NONE != HWTSTAMP_FILTER_PTP_V2_L2_EVENT is true

I came across this by chance because this patch is currently
the most recent patch in net-next that touches C code. And I was
exercising Claude Code with https://github.com/masoncl/review-prompts
It reported the above and after significantly
more thinking I've come to agree with it.

But it is Friday evening, so YMMV.

For reference, I've provided the text generated by Claude Code at the end of
this email.

...

> @@ -2446,15 +2437,13 @@ static int ravb_hwtstamp_set(struct net_device *ndev,
>  			     struct netlink_ext_ack *extack)
>  {
>  	struct ravb_private *priv = netdev_priv(ndev);
> -	u32 tstamp_rx_ctrl = RAVB_RXTSTAMP_ENABLED;
> -	u32 tstamp_tx_ctrl;
> +	enum hwtstamp_rx_filters tstamp_rx_ctrl;
> +	enum hwtstamp_tx_types tstamp_tx_ctrl;
>  
>  	switch (config->tx_type) {
>  	case HWTSTAMP_TX_OFF:
> -		tstamp_tx_ctrl = 0;
> -		break;
>  	case HWTSTAMP_TX_ON:
> -		tstamp_tx_ctrl = RAVB_TXTSTAMP_ENABLED;
> +		tstamp_tx_ctrl = config->tx_type;
>  		break;
>  	default:
>  		return -ERANGE;
> @@ -2462,14 +2451,12 @@ static int ravb_hwtstamp_set(struct net_device *ndev,
>  
>  	switch (config->rx_filter) {
>  	case HWTSTAMP_FILTER_NONE:
> -		tstamp_rx_ctrl = 0;
> -		break;
>  	case HWTSTAMP_FILTER_PTP_V2_L2_EVENT:
> -		tstamp_rx_ctrl |= RAVB_RXTSTAMP_TYPE_V2_L2_EVENT;
> +		tstamp_rx_ctrl = config->rx_filter;
>  		break;
>  	default:
>  		config->rx_filter = HWTSTAMP_FILTER_ALL;
> -		tstamp_rx_ctrl |= RAVB_RXTSTAMP_TYPE_ALL;
> +		tstamp_rx_ctrl = HWTSTAMP_FILTER_ALL;
>  	}
>  
>  	priv->tstamp_tx_ctrl = tstamp_tx_ctrl;
> -- 
> 2.51.1
> 
> 

Text generated by Claude Code:

Is this logic translation correct? Looking at the old bit-field
operations and new enum comparisons, the behavior seems to change in
two cases:

Old behavior (from ravb_hwtstamp_set):
  - FILTER_NONE stored as 0
  - FILTER_PTP_V2_L2_EVENT stored as 0x12 (ENABLED | TYPE_V2_L2)
  - FILTER_ALL stored as 0x16 (ENABLED | TYPE_ALL)

Old ravb_rx_rcar_hwstamp for RAVB_NC queue:
  get_ts = (0x12 & 0x06) & 0x02 = 0x02 & 0x02 = 0x02 (timestamp)
  get_ts = (0x16 & 0x06) & 0x02 = 0x06 & 0x02 = 0x02 (timestamp)

So the old code timestamps RAVB_NC queue packets for both
FILTER_PTP_V2_L2_EVENT and FILTER_ALL.

New ravb_rx_rcar_hwstamp for RAVB_NC queue with FILTER_ALL:
  get_ts = (HWTSTAMP_FILTER_ALL == HWTSTAMP_FILTER_PTP_V2_L2_EVENT)
  get_ts = (1 == 9) = false (no timestamp)

Similarly for non-RAVB_NC queue, old behavior with FILTER_NONE:
  get_ts = (0 & 0x06) & ~0x02 = 0 & ~0x02 = 0 (no timestamp)

New behavior for non-RAVB_NC queue with FILTER_NONE:
  get_ts = (HWTSTAMP_FILTER_NONE != HWTSTAMP_FILTER_PTP_V2_L2_EVENT)
  get_ts = (0 != 9) = true (timestamp)

Can the refactoring introduce these two behavior changes?

1. RAVB_NC queue with FILTER_ALL: old code timestamps, new code doesn't
2. Non-RAVB_NC queue with FILTER_NONE: old code doesn't timestamp, new
   code does

