Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B74417EFD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 11:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731810AbfHBJEJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 05:04:09 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36928 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733006AbfHBJEI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 05:04:08 -0400
Received: by mail-wr1-f66.google.com with SMTP id n9so51289283wrr.4;
        Fri, 02 Aug 2019 02:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KRUGpC3BCv2MvoBDHofK0hV/Ld50SE9ESjs7lmdGDlY=;
        b=cI+ltOwCyNeNGPbvnNV/R/evNoq9ked6WAVIPId/cPccUZ9yBVT708WE8lpwqkYQoe
         VZW8GyBIyaQ7w+Si0EpH+l5YLNAY6E0zfO9/7sF5a+r1jMitvfaWdNRL/iB1a6dZYpDT
         c02pR+zmTR5CuD+xcUMtusxxc/KQeAQ62y2DVzCltKl8S+GZST26ATjPUF1YktqB5EUa
         nenlY8gVh4Gz6cSTcOPtPnIVgSSxzW3RonAduAszWwm7lYgAQHiWh8joxwxI/vd/9xim
         5VIi8Fm05nCeoup9l0XltjTcsFjoofQ4OFK8KGsyVftRibFe2I3mBIcR+gNJCuED1wys
         0zTA==
X-Gm-Message-State: APjAAAU52TMksfJaZLrf5gydNgUivH2J5dNFkShENK6KoZO9AxFs8s1K
        1V5f0yNR2G86xWVnc+QYr4FB3g4xDRHXC4bmE6E=
X-Google-Smtp-Source: APXvYqyxiu+7ULi0rgiQeViV8AKwxO9YyGLdi6p6/vOGg2PK5WtCevpWFlS7/aCLCVNB7ag2kvX3Hk59oDWjrKQgDTo=
X-Received: by 2002:adf:cd81:: with SMTP id q1mr144721068wrj.16.1564736646537;
 Fri, 02 Aug 2019 02:04:06 -0700 (PDT)
MIME-Version: 1.0
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-11-git-send-email-fabrizio.castro@bp.renesas.com> <20190802082754.GK5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802082754.GK5008@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 2 Aug 2019 11:03:54 +0200
Message-ID: <CAMuHMdUFHddHJW=FsF8Ha0PZUiAyKrWGy6yg-0PtevB7HiHoHg@mail.gmail.com>
Subject: Re: [PATCH/RFC 10/12] arm64: dts: renesas: r8a774c0: Point LVDS0 to
 its companion LVDS1
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

On Fri, Aug 2, 2019 at 10:27 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Aug 02, 2019 at 08:34:07AM +0100, Fabrizio Castro wrote:
> > Add the new renesas,companion property to the LVDS0 node to point to the
> > companion LVDS encoder LVDS1.
> > Based on similar work from Laurent Pinchart for the r8a7799[05].
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> and taken in my tree.

Shouldn't this go through renesas-devel and arm-soc?

> > ---
> >  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 ++

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
