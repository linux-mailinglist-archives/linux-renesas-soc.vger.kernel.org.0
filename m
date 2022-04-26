Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60BAD5101F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 17:31:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352348AbiDZPea (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 11:34:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243577AbiDZPe3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 11:34:29 -0400
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7665C1AD87;
        Tue, 26 Apr 2022 08:31:21 -0700 (PDT)
Received: by mail-qv1-f44.google.com with SMTP id js10so105050qvb.0;
        Tue, 26 Apr 2022 08:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hB+pp9AwgTTg6+jJpSAlmzyr4/1KcUDhmmghLlm/slY=;
        b=Djoe6dgpHbtdmRnpVeUv6dMtviZ4xAo5i/84xELaPYwqQUQZo8SZB1N8scNhOOIlJx
         kCXP/M9JuXh5PkgqHPyx57B+DaGauA7UcQfuLxTP2abl3N+AwWewXi7KbHESTC/tUTcR
         CgwlKHNjUrr2PYM4xyjtxPSrSDv2o/FP3+c5T3PsikiJlQ1VPK6JzXHHuezb+UBTAy1G
         lZjGvm5xRPvwwl4WxVi45GO9hzm1XGerVTvMKDs8akrR/UI83ZnvGf8cSWf5GMlKENuC
         DVN5aiBgzuMejMPWUqKI1M375BvWoCS1yb3R5IyfcohBGKvkg/nOYsy7gP1Xau723dOI
         eBEQ==
X-Gm-Message-State: AOAM530JyUK8gFRSP+vJxbzLnC1rDM0ob9yUTUJ6cNshF58Yrh4aC2s3
        jjboNU7D9ni5cTCGiWxdQBGh08Q/ZIE+cw==
X-Google-Smtp-Source: ABdhPJxsLehGUX51c8GTIR1UqNen679wPDk8ZQmKD90Tmwm1PAUtKIwOnftxQw08JTGkdUdpCJQkVg==
X-Received: by 2002:ad4:594d:0:b0:456:2e2c:957e with SMTP id eo13-20020ad4594d000000b004562e2c957emr11284637qvb.39.1650987080301;
        Tue, 26 Apr 2022 08:31:20 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id m130-20020a37a388000000b0069f7f0262a2sm737517qke.2.2022.04.26.08.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 08:31:20 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2ec42eae76bso186266697b3.10;
        Tue, 26 Apr 2022 08:31:19 -0700 (PDT)
X-Received: by 2002:a81:4782:0:b0:2eb:1cb1:5441 with SMTP id
 u124-20020a814782000000b002eb1cb15441mr21247662ywa.479.1650987079566; Tue, 26
 Apr 2022 08:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com> <20220330154024.112270-9-phil.edworthy@renesas.com>
In-Reply-To: <20220330154024.112270-9-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Apr 2022 17:31:08 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkMEXzBosVfpnhvoQ+f9AiDwkAdXFfj=2h+tEtyx9EcQ@mail.gmail.com>
Message-ID: <CAMuHMdXkMEXzBosVfpnhvoQ+f9AiDwkAdXFfj=2h+tEtyx9EcQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] clk: renesas: rzg2l: Make use of CLK_MON
 registers optional
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

Thanks for your patch!

On Wed, Mar 30, 2022 at 5:42 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The rz/v2m SoC doesn't use CLK_MON registers, so make it optional.

RZ/V2M ... them

>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

>  drivers/clk/renesas/r9a07g044-cpg.c |  4 ++++
>  drivers/clk/renesas/rzg2l-cpg.c     | 25 +++++++++++++++----------
>  drivers/clk/renesas/rzg2l-cpg.h     |  3 +++
>  3 files changed, 22 insertions(+), 10 deletions(-)

This needs an update for the new drivers/clk/renesas/r9a07g043-cpg.c.

> --- a/drivers/clk/renesas/rzg2l-cpg.c
> +++ b/drivers/clk/renesas/rzg2l-cpg.c
> @@ -498,16 +498,18 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
>         if (!enable)
>                 return 0;
>
> -       for (i = 1000; i > 0; --i) {
> -               if (((readl(priv->base + CLK_MON_R(reg))) & bitmask))
> -                       break;
> -               cpu_relax();
> -       }
> +       if (priv->info->has_clk_mon_regs) {
> +               for (i = 1000; i > 0; --i) {
> +                       if (((readl(priv->base + CLK_MON_R(reg))) & bitmask))
> +                               break;
> +                       cpu_relax();
> +               }
>
> -       if (!i) {
> -               dev_err(dev, "Failed to enable CLK_ON %p\n",
> -                       priv->base + CLK_ON_R(reg));
> -               return -ETIMEDOUT;
> +               if (!i) {
> +                       dev_err(dev, "Failed to enable CLK_ON %p\n",
> +                               priv->base + CLK_ON_R(reg));
> +                       return -ETIMEDOUT;
> +               }

or just insert:

    if (!priv->info->has_clk_mon_regs)
            return 0;

and no more changes are needed to this function.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
