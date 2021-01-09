Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 652112EFEC5
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Jan 2021 10:30:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726661AbhAIJah (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 9 Jan 2021 04:30:37 -0500
Received: from mail-oo1-f49.google.com ([209.85.161.49]:45238 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbhAIJag (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 9 Jan 2021 04:30:36 -0500
Received: by mail-oo1-f49.google.com with SMTP id o5so2989605oop.12;
        Sat, 09 Jan 2021 01:30:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7RlGpspGXU1nurrIhvy2NWlaxOQoMYNbwiVi0vqSE3U=;
        b=LZr64l8GBEoicZIoZ2QaEDQWT/43l+KZHwpOBx2oIINjKHK5FbCU6G3r3/K/rXjxky
         DlhXFGyzWHazn/xmzR7CAgWOu2Y3t9kId3WNmMFSgPWnZ92KEgFCvMCt3ODiO60UFB3O
         BqnptNVuhIKQRYJEyoseHjFX6aEECFyPN60QL6mIfSCWtjsADUwTJuE+RAotuHSstOWy
         RhMUeCOPOxp73F8lbL/+JUtDvbAir+dCnLat2ZQj+AfcaAxAEltT/lPl95raQWD8zW2b
         Bxi6abjCjFnt5rjyJb6oKQTgnHUsUZ1f7QIT3DxJrTYzxATlUDjDngkr9hM44hB0PeRY
         JU/Q==
X-Gm-Message-State: AOAM533AUJNUyOAYq80rzTGhEfYsRskZ30XfACAGQTSeflHAE+4U+hpE
        3qNMZdAwdlAQlQn/uwic5leaQQ9/Z03Qac1AS1Q=
X-Google-Smtp-Source: ABdhPJyF5xKNlRAl0s/TuB3DFxfGDGAquIdHRwVhrjGlRMrOwB5VXY7iLsu2/loz17hh/0523GTComSNfY80iXGcvV0=
X-Received: by 2002:a4a:ca14:: with SMTP id w20mr6890662ooq.11.1610184595555;
 Sat, 09 Jan 2021 01:29:55 -0800 (PST)
MIME-Version: 1.0
References: <20201228202221.2327468-1-aford173@gmail.com> <20201228202221.2327468-2-aford173@gmail.com>
 <CAMuHMdUz_Vi7AoM-3co3BvYW6ojEx5=1vg4X-=JGMpHkDFzocg@mail.gmail.com>
In-Reply-To: <CAMuHMdUz_Vi7AoM-3co3BvYW6ojEx5=1vg4X-=JGMpHkDFzocg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sat, 9 Jan 2021 10:29:44 +0100
Message-ID: <CAMuHMdWYcSBDTvW-Pm=0V9Q9JsbPLOXtbYKL-whaAHKwUPuT3A@mail.gmail.com>
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

On Fri, Jan 8, 2021 at 3:10 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Mon, Dec 28, 2020 at 9:22 PM Adam Ford <aford173@gmail.com> wrote:
> > Per the reference manal for the RZ/G Series, 2nd Generation,
>
> manual
>
> > the RZ/G2M, RZ/G2N, and RZ/G2H have a bit that can be set to
> > choose between a crystal oscillator and an external oscillator.
> >
> > Because only boards that need this should enable it, it's marked
> > as disabled by default for backwards compatibility with existing
> > boards.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v5.12 (with the typo fixed).

(and the unneeded 'status = "disabled"' dropped).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
