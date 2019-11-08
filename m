Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B98F8F42FF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Nov 2019 10:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730687AbfKHJUr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Nov 2019 04:20:47 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:46869 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730069AbfKHJUr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Nov 2019 04:20:47 -0500
Received: by mail-ot1-f67.google.com with SMTP id n23so4596513otr.13;
        Fri, 08 Nov 2019 01:20:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ekrEQBU5lx2xhaN2Wx6mzNjkiPZbwUYAWTVO5T2USE=;
        b=ThxedQpiYhYCIjWSZMxf/D+aAeMWaWw0tvRImtUBjgxuv9RUQhFGHgJcn3B1li9Mb1
         IaqM6IufLQa4vag7klBjbbVdlkxkpzMut7aniJB0CM1bAhGzf7xp7dtfzNkAFBmDobFq
         BuvKVjR0hB8NOwgXrJiriQCSsD3TAasapGPy1FdCDnziR/52WID4mGgi9KvqJxFpsQrk
         aFI7cZbFjm91vv6WEqIuxOBTeYTshJrPR7KsbRQZbhdSS7IQIjvDHdfbabO3P9DPibS2
         o7L55wOc4f1e+GQMvPjfdIYAE0jU0lYM/kqVcxX4V9Pqx6cxoHRJB1t1yKc7sydtDmPo
         V+PA==
X-Gm-Message-State: APjAAAUYMzEZxUP2dRHP43TY86eyJLSyUwK8UMOkdpKFGZXBYDtc/Nef
        HPyPCWhxf5gfUJauxqKUpcL75UZroiSL5OL5Cn0=
X-Google-Smtp-Source: APXvYqx4/IZm2/WNkldEQnZffy6SAN4QDo9D9NC9WGgb426MgWXKVPYg/IVcHxuUriAP2PNnXWeTZB2xwKtOvwh/Cw4=
X-Received: by 2002:a9d:191e:: with SMTP id j30mr5659117ota.297.1573204845980;
 Fri, 08 Nov 2019 01:20:45 -0800 (PST)
MIME-Version: 1.0
References: <1572443014-17335-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1572443014-17335-2-git-send-email-fabrizio.castro@bp.renesas.com>
 <870bea7e-5e5d-c0ba-2f5d-ebd0fd493c7e@baylibre.com> <TY1PR01MB1770C9189BE24444BECCDC28C07F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB1770C9189BE24444BECCDC28C07F0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Nov 2019 10:20:34 +0100
Message-ID: <CAMuHMdXr00yvtdOkZ9JW2EZwWmT_hBiomvnU_sbCE9MyBKs8uA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: Repurpose lvds-encoder.c
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        Biju Das <biju.das@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Mon, Nov 4, 2019 at 11:42 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: Neil Armstrong <narmstrong@baylibre.com>
> > Sent: 04 November 2019 09:18
> > Subject: Re: [PATCH 1/4] drm/bridge: Repurpose lvds-encoder.c
> >
> > On 30/10/2019 14:43, Fabrizio Castro wrote:
> > > lvds-encoder.c implementation is also suitable for LVDS decoders,
> > > not just LVDS encoders.
> > > Instead of creating a new driver for addressing support for
> > > transparent LVDS decoders, repurpose lvds-encoder.c for the greater
> > > good.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > ---
> > >  drivers/gpu/drm/bridge/Kconfig        |   8 +-
> > >  drivers/gpu/drm/bridge/Makefile       |   2 +-
> > >  drivers/gpu/drm/bridge/lvds-codec.c   | 169 ++++++++++++++++++++++++++++++++++
> > >  drivers/gpu/drm/bridge/lvds-encoder.c | 155 -------------------------------
> > >  4 files changed, 174 insertions(+), 160 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/bridge/lvds-codec.c
> > >  delete mode 100644 drivers/gpu/drm/bridge/lvds-encoder.c
> > >
> > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > index 3436297..9e75ca4e 100644
> > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > @@ -45,14 +45,14 @@ config DRM_DUMB_VGA_DAC
> > >       Support for non-programmable RGB to VGA DAC bridges, such as ADI
> > >       ADV7123, TI THS8134 and THS8135 or passive resistor ladder DACs.
> > >
> > > -config DRM_LVDS_ENCODER
> > > -   tristate "Transparent parallel to LVDS encoder support"
> > > +config DRM_LVDS_CODEC
> >
> >
> > I'm not CCed on other patches, but I'm pretty sure you should fix other
> > Kconfig and defconfigs selecting this config in this patch to avoid breaking bisect.
>
> My understanding is that no defconfig and no other option refer directly to DRM_LVDS_ENCODER, do you mind being a little bit more specific here?

Sidenote: it looks like CONFIG_DRM_LVDS_ENCODER should have been enabled
in shmobile_defconfig since commits 381ddfe478871588 ("drm: rcar-du:
Hardcode encoders types to DRM_MODE_ENCODER_NONE") and 7160d57b6f81185c
("drm: bridge: lvds-encoder: Add thine,thc63lvdm83d compatible string"),
to support thine,thc63lvdm83d in arch/arm/boot/dts/r8a7779-marzen.dts?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
