Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4622C3C6CD3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 11:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234603AbhGMJHK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 05:07:10 -0400
Received: from mail-ua1-f52.google.com ([209.85.222.52]:33471 "EHLO
        mail-ua1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234121AbhGMJHK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 05:07:10 -0400
Received: by mail-ua1-f52.google.com with SMTP id d2so8372793uan.0;
        Tue, 13 Jul 2021 02:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WQWSg0jDhNONrBiZZkx/bcj5j+pFk4TYCqn0Z+sXNdk=;
        b=e9PtSQHEDPAPJzEbQJup31n6O5Z0EKW89aoKf/K/xIpFaOP/MwNb8nAF1TsKu2qwLy
         HHpuCxZA5oWSuCoEc1W6Svtmn8xHFO363TtX6hdFomTL4IfalCsjfyG9pCjdfeNtjjPc
         O4FvO64giMxE0t55UM/Yh+5IqRf/jeC1/SR+azdVi1NCSv8aAp+EWiiEXNvCcE4WXN06
         Lpdle7Z0mKDle0B8b9qYffXJhj8c5IfQdRfhzt19uApyQ6L5aUsYHLNP9bKtjSRuBtaR
         c2hEtCqmiUd1lNmBxzyWSkwpY8l449sSoGqxU4UrzsEhh24aqt2RUmDC0WB+50Y2c6Dd
         FvGg==
X-Gm-Message-State: AOAM532f+ZKbfr4BK6M2V2RVDA03YToXEtRV2Rq0YizlgaLycA1Iutcx
        T4+HNf3umk7E5gJLtWypsXu/TmCiZ/gVySmHibA=
X-Google-Smtp-Source: ABdhPJxmIw0nXS2cU2uL1fDZHeZi7584axKXsQoQpys4cUbFsG87WiXR+tlSUdpuTvQK+kGDHhgf0FSjubiQ2jxtfIM=
X-Received: by 2002:a9f:3f0d:: with SMTP id h13mr4554003uaj.100.1626167060423;
 Tue, 13 Jul 2021 02:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210611152108.6785-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWJQESFmhV+c-QmivXCWPx21QcB-HSzjxf8KsXh_DAvfw@mail.gmail.com>
 <CAMuHMdXG9H_mOtA_a9t0K8BVaR4p0DcWgNeL0786YvybV2Hqgw@mail.gmail.com>
 <CA+V-a8tk6uCeRwmiTh=Ds+8DYVUqCYs64nX_9ksDXXdSd-rxNA@mail.gmail.com>
 <CAMuHMdUg5v3qsFQsg783nC=o_BL3pL6YqqQphGQHHOaCeakj5Q@mail.gmail.com> <20210713085508.nq6473icf5gt3nm5@bogus>
In-Reply-To: <20210713085508.nq6473icf5gt3nm5@bogus>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Jul 2021 11:04:09 +0200
Message-ID: <CAMuHMdVG6eji_uW+7egeQH=77fwQnN_qQ4hRHgQa4XQYQrbL9Q@mail.gmail.com>
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

On Tue, Jul 13, 2021 at 10:56 AM Sudeep Holla <sudeep.holla@arm.com> wrote:
> On Tue, Jul 13, 2021 at 10:30:36AM +0200, Geert Uytterhoeven wrote:
> > On Tue, Jul 13, 2021 at 10:22 AM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Tue, Jul 13, 2021 at 9:08 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Mon, Jun 14, 2021 at 2:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > > On Fri, Jun 11, 2021 at 5:21 PM Lad Prabhakar
> > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > > > Add the below missing properties into GIC node,
> > > > > > - clocks
> > > > > > - clock-names
> > > > > > - power-domains
> > > > > > - resets
> > > > > >
> > > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > > >
> > > > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > >
> > > > > Queueing pending on[1].
> > > > >
> > > > > > [1] https://lore.kernel.org/linux-devicetree/
> > > > > >     20210609155108.16590-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> > > >
> > > > The dependency has been accepted, but this patch needs a respin
> > > > for the changed clocks.
> > > >
> > > Thank you for pointing this out. wrt resets the GIC has two signals
> > > (which I learnt lately when the dependency path was accepted). Earlier
> > > discussion in irc with Sudeep pointed out that there wouldn't be any
> > > use case of having GIC resets in DTSI, so either we drop the resets
> > > property in DT binding doc or correct it.
> > >
> > > Let me know your thoughts on this and how we proceed further.
> >
> > DT Rule #1: DT describes hardware not software policy.
> >
>
> Completely agreed, no disagreement .

Good ;-)

> > And a possible use case: the RT CPU core may want to reset the AP GIC.
>
> I didn't want to add new bindings without details on the implementation
> to avoid possible issues with backward compatibility as this was not
> thought through completely and correctly before it was added.
>
> OK, now let us discuss your use-case: *RT CPU wants to reset AP GIC*
>
> 1. Will it just reset AP GIC or will it request the AP reset as a whole ?
>    I am not sure if we can handle former, if you think otherwise what is
>    the reset notification mechanism ?
>
> 2. Will that bypass secure world/PSCI ? Again more details on this would
>    be helpful to visualise the entire use-case end-to-end better.
>
> By GIC reset, I am assuming it will be complete GIC reset including it's
> CPU interface.
>
> I don't think we can reset GIC without actual CPU reset. Even if we get
> some notification magically to the CPU that its GIC alone needs to be
> reset, it needs to safely higher exceptions to get its GIC CPU interface
> reprogrammed to correct (saved) values before OS can reprogram the NS
> world values. All these seems overall complicated and may be unnecessary.

Probably both.  Might make sense to reset on wake-up, after having disabled
clocks and powered down the AP CPU, AP GIC, ...

If that bypasses PSCI: well, if the unsecure software can do it, it
means the hardware is not secure. Or at least Linux has to be trusted.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
