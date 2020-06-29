Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E8E20D88C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2020 22:09:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730982AbgF2TkB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 15:40:01 -0400
Received: from foss.arm.com ([217.140.110.172]:41800 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731818AbgF2Tjz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 15:39:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2974A1509;
        Mon, 29 Jun 2020 06:40:57 -0700 (PDT)
Received: from bogus (unknown [10.37.12.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA0C43F73C;
        Mon, 29 Jun 2020 06:40:54 -0700 (PDT)
Date:   Mon, 29 Jun 2020 14:40:47 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "geert+renesas@glider.be" <geert+renesas@glider.be>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH/RFC v4 2/4] regulator: fixed: add regulator_ops members
 for suspend/resume
Message-ID: <20200629134011.GA23284@bogus>
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200626143914.GE5289@sirena.org.uk>
 <TY2PR01MB3692A3B12CEF7F9708A8A59CD86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200629125756.GC5499@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200629125756.GC5499@sirena.org.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 29, 2020 at 01:57:56PM +0100, Mark Brown wrote:
> On Mon, Jun 29, 2020 at 02:42:26AM +0000, Yoshihiro Shimoda wrote:
> > > From: Mark Brown, Sent: Friday, June 26, 2020 11:39 PM
>
> Copying in Sudeep for the feedback on firmware interfaces.
>

Thanks Mark.

> > > According to the changelog this is all about reflecting changes in the
> > > system state done by firmware but there's no interaction with firmware
> > > here which means this will be at best fragile.  If we need to reflect
> > > changes in firmware configuration I'd expect there to be some
> > > interaction with firmware about how it is configured, or at least that
> > > the configuration would come from the same source.
>

I agree.

> > I should have described background of previous patch series though,
> > according to previous discussion [1] the firmware side (like PSCI) is
> > also fragile unfortunately... So, I thought using regulator-off-in-suspend
> > in a regulator was better.
>

Please fix the firmware. You might have bigger problem than this if the
PSCI firmware is fragile as you state. Better to disable power management
on the platform if the firmware can't be fixed.

> > On other hand, Ulf is talking about either adding a property (perhaps like
> > regulator-off-in-suspend) into a regulator or just adding a new property
> > into MMC [2]. What do you think about Ulf' comment? I'm thinking
> > adding a new property "full-pwr-cycle-in-suspend" is the best solution.
> > This is because using a regulator property and reflecting a state of regulator without
> > firmware is fragile, as you said.

I haven't followed all the threads, but if it related to the policy you
want in the Linux, then may be use DT property or something. I don't know.
But if this is to indicate something based on firmware runtime/configuration,
then NACK for any approaches unconditionally.

>
> TBH I worry about a property drifting out of sync with the firmware on
> systems where the firmware can be updated.  Personally my default
> assumption would always be that we're going to loose power for anything
> except the RAM and whatever is needed for wake sources during suspend so
> I find the discussion a bit surprising but in any case that seems like a
> better option than trying to shoehorn things in the way the series here
> did.  Like I said in my earlier replies if this is done through the
> regulator API I'd expect it to be via the suspend interface.
>

+1. If this platform needs Linux to keep some state on for users in the
firmware or anything outside Linux, it must resume back in the same state
as we entered the suspend state from the kernel.

--
Regards,
Sudeep
