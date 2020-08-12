Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB10242D89
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Aug 2020 18:44:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgHLQoO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Aug 2020 12:44:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbgHLQoM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Aug 2020 12:44:12 -0400
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com [IPv6:2607:f8b0:4864:20::b44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD498C061384;
        Wed, 12 Aug 2020 09:44:11 -0700 (PDT)
Received: by mail-yb1-xb44.google.com with SMTP id g3so1719498ybc.3;
        Wed, 12 Aug 2020 09:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h2iquYo34B24ccVUFjjX9GsDTrAUF6/oZpH0oyCN98k=;
        b=eAMwB444A71l/cRUbD+Ov6X2M+XLfE3j2RwNgbktlSyqQRE98GrEcb8TF9WsarUwwr
         yoGMZUx3D+FSQbXcd4kFQytbcovydWsAdggBYrAJzlVEcQzKVNfHRAy1oUyEubVhxUIH
         qVVNEGopSMBuCfjO9qAwJ2Sd7A7D5evaTKOJMOsoUcTADVuA+eNbBvv4nId8gjcYdC2s
         PEKQhxE/fcN+iN8bg7ayC76b5AQ93ysEqLxXLDpzE0Bmn4qC76LjwOn4kIIVOF2okU4L
         Lo978xVQOdnQyO74JMHnE8yRQ8mBle1p/BaK2Ki/Zx4BYtUXGygtgLn+Bsz3OX1vI+Cx
         MDvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h2iquYo34B24ccVUFjjX9GsDTrAUF6/oZpH0oyCN98k=;
        b=hyEH9tJgi6/uRH8QpQeLWsnSvCVdevDsYVRZGHbzXSt1GxSfbxwuhAuqR56qv+qTC1
         9vm0Sn5jvDIjiOdmUlMmK6OICYNPKKXFMu02S57zRaModlJmyKJ6wMQPVAQdFzu++Wvl
         nGYowB9ZSy7k5KKdv8HYDOUc7Wx0v0Wpg/FdaIi2vOXto88Uuut7XvUxW1Vjc0+dK6zL
         Nny8fBPYxb+Bwjfzi362mELMs0AEdJHiarRa0gI1f6AaStw23iYeQjUAx9MKud9XQP+D
         alc0ehltSVxxmDXMueVp0GKf3lAlk9GxWwl2q5V7j9xkQ5SI6XHETgSCJT1pVLvPECDf
         pdpg==
X-Gm-Message-State: AOAM5336yRBMN8n667Jot5JDqWAEw+YifnKZ7LXeRBhoDdAO072G/8oD
        vHVTNmpAvgNmpnQDbUcJuQaii7RHxdFmV2u8vzg=
X-Google-Smtp-Source: ABdhPJxyQDmaRXdOzNXEYlfOCuSoxFSZaPeNK9+n9dM0SkJ0H7uMGBBt+8dZSyB8CYaVvKi2NFKSJCZQ3UbnYVl7EaE=
X-Received: by 2002:a5b:40f:: with SMTP id m15mr305211ybp.25.1597250650957;
 Wed, 12 Aug 2020 09:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200812163855.GU6057@pendragon.ideasonboard.com>
In-Reply-To: <20200812163855.GU6057@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 12 Aug 2020 17:43:44 +0100
Message-ID: <CA+V-a8uCuttdzdv7enetaxrXZJ2rkr-6OHZ7uXcQi1tCp9Cbxw@mail.gmail.com>
Subject: Re: [PATCH 0/9] r8a774e1 add support for DU, HDMI and LVDS
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Wed, Aug 12, 2020 at 5:39 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patches.
>
> On Wed, Aug 12, 2020 at 03:02:08PM +0100, Lad Prabhakar wrote:
> > Hi All,
> >
> > This patch series adds support for DU, HDMI and LVDS to RZ/G2H SoC.
>
> I have added patches 1/9, 2/9, 4/9, 5/9 and 7/9 to my tree. I expect
> Geert to handle the rest.
>
Thank you for the review and taking care of LVDS documentation binding patch.

Cheers,
Prabhakar

> > Lad Prabhakar (1):
> >   arm64: dts: renesas: r8a774e1-hihope-rzg2h: Setup DU clocks
> >
> > Marian-Cristian Rotariu (8):
> >   dt-bindings: display: renesas,du: Document r8a774e1 bindings
> >   drm: rcar-du: Add support for R8A774E1 SoC
> >   arm64: dts: renesas: r8a774e1: Populate DU device node
> >   dt-bindings: display: renesas,lvds: Document r8a774e1 bindings
> >   dt-bindings: display: renesas,dw-hdmi: Add r8a774e1 support
> >   arm64: dts: renesas: r8a774e1: Populate HDMI encoder node
> >   drm: rcar-du: lvds: Add support for R8A774E1 SoC
> >   arm64: dts: renesas: r8a774e1: Add LVDS device node
> >
> >  .../display/bridge/renesas,dw-hdmi.txt        |  1 +
> >  .../bindings/display/bridge/renesas,lvds.txt  |  1 +
> >  .../bindings/display/renesas,du.txt           |  2 +
> >  .../dts/renesas/r8a774e1-hihope-rzg2h.dts     | 11 ++++
> >  arch/arm64/boot/dts/renesas/r8a774e1.dtsi     | 61 ++++++++++++++++++-
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c         | 30 +++++++++
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c           |  1 +
> >  7 files changed, 104 insertions(+), 3 deletions(-)
>
> --
> Regards,
>
> Laurent Pinchart
