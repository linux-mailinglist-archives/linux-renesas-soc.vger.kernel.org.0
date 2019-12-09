Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33C53116ABC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2019 11:17:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbfLIKRj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 9 Dec 2019 05:17:39 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:38138 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbfLIKRj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Dec 2019 05:17:39 -0500
Received: by mail-ot1-f68.google.com with SMTP id h20so11700851otn.5;
        Mon, 09 Dec 2019 02:17:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y7flbq6+7YTjmESDNTJ4OzwE7ryXBG98KKcLk04ran8=;
        b=O9h9oCKXI8QyPSIsTruKomXA+HFse0/yYn/VJnTz/Xp9IGlD471kENT7wmSNYLmK7d
         aF51qnKPcrWY4N1rFflG+gNdk8Q74dU96RlJBNUso2m5yJfTyKq0J2w3FDERp7c59kNZ
         kRrx/MPvc41mcNFGHIG+aMLaA41fu3D3TwMyN+F0NdHTjiDaVi+XE4cXE58qysx0gvBx
         hSmBmxlBtEKw/cpJeKr17JNnUch3GC6uj6Qgg1jtkw46syQNcHjO18v2sAr4F5xgV5/I
         Jpr5puyhljzgBywZWDRtjJOxfmQ3qSyUN/NLtAahjwiXUFoSUTCgb+eKXIZYJJ2uDvwB
         HmBg==
X-Gm-Message-State: APjAAAXyeLZU5CL9+czLVHqpMEORY0ymHZFyLyX3Tt8SKHa0es4nf3WB
        oAyTxGtiBbjc278H/SeAaRAMvaFxzFGEf5LOaow=
X-Google-Smtp-Source: APXvYqxddFupz55wwOQITZ3Eom64vQFZfo4vNjcw+JJLnpiE1RU3C/1uMCrZ0t0QSH5gpJnQBZZHhg/WnzmsJ3f+x6M=
X-Received: by 2002:a9d:2073:: with SMTP id n106mr20867827ota.145.1575886658196;
 Mon, 09 Dec 2019 02:17:38 -0800 (PST)
MIME-Version: 1.0
References: <1569249052-1037-1-git-send-email-biju.das@bp.renesas.com>
 <dd752192-8caf-39bf-5a91-27adb6a5f84b@linaro.org> <CAMuHMdVvgS17NW7srZ37x5QD3qtZkGQY9xE_97bvF8bwAcmLvg@mail.gmail.com>
 <OSBPR01MB21035DCC73952DBC72C139B2B84E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <CAMuHMdU530kruHOf1POKQ_jyvMMU=KY5TEVRgtQg54SHDaGX9A@mail.gmail.com>
In-Reply-To: <CAMuHMdU530kruHOf1POKQ_jyvMMU=KY5TEVRgtQg54SHDaGX9A@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 9 Dec 2019 11:17:27 +0100
Message-ID: <CAMuHMdW7NkDk2keWx9vJtRSJ4SVuSk6NVLTcCCS6zpDF-Y5AFQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: Document r8a774b1 bindings
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Nov 21, 2019 at 9:55 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, Nov 21, 2019 at 9:52 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > Any update on the below binding patch?
>
> If it won't appear in v5.5-rc1, my plan is to queue it in renesas-devel
> for v5.6.

Queued.


> > > -----Original Message-----
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > Sent: Thursday, October 3, 2019 7:51 AM
> > > To: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > Cc: Biju Das <biju.das@bp.renesas.com>; Rob Herring
> > > <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; Thomas
> > > Gleixner <tglx@linutronix.de>; open list:OPEN FIRMWARE AND FLATTENED
> > > DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; Geert Uytterhoeven
> > > <geert+renesas@glider.be>; Simon Horman <horms@verge.net.au>; Chris
> > > Paterson <Chris.Paterson2@renesas.com>; Fabrizio Castro
> > > <fabrizio.castro@bp.renesas.com>; Linux-Renesas <linux-renesas-
> > > soc@vger.kernel.org>
> > > Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: Document r8a774b1
> > > bindings
> > >
> > > Hi Daniel,
> > >
> > > On Thu, Oct 3, 2019 at 6:09 AM Daniel Lezcano <daniel.lezcano@linaro.org>
> > > wrote:
> > > > On 23/09/2019 16:30, Biju Das wrote:
> > > > > Document RZ/G2N (R8A774B1) SoC in the Renesas TMU bindings.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/timer/renesas,tmu.txt | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > > > > b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > > > > index 9dff7e5..29159f4 100644
> > > > > --- a/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > > > > +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > > > > @@ -11,6 +11,7 @@ Required Properties:
> > > > >    - compatible: must contain one or more of the following:
> > > > >      - "renesas,tmu-r8a7740" for the r8a7740 TMU
> > > > >      - "renesas,tmu-r8a774a1" for the r8a774A1 TMU
> > > > > +    - "renesas,tmu-r8a774b1" for the r8a774B1 TMU
> > > > >      - "renesas,tmu-r8a774c0" for the r8a774C0 TMU
> > > > >      - "renesas,tmu-r8a7778" for the r8a7778 TMU
> > > > >      - "renesas,tmu-r8a7779" for the r8a7779 TMU
> > > > >
> > > >
> > > > The patch does not apply on tip/timers
> > >
> > > That's expected, as I queued the previous change in renesas-dt-bindings-for-
> > > v5.5, cfr.
> > > https://lore.kernel.org/linux-renesas-soc/244ca7ac-54d1-d07d-762f-
> > > e832b0e2a267@linaro.org/
> > >
> > > Do you want me to know this in renesas-dt-bindings-for-v5.5?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
