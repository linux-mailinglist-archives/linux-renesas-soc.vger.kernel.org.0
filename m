Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B93AC989B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 08:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfJCGuu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 02:50:50 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:41584 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbfJCGuu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 02:50:50 -0400
Received: by mail-ot1-f67.google.com with SMTP id g13so1338638otp.8;
        Wed, 02 Oct 2019 23:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=auZ7HiHMDv5PPXvkfHWTWD80UebgiY2eZyTeLcEb2XE=;
        b=ZinS2VNkmhkp61XHmoSSxHAZwbPRd5VMW+6t4A9057ty/w6yegi0TiDptzY7758dia
         YHS9SQdjBfVHOkyvXiQjGYbOKVnKgFHheIEbXPbUdRfqInanG8AoKB5MTktme2QRzZKc
         8pj5qaV4wFVWNfbPs+JHK1ckdOBLJQAriyMBKhlPX8oF9xC40kUijK+Y6d/9yCoRdXbb
         1e3d7IMhzW29CoykBtw3fZvqmlA95DNfQaguZ5TJHARBolxQWaHE8KRMQLLyLIE8zeBv
         ycLczWGkUXiZbYKWAoTqJWTQegi2gI3O14PCxAGgMZzJGIMYpuz5V3zo0UwcxXrU6ME4
         AG6Q==
X-Gm-Message-State: APjAAAXoUZPw9S7UoZ6SMhKSxQi8UmhmfZ1+kwrzh6a5y5i3VlHYq4xf
        i1zgEPsCaI+xrgUru+c1zIoe4ljK7Pm/GQnf1is=
X-Google-Smtp-Source: APXvYqyT8loLZb66HtrVN0p6WhG71GjGj/ioh6ZRGKrJEiMMOG/hVcGaY//JRTRC5CFxH1ThIhJdzdSjtisJDJn6+20=
X-Received: by 2002:a9d:7311:: with SMTP id e17mr5232167otk.107.1570085449032;
 Wed, 02 Oct 2019 23:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <1569249052-1037-1-git-send-email-biju.das@bp.renesas.com> <dd752192-8caf-39bf-5a91-27adb6a5f84b@linaro.org>
In-Reply-To: <dd752192-8caf-39bf-5a91-27adb6a5f84b@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Oct 2019 08:50:37 +0200
Message-ID: <CAMuHMdVvgS17NW7srZ37x5QD3qtZkGQY9xE_97bvF8bwAcmLvg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas: tmu: Document r8a774b1 bindings
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

On Thu, Oct 3, 2019 at 6:09 AM Daniel Lezcano <daniel.lezcano@linaro.org> wrote:
> On 23/09/2019 16:30, Biju Das wrote:
> > Document RZ/G2N (R8A774B1) SoC in the Renesas TMU bindings.
> >
> > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/timer/renesas,tmu.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.txt b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > index 9dff7e5..29159f4 100644
> > --- a/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > +++ b/Documentation/devicetree/bindings/timer/renesas,tmu.txt
> > @@ -11,6 +11,7 @@ Required Properties:
> >    - compatible: must contain one or more of the following:
> >      - "renesas,tmu-r8a7740" for the r8a7740 TMU
> >      - "renesas,tmu-r8a774a1" for the r8a774A1 TMU
> > +    - "renesas,tmu-r8a774b1" for the r8a774B1 TMU
> >      - "renesas,tmu-r8a774c0" for the r8a774C0 TMU
> >      - "renesas,tmu-r8a7778" for the r8a7778 TMU
> >      - "renesas,tmu-r8a7779" for the r8a7779 TMU
> >
>
> The patch does not apply on tip/timers

That's expected, as I queued the previous change in
renesas-dt-bindings-for-v5.5, cfr.
https://lore.kernel.org/linux-renesas-soc/244ca7ac-54d1-d07d-762f-e832b0e2a267@linaro.org/

Do you want me to know this in renesas-dt-bindings-for-v5.5?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
