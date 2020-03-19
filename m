Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C09B518B937
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Mar 2020 15:20:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbgCSOUD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Mar 2020 10:20:03 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:57220 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726817AbgCSOUD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Mar 2020 10:20:03 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id E0EAA8052B;
        Thu, 19 Mar 2020 15:19:55 +0100 (CET)
Date:   Thu, 19 Mar 2020 15:19:54 +0100
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Jose Roberto de Souza <jose.souza@intel.com>,
        virtualization@lists.linux-foundation.org,
        Gerd Hoffmann <kraxel@redhat.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        Emil Velikov <emil.velikov@collabora.com>,
        linux-samsung-soc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Dave Airlie <airlied@redhat.com>,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Boris Brezillon <bbrezillon@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v1 0/3] drm: drm_encoder_init() =>
 drm_encoder_init_funcs()
Message-ID: <20200319141954.GA25036@ravnborg.org>
References: <20200313201744.19773-1-sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200313201744.19773-1-sam@ravnborg.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
        a=MgBhUfZuEF2DRmvJ2N4A:9 a=CjuIK1q_8ugA:10
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Mar 13, 2020 at 09:17:41PM +0100, Sam Ravnborg wrote:
> Thomas Zimmermann had made a nice patch-set that introduced
> drm_simple_encoder_init() which is already present in drm-misc-next.
> 
> While looking at this it was suddenly obvious to me that
> this was functionalty that really should be included in drm_encoder.c
> The case where the core could handle the callback is pretty
> common and not part of the simple pipe line.
> 
> So after some dialog on dri-devel the conclusion was to go for
> a change like this:
> 
>     drm_encoder_init_funcs() for all users that specified a
>     drm_encoder_funcs to extend the functionality.
> 
>     drm_encoder_init() for all users that did not
>     need to extend the basic functionality with
>     drm_encoder_funcs.
> 
> A similar approach with a _funcs() prefix is used elsewhere in drm/
> 
> This required a rename of the existing users, and
> a follow-up patch that moves drm_simple_encoder_init()
> to drm_encoder.c
> 
> Patches 3 in this set demonstrate the use of drm_encoder_init().
> There are many more drivers that can be converted as Thomas
> has already demonstrated.
> 
> This is all based on work done by Thomas Zimmermann,
> I just wanted to implement my suggestion so
> we could select the best way forward.
> 
> Note: Daniel Vetter has hinted the approach implemented
> here smelled like middle-layer.
> IMO this is not so, it is just a way to handle cleanup
> for the simple cases.

We discussed this patch-set briefly on irc.
With the upcoming drmm_ changes and such this is bad timing..
And in the end this may be pointless code-chrunch.

Patch-set shelfed for now - may re-visit it later.

	Sam
