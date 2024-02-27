Return-Path: <linux-renesas-soc+bounces-3250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 548A6868C5C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 10:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D59F81F27F10
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Feb 2024 09:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A686136677;
	Tue, 27 Feb 2024 09:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S9pdjQPp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C32135A75;
	Tue, 27 Feb 2024 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709026570; cv=none; b=VW0HqdBOSmqFDJQGvqgIfpDf6yOpXcq5d6BLjDgMkr87imtzZY5WAStNc1sXGEvRbbGum3AlfpH7qA9wpcJg1oPG5rwq9pn5RnPXjhiIVpk1xLhqmTgCwwPB6qXUI0qKuWi0FM+UjF5dbKk5JeY8ukMxLJQulj5M6N+Okio9EOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709026570; c=relaxed/simple;
	bh=MhYVNg3tJ0IQHv/hOZ7VtURMqMSSJ5mJG7kxElOUwa8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CX5QNsq8yoSt/WEWi5/Z65GCbtsqQZ4vTpRrc3Im+XtYy3JQBFDKbqZQs/n4g74Mx8DOgz3l9rKTsBl+EMdwrlliNn/F1CpeEhRLNrK971tXJo23S4E/YGW+mGRviojmwrxNl5sYk0FpPI/eai4Hrs9ZgG9uM94abMCdoLTy/bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S9pdjQPp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709026568; x=1740562568;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=MhYVNg3tJ0IQHv/hOZ7VtURMqMSSJ5mJG7kxElOUwa8=;
  b=S9pdjQPpTs+nwjHs5CRlHVjxotHEx4yXhNU2Eo/DN47R0V9R0xQ3uKJa
   zBT3NhP+p8Gh9x20nDhnG5Il0Rfy4ucwlzkGDb3+rJ6vtZ6xa4GUyrkzh
   pNEfGhONhgVGUexjUoWOTmdmqnZgwL9zYb3v6mTtUsUAiAoscWnSUX9Po
   6DBpWd6xu2LtqySu5Gd6/ANmxxm1YeaIUhdqPOJc2TSqacma3e/Fv2vW2
   9OYe1GnMBlHoXf9Vm64CK2zEzZDsPbJ/KFY1AqGKhLVMVO5kB4uTK8r9u
   oX5KinQMzWRCrBkTnV1e3QOtd4Fu6kiUdNyl89ON2En3THs240043iJpv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="6306964"
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="6306964"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 01:36:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,187,1705392000"; 
   d="scan'208";a="7327747"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2024 01:36:05 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7E3D411F855;
	Tue, 27 Feb 2024 11:36:01 +0200 (EET)
Date: Tue, 27 Feb 2024 09:36:01 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: Add clk_poll_disable_unprepare()
Message-ID: <Zd2tAYNfhd6itOQr@kekkonen.localdomain>
References: <20240220104336.260194-1-biju.das.jz@bp.renesas.com>
 <20240220104336.260194-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240220104336.260194-3-biju.das.jz@bp.renesas.com>

Hi Biju,

Thanks for the patchset.

