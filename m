Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B70B620D3EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2020 21:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729814AbgF2TDW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Jun 2020 15:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730413AbgF2TCn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Jun 2020 15:02:43 -0400
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com [IPv6:2607:f8b0:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 600B1C02E2E7;
        Mon, 29 Jun 2020 07:15:51 -0700 (PDT)
Received: by mail-ot1-x344.google.com with SMTP id w17so7769603otl.4;
        Mon, 29 Jun 2020 07:15:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=leTe6xkmfV5KnrwHpQkBH2Ot1AVMzXutDXCiCMkdL0s=;
        b=D5bxn+vX+hJkiQ6u1hDgpe9Ubh1O0+/hI/a0YTh2p5W53gAiGr+TsqHj3R0KJjllPD
         lAQkiUzVr7Ks2MMGvmDtt/201TPW6DPQgtEN0ILCj6hby+Haqn/hos9zgYrqHdDF6frO
         s7ishahv4ICygo1rBBFyA21At4caf5OHAj0cqU1yVsipK1XhO+vC2gaFScs8VH3z3Gso
         +xRQ/2qN1ZaYpTxB5Hwk45i4UZz7g3HSw8g89fC9oiINa6SzVeM7gB45FXmaKwdOopf0
         eHkaWWOtWkxGNELgMqUROit391OAo0TnzJ8aXhREK1fdHQ7PG5VojgsdiIi9hLtDYubU
         Fhpg==
X-Gm-Message-State: AOAM530eVcbRLWoVhdQU8uXJztWyMEgLA6znS4rKeWlMY5YVVZhKqdVc
        YLpC9K/bF4uBYX7CG6nVOP1RjquYytZ4pCG+MFNtp+oI
X-Google-Smtp-Source: ABdhPJwF+ox3rAUQ3Gu09b9KiRz1EEaQAg3j/GWpph6pRu+ljyWkQE4GLirKio8p4W53YNrwzMy+Qjdw3v8DIct2tQc=
X-Received: by 2002:a4a:b804:: with SMTP id g4mr14026744oop.40.1593440150627;
 Mon, 29 Jun 2020 07:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <1593163942-5087-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1593163942-5087-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20200626143914.GE5289@sirena.org.uk> <TY2PR01MB3692A3B12CEF7F9708A8A59CD86E0@TY2PR01MB3692.jpnprd01.prod.outlook.com>
 <20200629125756.GC5499@sirena.org.uk> <20200629134011.GA23284@bogus>
In-Reply-To: <20200629134011.GA23284@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 29 Jun 2020 16:15:39 +0200
Message-ID: <CAMuHMdU81-EAve+jHhL8+ohCd5YXrgLWpMgaCvgXFDLO7p17pQ@mail.gmail.com>
Subject: Re: [PATCH/RFC v4 2/4] regulator: fixed: add regulator_ops members
 for suspend/resume
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "magnus.damm@gmail.com" <magnus.damm@gmail.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sudeep,

On Mon, Jun 29, 2020 at 3:40 PM Sudeep Holla <sudeep.holla@arm.com> wrote:
> On Mon, Jun 29, 2020 at 01:57:56PM +0100, Mark Brown wrote:
> > On Mon, Jun 29, 2020 at 02:42:26AM +0000, Yoshihiro Shimoda wrote:
> > > > From: Mark Brown, Sent: Friday, June 26, 2020 11:39 PM
> > > > According to the changelog this is all about reflecting changes in the
> > > > system state done by firmware but there's no interaction with firmware
> > > > here which means this will be at best fragile.  If we need to reflect
> > > > changes in firmware configuration I'd expect there to be some
> > > > interaction with firmware about how it is configured, or at least that
> > > > the configuration would come from the same source.
>
> I agree.
>
> > > I should have described background of previous patch series though,
> > > according to previous discussion [1] the firmware side (like PSCI) is
> > > also fragile unfortunately... So, I thought using regulator-off-in-suspend
> > > in a regulator was better.
>
> Please fix the firmware. You might have bigger problem than this if the
> PSCI firmware is fragile as you state. Better to disable power management
> on the platform if the firmware can't be fixed.

Saying the implementation is "fragile" might be bad wording.
The issue is more with the specification being vague (see more below).

> > > On other hand, Ulf is talking about either adding a property (perhaps like
> > > regulator-off-in-suspend) into a regulator or just adding a new property
> > > into MMC [2]. What do you think about Ulf' comment? I'm thinking
> > > adding a new property "full-pwr-cycle-in-suspend" is the best solution.
> > > This is because using a regulator property and reflecting a state of regulator without
> > > firmware is fragile, as you said.
>
> I haven't followed all the threads, but if it related to the policy you
> want in the Linux, then may be use DT property or something. I don't know.
> But if this is to indicate something based on firmware runtime/configuration,
> then NACK for any approaches unconditionally.

Like "arm,psci-system-suspend-is-power-down"[1]?

> > TBH I worry about a property drifting out of sync with the firmware on
> > systems where the firmware can be updated.  Personally my default
> > assumption would always be that we're going to loose power for anything

OK, so that's the "safe" way to handle this: assume power is lost.

> > except the RAM and whatever is needed for wake sources during suspend so

Oh, even wake-up sources may become unpowered[2] ;-)
And thus stop working ;-(

> > I find the discussion a bit surprising but in any case that seems like a
> > better option than trying to shoehorn things in the way the series here
> > did.  Like I said in my earlier replies if this is done through the
> > regulator API I'd expect it to be via the suspend interface.
>
> +1. If this platform needs Linux to keep some state on for users in the
> firmware or anything outside Linux, it must resume back in the same state
> as we entered the suspend state from the kernel.

I think you're misunderstanding the issue: this is not related at all
to Linux keeping state for non-Linux users.

This is all about how to know what exactly PSCI is powering down during
SYSTEM_SUSPEND.  In this specific case, it is about knowing if the eMMC
is powered down or not, as Linux should follow a specific procedure to
prepare the eMMC for that, and Linux should not if that isn't the case.

I had a quick look at the latest revision of the PSCI specification, and
it doesn't look like anything has changed in that area since my old patch
series from 2017.  So it still boils down to: we don't know what a
specific PSCI implementation will do, as basically anything is
compliant, so the only safe thing is to assume the worst.

Or am I missing something?
Thanks!

[1] "[PATCH/RFC 4/6] drivers: firmware: psci: Fix non-PMIC wake-up if
    SYSTEM_SUSPEND cuts power"
    https://lore.kernel.org/linux-arm-kernel/1487622809-25127-5-git-send-email-geert+renesas@glider.be/

[2] [PATCH/RFC 0/6] PSCI: Fix non-PMIC wake-up if SYSTEM_SUSPEND cuts
    power
    https://lore.kernel.org/linux-arm-kernel/1487622809-25127-1-git-send-email-geert+renesas@glider.be/

[3] https://developer.arm.com/architectures/system-architectures/software-standards/psci

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
