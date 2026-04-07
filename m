Return-Path: <linux-renesas-soc+bounces-30957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBX3BXSL1Wnr7QcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30957-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 00:55:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 679E13B55E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 00:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 044CD30166CD
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Apr 2026 22:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73C20388E61;
	Tue,  7 Apr 2026 22:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EFP8XNlY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4526F1A9F86
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Apr 2026 22:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775602545; cv=none; b=o4GvXH4ke+xNspupUK7bH/H/LyvZ/k0Q9cgWFVwX0k0AvLK0CC2rHxh5sspXYyK+tneT26L08PmH330MToYyDnL/YI2FKl4pGJhNwHmc0Bty3kKS4650Niwci2I+aZWZp7cJ8vcUWj1x2iXP9ZRXgez60Vds6j4yr0ZQBamH6Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775602545; c=relaxed/simple;
	bh=ryXTSXcBD56C04vqWZf8CaGltRtiQOsx2nSg1l0oRXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkHl3gXfK/35waNkqdW33v+MHAlzqtJxyKZEaFcqWc3RbtV3qDO9bah3rmupGPT+JQhc/SMiSgAzLKBS63bryqOQtv5/asd4tLMQ7Lp6snJ+t0bI+F/aNnjmwoSJl093AfF6TnsF4rrnB7uxlJR49UF1tXhr2+vcUSayEqYrGac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EFP8XNlY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 41B391121;
	Wed,  8 Apr 2026 00:54:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1775602446;
	bh=ryXTSXcBD56C04vqWZf8CaGltRtiQOsx2nSg1l0oRXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EFP8XNlYHiTLk43zQbfyucXqteHwni31bTPRWlb+vKrW3CdXb7qr3XBZG0Za1+TeU
	 dmWGYcy5NjFp1pfewwp2K2QViOS9sVVcaG3Rhg96nSZK+Z1raSFfpnnyHCo8LbmY3m
	 O5yY9dMW7P5nubJP1Gb0nQk5XF6Y8RzARMAAQt40=
Date: Wed, 8 Apr 2026 01:55:32 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 4/4] drm: rcar-du: Don't leak device_link to CMM
Message-ID: <20260407225532.GC1214579@killaraus.ideasonboard.com>
References: <20260323164526.2292491-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260323164526.2292491-5-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdXomz9GFDqkBjGX9Sda_GLccPcrihvFbOz0GAitDVNTbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXomz9GFDqkBjGX9Sda_GLccPcrihvFbOz0GAitDVNTbw@mail.gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30957-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid]
X-Rspamd-Queue-Id: 679E13B55E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

