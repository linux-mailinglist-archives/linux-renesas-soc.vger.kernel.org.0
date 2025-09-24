Return-Path: <linux-renesas-soc+bounces-22345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8180B9C33D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 22:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11AF01B2809A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Sep 2025 20:54:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 881E41FFC48;
	Wed, 24 Sep 2025 20:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RQGlBQRL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B432236E8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Sep 2025 20:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758747230; cv=none; b=VGkY9iqKh/nMQg8V/U6/fGXF6B6uoD4rAjYuMXxNPP9SXsvnRBIPh86AS0/riYGkz+uC1p1rPpe1WDIpfQO3dwq5TnY+CwntEcFb2ZfjncsZzdvHKUmbLb40PABoZeb5QGG+Pm1vqfQquM6Ii3Jo9fUmgM2j3gBO0cx0DtoTL+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758747230; c=relaxed/simple;
	bh=MUc6lson1HlINLrSuNuMoqq46cZPFAq3OSyeSYOl/7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ma0aOoKsEpcWW8IhTz+0g6Bj2ZQ8qEGOzSaqEffQK/3AptshDyFgnU5zV0pRPYEXkkJIK8T6uVuFmdFPRciBzVswX86MK80eyjfQ0JkHI/YdZoH8bh8S6fFxlSOwRm17s5iXp2h8meSQGdRWrTbT4ff60csfB9WXCjZ3CtopYKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RQGlBQRL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id D108F7E0;
	Wed, 24 Sep 2025 22:52:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758747141;
	bh=MUc6lson1HlINLrSuNuMoqq46cZPFAq3OSyeSYOl/7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RQGlBQRLPpXTEl+t256I6kd4KsXo3TjgZ4dwclNYtJNr/H+0HH+TO3o/ZBHCwWRG7
	 +QgB2grp/DuKKvbap4PmaZ3Wq1dAub5JnSho3XxbS/LM9LPXkzH+dDvv9R3G04spZb
	 P1kTyOsHYzhqK6VdxVJesP9fupEKAgl2gFmAme9k=
Date: Wed, 24 Sep 2025 23:53:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 7/9] drm/rcar-du: dsi: Clean up handling of DRM mode flags
Message-ID: <20250924205311.GA14773@pendragon.ideasonboard.com>
References: <20250922185740.153759-1-marek.vasut+renesas@mailbox.org>
 <20250922185740.153759-8-marek.vasut+renesas@mailbox.org>
 <20250923132616.GH20765@pendragon.ideasonboard.com>
 <lzimjanf6sajxusigstmc7lpeujcq63yff5gyw22hh2bnsbt4h@cbpoc3u257wg>
 <ddae2f06-b800-4d21-83ea-f06aa4b1f2ba@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ddae2f06-b800-4d21-83ea-f06aa4b1f2ba@mailbox.org>

On Wed, Sep 24, 2025 at 04:36:00AM +0200, Marek Vasut wrote:
> On 9/24/25 3:18 AM, Sebastian Reichel wrote:
> 
> Hello Sebastian,
> 
> > On Tue, Sep 23, 2025 at 04:26:16PM +0300, Laurent Pinchart wrote:
> >> I wonder if the DRM_MODE_FLAG_P[HV]SYNC flags are always the exact
> >> opposite of DRM_MODE_FLAG_N[HV]SYNC. It's probably fine to assume that
> >> here. A quick grep showed one panel driver setting both the N and P
> >> flags (drivers/gpu/drm/panel/panel-sitronix-st7789v.c, see
> >> t28cp45tn89_mode, which I assume is a bug - Sebastian, could you check
> >> that ?).
> > 
> > Yeah, it was supposed to be
> > 
> > static const struct drm_display_mode t28cp45tn89_mode = {
> >      ...
> >      .flags = DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_NHSYNC
> > };
> > 
> > The driver works with the panel, because the driver defaults to
> > DRM_MODE_FLAG_N[HV]SYNC and ignores the related flags, so just the
> > DRM_MODE_FLAG_P[HV]SYNC one is applied:
> > 
> > static int st7789v_prepare(struct drm_panel *panel)
> > {
> >      ...
> > 
> > 	if (ctx->info->mode->flags & DRM_MODE_FLAG_PVSYNC)
> > 		polarity |= ST7789V_RGBCTRL_VSYNC_HIGH;
> > 	if (ctx->info->mode->flags & DRM_MODE_FLAG_PHSYNC)
> > 		polarity |= ST7789V_RGBCTRL_HSYNC_HIGH;
> > 
> >      ...
> > }
> > 
> > Greetings and thanks for the bug report,
> 
> Will you send a patch ? If so, please CC me, so I can provide RB.

Feel free to include my

    Reported-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

in that patch.

-- 
Regards,

Laurent Pinchart

