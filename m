Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3E7A66139A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Jan 2023 05:51:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbjAHEvH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 7 Jan 2023 23:51:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229745AbjAHEvH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Jan 2023 23:51:07 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02D41A23D
        for <linux-renesas-soc@vger.kernel.org>; Sat,  7 Jan 2023 20:51:01 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id s25so5567632lji.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 Jan 2023 20:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I2Zzn4ApGlRGrmRfQkLTkwb2Z8A7POpE/5KfqxDRud8=;
        b=i8LqaqBEFPGeEPjX7CtjsGizANC5gohDb+WmPIMvi5XmpIa6EEROvU/LPqn5ToqoMO
         bQ1fohMNSQvGnc8NZ8kPiQUPSBJzwXc1oV5P38+wEZwVVMQAvOLn4WiFvmU4ZdNEvpM9
         YRRus1GXW/UuV4Jc4Q0LxLiPzsQxIvelmBV5+bjmSmWLhlifmyN+FUhWUgubGBxS4HLZ
         JQKhYIrhGL+QB9cRU1GuKPvPHOPzShGMDAeY8kAa2OgK6HNLXaBVUyBJ+5F3JvfsiRdi
         r2aFBsonnuaiDl05Jnpe9ANd29eFBT8SPQnuJl/WGK+YmSc6+4l6+q/3nRmGOVf5sZOE
         GXOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I2Zzn4ApGlRGrmRfQkLTkwb2Z8A7POpE/5KfqxDRud8=;
        b=7pVDvwbyVwpoasKolgriFnoHgTyqSTeefOw0aQXqLodecWp+XrcE9YwVs788MdZOB+
         4W4/XvNuvmSfTC1qKIrk3W0yKp19I9kStIgvLJpLeSbVPGEatMRumnLU22bz969J8ROy
         m3wPrt1ofRVpb4ZRGJ8hinhy1/bUaFRhwB/EyAtgnLND4z0GMKOjO4qHsxj6VT3V5X01
         FbHmbj1MCK5uGCiDrQ1thTc8dvv64Kk1b+S6ZSVm4PWmNTzM4qlpxEL7OzjxzJQLCbvJ
         bN7oQ5HftUZHIj06qh3NUBqxCVbzf4zZWzhTgwkW5zvKRwhHRhLI/4Z1s4HLGJNWESuG
         o/oQ==
X-Gm-Message-State: AFqh2krR4SH2KQ2OBJ8PsKfpkw9Q1KCPWkDt5v8GDvhWVKLfComzt25l
        Hai1apVEchoVGXxeM9cnoB/5/TqJ5KaKiMAP+wQ=
X-Google-Smtp-Source: AMrXdXs7Vx7He4kItXJYZHGHkTfEsQmad+r++6ozgDJwMiLF/oKRQHBS4UM/XQVzKj4qEbBnJ5R4Nb7bApZ9NX8y6Go=
X-Received: by 2002:a2e:bc13:0:b0:27f:ecef:bec2 with SMTP id
 b19-20020a2ebc13000000b0027fecefbec2mr1042952ljf.97.1673153460116; Sat, 07
 Jan 2023 20:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20230108043147.346349-1-pbrobinson@gmail.com> <Y7pKUfdYSR6IDW7A@pendragon.ideasonboard.com>
In-Reply-To: <Y7pKUfdYSR6IDW7A@pendragon.ideasonboard.com>
From:   Peter Robinson <pbrobinson@gmail.com>
Date:   Sun, 8 Jan 2023 04:50:48 +0000
Message-ID: <CALeDE9NV8WctWcFMuW4nqwi-piane-YWxidCWjjaZ3XJEXSTXw@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: depend on ARCH_RENESAS for components on
 that SoC
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

> Thank you for the patch.
>
> On Sun, Jan 08, 2023 at 04:31:47AM +0000, Peter Robinson wrote:
> > There's a few components in the rcar-du drm directory that
> > don't make sense to be slectedable if ARCH_RENESAS isn't because
>
> s/slectedable/selectable/
>
> > they are part of those SoCs so add a dependency and add compile
> > check to ensure they're still tested.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > index b2bddbeca878..4d2bff78a559 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -25,6 +25,7 @@ config DRM_RCAR_CMM
> >  config DRM_RCAR_DW_HDMI
> >       tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
> >       depends on DRM && OF
> > +     depends on ARCH_RENESAS || COMPILE_TEST
>
> As this module isn't useful without the DU driver, wouldn't it be better
> to add a dependency on DRM_RCAR_DU, which itself already depends on
> ARCH_RENESAS || COMPILE_TEST ? Same for the other two below.

I had considered both options but as I suspected that it would have at
least been compile tested by I wasn't 100% sure of the dependency
within the actually SoC as I don't really know the HW but I am happy
to go that route too.

Also the DRM_RCAR_USE_ options seem a little weird too the
DRM_RCAR_USE_MIPI_DSI vs just using DRM_RCAR_MIPI_DSI, seems like
extra logic just in the Kconfig that provides little, but ultimately
that bit doesn't affect me overall.

Will do a v2

Peter

> >       select DRM_DW_HDMI
> >       help
> >         Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
> > @@ -32,6 +33,7 @@ config DRM_RCAR_DW_HDMI
> >  config DRM_RCAR_USE_LVDS
> >       bool "R-Car DU LVDS Encoder Support"
> >       depends on DRM_BRIDGE && OF
> > +     depends on ARCH_RENESAS || COMPILE_TEST
> >       default DRM_RCAR_DU
> >       help
> >         Enable support for the R-Car Display Unit embedded LVDS encoders.
> > @@ -45,6 +47,7 @@ config DRM_RCAR_LVDS
> >  config DRM_RCAR_USE_MIPI_DSI
> >       bool "R-Car DU MIPI DSI Encoder Support"
> >       depends on DRM_BRIDGE && OF
> > +     depends on ARCH_RENESAS || COMPILE_TEST
> >       default DRM_RCAR_DU
> >       help
> >         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
>
> --
> Regards,
>
> Laurent Pinchart
