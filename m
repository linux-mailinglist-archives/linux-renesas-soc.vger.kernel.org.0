Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3AA8218E64
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2020 19:36:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgGHRgv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jul 2020 13:36:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726964AbgGHRgv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jul 2020 13:36:51 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22E73C08C5C1
        for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2020 10:36:51 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id 12so31982680oir.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2020 10:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xIPxHFNL2iAKNO6TfsfK5i3c3GAB1DsvCug2FocHVtY=;
        b=QBtBrpjdEAaDgN/nY2WU1E7mnTl0LdGw45K2oFN6eGJYyIsG9ugEteWhqxsSpzq2GW
         ReZkIkMN/gB9YQl0SS01Uwl3q5rXHR3G/28TB4+hvWifUg3fXDlrcs/J3/lkovvNWR/z
         8Hx5UVU3acMZxZl4sazyYM+tNHZjosg8iYKGDgF0N1xNEyQCGOJtyGpQCuDn8ktQ/40g
         gYUobTJR11Ho1MUk0ayZvLJ14uZZSB5////Dd34xOBhxWQ24H11heE9J6s4O3AZLaKdH
         YP2w9UhijAGa26TfnVXw3p5EZ/yVBc3jnMLEIVaHEbJ5O4aWYiojSmebaryi+YYsV/Hq
         +RKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xIPxHFNL2iAKNO6TfsfK5i3c3GAB1DsvCug2FocHVtY=;
        b=LfnXB2e2SFDqXiYus49FI3hhrTEE0keq9wWA/63liR7TG9JH4EqiPW66ZfD2nzd7qZ
         NWiLQxKdPpbWZrrXHaeQHCLHoEnTIFKjZVaGlOIxJu4i4aKOJggW/Xy0AIjf+55UMds0
         fIxuSV6zLUrKVKGYL0HMqTzkfqTKA8vU4/GTbXSoEiqZuZMwtaAKBmx2Fv8Vku5Sx7XB
         k49d9ELB08TqTlUyEwEAGh2wIRlLIzr8oLOvE+bOA/1pkn4WoMTdnZG8p+GWXiVQUlPd
         IPCKSOvMy/0LyrK0Y3IZG4NPOsDGvSX3/qDPL4CVLOiBlpO3FLMW6fj5SJT4eL/JL+bE
         1Vhw==
X-Gm-Message-State: AOAM5339EgkBFWqds4FqUIEmm8JR0a4xDA2iSjtf+vu92GpKDdOMPm26
        CMnn+V6cdcWUUZYRkI26SdYk1J5QrBBUCMVe5EaI3w==
X-Google-Smtp-Source: ABdhPJyWOqIT8y4BnHhXxpTPX2k9Z252XO3U9PSnCYIeYLF77r6UaNqlEEbfud/bKiN6dVw2TwUs6UYwZ7wNGXbTR/k=
X-Received: by 2002:aca:a983:: with SMTP id s125mr8215567oie.30.1594229810224;
 Wed, 08 Jul 2020 10:36:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200701194259.3337652-1-saravanak@google.com>
 <CAJZ5v0gPKHSpC+9BNt_n_wP+8Lmekb1VapfgHPwenHopekHV=w@mail.gmail.com> <CAMuHMdW+dqCCqKjtxgZAAG-sFiMpbsEs_GoVGeKq6__A7EDBxg@mail.gmail.com>
In-Reply-To: <CAMuHMdW+dqCCqKjtxgZAAG-sFiMpbsEs_GoVGeKq6__A7EDBxg@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Wed, 8 Jul 2020 10:36:14 -0700
Message-ID: <CAGETcx-dcvsWDJPbM_c1O4ScJmPu97+WWRkygmF1g-grdAha9A@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Fix dpm_list ordering issue due to fw_devlink optimization
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jul 8, 2020 at 1:16 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rafael,
>
> On Tue, Jul 7, 2020 at 5:56 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > On Wed, Jul 1, 2020 at 9:43 PM Saravana Kannan <saravanak@google.com> wrote:
> > > When commit 93d2e4322aa7 ("of: platform: Batch fwnode parsing when
> > > adding all top level devices") enabled batch processing of fw_devlink to
> > > optimize the parsing time, it caused a suspend/resume regression due to
> > > the use of deferred probing early on at boot.
> > >
> > > This series fixes the regression by avoiding the use of deferred probing
> > > when optimizing fw_devlink parsing.
> > >
> > > Saravana Kannan (3):
> > >   driver core: Don't do deferred probe in parallel with kernel_init
> > >     thread
> > >   driver core: Rename dev_links_info.defer_sync to defer_hook
> > >   driver core: Avoid deferred probe due to fw_devlink_pause/resume()
> > >
> > >  drivers/base/base.h    |  1 -
> > >  drivers/base/core.c    | 44 ++++++++++++++++++++++++++++++------------
> > >  drivers/base/dd.c      |  5 -----
> > >  include/linux/device.h |  5 +++--
> > >  4 files changed, 35 insertions(+), 20 deletions(-)
> > >
> > > --
> >
> > Geert, any chance to test this series on top of 5.8-rc?  It is
> > expected to fix the suspend/resume regression reported by you.
>
> Sorry, I had completely forgotten I hadn't tested this iteration of
> the fix(es) yet. Thanks for the reminder!
>
> Works fine when applied on top of v5.8-rc4.
> Tested on r8a7740/armadillo, sh73a0/kzm9g, r8a7791/koelsch,
>  and r8a77951/salvator-xs.
>
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Great! Thanks!

-Saravana
