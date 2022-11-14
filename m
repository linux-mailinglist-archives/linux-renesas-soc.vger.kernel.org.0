Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 287156278B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Nov 2022 10:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236791AbiKNJHy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Nov 2022 04:07:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236276AbiKNJHa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2022 04:07:30 -0500
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C14E1EC65
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 01:06:12 -0800 (PST)
Received: by mail-qt1-f171.google.com with SMTP id w4so6434357qts.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 01:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPQL6nywFkNzHXJuq1zhzWcC9UCK+YshOf1sJJOpgHo=;
        b=RdT0iGOgXiEennzdJxzPB6bGKCd8EZ2tyBlAv7eGeArVrczVnt/0ku+dZ6RyDV/Jpz
         MY5rtIPW4iuPNngIxxrKJOjmfRMVtJFJ+SQCMfZMfd4NiCiXtuPQQlOvxxrBJnvCaBQ2
         bI/9bNERiRgvMYHZFD9aI6iDs33+rbWT/Zk3gWlE77iaUz4jWdEHzVxnEag7P5iN3sC3
         E4QUpQ/j1k8EhJCavha6O0TxZMXXEZlU+bda80CX2Psl4BWEaCsGU1X8gDILEfRgub2E
         J/eBtMQqRyW8WBE9CZXIFpTNlO/MFqapeWB2TdRVSFcSgcSehyNkO6bnSluA0tUmFq4I
         Mf3Q==
X-Gm-Message-State: ANoB5pnPxGvgy/6hcBtpkh+DNUuSG4wwIHyEd5LmhUwVZ889z3Nqb61E
        q/r7z58GLGL9QaCytfLg1TDSjvPuclpn5w==
X-Google-Smtp-Source: AA0mqf4gXu5VXylUas+Pc3ADYrzR8EOoNx7zJ0pEPPzb8Fp3/CmiAbVigDP5IeLvyD1fCpM3OitXcg==
X-Received: by 2002:a05:622a:1aa2:b0:3a5:2766:552a with SMTP id s34-20020a05622a1aa200b003a52766552amr11749504qtc.79.1668416771473;
        Mon, 14 Nov 2022 01:06:11 -0800 (PST)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id t6-20020a05622a180600b00343057845f7sm5388196qtc.20.2022.11.14.01.06.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 01:06:11 -0800 (PST)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-382f0906929so8557187b3.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2022 01:06:10 -0800 (PST)
X-Received: by 2002:a81:4dc3:0:b0:370:61f5:b19e with SMTP id
 a186-20020a814dc3000000b0037061f5b19emr11774395ywb.316.1668416770655; Mon, 14
 Nov 2022 01:06:10 -0800 (PST)
MIME-Version: 1.0
References: <20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20221001220342.5828-1-laurent.pinchart+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 14 Nov 2022 10:05:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWeZBzFM2Q8sLEqe_DfD74a1K+5qcPHADZnPfrQYqVXrg@mail.gmail.com>
Message-ID: <CAMuHMdWeZBzFM2Q8sLEqe_DfD74a1K+5qcPHADZnPfrQYqVXrg@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Fix Kconfig dependency between RCAR_DU and RCAR_MIPI_DSI
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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

On Sun, Oct 2, 2022 at 12:06 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> When the R-Car MIPI DSI driver was added, it was a standalone encoder
> driver without any dependency to or from the R-Car DU driver. Commit
> 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence") then
> added a direct call from the DU driver to the MIPI DSI driver, without
> updating Kconfig to take the new dependency into account. Fix it the
> same way that the LVDS encoder is handled.
>
> Fixes: 957fe62d7d15 ("drm: rcar-du: Fix DSI enable & disable sequence")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch, which is now commit a830a15678593948
("drm: rcar-du: Fix Kconfig dependency between RCAR_DU
and RCAR_MIPI_DSI") in v6.1-rc5.

> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -44,12 +44,17 @@ config DRM_RCAR_LVDS
>         select OF_FLATTREE
>         select OF_OVERLAY
>
> +config DRM_RCAR_USE_MIPI_DSI
> +       bool "R-Car DU MIPI DSI Encoder Support"
> +       depends on DRM_BRIDGE && OF
> +       default DRM_RCAR_DU

This means this driver is now enabled by default on systems that do not
have the MIPI DSI Encoder (e.g. R-Car Gen2), and that we should probably
disable it explicitly in shmobile_defconfig.  Is that intentional?

> +       help
> +         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
> +
>  config DRM_RCAR_MIPI_DSI
> -       tristate "R-Car DU MIPI DSI Encoder Support"
> -       depends on DRM && DRM_BRIDGE && OF
> +       def_tristate DRM_RCAR_DU
> +       depends on DRM_RCAR_USE_MIPI_DSI
>         select DRM_MIPI_DSI
> -       help
> -         Enable support for the R-Car Display Unit embedded MIPI DSI encoders.
>
>  config DRM_RCAR_VSP
>         bool "R-Car DU VSP Compositor Support" if ARM

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
