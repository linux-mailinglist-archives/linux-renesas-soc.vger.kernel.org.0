Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A17E567282D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jan 2023 20:30:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbjARTaM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Jan 2023 14:30:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230079AbjARTaL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2023 14:30:11 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0A55411B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jan 2023 11:30:07 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id c3so7887673ljh.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jan 2023 11:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UnILwVyNd7xmIZc2IMFLzY42VBVipQZo7g1Qav7SDag=;
        b=ZbWuwZe3/miuIRNol6xbuMxnn2KqdPqG/kMD5o/wOm6hixX+LeIUn71ijzCdE8Fmav
         Ov8JPc849HnaOs1e+O0OMGpRm5TdNBzwztvRGsjkn8zQnz8BgMVYsttizTvqlPsh0VHp
         6EWjuhxFYbl1qqEyur/FWjQFpsceqajzP+oftyRcWquvKwePDGlMKKEjz2li7irVdNGk
         ttGd5UtUOq+RexdJxKyINOegNPb9IaVm5HkUAlgMmSQyT7pOgglCOJubW9hVmwuauBGo
         YyjKfoL/qEhCY8gONwZRDzCxlXmxW3sUkB4j/NqOg6Voc93U4Z6U8/DCEtNvIQANk0g9
         piKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UnILwVyNd7xmIZc2IMFLzY42VBVipQZo7g1Qav7SDag=;
        b=d4L6Oo6tNR5hXBGHj9xKfWB8hz+5/AwTiXqsqNX+lRB9l69RkbCDUk7ZRdJWKYjfBj
         nrHcEKkzr8GRqGhwvkZtmRpa/NsOdalnuaAS7jfIej+2v135mCHVE3vi9kvLKtVo5PCy
         RUIqSbQzbFsNs93AL7BqZ7uSA+xxChfgzK3misYo/luuY3sK9wrqn81LoxY4DLJvEkVE
         XuR6MXbnHpsnWhYeyQZp59rDRD5iH2hKZx9KleQw34VORBLIfZivUPceeoWViiDmkJvS
         DPEUJWnxLMa9J7ud86CKq1jB9SBB9Jxtiz3Cxm48lirCA/YlK0QZFRm9PUWQpsj+I1Qr
         vMNQ==
X-Gm-Message-State: AFqh2koT5DLclhLC2G9Dkd0ZmRat285dYAiKy8E6xk9Lb3S6PTFVlgEl
        ldr9OMiV3O6c6y028sZdXGJ2bnyP2+nDhyrN5nI=
X-Google-Smtp-Source: AMrXdXuY0QS3Tp1ei/71ka/uAgmv/R4GTdqfYumUyji7bn+iOotc99bi2/vp3H2DTLweO2TXaexuSCz37HwCPUuCzU4=
X-Received: by 2002:a2e:9c57:0:b0:28b:7bbf:2892 with SMTP id
 t23-20020a2e9c57000000b0028b7bbf2892mr736163ljj.433.1674070205750; Wed, 18
 Jan 2023 11:30:05 -0800 (PST)
MIME-Version: 1.0
References: <20230108060401.391061-1-pbrobinson@gmail.com> <Y8hFiZVPi8XCRPxa@pendragon.ideasonboard.com>
In-Reply-To: <Y8hFiZVPi8XCRPxa@pendragon.ideasonboard.com>
From:   Peter Robinson <pbrobinson@gmail.com>
Date:   Wed, 18 Jan 2023 19:29:54 +0000
Message-ID: <CALeDE9Nft3vbQAoaQYf6RO=NPWGeZs2Z-sgcWQNmWzjeLqYirQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm: rcar-du: depend on DRM_RCAR_DU for components on
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

On Wed, Jan 18, 2023 at 7:16 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Peter,
>
> Thank you for the patch.
>
> On Sun, Jan 08, 2023 at 06:04:01AM +0000, Peter Robinson wrote:
> > There's a few components in the rcar-du drm directory that
> > don't make sense to be selectable if DRM_RCAR_DU isn't because
> > they are part of the IP block so add a dependency and add
> > compile check to ensure they're still tested.
> >
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> > ---
> >
> > v2:
> > - typo fix in commit message
> > - s/ARCH_RENESAS/DRM_RCAR_DU
> >
> >  drivers/gpu/drm/rcar-du/Kconfig | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > index b2bddbeca878..362fb6099e9f 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -25,6 +25,7 @@ config DRM_RCAR_CMM
> >  config DRM_RCAR_DW_HDMI
> >       tristate "R-Car Gen3 and RZ/G2 DU HDMI Encoder Support"
> >       depends on DRM && OF
> > +     depends on DRM_RCAR_DU || COMPILE_TEST
>
> How about dropping COMPILE_TEST ? DRM_RCAR_DU itself has
>
>         depends on ARCH_RENESAS || COMPILE_TEST
>
> so if COMPILE_TEST is set we'll be able to test these drivers when
> DRM_RCAR_DU is enabled. Same below.
>
> I can update this when taking the patch in my tree, there's no need to
> send a v3.

Works for me! Thanks

> >       select DRM_DW_HDMI
> >       help
> >         Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
> > @@ -32,6 +33,7 @@ config DRM_RCAR_DW_HDMI
> >  config DRM_RCAR_USE_LVDS
> >       bool "R-Car DU LVDS Encoder Support"
> >       depends on DRM_BRIDGE && OF
> > +     depends on DRM_RCAR_DU || COMPILE_TEST
> >       default DRM_RCAR_DU
> >       help
> >         Enable support for the R-Car Display Unit embedded LVDS encoders.
> > @@ -45,6 +47,7 @@ config DRM_RCAR_LVDS
> >  config DRM_RCAR_USE_MIPI_DSI
> >       bool "R-Car DU MIPI DSI Encoder Support"
> >       depends on DRM_BRIDGE && OF
> > +     depends on DRM_RCAR_DU || COMPILE_TEST
> >       default DRM_RCAR_DU
> >       help
> >         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
>
> --
> Regards,
>
> Laurent Pinchart
