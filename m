Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E69B5980D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Aug 2022 11:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241591AbiHRJ3t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Aug 2022 05:29:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237960AbiHRJ3r (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Aug 2022 05:29:47 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0429B7F112
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2022 02:29:47 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id j17so666660qtp.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2022 02:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=FPBV0BvJy0PPQ45PhQv1Qdnn8j75RhV+6l7B5TE8xOo=;
        b=4ccGmFrGH0CDqZWSWTVbIR/Txey+MHEbltC/I8kQEmLqHGL0tWUw4XgNxbjc5NNHQA
         ts0bmgdc7GPPDGCAZ2Snjf0xsu1nucTzmLT8T1l9GKZR4LQyAuMJB07ND3VdH3Tnzsnz
         XDZLts/tch2DXIEqSkwH5eOnh8vMnIo7dRNX2/XtgVPs+8cPXE65TViMrHij+z6M59AO
         9TQcDdtAFN4n+QZySzVI5Eml0srMFSeubevmtepaMJgk0W4VcwoB3NMEBHPYVqm6o08J
         AeLe+B1sSKr8LEz0n4SBU1eEpMazHhoYDXhoxP8lBEd2w/rYxH0sesh90QLyYv39t+ev
         qjDA==
X-Gm-Message-State: ACgBeo1/pvCsdYfDeJSNw5CLM5iUuXQLCnB2lJ6R6va1pbRCqg932/vL
        36p7zng95SzVMaLJxeo3ji2VI+jrn0+DTQ==
X-Google-Smtp-Source: AA6agR4X3sH47Jq4jTg6xI9BYys4OGmGjJRS5VNgkJl4AfIViwT5LsUPZv7VUt3fv7LVGY79+OeJWQ==
X-Received: by 2002:a05:622a:138f:b0:344:4ff1:f98f with SMTP id o15-20020a05622a138f00b003444ff1f98fmr1713264qtk.59.1660814985662;
        Thu, 18 Aug 2022 02:29:45 -0700 (PDT)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com. [209.85.128.170])
        by smtp.gmail.com with ESMTPSA id l8-20020a05620a28c800b006bbc3724affsm202756qkp.45.2022.08.18.02.29.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 02:29:45 -0700 (PDT)
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-3246910dac3so25123147b3.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Aug 2022 02:29:45 -0700 (PDT)
X-Received: by 2002:a25:880f:0:b0:67c:2727:7e3c with SMTP id
 c15-20020a25880f000000b0067c27277e3cmr2060915ybl.36.1660814984766; Thu, 18
 Aug 2022 02:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220727160753.1774761-1-biju.das.jz@bp.renesas.com> <20220727160753.1774761-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220727160753.1774761-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Aug 2022 11:29:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU8V9=w-uTt7Lx264wtz+TopHUD+W9H66y68tNMOG7P8w@mail.gmail.com>
Message-ID: <CAMuHMdU8V9=w-uTt7Lx264wtz+TopHUD+W9H66y68tNMOG7P8w@mail.gmail.com>
Subject: Re: [PATCH v5 04/10] drm: rcar-du: Add rcar_du_lib_fb_create()
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Wed, Jul 27, 2022 at 6:08 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Move the common code from rcar_du_fb_create->rcar_du_lib_fb_create,
> so that rzg2l_du_fb_create() can reuse the common code.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5:
>  * New patch

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms_lib.c
> @@ -392,3 +392,72 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
>
>         return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> +
> +struct drm_framebuffer *
> +rcar_du_lib_fb_create(struct drm_device *dev, struct drm_file *file_priv,
> +                     const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +       struct rcar_du_device *rcdu = to_rcar_du_device(dev);
> +       const struct rcar_du_format_info *format;
> +       unsigned int chroma_pitch;
> +       unsigned int max_pitch;
> +       unsigned int align;
> +       unsigned int i;
> +
> +       format = rcar_du_format_info(mode_cmd->pixel_format);
> +       if (format == NULL) {
> +               dev_dbg(dev->dev, "unsupported pixel format %08x\n",

I know you're just moving code, but nowadays we do have "%p4cc",
which takes a pointer to the fourcc value.

> +                       mode_cmd->pixel_format);
> +               return ERR_PTR(-EINVAL);
> +       }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