On Tue, Apr 07, 2026 at 11:10:52AM +0200, Geert Uytterhoeven wrote:
> On Mon, 23 Mar 2026 at 18:22, Laurent Pinchart wrote:
> > The DU driver creates device_link instances between the DU and CMMs, but
> > never deletes them. Fix it by introducing a rcar_du_cmm structure to
> > group the CMM device and device_link, and deleting the links at cleanup
> > time.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Thanks for your patch, which is now commit 3bce3fdd1ff2ba24 ("drm:
> rcar-du: Don't leak device_link to CMM") in drm-misc/for-linux-next.
> 
> This causes koelsch to hang during boot when a display is already
> connected before boot:
> 
>       [drm] Initialized rcar-du 1.0.0 for feb00000.display on minor 0
>       rcar-du feb00000.display: [drm] Device feb00000.display probed
> 
> When no display is connected, the system boots fine.
> 
> While looking into this, I noticed that hotplug after boot crashes,
> but I haven't bisected that. It definitely worked a few months ago:

Oops. Would you be able to test the following patch ?

commit 6c66826668e73570ce7668069460538f1ab610f7
Author: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Date:   Wed Apr 8 01:49:40 2026 +0300

    drm: rcar-du: Fix crash when no CMM is available
    
    Commit 3bce3fdd1ff2 ("drm: rcar-du: Don't leak device_link to CMM")
    refactored CMM handling, and introduced an incorrect test for CMM
    availability. When no CMM is present, the rcrtc->cmm field is NULL,
    testing rcrtc->cmm->dev causes a NULL pointer dereference. This slipped
    through testing as all tests were run with the CMM present.
    
    Fix this issue by correctly testing for rcrtc->cmm.
    
    Fixes: 3bce3fdd1ff2 ("drm: rcar-du: Don't leak device_link to CMM")
    Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
    Closes: https://lore.kernel.org/dri-devel/CAMuHMdXomz9GFDqkBjGX9Sda_GLccPcrihvFbOz0GAitDVNTbw@mail.gmail.com
    Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
index 7c36c30a75b6..1a246ebbfc61 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_crtc.c
@@ -513,7 +513,7 @@ static void rcar_du_cmm_setup(struct drm_crtc *crtc)
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 	struct rcar_cmm_config cmm_config = {};
 
-	if (!rcrtc->cmm->dev)
+	if (!rcrtc->cmm)
 		return;
 
 	if (drm_lut)
@@ -667,7 +667,7 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
 	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
 		rcar_du_vsp_disable(rcrtc);
 
-	if (rcrtc->cmm->dev)
+	if (rcrtc->cmm)
 		rcar_cmm_disable(rcrtc->cmm->dev);
 
 	/*
@@ -726,7 +726,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(crtc->state);
 	struct rcar_du_device *rcdu = rcrtc->dev;
 
-	if (rcrtc->cmm->dev)
+	if (rcrtc->cmm)
 		rcar_cmm_enable(rcrtc->cmm->dev);
 	rcar_du_crtc_get(rcrtc);
 
 
>     Unable to handle kernel NULL pointer dereference at virtual address 00000000 when read
>     [00000000] *pgd=00000000
>     Internal error: Oops: 5 [#1] SMP ARM
>     CPU: 1 UID: 0 PID: 43 Comm: kworker/1:3 Not tainted 7.0.0-rc3-shmobile-00734-g3bce3fdd1ff2 #2454 VOLUNTARY
>     Hardware name: Generic R-Car Gen2 (Flattened Device Tree)
>     Workqueue: events adv7511_hpd_work
>     PC is at rcar_du_crtc_atomic_enable+0x14/0xa4
>     LR is at drm_atomic_helper_commit_crtc_enable+0xb0/0xd4
>     pc : [<c0534700>]    lr : [<c05145f8>]    psr: a0000013
>     sp : f0939b88  ip : fffffff8  fp : c1fe25b8
>     r10: c21d01ac  r9 : c0c7862b  r8 : c0a99acc
>     r7 : c21d000c  r6 : c2e1c800  r5 : c21d0000  r4 : c21d0398
>     r3 : 00000000  r2 : 00000000  r1 : c24ed800  r0 : c21d0398
>     Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
>     Control: 10c5387d  Table: 4231006a  DAC: 00000051
>     Register r0 information: non-slab/vmalloc memory
>     Register r1 information: slab kmalloc-64 start c24ed800 pointer offset 0 size 64
>     Register r2 information: NULL pointer
>     Register r3 information: NULL pointer
>     Register r4 information: non-slab/vmalloc memory
>     Register r5 information: non-slab/vmalloc memory
>     Register r6 information: slab kmalloc-512 start c2e1c800 pointer offset 0 size 512
>     Register r7 information: non-slab/vmalloc memory
>     Register r8 information: non-slab/vmalloc memory
>     Register r9 information: non-slab/vmalloc memory
>     Register r10 information: non-slab/vmalloc memory
>     Register r11 information: slab kmalloc-128 start c1fe2580 pointer offset 56 size 128
>     Register r12 information: non-paged memory
>     Process kworker/1:3 (pid: 43, stack limit = 0xdcd99ef9)
>     Stack: (0xf0939b88 to 0xf093a000)
>     9b80:                   c21d0398 00000000 c24ed800 c05145f8 00000048 c1fde6c0
>     9ba0: c2f7c680 c21d000c c24ed800 46818964 00000009 c0a9bf18 c24ed800 c0515350
>     9bc0: c24ed800 c21d000c 46818964 c0535aac c24ed800 00000000 46818964 c05187dc
>     9be0: 00000000 c24ed800 c21d000c 00000000 c21d000c c05189a4 c24ed800 c21d000c
>     9c00: c15bac10 00000001 c21d000c c04de554 c24ed800 c22d1400 c21d1000 c0109fdc
>     9c20: 00000000 c15bac10 00000000 00000000 00000000 00000000 00000000 c0109fdc
>     9c40: 00000000 c15bac10 00000000 00000000 00000000 00000000 00000000 ff6cd0a0
>     9c60: 00000000 f0939c80 c1542a00 c050e368 00000000 c21d01b0 00000000 00000000
>     9c80: c1c30000 00000008 0000000e 00000000 00000000 00000000 c1ce8f24 c21d35a8
>     9ca0: 00000000 ff6cd0a0 ffffffff c21d000c c1542a18 c1542a00 c1542ab8 000000f0
>     9cc0: 00000043 000000f0 00000001 c050e470 c1c30000 c095df28 c21d0058 c21d0058
>     9ce0: c21d0058 c1542a00 c21d000c 00000000 c1542ab8 000000f0 00000043 c050e5a4
>     9d00: 00000000 c1542a00 00000000 c0521a44 00000000 c2d89000 c1514c00 c1077124
>     9d20: 000000f0 c0521a7c c14b2800 c047f16c 00000000 c14df800 00000043 00000000
>     9d40: 00000000 c14b2800 c14b2958 00000000 00000000 0000003e c0a81464 00000000
>     9d60: 00000001 c04c0688 c14b2800 c10798fc 00000000 c04c2654 c1079918 c0a81464
>     9d80: c0a814b8 00000001 0000003e c1079918 c0a81464 00000000 00000000 0000003e
>     9da0: 00000001 c1079a18 00000000 c04c298c c0fe6d84 c0c6f88c 00000001 00000001
>     9dc0: c0fe491c c1076f84 c1076f84 00000000 c0fe491c c0a96a00 00000000 c047d3e8
>     9de0: c0f04ff8 00000000 c1076f84 c047f974 c2d89000 c0f059d4 c2d891cc c0f059d4
>     9e00: c21d000c c0a96a00 00000000 c0478508 60000013 00000000 00000000 00000780
>     9e20: 00000438 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>     9e40: 00000000 00000000 00000020 ff6cd0a0 c1542ab8 c1542a00 c2d89000 00000000
>     9e60: 00000000 c0521674 00000000 c24f05c0 c102cee8 c0944738 00000cc0 00000000
>     9e80: c1542a18 00000001 c141f505 00000000 00000000 00000780 00000438 00000780
>     9ea0: 00000438 00000020 00000018 ff6cd0a0 c1542ab8 c1542a00 c1542a00 c21d000c
>     9ec0: c17d81b8 c10349c0 c141f505 61c88647 c17d81bc c050d594 c1542a00 00000000
>     9ee0: c21d00a8 c1542a00 c21d0094 c050d948 c17d81c8 00000001 c17d8278 c04e2f44
>     9f00: c17d81b8 c141f500 ef7cd600 c053dba8 000000d0 ff6cd0a0 c1cede80 c0143f50
>     9f20: c0a01828 00000000 c1c30000 ff6cd0a0 c1c30000 c1c30000 ef7cd620 ef7cd600
>     9f40: c014424c c1cede80 ef7cd620 ef7cd600 c014424c c1c30000 c1cedeac c1034ee0
>     9f60: 00000000 c01443bc 00000000 c1d00780 c169eac0 c1c30000 c014424c c1cede80
>     9f80: f08fdecc 00000000 00000000 c014b654 c169eac0 c014b558 00000000 00000000
>     9fa0: 00000000 00000000 00000000 c010014c 00000000 00000000 00000000 00000000
>     9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>     9fe0: 00000000 00000000 00000000 00000000 00000013 00000000 00000000 00000000
>     Call trace:
>      rcar_du_crtc_atomic_enable from drm_atomic_helper_commit_crtc_enable+0xb0/0xd4
>      drm_atomic_helper_commit_crtc_enable from drm_atomic_helper_commit_modeset_enables+0x10/0x38
>      drm_atomic_helper_commit_modeset_enables from rcar_du_atomic_commit_tail+0x54/0xb8
>      rcar_du_atomic_commit_tail from commit_tail+0x6c/0x138
>      commit_tail from drm_atomic_helper_commit+0xf4/0x104
>      drm_atomic_helper_commit from drm_atomic_commit+0xbc/0xec
>      drm_atomic_commit from drm_client_modeset_commit_atomic+0x190/0x214
>      drm_client_modeset_commit_atomic from drm_client_modeset_commit_locked+0x3c/0x148
>      drm_client_modeset_commit_locked from drm_client_modeset_commit+0x28/0x3c
>      drm_client_modeset_commit from __drm_fb_helper_restore_fbdev_mode_unlocked+0xa4/0xac
>      __drm_fb_helper_restore_fbdev_mode_unlocked from drm_fb_helper_set_par+0x2c/0x38
>      drm_fb_helper_set_par from fbcon_init+0x2c8/0x460
>      fbcon_init from visual_init+0x98/0xe4
>      visual_init from do_bind_con_driver+0x1f0/0x260
>      do_bind_con_driver from do_take_over_console+0x12c/0x174
>      do_take_over_console from do_fbcon_takeover+0x4c/0xb0
>      do_fbcon_takeover from fbcon_fb_registered+0xf4/0x160
>      fbcon_fb_registered from register_framebuffer+0x1f8/0x21c
>      register_framebuffer from __drm_fb_helper_initial_config_and_unlock+0x468/0x534
>      __drm_fb_helper_initial_config_and_unlock from drm_client_hotplug+0x50/0x94
>      drm_client_hotplug from drm_client_dev_hotplug+0x80/0x8c
>      drm_client_dev_hotplug from drm_bridge_hpd_notify+0x30/0x3c
>      drm_bridge_hpd_notify from adv7511_hpd_work+0x74/0xb4
>      adv7511_hpd_work from process_scheduled_works+0x1d8/0x324
>      process_scheduled_works from worker_thread+0x170/0x208
>      worker_thread from kthread+0xfc/0x108
>      kthread from ret_from_fork+0x14/0x28
>     Exception stack(0xf0939fb0 to 0xf0939ff8)
>     9fa0:                                     00000000 00000000 00000000 00000000
>     9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>     9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
>     Code: e1a04000 e5903520 e5906468 e59054d8 (e5930000)
>     ---[ end trace 0000000000000000 ]---

-- 
Regards,

Laurent Pinchart

