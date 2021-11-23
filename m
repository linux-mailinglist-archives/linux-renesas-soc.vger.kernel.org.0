Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2D0E45A5FE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Nov 2021 15:44:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237914AbhKWOsA convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Nov 2021 09:48:00 -0500
Received: from mail-ua1-f53.google.com ([209.85.222.53]:36709 "EHLO
        mail-ua1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234844AbhKWOr7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Nov 2021 09:47:59 -0500
Received: by mail-ua1-f53.google.com with SMTP id r15so44287459uao.3;
        Tue, 23 Nov 2021 06:44:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=TA8xlkjkBTwOrtSVFopYo1RZrjhebZ+Gv93fs+HGNgE=;
        b=74N/iFLNAnRH2k3ltAKMUDzG+HmDGkQs7xjFYmP6OpVYYT9SVPaGbbVQv7bd64S0rQ
         mM9uDwF7TNkZEJ897mBCUR0ZLp6tXewUcByqDRbcU+yLgdXqKe+AwIPI1wnoLMj53qja
         RXCUSnovF5vX0ZCATVTSFz2O4g/bf0ANurJPVzhDrjGMdHnBVWJismyJIE3Q3MuS3Lha
         OB2yC9fjGeDK7HhHaf51+sQ//NTTBGoSmet3cdTcQvpG03hmwN3aqN8erAIEQqzzZglp
         XlWF87nAvds4RKzFmWEUNwBLo3r8XKl8FoGFiG5n1ZdtkNSnneiNg06DIYXQ59nxIpdC
         dKMg==
X-Gm-Message-State: AOAM530ZNIy7Vt7k20uGx/bo8e2AeAJydJtug9TN3rHFdL1tdUWXmKfM
        xBqjllJCaaCwwv7Y5+20AMLm/ZBLs/OHPg==
X-Google-Smtp-Source: ABdhPJw2b9xla90+hQLalkzNqW5vXJ9isHCd/LX+JDMLUFf+hFCt2wDDgtQSOpSyA+FxpryQ/fvQBg==
X-Received: by 2002:ab0:6f0a:: with SMTP id r10mr9903107uah.106.1637678690523;
        Tue, 23 Nov 2021 06:44:50 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id l28sm6402399vkn.45.2021.11.23.06.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 06:44:50 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id o1so44250613uap.4;
        Tue, 23 Nov 2021 06:44:49 -0800 (PST)
X-Received: by 2002:a9f:2431:: with SMTP id 46mr9496496uaq.114.1637678689612;
 Tue, 23 Nov 2021 06:44:49 -0800 (PST)
MIME-Version: 1.0
References: <20211121235808.10167-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20211121235808.10167-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Nov 2021 15:44:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXvehNc5yRxO4cS=n_ZaDWCKq2iaKhs+b3uj2beYsdWVg@mail.gmail.com>
Message-ID: <CAMuHMdXvehNc5yRxO4cS=n_ZaDWCKq2iaKhs+b3uj2beYsdWVg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: hihope-rzg2-ex-lvds: Add power-supply and
 enable-gpios to backlight node
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Mon, Nov 22, 2021 at 12:58 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> This patch adds missing power-supply and enable-gpios property to
> backlight node. This fixes the warning "pwm-backlight backlight:
> backlight supply power not found, using dummy regulator".
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex-lvds.dtsi
> @@ -12,6 +12,17 @@
>
>                 brightness-levels = <0 2 8 16 32 64 128 255>;
>                 default-brightness-level = <6>;
> +               power-supply = <&reg_12v>;
> +               enable-gpios = <&gpio6 7 GPIO_ACTIVE_HIGH>;

According to the schematics (up to Rev. 4.00), GP6_07 is not connected?

> +       };
> +
> +       reg_12v: regulator2 {

Using "regulatorN" as a node name is error-prone, and may lead to
accidental clashes. Please use a more appropriate name.

> +               compatible = "regulator-fixed";
> +               regulator-name = "fixed-12V";
> +               regulator-min-microvolt = <12000000>;
> +               regulator-max-microvolt = <12000000>;

Hmm, the AT1316A is a constant-current source, not a constant-voltage
source? The -02 variant has a 0.2V Low Reference Voltage. Combined
with the 1.1Ω resistor, that should give 181818 microamp.

> +               regulator-boot-on;
> +               regulator-always-on;
>         };
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
