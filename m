Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17C5C48E84B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jan 2022 11:24:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237618AbiANKYS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jan 2022 05:24:18 -0500
Received: from mail-ua1-f49.google.com ([209.85.222.49]:45691 "EHLO
        mail-ua1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237477AbiANKYS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 05:24:18 -0500
Received: by mail-ua1-f49.google.com with SMTP id x33so16075596uad.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jan 2022 02:24:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=le2UM8B7mfKn0fZwAHCKL3DNfCbA6VK0XgDGxRejc0E=;
        b=rA2vb05N1kYDA/ViLoJKwufbdcXh89hnN12kePGVE60ble5qY1GVHDSqiFwoaKYwKz
         U+WxTCJ6pkmrAZjq5EzVDTUsTrpSWSCL9BO+PQlCBarv3cGRevQ4mDpCZZfEV+N+xlIS
         jlJZsblMVpxexHIvWYSgA0765cAqjc4gLfCCbnlYhEUQUJcJDEc12Er9tF+RcwtPlA01
         z/caVm/ltmTd6FWe1EAzdWrQReQQ1mP+1+NgqqYB+1aWaNfar7b4B3lSfdj8sBGCmhkC
         QvoSWiHLKUl4uMRflcjD4Blcskg/4MJTBFmf9GhaXHsKvA4LfOrq5LuH9W7/e9N0xotN
         fecg==
X-Gm-Message-State: AOAM531f98BmTtR6E8JjQtBfTh/RJiM0nBlKJX8N0PTA7EmpImbDsNQ1
        UugbjRW5FleLmeEqralfSrZFdEWaMNncPRIq
X-Google-Smtp-Source: ABdhPJwy/K1nyOXYnecoONI/uFc2KVmdEz46t10n0Pcnt34Dc55uwEeILLFVZNFJ3TSUBkDK0nI+KQ==
X-Received: by 2002:a67:fd64:: with SMTP id h4mr3848039vsa.8.1642155857461;
        Fri, 14 Jan 2022 02:24:17 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id y26sm2234835vsk.31.2022.01.14.02.24.16
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jan 2022 02:24:17 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id x33so16075528uad.12
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jan 2022 02:24:16 -0800 (PST)
X-Received: by 2002:a67:bc17:: with SMTP id t23mr258035vsn.57.1642155856532;
 Fri, 14 Jan 2022 02:24:16 -0800 (PST)
MIME-Version: 1.0
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com> <20220112174612.10773-23-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220112174612.10773-23-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 14 Jan 2022 11:24:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUf7DDPemUjrWTuy7y4G-mJcHoje5EvNqEzZZTPYeUbuw@mail.gmail.com>
Message-ID: <CAMuHMdUf7DDPemUjrWTuy7y4G-mJcHoje5EvNqEzZZTPYeUbuw@mail.gmail.com>
Subject: Re: [RFC 22/28] drm: rcar-du: Add RZ/G2L DSI driver
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Philipp Zabel <p.zabel@pengutronix.de>,
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

On Wed, Jan 12, 2022 at 6:47 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> This driver supports the MIPI DSI encoder found in the RZ/G2L
> SoC. It currently supports DSI mode only.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -51,6 +51,13 @@ config DRM_RCAR_MIPI_DSI
>         help
>           Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
>
> +config DRM_RZG2L_MIPI_DSI
> +       tristate "RZ/G2L MIPI DSI Encoder Support"
> +       depends on DRM && DRM_BRIDGE && OF

I guess the dependency on DRM can be dropped, as it is implied by
DRM_BRIDGE?

Please add "depends on ARCH_RENESAS || COMPILE_TEST".

> +       select DRM_MIPI_DSI
> +       help
> +         Enable support for the RZ/G2L Display Unit embedded MIPI DSI encoders.
> +
>  config DRM_RCAR_VSP
>         bool "R-Car DU VSP Compositor Support" if ARM
>         default y if ARM64

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
