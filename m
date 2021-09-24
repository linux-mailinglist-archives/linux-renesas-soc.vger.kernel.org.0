Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4662B417C4A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 22:20:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346485AbhIXUWN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 16:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344583AbhIXUWN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 16:22:13 -0400
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7C84C061613
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:20:39 -0700 (PDT)
Received: by mail-yb1-xb31.google.com with SMTP id m70so8301844ybm.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XyhQ38a/4uH67bAl5YGynvJ7Eg72vGZjm0Neu7EJ7Uc=;
        b=sugKOapzTbYiBxmeNfdWAfSXSs+U3/EV89R7DA5U1a32VM+oxYjy40oSJmo2l8hJIz
         WAjB+3JeAn7Ku+NF4E9dhQw4TyNqJzJ12tqzkreHVHfo9jxbpWeb4ARq4LIllJVeF2KA
         Vmer6jlQHrx/x2qy3jI3Z8FY1UEEh2/d2NSGQEizmxs9BImL1aBacyyfDnwEdLy1kB6I
         z26/ARJMI+VOt+MZdFXu1ZkaqZ+hIDz18MI6wbKPT5POdu0Bh6rR9X6jAXShrLVvuYBK
         x3mDJFHfGpJEQzOD0vh4/2ZPYL1wUcuuvkvhEcStBAvz8EzR/pU6HV001X0k9qoNbvgz
         QZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XyhQ38a/4uH67bAl5YGynvJ7Eg72vGZjm0Neu7EJ7Uc=;
        b=MQmsrW9QWabZSe62Wy0hI153mTERLHC9E3P0c00orhaRnqr1Age5jpldmrlCAo5mvw
         vd8PR9KTruo+eCgCrUaR8NcNYhqwJ2OP0r+tF0/7cCTrBT8tf2FS038848ji8S4Fjnne
         ifRRsEFOzvmMacyFZB4HWqO/Y4tHcVCEdGlzJbHF/lYR40uQ4rRQgX7D1PWDb7bTY0Jp
         Uqo2226acUw+dZIWyd56DDeSsuxE+dM9jag0hpPyyhOdv7d2MEulEz7NKrqiBa96ePbc
         ZZ2+y7TgavJfltrjXToDQa9s89x7S8Toc4t8RXXklUWPDjNuMZWXghzJTl2frR+m2NC8
         At1w==
X-Gm-Message-State: AOAM530QMDAAzm/3tL74AX35mbiiAL4ro3mqaCjtpYiCfJMjQvfjLrJ/
        FH9+UBluz5CkMUPXAcGNFDrmlnsvS/ikiNkc5/CMEA==
X-Google-Smtp-Source: ABdhPJw3UmguJUAbaav5AKykn8QK+KcLgLzhmVnIKdKzvHlgFfAoVRS7LT68ls/fxAaH3sgCg9ehHFiw2VCPF+JJqhE=
X-Received: by 2002:a25:2b07:: with SMTP id r7mr13368843ybr.296.1632514838758;
 Fri, 24 Sep 2021 13:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-2-saravanak@google.com> <CAPDyKFqkvN=ZrfAnj4CqfjBu_Pj0YH9txnkP-1d=FhaEhbPrPA@mail.gmail.com>
 <CAPDyKFqRR-GD=xZo27a9MgwzKT9mar4m0Bdki1VBxnsZaQy1_g@mail.gmail.com>
In-Reply-To: <CAPDyKFqRR-GD=xZo27a9MgwzKT9mar4m0Bdki1VBxnsZaQy1_g@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 24 Sep 2021 13:20:02 -0700
Message-ID: <CAGETcx-ArdxuWkZcidGrRRPqrkLRzC-oVGmeGd5Mebps5k1fpA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-oxnas@groups.io,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 24, 2021 at 4:50 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 9 Sept 2021 at 13:01, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Sat, 4 Sept 2021 at 02:05, Saravana Kannan <saravanak@google.com> wrote:
> > >
> > > fw_devlink could end up creating device links for bus only devices.
> > > However, bus only devices don't get probed and can block probe() or
> > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > devices using the simple-pm-bus driver.
> > >
> > > However, there are instances of devices that are not simple buses (they
> > > get probed by their specific drivers) that also list the "simple-bus"
> > > (or other bus only compatible strings) in their compatible property to
> > > automatically populate their child devices. We still want these devices
> > > to get probed by their specific drivers. So, we make sure this driver
> > > only probes devices that are only buses.
> > >
> > > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > Tested-by: Saravana Kannan <saravanak@google.com>
> >
> > Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> Saravana, Rob,
>
> I have been following your latest discussion in this thread - and it
> looks like you guys are moving towards a consensus.
>
> Although, if there is anything I can do to help to complete this, just
> tell me and I will jump in immediately.

Looks like we settled on the allow list approach during the BoF in
LPC. I'll send out a v4 with some tweaks.

-Saravana
