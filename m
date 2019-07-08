Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2355661CDC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 12:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730041AbfGHKWa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 06:22:30 -0400
Received: from mail-vk1-f195.google.com ([209.85.221.195]:42148 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728842AbfGHKWa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 06:22:30 -0400
Received: by mail-vk1-f195.google.com with SMTP id 130so2360153vkn.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jul 2019 03:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AsAFKBEUFBHkHXTlE13fl56JrUE0oQy8Oxu/yYLscUs=;
        b=CXRvFicswoDHkYUNICeN+Cl9Qq4iIcvmcjhLdwzB1hU0uQHhlLHad2mHczOGsJMqCL
         ykKz6XDfuiQYMCXRuUnOuu0wyttGBqJ1JecYwgFDJsNOzoVtK3eSz2rirFv7xkNi6gqK
         GZs+8SUsPv7ACMYkOiz39V/WYXUnENJoGAFzO2W5qT5m4eRPoHholsEwIe9G47VV6sCB
         qOU2Lf7b3y96IvzDWOytjQqCcO9t2OCwQ451IjZqCMbvl3R/Kp04tgggrDebhg4s7zUp
         KYVatYbKtQXCxyA+n03YXX0GXrm9HSUsbiJACe+7CJElxfD67xJGxzY7ZQzULcgYhCix
         GoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AsAFKBEUFBHkHXTlE13fl56JrUE0oQy8Oxu/yYLscUs=;
        b=a/yhHFXylpvkxcDGeIzbxQcj2Mn+sYUhMFNjQLtgjRpeLrROODrbdkk0fLo+74XMTp
         B5yrS0yrfQpRhvuJTXJzMJvy5zKoKNpx6oG6mDmcWLxrr/SMm/HtW5LvM0QZSWjS+6sw
         nxpCuTy3+O+oTv3SNTJluyn2udSDZIG14B2CbRB545FfnvuFCgbv8/pqggbFDkEmhXkp
         J+okIdpvRVqmrUicRPlRMverLwC8dvM2+k6DkVEK/XtvAU1Fl0j4aHyAmRoH9PvbmPT6
         oPjcJEn+MGrqr3Rhy0aKzO4LEwJxzDyhXp8ZrWBKqYTsnajLHh/Blh+uRnrNgmFmQVC4
         g1Mg==
X-Gm-Message-State: APjAAAU35ys5XPUTa5E2pvZNxET+D8OgW7O7FixsV8WIulYQIbmT1otz
        qtJ8u4/FYZu4pxfGZ3doYaGxqK/mUNjqH31cWCm1YA==
X-Google-Smtp-Source: APXvYqw0lA6VLJL9moW99FXeG1c2nRgE06JCNEZ3lnJHUwGVDWkipH4PLGfoHZRemOlF+o2/UbzvFRdOUGbzPdk2/hs=
X-Received: by 2002:a1f:3f45:: with SMTP id m66mr4651377vka.17.1562581348878;
 Mon, 08 Jul 2019 03:22:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190621060511.29609-1-yamada.masahiro@socionext.com>
 <CAK7LNASGVbkGgu7psy4DfCxmr-AxSQ3fmGJ=aDAiuSkJ5hrDwA@mail.gmail.com>
 <20190621105025.GA2987@kunai> <CADnJP=sg1Kp=TAvUD-ofQje9Y6mWWE_ZnQM_eB85uw3z6PHrVQ@mail.gmail.com>
In-Reply-To: <CADnJP=sg1Kp=TAvUD-ofQje9Y6mWWE_ZnQM_eB85uw3z6PHrVQ@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 8 Jul 2019 12:21:52 +0200
Message-ID: <CAPDyKFqdRO9VeTrG7-nSU-oMB=HenCB3GO4GS0sN=KHnLYDCtw@mail.gmail.com>
Subject: Re: [PATCH] mmc: remove another TMIO MMC variant usdhi6rol0.c
To:     Lars Persson <lists@bofh.nu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Rabin Vincent <rabin.vincent@axis.com>,
        Guennadi Liakhovetski <g.liakhovetski@gmx.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 24 Jun 2019 at 09:04, Lars Persson <lists@bofh.nu> wrote:
>
> On Fri, Jun 21, 2019 at 12:50 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> >
> > Hi,
> >
> > On Fri, Jun 21, 2019 at 03:16:11PM +0900, Masahiro Yamada wrote:
> > > (Added Lars Persson, Guennadi Liakhovetski)
> > >
> > > On Fri, Jun 21, 2019 at 3:06 PM Masahiro Yamada
> > > <yamada.masahiro@socionext.com> wrote:
> > >
> > > This needs Ack from Renesas.
> > > But, I do not know if TMIO folks are sure about this driver, though.
> > > (If they had been sure about it, they should not have duplicated the driver
> > > in the first place.)
> >
> > ... and from the original mail:
> >
> > > Delete this driver now. Please re-implement it based on tmio_mmc_core.c
> > > if needed.
> >
> > I was never happy with this driver existing, yet I never knew which HW
> > platform needed this, so I didn't touch it. But I'd like to see it go in
> > favor of merging with the TMIO code base.
> >
> > >
> > > Perhaps, some code snippets in this driver might be useful for cleaning
> > > tmio_mmc. It will stay in git history forever, and you can dig for it
> > > whenever you need it.
> > >
> > > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >
> > I double checked there is no user in the current tree. I also searched
> > the web and did not find any out-of-tree user or even a reference of it.
> >
> > So, for now:
> >
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >
> > But this seriously needs an Ack from Shimoda-san or Morimoto-san. And
> > maybe Guennadi has remarks, too?
> >
>
> So let me tell you the real use of this driver.
>
> It is used by Axis Communications in our Artpec-6 chips that will be
> around for at least 5 years in active development at our side. The SoC
> is upstreamed, but the upstreaming effort was side-tracked before the
> usdhi6rol0 was added to the devicetree.
>
> I do agree with you guys that we should not keep two drivers for the
> same IP so there should be an effort to unify the drivers. In the mean
> time, we can make the connection with Axis more explicit by assigning
> us as maintainer and pushing the device tree entries.

To me, this sounds like a reasonable good plan. Although, we need a
formal maintainer rather than just a company name.

If you or anybody at Axis can send a patch for MAINTAINERS, that would
serve as commitment that I would be happy with.

Additionally, of course, the sooner we can get things moving on
converting usdhi6rol0 into using the tmio family driver, the better.

Kind regards
Uffe
