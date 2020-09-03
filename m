Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89DDA25C200
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Sep 2020 15:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728875AbgICNwq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Sep 2020 09:52:46 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41182 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728788AbgICMjl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 08:39:41 -0400
Received: by mail-oi1-f196.google.com with SMTP id 2so2945706ois.8;
        Thu, 03 Sep 2020 05:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5bmZl5dewM0LfN2Vd/uTPl9Sbm07TZQjqrLN7VKwBa0=;
        b=dWi4D+dSE4sr0NjIrS47/WYD6RcbnT69FWqkeQsCZYHoS1/DVXl8bw5Xy5NxFGbu72
         5msLTgmghf1qmnWqWQaqbA+ApGl6f3zgrBu7YxTlB//91muAtZU4tQCGKV/cJD1Nb5B3
         nIPr2fJQVoFHMFxvykS/4aSAXGJPDRsTQvmbWNetQzqiHyNxv7idaTrdsaBK5inAL3gi
         FPo8lY88GoGa9GZXCGbtoI8ewY0BQHTPcDgSK3l8TnrjibFM3ApPloTPBUlAVwbvOjIx
         QoLWAHSzsSAgq/8XUUtVbCplQE83pOxYWJ8foPi1BxoHZ/57ltQji1RA8MJWe78iXWCy
         uFIg==
X-Gm-Message-State: AOAM532CKES2Ml4YLjJMnUTha3DMNourb7gOPK1SNl2M9dLYVKvqiLzz
        /zEB8gopVgAsFtoKoTraKJ6q/RzZpGQgHMADdiA=
X-Google-Smtp-Source: ABdhPJy1/sdSoJipDH2zAn63gAkE5ka8nPP+P8VYe40HBdY0l6jOfQEjhBLbTclJeIqB4Fw49mMpUX4/d8R3pxkt4ds=
X-Received: by 2002:aca:b742:: with SMTP id h63mr1799607oif.148.1599136780383;
 Thu, 03 Sep 2020 05:39:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200827145315.26261-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200827145315.26261-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200827145315.26261-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 3 Sep 2020 14:39:29 +0200
Message-ID: <CAMuHMdUKMr+uaXYXyRrJS+HZT93H5LiPoPRcmjNj9Pph7RVnPQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a774e1: Add cpuidle support
 for CA5x cores
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Thu, Aug 27, 2020 at 4:53 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> Enable cpuidle (core shutdown) support for RZ/G2H CA5x cores.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> @@ -127,6 +127,7 @@
>                         power-domains = <&sysc R8A774E1_PD_CA57_CPU0>;
>                         next-level-cache = <&L2_CA57>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&CPU_SLEEP_0>;
>                         dynamic-power-coefficient = <854>;
>                         clocks = <&cpg CPG_CORE R8A774E1_CLK_Z>;
>                         operating-points-v2 = <&cluster0_opp>;
> @@ -141,6 +142,7 @@
>                         power-domains = <&sysc R8A774E1_PD_CA57_CPU1>;
>                         next-level-cache = <&L2_CA57>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&CPU_SLEEP_0>;
>                         clocks = <&cpg CPG_CORE R8A774E1_CLK_Z>;
>                         operating-points-v2 = <&cluster0_opp>;
>                         capacity-dmips-mhz = <1024>;
> @@ -154,6 +156,7 @@
>                         power-domains = <&sysc R8A774E1_PD_CA57_CPU2>;
>                         next-level-cache = <&L2_CA57>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&CPU_SLEEP_0>;
>                         clocks = <&cpg CPG_CORE R8A774E1_CLK_Z>;
>                         operating-points-v2 = <&cluster0_opp>;
>                         capacity-dmips-mhz = <1024>;
> @@ -167,6 +170,7 @@
>                         power-domains = <&sysc R8A774E1_PD_CA57_CPU3>;
>                         next-level-cache = <&L2_CA57>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&CPU_SLEEP_1>;

CPU_SLEEP_0

>                         clocks = <&cpg CPG_CORE R8A774E1_CLK_Z>;
>                         operating-points-v2 = <&cluster0_opp>;
>                         capacity-dmips-mhz = <1024>;
> @@ -180,6 +184,7 @@
>                         power-domains = <&sysc R8A774E1_PD_CA53_CPU0>;
>                         next-level-cache = <&L2_CA53>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&CPU_SLEEP_1>;
>                         #cooling-cells = <2>;
>                         dynamic-power-coefficient = <277>;
>                         clocks = <&cpg CPG_CORE R8A774E1_CLK_Z2>;
> @@ -194,6 +199,7 @@
>                         power-domains = <&sysc R8A774E1_PD_CA53_CPU1>;
>                         next-level-cache = <&L2_CA53>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&CPU_SLEEP_1>;
>                         clocks = <&cpg CPG_CORE R8A774E1_CLK_Z2>;
>                         operating-points-v2 = <&cluster1_opp>;
>                         capacity-dmips-mhz = <535>;
> @@ -206,6 +212,7 @@
>                         power-domains = <&sysc R8A774E1_PD_CA53_CPU2>;
>                         next-level-cache = <&L2_CA53>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&CPU_SLEEP_1>;
>                         clocks = <&cpg CPG_CORE R8A774E1_CLK_Z2>;
>                         operating-points-v2 = <&cluster1_opp>;
>                         capacity-dmips-mhz = <535>;
> @@ -218,6 +225,7 @@
>                         power-domains = <&sysc R8A774E1_PD_CA53_CPU3>;
>                         next-level-cache = <&L2_CA53>;
>                         enable-method = "psci";
> +                       cpu-idle-states = <&CPU_SLEEP_1>;
>                         clocks = <&cpg CPG_CORE R8A774E1_CLK_Z2>;
>                         operating-points-v2 = <&cluster1_opp>;
>                         capacity-dmips-mhz = <535>;

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

No need to resend, will fix while queueing in renesas-devel for v5.10.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
