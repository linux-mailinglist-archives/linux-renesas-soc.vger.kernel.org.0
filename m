Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C529228F372
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Oct 2020 15:39:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729735AbgJONjs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Oct 2020 09:39:48 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35606 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbgJONjs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Oct 2020 09:39:48 -0400
Received: by mail-ot1-f65.google.com with SMTP id s66so2938753otb.2;
        Thu, 15 Oct 2020 06:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E/M/Pc0HbldfufL0yjiT7Vgey1LfUPuA+fwHq/WSxEE=;
        b=McOV9PBcf+ZQ0voFBbGUEQkXm3NVEzRIu82xBk6XzAR8h6i12yJ4dpiUQvqPWitieJ
         5NuQlrIfKGUNwobWZq2BzaFffrQyySP85mGtIKg+9RMpf5pzXixXCy6TMRtxZLNUNpNk
         hFLLibS6CrsIV3ePqeEXdhYEnYAwBh05wdDAHDXuok9TZibYMqQ6su8eppgNNEmoGya/
         bbH4p9PGyy/FvoBTE79hGYrACckhP6FRQAYzLF/KWzS8I01SfadT/b2xel2vYMok7Lf/
         J8ruMToZJTjoFU/Pk2R2ZALKN9W+PgRcJ5P5sHkQP9PLJelMT+x2/RSIbncmIdEFJRaW
         5G/A==
X-Gm-Message-State: AOAM532Ou9AkuMdelCngUhaHLmmnP3I5xJ4QtdOxLRQm7+hQypM+Cs2J
        Km1bLPIk87Uuy1WpQV012ue/Y1lDmh3eteSifPfPSYewFQg=
X-Google-Smtp-Source: ABdhPJzzvw47VJtPKUJ8vBhxk5hsE2yuYwJ3HOHcFuuYpB4kVX8SXSTUpWPiUez9CtY0q72vviwost5V3tbMt13QbIw=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr2520241oti.107.1602769187312;
 Thu, 15 Oct 2020 06:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201015132350.8360-1-biju.das.jz@bp.renesas.com> <20201015132350.8360-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20201015132350.8360-2-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 15 Oct 2020 15:39:36 +0200
Message-ID: <CAMuHMdXu3AKFAY3b6SfWgpQL9VBJBC9HL4ZK5EFu=7FZ2zJoXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: cat875: Remove rxc-skew-ps from
 ethernet-phy node
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Oct 15, 2020 at 3:24 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The CAT875 sub board from Silicon Linux uses Realtek phy and the driver
> does not support rxc-skew-ps property.
>
> Fixes: 6b170cd3ed02949f ("arm64: dts: renesas: cat875: Add ethernet support")
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/cat875.dtsi
> +++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
> @@ -21,7 +21,6 @@
>         status = "okay";
>
>         phy0: ethernet-phy@0 {
> -               rxc-skew-ps = <1500>;
>                 reg = <0>;
>                 interrupt-parent = <&gpio2>;
>                 interrupts = <21 IRQ_TYPE_LEVEL_LOW>;

Should "rx-internal-delay-ps = <1800>" be added to the avb node instead
(after [1] has entered v5.10-rc1, and the DTS part of [2] has been
 applied to renesas-devel)?

[1] [PATCH net-next v4 resend 5/5] ravb: Add support for explicit
internal clock delay configuration
    https://lore.kernel.org/linux-renesas-soc/20201001101008.14365-6-geert+renesas@glider.be/
[2] [PATCH v3 0/7] net/ravb: Add support for explicit internal clock
delay configuration
    https://lore.kernel.org/linux-renesas-soc/20200819134344.27813-1-geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
