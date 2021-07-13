Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64B483C6BFE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jul 2021 10:30:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbhGMIdj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Jul 2021 04:33:39 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:41950 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234157AbhGMIdj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Jul 2021 04:33:39 -0400
Received: by mail-vs1-f42.google.com with SMTP id u14so3301163vsc.8;
        Tue, 13 Jul 2021 01:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eEsoL6MTApmgjG/evaA1dXgDvzr7289p+czu9v11XIs=;
        b=nvOsmTYyIXAEqGEymhs/z99GBCLJXMtxXbO0rb8QMcsIpgP5XF3GEv5CPjuNU259WY
         srQXt+DxIwv5FT4i4ahXeRAx14dAuUnY9KMBMmdOVvKvhQNJk5m+5Y9dFnoXw1Kt9H1T
         9MwlsgvljCgGWeq5BwpyTg0jZmb+y6bJD8IZJVJbPIAVV2GkKAmdTgfM/Y+KZy2TO4FQ
         IKbBqTjuDZLv338i72DFjnsoUpr1DbsGTt0H+9LZzwZxO1jvfMjul7OXTu08oInBXkQv
         9lf9IXaXKrgYWS6mVv7NmiEEc5YdjtAD1oj3ikKn+y6pY5m8yE1ZvAzVRx6tTeDu0k1X
         cgGw==
X-Gm-Message-State: AOAM533AzYxqy5oEBCjKHq3MNabF8LPzAxUAnMXcbMh0LuLBXg0Dc3Qx
        eZGc6IPk70WqP3EKREC9rlXtDYNKg+dPMXv8VAU=
X-Google-Smtp-Source: ABdhPJzzo5qrCm4b0w4yH0ZMLIZvTvc9RSQOAB/gZwIAp6Zvj1v5OtzXCsaKDGQSrDez2xdSlawrMRFHt/2aqWogVes=
X-Received: by 2002:a05:6102:321c:: with SMTP id r28mr4675152vsf.40.1626165047947;
 Tue, 13 Jul 2021 01:30:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210611152108.6785-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWJQESFmhV+c-QmivXCWPx21QcB-HSzjxf8KsXh_DAvfw@mail.gmail.com>
 <CAMuHMdXG9H_mOtA_a9t0K8BVaR4p0DcWgNeL0786YvybV2Hqgw@mail.gmail.com> <CA+V-a8tk6uCeRwmiTh=Ds+8DYVUqCYs64nX_9ksDXXdSd-rxNA@mail.gmail.com>
In-Reply-To: <CA+V-a8tk6uCeRwmiTh=Ds+8DYVUqCYs64nX_9ksDXXdSd-rxNA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 13 Jul 2021 10:30:36 +0200
Message-ID: <CAMuHMdUg5v3qsFQsg783nC=o_BL3pL6YqqQphGQHHOaCeakj5Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a07g044: Add missing GICv3 node properties
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
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

Hi Prabhakar,

On Tue, Jul 13, 2021 at 10:22 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Jul 13, 2021 at 9:08 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Jun 14, 2021 at 2:48 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Fri, Jun 11, 2021 at 5:21 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > Add the below missing properties into GIC node,
> > > > - clocks
> > > > - clock-names
> > > > - power-domains
> > > > - resets
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Queueing pending on[1].
> > >
> > > > [1] https://lore.kernel.org/linux-devicetree/
> > > >     20210609155108.16590-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
> >
> > The dependency has been accepted, but this patch needs a respin
> > for the changed clocks.
> >
> Thank you for pointing this out. wrt resets the GIC has two signals
> (which I learnt lately when the dependency path was accepted). Earlier
> discussion in irc with Sudeep pointed out that there wouldn't be any
> use case of having GIC resets in DTSI, so either we drop the resets
> property in DT binding doc or correct it.
>
> Let me know your thoughts on this and how we proceed further.

DT Rule #1: DT describes hardware not software policy.

And a possible use case: the RT CPU core may want to reset the AP GIC.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
