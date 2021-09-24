Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A84E2416E80
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 11:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245119AbhIXJJa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 05:09:30 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:33297 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245120AbhIXJJa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 05:09:30 -0400
Received: by mail-ua1-f47.google.com with SMTP id r8so6180830uap.0;
        Fri, 24 Sep 2021 02:07:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/RxTD5RlZtVSoGJbWz+SIaw9jcb2Suud4BeCZGzuRE4=;
        b=cudceSTE9OlDjI+vCgg5xa4Qgf3HgvKPBWoDnWXTCRAG2WIUuN58XgjoCq9yNZ9dqi
         /De9/AVEqzY3G7VnVnKenLQGdnztSu1Jr5iYRfilbrKnjYW0AoaCy1op91JiTp+mS0DC
         iKSre1iwmIa63jKZ5jYX4K4JlWAY0TZywSs8LEn+TFinHsZtaEdmv1Zj8DLQKxc8mvTo
         /6B9UIft5wdwSTXVDxKV80D676eojwyK9DiLyejpwyHIRagyHXKYOP2MP9ScvG6ali+r
         CncyVIZux0tCRCMxNjtUvYBFB8UKOxNvA4MMEi8QI35JpqtErPX5Mfb3QIfiZ7426H7O
         faTQ==
X-Gm-Message-State: AOAM533NMW+TtGFwSvMDa9xDvbwxCuafs/MxSde6eeD/ng5jrx2XuO6a
        S6r6VctDp6I8DSirFTGtwA1Zu6N1niLvjHx0NvJILeIGXi8=
X-Google-Smtp-Source: ABdhPJziuAsLTp8tfRhrNtRU1VujxZzhatrbKehGa/TLK5r1Cgkk2UypLKRDj3s4EpQ8oW8tOSfLofqZM1T2uxulKlo=
X-Received: by 2002:ab0:311a:: with SMTP id e26mr8142812ual.122.1632474477108;
 Fri, 24 Sep 2021 02:07:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210922212049.19851-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20210922212049.19851-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20210922212049.19851-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Sep 2021 11:07:45 +0200
Message-ID: <CAMuHMdWskGB9btFdnSy10862NeMSJtqOBvMeTxV14Ddzs7JzBA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable CANFD
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Wed, Sep 22, 2021 at 11:21 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable CANFD on RZ/G2L SMARC platform.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> @@ -139,6 +153,32 @@
>         pinctrl-0 = <&sound_clk_pins>;
>         pinctrl-names = "default";
>
> +       can0_pins: can0 {
> +               pinmux = <RZG2L_PORT_PINMUX(10, 1, 2)>, /* TX */
> +                        <RZG2L_PORT_PINMUX(11, 0, 2)>; /* RX */
> +       };
> +
> +       /* SW7 should be at position 2->3 so that GPIO8_CAN0_STB line is activated */
> +       can0-stb {
> +               gpio-hog;
> +               gpios = <RZG2L_GPIO(42, 2) GPIO_ACTIVE_LOW>;
> +               output-high;

While this drives the STB signal correctly, I find it confusing.
According to the datasheet, the STB signal is active-high, so it has to
be pulled low to disable standby.
So to reflect the meaning of the STB line, I would write:

        gpios = <RZG2L_GPIO(42, 2) GPIO_ACTIVE_HIGH>;
        output-low;

> +               line-name = "can0_stb";
> +       };
> +
> +       can1_pins: can1 {
> +               pinmux = <RZG2L_PORT_PINMUX(12, 1, 2)>, /* TX */
> +                        <RZG2L_PORT_PINMUX(13, 0, 2)>; /* RX */
> +       };
> +
> +       /* SW8 should be at position 2->3 so that GPIO9_CAN1_STB line is activated */
> +       can1-stb {
> +               gpio-hog;
> +               gpios = <RZG2L_GPIO(42, 3) GPIO_ACTIVE_LOW>;
> +               output-high;

Likewise.

> +               line-name = "can1_stb";
> +       };
> +

The rest looks good to me, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
