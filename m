Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EC172DD0D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:52:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726488AbgLQLwF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:52:05 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:46236 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgLQLwF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:52:05 -0500
Received: by mail-ot1-f42.google.com with SMTP id w3so26934749otp.13;
        Thu, 17 Dec 2020 03:51:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yj/LQelOJyBm3DRjSVIfTTWg+6A+VQE8SYMbQQgGTts=;
        b=kCOxcF+f1sCm3XDrt922re90dP9B+CbCX/e0xEE3xuWWy1uIxvb8HPGn2IETNGAdU9
         qfUqMcC0C9I7xPpX/X3i9xCOax246jyTPzf8pKZ1K48HZ3SspxmY2GKWX7w9V98vo0Ix
         CrcEGcmTb8YxUKM+eDmQrdgvZ8Pq/DnI5U7JkrCL9PhTsnCBEJXvtsK544fluuNPbG3P
         gGBLlGJCbYImUDRA5YuKtrogF44FnmtXl0mumcsQJJaP7AKDHreozxMizCEQIGF48s1U
         aXuBppcrHYwEqm9i94yA4W461IrjXN7CWQg3hnJJ8wob5YqV4/LEO+23vT8kZXzBwVa1
         D30A==
X-Gm-Message-State: AOAM532QM1OOEUEIbGTc9wC1KOfB4sN1rR02QF4JTZ0rwpq56Abjf1lu
        3PX2UIF2gPpmSMRyYMZ1pzf6v0HYRS985P1yi6I=
X-Google-Smtp-Source: ABdhPJy6yq4H3SCtzLXtk84+ROMAd7AMb5y1nIMdGSy00Sd/hHUqUyxQ62op5v8q3nDn3FZ7ych7rqfyqgLBMwrmYew=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr29070816ota.107.1608205884334;
 Thu, 17 Dec 2020 03:51:24 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-19-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-19-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 12:51:13 +0100
Message-ID: <CAMuHMdXpFo-QZuiWiDNN-dYpT+D8HKcvHw-kVwEEsiw_5HN_FA@mail.gmail.com>
Subject: Re: [PATCH 18/18] arm64: dts: renesas: Introduce r8a774e1-beacon-rzg2h-kit
To:     Adam Ford <aford173@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Adam,

On Sun, Dec 13, 2020 at 7:38 PM Adam Ford <aford173@gmail.com> wrote:
> Beacon EmebeddedWorks is introducing a new kit based on the

Embedded Works (suggested by Google ;-)

> RZ/G2H SoC from Renesas.
>
> The SOM supports eMMC, WiFi and Bluetooth, along with a Cat-M1
> cellular radio.
>
> The Baseboard has Ethernet, USB, HDMI, stereo audio in and out,
> along with a variety of push buttons and LED's, and support for
> a parallel RGB and an LVDS display.  It uses the same baseboard
> and SOM files as the RZ/G2M and RZ/G2N kits.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1-beacon-rzg2h-kit.dts
> @@ -0,0 +1,48 @@

> +&du {
> +       status = "okay";

Missing pinctrl properties?

> +
> +       clocks = <&cpg CPG_MOD 724>,
> +               <&cpg CPG_MOD 723>,
> +               <&cpg CPG_MOD 721>,
> +               <&versaclock5 1>,
> +               <&x302_clk>,
> +               <&versaclock5 2>;
> +       clock-names = "du.0", "du.1", "du.3",
> +               "dclkin.0", "dclkin.1", "dclkin.3";
> +};

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
