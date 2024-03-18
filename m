Return-Path: <linux-renesas-soc+bounces-3870-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE687EFAF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 19:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E67551F237C9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 18:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C01555E63;
	Mon, 18 Mar 2024 18:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZciE3BQs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA9655E50;
	Mon, 18 Mar 2024 18:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710786242; cv=none; b=tZSIBHzGJnnf24F8MkI2wLLrdebaCIrUUUqceModpR++vKujyFvXp2nVl7FYPF/m/dPEDnKu/7rBk37abkD4xV7UASk/BRlM7ikPHFq++z5e8QoVajNSXeSlvTGqewx4ILoXSVWIC2hVDOBffVoDfttKYGRd527QyAql3BOUliw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710786242; c=relaxed/simple;
	bh=bFaqDJfam0yLdQ2VRl+F5RZZlNHRhr5sRHKj8J6dK+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H62vU5MTHe0pAQ6/4xXzrFniy+Vp/e+ZBEIQ2tA8MjRsz7K9vdkKLcY5agAhdt2YX+iwmFAWu2HkQzmCdU+yLJdygka283cwy4eKpZIZeQDtiMZZY9KPzLeqhIrx1D9tzBxVI8rAHpnD4Jlfov9/XdNewEGYY0il9U/kxLlHrMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZciE3BQs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710786241; x=1742322241;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bFaqDJfam0yLdQ2VRl+F5RZZlNHRhr5sRHKj8J6dK+A=;
  b=ZciE3BQsdQBD/7JYlKXBBRB5DSVB0Ie3m8e+QVS3t1Bwa0UcUpuVo8AQ
   pShkP7vzuCXIfaqsD95UxZQ9ZqgTr3Kj4NKTTWIX0AUKnB0dcgUiScC49
   izu5ugPBYCrpRJOibUhK5JKK/ka87ddeMnNEv6RKDq1NPShzQDv0D3ZwS
   t40E8kz4+TgSeV/Sxut1Z7ma68JJvT6dqdTlfDw3/tRE8uc7AGYDfXAS2
   q7J3MDQGOMGT8Ac9ci852STHU0F5tdWaOlWbxr5UrIwX0V4E5kDQmmMKg
   ngLULbg78DC8SZvgoxpLoPTpRUAYARkg3IVkU5ktopGplJH/RnuKksUOZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16766253"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="16766253"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 11:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="13448095"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 11:23:44 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id D8E7711F984;
	Mon, 18 Mar 2024 20:23:41 +0200 (EET)
Date: Mon, 18 Mar 2024 18:23:41 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: Add clk_poll_disable_unprepare()
Message-ID: <ZfiGrYcvoiM2Rdxv@kekkonen.localdomain>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
 <20240318110842.41956-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318110842.41956-3-biju.das.jz@bp.renesas.com>

Hi Biju,

Thanks for the update.

On Mon, Mar 18, 2024 at 11:08:41AM +0000, Biju Das wrote:
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
> v2->v3:
>  * Added WARN_ON(enable count non-zero) and return an error code (-EBUSY),
>    if the user is not the sole user of the clock and the enable count is
>    non-zero.
>  * Returned an error if there's no is_enabled() callback.
> RFC->v2:
>  * Renamed clk_disable_unprepare_sync()-->clk_poll_disable_unprepare()
>  * Redesigned to make use of __clk_is_enabled() to poll the clock gating.
> ---
>  drivers/clk/clk.c   | 29 ++++++++++++++++++++++++++++
>  include/linux/clk.h | 46 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 75 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index f5fa91a339d7..e10bb14c904d 100644
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
> @@ -1160,6 +1161,34 @@ void clk_disable(struct clk *clk)
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

We should have documentation either in the header or here, not both. I'd
drop this.

> +int clk_poll_disabled(struct clk *clk, unsigned long sleep_us, u64 timeout_us)
> +{
> +	bool status;
> +
> +	if (IS_ERR_OR_NULL(clk))
> +		return 0;
> +
> +	if (!clk->core->ops->is_enabled)
> +		return -EOPNOTSUPP;
> +
> +	if (WARN(__clk_get_enable_count(clk), "clk is in use\n"))
> +		return -EBUSY;
> +
> +	return read_poll_timeout(__clk_is_enabled, status, !status, sleep_us,
> +				 timeout_us, false, clk);
> +}
> +EXPORT_SYMBOL_GPL(clk_poll_disabled);
> +
>  static int clk_core_enable(struct clk_core *core)
>  {
>  	int ret = 0;
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 84b02518791f..7f714ecce0eb 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -693,6 +693,20 @@ int __must_check clk_bulk_enable(int num_clks,
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

How about, instead:

	Poll for clock gating and return when either there's a timeout or
	the clock has been gated.

	Returns: 0 if the clock is successfully gated, error otherwise.

Please run scripts/kerneldoc -Wall on this.

> + *
> + * Context: May sleep.
> + */
> +int clk_poll_disabled(struct clk *clk, unsigned long sleep_us, u64 timeout_us);
> +
>  /**
>   * clk_bulk_disable - inform the system when the set of clks is no
>   *		      longer required.
> @@ -1030,6 +1044,11 @@ static inline int __must_check clk_bulk_enable(int num_clks,
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
> @@ -1121,6 +1140,33 @@ static inline void clk_disable_unprepare(struct clk *clk)
>  	clk_unprepare(clk);
>  }
>  
> +/**
> + * clk_poll_disable_unprepare - Poll clk_disable_unprepare

How about calling this clk_disable_sync_unprepare?

I'm not sure if a special function is needed for something needed so rarely
as you can already call clk_poll_disabled(). Maybe others have an opinion
on this, too.

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
> +
> +	return ret;
> +}
> +
>  static inline int __must_check
>  clk_bulk_prepare_enable(int num_clks, const struct clk_bulk_data *clks)
>  {

-- 
Kind regards,

Sakari Ailus

