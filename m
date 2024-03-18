Return-Path: <linux-renesas-soc+bounces-3873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEBC87F36D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 23:55:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D9D41F21AF3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 22:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAD75A799;
	Mon, 18 Mar 2024 22:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AQcKNYrr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BC35A793;
	Mon, 18 Mar 2024 22:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710802553; cv=none; b=bh+9/RWlVQfWBY5blJrcuk1IA9aCY5V4hFwtbUBcEq0sh8VXbijPE1utKnhQsyaOfascCo3XkEseHgLfkCVREbgg3vX+4Yo6L44UtvR0L8cDc0bufzH5ghCoAYpFATZPiVPlWSXDuyXM6Wk1D+RnnZFcpYbd7Z/1JT1R6ck6xps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710802553; c=relaxed/simple;
	bh=ZVTEV1vkjnpvlfzTQcGQhAiQTf4XNZ0lYDHUMFrP8V4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o4hHtKc07J62Ec8SxZyY7V6GpCJ9FgNk84xyQrV7oswHVb2lCVZP3u3OvNfjo8uSZpSBYMiHNlzW7OVJXFlFL4nCzGzPhnCkVSpEOwq/DcskuY6DOAbevnq3vO03oKpV8dt2zKN9BW/VSMalUFCUUzNNHR/ebkCTs2ag7/FCUtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AQcKNYrr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE39555;
	Mon, 18 Mar 2024 23:55:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710802523;
	bh=ZVTEV1vkjnpvlfzTQcGQhAiQTf4XNZ0lYDHUMFrP8V4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQcKNYrrh51Wz8Fo6gYcko3U21hgw7irtvgBRgDKD46Z0vr8dQ/jjJxSf5RQJ+Ol9
	 JjVkF7qzBQFN4YoXPasMg4ZxqQ5qe+STtfYyUY87KEnVvpmZCA5w4Rhy2282GjOpoG
	 xb6Gw/elx24SpeDA5nnGUobfJNdL/h7SqJWx2jtM=
Date: Tue, 19 Mar 2024 00:55:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: Add clk_poll_disable_unprepare()
Message-ID: <20240318225546.GS13682@pendragon.ideasonboard.com>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
 <20240318110842.41956-3-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318110842.41956-3-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Mon, Mar 18, 2024 at 11:08:41AM +0000, Biju Das wrote:
> The clk_disable_unprepare() doesn't guarantee that a clock is gated after
> the execution as it is driver dependent. The Renesas and most of the other
> platforms don't wait until clock is stopped because of performance reason.

Is that really the case for most platforms ? I've never seen that being
an issue in practice.

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

A WARN() is fairly bad, given how easy it could be to this this
condition. To make it safe in the genral case for drivers to use this
API, we may need a way to acquire a clock exclusively, which would
complexify the API quite a bit.

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

What happens in the clk_disable_unprepare() case, if the clk_unprepare()
function is called on a clock that hasn't been synchronously disabled ?
This is ill-defined, a clock provider driver that implements .disable()
asynchronously would see its .unprepare() operation called with
different clock states. That behaviour is error-prone, especially given
that it could be difficult to test clock provider drivers to ensure that
handle both cases correctly.

One option could be to turn the .unprepare() operation into a
synchronization point, requiring drivers that implement .disable()
asynchronously to implement synchronization in .unprepare(). That way
you wouldn't need a new API function for clock consumers. The downside
is that consumers that call clk_disable_unprepare() will never benefit
from the .disable() operation being asynchronous, which may defeat the
whole point of this exercise.

I'm starting to wonder if the simplest option in your case wouldn't be
to make your clock provider synchronous for the vclk...

> +
> +	return ret;
> +}
> +
>  static inline int __must_check
>  clk_bulk_prepare_enable(int num_clks, const struct clk_bulk_data *clks)
>  {

-- 
Regards,

Laurent Pinchart

