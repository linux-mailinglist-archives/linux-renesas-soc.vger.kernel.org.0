Return-Path: <linux-renesas-soc+bounces-731-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC8380563B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 14:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 00352B20B5D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Dec 2023 13:40:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 230C35D910;
	Tue,  5 Dec 2023 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZF2hrJ7+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0905BA
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Dec 2023 05:40:45 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EC03A9D5;
	Tue,  5 Dec 2023 14:40:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1701783603;
	bh=qqqCfEhf80hGt/I7ULRldCLeyjjb3TUwo3J4hJoLvHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZF2hrJ7+yBcW2xS6XAIzU+xFMu2VtYz3WE3qthCOKSX/3jiHp0YIjp1tWAEHnPo5s
	 VzB4qsVC+EYlYbWkaqzS8OlQVfReJ4lVmXgTda2EEv0ouG55fQEjPSF/DY/hrJ9Mtm
	 EpZBETyaNmKNEwcwXGVY2wURGz1jpiRRjdJbl3Uk=
Date: Tue, 5 Dec 2023 15:40:50 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Douglas Anderson <dianders@chromium.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: renesas: shmobile: Call
 drm_helper_force_disable_all() at shutdown time
Message-ID: <20231205134050.GG17394@pendragon.ideasonboard.com>
References: <0a13f43d1e519b88e0762cce178d7852b7dba2b1.1701775726.git.geert+renesas@glider.be>
 <20231205121617.GF17394@pendragon.ideasonboard.com>
 <CAMuHMdWziG0T6XdtcyvLz2si7Ai6sQN0tDU1345nSouz2tUq8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWziG0T6XdtcyvLz2si7Ai6sQN0tDU1345nSouz2tUq8A@mail.gmail.com>

On Tue, Dec 05, 2023 at 02:31:24PM +0100, Geert Uytterhoeven wrote:
> On Tue, Dec 5, 2023 at 1:16 PM Laurent Pinchart wrote:
> > On Tue, Dec 05, 2023 at 12:30:02PM +0100, Geert Uytterhoeven wrote:
> > > From: Douglas Anderson <dianders@chromium.org>
> > >
> > > Based on grepping through the source code, this driver appears to be
> > > missing a call to drm_atomic_helper_shutdown() at system shutdown time.
> > > This is important because drm_helper_force_disable_all() will cause
> > > panels to get disabled cleanly which may be important for their power
> > > sequencing.  Future changes will remove any custom powering off in
> > > individual panel drivers so the DRM drivers need to start getting this
> > > right.
> > >
> > > The fact that we should call drm_atomic_helper_shutdown() in the case of
> > > OS shutdown comes straight out of the kernel doc "driver instance
> > > overview" in drm_drv.c.
> > >
> > > Suggested-by: Maxime Ripard <mripard@kernel.org>
> > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > Link: https://lore.kernel.org/r/20230901164111.RFT.15.Iaf638a1d4c8b3c307a6192efabb4cbb06b195f15@changeid
> > > [geert: s/drm_helper_force_disable_all/drm_atomic_helper_shutdown/]
> > > [geert: shmob_drm_remove() already calls drm_atomic_helper_shutdown]
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks!
> 
> > > Panel-simple does print two new warnings:
> > >
> > >     +panel-simple panel: Skipping disable of already disabled panel
> > >     +panel-simple panel: Skipping unprepare of already unprepared panel
> >
> > Have you investigated where this comes from ?
> 
> Meh, I knew I forgot something ;-)
> 
> The panel is unprepared and disabled a first time from shmob_drm's
> .shutdown() callback:
> 
>   shmob_drm_shutdown
>     drm_atomic_helper_shutdown
>       drm_atomic_helper_disable_all
>         drm_atomic_commit
>           drm_atomic_helper_commit
>             commit_tail
>               drm_atomic_helper_commit_tail
>                 drm_atomic_helper_commit_modeset_disables
>                   disable_outputs
>                     drm_atomic_bridge_chain_disable
>                         drm_panel_disable
>                     drm_atomic_bridge_chain_post_disable
>                         drm_panel_unprepare
> 
> And a second time from simple_panel's .shutdown() callback():
> 
>   panel_simple_platform_shutdown
>     panel_simple_shutdown
>       drm_panel_disable
>       drm_panel_unprepare

That looks like what Doug mentioned should be removed in the commit
message of this patch (a confirmation would be nice). It should be fine
for now.

-- 
Regards,

Laurent Pinchart

