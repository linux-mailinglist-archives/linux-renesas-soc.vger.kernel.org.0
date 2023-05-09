Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1197D6FC24A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 11:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232299AbjEIJGZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 05:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229523AbjEIJGY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 05:06:24 -0400
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95366CC
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 02:06:23 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-559debdedb5so84337007b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 02:06:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683623182; x=1686215182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wr9DsPgvLXIrLH1VcXsGKHS661TkzXIrwIpPm4tR9lI=;
        b=eaU6sydKVtFhXn3NeYnTicAqwwQTI3lxtem2K5TcloOY5FrHq+ByJnbUAkKMS8v3U9
         sIzaxaYSOwimKUlRvhFVXjYo3fq9GbCP822lZljme2Xk/u27mbfv4dri0AUaDxOBVMX+
         kQpG0GX3trHWzNgZ2kgOhoLCzEdd1y1VAPm5sBlvrBYT0LRUbQaRm0SQu879V1iBFEOw
         kV6Wz2LykNHtkL+FjIVuwGr2QCrrvFKvMlTlI4HFOksOGPhM1BoP0tY6dN9eLR8MRSi+
         aFfoxCEQXIt79QAifaQ0WoCPEupw/FdyLa4D+iSLrwZ/FrDJ+bOaRh8rTtiykFOR6UNJ
         ruSw==
X-Gm-Message-State: AC+VfDw1o5a96QsqurqYYPi1J5R89HWtn4HnHRC8SKvjhRVbgJjxodvo
        34OOCDcx15uG9dUm2xil2dpwG5ARdwtqIg==
X-Google-Smtp-Source: ACHHUZ4WipXxNORSkdLk2k3U4ng1xtOUIo+RsM86pkV9+gZFSH7C6GA6w8douLn7zKaA99lelit0VA==
X-Received: by 2002:a81:8a05:0:b0:556:1b32:343b with SMTP id a5-20020a818a05000000b005561b32343bmr13167835ywg.45.1683623182556;
        Tue, 09 May 2023 02:06:22 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id q81-20020a815c54000000b00552df52450csm3102578ywb.88.2023.05.09.02.06.22
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 02:06:22 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-559debdedb5so84336507b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 02:06:22 -0700 (PDT)
X-Received: by 2002:a0d:e6d5:0:b0:55a:30f5:3d65 with SMTP id
 p204-20020a0de6d5000000b0055a30f53d65mr14842078ywe.41.1683623181821; Tue, 09
 May 2023 02:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
 <20230505172530.357455-5-biju.das.jz@bp.renesas.com> <OS0PR01MB5922CB267130D6E5DBE4AD1086769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU36vONu2GMKYZwtLPo_+CDYnWKDXjMytAg0r6BPRUv7Q@mail.gmail.com>
 <OS0PR01MB5922474E0B42B6301DB1961986769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdV+kjU5Ymy70_fus+tvO6ENPY04QG0ANr2WtraPK0H45w@mail.gmail.com>
In-Reply-To: <CAMuHMdV+kjU5Ymy70_fus+tvO6ENPY04QG0ANr2WtraPK0H45w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 May 2023 11:06:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVfn-fKQXBPRR6SOcp7QkRJ42e8xgj71vQoguLbjBaWjg@mail.gmail.com>
Message-ID: <CAMuHMdVfn-fKQXBPRR6SOcp7QkRJ42e8xgj71vQoguLbjBaWjg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
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

CC Wolfram

On Tue, May 9, 2023 at 11:03 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, May 9, 2023 at 9:35 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > Subject: Re: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
> > > On Tue, May 9, 2023 at 9:06 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > > Subject: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
> > > > >
> > > > > Currently, it is not possible to instantiate the i2c client driver
> > > > > using MFD cell as it is not a platform driver. Add support for
> > > > > Renesas PMIC
> > > > > RAA215300 RTC platform driver, so that it can be instantiated by MFD
> > > API.
> > > > > The rtc device is created by using i2c_new_ancillary_device() and it
> > > > > register as the rtc device by the helper function provided by
> > > > > rtc-isl2108 driver.
> > > >
> > > > Not sure this platform driver has to be placed in RTC subsystem rather
> > > > than MFD subsystem as PMIC MFD driver, can instantiate it using MFD cell??
> > >
> > > Can't you just instantiate the i2c ancillary device from the PMIC driver,
> > > and drop the new mfd and platform rtc drivers?
> >
> > Yes, it is possible.
> >
> > The only reason MFD is used for future expansion like adding support for
> >
> > 1) battery charger
> > Or
> > 2) regulator
>
> I'd just start with a skeleton regulator ("PMIC") driver...
>
> > In that case, we can share regmap to sub devices. But these drivers are not currently planned.
> >
> > Apart from that,
> >
> > 1) It avoids subsystem dependencies, ie, PMIC driver directly calling rtc driver
> >    for registering RTC device.
>
> You mean the direct call into raa215300_rtc_probe_helper()?
> I think that can be solved by enhancing i2c_new_ancillary_device() to
> take a proper device name, instead of using "dummy"?
>
> > 2) I guess, the current split will also give some modular design.
> >    We have a control to enable or disable the driver.
> >    ie, Enable the driver PMIC with RTC enabled and
> >    disable the driver PMIC with RTC not enabled(ie, XIN/XOUT grounded) in the system design
> >    by controlling the config "PMIC_RAA215300_RTC".
>
> You already have CONFIG_RTC_DRV_ISL1208, and look at
> "renesas,rtc-enabled" before activating the RTC?
>
> > These are the reasons for creating MFD driver and platform device.
> >
> > I may be totally wrong. Please correct me if that is the case.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
