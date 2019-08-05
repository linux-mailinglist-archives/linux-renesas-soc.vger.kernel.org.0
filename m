Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C5388202C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Aug 2019 17:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbfHEP3Y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Aug 2019 11:29:24 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41917 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728801AbfHEP3X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Aug 2019 11:29:23 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so81626514wrm.8;
        Mon, 05 Aug 2019 08:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9HcW7+jJ3t1VA+YpEb/do2MHiPXBFNLncN4fVGvYvOo=;
        b=QUEeEvTIyVYqhNeeXAE6PNO+V9uh/69IEtD7WBRWLV9m/1od7G7FWTHSCiSbs27r0O
         Miyvn8pY4JC12+d2zhkIMzZ/2jsZ2nlQ35S6aGRRuW4zAI24MAaRcRJowfDJSxid/vG6
         fEjh7FyQrqam8DYssZ4kCf5q2iMmpUiVR1Y/14HbuDwzqfgJyCLdXIG+APEcT7bzRScI
         e6b1iCHC6pKmlV60J+7f7eirmp0rJ1Hw6BtdBciT1AiMRZ5k5ALhjDTkYomSDAc2Nxan
         iB16u2IYJU5SgRkVfm+SX+mAai2cqJJZqA/msz3T3yB0hs9wiO8r7kidNCu7mlRODng3
         Rv8Q==
X-Gm-Message-State: APjAAAWFwC0XILYJPrpEJSoWhtChrmRF5dNjeq6Fhzr1LQgdHWPJmIKS
        NW83R2srL8PYx0NUpoZEN9+9QiXbZYETmSC36Gk=
X-Google-Smtp-Source: APXvYqxu/VqXyxJnxr0LxnoAB6y8auSS6H/Cxgb7WZlj4nW21Txld4kWypvS4S7KQeYH90a0mt7xurnroQon+vz/Gww=
X-Received: by 2002:a5d:630c:: with SMTP id i12mr22638017wru.312.1565018961639;
 Mon, 05 Aug 2019 08:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1564731249-22671-11-git-send-email-fabrizio.castro@bp.renesas.com>
 <20190802082754.GK5008@pendragon.ideasonboard.com> <CAMuHMdUFHddHJW=FsF8Ha0PZUiAyKrWGy6yg-0PtevB7HiHoHg@mail.gmail.com>
 <20190802091012.GN5008@pendragon.ideasonboard.com>
In-Reply-To: <20190802091012.GN5008@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 5 Aug 2019 17:29:09 +0200
Message-ID: <CAMuHMdX6gKHVYpy6CV5gxtUFRQbbYsXSGjzkRRpPeMTsOeEVYA@mail.gmail.com>
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

On Fri, Aug 2, 2019 at 11:10 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Aug 02, 2019 at 11:03:54AM +0200, Geert Uytterhoeven wrote:
> > On Fri, Aug 2, 2019 at 10:27 AM Laurent Pinchart wrote:
> > > On Fri, Aug 02, 2019 at 08:34:07AM +0100, Fabrizio Castro wrote:
> > > > Add the new renesas,companion property to the LVDS0 node to point to the
> > > > companion LVDS encoder LVDS1.
> > > > Based on similar work from Laurent Pinchart for the r8a7799[05].
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > >
> > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > >
> > > and taken in my tree.
> >
> > Shouldn't this go through renesas-devel and arm-soc?
>
> I'm collecting multimedia-related DT patches for v5.4, but if you or
> Simon want to take this patch, it will save me from sending a pull
> request, so please go ahead :-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
