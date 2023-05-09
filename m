Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC1B56FC244
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 11:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbjEIJEB convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 05:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjEIJD7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 05:03:59 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEDAA40E4
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 02:03:57 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-559debdedb5so84308977b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 02:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683623037; x=1686215037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmbZrUINdfeP5ug0BIHn3l32VAAbeYzvePQET8FCF8Q=;
        b=N7ucDrQDR8W6J6649GI4c/CUJIOhjHyQ8yQmACTHor6ojYFz8OPcyQaHuUfYIsFjp0
         XoE60jVqhHuTlGtFaBQRWWjPFaZN/0qCY+npHiLj7IJ2NtkDJp1+PL/uSj/EodMKQ2qu
         h+PLENEo697H/POw7dlOccYVoPSFbeclj6KQpPrHZCM7E40tRp4lrXrB4XZiSD+YKB8W
         srJqCHQqhOq5ORmE7uA4Q83gCXOWMG5gfFowtFf9FjM5zQ+U2aAXLD8BgUtNlfU/eSWg
         7nNj3uY89OFbKxyfZS5d0HKZ8Wl6XYP62CdHnnqav0UUBVT1BqrBi65PAacLfhatFtIJ
         Ou4g==
X-Gm-Message-State: AC+VfDyEuhudlvOLY6vED8u/gNtJJfetWDifejsC7qZ4sRf08AwXlLUS
        D47AAjz5gdjAqJCczSbTwMKjJIZFTUyxKA==
X-Google-Smtp-Source: ACHHUZ4/Z3k1qPIK6ukNlxCOJQfiEvHDbabpLwno6mxIdNNko+I/2Wir3rA6Tjs6JDklLRRq7hyPAw==
X-Received: by 2002:a81:6587:0:b0:555:cee3:d143 with SMTP id z129-20020a816587000000b00555cee3d143mr14097553ywb.4.1683623036842;
        Tue, 09 May 2023 02:03:56 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id d201-20020a0ddbd2000000b0055a777e3c50sm3100247ywe.62.2023.05.09.02.03.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 02:03:56 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-559eae63801so84163977b3.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 02:03:56 -0700 (PDT)
X-Received: by 2002:a81:4e8a:0:b0:55a:886c:bfc3 with SMTP id
 c132-20020a814e8a000000b0055a886cbfc3mr16008332ywb.7.1683623035801; Tue, 09
 May 2023 02:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
 <20230505172530.357455-5-biju.das.jz@bp.renesas.com> <OS0PR01MB5922CB267130D6E5DBE4AD1086769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU36vONu2GMKYZwtLPo_+CDYnWKDXjMytAg0r6BPRUv7Q@mail.gmail.com> <OS0PR01MB5922474E0B42B6301DB1961986769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922474E0B42B6301DB1961986769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 May 2023 11:03:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV+kjU5Ymy70_fus+tvO6ENPY04QG0ANr2WtraPK0H45w@mail.gmail.com>
Message-ID: <CAMuHMdV+kjU5Ymy70_fus+tvO6ENPY04QG0ANr2WtraPK0H45w@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
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

On Tue, May 9, 2023 at 9:35 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
> > On Tue, May 9, 2023 at 9:06 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > Subject: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
> > > >
> > > > Currently, it is not possible to instantiate the i2c client driver
> > > > using MFD cell as it is not a platform driver. Add support for
> > > > Renesas PMIC
> > > > RAA215300 RTC platform driver, so that it can be instantiated by MFD
> > API.
> > > > The rtc device is created by using i2c_new_ancillary_device() and it
> > > > register as the rtc device by the helper function provided by
> > > > rtc-isl2108 driver.
> > >
> > > Not sure this platform driver has to be placed in RTC subsystem rather
> > > than MFD subsystem as PMIC MFD driver, can instantiate it using MFD cell??
> >
> > Can't you just instantiate the i2c ancillary device from the PMIC driver,
> > and drop the new mfd and platform rtc drivers?
>
> Yes, it is possible.
>
> The only reason MFD is used for future expansion like adding support for
>
> 1) battery charger
> Or
> 2) regulator

I'd just start with a skeleton regulator ("PMIC") driver...

> In that case, we can share regmap to sub devices. But these drivers are not currently planned.
>
> Apart from that,
>
> 1) It avoids subsystem dependencies, ie, PMIC driver directly calling rtc driver
>    for registering RTC device.

You mean the direct call into raa215300_rtc_probe_helper()?
I think that can be solved by enhancing i2c_new_ancillary_device() to
take a proper device name, instead of using "dummy"?

> 2) I guess, the current split will also give some modular design.
>    We have a control to enable or disable the driver.
>    ie, Enable the driver PMIC with RTC enabled and
>    disable the driver PMIC with RTC not enabled(ie, XIN/XOUT grounded) in the system design
>    by controlling the config "PMIC_RAA215300_RTC".

You already have CONFIG_RTC_DRV_ISL1208, and look at
"renesas,rtc-enabled" before activating the RTC?

> These are the reasons for creating MFD driver and platform device.
>
> I may be totally wrong. Please correct me if that is the case.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
