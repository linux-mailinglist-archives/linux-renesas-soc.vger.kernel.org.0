Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B488B9746D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 10:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbfHUIHw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 04:07:52 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:42551 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfHUIHw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 04:07:52 -0400
Received: by mail-oi1-f194.google.com with SMTP id o6so932041oic.9;
        Wed, 21 Aug 2019 01:07:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WZqnIYe/2c/ajXTD8EiT5JI5nkjLXp5DlHfyK3zU2oQ=;
        b=q0XsOwKEl0CYQQkEvIlbcDh//d6BimANpcj2HcV8y0BNeEfdsxP7tg4O8qza0yTFnk
         XFgYN++kpg6ge3YtMdSKYoSW0oT2yx8fZfFFlKwfTeZEn/ee9QBWBu6KL3VXnFeTfihx
         g9V5le8OXuPWRTlxVJYmbjcd3iNl9T92H+iW4rgKjLzMukS440jL4MnUwwLC2zb/g0B1
         Qan80dLktNrTJ+5VL2kNegZAZCVxT5xph2SEGU0gEDDhAD0LJkNzaDFx+lr4PnOOOMqt
         fFgJY0rbgq+KOlslfQIDzUpc1DTK4YAyLq29VpJGG4PzPinJ+UQ5n4vwo4vB0QLIa+sB
         z7MQ==
X-Gm-Message-State: APjAAAVtDFjIPM24hmBClcQ8FMqPUqwMFGS3Yu+q91ZVbbiCjKMe1Leh
        /dVOxIcKK62aywL98B1UDG1zoStg24IvEaX6AIs/8zWs
X-Google-Smtp-Source: APXvYqxoI+hgDjdL/E+gan4wKwGP+MyOGksyEFPPGSSyP0ik9Mdkw6U/pqcEJ7/OLT7g1yMHeM7p2M/XYHD95ucb0ac=
X-Received: by 2002:a54:478d:: with SMTP id o13mr2914919oic.54.1566374871627;
 Wed, 21 Aug 2019 01:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <1543972625-11267-1-git-send-email-uli+renesas@fpond.eu>
 <1543972625-11267-3-git-send-email-uli+renesas@fpond.eu> <20190316222637.GC1111@kunai>
In-Reply-To: <20190316222637.GC1111@kunai>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 10:07:40 +0200
Message-ID: <CAMuHMdX6hyVbT5yCUz0d9-OpL9cFJwVCnpuS+HAoneEAHO57gA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] dt-bindings: can: rcar_canfd: add r8a77995 (R-Car
 D3) compatibility strings
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Marc Kleine-Budde <mkl@pengutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-can@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Mar 16, 2019 at 11:26 PM Wolfram Sang <wsa@the-dreams.de> wrote:
> On Wed, Dec 05, 2018 at 09:17:05AM +0800, Ulrich Hecht wrote:
> > From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> >
> > Adds compatible strings for the R-Car CAN FD controller in the D3 SoC.
> >
> > Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Adding Marc to CC.

Thanks, queuing in renesas-devel for v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
