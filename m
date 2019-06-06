Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCA9337DC3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Jun 2019 22:00:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbfFFUAi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 6 Jun 2019 16:00:38 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46547 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbfFFUAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 6 Jun 2019 16:00:37 -0400
Received: by mail-lf1-f65.google.com with SMTP id l26so1040897lfh.13;
        Thu, 06 Jun 2019 13:00:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LBUHp0AIL6kvz/3M3h3KZw0asu/x3DOUpyN7cjLiU48=;
        b=U+eLzyw9H+cjpCR7u4njbfKnzUSpZWt3afmbgn/800V3Pk74+EYu+KEe+F5eJ8FiJu
         S6+bHwMiKwJ/W5TDtTxMmYJw1tKhghokQdF5Qt0g8XYEgojbZq4LP0VB1N4Rb85RPuPR
         aeCMixR7M3n6/hznBeu71Nkg9qzslyxywvZwZSwQQ2jP9f+1Sry+oX0fkavkZCqxteGz
         gMaivRTEiicCYcNCenrD74Hsk9/i144KXMGVx+tkQa1PguNj5GFn49fMXgSfMTxaEsBC
         4GooNSMy0Q7JZj6WgD/GX5ngyGeF36UPWD6rtafU0dA6MXJHx/9Np/A7R0+7hE4zNAJF
         DXog==
X-Gm-Message-State: APjAAAVAYfSVQtDw4NqsTyBx8Dio0xycOicC4eJyM2OhCnQnEiw4x1dF
        CDOt8EK3kRKg8Q8jTj/X0XUJ+ZpbrUFHjI63kWE=
X-Google-Smtp-Source: APXvYqz3Pt/5uYFWtTLV+LTz6jkGRFZHje7gNd6cKMaRPyvVC/M1rkaJjIOO9OoHs9efArOf/nxYG3a+eM+/Kgkk9nY=
X-Received: by 2002:ac2:597c:: with SMTP id h28mr681144lfp.90.1559851235901;
 Thu, 06 Jun 2019 13:00:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-4-jacopo+renesas@jmondi.org> <20190606165352.GK12825@pendragon.ideasonboard.com>
In-Reply-To: <20190606165352.GK12825@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 6 Jun 2019 22:00:23 +0200
Message-ID: <CAMuHMdVJEJ9Sehm5Ug4P+HW0iPYufPuYVD9vQ3qKg=htXFmuLg@mail.gmail.com>
Subject: Re: [PATCH 03/20] dt-bindings: display, renesas,du: Update 'vsps' in example
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent, Jacopo,

On Thu, Jun 6, 2019 at 8:50 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Thu, Jun 06, 2019 at 04:22:03PM +0200, Jacopo Mondi wrote:
> > Update the 'vsps' property structure in the documentation example to
> > reflect what's actually implemented in the device tree sources.
> >
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> > --- a/Documentation/devicetree/bindings/display/renesas,du.txt
> > +++ b/Documentation/devicetree/bindings/display/renesas,du.txt
> > @@ -92,7 +92,7 @@ Example: R8A7795 (R-Car H3) ES2.0 DU
> >                        <&cpg CPG_MOD 722>,
> >                        <&cpg CPG_MOD 721>;
> >               clock-names = "du.0", "du.1", "du.2", "du.3";
> > -             vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>, <&vspd0 1>;
> > +             vsps = <&vspd0 0 &vspd1 0 &vspd2  &vspd0 1>;
>
> The former is simpler to read than the latter in my opinion. Shouldn't
> we update the .dtsi files instead ?

Yes, it is easier to read (for humans).

> >               cmms = <&cmm0 &cmm1 &cmm2 &cmm3>;

Perhaps we want grouping here, too?

> >
> >               ports {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
