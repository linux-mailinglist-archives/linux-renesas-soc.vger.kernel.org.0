Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7543641F0A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 10:28:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408631AbfFLI2O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 04:28:14 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:45443 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406941AbfFLI2K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 04:28:10 -0400
Received: by mail-lf1-f65.google.com with SMTP id u10so11364658lfm.12;
        Wed, 12 Jun 2019 01:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IvEvKOGpjQ6W7eOyaSJKs0PMC1VigjvzNX7sGSsbvC8=;
        b=AIn7mtHpkSJOXUp6F62Xc8yzFXTLQR5sI8g2ZRWnPtKB72qxtV8axGUCiMAQ/xn8p0
         VpsuQ7Lj4Vf5QnT5pApymLCu9ctXiM9oxVveqCHQ5xIX5WwXLFXvzbYipYF0cUyLYjW9
         opbF6xY83DGpxdPfUpCE79b8wHbIdd1L2NkVxuYXwOX0TBVi605X38Tlja0gpqr8Aya8
         TT2GgS8OK+Q0kcL5tBizV9faWE+7XftfSNH35QVI+IEsfkqZy/Ch64koeOvy2AWKdqFK
         +uEl9FBpTgPqbFm7KCDUT+v2p5RfHwZnKr1cQ5cNzIclpILUesOW1LoaBQv93cpe3u2A
         2OPg==
X-Gm-Message-State: APjAAAXEIKEI/s2bL1qmiixbI8jsUS1mRfAd9nRLlE3/4EL+/KFsTWhn
        cU2rXitFzF5XSdfcRHvfb2o6haDkkyOuZ5t8HqU=
X-Google-Smtp-Source: APXvYqyVFUJ0I1/uoOBVVsFgAyTr3HP7Tl6c4VG1jMehe1meHU+T8bjoCmLxiN9i4in5f6cgRMhLgw8mN5NJoPYV3Vk=
X-Received: by 2002:a19:4a49:: with SMTP id x70mr2923747lfa.151.1560328088644;
 Wed, 12 Jun 2019 01:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 12 Jun 2019 10:27:56 +0200
Message-ID: <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

On Fri, Jun 7, 2019 at 10:14 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> This patch adds uSD and eMMC support to the HiHope RZ/G2M
> board.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi

> +&sdhi3 {
> +       pinctrl-0 = <&sdhi3_pins>;
> +       pinctrl-1 = <&sdhi3_pins>;
> +       pinctrl-names = "default", "state_uhs";
> +
> +       vmmc-supply = <&reg_3p3v>;
> +       vqmmc-supply = <&reg_1p8v>;
> +       bus-width = <8>;
> +       mmc-hs200-1_8v;

Does the eMMC support HS400, too?

> +       non-removable;
> +       fixed-emmc-driver-type = <1>;
> +       status = "okay";
> +};

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
