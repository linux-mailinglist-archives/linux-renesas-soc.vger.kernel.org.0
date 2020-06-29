Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3843920D388
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2020 21:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729360AbgF2S75 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 14:59:57 -0400
Received: from foss.arm.com ([217.140.110.172]:37358 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728460AbgF2S74 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 14:59:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DF96150C;
        Mon, 29 Jun 2020 10:42:56 -0700 (PDT)
Received: from bogus (unknown [10.37.8.30])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F079E3F71E;
        Mon, 29 Jun 2020 10:42:52 -0700 (PDT)
Date:   Mon, 29 Jun 2020 18:42:46 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH/RFC v4 2/4] regulator: fixed: add regulator_ops members
 for suspend/resume
Message-ID: <20200629174220.GA4188@bogus>
References: <1593163942-5087-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200626143914.GE5289@sirena.org.uk>
 <TY2PR01MB3692A3B12CEF7F9708A8A59CD86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200629125756.GC5499@sirena.org.uk>
 <20200629134011.GA23284@bogus>
 <CAMuHMdU81-EAve+jHhL8+ohCd5YXrgLWpMgaCvgXFDLO7p17pQ@mail.gmail.com>
 <20200629150728.GA27911@bogus>
 <20200629161450.GE5499@sirena.org.uk>
 <20200629164207.GB27911@bogus>
 <20200629172651.GG5499@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200629172651.GG5499@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 29, 2020 at 06:26:51PM +0100, Mark Brown wrote:
> On Mon, Jun 29, 2020 at 05:42:07PM +0100, Sudeep Holla wrote:
> > On Mon, Jun 29, 2020 at 05:14:50PM +0100, Mark Brown wrote:
> > > On Mon, Jun 29, 2020 at 04:07:28PM +0100, Sudeep Holla wrote:
> > >
> > > > The specification states clearly:
> > > > "... all devices in the system must be in a state that is compatible
> > > > with entry into the system state. These preconditions are beyond the scope
> > > > of this specification and are therefore not described here."
> > > > "Prior to the call, the OS must disable all sources of wakeup other than
> > > > those it needs to support for its implementation of suspend to RAM."
>
> > > This gets a bit circular for a generic OS since the OS needs some way to
> > > figure out what it's supposed to do on a given platform - for example
> > > the OS may be happy to use wakeup sources that the firmware is just
> > > going to cut power on.
>
> > While I understand the sentiments here, PSCI is targeted to address CPU
> > power state management mainly and system states like suspend/reset and
> > poweroff which involves last CPU. This is one of the reason it is out of
> > the scope of the specification.
>
> Sure, but as soon as we start talking about the last CPU stuff we're
> inevitably talking about the system as a whole.
>
> > Here is my understanding. DT specifies all the wakeup sources. Linux
> > can configure those and user may choose to enable a subset of them is
> > wakeup. As stated in the spec and also based on what we already do in
> > the kernel, we disable all other wakeup sources.
>
> > The PSCI firmware can then either read those from the interrupt controller
> > or based on static platform understanding, must not disable those wakeup
> > sources.
>
> That bit about static platform understanding isn't super helpful for the
> OS, so long as the firmware might do that the OS is pretty much out of
> luck.
>

I don't disagree. That's one of the reason I wanted to gather requirement
few years back when PSCI system suspend was introduced. I couldn't
convince PSCI spec authors myself.

> > > > I see nothing has been fixed in the firmware too and we are still
> > > > discussing the same after 3 years 😄. Clearly we should start trusting
> > > > firmware and built capability to fix and replace it if there are bugs
> > > > just like kernel and stop hacking around in the kernel to deal with
> > > > just broken platform/psci firmware.
>
> > > This isn't just an issue of buggy firmware as far as I can see, it's
> > > also a lack of ability for the OS and firmware to communicate
> > > information about their intentions to each other.  As things stand you'd
> > > need to put static information in the DT.
>
> > It is easy for DT to get out of sync with firmware unless it is generated
> > by the same firmware. That's the reason why I am against such multiple
>
> The ability for things to get out of sync also concerns me as I said
> further back in the thread but I'm not sure we have much alternative,
> realistically we're going to need some facility to work around firmware
> that isn't ideal.
>

I understand and I agree. That's the main reason I want to understand this
better and provide a generic solution. The current pm_suspend_via_firmware
seem to have different intentions(at-least that's what I grasped quickly
reading through the document)

> > sources of information. I understand ACPI has more flexibility and I did
>
> ACPI has a much stronger idea of what the system looks like which helps
> it a lot here.
>

Yes, I wanted something similar initially but didn't get good response
both from community and PSCI spec authors.

> > Each device or platform having its specific property in DT is not scalable.
> > Not sure if it is a generic problem. If it is, I would like to understand
> > more details on such lack of ability for communtication between OS and
> > firmware.
>
> It seems like a generic issue from where I'm sitting.

I can't disagree with that. The description of the issue and the solution
in the thread is. We need make it more generic and provide generic solution,.
I already see 2-3 threads addressing this in isolation as specific issue.
Also we need to check with DT maintainers if there are fine with the idea
of binding to address this issue.

--
Regards,
Sudeep
