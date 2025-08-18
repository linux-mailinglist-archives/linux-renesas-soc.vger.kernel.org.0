Return-Path: <linux-renesas-soc+bounces-20633-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBDDB2AAC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 16:35:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1F5686E1873
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 14:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2345834573C;
	Mon, 18 Aug 2025 14:15:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C1C238C33;
	Mon, 18 Aug 2025 14:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755526513; cv=none; b=Q64iBa3NVKmMzxSlo+VUKGvck7oSpMWfMDiCiElUl0nCExsc0lzrcoscPUWhcKwsyVYpvXGyEREr+yCAK4Eowg6PYs6CME/Bd1X+QMxbdwoOGVP5emt019x6Wt7gAsaJsxuUvhTguPQa63ZryDd/pbutlJfTxskXyjXUdPsU89Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755526513; c=relaxed/simple;
	bh=T2+bGxtt0/QliYXnLpsMn3ujLdIlP2ETiKcb2c+R1tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PJrtCzVEYzo4DUMbBAHfnxIp139E9CV87FRY7ZYy/k3uFiePkzeCNvZzABHR37OvT0GO6fUJ5IBNt4bkrzsA9hDYIxWSToJlQUqttCkpOfKGdNHHyfOYV1jutJVGKvCzybfN5/z7VS0XNzQ5m1lrcCWtphHxbXkqSEXwByldcLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-53b1757a920so1202520e0c.3;
        Mon, 18 Aug 2025 07:15:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755526510; x=1756131310;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D94Qsa+myjFdE/M9+7sXm7iHa3BtVTv2Ph09TlGFvqw=;
        b=Vf6m0hRi2bpNNTv2GgtRL5DTDq8ebSKw6ehmaHqfcZ94VwqaGEZNOI0xHLPIHKlMXa
         p6Ikt1+8+PFJFXYayFUHbM1o8U0UT/yyw5k7yGemZnPwfuIoyxROxC0sigvnsS429O4/
         SnRqxXIICoBSu6vnV1t6//FjJ500CEEj+Q7ql1o8nJzDb9OLgjqUg0MzAH9+TN4D6y2P
         7yfZmU3Lowpx3Fe8MD+ndE/ebyjGWC0o3VmyfZuMKqnqjyarUM+p1a7L8FBQl5YItW1p
         X4u2VoR0IExeixE/vPF6zCDPd8In3e0zZQbMZGg5wQ5PJsQc1ZiaHwarbeif6+N0JQcv
         eu0g==
X-Forwarded-Encrypted: i=1; AJvYcCUyu+S+FXAuuZya2nIL4aDP23WZPWTtq9gGjxtTYGtuq7taaHxEBvpLXLc9Dv+siiSxUdNCb4NfND4abZjdVYFRNKY=@vger.kernel.org, AJvYcCW4Sfcv499IIMluJ223Qa514XPv6Yz0Dgh9sKnUrJ+rl5VcZ47upkg26KxmjbjF2gwe/hTpUW53REuz@vger.kernel.org, AJvYcCWCb2+kx4hDBIDjPvY6uQN+UUFLdthVSqNWbSJzRmxkW/RjzdHRL2+3ymbE+tUSgGTkaA0Wv4iRWVdphuKI@vger.kernel.org
X-Gm-Message-State: AOJu0YwnpY/3dRlMxLHuYsulRsPVEHbprgPsOxDK0x6+BkpWO+L5M3XA
	2j5cPg8ipOlfmUeJSpYAF8Y7IUAkuONiSArocLf/2tdwC4zFbvoEo0G0QmSmFtk7
X-Gm-Gg: ASbGncv4v0MvSSbChZ6z2ryeOIonbxTF0Hojd1RiVW5ujg1oo6lsNpGwvEG4RhHBOoT
	aefRCC6TODfDtmdz+YhU//DgIMgMOhhwqfIluHkrxNMjXS4BWpx85ea6Xa6lOgG9Ui3H7fK3AkV
	fEmoy1tgybdw9V7ycKlVnzZmoPltj8Ut6kNcyudBK799X3cRnZKrI8soRWhjcupvaI4FnSiTA50
	Uf7sfJXh0eylcic63gGtIsDkqiKhuw2jp82m+ICeD2SU5Qkbws3adxbgNcbLjjh4XqViEtUZMGG
	FUG5DpPGRst9huF+cxAU8mIi+qM/6+dRYZojUKtIEfYGQXl7NAyATidQGP8OxVFGt88QCGk9C7g
	4oyqZA+0rwFKSfPMDM9kFEruXHajlGyeqTN6dfu0VoXLVnllk5JwHHfdGKYMj
