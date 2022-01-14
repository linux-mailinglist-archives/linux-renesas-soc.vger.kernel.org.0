Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D645448E824
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jan 2022 11:17:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239524AbiANKRc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jan 2022 05:17:32 -0500
Received: from mail-ua1-f54.google.com ([209.85.222.54]:38456 "EHLO
        mail-ua1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236985AbiANKRb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 05:17:31 -0500
Received: by mail-ua1-f54.google.com with SMTP id h11so16109508uar.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jan 2022 02:17:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n/k7QX5xJRfyMxEBsWvg+WGjqrbJJEYkdAPVqldbfhI=;
        b=QVlSqg2389mRN9aqxUlwruawkfj9jRUcpX0qFg9XY96VYOy2AUwGBag7vyDz5hTRUl
         yymrSXBB0ZpRe6Em7cmRtB9PP3+wlONR/uSVwgf7lUqeMPxwKvEuI5+ArXmkSiM3afRq
         cRCLYbTuxSl54+VGrkl5kmi4vTZc/+IXjidok1reOACU/SBbBus9gVhqrK6zcPHD3CTG
         KrCjPExrMhtDt7V0px+9naigAF3mMZM+f7m+Wt5VZAPE8U5uyHZPvBMxfR8xeCeuivj5
         5a4Y5t5tPi+esIanibAx+PKm3OuPDs3H5O7hKC/OPcyOMUN35xYBzpV05eITpwr3ppYv
         htYw==
X-Gm-Message-State: AOAM533MVR1MMNJCzkIc3W0nieF9lg1ZpVxM2DMOp14lCEPApsMetiM7
        Ztlixhj62CJ3k5pHmkqW5WIr92WX5dogcn3N
X-Google-Smtp-Source: ABdhPJzdDO6OWQ8qJQFKPe1trMjfbLaRGjUjYrVTnyo+l2pUJkCobgwz+cZF9vwwoL0Oh09JWsfF3A==
X-Received: by 2002:a9f:244f:: with SMTP id 73mr3990812uaq.10.1642155450930;
        Fri, 14 Jan 2022 02:17:30 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id s32sm2226684uas.3.2022.01.14.02.17.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 02:17:30 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id l15so16020752uai.11
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jan 2022 02:17:30 -0800 (PST)
X-Received: by 2002:a67:e905:: with SMTP id c5mr3785219vso.68.1642155450169;
 Fri, 14 Jan 2022 02:17:30 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com> <20220112174612.10773-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220112174612.10773-11-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 14 Jan 2022 11:17:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUyPbykGc+OPPmxd63qsSRjG1h_xm3GXHsdbcwfZ+48ew@mail.gmail.com>
Message-ID: <CAMuHMdUyPbykGc+OPPmxd63qsSRjG1h_xm3GXHsdbcwfZ+48ew@mail.gmail.com>
Subject: Re: [RFC 10/28] drm: rcar-du: of: Increase buff size for compatible variable
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Jan 12, 2022 at 6:46 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Increase buff size for compatible variable to avoid stack corruption
> with RZ/G2L SoC's(renesas,du-r9a07g044l) which requires a buff size
> more than the current allocated size.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rcar_du_of.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_of.c
> @@ -200,7 +200,7 @@ static void __init rcar_du_of_lvds_patch(const struct of_device_id *of_ids)
>         struct device_node *lvds_node;
>         struct device_node *soc_node;
>         struct device_node *du_node;
> -       char compatible[22];
> +       char compatible[24];
>         const char *soc_name;
>         unsigned int i;
>         int ret;

What about changing the code to use kasprintf() instead, to prevent
this from ever happening again?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
