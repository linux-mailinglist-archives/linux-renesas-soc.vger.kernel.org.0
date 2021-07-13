Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA8313C6E61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 12:25:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235475AbhGMK15 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 06:27:57 -0400
Received: from foss.arm.com ([217.140.110.172]:40148 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235143AbhGMK15 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 06:27:57 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F9726D;
        Tue, 13 Jul 2021 03:25:07 -0700 (PDT)
Received: from bogus (unknown [10.57.79.213])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8EBF83F7D8;
        Tue, 13 Jul 2021 03:25:04 -0700 (PDT)
Date:   Tue, 13 Jul 2021 11:23:53 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g044: Add missing GICv3 node
 properties
Message-ID: <20210713102326.kc56a4yqhkbv3ymm@bogus>
References: <20210611152108.6785-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWJQESFmhV+c-QmivXCWPx21QcB-HSzjxf8KsXh_DAvfw@mail.gmail.com>
 <CAMuHMdXG9H_mOtA_a9t0K8BVaR4p0DcWgNeL0786YvybV2Hqgw@mail.gmail.com>
 <CA+V-a8tk6uCeRwmiTh=Ds+8DYVUqCYs64nX_9ksDXXdSd-rxNA@mail.gmail.com>
 <CAMuHMdUg5v3qsFQsg783nC=o_BL3pL6YqqQphGQHHOaCeakj5Q@mail.gmail.com>
 <20210713085508.nq6473icf5gt3nm5@bogus>
 <CAMuHMdVG6eji_uW+7egeQH=77fwQnN_qQ4hRHgQa4XQYQrbL9Q@mail.gmail.com>
 <20210713091108.7nx2d2fxolx2wrg5@bogus>
 <CAMuHMdUgAutuRes9yTsDVCZ+rMeyQrhuX+BW60ft7_S9OU3RRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUgAutuRes9yTsDVCZ+rMeyQrhuX+BW60ft7_S9OU3RRg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jul 13, 2021 at 11:24:24AM +0200, Geert Uytterhoeven wrote:
> Hi Sudeep,
> 
> On Tue, Jul 13, 2021 at 11:16 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > On Tue, Jul 13, 2021 at 11:04:09AM +0200, Geert Uytterhoeven wrote:

[...]

> > >
> > > Probably both.  Might make sense to reset on wake-up, after having disabled
> > > clocks and powered down the AP CPU, AP GIC, ...
> > >
> >
> > /me confused. If this is arm64 platform, then you have to use *PSCI* and
> > I expect the reset to be done as part of CPU wake-up in PSCI firmware.
>
> DT Rule #1: DT describes hardware not software policy.
>

As mentioned before I agree on that. But I assume you too agree that not
all bits and pieces of hardware are represented in DT. Only ones that are
essential for any software to understand the hardware and make it work.
So my opinion is that this GIC reset information is implicit like many
other hardware information.

> The fact that _Linux_ must use PSCI is a (unfortunate) software policy.
> What about other OSes, or bare-metal software?
>

Disagree. PSCI is OS agnostic and _Linux_ is not the sole user. Do you
have examples of other OS that deploy alternate to PSCI ? Or bare-metal
that uses DT ? Again if there is a use-case, you need to spell out details
on when this can be used and where it can't be of much use(of-course with
the mention of Linux). There are complaints that DT bindings are too Linux
specific, so please pull in the other OS folks or other users so that we
get details on use-cases. Based on your argument we should have loads of
other information in DT on CPU or CPU peripherals for example even if
PSCI hides them for OS. Do we really want to get down that path ?

I agree PSCI is software policy but definitely fortunate, helped prevent
lot of non-sense in OS 😉.

> > > If that bypasses PSCI: well, if the unsecure software can do it, it
> > > means the hardware is not secure. Or at least Linux has to be trusted.
> >
> > No, if the system has PSCI, then you simply can't bypass that for GIC
> > reset. Or at-least I am failing to understand the complete flow of that.
>
> PSCI can only prevent other software from bypassing GIC reset if PSCI
> programs the hardware to prevent access to the GIC reset (if possible
> at all).
>

It is not matter of preventing, it is matter of what we can support
architecturally and sanely. While I agree with non-Linux use-case, we
can't support this in Linux.

--
Regards,
Sudeep
