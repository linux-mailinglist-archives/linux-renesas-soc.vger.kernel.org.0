Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 47A241DF66B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 23 May 2020 11:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725270AbgEWJio (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 23 May 2020 05:38:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725268AbgEWJin (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 23 May 2020 05:38:43 -0400
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com [IPv6:2607:f8b0:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7E04C061A0E;
        Sat, 23 May 2020 02:38:43 -0700 (PDT)
Received: by mail-il1-x141.google.com with SMTP id 17so13250225ilj.3;
        Sat, 23 May 2020 02:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ySOv5RFCOhNktqRnSUecG+h4XEMSSgtZIHTThacyrl4=;
        b=ZXyua9PiZh0B75CZ+wJJFbfRSHWNfEdmJG5gqb7VI4LU8BqFGnO8YgcvZZ0GAqcGjE
         KX+7b/V+awdlA48iOHjoSHYEiSgeqyhJVm9gaxlql1bRKv8Oz5DRsnTXZ43I65wYqPLK
         uWfkCx8oLLmUTWwYp6k8iCRtST2/u1tPVai3/4A1wyZBozQ0VNpEz99/9QjjcQVXM2QR
         P2+pYH4LqpepHkBrWOU+EzHTPfW42I+705YQv/OXS1POu52dVPCOQFN7btxk8VOkckse
         qCIXdqbsJuxDTw1PBbV6S3chJbH1DoEPjZGJzUkSr4As3rhhvWx+HcNkR6xmSO1tVCtq
         J8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ySOv5RFCOhNktqRnSUecG+h4XEMSSgtZIHTThacyrl4=;
        b=Zt+kLUZnXSjOFzLfF4P5R3r+0+0WY3y76Kh5VC+Y13Grp9AZd1ellYXjFeCukTpkMN
         KFDMNTjSGa/sds3LWxaQthQwMQzwEzeAFF6grCyexl0ZL9PV+ZdoIpVV+ebzhPC0qCzC
         2cGSfhwrUjQXHCIfBw3++EK5cKWI0RjVmuj4x6rbXciGIxcF9UVUAp5fFhTloABTcOs8
         qUjBmpxzyhh0aQPR72GOmzqa0XZyG4lGAudbYmuV3m5cur8+xNlPuyXip4DJ+Tnh01Kw
         OnXt9frruHOsa/cowp75X0TbnRJdOimkG6gKEYC3EfTrMvOJ4n1HjzzGmH1OrWAHIaQh
         C9Qw==
X-Gm-Message-State: AOAM530gEvTADSD/VAZsp52AsDXdc56SK0rB8S7u44bQshlrhrMTKWOe
        sQx5D8ZBndt/hjL7al7/x1fbKtRmB1SPQYiiJ5A=
X-Google-Smtp-Source: ABdhPJxgpTkyq+JCvO/9xevE2z4ZZX7u3mZjbSC4yXtpeOEmIaWlllSlL5fpKL/h6v2R/KBjV/68cLBWj/+cHclL77w=
X-Received: by 2002:a92:5dd2:: with SMTP id e79mr15635058ilg.94.1590226723047;
 Sat, 23 May 2020 02:38:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200518201646.48312-1-dagmcr@gmail.com> <20200522202349.GF5824@pendragon.ideasonboard.com>
In-Reply-To: <20200522202349.GF5824@pendragon.ideasonboard.com>
From:   Daniel G <dagmcr@gmail.com>
Date:   Sat, 23 May 2020 11:38:32 +0200
Message-ID: <CAPsT6hmddjW3m3OMkkAT1djTTtijepTu_N22eCgOGhGHxPQcaA@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix build error
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>, airlied@linux.ie,
        kieran.bingham+renesas@ideasonboard.com,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Fri, 22 May 2020 at 22:24, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Daniel,
>
> Thank you for the patch.
>
> On Mon, May 18, 2020 at 10:16:46PM +0200, Daniel Gomez wrote:
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
Fixes: c6a27fa41fab ("drm: rcar-du: Convert LVDS encoder code to bridge driver")
> > Signed-off-by: Daniel Gomez <dagmcr@gmail.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> and taken in my tree for v5.9. If you think it should get in v5.8 as a
> fix, I can do so as well, could you then provide a Fixes: tag ?
That would be fine. You can find above the fixes tag.
Thanks!

>
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
>
> --
> Regards,
>
> Laurent Pinchart
Daniel
