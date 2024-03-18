Return-Path: <linux-renesas-soc+bounces-3872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1148787F32C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 23:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41DAD1C21507
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 22:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1925A0FB;
	Mon, 18 Mar 2024 22:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZAzSfiGC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD8E5A4C9;
	Mon, 18 Mar 2024 22:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710801535; cv=none; b=W9KVrL4r8CHnDr+hF2v8I45cunYiIFovBph/N/8Sgcl/J3s4dojVZv5e1gsGBWxH4NpP/gpfkSbfyq6tmkiWofVZaZnKzsyku07RyyNO0mJWOt1OyGHp64ysnun5h9eYgFa71BcnY04bKgBuWX4YKtUjln0c99dLEloqsa36E1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710801535; c=relaxed/simple;
	bh=iYYl/X3S1ud9BieZJR2iMwdKlvZTFaDy1KeuQBPhaNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3d4Z5n6vywmgz9X8L9HiuKAE4c3jDCEdKWKmVmJe8M3iRTxDJtpSKUTp+yELyKZKYrhVMFTia8q4Md9cEM/dLpLCKKC1LbCcXE9kGSHvzVw2OZsYdlF5SK+WytI4N7VCZ5gg1nzxK1o8ZYpN9xcZYV73zE5R3O5TQ5tgj2IQmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZAzSfiGC; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CF31A55;
	Mon, 18 Mar 2024 23:38:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710801505;
	bh=iYYl/X3S1ud9BieZJR2iMwdKlvZTFaDy1KeuQBPhaNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZAzSfiGCXXLENOsOXx2jcPJKN53TMzDp5fFMWfC6TYbIJMSWocR3tPRQZdYxyykGZ
	 LzNSQdmdTsCktkYeg/yqM3OTD1mQ8i1HuebWUEvm3Lua4Cyj8hEiBDJzL0lXLgPHAV
	 K3XOtquoBPf4HVkxNVc3vgDiLO3awS+coEBb3mp4=
Date: Tue, 19 Mar 2024 00:38:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: Update API documentation related to clock
 disable
Message-ID: <20240318223848.GR13682@pendragon.ideasonboard.com>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
 <20240318110842.41956-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240318110842.41956-2-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Mon, Mar 18, 2024 at 11:08:40AM +0000, Biju Das wrote:
> 
> The API's related to clk disable operation does not explicitly
> states the synchoronous or asynchrous behaviour as it is driver

s/synchoronous/synchronous/

> dependent. So make this part clear in API documentation.

You need to explain the rationale here, why asynchronous behaviour is
preferred.

> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v2->v3:
>  * No change.
> v2:
>  * New patch.
> ---
>  drivers/clk/clk.c            | 3 ++-
>  include/linux/clk-provider.h | 3 ++-
>  include/linux/clk.h          | 3 ++-
>  3 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 25371c91a58f..f5fa91a339d7 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1010,7 +1010,8 @@ static void clk_core_unprepare_lock(struct clk_core *core)
>   * if the operation may sleep.  One example is a clk which is accessed over
>   * I2c.  In the complex case a clk gate operation may require a fast and a slow
>   * part.  It is this reason that clk_unprepare and clk_disable are not mutually
> - * exclusive.  In fact clk_disable must be called before clk_unprepare.
> + * exclusive.  In fact clk_disable must be called before clk_unprepare.  The
> + * synchronous or asynchronous clock gating operation is driver dependent.

If synchronous operation is not guaranteed, then it's asynchonous.
Asynchronous doesn't mean slow, even an asynchronous provider can
complete the disable operation before the function returns to the
caller. All it means is that there's no guarantee of synchronous
operation. I would document it as such:

 * This function is asynchronous, if may return before the clock provider 
 * completes the unprepare operation.

However, below you're addressing the disable operation. Did you mean to
patch the documentation for clk_prepare() instead ? Making
clk_unprepare() asynchronous seems a bit weird, given that the function
may sleep and is expected to take more time.

>   */
>  void clk_unprepare(struct clk *clk)
>  {
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 4a537260f655..5b493024e1ec 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -113,7 +113,8 @@ struct clk_duty {
>   *		sleep.
>   *
>   * @disable:	Disable the clock atomically. Called with enable_lock held.
> - *		This function must not sleep.
> + *		This function must not sleep. The synchronous or asynchronous
> + *		disabling of the clock is driver dependent.

As this is the documentation that targets clock providers, I would
expand it and explain why a provider may want to make the disable
operation not synchronous.

>   *
>   * @is_enabled:	Queries the hardware to determine if the clock is enabled.
>   *		This function must not sleep. Optional, if this op is not

.is_enabled() should become mandatory if .disable() is not synchronous.
The relationship between the two operations should be better explained.

> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index 00623f4de5e1..84b02518791f 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -681,7 +681,8 @@ int __must_check clk_bulk_enable(int num_clks,
>   * @clk: clock source
>   *
>   * Inform the system that a clock source is no longer required by
> - * a driver and may be shut down.
> + * a driver and may be shut down. It is not guaranteed to ever actually
> + * be stopped, that will be driver dependent.

This is the documentation of clk_bulk_disable(), you should address
clk_disable() too. I've just noticed that both functions are documented
in two places, in include/linux/clk.h, and in drivers/clk/. I wonder why
that is. It sounds like it should be fixed, or you'll have to patch both
documentation blocks.

There's another issue that I'll raise in the review of 2/3.

>   *
>   * May be called from atomic contexts.
>   *

-- 
Regards,

Laurent Pinchart

