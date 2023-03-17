Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E18BC6BE4DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 10:06:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231184AbjCQJGU convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 05:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbjCQJFy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 05:05:54 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97D66B31C;
        Fri, 17 Mar 2023 02:04:50 -0700 (PDT)
Received: by mail-qt1-f175.google.com with SMTP id i24so4866641qtm.6;
        Fri, 17 Mar 2023 02:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679043865;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeZTCGA8u9v5F9AKRVuEfBxEIQ9/fN4WoL+NPgxgS84=;
        b=QYi1G3ob+JbBtvKDg2Rbde5rz9qWMk/8wSktTcUPw1Xtnz3uZMRm0lNPAUOB1WqZCm
         4JcT/pY6gDrQHGQko02dZMh5MI74Vvz0nc/uiR3eE5Mkskl14elavczjDpdJ9QRIb9fW
         XB8QjgDXr+RYkwY0SMcemTEoovLJAWZ+GQVkTksON0Lg9UbILdtK63vC40qTTEPVVORG
         GTzg4wjFlw04vP9uS4RLvGSMiA18hstGNI/PUQwVgCnzpzp/oS71cJrfD8+R0wMWTYIL
         e/3oqgTOYbidAjL+Hoen7xz13uZbE3PKhjvFBUfc49/WeU5zugxcJDqjhh9idicx5vS+
         NQIw==
X-Gm-Message-State: AO0yUKUjWEOcfrZed0rwVCaF96KNmVu6ujm40z8MvEwQVpKe++iVgENG
        qYh6S5FyA81VKMTlYrzI+Y6/sW8f6g6XVEHT
X-Google-Smtp-Source: AK7set/KMTw1nzGfrLpTbNX43Vhqgnz6WGhlLAuvL7Q+Tuz8XYoKyr0SNzEstZ1RJtvyDzvkdcZv+g==
X-Received: by 2002:a05:622a:190f:b0:3d6:d055:72af with SMTP id w15-20020a05622a190f00b003d6d05572afmr11567965qtc.53.1679043865561;
        Fri, 17 Mar 2023 02:04:25 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id c9-20020ac80549000000b003d8d1ec2672sm951208qth.89.2023.03.17.02.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 02:04:25 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-544787916d9so81556267b3.13;
        Fri, 17 Mar 2023 02:04:24 -0700 (PDT)
X-Received: by 2002:a81:ad5a:0:b0:544:4008:baa1 with SMTP id
 l26-20020a81ad5a000000b005444008baa1mr4383372ywk.4.1679043864364; Fri, 17 Mar
 2023 02:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
 <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
 <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com> <TYCPR01MB593390150CAC755AE540D7D586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB593390150CAC755AE540D7D586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Mar 2023 10:04:12 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVmz_JNmC7Fk03zpaZY+MiBAgvFUc1Tnr+w=wHjbgeSug@mail.gmail.com>
Message-ID: <CAMuHMdVmz_JNmC7Fk03zpaZY+MiBAgvFUc1Tnr+w=wHjbgeSug@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Mar 17, 2023 at 9:08 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
> > On Fri, Mar 17, 2023 at 8:59 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt
> > > > handler On Thu, Mar 16, 2023 at 5:34 PM Biju Das
> > <biju.das.jz@bp.renesas.com> wrote:
> > > > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end
> > > > > > interrupt handler
> > > >
> > > > > > On Thu, Mar 16, 2023 at 5:01 PM Biju Das
> > > > > > <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > > > > The RZ SCI/ RZ/A1 SCIF has only 4 interrupts. The fourth
> > > > > > > interrupt is transmit end interrupt, so shuffle the interrupts
> > > > > > > to fix the transmit end interrupt handler for these IPs.
> > > > > > >
> > > > > > > Fixes: 392fb8df528b ("serial: sh-sci: Use
> > > > > > > platform_get_irq_optional() for optional interrupts")
> > > > > >
> > > > > > I don't think that's the right bad commit.
> > > > >
> > > > > OK. I will use below commit as fixes one, that is the commit which
> > > > > added RZ/A1 SCIF with 4 interrupts.
> > > > >
> > > > > commit 8b0bbd956228ae87 ("serial: sh-sci: Add support for
> > > > > R7S9210")
> > > >
> > > > That one added support for RZ/A2, and is also not the bad commit?
> > >
> > > OK will use below one,
> > >
> > > Fixes: 4c84c1b3acca ("ARM: shmobile: r7s72100: add scif nodes to
> > > dtsi")
> >
> > This really starts to look like a guessing game... Beep ;-)
>
> Already there is a generic compatible in driver, where we started introducing RZ/A1 SoC
> With 4 interrupts. So addition of this SoC has this issue. Am I missing anything here?

The rabbit hole seems to be deeper than I thought...

Looking at the code, the driver always assumed the fourth interrupt
is BRI, which matches the RZ/A1 datasheet for SCIF.
So the 4 IRQ case is really a subset of the 6 IRQ case, and
Documentation/devicetree/bindings/serial/renesas,scif.yaml
is wrong.

However, SCI(g) is the odd one (also on SH): it has TEI as the fourth
IRQ, which I probably missed when doing the json-schema conversion
in commit 384d00fae8e51f8f ("dt-bindings: serial: sh-sci: Convert to
json-schema"), leading to the bug in scif.yaml.

Note that the driver never looks at the interrupt names, but uses
indices exclusively.

So I guess SCI has been broken on SH since forever, too?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
