Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 660BA6BEB4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Mar 2023 15:31:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231173AbjCQObR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Mar 2023 10:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231133AbjCQObQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2023 10:31:16 -0400
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 400C683E5;
        Fri, 17 Mar 2023 07:31:14 -0700 (PDT)
Received: by mail-qv1-f49.google.com with SMTP id x8so3531784qvr.9;
        Fri, 17 Mar 2023 07:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679063473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18LJijTgRpqM1Yg2wC6MYZWNjIKdYJXuFIFGyOzCuCQ=;
        b=ejh78tJgm9A5EAGlRxT7Ju9/ElxjUADIGzo7Ms198X9UZn4ZiCyCC+l+mFj2EdHKXN
         QX+fkyOUk91mM0EW5bGJ45dXG5GC/ZvohosXI38YPkCnQKorpQKF8oQkgUs4KsCarz1z
         PN5KQz7/LI9Qccps4oIvXLU/gyXuhQ9o1CqMzY20umSITEyi7ZJlpqYKdkfZEd7f25In
         F1q6avuEOA25NEeZqJ+kouL6p2IxgZb/vwqsUFIy6QdDpXmm8a/M+uaQ3b1WOA/yFL8F
         jJl+uV/DvNzk0YWHuBJMTWhnbKn3U4RCka0reujp+FakLll2nTsbgamyqL7djjExGfVv
         7qkA==
X-Gm-Message-State: AO0yUKXblF7iHW03nYGGQPNA2fa0+z/OxuCVR5q6OYRJl8LK41JidyaT
        ds0ERp7EQewWE4gsxl6tZoo3lwGMVxz5SHDg
X-Google-Smtp-Source: AK7set8+PQmOd4fM/VXJEN0Rz2QdIa31bU44nMZ3uFVWx6OuiTRSfy47Zhbn31E2IkS1BeqipNhrHA==
X-Received: by 2002:a05:6214:27eb:b0:5b1:1ee:c998 with SMTP id jt11-20020a05621427eb00b005b101eec998mr13302644qvb.22.1679063472915;
        Fri, 17 Mar 2023 07:31:12 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id f20-20020a05620a409400b00742e61999a3sm1786348qko.64.2023.03.17.07.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 07:31:11 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-53d277c1834so97169187b3.10;
        Fri, 17 Mar 2023 07:31:11 -0700 (PDT)
X-Received: by 2002:a81:ae5e:0:b0:541:a17f:c779 with SMTP id
 g30-20020a81ae5e000000b00541a17fc779mr4681092ywk.4.1679063471024; Fri, 17 Mar
 2023 07:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230316160118.133182-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVX=sM-1y+-3PQDsjf8K3nLoS4WfSYfv6UAP=92T_oHaQ@mail.gmail.com>
 <OS0PR01MB5922EA7DC64F0D2C36B490A986BC9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXgwkJ2O7y98HW6n8SOgbuEx1uFrt1Jc-X2CzpC3y1P0Q@mail.gmail.com>
 <TYCPR01MB593334BB3847CCC45A1B6C7286BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdUN=0aJ-7huv0XrhG3LMu8q_SEuqHU48ytTgGAYEjng5A@mail.gmail.com>
 <TYCPR01MB593390150CAC755AE540D7D586BD9@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <CAMuHMdVmz_JNmC7Fk03zpaZY+MiBAgvFUc1Tnr+w=wHjbgeSug@mail.gmail.com>
 <OS0PR01MB59228F2CA5A579AEE793A67486BD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdW5jpnFBsHPbTE9QEbEYUNW9S0Qz93gg3QusLe0aSSbGg@mail.gmail.com> <OS0PR01MB59220E5FA2CDC27108DB926C86BD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB59220E5FA2CDC27108DB926C86BD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 17 Mar 2023 15:30:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWcizpvQQ2A4bMLDfCHFmy_0MHL2ao62Ujiv4J28deGSA@mail.gmail.com>
