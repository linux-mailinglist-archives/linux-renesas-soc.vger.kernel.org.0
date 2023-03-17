Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18A526BE5C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 10:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230396AbjCQJie convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 05:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229962AbjCQJid (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 05:38:33 -0400
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7B58F973;
        Fri, 17 Mar 2023 02:38:30 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id ek9so4910602qtb.10;
        Fri, 17 Mar 2023 02:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679045909;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsCq8YQ+W1XVMJdk2YBKvXu+QZ29S8+6J3vaLCcfh6g=;
        b=CLkwbGXZge/KXGgdJISrKObQzRNPEbqSB/dt7GqEE+4Ugwj0OsT0BSVV0dK5DyzID3
         FFwYEiM432JexaTgGXZc4LxqdK75DSGo6/D3RLj902FQBVuAAy+JHav33aMhLMmdbZxl
         gW8Ff2QefjilmGLygYWdSV9JvTNiS0BpPj5kNs3Pes8gpmX1FrY1PV46qtjaxj5VbsDk
         1sSjsGPRO39omcbXZIgJIcrT0bircJMZqogZnY2UTsdgPQNcWQAyGLfHXRHRmF9I578I
         V3sOfxoVuOB6m/8FkfsBKUI1/AwUVqqDbqsOPGoPHfA6eRfnbRMaE5PIRk6z0Xow2WyZ
         0B7A==
X-Gm-Message-State: AO0yUKWEtONzjMLuH0mjWgUf0xfN9FzBfJ91cyZzfMlNs0ETtnJl02g3
        N43V3xRAdAolST8VwtS/yAtcK2tdghpUq/vI
X-Google-Smtp-Source: AK7set99n2PukNR2AiKOAn8xx38BBpGVFlyUIM0AItrs0me7KZj37DSVOEOr9jLkWVe/T4y/bhw4EQ==
X-Received: by 2002:ac8:5d8a:0:b0:3b8:118d:83d9 with SMTP id d10-20020ac85d8a000000b003b8118d83d9mr11518896qtx.4.1679045909486;
        Fri, 17 Mar 2023 02:38:29 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id w5-20020ac86b05000000b003b9bca1e093sm1233449qts.27.2023.03.17.02.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 02:38:28 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5447d217bc6so83392547b3.7;
        Fri, 17 Mar 2023 02:38:28 -0700 (PDT)
X-Received: by 2002:a81:a947:0:b0:544:4008:baa6 with SMTP id
 g68-20020a81a947000000b005444008baa6mr3968790ywh.4.1679045908379; Fri, 17 Mar
 2023 02:38:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
 <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
 <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com>
 <TYCPR01MB593390150CAC755AE540D7D586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdVmz_JNmC7Fk03zpaZY+MiBAgvFUc1Tnr+w=wHjbgeSug@mail.gmail.com> <OS0PR01MB59228F2CA5A579AEE793A67486BD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59228F2CA5A579AEE793A67486BD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Mar 2023 10:38:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW5jpnFBsHPbTE9QEbEYUNW9S0Qz93gg3QusLe0aSSbGg@mail.gmail.com>
Message-ID: <CAMuHMdW5jpnFBsHPbTE9QEbEYUNW9S0Qz93gg3QusLe0aSSbGg@mail.gmail.com>
Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Stephen Boyd <swboyd@chromium.org>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
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

CC linux-sh

On Fri, Mar 17, 2023 at 10:15 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
> > On Fri, Mar 17, 2023 at 9:08 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt
> > > > handler On Fri, Mar 17, 2023 at 8:59 AM Biju Das
> > <biju.das.jz@bp.renesas.com> wrote:
> > > > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end
> > > > > > interrupt handler On Thu, Mar 16, 2023 at 5:34 PM Biju Das
> > > > <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end
> > > > > > > > interrupt handler
> > > > > >
> > > > > > > > On Thu, Mar 16, 2023 at 5:01 PM Biju Das
> > > > > > > > <biju.das.jz@bp.renesas.com>
> > > > > > wrote:
> > > > > > > > > The RZ SCI/ RZ/A1 SCIF has only 4 interrupts. The fourth
> > > > > > > > > interrupt is transmit end interrupt, so shuffle the
> > > > > > > > > interrupts to fix the transmit end interrupt handler for these
> > IPs.
> > > > > > > > >
> > > > > > > > > Fixes: 392fb8df528b ("serial: sh-sci: Use
> > > > > > > > > platform_get_irq_optional() for optional interrupts")
> > > > > > > >
> > > > > > > > I don't think that's the right bad commit.
> > > > > > >
> > > > > > > OK. I will use below commit as fixes one, that is the commit
> > > > > > > which added RZ/A1 SCIF with 4 interrupts.
> > > > > > >
> > > > > > > commit 8b0bbd956228ae87 ("serial: sh-sci: Add support for
> > > > > > > R7S9210")
> > > > > >
> > > > > > That one added support for RZ/A2, and is also not the bad commit?
> > > > >
> > > > > OK will use below one,
> > > > >
> > > > > Fixes: 4c84c1b3acca ("ARM: shmobile: r7s72100: add scif nodes to
> > > > > dtsi")
> > > >
> > > > This really starts to look like a guessing game... Beep ;-)
> > >
> > > Already there is a generic compatible in driver, where we started
> > > introducing RZ/A1 SoC With 4 interrupts. So addition of this SoC has this
> > issue. Am I missing anything here?
> >
> > The rabbit hole seems to be deeper than I thought...
> >
> > Looking at the code, the driver always assumed the fourth interrupt is BRI,
> > which matches the RZ/A1 datasheet for SCIF.
> > So the 4 IRQ case is really a subset of the 6 IRQ case, and
> > Documentation/devicetree/bindings/serial/renesas,scif.yaml
> > is wrong.
>
> OK.
>
> >
> > However, SCI(g) is the odd one (also on SH): it has TEI as the fourth IRQ,
> > which I probably missed when doing the json-schema conversion in commit
> > 384d00fae8e51f8f ("dt-bindings: serial: sh-sci: Convert to json-schema"),
> > leading to the bug in scif.yaml.
> >
> > Note that the driver never looks at the interrupt names, but uses indices
> > exclusively.
> >
> > So I guess SCI has been broken on SH since forever, too?
>
> I think so, by looking at the changes done in tx to make it work on RZ/G2UL.
> On RZ/G2UL both rx and tx is broken.
>
> Not sure SCI is tested ever on SH platform??
>
> Can any SH platform person confirm this?

SCI is only supported on
  - sh770x,
  - sh7750 (excluding rts7751r2d)
    I know it's not exposed on my landisk,
  - sh7760, for the SIM-port, which I doubt anyone uses.

FTR, I tried the "obvious" thing (remove the rts7751r2d-checks in
arch/sh/kernel/cpu/sh4/setup-sh7750.c, and replace sci_br_interrupt
as the interrupt handler by sci_tx_interrupt in sh-sci.c), but that
didn't make ttySC0 work on qemu/rts7751r2d.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
