Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A8D416D7D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Sep 2021 10:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244550AbhIXIQY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 Sep 2021 04:16:24 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:36481 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236281AbhIXIQX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 04:16:23 -0400
Received: by mail-vs1-f46.google.com with SMTP id h30so9199697vsq.3;
        Fri, 24 Sep 2021 01:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dzhFkAPFq5tONqXJTUAJUDBr46WJlp/FhoV7NN9qWgA=;
        b=oxDnDfuOLsmGJWbXklIqww4FSuaRuK9qfDQVadtBmuqfpFEzK6X0Wqy7gA5glARbor
         alDTb351qYuXwkFPXfaeEvjdMicvn0rh4Jd59v/rbnaKUF0znBn/1Kxx4Fy4CJ7iMHwV
         rRezQaa0SU5QNBlsvHw1seiQMTttZNnvNxtVDBbYelWckhxBA+RcxIAyPUnyGUI5D9ZH
         6qFnPCsq65RLBJoweX/j3w9ZuyOyj+HJHm+Di/P5v8ydUo+sr91s9NqbYF+i1K4unO9Z
         hbtuimwDrUHyj3zBhhxD8mC/XaHBV1GcqV57gTawy0RTH1cSxwTIveOwNCoc76NHW2M3
         xjpQ==
X-Gm-Message-State: AOAM531BskgzpKK8ObFdZ02/OFvcEJ/9NAbglxDxwVqbPnXR10AcLfSo
        MUTD69q0nAQZIDroOISEPtAZu1EVDneJHHYYlaGNxxTLMEM=
X-Google-Smtp-Source: ABdhPJxeBPNkjra80tDqWYQrEX4a5MA900DJMCa3/66wi0WJZEyIyyjppESH3NW32VM3nz5a9W8spXdqqc3uS6R1xps=
X-Received: by 2002:a67:f147:: with SMTP id t7mr8099188vsm.41.1632471290663;
 Fri, 24 Sep 2021 01:14:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210921084605.16250-1-biju.das.jz@bp.renesas.com> <20210921084605.16250-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210921084605.16250-4-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 24 Sep 2021 10:14:39 +0200
Message-ID: <CAMuHMdXnZynye6mbp6aLyjWMDX07bKFoQccZ5u1AAZ1pw2129A@mail.gmail.com>
Subject: Re: [PATCH 3/4] arm64: dts: renesas: rzg2l-smarc: Enable audio
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Sep 21, 2021 at 10:46 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable audio on RZ/G2L SMARC EVK by linking SSI0 with WM8978
> audio CODEC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> @@ -30,6 +66,14 @@
>         };
>  };
>
> +&audio_clk1{
> +       clock-frequency = <11289600>;
> +};
> +
> +&audio_clk2{
> +       clock-frequency = <12288000>;
> +};
> +

These are not fixed-factor clocks, but outputs from a programmable
VersaClock 5P35023 clock generator.  However, we can start with this
simple description, and describe the VersaClock topology later.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v5.16.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
