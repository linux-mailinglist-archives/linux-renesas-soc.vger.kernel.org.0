Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E477462833B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 15:52:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236387AbiKNOwe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 09:52:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236646AbiKNOwd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 09:52:33 -0500
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5BE22B2C
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 06:52:32 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id d7so5108757qkk.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 06:52:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3f1ub61Lsc6VCL4sa5BHifRavrKJ4212Dao8WWbZ+4g=;
        b=QRrIwEtsOEIow2uDsUOx9yKtvifrHpRX6Mdamm8FV8w7iQ/z7567Bws5N35Isc5rAC
         S0cVe3apB0ruiUs1nxcf1iHE6YfaaYZXDxDpui6ru85kjgraRScCYnnx+mebaWiutEb/
         slokqVFzn+5Elks7HdCY89Z9um67Nhcnejq83k6rIL/OHRe+KjxksO6w0Lc0wV+NPb4q
         sQIwreqxqs7bk+ZqcRkCq2a4BuUX3JkA8Mh/kjzm83ygVPKyA2XlHPBEIUZXUEbinIw/
         402O6Cvgd8yGzUp0CW3eTk6qb/57mIliWCziOMGIArtgJL5E5A3zLElBH0WPhok2MG+3
         10sg==
X-Gm-Message-State: ANoB5pkMjmFkCYtBL7XuxqYuczua6JhnykEbubyIoKEizrW2VwWdoHJ+
        +47ux5/CMbLWGvX93qtOFam8OrETqfxTew==
X-Google-Smtp-Source: AA0mqf5rg6GNCB0P4HtPIK7ae2oYYH/nFGyv5Nqvg2BGcuzGQByK4l/8nTW3lcmaw/98RRRbNh7bIA==
X-Received: by 2002:ae9:ef54:0:b0:6ed:75c5:777b with SMTP id d81-20020ae9ef54000000b006ed75c5777bmr11847339qkg.333.1668437551377;
        Mon, 14 Nov 2022 06:52:31 -0800 (PST)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id f16-20020a05620a409000b006bb78d095c5sm6617199qko.79.2022.11.14.06.52.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 06:52:31 -0800 (PST)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-3691e040abaso108245637b3.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 06:52:30 -0800 (PST)
X-Received: by 2002:a0d:dd81:0:b0:373:6180:dae5 with SMTP id
 g123-20020a0ddd81000000b003736180dae5mr12698961ywe.283.1668437550556; Mon, 14
 Nov 2022 06:52:30 -0800 (PST)
MIME-Version: 1.0
References: <20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWeZBzFM2Q8sLEqe_DfD74a1K+5qcPHADZnPfrQYqVXrg@mail.gmail.com> <Y3JO9NmEpS19Rt3D@pendragon.ideasonboard.com>
In-Reply-To: <Y3JO9NmEpS19Rt3D@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Nov 2022 15:52:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW80d1MSJbU8qFRYTwCaJVyyxiQrVykpuf9wYys8V6Hxw@mail.gmail.com>
Message-ID: <CAMuHMdW80d1MSJbU8qFRYTwCaJVyyxiQrVykpuf9wYys8V6Hxw@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix Kconfig dependency between RCAR_DU and RCAR_MIPI_DSI
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

 Hi Laurent,

On Mon, Nov 14, 2022 at 3:22 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Mon, Nov 14, 2022 at 10:05:58AM +0100, Geert Uytterhoeven wrote:
> > On Sun, Oct 2, 2022 at 12:06 AM Laurent Pinchart wrote:
> > > When the R-Car MIPI DSI driver was added, it was a standalone encoder
> > > driver without any dependency to or from the R-Car DU driver. Commit
> > > 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence") then
> > > added a direct call from the DU driver to the MIPI DSI driver, without
> > > updating Kconfig to take the new dependency into account. Fix it the
> > > same way that the LVDS encoder is handled.
> > >
> > > Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >
> > Thanks for your patch, which is now commit a830a15678593948
> > ("drm: rcar-du: Fix Kconfig dependency between RCAR_DU
> > and RCAR_MIPI_DSI") in v6.1-rc5.
> >
> > > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > > @@ -44,12 +44,17 @@ config DRM_RCAR_LVDS
> > >         select OF_FLATTREE
> > >         select OF_OVERLAY
> > >
> > > +config DRM_RCAR_USE_MIPI_DSI
> > > +       bool "R-Car DU MIPI DSI Encoder Support"
> > > +       depends on DRM_BRIDGE && OF
> > > +       default DRM_RCAR_DU
> >
> > This means this driver is now enabled by default on systems that do not
> > have the MIPI DSI Encoder (e.g. R-Car Gen2), and that we should probably
> > disable it explicitly in shmobile_defconfig.  Is that intentional?
>
> I don't think so, no. Would you like to send a patch ? If so, it should
> enable the option in relevant defconfig files.

You mean just drop the "default DRM_RCAR_DU" here?

I'm wondering if we can solve this in a consistent way.
Currently we have:

    config DRM_RCAR_USE_CMM default DRM_RCAR_DU
    config DRM_RCAR_DW_HDMI default n
    config DRM_RCAR_USE_LVDS default DRM_RCAR_DU
    config DRM_RCAR_MIPI_DSI default n
    config DRM_RCAR_VSP default y if ARM64

HDMI is only used on R-Car Gen3 parts
MIPI_DSI is only used on R-Car Gen4 parts
LVDS is used on R-Car Gen2 and Gen3 parts

Thoughts?

> > > +       help
> > > +         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> > > +
> > >  config DRM_RCAR_MIPI_DSI
> > > -       tristate "R-Car DU MIPI DSI Encoder Support"
> > > -       depends on DRM && DRM_BRIDGE && OF
> > > +       def_tristate DRM_RCAR_DU
> > > +       depends on DRM_RCAR_USE_MIPI_DSI
> > >         select DRM_MIPI_DSI
> > > -       help
> > > -         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> > >
> > >  config DRM_RCAR_VSP
> > >         bool "R-Car DU VSP Compositor Support" if ARM

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
