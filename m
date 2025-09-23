Return-Path: <linux-renesas-soc+bounces-22210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70823B95BBE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 13:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC0BD3AE172
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 11:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A208132143A;
	Tue, 23 Sep 2025 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ls92GY7H"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC91B285058
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758628231; cv=none; b=qfXmNMXapmKbknZ60fXhuJDQTJe/2jrdqoS5Zk0qT3QoFrZR7xahecKdMy2Sz6/EjHQK9ULtqahZ4FnlVJses7KwuZTbhJnF00j+2CJhvU39Otz0ArDuXrg4asN7riIwVSjBwv8xGDAJdtm0YaimSWY9a3xXm2IMfqCt/E2UaUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758628231; c=relaxed/simple;
	bh=UB3TN90rActZ9Wj06hzs7IkzVP75N6SiQc2gYIYHz+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCgAHMNgdhv0DTpQZePVX9P5k+sIriwG77YBCcwuqe5Yg11Sidjv0iJSzW5MlfQ3+ukcrD/l1HJ5obsg7A1I+VmuxyPnJXif+KK6TlcMYbluVCvD58Qcp/COaTFmt4MXdoeGIrrHYXlBSzfmcZ4cP7bSX3cj6uUOsjBmoWWAS3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ls92GY7H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 375B9346;
	Tue, 23 Sep 2025 13:49:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758628143;
	bh=UB3TN90rActZ9Wj06hzs7IkzVP75N6SiQc2gYIYHz+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ls92GY7HR+xgcakY0ytSKRr5XLvcF+vHAdUqO6Syu0V0IuRszVEzuoXT6RbqswbAD
	 N1O4tA0XhZUgv8VnWCITv4lw+XD7trqIXU1JhaIj6nQJsWM8hETpjSdLi0ebq6NpHw
	 We1Kr1T3N6ttX9SHUwXnG3GReBxpo2qGT67/QSzg=
Date: Tue, 23 Sep 2025 14:49:54 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/9] drm/rcar-du: dsi: Clean up VCLKSET register macros
Message-ID: <20250923114954.GE20765@pendragon.ideasonboard.com>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-4-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250922185740.153759-4-marek.vasut+renesas@mailbox.org>

Hi Marek,

Thank you for the patch.

On Mon, Sep 22, 2025 at 08:54:59PM +0200, Marek Vasut wrote:
> Introduce VCLKSET_BPP_MASK macro and use FIELD_PREP() to generate
> appropriate bitfield from mask and value without bitshift. Remove
> VCLKSET_COLOR_RGB which is never used, replace it with code comment.
> 
> Do not convert bits and bitfields to BIT() and GENMASK() yet, to be
> consisten with the current style. Conversion to BIT() and GENMASK()
> macros is done at the very end of this series in the last two patches.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: David Airlie <airlied@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> NOTE: No functional change expected, this is a preparatory patch which
> partly removes macros which evaluate to zeroes from rcar_mipi_dsi_regs.h .
> The other patches in this series proceed with that job, piece by piece,
> to make it all reviewable.
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c      |  9 +++++----
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 12 ++++++------
>  2 files changed, 11 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index a550bda6debbe..2374cbe3768f2 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -621,18 +621,19 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
>  	vclkset = VCLKSET_CKEN;
>  	rcar_mipi_dsi_write(dsi, VCLKSET, vclkset);
>  
> +	/* Output is always RGB, never YCbCr */
>  	if (dsi_format == 24)
> -		vclkset |= VCLKSET_BPP_24;
> +		vclkset |= FIELD_PREP(VCLKSET_BPP_MASK, VCLKSET_BPP_24);
>  	else if (dsi_format == 18)
> -		vclkset |= VCLKSET_BPP_18;
> +		vclkset |= FIELD_PREP(VCLKSET_BPP_MASK, VCLKSET_BPP_18);
>  	else if (dsi_format == 16)
> -		vclkset |= VCLKSET_BPP_16;
> +		vclkset |= FIELD_PREP(VCLKSET_BPP_MASK, VCLKSET_BPP_16);

I personally find this less readable.

>  	else {
>  		dev_warn(dsi->dev, "unsupported format");
>  		return -EINVAL;
>  	}
>  
> -	vclkset |= VCLKSET_COLOR_RGB | VCLKSET_LANE(dsi->lanes - 1);
> +	vclkset |= VCLKSET_LANE(dsi->lanes - 1);
>  
>  	switch (dsi->info->model) {
>  	case RCAR_DSI_V3U:
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index dd871e17dcf53..c2cb06ef144ed 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -245,14 +245,14 @@
>  
>  #define VCLKSET				0x100c
>  #define VCLKSET_CKEN			(1 << 16)
> -#define VCLKSET_COLOR_RGB		(0 << 8)
> -#define VCLKSET_COLOR_YCC		(1 << 8)
> +#define VCLKSET_COLOR_YCC		(1 << 8) /* 0:RGB 1:YCbCr */

This I like.

>  #define VCLKSET_DIV_V3U(x)		(((x) & 0x3) << 4)
>  #define VCLKSET_DIV_V4H(x)		(((x) & 0x7) << 4)
> -#define VCLKSET_BPP_16			(0 << 2)
> -#define VCLKSET_BPP_18			(1 << 2)
> -#define VCLKSET_BPP_18L			(2 << 2)
> -#define VCLKSET_BPP_24			(3 << 2)
> +#define VCLKSET_BPP_MASK		(3 << 2)
> +#define VCLKSET_BPP_16			0
> +#define VCLKSET_BPP_18			1
> +#define VCLKSET_BPP_18L			2
> +#define VCLKSET_BPP_24			3

If you'd rather get rid of the shifts, why not

#define VCLKSET_BPP_16			FIELD_PREP(VCLKSET_BPP_MASK, 0)
#define VCLKSET_BPP_18			FIELD_PREP(VCLKSET_BPP_MASK, 1)
#define VCLKSET_BPP_18L			FIELD_PREP(VCLKSET_BPP_MASK, 2)
#define VCLKSET_BPP_24			FIELD_PREP(VCLKSET_BPP_MASK, 3)

without touching the users ? Personally I'd keep the shifts though.

>  #define VCLKSET_LANE(x)			(((x) & 0x3) << 0)
>  
>  #define VCLKEN				0x1010

-- 
Regards,

Laurent Pinchart

