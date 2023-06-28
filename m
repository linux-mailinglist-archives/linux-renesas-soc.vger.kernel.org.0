Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D578E7419DD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jun 2023 22:48:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjF1UsK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jun 2023 16:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229794AbjF1UsK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jun 2023 16:48:10 -0400
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C2ADE5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jun 2023 13:48:09 -0700 (PDT)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-39cc64e4a44so124272b6e.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jun 2023 13:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687985288; x=1690577288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bu/qyFr2fTjDKb0O0vyITWz7GS0ezt+nJDvtzYcCzuU=;
        b=PB0Ohe5u9JB3Gi9Z/fAlEkA4IBGpWOKKVVQDu8cj0xtKQtxjATz/gPrb69UduJLlv6
         b4BvbGWJVvb3EoIpG2k6ngICUL0XvUuo7nw+ryl4/rNDi31oR87B8T3+8JaScIyOb4ue
         BPvj5iiw3QBMR9GKDch7moDlPkMc8aDr5TpgjgRFfJ83olSAr/7akyaRqLcQmO4sq1I6
         32VZIY/12IUAVnP8Ycszp/mO576+Uhh5MrGiwwU44wJnCZA0sljJzfQbIEKAcx3J+Jga
         L2u20hZlc0N3I92b7fMBgRFuEc34zW9bbkg2ly5G3aop8zsEKkmZRKPb0ujHEev5CsXg
         llUA==
X-Gm-Message-State: AC+VfDyHcu7HfWKHJEK4m0LOgzJSDVxsMV/e65wfNN8YL7PnvkqzyfPx
        3MkXeOAzi/aCgTj7H7U669TXdnmSeGT3l9yc
X-Google-Smtp-Source: ACHHUZ79yg6C7rbYKSoISwSXhnYVVzxJegru+8TRcfJ8ZBcP6smoYWqH41NZFCk30ovb6ZEmFADt2g==
X-Received: by 2002:a05:6808:d50:b0:3a0:34c2:6497 with SMTP id w16-20020a0568080d5000b003a034c26497mr27957502oik.15.1687985288051;
        Wed, 28 Jun 2023 13:48:08 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id 64-20020a251943000000b00be4f34d419asm2229836ybz.37.2023.06.28.13.48.06
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jun 2023 13:48:07 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-be49ca27e1fso167238276.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Jun 2023 13:48:06 -0700 (PDT)
X-Received: by 2002:a25:747:0:b0:c39:db28:6a50 with SMTP id
 68-20020a250747000000b00c39db286a50mr1191551ybh.36.1687985286602; Wed, 28 Jun
 2023 13:48:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230625180903.142994-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230625180903.142994-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 28 Jun 2023 22:47:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW1Rm_2evSaZsAmaB1LJtSV5UjxdVfiRu70sQhMuPqbjQ@mail.gmail.com>
Message-ID: <CAMuHMdW1Rm_2evSaZsAmaB1LJtSV5UjxdVfiRu70sQhMuPqbjQ@mail.gmail.com>
Subject: Re: [PATCH] regulator: raa215300: Change the scope of the variables
 {clkin_name, xin_name}
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Sun, Jun 25, 2023 at 8:09 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Change the scope of the variables {clkin_name, xin_name} from global->local
> to fix the below warning.
>
> drivers/regulator/raa215300.c:42:12: sparse: sparse: symbol 'xin_name' was
> not declared. Should it be static?
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202306250552.Fan9WTiN-lkp@intel.com/
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch, which is correct, so:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/regulator/raa215300.c
> +++ b/drivers/regulator/raa215300.c
> @@ -38,8 +38,6 @@
>  #define RAA215300_REG_BLOCK_EN_RTC_EN  BIT(6)
>  #define RAA215300_RTC_DEFAULT_ADDR     0x6f
>
> -const char *clkin_name = "clkin";
> -const char *xin_name = "xin";
>  static struct clk *clk;
>
>  static const struct regmap_config raa215300_regmap_config = {
> @@ -71,9 +69,11 @@ static int raa215300_clk_present(struct i2c_client *client, const char *name)
>  static int raa215300_i2c_probe(struct i2c_client *client)
>  {
>         struct device *dev = &client->dev;
> -       const char *clk_name = xin_name;
> +       const char *clkin_name = "clkin";
>         unsigned int pmic_version, val;
> +       const char *xin_name = "xin";
>         struct regmap *regmap;
> +       const char *clk_name;
>         int ret;
>
>         regmap = devm_regmap_init_i2c(client, &raa215300_regmap_config);
> @@ -120,6 +120,8 @@ static int raa215300_i2c_probe(struct i2c_client *client)
>                         return ret;
>
>                 clk_name = clkin_name;
> +       } else {
> +               clk_name = xin_name;

I'd rather invert the second if-condition and exchange the two branches,
to make the code flow easier to follow for the casual reader.

        ret = raa215300_clk_present(client, xin_name);
        if (ret < 0) {
                return ret;
        } else if (ret) {
                clk_name = xin_name;
        } else {
                ret = raa215300_clk_present(client, clkin_name);
                if (ret < 0)
                        return ret;

                clk_name = clkin_name;
        }

>         }
>
>         if (ret) {

Not introduced by this patch: the check above really checks if there is
an external clock present.  A casual reader might not notice that detail,
and add more code in between the assignment to ret and the check.
So it might be prudent to pre-initialize clk_name to NULL, and set it
to clkin_name only if ret > 0.  Then the above check can become a check
for clk_name.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
