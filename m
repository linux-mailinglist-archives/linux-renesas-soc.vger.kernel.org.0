Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC3F26BE4E6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 10:06:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231461AbjCQJGv convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 05:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjCQJG2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 05:06:28 -0400
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43D4B76162;
        Fri, 17 Mar 2023 02:05:33 -0700 (PDT)
Received: by mail-qt1-f177.google.com with SMTP id c19so4835555qtn.13;
        Fri, 17 Mar 2023 02:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679043932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+OA5MMt5Y5V72Th0bOQ3M0lUK/k9CNHgIeBGW+LOME=;
        b=c7Taz1u+84NhNV1f+uicn3JMR/1gMUEaOLKcp/a6mwrVQUa5LKt59j+uiJD7JFT9jB
         Kel0kOYGQmmgT4lgniphmugigezBPiSvNrtlHaVDV3cKMX3iZj1GR/gmWRBO2tJYlO9Z
         fonZTGinW2HtnhTk13fcrYm3Z4M9Qr9EsjKWeebGtqqtagbFUFPVqc6xSjlQYu0J5MfW
         QvTXp9I1feYiFwZ1BL/nB/9p2C5g/bK1EzEx+tbHcqDED3gKosOtFTDKvhPsnz4/H0Pr
         9eCUAbbdrqCanbB3C9UfEpCAX/dP4KbDPDOyWyw1E3J22ipKZ9aTpcw++4OwHDhW+dtP
         BC9Q==
X-Gm-Message-State: AO0yUKXAmvYsV/uzKK3VppKqAaihQuPiBMub0REE4WJs1kLz1RbSt9x4
        saafH2BQOXJKxqKQPYvehz+UyPLfNhbTS4zn
X-Google-Smtp-Source: AK7set9o2XCIU9itJGz4S33QkiY2Ftf7EkmLQx39f8SU+96qGea0gPWFElkQcaIbiNfz37OaTSRzug==
X-Received: by 2002:ac8:7d48:0:b0:3da:7226:7539 with SMTP id h8-20020ac87d48000000b003da72267539mr2196983qtb.66.1679043932199;
        Fri, 17 Mar 2023 02:05:32 -0700 (PDT)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com. [209.85.219.172])
        by smtp.gmail.com with ESMTPSA id p16-20020a05620a057000b00746476405bbsm1262913qkp.122.2023.03.17.02.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 02:05:31 -0700 (PDT)
Received: by mail-yb1-f172.google.com with SMTP id e71so4870063ybc.0;
        Fri, 17 Mar 2023 02:05:31 -0700 (PDT)
X-Received: by 2002:a05:6902:102d:b0:b56:1f24:7e9f with SMTP id
 x13-20020a056902102d00b00b561f247e9fmr4429240ybt.12.1679043930887; Fri, 17
 Mar 2023 02:05:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
 <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
 <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com>
 <TYCPR01MB593390150CAC755AE540D7D586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <TYCPR01MB5933865E5D673865B7C4A85586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB5933865E5D673865B7C4A85586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Mar 2023 10:05:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWjkvz0TuywBz38BobSc+hw=FfgeTaq4qwUA6YxJofRbA@mail.gmail.com>
Message-ID: <CAMuHMdWjkvz0TuywBz38BobSc+hw=FfgeTaq4qwUA6YxJofRbA@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Mar 17, 2023 at 10:00 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: RE: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
> > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt
> > > handler
> > > On Fri, Mar 17, 2023 at 8:59 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end
> > > > > interrupt handler On Thu, Mar 16, 2023 at 5:34 PM Biju Das
> > > <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end
> > > > > > > interrupt handler
> > > > >
> > > > > > > On Thu, Mar 16, 2023 at 5:01 PM Biju Das
> > > > > > > <biju.das.jz@bp.renesas.com>
> > > > > wrote:
> > > > > > > > The RZ SCI/ RZ/A1 SCIF has only 4 interrupts. The fourth
> > > > > > > > interrupt is transmit end interrupt, so shuffle the
> > > > > > > > interrupts to fix the transmit end interrupt handler for these
> > IPs.
> > > > > > > >
> > > > > > > > Fixes: 392fb8df528b ("serial: sh-sci: Use
> > > > > > > > platform_get_irq_optional() for optional interrupts")
> > > > > > >
> > > > > > > I don't think that's the right bad commit.
> > > > > >
> > > > > > OK. I will use below commit as fixes one, that is the commit
> > > > > > which added RZ/A1 SCIF with 4 interrupts.
> > > > > >
> > > > > > commit 8b0bbd956228ae87 ("serial: sh-sci: Add support for
> > > > > > R7S9210")
> > > > >
> > > > > That one added support for RZ/A2, and is also not the bad commit?
> > > >
> > > > OK will use below one,
> > > >
> > > > Fixes: 4c84c1b3acca ("ARM: shmobile: r7s72100: add scif nodes to
> > > > dtsi")
> > >
> > > This really starts to look like a guessing game... Beep ;-)
> >
> > Already there is a generic compatible in driver, where we started
> > introducing RZ/A1 SoC With 4 interrupts. So addition of this SoC has this
> > issue. Am I missing anything here?
>
> Wolfram, Can you please confirm transmit end interrupt handler worked for you
> with the commit 4c84c1b3acca ("ARM: shmobile: r7s72100: add scif nodes to dtsi")

That issue is moot: the fourth IRQ on RZ/A1 is BRI, not TEI, cfr. my
previous email.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
