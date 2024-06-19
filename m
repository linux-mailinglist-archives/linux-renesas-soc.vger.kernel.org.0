Return-Path: <linux-renesas-soc+bounces-6516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B16A90F6FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 21:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA137284A62
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 19:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA32E158DCE;
	Wed, 19 Jun 2024 19:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m1gNiQg+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46202158A33
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2024 19:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718825604; cv=none; b=iHGd2Rlhp052WF2dFDDlZWPyxhP/dNOMv0XFsa829LGoJ4ZlGZ0BPpwzms2emM3oCox5Q1lE99a0zfSp6BUIyj2foNzDEqBtGR0HjM/PwS8EKl/3UoVd3uvejzutjuhE5UL+cCRnHpDjzMI2Dq6FW/6YU2tq31Vb7NA4+fbwtOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718825604; c=relaxed/simple;
	bh=SNkueJuqO84zvSRP0yYZWywkBZ7rTdrRTGjFUgV3sGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0wBbx9aN9XGDauWYoHfoVOOiX52OwsLJjt5Aq/i3l/3R7gb05zABQCKnn0Ja/lk/Ss/H4mLz5S2MeoaRbvo/YXNJ37z2XVxxAd6btrUTF8MkbxA01Y5+wAcY4qlm+c28czd1MKDI8duJiZ2QqO2df8f6Hho/DlgKyLcTVuxzQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m1gNiQg+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 713B0541;
	Wed, 19 Jun 2024 21:33:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718825582;
	bh=SNkueJuqO84zvSRP0yYZWywkBZ7rTdrRTGjFUgV3sGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m1gNiQg+t/J3MvzMIACPt22uFIvY9wlLGSgn7XQNs5SBDAo5lx8P/m6YQkP9BTybQ
	 ReQY2AdD9tXQez6E5GGqQre/kVBmGe2iptSTRP4orYrzuzLkwS1np+/tOg/83EPb14
	 iaLkobmg1n1OhCjr2ftbGScsa1erhucQqWXtjhQc=
Date: Wed, 19 Jun 2024 22:32:58 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <dri-devel@lists.freedesktop.org>,
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <linux-renesas-soc@vger.kernel.org>,
	Phong Hoang <phong.hoang.wz@renesas.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH 2/4] drm: ti-sn65dsi86: Check bridge connection failure
Message-ID: <20240619193258.GC31507@pendragon.ideasonboard.com>
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
 <20240619102219.138927-3-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240619102219.138927-3-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Wed, Jun 19, 2024 at 12:22:16PM +0200, Jacopo Mondi wrote:
> From: Phong Hoang <phong.hoang.wz@renesas.com>
> 
> Add a check to the register access function when attaching a bridge
> device.
> 
> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 84698a0b27a8..b7df53577987 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -696,6 +696,7 @@ static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
>  
>  static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86 *pdata)
>  {
> +	int ret;
>  	int val;
>  	struct mipi_dsi_host *host;
>  	struct mipi_dsi_device *dsi;
> @@ -720,8 +721,11 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
>  
>  	/* check if continuous dsi clock is required or not */
>  	pm_runtime_get_sync(dev);
> -	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
> +	ret = regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
>  	pm_runtime_put_autosuspend(dev);
> +	if (ret)
> +		return ret;
> +
>  	if (!(val & DPPLL_CLK_SRC_DSICLK))
>  		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
>  

-- 
Regards,

Laurent Pinchart

