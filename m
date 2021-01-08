Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39AD02EF3BF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 15:11:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbhAHOLb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 09:11:31 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:44643 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbhAHOLa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 09:11:30 -0500
Received: by mail-ot1-f49.google.com with SMTP id r9so9686475otk.11;
        Fri, 08 Jan 2021 06:11:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QeYk3Oi14lctPirOqDY+dvPIpxoFv7o5eCISNkjrmKg=;
        b=EVmRBgqVIrCZ7Y1mtQG4+eAQpyejtbZ7IxegXIphV+XT7fQNnh9571Au708Rp29CFJ
         1wHEW7J7ivb3qey5AGQySCdAzJS71v7MgYQm852jW1CLkcu1OdpUFLwARTWc7SapVhS9
         ZHJ1BBQB9m0RekXIvp+5ydsvUaFW8+zwK/qE5XSkufMZyzqd0uv5/sBJYEn4puPd1vTr
         yghHnGyrapWbiVT+w5nUfB7+YiqDpHJx9aWJ1Zt3SMilTBSfp3DM4/M9vYHjmzli1ExL
         LTzwhHK3NgRRQLZO9pqPKmnQx4ZC+0A8gQmT+vd2q7du/XAMwwItJ+PETSBwvzJy+S/W
         8uRQ==
X-Gm-Message-State: AOAM532tA7DFJnpTPz4FAjF8tuEUiiPo7Ms485dEycKnjMDgPuSTI0My
        eTA/m4mBiUFch35LWeyqunYzyk682WoFuIbWLG8=
X-Google-Smtp-Source: ABdhPJzHiZt1utq1lccdOWmQYnL5Mc5DUdRNRxrJnu6txh7Iz61gKp+GH0w1UAnnj6w0XkTZhpWlZ1+O0WK8wCXdHY8=
X-Received: by 2002:a9d:c01:: with SMTP id 1mr2664713otr.107.1610115049556;
 Fri, 08 Jan 2021 06:10:49 -0800 (PST)
MIME-Version: 1.0
References: <20201228202221.2327468-1-aford173@gmail.com> <20201228202221.2327468-2-aford173@gmail.com>
In-Reply-To: <20201228202221.2327468-2-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jan 2021 15:10:38 +0100
Message-ID: <CAMuHMdUz_Vi7AoM-3co3BvYW6ojEx5=1vg4X-=JGMpHkDFzocg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: Add usb2_clksel to RZ/G2 M/N/H
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 28, 2020 at 9:22 PM Adam Ford <aford173@gmail.com> wrote:
> Per the reference manal for the RZ/G Series, 2nd Generation,

manual

> the RZ/G2M, RZ/G2N, and RZ/G2H have a bit that can be set to
> choose between a crystal oscillator and an external oscillator.
>
> Because only boards that need this should enable it, it's marked
> as disabled by default for backwards compatibility with existing
> boards.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.12 (with the typo fixed).


Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
