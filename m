Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0571A23FFFC
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Aug 2020 22:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgHIUid (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Aug 2020 16:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726323AbgHIUid (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Aug 2020 16:38:33 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12BC6C061756;
        Sun,  9 Aug 2020 13:38:32 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id s195so2661326ybc.8;
        Sun, 09 Aug 2020 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2kAXaCbVRwpQJ/QcWFbP9jMZCECl1RbYXm9sxJ41L1E=;
        b=saVBVhYh18DoSp1a1uNYqKqMnvq5nycV1cbYPmydXPtibPN2hPwlpJuu0qO+epIXxj
         ZICiYPxBKlUmrg8MTG+aAEv5NvlQhlLRkVS0K5FB0IsAyBZUINOPYtMbwuD78yx5fS8b
         Xr7Q/njziaFDfh+Cr1xTeIQUOVMlRu4W27IzVpRZ43N0nQ2Sv6G7/IFtDGOGJ/H5h9nz
         5kSFRazOBiYJx4IdWZlzcBk0dHIAjP1FncvqouY6GfsRi9HZ8IbS1GsJX4wLAWHr13Fj
         paIVtSgAG7YvI7Y7CH6AkN/dQolHugFFwycnGBocjCd0+kcimoKs8fG7vX3pXuJQuaFU
         hjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2kAXaCbVRwpQJ/QcWFbP9jMZCECl1RbYXm9sxJ41L1E=;
        b=QWMPO5MnADRiYyymQ9KZSAoMUvqVtqlLJc7n0B4ukLd8A0hZF8xBfS3LoBdSmrd5Hl
         WrcbsVyUX1b/54KEEy1yfSyTs7DTDXi6hmx/2DJlSS/HhCzg9uyXEc+S+AmHHJajscIq
         FtNyCWiAsHH245WU0zajO0OMgKLO6tvfaugkzYIYWxNrmlUCy0FZ4PnvvPmHs3vPTZqD
         RXkZKzS+nokHezd3RSbQIiRXE0dELkYDB1HkS9KQ+lcBozGCAsd5aGPJB4l2htzdGf4E
         gX8NldMs5Hmml184ZSc2Wa1qPnowY+T3MeZ87z4VjMcW2LH7Wz81S+uzM8b4VjkGGcWE
         7cwA==
X-Gm-Message-State: AOAM533pgWNNbXxpADhYKjfKqVArq4gs80rM9recak/gVzneNmcUflC2
        QEOVKiUotBF+vJ4ujBf7wQ48bo0zjNGMVSYQXNVwUF6Ec50=
X-Google-Smtp-Source: ABdhPJy+P+qfq0PsJ1YSndL5GAELxPD7MwA2VPXNB/5Lf46Iz9hpDv+wjwGD/4M6hg3bs7NAoXi83sS/eBvFkjrvidY=
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr35554300ybc.76.1597005511330;
 Sun, 09 Aug 2020 13:38:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200808210219.GN6186@pendragon.ideasonboard.com>
In-Reply-To: <20200808210219.GN6186@pendragon.ideasonboard.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 9 Aug 2020 21:38:05 +0100
Message-ID: <CA+V-a8ts72UAUbtcN6TTDwcHqFEF3HipLx=dkQxFCXTLLzgfXA@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm: rcar-du: Add r8a7742 support
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
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

Thank you for the review.

On Sat, Aug 8, 2020 at 10:02 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Prabhakar,
>
> Thank you for the patch.
>
> On Fri, Aug 07, 2020 at 06:49:49PM +0100, Lad Prabhakar wrote:
> > Add direct support for the r8a7742 (RZ/G1H).
> >
> > The RZ/G1H shares a common, compatible configuration with the r8a7790
> > (R-Car H2) so that device info structure is reused, the only difference
> > being TCON is unsupported on RZ/G1H (Currently unsupported by the driver).
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 3e67cf70f040..7e286c7a7a6c 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -216,8 +216,8 @@ static const struct rcar_du_device_info rcar_du_r8a7790_info = {
> >       .channels_mask = BIT(2) | BIT(1) | BIT(0),
> >       .routes = {
> >               /*
> > -              * R8A7790 has one RGB output, two LVDS outputs and one
> > -              * (currently unsupported) TCON output.
> > +              * R8A7742 and R8A7790 each have one RGB output and two LVDS outputs. Additionally
> > +              * R8A7790 supports one TCON output (currently unsupported by the driver).
>
> Once we support TCON we'll have to split this, but for now I suppose
> it's fine. Would you however mind wrapping this to 80 columns ? I can do
> so when applying if it's fine with you.
>
Agreed once TCON is added this has to be split. But isn't  the column
size has been increased (checkpatch too doesn't complain about), but
feel free to wrapp it for 80 columns.

Cheers,
Prabhakar

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> >                */
> >               [RCAR_DU_OUTPUT_DPAD0] = {
> >                       .possible_crtcs = BIT(2) | BIT(1) | BIT(0),
> > @@ -443,6 +443,7 @@ static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
> >  };
> >
> >  static const struct of_device_id rcar_du_of_table[] = {
> > +     { .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
> >       { .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
> >       { .compatible = "renesas,du-r8a7744", .data = &rzg1_du_r8a7743_info },
> >       { .compatible = "renesas,du-r8a7745", .data = &rzg1_du_r8a7745_info },
>
> --
> Regards,
>
> Laurent Pinchart
