Return-Path: <linux-renesas-soc+bounces-22586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69418BB3EF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 14:47:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E9542A6DF0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 12:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D1C30F944;
	Thu,  2 Oct 2025 12:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vaZHRXzz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF5230DED4;
	Thu,  2 Oct 2025 12:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759409270; cv=none; b=d2EpwDcj8RS8MqD4HRv4B7ZMX+w8EvNLME2TclrU5bVTRprDlQEwgSeOjBsJz9tTY0QaVH/qXFmI3Vc4rbVVRLciAzjjyq1tvb4aQwnUtSgwCjy6Xmqst+NMC3A6tU3wajHgx51oPilLsjsenE0T/Tro3LzlsG3h9vE5N8aX7RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759409270; c=relaxed/simple;
	bh=10qfnOH1V7V4fSOnAg7xdvk9UP941K9D3WD/YuFXX9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzEQ3aQECqlQysMBfG7v68+HOTVJxEsPIq6U4Kr/o+t0qnm4zDyaKXYBGMsm3+qkoYPawgudy8gatCvKOpjVN4W1tIj0V1I0+wDAshaogzIcFk8GZqSQ0BRA5jsce77xv8laS5iLVjdEuKp/Kxd4gZKVit2kUQcFP63CoIsqyok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vaZHRXzz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3B185929;
	Thu,  2 Oct 2025 14:46:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1759409171;
	bh=10qfnOH1V7V4fSOnAg7xdvk9UP941K9D3WD/YuFXX9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vaZHRXzzpFB2cXLirBHqrnXxqjS540/w70XXVMhh0eUix7BcmEOA6Hfrjt3A/3OeX
	 TSC+MLCSB9cuQHWT6+19J4UmatH4U5GPoAxM6IFPhQzrYUXxMQ6/+bv0L8lKvasATq
	 6knGIviTJ9vMBpJp5iHh1DXpJqOOx7BlInPwTa8c=
Date: Thu, 2 Oct 2025 15:47:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] drm: renesas: rz-du: Drop ARCH_RZG2L dependency
Message-ID: <20251002124735.GB10198@pendragon.ideasonboard.com>
References: <20251002123452.146610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251002123452.146610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>

On Thu, Oct 02, 2025 at 01:34:52PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> The RZ/G2L DU driver is now also used on other Renesas SoCs such as
> RZ/V2H(P) and RZ/V2N. Restricting it to ARCH_RZG2L prevents enabling it
> on these newer platforms.
> 
> Replace the ARCH_RZG2L dependency with ARCH_RENESAS to allow the driver
> to be built on all relevant Renesas SoCs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Happy to see the driver getting used more widely. Coming-of-age is
always a special time, for software too :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/renesas/rz-du/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
> index 34d515eb798b..8bbcc66ca3f0 100644
> --- a/drivers/gpu/drm/renesas/rz-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  config DRM_RZG2L_DU
>  	tristate "DRM Support for RZ/G2L Display Unit"
> -	depends on ARCH_RZG2L || COMPILE_TEST
> +	depends on ARCH_RENESAS || COMPILE_TEST
>  	depends on DRM && OF
>  	depends on VIDEO_RENESAS_VSP1
>  	select DRM_CLIENT_SELECTION

-- 
Regards,

Laurent Pinchart

