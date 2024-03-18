Return-Path: <linux-renesas-soc+bounces-3871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F92F87EFBF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 19:29:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A8B61F23C72
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Mar 2024 18:29:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5020D55E4E;
	Mon, 18 Mar 2024 18:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LB/V+vgY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9698B56441;
	Mon, 18 Mar 2024 18:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710786568; cv=none; b=mzgpx9qpdNRoH7wxFoAj2d++hOjkEs8GCgtwVot/G0dVuKe+fegwOTM0Bk/qw3CGPVemcVUlwNO+icWl9Rndp+gX4n6uqeVd37wMAyRxtLrGhwMlBbkx4n0sr8HTfHhWEjqADHINHJOwFsvO4cgwHb2XZwjs+SMc7umQX0ew6Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710786568; c=relaxed/simple;
	bh=P+e6SpsByxEpokuJCe+zvhHJRfVQau4vs2koLG4ed38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crOC5dTnmvARzCh9xhpVgetihVHTbByPJxo811guvTUrSH9pzSq4KMYsbHyulEF+zU99NmEegqN44B55GRDcn4HpBj9IRW0ZOszIkftRiRBZ9h2jdY7+OAQ0aaPGTtQRj1kf9x6TN/2qVgFO+kYw4gBPfQgUbhgtI1CXaFltDmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LB/V+vgY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710786566; x=1742322566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P+e6SpsByxEpokuJCe+zvhHJRfVQau4vs2koLG4ed38=;
  b=LB/V+vgY1PdQf1YWMrvwL79bDBjLNDctMXt1v9YoYrBWV1kr1kRvYkp0
   CVHJ/x3e4GwVw+VsWnVoJpYDObhtNw1t5nSe3vWCqUXK59Rv2Whk2Dpzp
   wqpxknrG9lB1cN1FENlRNISrhwg2iPnjIr9PKcUM0HZxj2wHHV3lIg0V4
   A/x2dqGa/qUKTtYS5nKJgGRAg6LtxlBbmHDFkE8pGY3A7mihfCC7BuRDv
   1twidcFIF6KE4rnlK9Kz8xQMQKTBgMOxkfL+MfHU3R2JleeIZmADQ6Udv
   6tVttdj4F+cOq77CjVzPl74KzonTMGDI7c83eDvFbmxo9lTW5yPbZLfBA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16259994"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="16259994"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 11:29:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="13591343"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 11:29:23 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id BD9E711F984;
	Mon, 18 Mar 2024 20:29:20 +0200 (EET)
Date: Mon, 18 Mar 2024 18:29:20 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: Update API documentation related to clock
 disable
Message-ID: <ZfiIAMxR6QmFZmi1@kekkonen.localdomain>
References: <20240318110842.41956-1-biju.das.jz@bp.renesas.com>
 <20240318110842.41956-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318110842.41956-2-biju.das.jz@bp.renesas.com>

Hi Biju,

On Mon, Mar 18, 2024 at 11:08:40AM +0000, Biju Das wrote:
> 
> The API's related to clk disable operation does not explicitly
> states the synchoronous or asynchrous behaviour as it is driver
> dependent. So make this part clear in API documentation.
> 
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

s/driver\K/ and hardware/

Same in the first chunk actually.

>   *
>   * @is_enabled:	Queries the hardware to determine if the clock is enabled.
>   *		This function must not sleep. Optional, if this op is not
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

I'd rephrase this, taking other users into account:

	There's no guarantee that the clock stops within a particular time
	window or at all, depending on other users of the clock as well as
	the driver and hardware implementation.

>   *
>   * May be called from atomic contexts.
>   *

-- 
Kind regards,

Sakari Ailus

