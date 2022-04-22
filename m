Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4F7DD50B32F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Apr 2022 10:47:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1445583AbiDVItu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Apr 2022 04:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445608AbiDVItt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Apr 2022 04:49:49 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5614E532F4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Apr 2022 01:46:57 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id hh4so5039076qtb.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Apr 2022 01:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uxqEisi3EFgZNuKu/pNszsfri4ZDMq5dlFw0H485MCw=;
        b=wwvhRH7xn9XWvIDjE1Hc5pESM9FbORhgCWIQjoG40VCjzf387SEbh5tnFft5TgGCVI
         mMr1u0z1KEPsD8Fk1e3hlHdhvJaiE2kNicJsNVqROK7pzBAhIyB8k9RgCBNSSvfRVCkR
         L3SzO+FNu7kWX6vlUBTbccTH1eGKnb6emvOXIP6QERuv9kfvF1lcX/l767KpfwE+nTmr
         HlyKLDxIZn+lKxyLrFISF4d7uTFnwhdssxRXcW+inJPr2N2L74uGvSNKF5dVvviVRGpd
         Ek1VEt2i1sl6aIge8aggOtej5/dZMdtJmE0xfszUkXzcrqV2+8G8bJTdzp7fMMDDkrFJ
         TPEw==
X-Gm-Message-State: AOAM533rQs8H3Mz3ozmf5vAgMPP5axY+FGveUumLR0ZKMzFH8Ul3N8eN
        JP9vDSltE30BDRP2xtz+rXJbftRNVn0Riw==
X-Google-Smtp-Source: ABdhPJzed82Ke/MPIXd8w+zBd+iNYH0HzlAvjCYhEy0/8BKwCOYrZAnkIqMza/oBfHaeRlnp5YbMaQ==
X-Received: by 2002:a05:622a:303:b0:2f1:fd57:25f5 with SMTP id q3-20020a05622a030300b002f1fd5725f5mr2355434qtw.182.1650617216295;
        Fri, 22 Apr 2022 01:46:56 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id p66-20020a374245000000b0069c387c5449sm678427qka.9.2022.04.22.01.46.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Apr 2022 01:46:55 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id f38so13282904ybi.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Apr 2022 01:46:55 -0700 (PDT)
X-Received: by 2002:a25:32cd:0:b0:645:81ae:bb78 with SMTP id
 y196-20020a2532cd000000b0064581aebb78mr3373655yby.506.1650617215207; Fri, 22
 Apr 2022 01:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com> <20220421163128.101520-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220421163128.101520-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Apr 2022 10:46:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_eNxM4yHgkUFPz58KyiGFtjjBeePtuAg8pZYfsS5t9g@mail.gmail.com>
Message-ID: <CAMuHMdV_eNxM4yHgkUFPz58KyiGFtjjBeePtuAg8pZYfsS5t9g@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] drm: rcar-du: Fix typo
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
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Apr 21, 2022 at 6:31 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Fix typo rcar_du_vsp.h->rcar_du_vsp.c
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  /*
> - * rcar_du_vsp.h  --  R-Car Display Unit VSP-Based Compositor
> + * rcar_du_vsp.c  --  R-Car Display Unit VSP-Based Compositor

Perhaps drop the file name completely instead?

>   *
>   * Copyright (C) 2015 Renesas Electronics Corporation
>   *

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
