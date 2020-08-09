Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89F1A240035
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Aug 2020 23:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgHIVoJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Aug 2020 17:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgHIVoJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Aug 2020 17:44:09 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9C2C061756;
        Sun,  9 Aug 2020 14:44:08 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id m200so4132401ybf.10;
        Sun, 09 Aug 2020 14:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AY8il3Wt49EokcoJKHZYjeimbzzjX5ulhSQxuFxM9VQ=;
        b=L+3X8gR120+/AszKDfAq8knBOg+qtogECisCO3G9vB8LxxEFyPISbzURj9LiksUG21
         G4WQ/vmbteeBB0VErwZNlAbFv6MDCDpVdA+yfyAYzGaydQDOhM2/VYhRFVGeMAt91bHk
         ovK8fqMmmhtGchqiDd8n5flhruvOOawqIV4CfZFOQHQPvbgrW6bXp5TrAEVE47/HfrLl
         4KlpeJqGVcNMYHCeljQ0wCHVshwIWKr/hmqqgwOtM4UAxT4PkCntFkLzGkPEyhQTi3gs
         pxwiDoOweJwFJQiYYTj75FT+pqcyfavxHi4jCU6eAedTtkMVe84bzAHEwUv4vN7wQKF3
         ncew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AY8il3Wt49EokcoJKHZYjeimbzzjX5ulhSQxuFxM9VQ=;
        b=L5e/RACZEDjpRJH7OTgJ/m/IN7ZsVB/aH+uLcECB+BFzRPDrR5Av1mqCdB+9U3Bt/P
         XAGLYYc4I7agGepTQODxSDf9B0i+pMky8pPUVcblGZ93nxGXl2PXWz17ihm14VFAdm1V
         sQE8bV5mjQWK/LJGJJhoQDWQ5/xxrto+yd5jcOcCr11alNaPPj36OdSyZ6w9WS6wQHuo
         MpvJvpRfWvow1ICUaEHh2979VwgrTZjEnPu1uuaLTYRkP2kcd8/8nfxbuqdXHqmOspDH
         W2I75b5y+YpRtO73yd3AUa9pZpm0Bm7ZlCfZJlclQQ/maUElI8z7YIb5p6kDwfqPMLHK
         26sg==
X-Gm-Message-State: AOAM530yLpUtt8CCaKZ4WGkY1RV52a+t47ZAqIAi69MP8jnuUydn3lVL
        TSiwVwgNXy+V7sTjoxGu53mNrTrK9oWTXYd6A+Q=
X-Google-Smtp-Source: ABdhPJxI4pCVKXBSAk81XQXXkNUql/V+LGhgpGXDjZGBg+PuJHyb/00tCJJ2MNhe9buIQ1Hrvof0VNq51l9Xprh9tdQ=
X-Received: by 2002:a5b:40f:: with SMTP id m15mr32241076ybp.25.1597009448057;
 Sun, 09 Aug 2020 14:44:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200808205543.GL6186@pendragon.ideasonboard.com>
In-Reply-To: <20200808205543.GL6186@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 9 Aug 2020 22:43:42 +0100
Message-ID: <CA+V-a8tisbiAuk6sVDokAjxwrLv1Xjkd6ydU_2haqtOKJucB2w@mail.gmail.com>
Subject: Re: [PATCH 0/7] r8a7742: Enable DU and LVDS
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

Thank you for the quick review.

On Sat, Aug 8, 2020 at 9:55 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patches.
>
> On Fri, Aug 07, 2020 at 06:49:47PM +0100, Lad Prabhakar wrote:
> > Hi All,
> >
> > This patch series adds support for DU and LVDS to r8a7742
> > SoC and enables LCD support on r8a7742-iwg21d-q7 board.
> >
> > This patch series applies on top of [1].
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
> >     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
>
> The driver changes will need to go through the DRM/KMS tree, and I'd
> recommend the DT binding changes to go the same route as well. I can
> handle the rebase when applying, and once the bindings get accept, you
> can ask Geert to upstream the last 3 patchs. Would that work for you ?
>
I'm OK with it as long as Geert is happy. (Fyi I still have bunch of
patches for G1H)

Cheers,
Prabhakar

> > Lad Prabhakar (7):
> >   dt-bindings: display: renesas,du: Document the r8a7742 bindings
> >   drm: rcar-du: Add r8a7742 support
> >   dt-bindings: display: renesas,lvds: Document r8a7742 bindings
> >   drm: rcar-du: lvds: Add r8a7742 support
> >   ARM: dts: r8a7742: Add DU support
> >   ARM: dts: r8a7742: Add LVDS support
> >   ARM: dts: r8a7742-iwg21d-q7: Add LCD support
> >
> >  .../bindings/display/bridge/renesas,lvds.txt  |  1 +
> >  .../bindings/display/renesas,du.txt           |  2 +
> >  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts       | 84 +++++++++++++++++
> >  arch/arm/boot/dts/r8a7742.dtsi                | 89 +++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  5 +-
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  1 +
> >  6 files changed, 180 insertions(+), 2 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
