Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F223C5F28F0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Oct 2022 09:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbiJCHCO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Oct 2022 03:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiJCHBx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 03:01:53 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3C233E38
        for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Oct 2022 00:01:52 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id de14so6327649qvb.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Oct 2022 00:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Mzq8GUPXLj/qJn76tNsIRQ6nN87ZuT/aWLrknBlMx3w=;
        b=zQQNJ4wQxIlU4f/qcEm6p9oTJwBOlAnD4N668+bKc0Cb7LnPWucf7ZCX389IUnm9z/
         p+ukpDP6RbEKgspIdjPEg/YJzZt7Tl7RIQMJaBaXZ9KIyle8GOgjS2GuxrJR3N/cL9ub
         UvDxggQ81SQrNEuYvnDS1/sgubE0fFXEy9egaIXaTD+vmtfZyvbQnZ7a9Rn0dw60EQO2
         nDgQT/FB1lPQQxMZ80osxe7uIaAJ6gZLDPrkwhROkAE1W/b1LpoHoPSnzyKEX0Fz6jOx
         700aqlaKt3eETSd8A8G6hkHbCUO7bq43W+yXvY3ELOmk9eC7TgmXgDWMv/XwXk8d/jrT
         0pHw==
X-Gm-Message-State: ACrzQf0POpspa6NY10euvzAsPd/qk0tc16Pnh9vBbqX7njc4OQvuI4Sg
        MVgSrVCdaIQUW26YTy9PNg+vnepDg+4q/Q==
X-Google-Smtp-Source: AMsMyM4lQYv1hwxs3zYob0u5bgigXvYlb/nmY34cjeTLFha0PjrXJHah7Ykc7i3U9WtbVN4xSR0MYg==
X-Received: by 2002:a05:6214:acf:b0:4b1:8ee9:8071 with SMTP id g15-20020a0562140acf00b004b18ee98071mr2559791qvi.114.1664780511080;
        Mon, 03 Oct 2022 00:01:51 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id v11-20020a05620a0f0b00b006bb366779a4sm10870677qkl.6.2022.10.03.00.01.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 00:01:50 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-353fbfa727cso97655357b3.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Oct 2022 00:01:50 -0700 (PDT)
X-Received: by 2002:a81:a24e:0:b0:358:934b:980c with SMTP id
 z14-20020a81a24e000000b00358934b980cmr6493790ywg.383.1664780510447; Mon, 03
 Oct 2022 00:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com> <b1425f66-29cf-ce13-fe29-895cd2140c77@ideasonboard.com>
In-Reply-To: <b1425f66-29cf-ce13-fe29-895cd2140c77@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Oct 2022 09:01:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUV7TY=mfTS6ShOqPbT8JAC-nQFmUWdsyGtP86Op+0SaQ@mail.gmail.com>
Message-ID: <CAMuHMdUV7TY=mfTS6ShOqPbT8JAC-nQFmUWdsyGtP86Op+0SaQ@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix Kconfig dependency between RCAR_DU and RCAR_MIPI_DSI
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

On Mon, Oct 3, 2022 at 8:56 AM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
> On 02/10/2022 01:03, Laurent Pinchart wrote:
> > When the R-Car MIPI DSI driver was added, it was a standalone encoder
> > driver without any dependency to or from the R-Car DU driver. Commit
> > 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence") then
> > added a direct call from the DU driver to the MIPI DSI driver, without
> > updating Kconfig to take the new dependency into account. Fix it the
> > same way that the LVDS encoder is handled.
> >
> > Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >   drivers/gpu/drm/rcar-du/Kconfig | 13 +++++++++----
> >   1 file changed, 9 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > index c959e8c6be7d..fd2c2eaee26b 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -44,12 +44,17 @@ config DRM_RCAR_LVDS
> >       select OF_FLATTREE
> >       select OF_OVERLAY
> >
> > +config DRM_RCAR_USE_MIPI_DSI
> > +     bool "R-Car DU MIPI DSI Encoder Support"
> > +     depends on DRM_BRIDGE && OF
> > +     default DRM_RCAR_DU
> > +     help
> > +       Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> > +
> >   config DRM_RCAR_MIPI_DSI
> > -     tristate "R-Car DU MIPI DSI Encoder Support"
> > -     depends on DRM && DRM_BRIDGE && OF
> > +     def_tristate DRM_RCAR_DU
> > +     depends on DRM_RCAR_USE_MIPI_DSI
> >       select DRM_MIPI_DSI
> > -     help
> > -       Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> >
> >   config DRM_RCAR_VSP
> >       bool "R-Car DU VSP Compositor Support" if ARM
> >
> > base-commit: 7860d720a84c74b2761c6b7995392a798ab0a3cb
>
> Interesting dependency issue. Took me a while to understand it =).
>
> But is there a reason to not have "depends on DRM_RCAR_DU" for
> DRM_RCAR_USE_MIPI_DSI and DRM_RCAR_USE_LVDS? Now the menu items are
> available even if RCAR_DU is n. That's also the case for
> DRM_RCAR_DW_HDMI, but I'm not sure if that's supposed to be usable even
> without RCAR_DU.

See
https://lore.kernel.org/linux-renesas-soc/cover.1639559338.git.geert+renesas@glider.be/

Didn't get to implement the suggested improvements yet...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
