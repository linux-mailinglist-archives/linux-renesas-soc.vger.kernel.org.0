Return-Path: <linux-renesas-soc+bounces-6532-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87FDF9101A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 12:42:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5FA491C21008
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Jun 2024 10:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A561A8C09;
	Thu, 20 Jun 2024 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Kl8sV+ju"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40CC3BBF5
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Jun 2024 10:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718880156; cv=none; b=lvWhw/DlhAhyHQh5qxMNdrmEadjlOiN2M+4RXQOyt8V4oeflKM5ZPgMVG6SJPi5ovOeGg2s1HVJA4kf66gHBDYbHnNjevIXPiyYJ/HRRVv3UcCdmtmw/wbHLXDlYedle/vd7WHqzF2YshbmHIK79RgTiMX4ibA4eX8PGGlvAzwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718880156; c=relaxed/simple;
	bh=ti8bxCNiWoqLj57KYwDqhNvEAh/oPERI35OrXACSuro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u7osmcMxSk3YObEDlxB4XnJEYDzBhQp/so3vt4Nky7e/OipLO3x0Vw/yK9LYwQsPooO+vGAAef4AWftf33M0Zqix/jkObA1gpcKPurVoVTmEB7afOOL1J5Oy9h3FeUnSUg4CrOeEnsT6nT2civl+5FqiUnh07SXqRQJIP8AtUIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Kl8sV+ju; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E8DC66F;
	Thu, 20 Jun 2024 12:42:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718880133;
	bh=ti8bxCNiWoqLj57KYwDqhNvEAh/oPERI35OrXACSuro=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kl8sV+jutpc7/1rMKSuIsrNDmmORcwUa8Or9bzo/2tHa66VmlpjIS2vqoRj6zdO0B
	 I6bsUE+TzhkE3k6iyDCXtMflS38ws49jFcMcHZw/NcCgze9c9sgaTjguWAoSd1l89i
	 7lTnvnE4XU7hYrV37s230lxdIP6mZeW6mkiNo99U=
Date: Thu, 20 Jun 2024 13:42:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <dri-devel@lists.freedesktop.org>,
	"open list:DRM DRIVERS FOR RENESAS R-CAR" <linux-renesas-soc@vger.kernel.org>,
	Phong Hoang <phong.hoang.wz@renesas.com>
Subject: Re: [PATCH 2/4] drm: ti-sn65dsi86: Check bridge connection failure
Message-ID: <20240620104210.GB27999@pendragon.ideasonboard.com>
References: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
 <20240619102219.138927-3-jacopo.mondi@ideasonboard.com>
 <20240619193258.GC31507@pendragon.ideasonboard.com>
 <404691d2-b013-4bcc-b7e4-bcc809e4bfbb@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <404691d2-b013-4bcc-b7e4-bcc809e4bfbb@ideasonboard.com>

On Thu, Jun 20, 2024 at 09:43:05AM +0300, Tomi Valkeinen wrote:
> On 19/06/2024 22:32, Laurent Pinchart wrote:
> > Hi Jacopo,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Jun 19, 2024 at 12:22:16PM +0200, Jacopo Mondi wrote:
> >> From: Phong Hoang <phong.hoang.wz@renesas.com>
> >>
> >> Add a check to the register access function when attaching a bridge
> >> device.
> 
> I think the desc is missing the "why". I'm guessing it's the first 
> register access to the IC, and thus verifies that it is accessible.

Isn't it a good idea in general to always check if I2C reads succeeded ?

> >>
> >> Signed-off-by: Phong Hoang <phong.hoang.wz@renesas.com>
> >> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> >> ---
> >>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 6 +++++-
> >>   1 file changed, 5 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >> index 84698a0b27a8..b7df53577987 100644
> >> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >> @@ -696,6 +696,7 @@ static struct ti_sn65dsi86 *bridge_to_ti_sn65dsi86(struct drm_bridge *bridge)
> >>   
> >>   static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86 *pdata)
> >>   {
> >> +	int ret;
> >>   	int val;
> >>   	struct mipi_dsi_host *host;
> >>   	struct mipi_dsi_device *dsi;
> >> @@ -720,8 +721,11 @@ static int ti_sn_attach_host(struct auxiliary_device *adev, struct ti_sn65dsi86
> >>   
> >>   	/* check if continuous dsi clock is required or not */
> >>   	pm_runtime_get_sync(dev);
> >> -	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
> >> +	ret = regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
> >>   	pm_runtime_put_autosuspend(dev);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >>   	if (!(val & DPPLL_CLK_SRC_DSICLK))
> >>   		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
> >>   

-- 
Regards,

Laurent Pinchart

