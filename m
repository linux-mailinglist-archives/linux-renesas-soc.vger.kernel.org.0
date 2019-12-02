Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BD3BF10F1CD
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2019 21:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725781AbfLBU6z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 2 Dec 2019 15:58:55 -0500
Received: from asavdk3.altibox.net ([109.247.116.14]:36968 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbfLBU6z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Dec 2019 15:58:55 -0500
X-Greylist: delayed 642 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Dec 2019 15:58:53 EST
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk3.altibox.net (Postfix) with ESMTPS id 5EF5B20054;
        Mon,  2 Dec 2019 21:48:03 +0100 (CET)
Date:   Mon, 2 Dec 2019 21:48:02 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Linus Walleij <linus.walleij@linaro.org>,
        Stefan Agner <stefan@agner.ch>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        linux-mediatek@lists.infradead.org,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Purism Kernel Team <kernel@puri.sm>,
        linux-renesas-soc@vger.kernel.org,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1 0/26] drm/panel infrastructure + backlight update
Message-ID: <20191202204802.GA23600@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <CAOCk7NoKPoxcETLYQ4CyAtYGnPwvYapdSavZM=aRdswDydTLEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7NoKPoxcETLYQ4CyAtYGnPwvYapdSavZM=aRdswDydTLEA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
        a=Vu-n39T5avVOgQursbAA:9 a=CjuIK1q_8ugA:10 a=Bzv8nzo8J20A:10
        a=Vxmtnl_E_bksehYqCbjh:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jeffrey.

> >  drivers/gpu/drm/msm/dsi/dsi_manager.c              |   2 +-
> 
> How come the diff stat in the cover letter here indicates a change to
> this file, yet I cannot find a change to this file in any of the
> patches?  What am I missing?

This file is patched in "[PATCH v1 06/26] drm/panel: decouple connector
from drm_panel"

See: https://lists.freedesktop.org/archives/dri-devel/2019-December/247186.html

The above patch touches a lot of files/drivers so it was cc: to
a lot of people. Maybe is was considered as spam?
 
	Sam
