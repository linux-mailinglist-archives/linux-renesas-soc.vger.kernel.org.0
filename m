Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0DDF578FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jun 2019 03:35:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfF0Bfo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jun 2019 21:35:44 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:37097 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726612AbfF0Bfo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jun 2019 21:35:44 -0400
Received: by mail-io1-f66.google.com with SMTP id e5so1114002iok.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jun 2019 18:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L2Q5XHKelfQkjrwCrn4wOaWyOpvTiODS5vOc84eDxew=;
        b=FGS0QkFaBTr98/I3wX3l3Xwn5/UoXj/EdPToMw7TfG1aRgpH+EnONtjqdZhxs34fbo
         Aa3mQUHvVI4LUbCOi1oRI+0oljGBbrqzVCG99hFfjI2V3rbr6YHGEfHcgkwqxMk3b815
         xLanycfZWa9NodV+TommWxgf6QKZID6LlGP8mFd3LUrfZNFS+edvM1CsSrkXdRl3X2Hb
         fZlb1QCtboFHYZ4MXkqLlhEC5RcS7fCp0vYfkuOrGhjjjjxA3eL2eWid+mOJHAOzahhr
         CKVV3otYAynLepoc4pGK6KW5FiNh91E52SLuRPARlTQfKVvs1TXfFlkxtO6du1WnC6X/
         nDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L2Q5XHKelfQkjrwCrn4wOaWyOpvTiODS5vOc84eDxew=;
        b=nIB7a0OK9etxRDEvq5ndgrrnk45X0NwpO7sjferv9km7rF8EdS2z4CU73Ksks1Zamw
         Ox09XtQfHvKazhOR3bgxAjWSpukFSS/dc6pp11oYpmapFBkgk1NOqlFjO4vtDT+OF6aw
         P5AU6+3ysEb7u8NRjM6hWyWrJME1tjkZaMcHpcpYMU/ZCa2QGft4nXboMJSgE8uVVFT9
         rhbZ3LTEAKdexSztl00C5woUJB8JYxZT0reY8doIZX6gRxilR1UGnyXGboIw2ZaY8AA3
         EvXas60eN3TFWc0Og8nA88DqtcVhiYvUm3jSDLUaDZrW6R+zUswJU6zW/zSYjTvpL1Lx
         dMXQ==
X-Gm-Message-State: APjAAAWU6dzsU55d2QC2q57ROeO0W2bbe86A60c2MJ4VOUJ3SGom28J+
        RIoPzDiLDqJVsXqs2NBAhqXaRr0g7PB129m7cs946o8HJUw=
X-Google-Smtp-Source: APXvYqzjHVXBPJRsTAL4Ko5kFmM6fTuQiqSMoCWmWcBnzUvY6+yWotykh5i3K3ina2IROBrQGhCo8dMJQyRSib29VSQ=
X-Received: by 2002:a6b:1494:: with SMTP id 142mr1560459iou.72.1561599343195;
 Wed, 26 Jun 2019 18:35:43 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561105093.git.horms+renesas@verge.net.au>
 <20190625124924.ubpi3pxwggbz5cbw@localhost> <CAMuHMdVj5G6-m9iqQQM5nAQZbhC=GL0DtgUKXff7UBQ8uNwmBw@mail.gmail.com>
In-Reply-To: <CAMuHMdVj5G6-m9iqQQM5nAQZbhC=GL0DtgUKXff7UBQ8uNwmBw@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Thu, 27 Jun 2019 09:35:30 +0800
Message-ID: <CAOesGMjVE0--LQF2eULx5WgANSsuiYPbmy0bv2HUUirokLJ=vA@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v5.3
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Kevin Hilman <khilman@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        arm-soc <arm@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 25, 2019 at 9:23 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Olof,
>
> On Tue, Jun 25, 2019 at 3:10 PM Olof Johansson <olof@lixom.net> wrote:
> > On Fri, Jun 21, 2019 at 11:12:04AM +0200, Simon Horman wrote:
> > > Oleksandr Tyshchenko (1):
> > >       ARM: mach-shmobile: Don't init CNTVOFF/counter if PSCI is available
> >
> > Merged, thanks.
>
> Thanks!
>
> > Note that in this patch, code like this:
> >
> > +#ifdef CONFIG_ARM_PSCI_FW
> > +       if (psci_ops.cpu_on)
> > +               need_update = false;
> > +#endif
> > +
> > +       if (need_update == false)
> > +               goto skip_update;
> >
> >
> > Can either be replaced with a goto under the ifdef, or at the very least, no
>
> I believe a goto under the ifdef may cause a "label defined but not used"
> warning if CONFIG_ARM_PSCI_FW is not defined.

Ah yeah, good point.


-Olof
