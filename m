Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45A5D218F78
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2020 20:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgGHSHw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jul 2020 14:07:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725982AbgGHSHv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jul 2020 14:07:51 -0400
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com [IPv6:2607:f8b0:4864:20::c43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6063C061A0B;
        Wed,  8 Jul 2020 11:07:51 -0700 (PDT)
Received: by mail-oo1-xc43.google.com with SMTP id z127so5473943ooa.3;
        Wed, 08 Jul 2020 11:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Dbjixg8wVW4KiLQ8LuqGqeXCZzaz3G8pYbAoEYagxd0=;
        b=BABD/YKfjW0mIwaMVs9UjiC2SUdi92avYxvpf42B+KfGltlqykB0xdn9ahRcCoDXf9
         VDwpfwIa8lnzywTuzP5hvE4cn4MZaOsYvdudnIYShpnTDW+c8zD5JAlHfcot5j0hG8/Y
         qm+BPNC2/sG851JPTGW5K2zYzv7u6IjnglXPDa+eOnEF87XbVfC09Arsnjt/LVIhDCCb
         +kOqH+/i5gS6XP3RhRbPocFWjx9j4DTaUavwr5ac83F/0rCjD+Pzv2vmWO2/9vQlg2Wp
         Pi4Hmx3zG2osbVkPMHKxpFzD9wcywUoZ661yzSVfKFjGzyeE97YhzRPhEfEbl/H08Pkl
         dMOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Dbjixg8wVW4KiLQ8LuqGqeXCZzaz3G8pYbAoEYagxd0=;
        b=oNubtPZ+elVs5kJIhqt1ifUgcDFHGuqfNyvL9dBzCuhMKZy9rdX+hBlTfGT8I63pHq
         uR8VzemgZ1uvYyhknbMlqkCXfEChNwmaLSBhB4Kd8TmWyee3YnCLXC2Dd7iVBWUXvon0
         BHdohsEO6CMK747WmplIgc7IP+T8u23mAOeJfCAi5l53SBouFO8mR32eYnwzHTTXE+Wt
         HkMI2bTmE+3ixy7qO9P146PBE2MpZ5ywxRhAfkL6TFFt5k07SJsJn4WY+4PTpT4EIo/d
         PMNjgFdJTyV0W2Ru6iJX/pXNcowHtUEZ8fSLb1a1H1id8vOzvk4WIj8+9213VwBKPjdj
         XkfA==
X-Gm-Message-State: AOAM532q61bDawfZTCL6wQfHk44CPZp0pm/6Fj6McD+s0BTfNEImuK/8
        bfRr+2TGWyN8h9tKLspIayVgmEboNZ06wndDFDw=
X-Google-Smtp-Source: ABdhPJzenbWqkONtEFKX26/+MA9S+zxLqr587WnjZXCwNPfEZvFWBPd1l8xRZA3n7OVhkM9hmpM8NBOg4iaSo38XfX4=
X-Received: by 2002:a4a:98c8:: with SMTP id b8mr29294676ooj.42.1594231671210;
 Wed, 08 Jul 2020 11:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594230511-24790-7-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <daf83dafc069b12b6a10205e5f93793a@kernel.org>
In-Reply-To: <daf83dafc069b12b6a10205e5f93793a@kernel.org>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Wed, 8 Jul 2020 19:07:24 +0100
Message-ID: <CA+V-a8ssT==SsVRgbM1kwP4U3-f6=1h4es547isTvANpydwi4g@mail.gmail.com>
Subject: Re: [PATCH 6/8] arm64: dts: renesas: Initial r8a774e1 SoC device tree
To:     Marc Zyngier <maz@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marc,

Thank you for the review.

On Wed, Jul 8, 2020 at 6:53 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-07-08 18:48, Lad Prabhakar wrote:
> > From: Marian-Cristian Rotariu
> > <marian-cristian.rotariu.rb@bp.renesas.com>
> >
> > Basic support for the RZ/G2H SoC.
> >
> > Signed-off-by: Marian-Cristian Rotariu
> > <marian-cristian.rotariu.rb@bp.renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 652 ++++++++++++++++++++++
> >  1 file changed, 652 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> > new file mode 100644
> > index 000000000000..6637e157ffcd
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
>
> [...]
> > +             gic: interrupt-controller@f1010000 {
> > +                     compatible = "arm,gic-400";
> > +                     #interrupt-cells = <3>;
> > +                     #address-cells = <0>;
> > +                     interrupt-controller;
> > +                     reg = <0x0 0xf1010000 0 0x1000>,
> > +                           <0x0 0xf1020000 0 0x20000>,
> > +                           <0x0 0xf1040000 0 0x20000>,
> > +                           <0x0 0xf1060000 0 0x20000>;
> > +                     interrupts = <GIC_PPI 9
> > +                                     (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
>
> You seem to have a bit more than only 2 CPUs in this system.
>
Argh should be 8.

Cheers,
--Prabhakar

> > +                     clocks = <&cpg CPG_MOD 408>;
> > +                     clock-names = "clk";
> > +                     power-domains = <&sysc R8A774E1_PD_ALWAYS_ON>;
> > +                     resets = <&cpg 408>;
> > +             };
>
>          M.
> --
> Jazz is not dead. It just smells funny...
