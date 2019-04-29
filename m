Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0A563E30A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 14:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728044AbfD2MtW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 08:49:22 -0400
Received: from mail-vk1-f193.google.com ([209.85.221.193]:46828 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727956AbfD2MtW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 08:49:22 -0400
Received: by mail-vk1-f193.google.com with SMTP id x2so2233170vkx.13;
        Mon, 29 Apr 2019 05:49:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=derKxdHvmEMuz4FzHHDQ6DWV/VvnnUQvUbRdCrLCHz4=;
        b=OXEcNXyQ/Q997r2tL4wqLx41UP0PqBwePvzHKDos708Nmxu4dmjuuWbTuyjOsYmjBH
         wPVtLkNpqG/csOgUQURUy196IxebJKbJV6NRj7B7w7C8OAug60R307bpMjBUDemrf5Vo
         9wcZjPCL+cSaEP9d2BeqNZKFnlweWGO3Koc/4mHr4avm9vIW67ndaBmaWxyCqIhns2KU
         YlVx4bbdptqieap4jO5IIj1NAeglsLcoZV9ynxPrr/FDS+KDLGGB0ENXczpO/ibuVmHE
         q0SLfrX+Ql/kk/HH4HOHuW0LCJopx4d5xDMwGQV9o0nmGMFpYQcRxGc2fl72oVJrdSUo
         Qu2A==
X-Gm-Message-State: APjAAAV4jwa4R03VdheQBNNF7+8R+YCXyvQbn1uffe8HP/pSO2WGQbd1
        32KR58YgJOLaS9D8HnLglYvhoqmreDz/Vp5TPa21erEX
X-Google-Smtp-Source: APXvYqxG2n52Gp61OsgKrozjMvhkBaNh4Tyy20fOyQtE92Psy4c0oP4Z1TxExIYIuyavUO2gmsZvW3TgJ+BYSOX4Eis=
X-Received: by 2002:a1f:1284:: with SMTP id 126mr32054800vks.72.1556542160610;
 Mon, 29 Apr 2019 05:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190429093631.10799-1-geert+renesas@glider.be> <TY1PR01MB15620A5958E5A9211518E0C48A390@TY1PR01MB1562.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB15620A5958E5A9211518E0C48A390@TY1PR01MB1562.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Apr 2019 14:49:08 +0200
Message-ID: <CAMuHMdUasEO1VLX1h5ZL8F2VjLXnSbrVOm6KdO6yuzkw9RWAfA@mail.gmail.com>
Subject: Re: [PATCH 0/5] ARM: rskrza1: Add RZ/A1 IRQC and input switches
To:     Chris Brandt <Chris.Brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Chris,

On Mon, Apr 29, 2019 at 2:21 PM Chris Brandt <Chris.Brandt@renesas.com> wrote:
> I've been hacking this support into the standard GIC driver in our BSPs
> for years now. :o

Yeah, and having that patch in your tree breaks all other GICs, as
I found out the hard way ;-)

> On Mon, Apr 29, 2019, Geert Uytterhoeven wrote:
> > I expect this driver to be reusable for RZ/A2, after adding a match
> > entry with .gic_spi_base = 4.
>
> Yes, the same IP block is in RZ/A2.
>
> So with that said, should we call this driver irq-renesas-rza1.c or just
> irq-renesas-rza.c?
> It doesn't really matter to me.
> For an RZ/A3, we might just use the same IP again.

I've learned to be reluctant to put too many wildcards in names, as it may
start to bite in the future. For driver names, it's not that bad (they can
be changed), but for DT, it's a no-go.

So for RZ/A2, I think it's best to use

    compatible = "renesas,r7s9210-irqc", "renesas,rza1-irqc";
    renesas,gic-spi-base = <4>;

(adding "renesas,gic-spi-base = <0>" to r7s72100.dtsi as I speak).

> Side note, I've seen this interrupt pin HW in some older SH4A devices
> (like SH7724 and SH7757). So it's been around for a while.

Right:

    arch/sh/kernel/cpu/sh4a/setup-sh7343.c: { 0xa4140024, 0, 8, /* INTREQ00 */
    arch/sh/kernel/cpu/sh4a/setup-sh7366.c: { 0xa4140024, 0, 8, /* INTREQ00 */
    arch/sh/kernel/cpu/sh4a/setup-sh7722.c: { 0xa4140024, 0, 8, /* INTREQ00 */
    arch/sh/kernel/cpu/sh4a/setup-sh7723.c: { 0xa4140024, 0, 8, /* INTREQ00 */
    arch/sh/kernel/cpu/sh4a/setup-sh7724.c: { 0xa4140024, 0, 8, /* INTREQ00 */

However, according to the sh7724 documentation, the register set is
slightly different, as is its sense configuration (no support for both
edges, but support for high-level interrupts).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