X-Google-Smtp-Source: AGHT+IG2DAP1Jnoj12b0DVjxAibz+5ILx9AtdBp/1sldx/hZu64xXEGS7/pIE6hFZSBdWNi4+YOddQ==
X-Received: by 2002:a05:6122:a08:b0:538:d49b:719 with SMTP id 71dfb90a1353d-53b2b755d45mr3951132e0c.1.1755526509751;
        Mon, 18 Aug 2025 07:15:09 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bed8eb8sm1865332e0c.21.2025.08.18.07.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 07:15:09 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-50f861bab18so636188137.0;
        Mon, 18 Aug 2025 07:15:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX7uUe8jxGGQuz+iAa7zMcxB5eUa3uBmK6W4eVaArAHQVAORZABm0rcYCq12IXTybHXB7whvcFwEXbHtMP0@vger.kernel.org, AJvYcCXFtDzqz6quB23upXH44SlT7nM5nFl8ryL1FBDRK1cykwyjfNLG6bQQgHJfFRNHDxJxzy5Lf5kSwQYsaLCokAQ1jRQ=@vger.kernel.org, AJvYcCXnqh81KyEYS3kx75dATEe5kPo2d+H1cMSngiRdoJk4rqHaowKxdifkS97kn+6laKDl6uiuUPCxVqZ/@vger.kernel.org
X-Received: by 2002:a05:6102:3713:b0:4e9:92d3:d20 with SMTP id
 ada2fe7eead31-5126ab29791mr3600838137.4.1755526509280; Mon, 18 Aug 2025
 07:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250812200344.3253781-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812200344.3253781-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 16:14:58 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXsQ7pne45+56f_nO0VA8LeUpZhxXFKPMqOKR4GSsdG4Q@mail.gmail.com>
X-Gm-Features: Ac12FXyjgHtrFj3K1ZNoypZLsLLtqdfXcJSrMvIWvs3l24dXDsMcOTIrjrOGHMU
Message-ID: <CAMuHMdXsQ7pne45+56f_nO0VA8LeUpZhxXFKPMqOKR4GSsdG4Q@mail.gmail.com>
Subject: Re: [PATCH 06/13] arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add
 user LEDs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add USER LED0-LED8, which are available on RZ/N2H EVK.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> @@ -7,10 +7,64 @@
>
>  /dts-v1/;
>
> +#include <dt-bindings/gpio/gpio.h>
> +
>  #include "r9a09g087m44.dtsi"
>  #include "rzt2h-n2h-evk-common.dtsi"
>
>  / {
>         model = "Renesas RZ/N2H EVK Board based on r9a09g087m44";
>         compatible = "renesas,rzn2h-evk", "renesas,r9a09g087m44", "renesas,r9a09g087";
> +
> +       leds {
> +               compatible = "gpio-leds";
> +
> +               led3 {
> +                       /* DSW18-7: ON, DSW18-8: OFF */
> +                       gpios = <&pinctrl RZN2H_GPIO(31, 6) GPIO_ACTIVE_LOW>;

Similar comments like for the RZ/T2H EVB, e.g.

    led-3 {
            /* DSW18-7: ON, DSW18-8: OFF */
            gpios = <&pinctrl RZN2H_GPIO(31, 6) GPIO_ACTIVE_LOW>;
            color = <LED_COLOR_ID_GREEN>;
            function = LED_FUNCTION_DEBUG;
            function-enumerator = <4>;
    };

> +               };
> +
> +               led4 {
> +                       /* DSW18-9: ON, DSW18-10: OFF */
> +                       gpios = <&pinctrl RZN2H_GPIO(18, 1) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led5 {
> +                       /* DSW18-1: ON, DSW18-2: OFF */
> +                       gpios = <&pinctrl RZN2H_GPIO(22, 7) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led6 {
> +                       /* DSW18-3: ON, DSW18-4: OFF */
> +                       gpios = <&pinctrl RZN2H_GPIO(23, 0) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led7 {
> +                       /*
> +                        * DSW18-5: ON, DSW18-6: OFF
> +                        * DSW19-3: ON, DSW19-4: OFF

Shouldn't that be "DSW19-3: OFF, DSW19-4: ON"?

> +                        */
> +                       gpios = <&pinctrl RZN2H_GPIO(14, 3) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led8 {
> +                       /* DSW15-8: OFF, DSW15-9: OFF, DSW15-10: ON */
> +                       gpios = <&pinctrl RZN2H_GPIO(14, 6) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led9 {
> +                       /* DSW15-5: OFF, DSW16-6: ON */

s/DSW16/DSW15/

> +                       gpios = <&pinctrl RZN2H_GPIO(14, 7) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led10 {
> +                       /* DSW17-3: OFF, DSW17-4: ON */
> +                       gpios = <&pinctrl RZN2H_GPIO(2, 7) GPIO_ACTIVE_LOW>;
> +               };
> +
> +               led11 {
> +                       /* DSW17-1: OFF, DSW17-2: ON */
> +                       gpios = <&pinctrl RZN2H_GPIO(3, 0) GPIO_ACTIVE_LOW>;
> +               };
> +       };
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

