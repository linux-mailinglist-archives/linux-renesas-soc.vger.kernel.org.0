Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 630B8407A41
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Sep 2021 21:32:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233561AbhIKTdg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Sep 2021 15:33:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:58676 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230347AbhIKTdg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Sep 2021 15:33:36 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 86DD960EE9;
        Sat, 11 Sep 2021 19:32:23 +0000 (UTC)
Received: from [198.52.44.129] (helo=wait-a-minute.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mP8jd-00ADZF-G8; Sat, 11 Sep 2021 20:32:21 +0100
Date:   Sat, 11 Sep 2021 20:32:04 +0100
Message-ID: <874kaqdi2z.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Russell King <linux@arm.linux.org.uk>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Sumit Garg <sumit.garg@linaro.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Android Kernel Team <kernel-team@android.com>,
        stable <stable@vger.kernel.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 07/17] irqchip/gic: Atomically update affinity
In-Reply-To: <CANqRtoTqV8sOpL=hdxeZ03tqr+5oeMcfwz+9ERqXv+hze_6Fsw@mail.gmail.com>
References: <20200624195811.435857-1-maz@kernel.org>
        <20200624195811.435857-8-maz@kernel.org>
        <CAMuHMdV+Ev47K5NO8XHsanSq5YRMCHn2gWAQyV-q2LpJVy9HiQ@mail.gmail.com>
        <875yv8d91b.wl-maz@kernel.org>
        <CAMuHMdV+ydPaXbGf1_O0S-juaPWk1gwBUOK+GeLZukZeoqtMGQ@mail.gmail.com>
        <CANqRtoTqV8sOpL=hdxeZ03tqr+5oeMcfwz+9ERqXv+hze_6Fsw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 198.52.44.129
X-SA-Exim-Rcpt-To: magnus.damm@gmail.com, geert@linux-m68k.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de, jason@lakedaemon.net, sumit.garg@linaro.org, Valentin.Schneider@arm.com, f.fainelli@gmail.com, gregory.clement@bootlin.com, andrew@lunn.ch, kernel-team@android.com, stable@vger.kernel.org, damm+renesas@opensource.se, niklas.soderlund+renesas@ragnatech.se, linux-renesas-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Sat, 11 Sep 2021 03:49:20 +0100,
Magnus Damm <magnus.damm@gmail.com> wrote:
> 
> Hi Geert, Mark, RMK, everyone,
> 
> Thanks for your efforts. Let me just chime in with a few details and a question.
> 
> On Fri, Sep 10, 2021 at 10:19 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Fri, Sep 10, 2021 at 12:23 PM Marc Zyngier <maz@kernel.org> wrote:
> > > On Thu, 09 Sep 2021 16:22:01 +0100,
> > > Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >     GIC: enabling workaround for broken byte access
> 
> Indeed, byte access is unsupported according to the EMEV2 documentation.
> 
> The EMEV2 documentation R19UH0036EJ0600 Chapter 7 Interrupt Control on
> page 97 says:
> "Interrupt registers can be accessed via the APB bus, in 32-bit units"
> "For details about register functions, see ARM Generic Interrupt
> Controller Architecture Specification Architecture version 1.0"
> The file  "R19UH0036EJ0600_1Chip.pdf" is the 6th edition version
> published in 2010 and is not marked as confidential.

This is as bad as it gets. Do you know if any other Renesas platform
is affected by the same issue?

> 
> From my basic research, "ARM Generic Interrupt Controller Architecture
> Specification Architecture version 1.0" is documented in ARM IHI 0048A
> from 2008 (Non-Confidential) which contains:
> "All GIC registers are 32-bit wide." and "All registers support 32-bit
> word access..."
> "In addition, the following registers support byte accesses:"
> "ICDIPR"

Renamed to GICD_IPRIORITYRn in IHI0048B.

> "ICDIPTR"

Renamed to GICD_ITARGETRn in IHI0048B.

See IHI0048B_b ("B.1 Alternative register names" and specifically
table B-1) for the translation table between GICv1 and GICv2 names.

> So the GICv1 documentation says byte access is partially supported
> however EMEV2 documentation says 32-bit access is required.

Which is definitely an integration bug. Both set of registers *must*
support byte accesses. This isn't optional and left to the
appreciation of the integrator. This breaks the programming model
badly, and prevents standard software from running unmodified.

One of the few things the GIC architecture got right is the absence of
locking requirements, as all the registers can be accessed
concurrently by multiple CPUs as long as they operate on distinct
interrupts. This is why the enable and pending registers have both set
and clear accessors, that the priority and target registers are byte
accessible, and that everything else happens in CPU-private registers
(the CPU interface).

This requirement has been there from day-1. Even the good old DIC (the
GIC's ancestor) that was included with the 11MP-Core says: "All
Interrupt Distributor Registers are byte accessible.", which is more
than actually necessary for the GIC. See DDI 0360F for details. And
yes, SW written for the GIC does work on the DIC.

> 
> > > +               .compatible     = "arm,pl390",
> > > +               .init           = gic_enable_rmw_access,
> > > +       },
> 
> May I ask about a clarification about the EMEV2 DTS and DT binding
> documentation in:
> arch/arm/boot/dts/emev2.dts
> Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
> 
> On EMEV2 the DT compatible string currently seems to be the rather
> generic "arm,pl390". In the DT binding documentation GICv1 is listed
> in an example as "arm,cortex-a9-gic". Is there any reason for not
> using the GICv1 compatible string (and 32-bit access) for EMEV2? Just
> curious.

GICv1 is an architecture specification. PL390 is an implementation of
GICv1. The so called "Cortex-A9 GIC" doesn't really exist. It is
simply the amalgamation of the CPU interface implemented by the A9
(with the prototype of the GICv2 virtualisation extensions) with a
distributor (usually a PL390, but not necessarily). All of them
require that the priority and target registers are byte accessible.

As for changing the compatibility string, I don't see the point. This
will break existing setups, and doesn't change the core of the
issue. As far as I can see, the EMEV2 DT is correct in the sense that
it describes the actual implementation of the GIC used.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
