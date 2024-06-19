Return-Path: <linux-renesas-soc+bounces-6515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E08BC90F6F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 21:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9764A1F25443
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 19:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA834155759;
	Wed, 19 Jun 2024 19:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jU6gyObo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C653A15886B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2024 19:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718825375; cv=none; b=jJ7Yb386RjX9jWbMIUDJBdt+jZt9zKNSYU5DT9bLgroDR96w4ll3bEWUPtrsSGfcaQKCcdCjaHojDksWDfiGsTNOFk5AYiL0jjoIDW+OUmddBeEFDrXk0nc7ojmiXTaJK5ALrQj2klA4u/DdZB4+uZc4n9UfYVJpzaai3eO43II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718825375; c=relaxed/simple;
	bh=L3axFM2mjRFSCzxpqxFKEzUSKwF36hoJ2X9R2IX9j4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQzaJt04eb3+teV+XIgdRKUCcHzzHKDeNdwWF444UYhYpIqe3UYZMANAXoMLUZHeTm7EohDf2EyAEBOWBYEyBPQtzYZMDSM4WC1iL+Lqn/Qtz/42iqx1wuxzGats+i23SZ7Fr3oQIPvWUfalxbd+45mG0I1YPq3JNcPwln8Rdq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jU6gyObo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0299C18D;
	Wed, 19 Jun 2024 21:29:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718825353;
	bh=L3axFM2mjRFSCzxpqxFKEzUSKwF36hoJ2X9R2IX9j4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jU6gyOboPDfZPPxptCZyyqHKYvIMB0PyC4pMZrkRIsniA3+XPjnGFsfMS9ntLYNow
	 TZGHK/LFey/xDiI0p6MPYUOhJ9bBzxoHJ2nKsgISwvGKEtWoMBT3GC8HBROTcx76S5
	 zOkIYRgX/2lxHOG0TxgkGwTvisKSifsyqxyNtgTk=
Date: Wed, 19 Jun 2024 22:29:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <dri-devel@lists.freedesktop.org>,
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <linux-renesas-soc@vger.kernel.org>,
	Takeshi Kihara <takeshi.kihara.df@renesas.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 1/4] drm: rcar-mipi-dsi: Fix CLOCKSET1_LOCK definition
Message-ID: <20240619192909.GB31507@pendragon.ideasonboard.com>
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
 <20240619102219.138927-2-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240619102219.138927-2-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

CC'ing Tomi.

On Wed, Jun 19, 2024 at 12:22:15PM +0200, Jacopo Mondi wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> Version 0.51 of the Renesas R-Car Gen4 TRM reports bit 16 of the
> CLOCKSET1 register of the DSI transmitter module to be a reserved
> field.
> 
> Fix this by correcting the CLOCKSET1_LOCK definition to match the TRM
> and remove the CLOCKSET1_LOCK_PHY definition, as the register is simply
> called "lock" in the datasheet.
> 
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> index f8114d11f2d1..1bf9c4717d5a 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h
> @@ -141,8 +141,7 @@
>  #define PHYSETUP_RSTZ			(1 << 0)
>  
>  #define CLOCKSET1			0x101c
> -#define CLOCKSET1_LOCK_PHY		(1 << 17)
> -#define CLOCKSET1_LOCK			(1 << 16)
> +#define CLOCKSET1_LOCK			(1 << 17)

This matches the documentation, but we should get it tested on V4H to
make sure it doesn't cause a regression. Tomi, would you be able to test
the patch ?

>  #define CLOCKSET1_CLKSEL		(1 << 8)
>  #define CLOCKSET1_CLKINSEL_EXTAL	(0 << 2)
>  #define CLOCKSET1_CLKINSEL_DIG		(1 << 2)

-- 
Regards,

Laurent Pinchart

