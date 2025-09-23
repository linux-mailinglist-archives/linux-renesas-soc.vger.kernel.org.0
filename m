Return-Path: <linux-renesas-soc+bounces-22209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E108B95B70
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 13:43:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91BD148153A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Sep 2025 11:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF13212D7C;
	Tue, 23 Sep 2025 11:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JjmaYgdX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1024A30FC1B
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Sep 2025 11:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758627781; cv=none; b=CyXFOHCdG9gH5Y7v0PnQX/phJvdtmDch+/z6DHmzbgQRTkxihKQMFdKtjhFTWtjesxDSiHfK6g/aA2uENdwZ/3T2LZiruLKPCNUSR4fLciy913vKSlfEMGVs08BRRUwxBVdj/7AUrd2lrSqb4sFBwNHfC7+auTtzcZnJhwY7tho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758627781; c=relaxed/simple;
	bh=BpasjcinCUHFVs/jfGSSE0n2jOYnjKJyIbfqHN9HB1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ABWwl2+5SgwkyvsvYTHAHAzmbIOvCGsiQ8Scyym7QVC64IdyKAlRlbKN5CFZAQVCHmiI16KnFsoMjqt+OTVM2U5Esqu1lvnDttQWyoftpuLClvteDhGOsUTFCvg3OZN9EcyIXUGAYeqocUUfP/ZNAE8ncft7Kf/AZU45kvSUlro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JjmaYgdX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 29C3B379;
	Tue, 23 Sep 2025 13:41:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758627694;
	bh=BpasjcinCUHFVs/jfGSSE0n2jOYnjKJyIbfqHN9HB1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JjmaYgdXLRFMIoKaT2SpoBDTOIjs0FRuqxdrFhrQTbHuQg/hz0MyFkq/ONcRHrHX7
	 ApYhN/b8uzYm1ntnke4gMCVbdGWTqQ0D/o+zGhCfVUXmWxeYrIsFxHRH3uXWIWLWvB
	 bL/G6yI3D8mv6RN9plTFz6YWEa39vDAXcwOBPhTw=
Date: Tue, 23 Sep 2025 14:42:25 +0300
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
Subject: Re: [PATCH 1/9] drm/rcar-du: dsi: Fix missing parameter in
 RXSETR_...EN macros
Message-ID: <20250923114225.GD20765@pendragon.ideasonboard.com>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-2-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250922185740.153759-2-marek.vasut+renesas@mailbox.org>

On Mon, Sep 22, 2025 at 08:54:57PM +0200, Marek Vasut wrote:
> The RXSETR_CRCEN(n) and RXSETR_ECCEN(n) macros both take parameter (n),
> add the missing macro parameter. Neither of those macros is used by the
> driver, so for now the bug is harmless.
> 
> Fixes: 685e8dae19df ("drm/rcar-du: dsi: Implement DSI command support")
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index 76521276e2af8..dd871e17dcf53 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -50,8 +50,8 @@
>  #define TXCMPPD3R			0x16c
>  
>  #define RXSETR				0x200
> -#define RXSETR_CRCEN			(((n) & 0xf) << 24)
> -#define RXSETR_ECCEN			(((n) & 0xf) << 16)
> +#define RXSETR_CRCEN(n)			(((n) & 0xf) << 24)
> +#define RXSETR_ECCEN(n)			(((n) & 0xf) << 16)
>  #define RXPSETR				0x210
>  #define RXPSETR_LPPDACC			(1 << 0)
>  #define RXPSR				0x220

-- 
Regards,

Laurent Pinchart

