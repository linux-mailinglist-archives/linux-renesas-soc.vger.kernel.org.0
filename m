Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 383127BA643
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Oct 2023 18:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234853AbjJEQdE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Oct 2023 12:33:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236515AbjJEQc3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 12:32:29 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56DD37DA8
        for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Oct 2023 00:44:07 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a4e29928c3so7104547b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Oct 2023 00:44:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696491843; x=1697096643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ePQTyaDh1cBEb/a7Xsrhhw/hSqDcvwM+c9qsxwUewoE=;
        b=AkTQnRY8tNwPm2yWgyVqzJb/2lKZ0vu/hvfIr6b+WxvT+9qq8Y+Xhqu98aks8FMDr/
         kuPXYIT6e1Aj9lxLuDJNT8NV950bPnYzvIoKwz+vS0PjaiGJ+qTJcWKVUHX91J7iyGw9
         VYETtPgt1NDHRZclsXV+W3kTw/gALwmKn2uQCOF1JRyy8RhpgjGa4Ai8BSIqsEWwA0yJ
         OPyOnO4KhIV0a0nug34YK1fx66AyLV2KYOkwAWUVbZJbugO4ppsaaCJptAvhtRwMwUkh
         ij2iuRVGXykjHDsDS1LB4EXDlg9SBl+Ask/qohUMM6ltupKB1wXn/XJkOQn1T2onh2tU
         fg1w==
X-Gm-Message-State: AOJu0YxIyXDpe26j2L3eTMdQuxffI0vQtPdTqQj9ay8DY5bvi83bv5kp
        xvNnwcLv3qVhVtyF+azxplv+4JQbqChqPw==
X-Google-Smtp-Source: AGHT+IHmh7USqnffpk9Kl/mdnXjtT+cSkBdrJgeeQNB7AiR0CmweqbtLmcuvpPwgCND8U1XiTHffDA==
X-Received: by 2002:a81:6587:0:b0:5a1:d352:9fe1 with SMTP id z129-20020a816587000000b005a1d3529fe1mr4874696ywb.42.1696491843388;
        Thu, 05 Oct 2023 00:44:03 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id s125-20020a0de983000000b00592a065e2a3sm330352ywe.87.2023.10.05.00.44.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Oct 2023 00:44:02 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5a4e29928c3so7104397b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 05 Oct 2023 00:44:02 -0700 (PDT)
X-Received: by 2002:a81:4989:0:b0:59f:61b7:fb71 with SMTP id
 w131-20020a814989000000b0059f61b7fb71mr4654343ywa.13.1696491842480; Thu, 05
 Oct 2023 00:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230928080317.28224-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20230928080317.28224-1-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 5 Oct 2023 09:43:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWg7QD9xJtqMyAS0oUqYSu6SNKNJPSh113JGFLP1LDSaA@mail.gmail.com>
Message-ID: <CAMuHMdWg7QD9xJtqMyAS0oUqYSu6SNKNJPSh113JGFLP1LDSaA@mail.gmail.com>
Subject: Re: [PATCH v2 RFT] clk: renesas: rcar-gen3: Extend SDnH divider table
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Fri, Sep 29, 2023 at 8:14 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> From: Dirk Behme <dirk.behme@de.bosch.com>
>
> The clock dividers might be used with clock stop bit enabled or not.
> Current tables only support recommended values from the datasheet. This
> might result in warnings like below because no valid clock divider is
> found. Resulting in a 0 divider.
>
> There are Renesas ARM Trusted Firmware version out there which e.g.
> configure 0x201 (shifted logical right by 2: 0x80) and with this match
> the added { STPnHCK | 0, 1 }:
>
> https://github.com/renesas-rcar/arm-trusted-firmware/blob/rcar_gen3_v2.3/drivers/renesas/rcar/emmc/emmc_init.c#L108
>
> ------------[ cut here ]------------
> sd1h: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
> WARNING: CPU: 1 PID: 1 at drivers/clk/clk-divider.c:141 divider_recalc_rate+0x48/0x70
> Modules linked in:
> CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.1.52 #1
> Hardware name: Custom board based on r8a7796 (DT)
> pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : divider_recalc_rate+0x48/0x70
> ...
> ------------[ cut here ]------------
>
> Fixes: bb6d3fa98a41 ("clk: renesas: rcar-gen3: Switch to new SD clock handling")
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> [wsa: extended the table to 5 entries, added comments, reword commit message a little]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.7.

> --- a/drivers/clk/renesas/rcar-cpg-lib.c
> +++ b/drivers/clk/renesas/rcar-cpg-lib.c
> @@ -70,8 +70,20 @@ void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
>  #define STPnHCK        BIT(9 - SDnSRCFC_SHIFT)
>
>  static const struct clk_div_table cpg_sdh_div_table[] = {
> -       { 0, 1 }, { 1, 2 }, { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 },
> -       { STPnHCK | 4, 16 }, { 0, 0 },
> +       /*
> +        * These values are recommended by the datasheet. Because they come
> +        * first, Linux will only use these.
> +        */
> +       { 0, 1 }, { 1, 2 }, { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 }, { STPnHCK | 4, 16 },

Would you mind if I would wrap this to 80 columns (like the original)
while applying?

> +       /*
> +        * These values are not recommended because STPnHCK is wrong. But they
> +        * have been seen because of broken firmware. So, we support reading
> +        * them but Linux will sanitize them when initializing through
> +        * recalc_rate.
> +        */
> +       { STPnHCK | 0, 1 }, { STPnHCK | 1, 2 },  { 2, 4 }, { 3, 8 }, { 4, 16 },
> +       /* Sentinel */
> +       { 0, 0 }
>  };
>
>  struct clk * __init cpg_sdh_clk_register(const char *name,

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
