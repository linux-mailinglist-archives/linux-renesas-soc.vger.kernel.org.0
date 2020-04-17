Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B381AE6C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2020 22:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730937AbgDQU3V (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Apr 2020 16:29:21 -0400
Received: from asavdk4.altibox.net ([109.247.116.15]:44894 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730903AbgDQU3V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Apr 2020 16:29:21 -0400
Received: from ravnborg.org (unknown [158.248.194.18])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by asavdk4.altibox.net (Postfix) with ESMTPS id B8B1080528;
        Fri, 17 Apr 2020 22:29:13 +0200 (CEST)
Date:   Fri, 17 Apr 2020 22:29:07 +0200
From:   Sam Ravnborg <sam@ravnborg.org>
To:     Arnd Bergmann <arnd@arndb.de>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
        Marek Vasut <marex@denx.de>, dsd@laptop.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Saeed Mahameed <saeedm@mellanox.com>,
        Thomas Hellstrom <thellstrom@vmware.com>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        VMware Graphics <linux-graphics-maintainer@vmware.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        jfrederich@gmail.com, Robert Jarzmik <robert.jarzmik@free.fr>,
        Daniel Mack <daniel@zonque.org>
Subject: Re: [PATCH 6/8] drm: decouple from CONFIG_FB
Message-ID: <20200417202907.GA5617@ravnborg.org>
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417155553.675905-7-arnd@arndb.de>
 <20200417165041.GA30483@ravnborg.org>
 <CAK8P3a14G=Mv3jpZRciTgsSDf4Bd3ZOAqFRN1cc2FLYbwZZcbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a14G=Mv3jpZRciTgsSDf4Bd3ZOAqFRN1cc2FLYbwZZcbw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
        a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
        a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=r6ubUnnpiWzmGfokuToA:9
        a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Arnd.

On Fri, Apr 17, 2020 at 10:03:23PM +0200, Arnd Bergmann wrote:
> On Fri, Apr 17, 2020 at 6:50 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> >
> > So what this try to say is that we cannot have FB a module while DRM is
> > built-in (marked N in the above).
> 
> Correct
> 
> >
> > Could you explain in the changelog why this combination is not good.
> > (Or tell me if my analysis was flawed).
> 
> I agree in hindsight this was less obvious than I thought ;-)
> 
> Added this text to the changelog:
> 
> |  When CONFIG_FB is a loadable module, DRM_KMS_FB_HELPER cannot be
> | part of the built-in subsystem, so add dependency to ensure this
> | can only be enabled if the DRM module can successfully be linked.
> 
> and this comment in the Kconfig file:
> 
> @@ -112,7 +112,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>  config DRM_FBDEV_EMULATION
>         bool "Enable legacy fbdev support for your modesetting driver"
>         depends on DRM && FB
> -       depends on FB=y || DRM=m
> +       depends on FB=y || DRM=m # DRM_KMS_FB_HELPER links against FB
>         select DRM_KMS_HELPER
>         select DRM_KMS_FB_HELPER
>         default y
> 
> Let me know if you think those changes are sufficient
> 
> > With this fixed (assuming I am right):
> > Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Yes, that explains it nicely - thanks.
But unless Daniel decides otherwise we do not get it applied.
He was not too happy with it.

	Sam
