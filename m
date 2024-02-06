Return-Path: <linux-renesas-soc+bounces-2408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4319984C042
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 23:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 845CDB250A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Feb 2024 22:59:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26D031C2A6;
	Tue,  6 Feb 2024 22:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="J2YNXgB8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2BA1C2B3;
	Tue,  6 Feb 2024 22:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707260333; cv=none; b=rbIEkiRSYybvp4fHkKc+K1Fu06S7L/176dUzIiM+aTXfyGPxXOtynM2ELLFI+QVvG+is70pUSt9jMiCdii2dGKuP+JdXjxClYTMaum9Pi+LZ1uJ/Ni2ipskk4ppGULIF+6rriwUbWH13jmtWnsKRef4CJjoZkb2oTEFq0IJmxL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707260333; c=relaxed/simple;
	bh=T/vXfYRll4Ksyx7SXhuvZXrGTu5XPic5PtVaxrU5/L8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bx7kVylKGDBMieHh7JXCAW+f/KS4+ekWIAXqJY+QlM5GUT/y+wcf+VUKYL+SoH5Mq0ld55wjBhEAiwhNfH/YnXUt6LohwSNCoCGEW8lc440cGbiAQ5Z0WZtTFuZUOQzI+txZCBOiGI1t03icSw2m825arq1XtZAR0Nafstmv7Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=J2YNXgB8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7589B14F6;
	Tue,  6 Feb 2024 23:57:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707260245;
	bh=T/vXfYRll4Ksyx7SXhuvZXrGTu5XPic5PtVaxrU5/L8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2YNXgB8KHoXI3eurJvgGLzENamaYif5ZvPXqI/y3UoFnXLBgyWt7uEs2RUyOg7Kx
	 nrS9BJ+eoelrC8IQ1W1nVpaeMe7O5Gk5Q4Ktu8FnVxTYly5sPeDHb9BqlCJI+hplCZ
	 iB73+B9NhKunJjNVLc3wsoBqeglO0jX0OA6YoYSM=
Date: Wed, 7 Feb 2024 00:58:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] clk: Add clk_disable_unprepare_sync()
Message-ID: <20240206225850.GA23702@pendragon.ideasonboard.com>
References: <20240131160947.96171-1-biju.das.jz@bp.renesas.com>
 <20240131160947.96171-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240131160947.96171-2-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Wed, Jan 31, 2024 at 04:09:45PM +0000, Biju Das wrote:
> Currently clk_disable() is not synchronous. Consumers just
> gate the clock, but it doesn't check actually the clock is
> gated. Introduce clk_disable_unprepare_sync() to synchronize
> the clock gate operation.

I think this needs to be designed a bit more.

First of all, you state that clk_disable() is not synchronous, but
that's not documented anywhere. This should be addressed as a first
patch, with clarifications to the documentation of the clock API
functions (clk_disable(), clk_unprepare() and clk_disable_unprepare())
and the corresponding clock provider operations (clk_ops). You should
also explain in that patch why that's the desired behaviour, compared to
making those operations synchronous.

