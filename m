Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6509127EF8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Dec 2019 16:04:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727381AbfLTPE4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Dec 2019 10:04:56 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40403 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbfLTPE4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Dec 2019 10:04:56 -0500
Received: by mail-ot1-f66.google.com with SMTP id w21so4445776otj.7;
        Fri, 20 Dec 2019 07:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xIXSDPOOX2OHZ/9UyDaX8zGuRfcDybDX4Wqu+KsOODA=;
        b=sFswHyToitcauv+VQ/ZbCt8ttho7mKiKXixup/Np6QFr+MRF5qWgkXbVeQDgJFimZ5
         7sofXUgBT3MxQLpJwDT6ECirxx8ZcGMFGXMddqHxb3nv+p07i59UlV4LaXctIyiqK34D
         dGerzxyYpcu7VmzLEyL141SefEzMOBcXgVDgOirzaiDpyMoxraZnLmI9cIFEscLwXzF8
         i5AmKKd+BPCeGV6F/mNn7siQ1jW31u19CE8P+efJWqoegiPjhIhXCdOT6ormLGPdqPzM
         w19bL461AOaPPRgpgqZg6r8zLrIs4AzaO8gBqGxk5OzQqDYemJ360AIuelAVsgD/gHnm
         yYXw==
X-Gm-Message-State: APjAAAXjkuQ1swddvaIE2xXysQKZPZ80bjii+mykTXrSErSv+/MCfId6
        8vCut4Xoka97nC/jE8VpeGnGfk85WtUHJ5R6rGmVzg==
X-Google-Smtp-Source: APXvYqyTAKnoo5F9im1mYMj/SXRfvhTRApAZxNoKMuSQVvjWyyC7PQ64avx40ELmisiT5cF2oDbrovaa69yULurZ9MM=
X-Received: by 2002:a9d:2073:: with SMTP id n106mr5653440ota.145.1576854294903;
 Fri, 20 Dec 2019 07:04:54 -0800 (PST)
MIME-Version: 1.0
References: <1570104229-59144-1-git-send-email-biju.das@bp.renesas.com> <5af2669f-b977-1c36-95fb-ad006548b0d8@linaro.org>
In-Reply-To: <5af2669f-b977-1c36-95fb-ad006548b0d8@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 20 Dec 2019 16:04:43 +0100
Message-ID: <CAMuHMdVTTiMj+7bF0_TbX9k+QUKpsTto4aut=d0pkwz6_rOVfg@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: timer: renesas, cmt: Document r8a774b1
 CMT support
To:     Daniel Lezcano <daniel.lezcano@linaro.org>
Cc:     Biju Das <biju.das@bp.renesas.com>,
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

Hi Daniel,

On Wed, Dec 4, 2019 at 5:36 PM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> On 03/10/2019 14:03, Biju Das wrote:
> > Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> > V1-->V2
> >  * Rebased to tip/timers
> > ---
> >  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> > index a444cfc..a747fab 100644
> > --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> > +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> > @@ -29,6 +29,8 @@ Required Properties:
> >      - "renesas,r8a77470-cmt1" for the 48-bit CMT1 device included in r8a77470.
> >      - "renesas,r8a774a1-cmt0" for the 32-bit CMT0 device included in r8a774a1.
> >      - "renesas,r8a774a1-cmt1" for the 48-bit CMT devices included in r8a774a1.
> > +    - "renesas,r8a774b1-cmt0" for the 32-bit CMT0 device included in r8a774b1.
> > +    - "renesas,r8a774b1-cmt1" for the 48-bit CMT devices included in r8a774b1.
> >      - "renesas,r8a774c0-cmt0" for the 32-bit CMT0 device included in r8a774c0.
> >      - "renesas,r8a774c0-cmt1" for the 48-bit CMT devices included in r8a774c0.
> >      - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
>
> Applied, thanks!

Thanks!
Looks like it's been a while you pushed your local branches to git.linaro.org?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
