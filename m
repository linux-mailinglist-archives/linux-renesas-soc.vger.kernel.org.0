Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3D606FC031
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 May 2023 09:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235130AbjEIHLG convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 May 2023 03:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234757AbjEIHLE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 May 2023 03:11:04 -0400
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89846D04B
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 May 2023 00:11:03 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-b9d9dad9edfso7337983276.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 00:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683616262; x=1686208262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a1h6FvPTz4s6/8fsVb7cAY4gm8CieZ+VSulEjgRmeDU=;
        b=bEM0GLBFzv2RHzq7zs6KO3TJg85Mq9yDPXlaQLdpXXUk/hHWcx+MZUzedLoZxatHdA
         Bx9aiJQYTsvpG+oQuTTa97yxltGFGvyQcDjICsNdqane0vce6jnLWaNbAyccVglB4prH
         m9CgZIBL0rFNnatcXvfakVGXPQQ6e2E1xNRRsPHVFbp/6hPnF1wZUQHjXqMVGr6dFvQe
         DbFJuGUX2XH0Wu7HJ5KVjQeTUj/DtnK5UUcEwPdV5mo/dG3A74oZsvkjLNeJeue8pqv0
         uNYc8dHJedatkd1Zu32u8/fwM1Gaq1nbieahY/VZ3M6Vez74zvnPYxgeoSsYlsDxI1/l
         jpDA==
X-Gm-Message-State: AC+VfDw8YvVDOePWE9e+wxG3ZVkpqsKbesvr99XlNGn88XB+tcxVJ0hf
        656bcZYW7TQ/XvklUZ0vyidR1cwqM79f1Q==
X-Google-Smtp-Source: ACHHUZ5ACimMIKqDYgvk/0aasHxl2nQTvspyuF45HKN7+AcCHkyg31QNsj4Nmuv42V2S/EpHJXznPQ==
X-Received: by 2002:a25:424c:0:b0:b9f:7e98:7ceb with SMTP id p73-20020a25424c000000b00b9f7e987cebmr13557206yba.5.1683616262541;
        Tue, 09 May 2023 00:11:02 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id n200-20020a25d6d1000000b00b9f1992112dsm2908479ybg.0.2023.05.09.00.11.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 00:11:01 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-559debdedb5so82850677b3.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 May 2023 00:11:01 -0700 (PDT)
X-Received: by 2002:a81:4e8a:0:b0:55a:886c:bfc3 with SMTP id
 c132-20020a814e8a000000b0055a886cbfc3mr15709444ywb.7.1683616261141; Tue, 09
 May 2023 00:11:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230505172530.357455-1-biju.das.jz@bp.renesas.com>
 <20230505172530.357455-5-biju.das.jz@bp.renesas.com> <OS0PR01MB5922CB267130D6E5DBE4AD1086769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922CB267130D6E5DBE4AD1086769@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 9 May 2023 09:10:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU36vONu2GMKYZwtLPo_+CDYnWKDXjMytAg0r6BPRUv7Q@mail.gmail.com>
Message-ID: <CAMuHMdU36vONu2GMKYZwtLPo_+CDYnWKDXjMytAg0r6BPRUv7Q@mail.gmail.com>
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

On Tue, May 9, 2023 at 9:06 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: [PATCH v2 4/5] mfd: Add Renesas PMIC RAA215300 RTC driver
> >
> > Currently, it is not possible to instantiate the i2c client driver using MFD
> > cell as it is not a platform driver. Add support for Renesas PMIC
> > RAA215300 RTC platform driver, so that it can be instantiated by MFD API.
> > The rtc device is created by using i2c_new_ancillary_device() and it
> > register as the rtc device by the helper function provided by
> > rtc-isl2108 driver.
>
> Not sure this platform driver has to be placed in RTC subsystem rather than MFD subsystem
> as PMIC MFD driver, can instantiate it using MFD cell??

Can't you just instantiate the i2c ancillary device from the PMIC driver,
and drop the new mfd and platform rtc drivers?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
