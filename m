Return-Path: <linux-renesas-soc+bounces-17376-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CAAAC0C2D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 15:03:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFB67500F08
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 13:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6090E1D618A;
	Thu, 22 May 2025 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="arBrS6+P"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828E528C000
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 13:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919006; cv=none; b=qODbv4hRyq64Lew8u3q9MW9dNECHmQYsLLjzon1PQtraPOEedJv8tA5I6PYPoR/cJCetlhZupjsNS7VegQHYEjwFVFHzCHuSBogBvuouLucjVnDsT/OR7yWAYjdz48TQvNNI4Y21q4N+0vDhsCftFRLB4vuiLM1njcMUgYI6O8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919006; c=relaxed/simple;
	bh=NNGbTXQJt+RwaWTGgv7wC/VuGBnEqC4JyVLF/i67fcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PkOm2ExbYolHoMjQKuzwB0nhWlNz5wId53rlCSdOrEePn3cZLTXOHMAXga80C/VncCEW4dD+uk8vkPmC+YsXv/wU3jnEA1m5vav0vBoHtLfVMLhOkyDzIP4wouRRrjmm6lgwD58Cfq9/y7HF7fb0dyueKmEfrpUIGYjTx0GAFjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=arBrS6+P; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D29048FA;
	Thu, 22 May 2025 15:02:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747918979;
	bh=NNGbTXQJt+RwaWTGgv7wC/VuGBnEqC4JyVLF/i67fcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=arBrS6+PYmBYR1OJ2ta+Ftl8mDQCA52AjAtJTw1EQjIC0XdahY0uCKoe+FBePksUO
	 bcjDsp/OmHxkJ3z1KMDObvqBXEaDJjV5tLAuYw8gqjY72uFm/R623j+YHrGzdcbqEg
	 2b4wzTD4I7plqIHMh0aVfg6Ze6e6B23PEVaeRzRw=
Date: Thu, 22 May 2025 15:03:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH RESEND] drm: renesas: rcar-du: use proper naming for R-Car
Message-ID: <20250522130315.GF2942@pendragon.ideasonboard.com>
References: <20250522103530.51972-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522103530.51972-2-wsa+renesas@sang-engineering.com>

Hi Wolfram,

Thank you for the patch.

On Thu, May 22, 2025 at 12:34:44PM +0200, Wolfram Sang wrote:
> Not RCAR, but R-Car.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
> index f9893d7d6dfc..e9e59c5e70d5 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.h
> @@ -16,7 +16,7 @@ struct rcar_du_format_info;
>  struct rcar_du_group;
>  
>  /*
> - * The RCAR DU has 8 hardware planes, shared between primary and overlay planes.
> + * The R-Car DU has 8 hardware planes, shared between primary and overlay planes.
>   * As using overlay planes requires at least one of the CRTCs being enabled, no
>   * more than 7 overlay planes can be available. We thus create 1 primary plane
>   * per CRTC and 7 overlay planes, for a total of up to 9 KMS planes.

-- 
Regards,

Laurent Pinchart

