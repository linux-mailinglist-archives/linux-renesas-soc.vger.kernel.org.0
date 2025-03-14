Return-Path: <linux-renesas-soc+bounces-14392-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD9CA615C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 17:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5EED173223
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Mar 2025 16:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAF9720127B;
	Fri, 14 Mar 2025 16:07:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC8D1339A4;
	Fri, 14 Mar 2025 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741968459; cv=none; b=A4x2EJjUDdwui+0sVn3W8w/xZNMUBqmP0Nqx6OsaFGhqSLzLgi75o5OYqn++4g42vUCC27m1iSUXVQ429iFvKVUq3p9H5hryXjPHxmhRIcNYjdS5DAusvYADRO3JkW3Jaw2k8sEehvpPPHduSsc3EwKZPJiVxO1eghgAp1/5KGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741968459; c=relaxed/simple;
	bh=m8K2glnEbYKUqB49ZcnEwTQfSCLn6mYHZth6Npsn9RA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nw8s1avQ5qmoUASApOk3QguGPFXafmNygCwZxpWEhuSx54vWZhaWsPyr205hntZi26ZXEjsnTmksifd4x10aFYr1tB1L5W6F2lsBimI75PMW7YBqLn/Ph34+DLaRq/LCmgS/wt/K0pPXGclDBo3RgI2eCm4broXTXHjIou8tNcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8fca43972so21287666d6.1;
        Fri, 14 Mar 2025 09:07:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741968456; x=1742573256;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9loGD6SL189zSH+7x26HKnYJV2hwzNv8l/KV9wrulo=;
        b=X/isXbUH9ZnYm2VyaElNJIz69k0/yM9NDLEojVxIsjiEWjtTURlInqg+rxdZqhSRsy
         xnbWN6xlCf1bSdXMCmDY0Lisa1RirEmLfO3S6brAOjl+OBTtHNKcsneztwIuU2fprTpw
         Xbt/8etFmaxSgJ5XZ3bvongxgNcr3HaeZjUZ+kdE1H7z2INiF7rrRmWQctcRgAMI/seW
         jRx0qwq4062dPxI4bbnTunuFx551uSwzr3lCVvJUXZJ5RIY8geUDfTLq3uyPpcCPLNGY
         qEw8h39zzb1S26lgjLfJ16/KjmgyLM4rnrLSnjSvJVNMY/Wp/P88pZKEnEMJvYUGAaBL
         AFtg==
X-Forwarded-Encrypted: i=1; AJvYcCVNEVpXyEAWiY1SixRUDQBfwaG/tWRBxCpTEIBChHv1Pngf+ff9mCgoCekxR57DeZX8qfpwlGPWRaYX@vger.kernel.org, AJvYcCWRvabRKQ5pJCBeb+FvNZ7jvW4EzyVYrU5q1eOifDHyBMbwC9VcdPxYVN1cIs1g44v1MB+gmCqYfq9iI6JFmY2NQeM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHaBwm5xbyRV3LnkjTq32wVsgaNNa7xHjKcBcgUwrEHJbdw8Y+
	ScZFidYv6jrUu19ZXy2NwwxklCpyNG5c7fw7woUgSVlJ2RCiVIetZ2LbADpt
X-Gm-Gg: ASbGncsN5z/5KiwRJ7UrWanJNUjDDgb+sNTOfft7hjWaEDTPba3G9HJuGTHaI8/SuRC
	RFly1SxAHfKrifs5e4Tp3xUXZzdggYODsUNtkyRLQX2giFCXzzK5ExRE9M37L+VezPD1mRMdgfY
	kMKx2hABzeM08KX8mQFphndmY1sgUKvr0oF9fGKPET4r3OaH2jCMPuvfO+5gcYq87OcJ9or7HKA
	nfioTFDBt9cV/0XhF8i/Vv4eHbVleG7Vx10xw8In42uuBaB91UrUkbvRx2ZMC5rTXYX1075BjqW
	NonWQUNAmOnRhpb9x+NJ6VEn3Dtb7Jp67xcBHpyULWD641ovkviKJ4q+JEauecNYg3QkdXZiX7/
	4Lk5a7xs=
X-Google-Smtp-Source: AGHT+IHtxqg75us93QWe1JDLo+d2Vn87owkOxU47OnluxvT9exsoUHgNMPnkfFyubDGdlPT5KKEIiA==
X-Received: by 2002:a05:6214:e8c:b0:6e8:9fcb:5f7d with SMTP id 6a1803df08f44-6eaeaaaa503mr55242756d6.36.1741968455684;
        Fri, 14 Mar 2025 09:07:35 -0700 (PDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com. [209.85.219.53])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade209be3sm25805576d6.8.2025.03.14.09.07.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 09:07:35 -0700 (PDT)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6dd01781b56so28866956d6.0;
        Fri, 14 Mar 2025 09:07:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW3yBYNg/9qDIvV5s7B8y3wSb8kBBQfU683pveSm8D9s8s/HORfQZlEU1OD4qo/ApUsKV1wQHlU31+AukaYUx43qtQ=@vger.kernel.org, AJvYcCXzme8TolaucaeQKKz3j5W7+rYpVHNu197VhVRuWgmMuNuh1/wZr0ijVgItc3rEIppGMOWCnskiTL9X@vger.kernel.org
