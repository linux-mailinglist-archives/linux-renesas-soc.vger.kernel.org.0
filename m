Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E0F92F2E4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Jan 2021 12:47:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730579AbhALLqB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 12 Jan 2021 06:46:01 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:45505 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729061AbhALLqB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Jan 2021 06:46:01 -0500
Received: by mail-ot1-f50.google.com with SMTP id n42so1923876ota.12;
        Tue, 12 Jan 2021 03:45:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fq4R6bd33PXp66dekJrNw/2phyTRAf2Oc0Kd0j3A8Lk=;
        b=s9IBDtv5487trt5xFZ/9R3dYV9EWoCFpRkJsNBETEbONN6rpmy3M9DL0lOTY+fkGAq
         OU7dAQUdPpSsaD9tQ+E17T0C41RvHqccLBg64iYtqgCFcZP4ORMdJk8/2ld6vUpbkVpO
         m13OQnkJlsrqhsSXKBzAJq+yf/hBjdoUNr8Y9PWxR46Pv4E6fZlxGHxkMcHtESANP3ZM
         U/22cSwMe/LJAWdSH+ESTS7Tk9gmDzD0BTqMrEwhmPSmHjIOKTJeGepGKG52rcMAlr3Q
         Eyjot0noFR9odKuJfuEEht2XE5q3S0SUunRKawiWbUFu09rVVjcOBNe0lUhSMtQpQ04E
         XXZA==
X-Gm-Message-State: AOAM531RnFUB+WA7OpXQf+nk0RFgKUKvJJHprEQuX+IyjX5A2FdyJYC/
        PABI7BaFqqKVswyPeZtp++VNmde+p5h3TTNL/5g=
X-Google-Smtp-Source: ABdhPJy2GClX9NUZWocw2/xReQPMp5Ca0i1MvdZmsjRDtDry2yeLda3Z8dBjZTbZZi/QeBLxmrYs0dvjZ9+tVK30e1Q=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr2526664oth.250.1610451920443;
 Tue, 12 Jan 2021 03:45:20 -0800 (PST)
MIME-Version: 1.0
References: <20201227130407.10991-1-wsa+renesas@sang-engineering.com>
 <20201227130407.10991-5-wsa+renesas@sang-engineering.com> <CAMuHMdWSZ7Fw2fX6aYhqavDDV01qkYJmXrAUWv8Rud9hKVEBZQ@mail.gmail.com>
 <20210105162713.GH1842@ninjato>
In-Reply-To: <20210105162713.GH1842@ninjato>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 12 Jan 2021 12:45:09 +0100
Message-ID: <CAMuHMdVJKt=qbPpkeiza00HG_QtnqEJhUx=TC-FP+GuPreFRRQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: falcon: Add Ethernet-AVB support
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Tho Vu <tho.vu.wh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

On Tue, Jan 5, 2021 at 5:27 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > breakout-board, while AVB1-5 are wired to 88Q2110 PHYs connected to a
> > 5port MATEnet connector on the Ethernet sub board.  So all PHYs are
> > present?
>
> I was under the assumption that we don't have the ethernet sub board in
> the lab. Sorry if I was wrong. Then I was probably just missing the
> correct Marvell driver for the phys when I tried to fire the interface
> up. I will retry (with your other suggestions, too).

Actually I don't know if the Ethernet sub board is present or not :-)

Which reminds me that the avb0 extensions should be added to
r8a779a0-falcon-cpu.dtsi instead of r8a779a0-falcon.dts

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