Then, instead of adding a new synchronous clock disable operation, I
wonder if it wouldn't be better to add a public function that
synchronizes a previous disable call by using the exising
infrastructure, and in particular the .is_enabled() operation. This
would provide the feature you're looking for without needing to modify
all clock provider drivers.

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/clk/clk.c            | 36 +++++++++++++++++++++++++++---------
>  include/linux/clk-provider.h |  4 ++++
>  include/linux/clk.h          | 25 +++++++++++++++++++++++++
>  3 files changed, 56 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 2253c154a824..958d6677b3a6 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1080,7 +1080,7 @@ int clk_prepare(struct clk *clk)
>  }
>  EXPORT_SYMBOL_GPL(clk_prepare);
>  
> -static void clk_core_disable(struct clk_core *core)
> +static void clk_core_disable(struct clk_core *core, bool sync)
>  {
>  	lockdep_assert_held(&enable_lock);
>  
> @@ -1102,17 +1102,20 @@ static void clk_core_disable(struct clk_core *core)
>  	if (core->ops->disable)
>  		core->ops->disable(core->hw);
>  
> +	if (sync && core->ops->disable_sync)
> +		core->ops->disable_sync(core->hw);
> +
>  	trace_clk_disable_complete(core);
>  
> -	clk_core_disable(core->parent);
> +	clk_core_disable(core->parent, false);
>  }
>  
> -static void clk_core_disable_lock(struct clk_core *core)
> +static void clk_core_disable_lock(struct clk_core *core, bool sync)
>  {
>  	unsigned long flags;
>  
>  	flags = clk_enable_lock();
> -	clk_core_disable(core);
> +	clk_core_disable(core, sync);
>  	clk_enable_unlock(flags);
>  }
>  
> @@ -1133,10 +1136,25 @@ void clk_disable(struct clk *clk)
>  	if (IS_ERR_OR_NULL(clk))
>  		return;
>  
> -	clk_core_disable_lock(clk->core);
> +	clk_core_disable_lock(clk->core, false);
>  }
>  EXPORT_SYMBOL_GPL(clk_disable);
>  
> +/**
> + * clk_disable_sync - gate a clock synchronously
> + * @clk: the clk being gated
> + *
> + * It is similar to clk_disable, but guarantees that clk is gated synchronously.
> + */
> +void clk_disable_sync(struct clk *clk)
> +{
> +	if (IS_ERR_OR_NULL(clk))
> +		return;
> +
> +	clk_core_disable_lock(clk->core, true);
> +}
> +EXPORT_SYMBOL_GPL(clk_disable_sync);
> +
>  static int clk_core_enable(struct clk_core *core)
>  {
>  	int ret = 0;
> @@ -1164,7 +1182,7 @@ static int clk_core_enable(struct clk_core *core)
>  		trace_clk_enable_complete(core);
>  
>  		if (ret) {
> -			clk_core_disable(core->parent);
> +			clk_core_disable(core->parent, false);
>  			return ret;
>  		}
>  	}
> @@ -1340,7 +1358,7 @@ static int clk_core_prepare_enable(struct clk_core *core)
>  
>  static void clk_core_disable_unprepare(struct clk_core *core)
>  {
> -	clk_core_disable_lock(core);
> +	clk_core_disable_lock(core, false);
>  	clk_core_unprepare_lock(core);
>  }
>  
> @@ -2058,7 +2076,7 @@ static void __clk_set_parent_after(struct clk_core *core,
>  	 * for preventing a race with clk_enable().
>  	 */
>  	if (core->prepare_count) {
> -		clk_core_disable_lock(core);
> +		clk_core_disable_lock(core, false);
>  		clk_core_disable_unprepare(old_parent);
>  	}
>  
> @@ -2352,7 +2370,7 @@ static void clk_change_rate(struct clk_core *core)
>  	core->rate = clk_recalc(core, best_parent_rate);
>  
>  	if (core->flags & CLK_SET_RATE_UNGATE) {
> -		clk_core_disable_lock(core);
> +		clk_core_disable_lock(core, false);
>  		clk_core_unprepare(core);
>  	}
>  
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 1293c38ddb7f..604cc9338465 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -115,6 +115,9 @@ struct clk_duty {
>   * @disable:	Disable the clock atomically. Called with enable_lock held.
>   *		This function must not sleep.
>   *
> + * @disable_sync: Disable and sync the clockatomically. Called with enable_lock
> + *		held.This function must not sleep.
> + *
>   * @is_enabled:	Queries the hardware to determine if the clock is enabled.
>   *		This function must not sleep. Optional, if this op is not
>   *		set then the enable count will be used.
> @@ -238,6 +241,7 @@ struct clk_ops {
>  	void		(*unprepare_unused)(struct clk_hw *hw);
>  	int		(*enable)(struct clk_hw *hw);
>  	void		(*disable)(struct clk_hw *hw);
> +	void		(*disable_sync)(struct clk_hw *hw);
>  	int		(*is_enabled)(struct clk_hw *hw);
>  	void		(*disable_unused)(struct clk_hw *hw);
>  	int		(*save_context)(struct clk_hw *hw);
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 06f1b292f8a0..f472756310c7 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -664,6 +664,23 @@ int __must_check clk_bulk_enable(int num_clks,
>   */
>  void clk_disable(struct clk *clk);
>  
> +/**
> + * clk_disable_sync - inform the system when the clock source is no longer
> + *		      required.
> + * @clk: clock source
> + *
> + * Inform the system that a clock source is no longer required by
> + * a driver and is in shut down.
> + *
> + * May be called from atomic contexts.
> + *
> + * Implementation detail: if the clock source is shared between
> + * multiple drivers, clk_enable() calls must be balanced by the
> + * same number of clk_disable_sync() calls for the clock source to be
> + * disabled.
> + */
> +void clk_disable_sync(struct clk *clk);
> +
>  /**
>   * clk_bulk_disable - inform the system when the set of clks is no
>   *		      longer required.
> @@ -995,6 +1012,8 @@ static inline int __must_check clk_bulk_enable(int num_clks,
>  
>  static inline void clk_disable(struct clk *clk) {}
>  
> +static inline void clk_disable_sync(struct clk *clk) {}
> +
>  
>  static inline void clk_bulk_disable(int num_clks,
>  				    const struct clk_bulk_data *clks) {}
> @@ -1086,6 +1105,12 @@ static inline void clk_disable_unprepare(struct clk *clk)
>  	clk_unprepare(clk);
>  }
>  
> +static inline void clk_disable_unprepare_sync(struct clk *clk)
> +{
> +	clk_disable_sync(clk);
> +	clk_unprepare(clk);
> +}
> +
>  static inline int __must_check
>  clk_bulk_prepare_enable(int num_clks, const struct clk_bulk_data *clks)
>  {

-- 
Regards,

Laurent Pinchart

