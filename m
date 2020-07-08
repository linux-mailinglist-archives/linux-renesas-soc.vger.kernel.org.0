Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31FE2218212
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2020 10:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgGHIQ4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jul 2020 04:16:56 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:38669 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgGHIQ4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jul 2020 04:16:56 -0400
Received: by mail-oi1-f194.google.com with SMTP id r8so37122927oij.5;
        Wed, 08 Jul 2020 01:16:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N21L20f2wYoNBu/YYYYb9FO8mr6jGm+Qo3Mfiiunjvk=;
        b=gBFKv8rJ8IsZpTPCSkgqk+BJvZTjGJmBAz0hr/QF+exvBeB8SFqPbGCWgqVhzwywVY
         e+RDq0RmxQCk8lZRfo7vidOAejm7b3IEbMG4vCbNWeojoBm6HBvskfqO3+HUt9hGjLQu
         ww5fjG/mBVPw87dua/HnAeidSFhskHqykPGoAmXG3u/+H8d0RIqdf1yCOBqBxhZ1O48y
         P98q6e5wXZNgGs8IG7pdKH04xcVSZFtCtAGzpUq73ZPWilY6ME6HY+UYJfV09jw/o/M1
         NWSkJ7z6OsStP4IhpBIY4pkANz0MYHMmnWTr1zIbuUUru2k8tzAFRE/EKLMbKwtjw7qW
         Wp4Q==
X-Gm-Message-State: AOAM531UJB+hkfZNg0iK9E/ENXmd2z8wgmj0ZT28ccd1EVaF7Da6qqBr
        vj9IyxgTpG7X6y7ccsRJWKCfUuFMmdylqv1uzIA=
X-Google-Smtp-Source: ABdhPJwitf6XFmBDcttTNQjqLX3z+PzKegOAF+J0DKCIdF3605YbsazbnuA+w3tKmZ77u8IKR1x4xQkSh6v/0/sBvUQ=
X-Received: by 2002:a05:6808:64a:: with SMTP id z10mr6327162oih.54.1594196215284;
 Wed, 08 Jul 2020 01:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200701194259.3337652-1-saravanak@google.com> <CAJZ5v0gPKHSpC+9BNt_n_wP+8Lmekb1VapfgHPwenHopekHV=w@mail.gmail.com>
In-Reply-To: <CAJZ5v0gPKHSpC+9BNt_n_wP+8Lmekb1VapfgHPwenHopekHV=w@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 8 Jul 2020 10:16:44 +0200
Message-ID: <CAMuHMdW+dqCCqKjtxgZAAG-sFiMpbsEs_GoVGeKq6__A7EDBxg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Fix dpm_list ordering issue due to fw_devlink optimization
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rafael,

On Tue, Jul 7, 2020 at 5:56 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> On Wed, Jul 1, 2020 at 9:43 PM Saravana Kannan <saravanak@google.com> wrote:
> > When commit 93d2e4322aa7 ("of: platform: Batch fwnode parsing when
> > adding all top level devices") enabled batch processing of fw_devlink to
> > optimize the parsing time, it caused a suspend/resume regression due to
> > the use of deferred probing early on at boot.
> >
> > This series fixes the regression by avoiding the use of deferred probing
> > when optimizing fw_devlink parsing.
> >
> > Saravana Kannan (3):
> >   driver core: Don't do deferred probe in parallel with kernel_init
> >     thread
> >   driver core: Rename dev_links_info.defer_sync to defer_hook
> >   driver core: Avoid deferred probe due to fw_devlink_pause/resume()
> >
> >  drivers/base/base.h    |  1 -
> >  drivers/base/core.c    | 44 ++++++++++++++++++++++++++++++------------
> >  drivers/base/dd.c      |  5 -----
> >  include/linux/device.h |  5 +++--
> >  4 files changed, 35 insertions(+), 20 deletions(-)
> >
> > --
>
> Geert, any chance to test this series on top of 5.8-rc?  It is
> expected to fix the suspend/resume regression reported by you.

Sorry, I had completely forgotten I hadn't tested this iteration of
the fix(es) yet. Thanks for the reminder!

Works fine when applied on top of v5.8-rc4.
Tested on r8a7740/armadillo, sh73a0/kzm9g, r8a7791/koelsch,
 and r8a77951/salvator-xs.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
