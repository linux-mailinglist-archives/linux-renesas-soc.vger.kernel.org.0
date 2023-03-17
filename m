Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA1EA6BE2A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 09:08:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231244AbjCQIIZ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 04:08:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjCQIIQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 04:08:16 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FF4BDD38;
        Fri, 17 Mar 2023 01:07:21 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id c18so4774240qte.5;
        Fri, 17 Mar 2023 01:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679040360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oiBNpcqVruEqdjF2ccOLaSLyzZAn28c0EtFitGpqBZ0=;
        b=V1SDKnw7nbSkfSTV83bJLBcoRdsRUjSfkmwY8BE+bFoxHtZ6itu9t4tmKChoj+i8M2
         zFaZYxBMv28939tREprS0i1aWcFJ151YDwELVm+L6CFKPVsWIyf6h+iz4ai8j3/REAT8
         SGCZHWGp01XE8EQrC54tT7Y+N4n5YC0GFD6hzLg1ivcOEAiv83rHr8wW5IQlxaZc+FUM
         dx6IAdBEZkEr+Pd2VSDDHZ1RvaMMdoAV9F3og3pv8nVD/2aCl+n1z43lMcfYCEY/RRiz
         jw5FlvfsflNfKy7bz/6fkBAWclezPFFmCS2uG6bPDMXi+nuFIXAvzIPH7Cj7pLcmXjHO
         U9Ow==
X-Gm-Message-State: AO0yUKVps2KdZHAowEfQAuX+CRfgATWPdHT/FcVz1XADjohGRCFWLTmH
        +RDuGyu/py9rhuhtYeDFo8Ga+ylek6K/AabE
X-Google-Smtp-Source: AK7set/biMz7a2WAHN069Dw2BG/DZecb9K3r2TvtQAU6b7+HOiZVyRDnrnZTb1EwhBvkqYU3nlgVXQ==
X-Received: by 2002:ac8:570f:0:b0:3bf:bfd8:d644 with SMTP id 15-20020ac8570f000000b003bfbfd8d644mr10061509qtw.51.1679040359898;
        Fri, 17 Mar 2023 01:05:59 -0700 (PDT)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id n63-20020a37bd42000000b0074269db4699sm1239853qkf.46.2023.03.17.01.05.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 01:05:59 -0700 (PDT)
Received: by mail-yb1-f179.google.com with SMTP id i6so4701277ybu.8;
        Fri, 17 Mar 2023 01:05:59 -0700 (PDT)
X-Received: by 2002:a05:6902:188:b0:a99:de9d:d504 with SMTP id
 t8-20020a056902018800b00a99de9dd504mr29761325ybh.12.1679040359102; Fri, 17
 Mar 2023 01:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
 <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com> <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Mar 2023 09:05:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com>
Message-ID: <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
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

Hi Biju,

On Fri, Mar 17, 2023 at 8:59 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
> > On Thu, Mar 16, 2023 at 5:34 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt
> > > > handler
> >
> > > > On Thu, Mar 16, 2023 at 5:01 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > > The RZ SCI/ RZ/A1 SCIF has only 4 interrupts. The fourth interrupt
> > > > > is transmit end interrupt, so shuffle the interrupts to fix the
> > > > > transmit end interrupt handler for these IPs.
> > > > >
> > > > > Fixes: 392fb8df528b ("serial: sh-sci: Use
> > > > > platform_get_irq_optional() for optional interrupts")
> > > >
> > > > I don't think that's the right bad commit.
> > >
> > > OK. I will use below commit as fixes one, that is the commit which
> > > added RZ/A1 SCIF with 4 interrupts.
> > >
> > > commit 8b0bbd956228ae87 ("serial: sh-sci: Add support for R7S9210")
> >
> > That one added support for RZ/A2, and is also not the bad commit?
>
> OK will use below one,
>
> Fixes: 4c84c1b3acca ("ARM: shmobile: r7s72100: add scif nodes to dtsi")

This really starts to look like a guessing game... Beep ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