X-Received: by 2002:ad4:5c68:0:b0:6d8:aba8:837b with SMTP id
 6a1803df08f44-6eaeaabd707mr49340716d6.41.1741968455004; Fri, 14 Mar 2025
 09:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218105007.66358-1-biju.das.jz@bp.renesas.com> <20250218105007.66358-12-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250218105007.66358-12-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Mar 2025 17:07:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVL1nbyQj-WGKXgkV4jCb-d=EezpFV=uzc3KbbwuxbHPA@mail.gmail.com>
X-Gm-Features: AQ5f1JpujQBNz1iqx_CnPM_wC9CzDPoPDpSuxQCOIifJBylRnrW7RV_SdIBv6RM
Message-ID: <CAMuHMdVL1nbyQj-WGKXgkV4jCb-d=EezpFV=uzc3KbbwuxbHPA@mail.gmail.com>
Subject: Re: [PATCH 11/11] arm64: dts: renesas: r9a09g047e57-smarc: Enable CANFD
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 18 Feb 2025 at 11:50, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Enable CANFD on the RZ/G3E SMARC EVK platform.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
> @@ -10,6 +10,8 @@
>  /* Switch selection settings */
>  #define SW_SD0_DEV_SEL         0
>  #define SW_SDIO_M2E            0
> +#define SW_GPIO8_CAN0_STB      0
> +#define SW_GPIO9_CAN1_STB      0
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/pinctrl/renesas,r9a09g047-pinctrl.h>
> @@ -33,7 +35,50 @@ vqmmc_sd1_pvdd: regulator-vqmmc-sd1-pvdd {
>         };
>  };
>
> +&canfd {
> +       pinctrl-0 = <&canfd_pins>;
> +       pinctrl-names = "default";
> +
> +       channel1 {
> +               status = "okay";
> +       };
> +
> +       channel4 {
> +               status = "okay";
> +       };
> +};
> +
>  &pinctrl {
> +#if SW_GPIO8_CAN0_STB
> +       can0-stb-hog {
> +               gpio-hog;
> +               gpios = <RZG3E_GPIO(5, 4) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +               line-name = "can0_stb";
> +       };
> +#endif
> +
> +#if SW_GPIO9_CAN1_STB
> +       can1-stb-hog {
> +               gpio-hog;
> +               gpios = <RZG3E_GPIO(5, 5) GPIO_ACTIVE_HIGH>;
> +               output-low;
> +               line-name = "can1_stb";
> +       };
> +#endif

Please model this as proper CAN transceivers instead of GPIO hogs.
The two CANFD channels share a dual TCAN1046V transceiver, which I
believe is just a single chip with two TCAN1042 instances.  The TI
AM68 SK DTS[1] can serve as an example, as it also models each TCAN1046V
as two TCAN1042 instances, but lacks standby-gpios.
The White Hawk DTS[2] lacks standby-gpios, but does have enable-gpios.

[1] arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
[2] arch/arm64/boot/dts/renesas/white-hawk-common.dtsi

> --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> @@ -12,6 +12,17 @@
>   * SW_SDIO_M2E:
>   *     0 - SMARC SDIO signal is connected to uSD1
>   *     1 - SMARC SDIO signal is connected to M.2 Key E connector
> + *
> + * Please set the switch position SW_GPIO_CAN_PMOD on the carrier board and the
> + * corresponding macro SW_GPIO8_CAN0_STB/SW_GPIO8_CAN0_STB on the board DTS:
> + *
> + * SW_GPIO8_CAN0_STB:
> + *     0 - Connect to GPIO8 PMOD (default)
> + *     1 - Connect to CAN0 transceiver STB pin

Doesn't this channel also need correct positioning of the SW_LCD_EN#
switch on the SMARC module?

> + *
> + * SW_GPIO9_CAN1_STB:
> + *     0 - Connect to GPIO9 PMOD (default)
> + *     1 - Connect to CAN1 transceiver STB pin
>   */

Doesn't this channel also need correct positioning of the SW_PDM_EN#
and SW_LCD_EN# (for GPIO9!) switches on the SMARC module?

>
>  / {
> @@ -29,6 +40,10 @@ aliases {
>         };
>  };
>
> +&canfd {
> +       status = "okay";
> +};
> +
>  &scif0 {
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

