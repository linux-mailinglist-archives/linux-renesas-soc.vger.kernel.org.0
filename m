Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA4092642D2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Sep 2020 11:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730223AbgIJJup (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Sep 2020 05:50:45 -0400
Received: from mail-oo1-f68.google.com ([209.85.161.68]:40955 "EHLO
        mail-oo1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729781AbgIJJum (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Sep 2020 05:50:42 -0400
Received: by mail-oo1-f68.google.com with SMTP id r4so1292736ooq.7;
        Thu, 10 Sep 2020 02:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Uc+Xr2qe6UKlIcR63NA2C0Yz5MS8E3knGkDIrPYmc20=;
        b=p4vSOblWcamurle18o4KETqyDK7SDjxzyB9+4/raTmJcpIqziCotSI1ktKsxNm0Ytt
         H1sJ1ThEtcDRoJOVu+VpwFrZBkyOfGNurHiV/d96t5ozy9wEUTaU1nOn8Q6GZXcrJgs6
         j4M/ONjmSBWzryQ+26ctscct8gJfkD/1KSzVtXuKK6q3wR3vhaqvfxbTDq3qfoatGB9l
         vSzPEPm1lUpzhy6+en9W8YRiF0rlP0CUvbdDFxxZUBNN2wlyUFIW0X44pE0DrQ2pEw0B
         Ddqe5ytBboOYPGObfqeXFLF5UbTfFsfHTF0vjn8+zVOlxrFNzpHo9DIw5zEQsLkV1ft4
         CV7A==
X-Gm-Message-State: AOAM532Bf6dWAskYZdl1lV8x4nrQA27CmbT8TYz5PQ4tiTTlpYBuTEZl
        b6qMrHNEYxIo1XzUxrNtbwyWX8Hl5xkPak1qCq+Y4Fr5
X-Google-Smtp-Source: ABdhPJxaQStxO5cKKQfQBE/p7ZmWrN6b1+2E8A3IeQaauYLymMsfJHdQAz9a20ZC/kOLfe0B7ViQ/Qd1cpOyMO1M3MU=
X-Received: by 2002:a4a:5403:: with SMTP id t3mr3892746ooa.11.1599731441118;
 Thu, 10 Sep 2020 02:50:41 -0700 (PDT)
MIME-Version: 1.0
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com> <87eendrtv1.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87eendrtv1.wl-kuninori.morimoto.gx@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 10 Sep 2020 11:50:30 +0200
Message-ID: <CAMuHMdUmfavKH03LRj4WNoOEbu+oY64_Mic74zCfFbK4rO9KSw@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] arm64: dts: renesas: r8a77961: Add DU device nodes
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Laurent <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

On Tue, Sep 8, 2020 at 2:35 AM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
>
> This patch adds DU device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index 423808b6cd58..c7fabd9e875b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2165,8 +2165,19 @@ port@2 {
>                 };
>
>                 du: display@feb00000 {
> +                       compatible = "renesas,du-r8a77961";
>                         reg = <0 0xfeb00000 0 0x70000>;
> -                       /* placeholder */
> +                       interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
> +                                <&cpg CPG_MOD 722>;
> +                       clock-names = "du.0", "du.1", "du.2";
> +                       resets = <&cpg 724>, <&cpg 722>;
> +                       reset-names = "du.0", "du.2";
> +
> +                       renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
> +                       status = "disabled";

Do you want support for CMMs?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
