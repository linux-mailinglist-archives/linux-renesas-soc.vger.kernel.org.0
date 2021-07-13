Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A58D13C6D0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 11:16:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234735AbhGMJTA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 05:19:00 -0400
Received: from foss.arm.com ([217.140.110.172]:39018 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234397AbhGMJS7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 05:18:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F257E31B;
        Tue, 13 Jul 2021 02:16:09 -0700 (PDT)
Received: from bogus (unknown [10.57.79.213])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81C003F7D8;
        Tue, 13 Jul 2021 02:16:08 -0700 (PDT)
Date:   Tue, 13 Jul 2021 10:15:02 +0100
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
Message-ID: <20210713091108.7nx2d2fxolx2wrg5@bogus>
References: <20210611152108.6785-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWJQESFmhV+c-QmivXCWPx21QcB-HSzjxf8KsXh_DAvfw@mail.gmail.com>
 <CAMuHMdXG9H_mOtA_a9t0K8BVaR4p0DcWgNeL0786YvybV2Hqgw@mail.gmail.com>
 <CA+V-a8tk6uCeRwmiTh=Ds+8DYVUqCYs64nX_9ksDXXdSd-rxNA@mail.gmail.com>
 <CAMuHMdUg5v3qsFQsg783nC=o_BL3pL6YqqQphGQHHOaCeakj5Q@mail.gmail.com>
 <20210713085508.nq6473icf5gt3nm5@bogus>
 <CAMuHMdVG6eji_uW+7egeQH=77fwQnN_qQ4hRHgQa4XQYQrbL9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVG6eji_uW+7egeQH=77fwQnN_qQ4hRHgQa4XQYQrbL9Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jul 13, 2021 at 11:04:09AM +0200, Geert Uytterhoeven wrote:
> Hi Sudeep,
> 
> On Tue, Jul 13, 2021 at 10:56 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > On Tue, Jul 13, 2021 at 10:30:36AM +0200, Geert Uytterhoeven wrote:

[...]

> > > And a possible use case: the RT CPU core may want to reset the AP GIC.
> >
> > I didn't want to add new bindings without details on the implementation
> > to avoid possible issues with backward compatibility as this was not
> > thought through completely and correctly before it was added.
> >
> > OK, now let us discuss your use-case: *RT CPU wants to reset AP GIC*
> >
> > 1. Will it just reset AP GIC or will it request the AP reset as a whole ?
> >    I am not sure if we can handle former, if you think otherwise what is
> >    the reset notification mechanism ?
> >
> > 2. Will that bypass secure world/PSCI ? Again more details on this would
> >    be helpful to visualise the entire use-case end-to-end better.
> >
> > By GIC reset, I am assuming it will be complete GIC reset including it's
> > CPU interface.
> >
> > I don't think we can reset GIC without actual CPU reset. Even if we get
> > some notification magically to the CPU that its GIC alone needs to be
> > reset, it needs to safely higher exceptions to get its GIC CPU interface
> > reprogrammed to correct (saved) values before OS can reprogram the NS
> > world values. All these seems overall complicated and may be unnecessary.
>
> Probably both.  Might make sense to reset on wake-up, after having disabled
> clocks and powered down the AP CPU, AP GIC, ...
>

/me confused. If this is arm64 platform, then you have to use *PSCI* and
I expect the reset to be done as part of CPU wake-up in PSCI firmware.

> If that bypasses PSCI: well, if the unsecure software can do it, it
> means the hardware is not secure. Or at least Linux has to be trusted.
>

No, if the system has PSCI, then you simply can't bypass that for GIC
reset. Or at-least I am failing to understand the complete flow of that.

--
Regards,
Sudeep
