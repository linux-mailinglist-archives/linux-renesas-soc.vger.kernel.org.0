Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDB18610B2C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Oct 2022 09:19:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230082AbiJ1HTN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Oct 2022 03:19:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiJ1HTM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2022 03:19:12 -0400
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D03B1B76C9;
        Fri, 28 Oct 2022 00:19:09 -0700 (PDT)
Received: by mail-qk1-f180.google.com with SMTP id t25so2921632qkm.2;
        Fri, 28 Oct 2022 00:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ygvJZjS5cqGS/Wb19opJUCwMym/FSRX+6Prvu5QHTU=;
        b=qn0p4/DGOzi1Pyy+uoxWGPTsvd8rHGQBsjab4yUwWcr+9UkyV3Tk3CKtU9X6u32/We
         /BrbyM6wIVQW02ShN2Q3fx4vAyWtiyGYw5HKOjvjT+9yHv57+Mmj5l43nL4eGOUgTz4g
         Y+U8512rbKv1PYW0HADkeErqgcDfSJ0Cj1zTB+GrtZQKxBYY0z4/K4+iOUXAPpiBVrdb
         rl4g1C9JTnZqWuLJ5R1dCys1ECMB3tbDCyW41E91/Jr2C7F99OXnHKXr07yyn6mpFwdU
         Jv2SuElNbFNrP7iqX1uFz0RUoPHjtICWszFondrBxpmzgBEffHcRUfY+9xyg1ME8y77N
         uWYA==
X-Gm-Message-State: ACrzQf2ZfDW6joIs2+C/Og66ReS8lOrloe09gvTH5Z9PgR6AAQGevPAR
        ReIkbTm1kFIGXO/aQMOY4CCQUV95uHgv9A==
X-Google-Smtp-Source: AMsMyM4Wo4amUI5IdMl7bBCrpcs0+L7Fy7tKm9b4SdsQOIrJ4cAa0tol0CwupC4LKdYR68pR0C6t3Q==
X-Received: by 2002:a05:620a:44cd:b0:6ec:51f9:5e82 with SMTP id y13-20020a05620a44cd00b006ec51f95e82mr38698350qkp.521.1666941548374;
        Fri, 28 Oct 2022 00:19:08 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id q39-20020a05620a2a6700b006b640efe6dasm2462438qkp.132.2022.10.28.00.19.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 00:19:08 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id f205so5232066yba.2;
        Fri, 28 Oct 2022 00:19:07 -0700 (PDT)
X-Received: by 2002:a25:d64e:0:b0:6cb:7faa:af94 with SMTP id
 n75-20020a25d64e000000b006cb7faaaf94mr15955833ybg.36.1666941547538; Fri, 28
 Oct 2022 00:19:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221027163057.37257-1-marex@denx.de>
In-Reply-To: <20221027163057.37257-1-marex@denx.de>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 28 Oct 2022 09:18:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW64XYebA_mMWAvB+CyKkguZT9ShMMsLELVFHR8c_=cRA@mail.gmail.com>
Message-ID: <CAMuHMdW64XYebA_mMWAvB+CyKkguZT9ShMMsLELVFHR8c_=cRA@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a06g032: Repair grave increment error
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

CC s/Phil/Gareth/

On Thu, Oct 27, 2022 at 6:31 PM Marek Vasut <marex@denx.de> wrote:
> If condition (clkspec.np != pd->dev.of_node) is true, then the
> driver ends up in endless loop, forever, locking up the machine.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Fixes: aad03a66f902e18b ("clk: renesas: r9a06g032: Add clock domain support")
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.2.

> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -412,7 +412,7 @@ static int r9a06g032_attach_dev(struct generic_pm_domain *pd,
>         int error;
>         int index;
>
> -       while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i,
> +       while (!of_parse_phandle_with_args(np, "clocks", "#clock-cells", i++,
>                                            &clkspec)) {
>                 if (clkspec.np != pd->dev.of_node)
>                         continue;
> @@ -425,7 +425,6 @@ static int r9a06g032_attach_dev(struct generic_pm_domain *pd,
>                         if (error)
>                                 return error;
>                 }
> -               i++;
>         }
>
>         return 0;
> --
> 2.35.1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
