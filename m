Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E9E7108BAF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Nov 2019 11:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfKYKaZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Nov 2019 05:30:25 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:41844 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfKYKaY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Nov 2019 05:30:24 -0500
Received: by mail-oi1-f193.google.com with SMTP id e9so12601530oif.8;
        Mon, 25 Nov 2019 02:30:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wyl6mPeC7mKjazb4tEOb4I3V1TLHNpvgiFJX0v5ANQ4=;
        b=LBPy6XOXaL11I8uaeUrUX6WvF1cJEagrZfXIf/89kFhpUDEMkHF7pxRELnb5hvL7wJ
         d48AdkqSd1n5fQ/WWt2E/2UqqQLrmWNg5SgCVJ08ci3eLJv1GAX+H7AMHVZuzzmMXY0V
         ROz7hNn71afAnfoeGAylcHYefKHVSJMdKESWB0bo9EOBsV0n3r6N7TzO+F5ptU946vQI
         wZryw97FvCp6BoAq7CSz3Dfvsx2i3oS4IahsUUvVYNNdy4SaLMiPqQiVRwYR3PiDyVUF
         5udUMdf6fXSXoITbkPQFZ3vsiMSOK86LAPMORElrzEFr85pZQt8VtYxwGDmwB03j1DYM
         4HfQ==
X-Gm-Message-State: APjAAAUr1j7ca1ilWzK1pG8IzWoKFGJxoUvQu2fiTIdrfay8gYumYhwX
        0+xXIDatKcvaBl401+cwtMvVTm1jPKP7ZJ7FG14=
X-Google-Smtp-Source: APXvYqzGsVbZbHgRXv5DP5pCPh136mIwXjppchqIZm61zcsPTRH2CV8Hej5jjf9xpn2HJ5cJeQYvNVIBbPnBJq7B8hE=
X-Received: by 2002:aca:4a41:: with SMTP id x62mr7182936oia.148.1574677823677;
 Mon, 25 Nov 2019 02:30:23 -0800 (PST)
MIME-Version: 1.0
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-11-git-send-email-fabrizio.castro@bp.renesas.com> <20191119001040.GJ5171@pendragon.ideasonboard.com>
In-Reply-To: <20191119001040.GJ5171@pendragon.ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Nov 2019 11:30:12 +0100
Message-ID: <CAMuHMdUkibRMto5BehwxY2qGbx5tr_5vLT41PFzx_vU4_0bfWg@mail.gmail.com>
Subject: Re: [PATCH v4 10/13] ARM: dts: iwg20d-q7-common: Add LCD support
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

On Tue, Nov 19, 2019 at 1:10 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Nov 13, 2019 at 03:51:29PM +0000, Fabrizio Castro wrote:
> > The iwg20d comes with a 7" capacitive touch screen, therefore
> > add support for it.
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