Message-ID: <CAMuHMdWcizpvQQ2A4bMLDfCHFmy_0MHL2ao62Ujiv4J28deGSA@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Fri, Mar 17, 2023 at 2:47 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt handler
> > On Fri, Mar 17, 2023 at 10:15 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end interrupt
> > > > handler On Fri, Mar 17, 2023 at 9:08 AM Biju Das
> > <biju.das.jz@bp.renesas.com> wrote:
> > > > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end
> > > > > > interrupt handler On Fri, Mar 17, 2023 at 8:59 AM Biju Das
> > > > <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit end
> > > > > > > > interrupt handler On Thu, Mar 16, 2023 at 5:34 PM Biju Das
> > > > > > <biju.das.jz@bp.renesas.com> wrote:
> > > > > > > > > > Subject: Re: [PATCH] tty: serial: sh-sci: Fix transmit
> > > > > > > > > > end interrupt handler
> > > > > > > >
> > > > > > > > > > On Thu, Mar 16, 2023 at 5:01 PM Biju Das
> > > > > > > > > > <biju.das.jz@bp.renesas.com>
> > > > > > > > wrote:
> > > > > > > > > > > The RZ SCI/ RZ/A1 SCIF has only 4 interrupts. The
> > > > > > > > > > > fourth interrupt is transmit end interrupt, so shuffle
> > > > > > > > > > > the interrupts to fix the transmit end interrupt
> > > > > > > > > > > handler for these
> > > > IPs.
> > > > > > > > > > >
> > > > > > > > > > > Fixes: 392fb8df528b ("serial: sh-sci: Use
> > > > > > > > > > > platform_get_irq_optional() for optional interrupts")
> > > > > > > > > >
> > > > > > > > > > I don't think that's the right bad commit.
> > > > > > > > >
> > > > > > > > > OK. I will use below commit as fixes one, that is the
> > > > > > > > > commit which added RZ/A1 SCIF with 4 interrupts.
> > > > > > > > >
> > > > > > > > > commit 8b0bbd956228ae87 ("serial: sh-sci: Add support for
> > > > > > > > > R7S9210")
> > > > > > > >
> > > > > > > > That one added support for RZ/A2, and is also not the bad
> > commit?
> > > > > > >
> > > > > > > OK will use below one,
> > > > > > >
> > > > > > > Fixes: 4c84c1b3acca ("ARM: shmobile: r7s72100: add scif nodes
> > > > > > > to
> > > > > > > dtsi")
> > > > > >
> > > > > > This really starts to look like a guessing game... Beep ;-)
> > > > >
> > > > > Already there is a generic compatible in driver, where we started
> > > > > introducing RZ/A1 SoC With 4 interrupts. So addition of this SoC
> > > > > has this
> > > > issue. Am I missing anything here?
> > > >
> > > > The rabbit hole seems to be deeper than I thought...
> > > >
> > > > Looking at the code, the driver always assumed the fourth interrupt
> > > > is BRI, which matches the RZ/A1 datasheet for SCIF.
> > > > So the 4 IRQ case is really a subset of the 6 IRQ case, and
> > > > Documentation/devicetree/bindings/serial/renesas,scif.yaml
> > > > is wrong.
> > >
> > > OK.
> > >
> > > >
> > > > However, SCI(g) is the odd one (also on SH): it has TEI as the
> > > > fourth IRQ, which I probably missed when doing the json-schema
> > > > conversion in commit 384d00fae8e51f8f ("dt-bindings: serial: sh-sci:
> > > > Convert to json-schema"), leading to the bug in scif.yaml.
> > > >
> > > > Note that the driver never looks at the interrupt names, but uses
> > > > indices exclusively.
> > > >
> > > > So I guess SCI has been broken on SH since forever, too?
> > >
> > > I think so, by looking at the changes done in tx to make it work on
> > RZ/G2UL.
> > > On RZ/G2UL both rx and tx is broken.
> > >
> > > Not sure SCI is tested ever on SH platform??
> > >
> > > Can any SH platform person confirm this?
> >
> > SCI is only supported on
> >   - sh770x,
> >   - sh7750 (excluding rts7751r2d)
> >     I know it's not exposed on my landisk,
> >   - sh7760, for the SIM-port, which I doubt anyone uses.
> >
> > FTR, I tried the "obvious" thing (remove the rts7751r2d-checks in
> > arch/sh/kernel/cpu/sh4/setup-sh7750.c, and replace sci_br_interrupt as the
> > interrupt handler by sci_tx_interrupt in sh-sci.c), but that didn't make
> > ttySC0 work on qemu/rts7751r2d.
>
> I am not seeing any SH platform SoCs in[1] and RZ/A2 does not have any SCI nodes
> defined in dts,

Most SH platforms have not been converted to DT yet:

$ git grep -w PORT_SCI -- arch/sh
arch/sh/kernel/cpu/sh3/setup-sh770x.c:  .type           = PORT_SCI,
arch/sh/kernel/cpu/sh4/setup-sh7750.c:  .type           = PORT_SCI,
arch/sh/kernel/cpu/sh4/setup-sh7760.c:  .type           = PORT_SCI,

But I just realized the above are not affected, as they define either
1 or 3 interrupts for the SCI port instead of.

> So Shall I use the below fixes tag instead, as it is documented in dt bindings and is the first
> SoC with broken irq handler??
>
> Fixes: f9a2adcc9e90 ("arm64: dts: renesas: r9a07g044: Add SCI[0-1] nodes")

That's a DTS change, while the bug is in the driver?

The bug seems to be present in all versions since modern git of the
sh-sci serial driver.
More archaeology shows early versions used hardcoded lists of 3
interrupts for SCI, avoiding the issue. The even older sh-sci character
device driver registered only 3 interrupt handlers when built with
SCI support only.

So the issue only started to appear (if anyone noticed at all) with the
(removed) DT-based H8/300 architecture, which described 4 interrupts
in DT, which the sh-sci driver handles incorrectly.

So if you insist on a Fixes line:
Fixes: e1d0be616186906d ("sh-sci: Add h8300 SCI")

> With below check in driver.
>
> +       /*
> +        * The fourth interrupt on SCI port is transmit end interrupt, so
> +        * shuffle the interrupts.
> +        */
> +       if (p->type == PORT_SCI)
> +               swap(sci_port->irqs[SCIx_BRI_IRQ], sci_port->irqs[SCIx_TEI_IRQ]);

Thanks, LGTM.

Now back to the present time, I had enough archaeology ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
