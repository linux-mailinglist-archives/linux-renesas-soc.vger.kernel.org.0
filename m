Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43632167EC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Feb 2020 14:37:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727781AbgBUNhu convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Feb 2020 08:37:50 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:34792 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbgBUNhu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Feb 2020 08:37:50 -0500
Received: by mail-oi1-f196.google.com with SMTP id l136so1594571oig.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Feb 2020 05:37:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MZ5FFpqC7J8k8LW2vNF+/tg6pNtjzdyvBTNtwKzQdYc=;
        b=Thp3nvm2lxdV3MMZI1ShyQXo2KYfSk+xFbJoGJ3yi7eOg0y1OKPE/Vyp2b6lIjnaZ1
         Ba0gKDPhkSEGGWkEE4/BOr3xeBN2coa7d/xxQTmaHNIDp0Br094lIo2QGOVbkQWem4Bn
         29cAZarHJTMmRSrgnxF86NkuRWqjStkukhagBj7DXIxJMmQxkjPHVV4Wnem8zFNHnyyy
         36e7Cr/48r1mx+U4YRA98QYQ3UOdVb98XnlqdP8xSVE0MMsGej/rYUU2PuohfKvY4OPy
         KXI496wtr5jUuBDuGC8teQxk5USR1y/16sYbGmkR3aTILGx9VQlq7ojqG/TTME31OSC6
         CIQQ==
X-Gm-Message-State: APjAAAXIef1fOK9k3L2f2X7UZoVoUjRBbCBr8jcO25ZfRN37Na8HPEpu
        G5AaH7tFbiCjZ7uomoVEyQcsHVmTtHIXWLfZIcrCZ/ls
X-Google-Smtp-Source: APXvYqxiY+T5BeibvzDpQ+KW0cPfh6AtAQw5WS5cMVF3ujiA8DxmR1SGSFs/wjtWOiln7gwst5YoiEew9j+SfAX06Nw=
X-Received: by 2002:aca:52d0:: with SMTP id g199mr1911016oib.153.1582292268322;
 Fri, 21 Feb 2020 05:37:48 -0800 (PST)
MIME-Version: 1.0
References: <20200218132217.21454-1-geert+renesas@glider.be>
 <20200218200413.GB1016123@oden.dyn.berto.se> <CAMuHMdX1PPbuHDeBBYuy-LT57ShMwH0SO+GjkkdsOcXyVu+WYQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX1PPbuHDeBBYuy-LT57ShMwH0SO+GjkkdsOcXyVu+WYQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 21 Feb 2020 14:37:37 +0100
Message-ID: <CAMuHMdXv3TVDE6EXtREogLg5bv2fjgJvnnr76Atrwox-ob2uTQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7745: Convert to new DU DT bindings
To:     Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Konstantin,

On Fri, Feb 21, 2020 at 2:22 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Tue, Feb 18, 2020 at 9:04 PM Niklas Söderlund
> <niklas.soderlund@ragnatech.se> wrote:
> > On 2020-02-18 14:22:17 +0100, Geert Uytterhoeven wrote:
> > > The DU DT bindings have been updated to drop the reg-names property.
> > > Update the r8a7745 device tree accordingly.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>
> "get-lore-mbox.py" no longer seems to be pick up tags with non-ASCII
> characters:
>
> get-lore-mbox.py -a -t 20200218132217.21454-1-geert+renesas@glider.be
>
> This does work fine with an old version, before VERSION was introduced.
> Even older versions picked up "S�derlund".

                    matches = re.search(r'^([\w-]+):\s+(.*)', rline)

So this fails to pick up tags that contain plus-signs, too, e.g.
 "Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
