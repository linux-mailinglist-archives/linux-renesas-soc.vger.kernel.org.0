Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A322DCFD8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 11:55:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgLQKzU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 05:55:20 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:37277 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725871AbgLQKzT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 05:55:19 -0500
Received: by mail-ot1-f53.google.com with SMTP id o11so26811943ote.4;
        Thu, 17 Dec 2020 02:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NqI46iUkm3kdRiZJylFMY4ESM/tT8MWZRvq/LXdmcj8=;
        b=UDHVMsjFrmxKxeIPxRdz6tMZdhCm3OW5MlawLThIAPEcPujR79PXOdqzf3IaKLnHgs
         RL0m7RJdAVlcKrYDPLs4RUPxiXDiXa9v+CgSFAVfyRUf/C4Un6Qfq2Nf5dskiVvAJ/B2
         s3THeHGkYYQMemePttanqlBoUWyR+J8/suFIc2JIEVKYj/yExbD7okP0jVvXVf2vIX5b
         +zuFBem8L0AXgc1MicYCmp4PmME0G4yHoEc4KLRjVHBhYbj6vIFNnuc+2KW5df5RFqab
         azP5eBfKuamOdIIYf7i7BfZCuZd6AdeaNMgnyBIO9B0Uesy3LTCuzoccv5g+7xnunh4H
         W88g==
X-Gm-Message-State: AOAM531H3rVvKR2ACzJBRFdNHbsvTR6rUXqCHpCRWsVpzEJaHEpnsUvY
        pevbdyZQX6L36/66wkqIroY2gb7vYMtIF4OeY2M=
X-Google-Smtp-Source: ABdhPJxa8h30ez71n05knntqGE9YvDSdn/c2GQBkf7p9Folc+Th5qeNdgj3pT70UVBs1WaQhLEXip9F23z7VsGSry0E=
X-Received: by 2002:a05:6830:210a:: with SMTP id i10mr28946942otc.145.1608202478826;
 Thu, 17 Dec 2020 02:54:38 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-5-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-5-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 11:54:27 +0100
Message-ID: <CAMuHMdWAQ9j1b=b7CFcjg97N7YW+7Dj14TB-MGogJGK7kFkdhg@mail.gmail.com>
Subject: Re: [PATCH 04/18] arm64: dts: renesas: beacon kit: Fix Audio Clock sources
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
> The SoC was expecting two clock sources with different frequencies.
> One to support 44.1KHz and one to support 48KHz.  With the newly added
> ability to configure the programmably clock, configure both clocks.
>
> Beacause the SoC is expecting a fixed clock/oscillator, it doesn't
> attempt to get and enable the clock for audio_clk_a. The choice to
> use a fixed-factor-clock was due to the fact that it will automatically
> enable the programmable clock frequency without change any code.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -250,9 +250,12 @@ ss_ep: endpoint {
>  };
>
>  &audio_clk_a {
> -       clock-frequency = <24576000>;
> -       assigned-clocks = <&versaclock6_bb 4>;
> -       assigned-clock-rates = <24576000>;
> +       /delete-property/ clock-frequency;
> +       #clock-cells = <0>;
> +       compatible = "fixed-factor-clock";
> +       clock-mult = <1>;
> +       clock-div = <1>;
> +       clocks = <&versaclock6_bb 4>;
>  };

Shouldn't you override the clocks property in the rcar_sound node
instead, like is done in several other board DTS files (with cs2000)?

>
>  &audio_clk_b {
> @@ -591,7 +594,7 @@ sound_pins: sound {
>         };
>
>         sound_clk_pins: sound_clk {
> -               groups = "audio_clk_a_a";
> +               groups = "audio_clk_a_a", "audio_clk_b_a";
>                 function = "audio_clk";
>         };

Yes, this part was definitely missing.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
