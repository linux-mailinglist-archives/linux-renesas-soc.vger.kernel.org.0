Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 964BB19BFF2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Apr 2020 13:13:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388012AbgDBLND (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Apr 2020 07:13:03 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:35789 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388009AbgDBLND (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 07:13:03 -0400
Received: by mail-ot1-f66.google.com with SMTP id v2so3005512oto.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Apr 2020 04:13:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mLkSVYvq1S+xd0KBA7m5cNwx3upuFOpsltCvoBBzKng=;
        b=D1KrDNTwyLLVWVI4d76dW0Cp9UmusMLxWl6HH1UAVEtbfc8RyjKOcvs1kCzPNA4x4l
         oWOXa2YlPQ/Srf2ZWOFeXlBFvlmNWoRPf6YTx6Dp8xGuKCBM665J/5RMdylxTS084V/m
         8E+2ZGb2CkyQD42XBJ130gZLrCiTwG5TWdWb1Al7ZglajC/n8xjW+h4s4lkjwVIeyQLT
         OK7bWdcRbV/yA2ItMR7vfJXzudX5NlGmaYosL/R/EpJX6nqMq7EbSRbE93/YkQx7AIBF
         VH3H6eY7NOBtqOxBSt17/ydpIPIc/Tyx/YnSqCFJJ/zIweTpSEH2c4pnnSyffl6hI6MX
         4vdQ==
X-Gm-Message-State: AGi0Puali8kY6IuBpmQUqWky4GezWkwD9Mop/dWXPz8Og3QjROjvG19i
        TaHbWNWgDPNW5U/QR5bWm79GErm7PjLIEu53y94=
X-Google-Smtp-Source: APiQypIORc/Nv1n6rB0FStMIbY/Vcz0asLDfPslbCmgMGOigP/aw3H0kO+OumSt/995iGNxNyKQ/MgKapGLA+4potZc=
X-Received: by 2002:a05:6830:15c2:: with SMTP id j2mr1797111otr.107.1585825983045;
 Thu, 02 Apr 2020 04:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200402104035.13497-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200402104035.13497-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Apr 2020 13:12:51 +0200
Message-ID: <CAMuHMdXwUEuct=Pr29aGJuj1cgDmCEZFDm1JEx5-+zP-02n+mw@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Create immutable zpos property for primary planes
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Tomohito Esaki <etom@igel.co.jp>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Thu, Apr 2, 2020 at 12:42 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The R-Car DU driver creates a zpos property, ranging from 1 to 7, for
> all the overlay planes, but leaves the primary plane without a zpos
> property. The DRM/KMS API doesn't clearly specify if this is acceptable,
> of it the property is mandatory for all planes when exposed for some of
> the planes. Nonetheless, weston v8.0 has been reported to have trouble
> handling this situation.
>
> The DRM core offers support for immutable zpos properties. Creating an
> immutable zpos property set to 0 for the primary planes seems to be a
> good way forward, as it shouldn't introduce any regression, and can fix
> the issue. Do so.
>
> Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -785,13 +785,15 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
>
>                 drm_plane_create_alpha_property(&plane->plane);
>
> -               if (type == DRM_PLANE_TYPE_PRIMARY)
> -                       continue;
> -
> -               drm_object_attach_property(&plane->plane.base,
> -                                          rcdu->props.colorkey,
> -                                          RCAR_DU_COLORKEY_NONE);
> -               drm_plane_create_zpos_property(&plane->plane, 1, 1, 7);
> +               if (type == DRM_PLANE_TYPE_PRIMARY) {
> +                       drm_plane_create_zpos_immutable_property(&plane->plane,
> +                                                                0);
> +               } else {
> +                       drm_object_attach_property(&plane->plane.base,
> +                                                  rcdu->props.colorkey,
> +                                                  RCAR_DU_COLORKEY_NONE);
> +                       drm_plane_create_zpos_property(&plane->plane, 1, 1, 7);
> +               }
>         }
>
>         return 0;

This is very similar to Esaki-san's patch[*] posted yesterday.
However, there's one big difference: your patch doesn't update
rcar_du_vsp_init(). Isn't that needed?

[*] "[PATCH] drm: rcar-du: Set primary plane zpos immutably at initializing"
    https://lore.kernel.org/linux-renesas-soc/20200401061100.7379-1-etom@igel.co.jp/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
