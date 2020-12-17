Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D95A2DD038
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:17:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbgLQLP0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:15:26 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:46047 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727495AbgLQLPZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:15:25 -0500
Received: by mail-ot1-f50.google.com with SMTP id h18so26878672otq.12;
        Thu, 17 Dec 2020 03:15:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xx+auVM6B7V+kGzHPkX2t0XMGkTBqcyzunQHJA2F1+A=;
        b=ThNdvMRsCdyXmfXa2uuN/U6ILIw+oA4bA/GGMHe9X0Yft/txfWlxsXBSZipbKhR4v3
         XSsQ3Hm90JNRpa+pUX+T3s09m/jr49K63p1QGcxRDfSNHqW1X/hbbBI1aSLvAFpkrNRN
         vAIy5a95ybpTZ8B/QevSQuIo5OdA9heQKOVpAuGbVy/ryu/W2QILn6leTkGQDNnvIVVc
         XKkt7nt6mcbwLD8n1cuLR+kF/ARwUl24fsBguJRZyS03lO/wbmoKhrJgtt8WN5p3szOW
         OsqxkRQopyAavtQTuQ2PfulqxNP9KfcxFzaZYbgoglMBiyuUEgG0L5tb4g8dHKsEC343
         2yvQ==
X-Gm-Message-State: AOAM530UXcDS58FPFZ23jAVtfwoxir3L5CCkWuzfiYFc+xsg3+oePihg
        Dph3T8ouHH642c0lSBmnRBkIuxo/87+0Tnu1Vqk=
X-Google-Smtp-Source: ABdhPJxLGt/W6nkgEwjUvKWAdfGB1PYqCXjEIIa0+xcj//Lwr1HXG5hCbHs+weK8iwK4fOlGpyibkSxVgSJKsAC51RQ=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr28992639otc.145.1608203684453;
 Thu, 17 Dec 2020 03:14:44 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-8-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-8-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 12:14:33 +0100
Message-ID: <CAMuHMdVHirycAXvYYZfb3TurFD5dVOJnNjR+bXKz+Yf6=C_7Sw@mail.gmail.com>
Subject: Re: [PATCH 07/18] arm64: dts: renesas: beacon: Fix LVDS PWM Backlight
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> The backlight didn't really work correctly due to some updates that were
> made in hardware.  It should be safe to apply these, because the older
> hardware was never shipped to anyone, so it shouldn't break anything.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks, I have to trust you on this one, i.e. will queue in
renesas-devel for v5.12.

> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -575,7 +575,7 @@ pwm0_pins: pwm0 {
>
>         pwm2_pins: pwm2 {
>                 groups = "pwm2_a";
> -               function = "pwm2_a";
> +               function = "pwm2";
>         };

This part is definitely correct.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