On Tue, Feb 20, 2024 at 10:43:35AM +0000, Biju Das wrote:
> The clk_disable_unprepare() doesn't guarantee that a clock is gated after
> the execution as it is driver dependent. The Renesas and most of the other
> platforms don't wait until clock is stopped because of performance reason.
> But these platforms wait while turning on the clock.
> 
> The normal case for shutting down the clock is unbind/close/suspend or
> error paths in the driver. Not waiting for the shutting down the clock
> will improve the suspend time.
> 
> But on RZ/G2L Camera Data Receiving Unit (CRU) IP, initially the vclk is
> on. Before enabling link reception, we need to wait for vclk to be off
> and after enabling reception, we need to turn the vlck on. Special cases
> like this requires a sync API for clock gating.
> 
> Add clk_poll_disable_unprepare() to poll the clock gate operation that
> guarantees gating of clk after the execution.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> RFC->v2:
>  * Renamed clk_disable_unprepare_sync()-->clk_poll_disable_unprepare()
>  * Redesigned to make use of __clk_is_enabled() to poll the clock gating.
> ---
>  drivers/clk/clk.c   | 23 +++++++++++++++++++++++
>  include/linux/clk.h | 46 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 9a09f51f4af1..0e66b7180388 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -13,6 +13,7 @@
>  #include <linux/mutex.h>
>  #include <linux/spinlock.h>
>  #include <linux/err.h>
> +#include <linux/iopoll.h>
>  #include <linux/list.h>
>  #include <linux/slab.h>
>  #include <linux/of.h>
> @@ -1138,6 +1139,28 @@ void clk_disable(struct clk *clk)
>  }
>  EXPORT_SYMBOL_GPL(clk_disable);
>  
> +/**
> + * clk_poll_disabled - poll for clock gating.
> + * @clk: the clk that is going to stop
> + * @sleep_us: Maximum time to sleep between reads in us (0
> + *            tight-loops).  Should be less than ~20ms since usleep_range
> + *            is used (see Documentation/timers/timers-howto.rst).
> + * @timeout_us: Timeout in us, 0 means never timeout
> + *
> + * It polls for a clk to be stopped.
> + */
> +int clk_poll_disabled(struct clk *clk, unsigned long sleep_us, u64 timeout_us)
> +{
> +	bool status;
> +
> +	if (IS_ERR_OR_NULL(clk))
> +		return 0;
> +
> +	return read_poll_timeout(__clk_is_enabled, status, !status, sleep_us,
> +				 timeout_us, false, clk);

This API is a bit problematic as anything else in the system could enable
or disable the clock while polling happens. I think you should add a
warning that this may only be used if the user is the sole user of the
clock in the system (which is of course hard to guarantee in a general
case) and has not increased the enable count (or has decremented it again
to zero).

I'd perhaps go as far as do WARN_ON(enable count non-zero) and return
an error code (-EBUSY).

> +}
> +EXPORT_SYMBOL_GPL(clk_poll_disabled);
> +
>  static int clk_core_enable(struct clk_core *core)
>  {
>  	int ret = 0;
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index e6acec5d8dbe..2d63a12214e5 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -665,6 +665,20 @@ int __must_check clk_bulk_enable(int num_clks,
>   */
>  void clk_disable(struct clk *clk);
>  
> +/**
> + * clk_poll_disabled - inform the system whether the clock source is stopped.
> + * @clk: clock source
> + * @sleep_us: Maximum time to sleep between reads in us (0
> + *            tight-loops).  Should be less than ~20ms since usleep_range
> + *            is used (see Documentation/timers/timers-howto.rst).
> + * @timeout_us: Timeout in us, 0 means never timeout
> + *
> + * Poll for clock gating and Inform the system about it's status.
> + *
> + * Context: May sleep.
> + */
> +int clk_poll_disabled(struct clk *clk, unsigned long sleep_us, u64 timeout_us);
> +
>  /**
>   * clk_bulk_disable - inform the system when the set of clks is no
>   *		      longer required.
> @@ -996,6 +1010,11 @@ static inline int __must_check clk_bulk_enable(int num_clks,
>  
>  static inline void clk_disable(struct clk *clk) {}
>  
> +static inline int clk_poll_disabled(struct clk *clk, unsigned long sleep_us,
> +				    u64 timeout_us)
> +{
> +	return 0;
> +}
>  
>  static inline void clk_bulk_disable(int num_clks,
>  				    const struct clk_bulk_data *clks) {}
> @@ -1087,6 +1106,33 @@ static inline void clk_disable_unprepare(struct clk *clk)
>  	clk_unprepare(clk);
>  }
>  
> +/**
> + * clk_poll_disable_unprepare - Poll clk_disable_unprepare
> + * @clk: clock source
> + * @sleep_us: Maximum time to sleep between reads in us (0
> + *            tight-loops).  Should be less than ~20ms since usleep_range
> + *            is used (see Documentation/timers/timers-howto.rst).
> + * @timeout_us: Timeout in us, 0 means never timeout
> + *
> + * Context: May sleep.
> + *
> + * This function polls until the clock has stopped.
> + *
> + * Returns success (0) or negative errno.
> + */
> +static inline int clk_poll_disable_unprepare(struct clk *clk,
> +					     unsigned long sleep_us,
> +					     u64 timeout_us)
> +{
> +	int ret;
> +
> +	clk_disable(clk);
> +	ret = clk_poll_disabled(clk, sleep_us, timeout_us);
> +	clk_unprepare(clk);

How about clocks that are generated by devices to which access always
sleeps, such as I²C devices? I presume they're actually stopped in
clk_unprepare() as clk_disable() may not sleep. They also can't implement
is_enabled as it cannot sleep either.

It seems to depend on the implementation on what they do. The runtime PM
function used is pm_runtime_put_sync(), so you may have a guarantee the
device is powered off but ONLY if it had no other users and had runtime PM
enabled.

So perhaps return an error if there's no is_enabled() callback?

> +
> +	return ret;
> +}
> +
>  static inline int __must_check
>  clk_bulk_prepare_enable(int num_clks, const struct clk_bulk_data *clks)
>  {

-- 
Regards,

Sakari Ailus

