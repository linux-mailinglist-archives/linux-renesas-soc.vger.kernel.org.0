Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0F4E7097E5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 May 2023 15:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjESNCS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 May 2023 09:02:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbjESNCR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 May 2023 09:02:17 -0400
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55F19B6
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 May 2023 06:02:16 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-ba827c74187so4451349276.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 May 2023 06:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684501335; x=1687093335;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8YJbeBbAAMYblfEX6K2EngY8kH0aTU6JyKQofpw73og=;
        b=Azw4DvsCsqtrq0DVf7oygbCYu+d7aX38fAoT48639LWzMW4E64KtJJ6gV4QmDcm+++
         NvPIrC+I6gXsP9NiCz6s63A+6ZoH0NzKVQya3iDGd5r6aydvaoJ9SKNkfuvKqC8lSo5O
         i6OhYkGbUTn3JNdOaZ3NKPpw5cuxbWuV/5RyVZ1/3dt734a6evEFAKR8p/DdXhS91Chp
         66cc5LtPOVlUw5h0McIP2AFLM74xRnvgEYzWlqqojviGWkNYvyOFZtMFw7p7v+tqWwdQ
         becC3VYwm5CN9bq8xFtOZXffXbqXpXC3TtcuGVakx32GOxi4FjzvNWHh+qb3FzvhKhBW
         veLA==
X-Gm-Message-State: AC+VfDzihiiCc75aavbRpgLbSOF2isKed0zJ/BkbvIeuwfjSzMjPLXd5
        f0+ldxK96X7BvOGJIlQP5tqkSbDbode0yg==
X-Google-Smtp-Source: ACHHUZ7c1g9+0fNfpkxKFONvEZqaKfuc9bcV6VtQJXuwA/hbFN6lVUq3vq9snc/qTVt+wTMn32U1Vw==
X-Received: by 2002:a05:6902:154b:b0:ba8:15a2:f44d with SMTP id r11-20020a056902154b00b00ba815a2f44dmr2094570ybu.13.1684501334694;
        Fri, 19 May 2023 06:02:14 -0700 (PDT)
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com. [209.85.128.174])
        by smtp.gmail.com with ESMTPSA id f17-20020a5b0c11000000b00b9dc4620f95sm1014100ybq.6.2023.05.19.06.02.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 May 2023 06:02:14 -0700 (PDT)
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-561c1ae21e7so43815577b3.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 19 May 2023 06:02:13 -0700 (PDT)
X-Received: by 2002:a81:54d4:0:b0:55a:5b19:ca9 with SMTP id
 i203-20020a8154d4000000b0055a5b190ca9mr1722603ywb.36.1684501333277; Fri, 19
 May 2023 06:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com> <20230518113643.420806-11-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230518113643.420806-11-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 19 May 2023 15:02:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3p5O_LpSGNm342XjFZYfE3DavpXUJRrrnYp62gpLxiQ@mail.gmail.com>
Message-ID: <CAMuHMdX3p5O_LpSGNm342XjFZYfE3DavpXUJRrrnYp62gpLxiQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/11] regulator: Add Renesas PMIC RAA215300 driver
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
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

On Thu, May 18, 2023 at 1:37 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>
> The RAA215300 is a 9-channel PMIC that consists of
>  * Internally compensated regulators
>  * built-in Real Time Clock (RTC)
>  * 32kHz crystal oscillator
>  * coin cell battery charger
>
> The RTC on RAA215300 is similar to the IP found in the ISL1208.
> The existing driver for the ISL1208 works for this PMIC too,
> however the RAA215300 exposes two devices via I2C, one for the RTC
> IP, and one for everything else. The RTC IP has to be enabled
> by the other I2C device, therefore this driver is necessary to get
> the RTC to work.
>
> The external oscillator bit is inverted on PMIC version 0x11.
>
> Add PMIC RAA215300 driver for enabling RTC block and instantiating
> RTC device based on PMIC version.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Moved from mfd->regulator as it doesn't use MFD APIs
>  * Dropped handling "renesas,rtc-enabled" property and instead used
>    clock-names to determine RTC is enabled or not and then instantiating
>    RTC device.

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/regulator/raa215300.c

> +       xin = devm_clk_get_optional(&client->dev, "xin");
> +       if (IS_ERR_OR_NULL(xin)) {
> +               clkin = devm_clk_get(&client->dev, "clkin");
> +               if (IS_ERR(clkin))
> +                       return PTR_ERR(clkin);
> +
> +               int_osc_en = false;
> +               xin = NULL;
> +       } else {
> +               clkin = NULL;
> +       }
> +
> +       if (xin || clkin)  {

Perhaps just "if (of_property_present(np, "clocks"))"?

> +               struct i2c_client *rtc_client;
> +
> +               /* Enable RTC block */
> +               regmap_update_bits(regmap, RAA215300_REG_BLOCK_EN,
> +                                  RAA215300_REG_BLOCK_EN_RTC_EN,
> +                                  RAA215300_REG_BLOCK_EN_RTC_EN);
> +
> +               rtc_client = i2c_new_ancillary_device(client, "rtc",
> +                                                     RAA215300_RTC_DEFAULT_ADDR,
> +                                                     pmic_version >= 0x12 ?
> +                                                     "isl1208" : "raa215300_a0");
> +               if (IS_ERR(rtc_client))
> +                       return PTR_ERR(rtc_client);
> +
> +               ret = devm_add_action_or_reset(dev,
> +                                              raa215300_rtc_unregister_device,
> +                                              rtc_client);
> +               if (ret < 0)
> +                       return ret;
> +       }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
