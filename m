Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41EAE3C6D3E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 11:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234855AbhGMJ10 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 05:27:26 -0400
Received: from mail-ua1-f41.google.com ([209.85.222.41]:41774 "EHLO
        mail-ua1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234397AbhGMJ10 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 05:27:26 -0400
Received: by mail-ua1-f41.google.com with SMTP id e22so4200433uaa.8;
        Tue, 13 Jul 2021 02:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hRHcPSp8vPymwcz1/KJlrg/3zz/sOu8Ehh9q7i76d+0=;
        b=uH078N4oyyI9DQm5p3iq8Eyyxwgxoqi5kpOnkNushvXJz1v1+7YnLlip0Ssg1YXcjk
         ZZQAeks0xi7XFL463+TWnQTbxs+bvoR1iOpNMZxIc66FfsHAmgPjWTGlDkKYMbUs6/gv
         rqCUCHQWPdlRywpIZH27A4Up/+hX9Fp2OVxjFX0NXg26s3WQq1tqIgzqDcm7DlZPm9vZ
         zE81+VnsqPBqBwQeVWLDvR08FMwQWLEdC6ZUilZfv/mt97UuVnlzorqhFfindNgaVqSc
         c/FOmkgAd49Zcq7FVh5i323fEQPBy/2Wr7bTiOX8TDPMia7AaWMe6eAigLT8en9T/PMH
         nD3g==
X-Gm-Message-State: AOAM533KdyOi/2Ev8qTiieeFUuM9WCwFb2Yp7HkwX0ieUifZNuZWyQbC
        27EgwXTNjMjfDJ+xCpcK7709d2cmpkdSyqU3WjyHUcoPR/4=
X-Google-Smtp-Source: ABdhPJyTiTkkKjo1c9EXH9r8TqDbuE8rIPejJfusgUQBhqggVemMgEy0iBSBswJkAE38OkEuxxGmBPYnx61c7zKCNPI=
X-Received: by 2002:a9f:3f0d:: with SMTP id h13mr4627826uaj.100.1626168275941;
 Tue, 13 Jul 2021 02:24:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210611152108.6785-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWJQESFmhV+c-QmivXCWPx21QcB-HSzjxf8KsXh_DAvfw@mail.gmail.com>
 <CAMuHMdXG9H_mOtA_a9t0K8BVaR4p0DcWgNeL0786YvybV2Hqgw@mail.gmail.com>
 <CA+V-a8tk6uCeRwmiTh=Ds+8DYVUqCYs64nX_9ksDXXdSd-rxNA@mail.gmail.com>
 <CAMuHMdUg5v3qsFQsg783nC=o_BL3pL6YqqQphGQHHOaCeakj5Q@mail.gmail.com>
 <20210713085508.nq6473icf5gt3nm5@bogus> <CAMuHMdVG6eji_uW+7egeQH=77fwQnN_qQ4hRHgQa4XQYQrbL9Q@mail.gmail.com>
 <20210713091108.7nx2d2fxolx2wrg5@bogus>
In-Reply-To: <20210713091108.7nx2d2fxolx2wrg5@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Jul 2021 11:24:24 +0200
Message-ID: <CAMuHMdUgAutuRes9yTsDVCZ+rMeyQrhuX+BW60ft7_S9OU3RRg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g044: Add missing GICv3 node properties
To:     Sudeep Holla <sudeep.holla@arm.com>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sudeep,

On Tue, Jul 13, 2021 at 11:16 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> On Tue, Jul 13, 2021 at 11:04:09AM +0200, Geert Uytterhoeven wrote:
> > On Tue, Jul 13, 2021 at 10:56 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> > > On Tue, Jul 13, 2021 at 10:30:36AM +0200, Geert Uytterhoeven wrote:
>
> [...]
>
> > > > And a possible use case: the RT CPU core may want to reset the AP GIC.
> > >
> > > I didn't want to add new bindings without details on the implementation
> > > to avoid possible issues with backward compatibility as this was not
> > > thought through completely and correctly before it was added.
> > >
> > > OK, now let us discuss your use-case: *RT CPU wants to reset AP GIC*
> > >
> > > 1. Will it just reset AP GIC or will it request the AP reset as a whole ?
> > >    I am not sure if we can handle former, if you think otherwise what is
> > >    the reset notification mechanism ?
> > >
> > > 2. Will that bypass secure world/PSCI ? Again more details on this would
> > >    be helpful to visualise the entire use-case end-to-end better.
> > >
> > > By GIC reset, I am assuming it will be complete GIC reset including it's
> > > CPU interface.
> > >
> > > I don't think we can reset GIC without actual CPU reset. Even if we get
> > > some notification magically to the CPU that its GIC alone needs to be
> > > reset, it needs to safely higher exceptions to get its GIC CPU interface
> > > reprogrammed to correct (saved) values before OS can reprogram the NS
> > > world values. All these seems overall complicated and may be unnecessary.
> >
> > Probably both.  Might make sense to reset on wake-up, after having disabled
> > clocks and powered down the AP CPU, AP GIC, ...
> >
>
> /me confused. If this is arm64 platform, then you have to use *PSCI* and
> I expect the reset to be done as part of CPU wake-up in PSCI firmware.

DT Rule #1: DT describes hardware not software policy.

The fact that _Linux_ must use PSCI is a (unfortunate) software policy.
What about other OSes, or bare-metal software?

> > If that bypasses PSCI: well, if the unsecure software can do it, it
> > means the hardware is not secure. Or at least Linux has to be trusted.
>
> No, if the system has PSCI, then you simply can't bypass that for GIC
> reset. Or at-least I am failing to understand the complete flow of that.

PSCI can only prevent other software from bypassing GIC reset if PSCI
programs the hardware to prevent access to the GIC reset (if possible
at all).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
