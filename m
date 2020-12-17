Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 620572DD039
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Dec 2020 12:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgLQLU7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Dec 2020 06:20:59 -0500
Received: from mail-ot1-f53.google.com ([209.85.210.53]:34163 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgLQLU6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Dec 2020 06:20:58 -0500
Received: by mail-ot1-f53.google.com with SMTP id a109so26866728otc.1;
        Thu, 17 Dec 2020 03:20:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3aG+zZacCyTHkuCFY85iJfsHw0IvphhRw57kiuJQp3A=;
        b=OcmORqe6iGrW5275NDDaLHn8Vy52dN/AyN+IG2HSkUYF65OFFrx/gxA+rNYcvrb4ke
         BcgdjtL2hg/ygEZ8aWb/rLvdVs3itlFStaQCC1XsXn7DlzywjYDtFr/dUOYZrWcux1yT
         1whpUeMaABAr31EIPl8ENUD7A77BPwB3KMgseH60MxN+nDvI4k6twpoYvNn1xGYJlJCm
         eE1E9hbkFGaghQd/+4MBb2hKVGBWrGPYU19JNxWvHf6Y7v0DMFfedAaoDbDFTydvMe6K
         TU502lMzQuVW54PNTTdf6FUoFEl/hpKqMiE/99KOcSAM/HzFMRnzLhnHZmrWdjNpiZOa
         Wknw==
X-Gm-Message-State: AOAM5303dOFWP+fhe9/wh2/LFOBGBmlMma4B5JamQ5bSbZKGjauuIKxM
        LYL6/oujwzeahmU6tUWhaZiSdrQiFjRlYaNS+uXmQFl1jv0=
X-Google-Smtp-Source: ABdhPJzddLh+CDz2C1zxSNJsuDnuFwf9AAblNKeFPiJmD+qBoXhDMTc6Wx7avxWQAfmLwX78QVQskUms6enUlc6wPJU=
X-Received: by 2002:a9d:2203:: with SMTP id o3mr28997908ota.107.1608204016933;
 Thu, 17 Dec 2020 03:20:16 -0800 (PST)
MIME-Version: 1.0
References: <20201213183759.223246-1-aford173@gmail.com> <20201213183759.223246-9-aford173@gmail.com>
In-Reply-To: <20201213183759.223246-9-aford173@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Dec 2020 12:20:05 +0100
Message-ID: <CAMuHMdX+9AGxa8i_tUcZ+81YhrWJc=R9b7wAmt54Q-eEF6qPHQ@mail.gmail.com>
Subject: Re: [PATCH 08/18] arm64: dts: renesas: beacon: Enable SCIF4
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
> The baseboard supports SCIF4, enable the pins and the node for it.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
> @@ -578,6 +578,11 @@ pwm2_pins: pwm2 {
>                 function = "pwm2";
>         };
>
> +       scif4_pins: scif4 {
> +               groups = "scif4_data_c";
> +               function = "scif4";
> +       };
> +
>         sdhi0_pins: sd0 {
>                 groups = "sdhi0_data4", "sdhi0_ctrl";
>                 function = "sdhi0";
> @@ -706,6 +711,12 @@ &scif0 {
>         status = "okay";
>  };
>
> +&scif4 {
> +       pinctrl-0 = <&scif4_pins>;
> +       pinctrl-names = "default";
> +       status = "okay";
> +};
> +
>  &scif5 {
>         pinctrl-0 = <&scif5_pins>;
>         pinctrl-names = "default";

As mixing SCIF ports with and without aliases may lead to failures,
depending on probe order, you want to add an aliases for scif4 to
arch/arm64/boot/dts/renesas/r8a774a1-beacon-rzg2m-kit.dts.
I see you did that for the rzg2h and rzg2n kits, but rzh2m lacks it.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
