Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4C546FC2FC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 11:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234640AbjEIJjz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 05:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234975AbjEIJjw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 05:39:52 -0400
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C70FEE5
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 02:39:50 -0700 (PDT)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-b9a824c3a95so7247699276.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 02:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683625190; x=1686217190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yA1oRiL3bzbafwbsFA/ciaeI/k2aExFqlEralJi2ogs=;
        b=dYl5c4/lXDa68xECt5MZqqRz2sk3lzPj3CLUd9qo4y4e+9x2y2YoyBUJNwS3rrLz5j
         Fj8bkn3MsU54ySolOikznU/z/Kp7QbgP3UUiov9PYb4/BIEO1Qnoz1TO96k2FA4xb/he
         mSkxlC/PgmIDK4DlsZjZqA2qOPsaxIu65aoVAy/l0BWUOcoo3aoNw8VqJmrHScZcF+Up
         hSgazjGmi2bYwbIZP9hFrdSMQoUElkT1di2Nkswc7lxneTojdbrGoyElFrNcEBVyZybr
         9u/HR47xNhPWRwOHe7VBdIU6ciLI2tTxeau8sNqBXe0NtzvjQpSWSy7UDigMo+fwPMw6
         3s0g==
X-Gm-Message-State: AC+VfDwUT1yEOQ3k1h7haGzVU13B4TdnR3rFyStz8AVyb2nv7fzbkYDn
        Er7to2K47dJv/vtcGaQ86gqGi/+h/R+NSg==
X-Google-Smtp-Source: ACHHUZ4Zkm6J0j51hRM698rw0xl0nU7cgsEW84f2fGHQrGvFxm0qVVcpIvgbTFS7bdMN+X8nCDNm6g==
X-Received: by 2002:a25:7355:0:b0:b9a:7cfe:9bed with SMTP id o82-20020a257355000000b00b9a7cfe9bedmr14813767ybc.14.1683625189684;
        Tue, 09 May 2023 02:39:49 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id w6-20020a258506000000b00b9e9286f1e6sm2843708ybk.55.2023.05.09.02.39.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 02:39:49 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-55a6efe95c9so82867427b3.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 02:39:48 -0700 (PDT)
X-Received: by 2002:a0d:ca8d:0:b0:55a:6d87:6431 with SMTP id
 m135-20020a0dca8d000000b0055a6d876431mr14859337ywd.26.1683625188689; Tue, 09
 May 2023 02:39:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
 <20230505172530.357455-5-biju.das.jz@bp.renesas.com> <OS0PR01MB5922CB267130D6E5DBE4AD1086769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdU36vONu2GMKYZwtLPo_+CDYnWKDXjMytAg0r6BPRUv7Q@mail.gmail.com>
 <OS0PR01MB5922474E0B42B6301DB1961986769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdV+kjU5Ymy70_fus+tvO6ENPY04QG0ANr2WtraPK0H45w@mail.gmail.com> <OS0PR01MB5922257A4BBA98232317C38286769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922257A4BBA98232317C38286769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 May 2023 11:39:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVECGJcYMYpPbDewNofWrrU4yE_hhyXm6GR1SdnX5q0pQ@mail.gmail.com>
Message-ID: <CAMuHMdVECGJcYMYpPbDewNofWrrU4yE_hhyXm6GR1SdnX5q0pQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Lee Jones <lee@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Wolfram Sang <wsa-dev@sang-engineering.com>
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

On Tue, May 9, 2023 at 11:32 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
> > On Tue, May 9, 2023 at 9:35 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > Subject: Re: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC
> > > > driver On Tue, May 9, 2023 at 9:06 AM Biju Das
> > <biju.das.jz@bp.renesas.com> wrote:
> > > > > > Subject: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC
> > > > > > driver
> > > > > >
> > > > > > Currently, it is not possible to instantiate the i2c client
> > > > > > driver using MFD cell as it is not a platform driver. Add
> > > > > > support for Renesas PMIC
> > > > > > RAA215300 RTC platform driver, so that it can be instantiated by
> > > > > > MFD
> > > > API.
> > > > > > The rtc device is created by using i2c_new_ancillary_device()
> > > > > > and it register as the rtc device by the helper function
> > > > > > provided by
> > > > > > rtc-isl2108 driver.
> > > > >
> > > > > Not sure this platform driver has to be placed in RTC subsystem
> > > > > rather than MFD subsystem as PMIC MFD driver, can instantiate it using
> > MFD cell??
> > > >
> > > > Can't you just instantiate the i2c ancillary device from the PMIC
> > > > driver, and drop the new mfd and platform rtc drivers?
> > >
> > > Yes, it is possible.
> > >
> > > The only reason MFD is used for future expansion like adding support
> > > for
> > >
> > > 1) battery charger
> > > Or
> > > 2) regulator
> >
> > I'd just start with a skeleton regulator ("PMIC") driver...
> >
> > > In that case, we can share regmap to sub devices. But these drivers are
> > not currently planned.
> > >
> > > Apart from that,
> > >
> > > 1) It avoids subsystem dependencies, ie, PMIC driver directly calling rtc
> > driver
> > >    for registering RTC device.
> >
> > You mean the direct call into raa215300_rtc_probe_helper()?
>
> Yes, indeed.
>
> > I think that can be solved by enhancing i2c_new_ancillary_device() to take a
> > proper device name, instead of using "dummy"?
>
> Geert, Wolfram,
>
> Any pointers for instantiating i2c_client device(for eg: rtc_isl1208.c)
> by enhancing i2c_new_ancillary_device() api?
>
> Apart for this, since a single compatible(the pmic one) is used,
>
> In rtc device probe, How do we identify this PMIC RTC device and use the "TYPE_ISL1208" config
> in RTC driver, once we instantiate RTC device?

You create ancillary devices with different names, based on the detected
PMIC version, and add new types for them to the isl1208 driver?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
