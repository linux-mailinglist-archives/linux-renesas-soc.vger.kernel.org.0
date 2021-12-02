Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E83864664A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Dec 2021 14:42:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358297AbhLBNpu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 2 Dec 2021 08:45:50 -0500
Received: from mail-ua1-f45.google.com ([209.85.222.45]:42584 "EHLO
        mail-ua1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358302AbhLBNpc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Dec 2021 08:45:32 -0500
Received: by mail-ua1-f45.google.com with SMTP id t13so55892902uad.9;
        Thu, 02 Dec 2021 05:42:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g6vM/KsgUxxXezVblDiuJC01W0UqMEadCQ6PHWIUNbI=;
        b=oyNebhSvw8QM4I66R2ragZuJOgRvV7aFdGWIKdHGo+yncpjXk/5J6L4DhPRT1nWgou
         rugSulCRHNwU1oMrIFbX4tlhuxdKFMbfmWKUMmnAsHAxYYoSYSuvalAUVbc9dZCRZhc/
         5fN+SX5wxNBjjfTd0mwdbrS/iMraNDR27alkZw7b9RC17KrQ2JpLu1lY7dRC/e3wjeg2
         Fre9wJuJdDuhZJJGYQPVtjiSuNmX8B4YGnlUL2HFR6AyylJf1IVPAWUzdtgd7STjBcDo
         Ln0MIOExsHYfCzgosbuXWGMtysyvZ5JOn2vQTdgEweBd/LFzvlrHkaluSLYbpsyd8SeP
         8GCw==
X-Gm-Message-State: AOAM533BbaajmP3XWUaOakWq88rc1pnZ46Yf7ZU499MScUw4h11MiUVf
        JSrv+zpllftLeSfRH2EG5JOsNFR6gNvjMQ==
X-Google-Smtp-Source: ABdhPJzxwW+b+X0BQeDih/p29V6u1Hq0JhTQK48WZgUoiEedAr1yDwvDuheBBpMsMHHJwwLd7pFLfw==
X-Received: by 2002:a05:6102:358b:: with SMTP id h11mr15496874vsu.82.1638452529353;
        Thu, 02 Dec 2021 05:42:09 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id z188sm929043vsz.12.2021.12.02.05.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 05:42:09 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id p37so55847232uae.8;
        Thu, 02 Dec 2021 05:42:09 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id r28mr15375907vsg.57.1638452528588;
 Thu, 02 Dec 2021 05:42:08 -0800 (PST)
MIME-Version: 1.0
References: <20211130100049.129418-1-julien.massot@iot.bzh> <20211201164616.GA834591@p14s>
In-Reply-To: <20211201164616.GA834591@p14s>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 2 Dec 2021 14:41:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE4HpA_JKiTDiMhUcPi99RvtoPm3A1cFD8MjpAkwtYWg@mail.gmail.com>
Message-ID: <CAMuHMdUE4HpA_JKiTDiMhUcPi99RvtoPm3A1cFD8MjpAkwtYWg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Initial Renesas R-Car remoteproc support
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     Julien Massot <julien.massot@iot.bzh>,
        =?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:REMOTE PROCESSOR (REMOTEPROC) SUBSYSTEM" 
        <linux-remoteproc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Mathieu,

On Wed, Dec 1, 2021 at 5:46 PM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:
> On Tue, Nov 30, 2021 at 11:00:47AM +0100, Julien Massot wrote:
> > Most of the SoCs in the R-Car gen3 SoC series such as
> > H3,M3 and E3 have an 'Arm Realtime Core'.
> > This Realtime core is an Arm Cortex-R7 clocked at 800MHz.
> > This series adds initial support to load a firmware and start
> > this remote processor through the remoteproc subsystem.
> >
> > This series depends on
> > https://patchwork.kernel.org/project/linux-renesas-soc/patch/20211022122101.66998-1-julien.massot@iot.bzh/
> > to be able to set the Cortex-R7 boot address.
>
> The above depencency is needed for this patchset to compile properly.  Since
> Geert has already applied it to his renesas-devel tree we can do two things:
>
> 1) Make this set go through Geert's tree.
> 2) Geert publishes an immutable branch I can pull the dependency from.
>
> I'm good either way, just let me know what you want to do.

I prefer you to handle the remoteproc parts.
Please find a pull request for the immutable branch below.
Thanks!

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git
tags/rcar_rst_rproc-tag1

for you to fetch changes up to 4c7924fb905b02323ff6d9d20f370892615dccfa:

  soc: renesas: rcar-rst: Add support to set rproc boot address
(2021-11-15 10:01:10 +0100)

----------------------------------------------------------------
Renesas R-Car Reset Controller remoteproc API

Definition of rcar_rst_set_rproc_boot_addr(), to be consumed by the
Renesas R-Car Gen3 remote processor driver.

----------------------------------------------------------------
Julien Massot (1):
      soc: renesas: rcar-rst: Add support to set rproc boot address

 drivers/soc/renesas/rcar-rst.c       | 43 +++++++++++++++++++++++++++++++++---
 include/linux/soc/renesas/rcar-rst.h |  2 ++
 2 files changed, 42 insertions(+), 3 deletions(-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
