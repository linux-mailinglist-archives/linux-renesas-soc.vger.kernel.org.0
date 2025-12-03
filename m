Return-Path: <linux-renesas-soc+bounces-25513-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D9C9D923
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Dec 2025 03:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 690CA4E03AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Dec 2025 02:22:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7FC9238D42;
	Wed,  3 Dec 2025 02:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZQ/UG4md"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8E71A9F82
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Dec 2025 02:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764728575; cv=none; b=LJqGut26hpHzx1ZFwzJJZCd86dk5lhmdbpIKjWfcbPc6imccIjiDFzaJNG0Ffqkjq9beiW4qzY4vLx6OQvkybSxKI2hkhTtaOUvzVVehi+Dux+sT2mQPnVEmLC9HoxX0yOyu6TX1VxmoSplbvr2zWvucTYeX3KwWGn9eapXsyzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764728575; c=relaxed/simple;
	bh=WgwX+tMqTSKAnJgdCTo4Eb0cXPyDP/zWL7bhr4+0hfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gMVTet42L/2Rr5NPdxP6uOnnw+B1ZYATv7NcI/kjZf4vssS3J+q07XoP65R/oesWjGpXLmgl/7+JNczR/zVIiiP9Vz+iWvUd9zShPUZ8Vx/l9Xz+kRnWi632Gvw8+Br871/2yFBjL8n7wtrAVFbnPtfB7+SAYb9/uQoXzHSv6T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZQ/UG4md; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (p100198.f.east.v6connect.net [221.113.100.198])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EC94DB5;
	Wed,  3 Dec 2025 03:20:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764728434;
	bh=WgwX+tMqTSKAnJgdCTo4Eb0cXPyDP/zWL7bhr4+0hfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQ/UG4mdJcBMQ7rYrJOm79DnELqJ6qSQ7bOuHYEe/0xA46OI9M9ZcpRZ7by4JCh5B
	 WUPLiyni/h5ET3T1/5rAHvbqCQUAu3388ZAgmIUJsU2tJpfDcGoAdo2ZceUixDsaOy
	 8dcOOdzJLMuyT6aGtNIP3hsPblG+Y3q28Jx9gYI0=
Date: Wed, 3 Dec 2025 11:22:29 +0900
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Vicente Bergas <vicencb@gmail.com>
Subject: Re: [PATCH v5 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
Message-ID: <20251203022229.GJ8219@pendragon.ideasonboard.com>
References: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
 <20251202063403.GA18267@pendragon.ideasonboard.com>
 <aaec3da5-83bb-4de9-a999-67ed65711b90@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aaec3da5-83bb-4de9-a999-67ed65711b90@ideasonboard.com>

On Tue, Dec 02, 2025 at 10:58:50AM +0200, Tomi Valkeinen wrote:
> On 02/12/2025 08:34, Laurent Pinchart wrote:
> > On Sun, Nov 30, 2025 at 01:11:16PM +0100, Linus Walleij wrote:
> >> This fixes two regressions experienced in the MCDE and
> >> R-Car DU DRM drivers after
> >> commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
> >> "drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
> >> caused a series of regressions in all panels that send
> >> DSI commands in their .prepare() and .unprepare()
> >> callbacks.
> >>
> >> This series make it possible to selectively bring back the
> >> old behaviour with explicit semantics and implements
> >> the old behaviour as modified commit tails in MCDE and
> >> R-Car DU.
> > 
> > We now have a third platform broken by
> > c9b1150a68d9362a0827609fc0dc1664c0d8bfe1, see [1]. I think this calls
> > for a revert, to give us the time to implement a correct solution.
>
> Perhaps... It's been very slow or not possible to get feedback regarding
> (some) of the broken platforms, so I don't think we have a safe way of
> changing the enable/disable sequence. I think the "correct" solution
> then is to make this new enable/disable sequence either opt-in, offered
> by the framework, or just implement it as a custom sequence in the
> specific drm driver.

I don't think that's right, sorry. We need to improve the bridge API to
handle ordering properly. Changes to the commit tail handlers in display
controller drivers are hacks, they handle issues with the internal DSI
transmitters, but if you had a LVDS-to-DSI bridge in the pipeline things
would still break.

> Reverting c9b1150a68d9362a0827609fc0dc1664c0d8bfe1 will break DSI and
> OLDI outputs on TI platforms, so we need to implement a fix for those
> platforms before the revert, and there has been one or two fixes merged
> for other platforms for this, which most likely also need to get reverted.

That's 3 vs. 1, so I think breaking DSI and OLDI with a revert is better
than not reverting the commit. If we can merge a propert solution at the
same time that's great, but the first target is to restore operation of
the drivers that got broken.

> > [1] https://lore.kernel.org/r/CAAMcf8Di8sc_XVZAnzQ9sUiUf-Ayvg2yjhx2dWmvvCnfF3pBRA@mail.gmail.com
> > 
> >> Signed-off-by: Linus Walleij <linusw@kernel.org>
> >> ---
> >> Changes in v5:
> >> - Prefix all exported atomic commit helpers with drm_atomic_helper_commit_*
> >> - Add kerneldoc to all new exported atmomic commit helpers.
> >> - Add comments into the MCDE and Rcar DU quirks explaining what is
> >>   altered as compared to the standard helper functions.
> >> - Link to v4: https://lore.kernel.org/r/20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org
> >>
> >> Changes in v4:
> >> - Fix a copypaste-bug in the Renesas Rcar-DU driver.
> >> - Actually compile this using the shmobile defconfig and make
> >>   sure it works.
> >> - Collect Geert's Tested-by.
> >> - Link to v3: https://lore.kernel.org/r/20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org
> >>
> >> Changes in v3:
> >> - Switch to a new approach: export helper functions and create the
> >>   special helper directly in the driver instead.
> >> - Drop Marek's patch and write a new RFT patch with the same
> >>   semantic content as the MCDE patch.
> >> - Link to v2: https://lore.kernel.org/r/20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org
> >>
> >> Changes in v2:
> >> - Queue Marek's patch first in the series for coherency.
> >> - Add a patch to also preserve the late CRTC disablement
> >>   semantic.
> >> - Rename helper function to reflect the new semantic.
> >> - Update the MCDE patch to use the new callbacks.
> >> - Link to v1: https://lore.kernel.org/r/20251118-mcde-drm-regression-v1-1-ed5583efbd68@linaro.org
> >>
> >> ---
> >> Linus Walleij (3):
> >>       drm/atomic-helper: Export and namespace some functions
> >>       drm/mcde: Create custom commit tail
> >>       drm/rcar-du: Modify custom commit tail
> >>
> >>  drivers/gpu/drm/drm_atomic_helper.c           | 122 +++++++++++++++++++++-----
> >>  drivers/gpu/drm/mcde/mcde_drv.c               |  45 +++++++++-
> >>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  33 ++++++-
> >>  include/drm/drm_atomic_helper.h               |  22 +++++
> >>  4 files changed, 195 insertions(+), 27 deletions(-)
> >> ---
> >> base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
> >> change-id: 20251120-mcde-drm-regression-thirdfix-1b0abfb52209

-- 
Regards,

Laurent Pinchart

