Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD6CB104E7F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Nov 2019 09:56:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726689AbfKUIzu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Nov 2019 03:55:50 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:42448 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfKUIzu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Nov 2019 03:55:50 -0500
Received: by mail-ot1-f67.google.com with SMTP id b16so2237796otk.9;
        Thu, 21 Nov 2019 00:55:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QOpAoksQRaihS+maj4Fo63jeCplhE3SnVDot7Rw2NYM=;
        b=th7yPpoHsbU54fuDyO8jG1G+6p0ML7uvLxZtSFrwqiNKVZV1WtYXEi24wzESvyq95E
         250m21vO1NGEljQV+ybjFp23xMxsaeOI8WzAikP7Ze0YqrG7L/2AB3NiMcImy1shclns
         jWG8DBl8902kOV6egTrmivbKBI+COmj0wDaHHqO0kFXLzm5MK2geCSkaShkTxEIRAPDU
         4s+17rnCN6pvw6jHFOhzFfisP26UWV+VdlOEFO6ckQhMhDDhR/2P1vaAuittTJKFWUKF
         A6E2V9a+e6my7NQsnmGtTUCtyBmLijkGHuOhg9OfrCZy5IKjsEnDJoFoIVQSZnsPrfFQ
         2pNg==
X-Gm-Message-State: APjAAAWs3ja8OHsTiRhzEZAHku20pCd1A+DLrbosZNNSpY3kVU9fu2ww
        8wPEfVAVEcq/QxPYKfFlLyT8y0w6g0lfNkPMb/C6Uw==
X-Google-Smtp-Source: APXvYqznqMprWxSThBiXnTwMWZDZi3vgcW+tSNa1XLjBMMuBOk8u/DhyUTRxN2bm3vfubXiwUmTSoLQV4pUWTkh5Hw8=
X-Received: by 2002:a9d:5511:: with SMTP id l17mr5581850oth.145.1574326549851;
 Thu, 21 Nov 2019 00:55:49 -0800 (PST)
MIME-Version: 1.0
References: <1569249052-1037-1-git-send-email-biju.das@bp.renesas.com>
 <dd752192-8caf-39bf-5a91-27adb6a5f84b@linaro.org> <CAMuHMdVvgS17NW7srZ37x5QD3qtZkGQY9xE_97bvF8bwAcmLvg@mail.gmail.com>
 <OSBPR01MB21035DCC73952DBC72C139B2B84E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB21035DCC73952DBC72C139B2B84E0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Nov 2019 09:55:38 +0100
Message-ID: <CAMuHMdU530kruHOf1POKQ_jyvMMU=KY5TEVRgtQg54SHDaGX9A@mail.gmail.com>
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

Hi Biju,

On Thu, Nov 21, 2019 at 9:52 AM Biju Das <biju.das@bp.renesas.com> wrote:
> Any update on the below binding patch?

If it won't appear in v5.5-rc1, my plan is to queue it in renesas-devel
for v5.6.

> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: Thursday, October 3, 2019 7:51 AM
> > To: Daniel Lezcano <daniel.lezcano@linaro.org>
> > Cc: Biju Das <biju.das@bp.renesas.com>; Rob Herring
> > <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>; Thomas
> > Gleixner <tglx@linutronix.de>; open list:OPEN FIRMWARE AND FLATTENED
> > DEVICE TREE BINDINGS <devicetree@vger.kernel.org>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; Simon Horman <horms@verge.net.au>; Chris
> > Paterson <Chris.Paterson2@renesas.com>; Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com>; Linux-Renesas <linux-renesas-
> > soc@vger.kernel.org>
> > Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: Document r8a774b1
> > bindings
> >
> > Hi Daniel,
> >
> > On Thu, Oct 3, 2019 at 6:09 AM Daniel Lezcano <daniel.lezcano@linaro.org>
> > wrote:
> > > On 23/09/2019 16:30, Biju Das wrote:
> > > > Document RZ/G2N (R8A774B1) SoC in the Renesas TMU bindings.
> > > >
> > > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > > ---
> > > >  Documentation/devicetree/bindings/timer/renesas,tmu.txt | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > > > b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > > > index 9dff7e5..29159f4 100644
> > > > --- a/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > > > +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > > > @@ -11,6 +11,7 @@ Required Properties:
> > > >    - compatible: must contain one or more of the following:
> > > >      - "renesas,tmu-r8a7740" for the r8a7740 TMU
> > > >      - "renesas,tmu-r8a774a1" for the r8a774A1 TMU
> > > > +    - "renesas,tmu-r8a774b1" for the r8a774B1 TMU
> > > >      - "renesas,tmu-r8a774c0" for the r8a774C0 TMU
> > > >      - "renesas,tmu-r8a7778" for the r8a7778 TMU
> > > >      - "renesas,tmu-r8a7779" for the r8a7779 TMU
> > > >
> > >
> > > The patch does not apply on tip/timers
> >
> > That's expected, as I queued the previous change in renesas-dt-bindings-for-
> > v5.5, cfr.
> > https://lore.kernel.org/linux-renesas-soc/244ca7ac-54d1-d07d-762f-
> > e832b0e2a267@linaro.org/
> >
> > Do you want me to know this in renesas-dt-bindings-for-v5.5?
>


-- 
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
