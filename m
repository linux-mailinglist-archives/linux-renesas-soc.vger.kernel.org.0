Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0503039B48B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 10:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhFDIGG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 04:06:06 -0400
Received: from mail-ua1-f50.google.com ([209.85.222.50]:35619 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbhFDIGF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 04:06:05 -0400
Received: by mail-ua1-f50.google.com with SMTP id n61so4820346uan.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 04 Jun 2021 01:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9fakuufPDJ/+wwFiFjQcTt05pSpVS90C7bTmM/+VJI0=;
        b=l23BVrre3XiOLpAw2SaiJijcp/mBNTUvRs96ThMtzxNxZU7jlPjkWkw2epZyV4xVPH
         iHGR94OsE/KWvI4qdn/hU+bB15qmV0j9sbJfKT0ilRq+IsxElPosVItX/qBFU/Kt4dy9
         GvtxP3QbI5gq0i51stT+lwkPPmqP/+ydQVwUnY+UI235dskPq1gZLmjiVKNz4djMIEyP
         EYM3IB8mXAEcVstKkuNXrDpdaRXl/o6WVcdNzyELF69llsApwGivxeRennnQijRuKjLN
         JFprI1z5PE++xYpQNllRPM5QN5aU14MrSfkwcnOhKeqcX2s3Evv7NyM3MPIxyWibBqY6
         RkuA==
X-Gm-Message-State: AOAM530PnCTKfxxf+BVYV+XA0ahAt/QKuit0JyNU1pemzB4xWA7VjRaw
        s50OElknmBwvVCu8gA4M+LKcmgqEGgxz6Kwjjas=
X-Google-Smtp-Source: ABdhPJz3oBVxHRIHax6Ysqc6p3DgwkzCKrIDO9Osi0mv4C+dn/JeuIWTL2mM3jvnNRuU7GLWZ/TezIU0ayngMiEL42s=
X-Received: by 2002:ab0:26d8:: with SMTP id b24mr2267914uap.58.1622793844338;
 Fri, 04 Jun 2021 01:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <87r1hslrno.wl-kuninori.morimoto.gx@renesas.com> <87tumeh0rb.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tumeh0rb.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Jun 2021 10:03:53 +0200
Message-ID: <CAMuHMdVHYzSwtriYr6AEvuzRD3OU-K-KNEuFp+Neq1zQNg1mhQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: renesas: r8a77995: draak: add R-Car
 Sound support
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Harunobu Kurokawa <harunobu.kurokawa.dn@renesas.com>,
        Khiem Nguyen <khiem.nguyen.xt@renesas.com>,
        Hien Dang <hien.dang.eb@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Fri, Jun 4, 2021 at 3:33 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > These are v3 of R-Car D3 Sound support patch-set.
> > It is based on latest ALSA SoC branch (= asoc/for-5.14).
>
> I have ready to post v4 which needs latest ALSA SoC branch.
> But should it be posted *after* next merge-window ?

You can always post it earlier, with a comment clearly stating the
dependencies.

My actions will depend on the exact meaning of "needs", and if applying
it now can create a regression or not,
  1. With ALSA SoC from upstream, R-Car D3 Sound just doesn't work
     yet, as before, or works partially (no regression):
     => Can queue in renesas-devel for v5.14.
  2. With ALSA SoC from upstream, the sound driver will crash
     (regression):
     => Postpone queueing until after the release of v5.14-rc1.
     => Can still queue in a topic branch for renesas-drivers,
        as this includes the latest ALSA SoC branch.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
