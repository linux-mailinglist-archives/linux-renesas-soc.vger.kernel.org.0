Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A17D0108BB3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Nov 2019 11:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727446AbfKYKay (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Nov 2019 05:30:54 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:35233 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfKYKay (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Nov 2019 05:30:54 -0500
Received: by mail-oi1-f194.google.com with SMTP id a69so5409208oib.2;
        Mon, 25 Nov 2019 02:30:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NZhTG7JrTxVrl8HklVVpBm1b8hN58Dtj6eIptpC87Go=;
        b=HK8VmpICBCFTgyKdBIf2CTJENZzTwGR1efsd3wkhpGEFehYKV/U8888WbYMPG4X/Uk
         Tv2oO9NZS+cHdC75FcgtOzBzmtFbQ5eVIDZ9FB6ICFjixvl49SMzNKpLlY+n87iJbBjN
         zYeEZDKtHT0sYk/eJQE+Yd8kGCSKep/5EiZYNJxPWnZMUP1OGJvW66+Vj30OLjrVCBYM
         RPXYTWn7PV+7vyYhk7iFvE8baRGnYLMObIOPii4kvQZS/9NqKZXsrJXPothSk29U4yuz
         EeQpAlZGTmshiUX7Rye6Lw9SvvmeAhBY5cY0xLqExHC8wzf3x/yB8reXJN3w3sJyErOG
         2/1A==
X-Gm-Message-State: APjAAAWcRzDcRV7uK7M4WktqA495Kx67NB/L1wbvOuz3P4P4gdFGRc+1
        cEQueu4aNZatpkCi6HgGu7eQgGdbrNHXQojMu2s=
X-Google-Smtp-Source: APXvYqzahB4IkEd3hY2YMl05tu9CqbTgIRb3JP+J1EsSDdVtzfDIq4iFyngv7ATmScbyCG2vev3Xaugc7OMo6N6vdHE=
X-Received: by 2002:a05:6808:b17:: with SMTP id s23mr22937725oij.102.1574677852994;
 Mon, 25 Nov 2019 02:30:52 -0800 (PST)
MIME-Version: 1.0
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-12-git-send-email-fabrizio.castro@bp.renesas.com> <20191119001226.GK5171@pendragon.ideasonboard.com>
In-Reply-To: <20191119001226.GK5171@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Nov 2019 11:30:42 +0100
Message-ID: <CAMuHMdWAD_W7r3Ewy-oZPO=YPCGtik0BWrJg2OBr=QwOdKsnZw@mail.gmail.com>
Subject: Re: [PATCH v4 11/13] ARM: shmobile_defconfig: Enable support for
 panels from EDT
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Peter Rosin <peda@axentia.se>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Nov 19, 2019 at 1:12 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Nov 13, 2019 at 03:51:30PM +0000, Fabrizio Castro wrote:
> > The iwg20d comes with an LCD panel from Emerging Display
> > Technologies Corporation (EDT), therefore enable what's
> > required to support it.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
>
> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> I expect Geert to pick this up.

Thanks, queued in renesas-devel for v5.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
