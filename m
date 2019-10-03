Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE3D4C98AB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Oct 2019 08:53:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbfJCGxs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Oct 2019 02:53:48 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:41993 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfJCGxr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Oct 2019 02:53:47 -0400
Received: by mail-ot1-f68.google.com with SMTP id c10so1340779otd.9;
        Wed, 02 Oct 2019 23:53:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y0ruBFHWi9OYE4E12vzQFfkM5P7jSliMi4kt8S/GY5Y=;
        b=hjq4waor8vUDWXGeDEjnGKFCigug1YY2LTrtVREb3ILoh2n4R7JOygVjrJwWZMIvJF
         ArqrydEoSXwrXHDmnhiG05OB+z2LJRKkehcZBnhX5K/aw87tPEySSakusalKVbv8wcna
         qs6j2pbHWsOVJfg13zbgRgHUwAbjQvLzFD81cP7pjOhiIHnufm0IT2/O5LAYcKb9XYK+
         1LgJpeMWKZkV149TWI+G36YrUoR7I+UwCG6ZyQSXynNAfDPSiE6v+IImbdwYiq8Ig0Mk
         Ex6r5zPsLIESZlyruPQQ+Bp4qVrjbMR7KzrCjz0vZZC5julR0GjOvDb+PZIs7DCBGjHw
         Q+Gg==
X-Gm-Message-State: APjAAAVi5mmBgBfjZuTFJSDmD66r7vawRx9eV+bKcRbPS/Q93U+8iYHA
        bWbQH+8D2SraqvUp2MDv7tMM60It8+W4xNVQQ5IemknC
X-Google-Smtp-Source: APXvYqwebgMr7zfRZO5B7bkHOWz2lIl2VEsCBrLGhh6oAgfNSPrhRAHZ61I5QSQAxpwd20PP8DGJPQUwCgc8bsfrvRY=
X-Received: by 2002:a9d:6642:: with SMTP id q2mr5536389otm.250.1570085626827;
 Wed, 02 Oct 2019 23:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <1569248907-62107-1-git-send-email-biju.das@bp.renesas.com>
 <df05997f-e9c5-d226-68cd-6f1274995688@linaro.org> <OSBPR01MB21036A4E612729D5C5709E7BB89F0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
In-Reply-To: <OSBPR01MB21036A4E612729D5C5709E7BB89F0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Oct 2019 08:53:35 +0200
Message-ID: <CAMuHMdURzHLLC+0KsuBBdRShUDnfD8fPQcfo3kUctt1AxGFkzg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a774b1 CMT support
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Oct 3, 2019 at 8:39 AM Biju Das <biju.das@bp.renesas.com> wrote:
> > Subject: Re: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a774b1
> > CMT support
> >
> > On 23/09/2019 16:28, Biju Das wrote:
> > > Document SoC specific bindings for RZ/G2N (r8a774b1) SoC.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > > ---
> > >  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> > > b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> > > index c5220bc..7b1f454 100644
> > > --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> > > +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> > > @@ -32,6 +32,8 @@ Required Properties:
> > >      - "renesas,r8a77470-cmt1" for the 48-bit CMT1 device included in
> > r8a77470.
> > >      - "renesas,r8a774a1-cmt0" for the 32-bit CMT0 device included in
> > r8a774a1.
> > >      - "renesas,r8a774a1-cmt1" for the 48-bit CMT1 device included in
> > r8a774a1.
> > > +    - "renesas,r8a774b1-cmt0" for the 32-bit CMT0 device included in
> > r8a774b1.
> > > +    - "renesas,r8a774b1-cmt1" for the 48-bit CMT1 device included in

"CMT devices", cfr. commit 1be8c9fd2ac9ad73 ("dt-bindings: timer: renesas,
cmt: Update R-Car Gen3 CMT1 usage").

> > r8a774b1.
> > >      - "renesas,r8a774c0-cmt0" for the 32-bit CMT0 device included in
> > r8a774c0.
> > >      - "renesas,r8a774c0-cmt1" for the 48-bit CMT1 device included in
> > r8a774c0.
> > >      - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
> > >
> >
> > The patch does not apply on tip/timers
>
> OK. I will rebase on top of tip/timers and will send V2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
