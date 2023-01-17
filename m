Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EAB766E306
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jan 2023 17:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbjAQQEr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Jan 2023 11:04:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231511AbjAQQEo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Jan 2023 11:04:44 -0500
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C5143A861
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2023 08:04:43 -0800 (PST)
Received: by mail-oi1-f173.google.com with SMTP id s66so25618769oib.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2023 08:04:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrhkpCVAn3MrYp+d13kVpSMEw4mJviAxLngnFSOJHso=;
        b=WE6/J1haNxAxFGEa0zBsDVKokUKWdRIlN2PVjJZRPSYKHnh221Sf7++YDhNQB1UHjw
         J0t7epEPWwI6jtwVyjGLFdfyAg6bMD2KF9TOeC1ISL0dNLlO+yHLctuLPUF+JmBqNA4G
         1XDYQAMmJ+AJuaPjC8Nj8Bn6113T+hKF6Rl+hr1n1W2gRST2rvuXOtjcCax+pwooQLOJ
         ZduWy4gOsmVeXSP8rLw+dfXnJXAVaJXOhcK/o38Pperyy9MbLAdjxuv7EbZ3Y7Lmsvo4
         UdfEHyorxYfiXkG3hFxWQKxXmFAulkNipksoiyYOLTVdEHv/Di7YItmzwCixuliOiazy
         womQ==
X-Gm-Message-State: AFqh2krF/ClJ9QAr9eE+K6wz5iYf1l7sQQ4G6e+OUG6lElrV0y6nFB0J
        mo2HXc3g7he97kS992hwDI+sTssO9/WP3A==
X-Google-Smtp-Source: AMrXdXuqF1/dDx6yI4QUWh3PUvI4JQ4DuJqQHgzzFi1ATOAhmlryWXA2LScxoapLdeiHkX4FArQ6Rg==
X-Received: by 2002:a54:408e:0:b0:364:6556:e579 with SMTP id i14-20020a54408e000000b003646556e579mr1504850oii.46.1673971481751;
        Tue, 17 Jan 2023 08:04:41 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id d15-20020a05620a140f00b006fc92cf4703sm20065598qkj.132.2023.01.17.08.04.41
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 08:04:41 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id t15so34609993ybq.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Jan 2023 08:04:41 -0800 (PST)
X-Received: by 2002:a25:9ac1:0:b0:7b4:6a33:d89f with SMTP id
 t1-20020a259ac1000000b007b46a33d89fmr324695ybo.543.1673971480927; Tue, 17 Jan
 2023 08:04:40 -0800 (PST)
MIME-Version: 1.0
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com> <20230117135154.387208-3-tomi.valkeinen+renesas@ideasonboard.com>
In-Reply-To: <20230117135154.387208-3-tomi.valkeinen+renesas@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 17 Jan 2023 17:04:30 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUuUV38tVsZ5qoJEq5OF-0RZ6gnCAFvyt=FHTXUy_PybQ@mail.gmail.com>
Message-ID: <CAMuHMdUuUV38tVsZ5qoJEq5OF-0RZ6gnCAFvyt=FHTXUy_PybQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] drm: rcar-du: lvds: Add reset control
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

On Tue, Jan 17, 2023 at 2:54 PM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
>
> Reset LVDS using the reset control as CPG reset/release is required in
> H/W manual sequence.
>
> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> [tomi.valkeinen: Rewrite the patch description]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c

> @@ -844,6 +853,12 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>         if (ret < 0)
>                 return ret;
>
> +       lvds->rstc = devm_reset_control_get(&pdev->dev, NULL);

devm_reset_control_get_exclusive()

> +       if (IS_ERR(lvds->rstc)) {
> +               dev_err(&pdev->dev, "failed to get cpg reset\n");
> +               return PTR_ERR(lvds->rstc);

return dev_err_probe(...);

> +       }
> +
>         drm_bridge_add(&lvds->bridge);
>
>         return 0;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
