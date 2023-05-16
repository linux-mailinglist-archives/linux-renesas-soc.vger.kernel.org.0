Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4487E704743
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 May 2023 10:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjEPIC7 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 May 2023 04:02:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjEPIC6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 May 2023 04:02:58 -0400
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27EAE448D
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 May 2023 01:02:58 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-ba2362d4ea9so10033023276.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 May 2023 01:02:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684224177; x=1686816177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gBRyYctlGkJHxAzWEcQfBAQoAZgKJ2ECsNouoTYRzjo=;
        b=M6G9tw5BFfdey6uAksynzFXV1rVo9JSIdKVjraNYYruIRUWz/0KLPlRmn0bsQsqMUN
         R5+akeGdDykOwg/9ec3c0RbfKpRzibIU1dfgokFXVmswsIxP5TDbqFT3ioXi3kpiw407
         7oFqDCiFi9Idxd2sfqEFFyW2PLHdRSzhnDUIAJK6eLsyO7lW0UQyB9MaDMt88JcWhBtZ
         e1I0jWR2g50xHysCzDezeKM5LPyNwFMcrxl7d5g59r9kwERWhig3wW7/n6YIYA9udzN0
         u99m9yfp2AFdeIgpJ/IO9HzkC7uk1Oeyug0YjoHU9cggYSlxEU3ysni/GYNnaotGZYyp
         C8bQ==
X-Gm-Message-State: AC+VfDyOxNf6e4Hpe7Ly8wwXEL/AHDUTpoxWNyriOtsPPYInw6RnAk/a
        AMzSbx/lbJKHSjchY9o/ogPfIZWFi0tblg==
X-Google-Smtp-Source: ACHHUZ5suj2oP+wKYF6VsOqTXLA7RyG3KfRPh+xJV2ABJxvcF66PtPquGF6mgMwEC2tTV0fP7bKvfg==
X-Received: by 2002:a05:6902:1147:b0:b9e:45e1:3e3 with SMTP id p7-20020a056902114700b00b9e45e103e3mr39116179ybu.2.1684224177084;
        Tue, 16 May 2023 01:02:57 -0700 (PDT)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com. [209.85.219.180])
        by smtp.gmail.com with ESMTPSA id y64-20020a25dc43000000b00b9dcfade2bbsm349764ybe.8.2023.05.16.01.02.55
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 01:02:56 -0700 (PDT)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-b9e27684b53so12291264276.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 May 2023 01:02:55 -0700 (PDT)
X-Received: by 2002:a81:92d5:0:b0:55a:993e:7c98 with SMTP id
 j204-20020a8192d5000000b0055a993e7c98mr35521912ywg.26.1684224175464; Tue, 16
 May 2023 01:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230513165227.13117-1-biju.das.jz@bp.renesas.com> <20230513165227.13117-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20230513165227.13117-5-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 16 May 2023 10:02:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV7D_jh3ERjKA3uXSwYFwAG61ztu5mas957dt4TBU_Bgg@mail.gmail.com>
Message-ID: <CAMuHMdV7D_jh3ERjKA3uXSwYFwAG61ztu5mas957dt4TBU_Bgg@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] mfd: Add Renesas PMIC RAA215300 driver
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
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

On Sat, May 13, 2023 at 6:53 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
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
> v2->v3:
>  * Updated commit description
>  * Added support for handling "renesas,rtc-enabled" property.
>  * Based on PMIC version, it instantiates rtc device by calling i2c_new_
>    ancillary_device().

Thanks for the update!

> RFC->V2:
>  * Dropped MODULE_SOFTDEP from the driver as it is added in RTC platform
>    driver.
> ---
>  drivers/mfd/Kconfig     |   7 +++
>  drivers/mfd/Makefile    |   2 +
>  drivers/mfd/raa215300.c | 102 ++++++++++++++++++++++++++++++++++++++++

Note that this driver no longer uses any MFD APIs...
Perhaps it should be moved to drivers/regulator/ instead?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
