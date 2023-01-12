Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76624666FC8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 11:37:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235083AbjALKhG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 05:37:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234177AbjALKgY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 05:36:24 -0500
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC6DE59510
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 02:30:50 -0800 (PST)
Received: by mail-qv1-f53.google.com with SMTP id p17so12470006qvn.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 02:30:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7HZrNV8Kml0APCeUPuK1NS9APK2o00eP4lqvWX7AE8M=;
        b=BKZrD6+a7g9yWtDloGq4OZiK8YPPaY695J3GXIpELv5AdH6r3aD/CrKxWuMnzb3imt
         RoHF7HGJeWD1ojcRxzwhsl/mN2zWskXsnh+7pdg9BEYUdmH+t46cGA+zUPpvrl7kuSQ/
         /edZpnu7+zvM4sBmMsNfoj6XhvaTVfqx4/yXcnC8kXZfX7Or2vSBabDtrjdWYL3kO+3V
         itWMcoMK+eHmZexQ/UHnM/MatSuq8FrACQfn5IZgBKqqPejrxaxz31OgYe2V1C86ubvf
         5qpuGzFTlGbPKPsNg5DW6ZVPw4OOKNhf0OfIIgLYBN+fbOSnFlVsuQ3Dd8nA26akDMwR
         RyVw==
X-Gm-Message-State: AFqh2kpF/aQALwf78zv00voc1XzNQbMijLsXrWojTrLIgdutFiyYWQ11
        f1gXdAfnLyXJpJGW2lYr8XUF9QNLDuTtFA==
X-Google-Smtp-Source: AMrXdXsFIiuRg1zZ6N42GTHvYOeqRhB5W9Rmto5N1HRCLgtBRAZcZL/5uE65pkC4N4ZJo88klXNAKA==
X-Received: by 2002:a05:6214:a91:b0:531:7ff5:9927 with SMTP id ev17-20020a0562140a9100b005317ff59927mr87141987qvb.10.1673519449362;
        Thu, 12 Jan 2023 02:30:49 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id do45-20020a05620a2b2d00b006fba44843a5sm1243588qkb.52.2023.01.12.02.30.48
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 02:30:49 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id d62so1981892ybh.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 02:30:48 -0800 (PST)
X-Received: by 2002:a25:7:0:b0:7c1:b2e9:7e71 with SMTP id 7-20020a250007000000b007c1b2e97e71mr502447yba.604.1673519448608;
 Thu, 12 Jan 2023 02:30:48 -0800 (PST)
MIME-Version: 1.0
References: <20221222093252.3613915-1-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdW7LT-JNH-iPACLQfdS=oh_g-y2OXW-1R4xM5s+jWnUUQ@mail.gmail.com> <TYBPR01MB5341E6C6A0FF0D2B69B879BCD8FD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
In-Reply-To: <TYBPR01MB5341E6C6A0FF0D2B69B879BCD8FD9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 12 Jan 2023 11:30:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX2xJ=Tovo-VZMsPFn6zZ26=ZLtr0Uh7AGTE8MHV3ewsA@mail.gmail.com>
Message-ID: <CAMuHMdX2xJ=Tovo-VZMsPFn6zZ26=ZLtr0Uh7AGTE8MHV3ewsA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779f0: spider-cpu: Enable UFS device
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
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

Hi Shimoda-san,

On Thu, Jan 12, 2023 at 9:02 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> > From: Geert Uytterhoeven, Sent: Thursday, January 12, 2023 1:20 AM
> > On Thu, Dec 22, 2022 at 10:33 AM Yoshihiro Shimoda
> > <yoshihiro.shimoda.uh@renesas.com> wrote:
> > > Enable UFS device for R-Car S4-8 Spider CPU board.
> > >
> > > Note that the conditions of RC21012 on the Spider are:
> > >  - OUT11 (for UFS30_REFCLK_V) is disabled as default.
> > >  - OUT11 is controlled by GPIO0 pin.
> > >  - The GPIO0 pin is inverted sense (low active) and pull-up enabled.

> > > To output the clock, pin 4 of TCA9554 on the Spider board needs to
> > > output low level so that using "gpio-gate-clock" for it.
> >
> > Does this mean the GPIO setup was the only missing part,
> > and the i2c commands from [1] were not needed?
>
> You're correct.
>
> > I wanted to give this a try, but the remote Spider is offline.

The remote Spider access issue was fixed, and the three
UFS subdevices are detected fine.
Hdparm says 280 MB/s (compared to 170 for eMMC).

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
