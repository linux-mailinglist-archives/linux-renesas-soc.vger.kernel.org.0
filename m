Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620EC1DE490
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 May 2020 12:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728623AbgEVKg4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 May 2020 06:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728362AbgEVKg4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 May 2020 06:36:56 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3292C061A0E;
        Fri, 22 May 2020 03:36:55 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id m6so10206038ilq.7;
        Fri, 22 May 2020 03:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S9mNXQGxYRI6qULQw9Ylvem2CGTTDqLbr/fEXVEpF4U=;
        b=vd4VYINYuEVdmUQvHlTA9KXdDm9DE/zeNAYpOQv75fwt4OmH/SIAObjGaEBV4RxvZz
         q6i66VQgCbwB2DJnpkEs3CNS44zpx0/PzCDxw+TMIy0QqPe/1Vb9Qtz+UKk3APYhG57W
         0iTd/hJBqukptHPRhJKJwFSc7T8wM0FpEmbg6I6kTzq+aeXPRSzbG/9VmyhLf821lJYv
         r3xmT/IG4xyoBXd8AFUfyLhmGkOuqCvdk90pwWNRlm08GL4a15VsChynvxCw55pjfyQo
         wbiCGX/jvpdtkVcZHfD2F6GQ+KJBLXyqJ7b3XSsKGprTz+kBwt26Bme5bvOjKtZPhW2q
         gqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S9mNXQGxYRI6qULQw9Ylvem2CGTTDqLbr/fEXVEpF4U=;
        b=b7GjcjFB72QqWBYVJyLpGixUwi7R7wY604c+wrCfUFm56HL4HV3tzdZ94D/pQ2Dbg/
         3mN/vVlsaS+jG8JLdr2TtVfYmy7AWVQztZuQ+ooj4BKT5cwpH2CrV3fND9cxENnIlq0W
         oezIOPDcUEO/YIm8tgoULpGM9+loiB9A66ctMCcwQ38Kdh1ZJUT7+TrUMi2cRvf0qYX6
         kfCPeW9iPe6/bcglQwxSRzwpOP3LoPNGzyvjgcUweW2t9AdCYNp0u0esWTuoOqC2pTgt
         hEehaverP17cKYeIuGBBMYarObujkQv/jOzorRvJ9Ifs+yx3kbS22pLAPigLe8QN2gUP
         pVug==
X-Gm-Message-State: AOAM533Gb4MxEnYmqSZBxVeBKR8z3YJMS8sNE2JAn8ruaghYGbICo4wH
        Ix+3tIrt/kCMfjjfMZSyPVxJtk3pJP9G3wjtJYzIdkRL
X-Google-Smtp-Source: ABdhPJx0XAiW7gALipTyOEYHcUb8snFaOYG31JH89mxDkIvzBtiW7XAO+lC0bUVICWp15csuijP3fwq29n6skZcb3/g=
X-Received: by 2002:a92:ca84:: with SMTP id t4mr10176899ilo.276.1590143815240;
 Fri, 22 May 2020 03:36:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200518201646.48312-1-dagmcr@gmail.com> <73d98905-930d-3549-1a85-293f4d213716@ideasonboard.com>
In-Reply-To: <73d98905-930d-3549-1a85-293f4d213716@ideasonboard.com>
From:   Daniel G <dagmcr@gmail.com>
Date:   Fri, 22 May 2020 12:36:44 +0200
Message-ID: <CAPsT6hk=3Z2nwGW=WdxB7UVwvOVMdiZ1oVdR_Xb4kqXpQ8jC5w@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix build error
To:     kieran.bingham+renesas@ideasonboard.com
Cc:     Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
        laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran and Emil,

On Fri, 22 May 2020 at 11:43, Kieran Bingham
<kieran.bingham+renesas@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> On 18/05/2020 21:16, Daniel Gomez wrote:
> > Select DRM_KMS_HELPER dependency.
> >
> > Build error when DRM_KMS_HELPER is not selected:
> >
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd48): undefined reference to `drm_atomic_helper_bridge_duplicate_state'
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd50): undefined reference to `drm_atomic_helper_bridge_destroy_state'
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xd70): undefined reference to `drm_atomic_helper_bridge_reset'
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xdc8): undefined reference to `drm_atomic_helper_connector_reset'
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xde0): undefined reference to `drm_helper_probe_single_connector_modes'
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe08): undefined reference to `drm_atomic_helper_connector_duplicate_state'
> > drivers/gpu/drm/rcar-du/rcar_lvds.o:(.rodata+0xe10): undefined reference to `drm_atomic_helper_connector_destroy_state'
> >
>
> Looking at the files in rcar_du that utilise drm_atomic_helpers...
>
> git grep -l drm_atomic_helper_ drivers/gpu/drm/rcar-du/
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c
>  drivers/gpu/drm/rcar-du/rcar_du_writeback.c
>  drivers/gpu/drm/rcar-du/rcar_lvds.c
>
> of those, these are configurable:
>
>  rcar_du_vsp.c          # DRM_RCAR_VSP
>  rcar_du_writeback.c    # DRM_RCAR_WRITEBACK
>  rcar_lvds.c            # DRM_RCAR_LVDS
>
> But VSP and WRITEBACK are already implicitly dependant upon DRM_RCAR_DU
> because they get built into the DU module.
>
> So indeed, only the RCAR_LVDS is a separate module, using those helpers,
> so I think a select is a reasonable fix.
>
> I would also ask whether DRM_RCAR_LVDS should depend upon DRM_RCAR_DU
> though as well.
>
> There is no linkage requirement, as it's a standalone bridge driver from
> what I can see, but I don't think it serves much purpose without the DU?

I have actually spotted when using arch/arm/configs/multi_v7_defconfig where
DRM_RCAR_DU is built as module. But when I was reviewing it I was able to
compile RCAR_LVDS=y with DRM_RCAR_DU=n. Also, according to
https://patchwork.kernel.org/patch/10159063/, the LVDS encoders used to be
described as part of the DU but not after the patch. So, I assume it can
be used without the DU but not completely sure.

>
> Anyway, even if it's just for compile testing maybe, the select here
> should be fine.
>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> > Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > index 0919f1f159a4..f65d1489dc50 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -31,6 +31,7 @@ config DRM_RCAR_DW_HDMI
> >  config DRM_RCAR_LVDS
> >       tristate "R-Car DU LVDS Encoder Support"
> >       depends on DRM && DRM_BRIDGE && OF
> > +     select DRM_KMS_HELPER
> >       select DRM_PANEL
> >       select OF_FLATTREE
> >       select OF_OVERLAY
> >
>
