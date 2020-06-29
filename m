Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFA820D1EB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2020 20:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729251AbgF2So5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 14:44:57 -0400
Received: from foss.arm.com ([217.140.110.172]:35692 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728132AbgF2So4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 14:44:56 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BD50C0A;
        Mon, 29 Jun 2020 08:07:38 -0700 (PDT)
Received: from bogus (unknown [10.37.8.30])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A6D43F73C;
        Mon, 29 Jun 2020 08:07:35 -0700 (PDT)
Date:   Mon, 29 Jun 2020 16:07:28 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Mark Brown <broonie@kernel.org>,
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
Message-ID: <20200629150728.GA27911@bogus>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200626143914.GE5289@sirena.org.uk>
 <TY2PR01MB3692A3B12CEF7F9708A8A59CD86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200629125756.GC5499@sirena.org.uk>
 <20200629134011.GA23284@bogus>
 <CAMuHMdU81-EAve+jHhL8+ohCd5YXrgLWpMgaCvgXFDLO7p17pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU81-EAve+jHhL8+ohCd5YXrgLWpMgaCvgXFDLO7p17pQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 29, 2020 at 04:15:39PM +0200, Geert Uytterhoeven wrote:
> Hi Sudeep,
>
> On Mon, Jun 29, 2020 at 3:40 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > On Mon, Jun 29, 2020 at 01:57:56PM +0100, Mark Brown wrote:
> > > On Mon, Jun 29, 2020 at 02:42:26AM +0000, Yoshihiro Shimoda wrote:
> > > > > From: Mark Brown, Sent: Friday, June 26, 2020 11:39 PM
> > > > > According to the changelog this is all about reflecting changes in the
> > > > > system state done by firmware but there's no interaction with firmware
> > > > > here which means this will be at best fragile.  If we need to reflect
> > > > > changes in firmware configuration I'd expect there to be some
> > > > > interaction with firmware about how it is configured, or at least that
> > > > > the configuration would come from the same source.
> >
> > I agree.
> >
> > > > I should have described background of previous patch series though,
> > > > according to previous discussion [1] the firmware side (like PSCI) is
> > > > also fragile unfortunately... So, I thought using regulator-off-in-suspend
> > > > in a regulator was better.
> >
> > Please fix the firmware. You might have bigger problem than this if the
> > PSCI firmware is fragile as you state. Better to disable power management
> > on the platform if the firmware can't be fixed.
>
> Saying the implementation is "fragile" might be bad wording.
> The issue is more with the specification being vague (see more below).
>

Please elaborate on the vague part of the specification, happy to help you
get that fixed if it really needs to be.

> > > > On other hand, Ulf is talking about either adding a property (perhaps like
> > > > regulator-off-in-suspend) into a regulator or just adding a new property
> > > > into MMC [2]. What do you think about Ulf' comment? I'm thinking
> > > > adding a new property "full-pwr-cycle-in-suspend" is the best solution.
> > > > This is because using a regulator property and reflecting a state of regulator without
> > > > firmware is fragile, as you said.
> >
> > I haven't followed all the threads, but if it related to the policy you
> > want in the Linux, then may be use DT property or something. I don't know.
> > But if this is to indicate something based on firmware runtime/configuration,
> > then NACK for any approaches unconditionally.
>
> Like "arm,psci-system-suspend-is-power-down"[1]?
>

Really sounds hack to me.

> > > TBH I worry about a property drifting out of sync with the firmware on
> > > systems where the firmware can be updated.  Personally my default
> > > assumption would always be that we're going to loose power for anything
>
> OK, so that's the "safe" way to handle this: assume power is lost.
>
> > > except the RAM and whatever is needed for wake sources during suspend so
>
> Oh, even wake-up sources may become unpowered[2] ;-)

That is some serious issue. If there is no power, how can you expect it
to be wake up source ? Sounds something wrong fundamentally IMO.

> And thus stop working ;-(
>
> > > I find the discussion a bit surprising but in any case that seems like a
> > > better option than trying to shoehorn things in the way the series here
> > > did.  Like I said in my earlier replies if this is done through the
> > > regulator API I'd expect it to be via the suspend interface.
> >
> > +1. If this platform needs Linux to keep some state on for users in the
> > firmware or anything outside Linux, it must resume back in the same state
> > as we entered the suspend state from the kernel.
>
> I think you're misunderstanding the issue: this is not related at all
> to Linux keeping state for non-Linux users.
>

OK, thanks for confirming.

> This is all about how to know what exactly PSCI is powering down during
> SYSTEM_SUSPEND.  In this specific case, it is about knowing if the eMMC
> is powered down or not, as Linux should follow a specific procedure to
> prepare the eMMC for that, and Linux should not if that isn't the case.
>

OK, unless you are optimising, you shouldn't care then what PSCI does.
If you don't need eMMC, just suspend/power it off before you enter system/
psci suspend.

> I had a quick look at the latest revision of the PSCI specification, and
> it doesn't look like anything has changed in that area since my old patch
> series from 2017.  So it still boils down to: we don't know what a
> specific PSCI implementation will do, as basically anything is
> compliant, so the only safe thing is to assume the worst.
>

The specification states clearly:
"... all devices in the system must be in a state that is compatible
with entry into the system state. These preconditions are beyond the scope
of this specification and are therefore not described here."
"Prior to the call, the OS must disable all sources of wakeup other than
those it needs to support for its implementation of suspend to RAM."

And of course, the firmware must rely on OSPM to do proper device PM if
it is not shared resource. Trying to be aggressive and turning off all
the wakeup sources which out knowledge of it is broken firmware.

I see nothing has been fixed in the firmware too and we are still
discussing the same after 3 years 😄. Clearly we should start trusting
firmware and built capability to fix and replace it if there are bugs
just like kernel and stop hacking around in the kernel to deal with
just broken platform/psci firmware.

--
Regards,
Sudeep
