Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 537432FCC4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jan 2021 09:07:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730514AbhATIEb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jan 2021 03:04:31 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:37251 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730077AbhATIDv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jan 2021 03:03:51 -0500
Received: by mail-ot1-f50.google.com with SMTP id o11so22600533ote.4;
        Wed, 20 Jan 2021 00:03:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yK/ie3EIPWE7RkFQwOhdBJJ8g6b1r6m+2mIGzWMnhyU=;
        b=bhgmKOrt03g/TpPBL29W6SMX+a9cPtiwRc7yDjEYjSTrmaLmoHtv7rDI5WzXwYVe30
         XO/2qfl/IKsL2HHuO73nemaBoW2WC+5m7eOpBMHvcXxcjTnkmTKOS6Edgla4lU/nCwkq
         w/M8AHXS0abf4BwSpYI/KQxB8Q+N/kELQrxHSbbGciR0qqYVUiL6/eTbogC8s2HvS6mN
         iu2xS9CsfucLjhlks/Y8G/RI7PQDJQ17+8Dn6uitzDaDesascCTnXbGhYNBj6nJ7EJgy
         kM7CQOZGRM8qh7sQUpAsr5gzwCUpBEtWX9YqYZ6XieBuL+ItRLnxSBVKCg1oaJKUdkLO
         kYFA==
X-Gm-Message-State: AOAM530Mtel//K8jNTT0il/+wmjju3M+hJjVmbMAToe1CwydybBaAXHX
        bjiDDi/ACTGJ5Lkd9l3VwgSEm2l3zoMTzqEcWN/XPhDpk+4=
X-Google-Smtp-Source: ABdhPJzevJPBcvky5yCg7XX71DeoBect44zX/F7XQhp9USLrJHRkB9vJdBGn+ivHRuBVbyh0mvtqYYe2kmG87Qos4qU=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr6240929otc.145.1611129789904;
 Wed, 20 Jan 2021 00:03:09 -0800 (PST)
MIME-Version: 1.0
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
 <20201228112715.14947-4-wsa+renesas@sang-engineering.com> <20210119221624.GA3651@kunai>
 <YAfjJwije0H56wp7@kroah.com>
In-Reply-To: <YAfjJwije0H56wp7@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 20 Jan 2021 09:02:58 +0100
Message-ID: <CAMuHMdVYmW3kkYv2xTCS2X4pFpChknX7yy7N06EOegGTzK=DmQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] dt-bindings: serial: renesas,hscif: Add r8a779a0 support
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Greg,

On Wed, Jan 20, 2021 at 9:00 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Tue, Jan 19, 2021 at 11:16:24PM +0100, Wolfram Sang wrote:
> > On Mon, Dec 28, 2020 at 12:27:10PM +0100, Wolfram Sang wrote:
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> >
> > Can we apply this via the serial tree? Or shall we take it via
> > renesas-soc? Thanks!
>
> I can take it, but normally I try to wait for a DT maintainer ack.
>
> If you want to take it, feel free to as well.

Acked on Jan 8:
https://lore.kernel.org/linux-devicetree/20210108034114.GA1845830@robh.at.kernel.org/

Thanks for applying!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
