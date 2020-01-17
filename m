Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA1714059B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jan 2020 09:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729501AbgAQIrg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jan 2020 03:47:36 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41380 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729121AbgAQIrf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jan 2020 03:47:35 -0500
Received: by mail-ot1-f68.google.com with SMTP id r27so21900856otc.8;
        Fri, 17 Jan 2020 00:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pz6+/xs8T4dEEblCt+UUKFDi8/LXzdFKEsZrzO5UHGk=;
        b=r6/+skgijbZCUz4LRc7ea9ZAOslUAfkeAdLGC92NNlGGxNk9Kt6oS/9BS5x6F0Lcaq
         bmPc5GiaoR4t5M/ZMBMWjID73WQgrtI3I+OQUGjPWJrawJ+gbZiEIbCr7aK4DYLxp2CR
         JNnNmoxobr6RfLGSSlruAOOEMllmmmU63gwZARHwSnSglHa2zw2l+94gRpHELDALk8qm
         Ei/OWprX6mNTl+hQevKPFOXH4iy4muLatj9P4U5unkFxHcb/hdZmO4fFxShrxthqePKG
         Vyubc41WmC5Nx1kA7UTgRvVDRxKbqXNf92zS6Mm90WpiPblGiHucHkOuf7aueW/p4H1Q
         O/wQ==
X-Gm-Message-State: APjAAAUdxaDOrroi8M+FDpCajkb9Q7WHiVBlrLKXMnC2YcgFJTTm6Wcj
        mSAsoUmNF4qPKR8e9yWA4a7WuyeUUQzPIIVDyro=
X-Google-Smtp-Source: APXvYqwPm6MtbyAOSCi9UiBhMZ4PpzpzXrNfcsnaLGfKDZqdHNnurHqn4SJJX9I9yrPnM/Q7dnOgZvD5f79Eq6Wg3as=
X-Received: by 2002:a05:6830:2141:: with SMTP id r1mr5358243otd.39.1579250854871;
 Fri, 17 Jan 2020 00:47:34 -0800 (PST)
MIME-Version: 1.0
References: <1576590361-28244-1-git-send-email-fabrizio.castro@bp.renesas.com> <20191217231326.GG4874@pendragon.ideasonboard.com>
In-Reply-To: <20191217231326.GG4874@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Jan 2020 09:47:22 +0100
Message-ID: <CAMuHMdWaZBfsHi9E57B8Mr6QSCATVxpdRtg=9_H-urBaK_iRJw@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] Add dual-LVDS panel support to EK874
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Sean Paul <sean@poorly.run>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        ebiharaml@si-linux.co.jp
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

(woops, forgot to press sent)

On Wed, Dec 18, 2019 at 12:13 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Dec 17, 2019 at 01:45:55PM +0000, Fabrizio Castro wrote:
> > this series adds support for dual-LVDS panel IDK-2121WR
> > from Advantech:
> > https://buy.advantech.eu/Displays/Embedded-LCD-Kits-High-Brightness/model-IDK-2121WR-K2FHA2E.htm
> >
> > V6 reworks patch "drm: rcar-du: lvds: Allow for even and odd pixels swap",
> > and rebases the series on top of patch:
> > https://patchwork.kernel.org/patch/11295991/
>
> I've taken patch 1/6 to 4/6 in my tree. I expect Geert to take 6/6. For
> 5/6, I'll give Rob a chance to review the patch. Sam, could you handle
> it afterwards ?

Queuing 6/6 in renesas-devel for v5.6.

> > Fabrizio Castro (6):
> >   drm: of: Add drm_of_lvds_get_dual_link_pixel_order
> >   drm: rcar-du: lvds: Improve identification of panels
> >   drm: rcar-du: lvds: Get dual link configuration from DT
> >   drm: rcar-du: lvds: Allow for even and odd pixels swap
> >   dt-bindings: display: Add idk-2121wr binding
> >   arm64: dts: renesas: Add EK874 board with idk-2121wr display support
> >
> >  .../display/panel/advantech,idk-2121wr.yaml        | 128 +++++++++++++++
> >  arch/arm64/boot/dts/renesas/Makefile               |   3 +-
> >  .../boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts | 116 +++++++++++++
> >  drivers/gpu/drm/drm_of.c                           | 116 +++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c                | 180 ++++++++++++---------
> >  include/drm/drm_of.h                               |  20 +++
> >  6 files changed, 483 insertions(+), 80 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml
> >  create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-idk-2121wr.dts

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
