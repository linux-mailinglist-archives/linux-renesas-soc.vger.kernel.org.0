Return-Path: <linux-renesas-soc+bounces-20641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E1AB2ADA9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 18:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4635318A3C8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 16:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30331340D85;
	Mon, 18 Aug 2025 16:03:40 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CE6255F28;
	Mon, 18 Aug 2025 16:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755533020; cv=none; b=ludwmgvVsDKXVMRCerxoTJKaU1FgqTgpF8ZTboAW7NwrvrRIClblvVc4JzDRBthuKpbZiyV7R1mK6viXy/iKtKOuGjLK3pn7nt9+NHUY9steMlc/Id8o71R+q1fiad6rcgzUooFwwE8qnjvVU12uh1OpLVjqMUXHtd13UxCKjnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755533020; c=relaxed/simple;
	bh=xyfdRNQ9wOGdGfyWnM7p+9yHlJfRgUR40bWdHshNDl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gy4gsxyjOraRZDhBGQ4P/ZPL7U2k+d/veC9wCaKPK/nj9igTLOxwVifRf9QiVmdLibTqhIxHd1i66vuX7YqVW9RV8YC9nXm480ithVHMiAKyBEuHUsnYFbbfxyObDuuRyMeN7gKBGSFjsLgIbf3DpIcTe8wroBO2g/hrVcvU9pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-53b174f7cf0so3030270e0c.2;
        Mon, 18 Aug 2025 09:03:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755533015; x=1756137815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dz6yNhmiJ0lVb3itTQpXkImGCQB1PaG43nCPS3Jgfts=;
        b=kPu08DEtku/yGKklItZtFCvZvX6WL/3uX4Lkz/MExxiweWkFL9Ocl/HvZRddDZi0UT
         WlmiAiPVo0eD1g65ymebH9ZVl2fZ2k52o5J4whrpYCIKA10/GwqngvLBLJlwKK7fzmEQ
         j+yIXdMiAuVAvjyr+EnGmC/9Hmd1yujlCjcVk4atjyvIrHNJBC9APZ5e/BGSJIZ/QY3A
         6RAb2qXXEG3iQV+1qslRGDbPsW4BkIY+eBW6qKxQEn2fQ4IIQ7i2IWY9rUwJ0KvOxn4p
         G3vcKhjZ3REx3sQ65xc5YSwyl8w7+XT/0oYjgr6ixep60yD00BFwM/CyJHiplCf3HHKi
         Vs8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUouimGbToOmg0EyiyLrOISk1S6SHIOihmInEDHILFjdVZvb0b2r2DoyVmQUq905ngZDZtNWTpCjqAh@vger.kernel.org, AJvYcCVmA2SRfaN0F4Rw9YwGeAtea8v7TDPS0Y0aWhS33DfRIYRcG+UZ7EhlO6gdsttX2ZF/ZrdEKP6mYllFOxlKs7GiQCM=@vger.kernel.org, AJvYcCWlyLuws5CfN7YR2/WYWaJMICGgMZn13/aEHeBhMK5HFY22yzsHe7i9zHm74RNZ2VTP5ZowE7ruoKotTbBK@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3x/IwFXdEl14As6j3YhBnYAPnM7g1ygXmIIC+axkQB1j5DQDa
	lvt9JiO53QKxfHqq8p8KdzIYxiXn2Ak7fzHJL0ECmbkcbmdb9qzVE0DbJhv+dPHz
X-Gm-Gg: ASbGncso3/Ry2C7nvPzeBs0WU6FaysgaD94gEwuEjocBUVK08/AWKmSuTIJyVDUvBxg
	pknxzbTrxm6eWWxzjEZJS5WS4BmxnCbh+YMVA5jQBHKARnzJdr4UyjzipZHqPzcw3mAwvgk8o6y
	muXSMbAnAxL+gvSfHdszBMxpnPSDOUEHyrArutNVnJ/Tyt/LEhPwA5JbR66wcWMThaZrOAN+AsZ
	GxHaLSzoGAmXVT76LI3UiCUTMEn6CCfIP1Jy8bmqv0Di41FD4DL2W9iRkhBIJbdkHXCKWd18M1h
	A2kq0cG7oVCmRhuT17cifK/5s5FEW32nTyIGy3C8TlyJmvO0JVCNBeyJs5FO5KrXSFOTx/jB+iD
	Y1UtANKGfETqYrvUEW+b947trB4auQ1XHSP5VxcbwlhDiqRUlAik2R4cRxAAg
X-Google-Smtp-Source: AGHT+IFLs+6/xq3CfEpeMZWLac0ZWV87WUFUiE4yZPoGVqkC9rcNY2lGxbVXgqrQw1OirqO9Y59jNA==
X-Received: by 2002:a05:6122:8c6:b0:534:765a:8c3c with SMTP id 71dfb90a1353d-53b2b76a0afmr5033812e0c.5.1755533014987;
        Mon, 18 Aug 2025 09:03:34 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bd5514csm1938225e0c.6.2025.08.18.09.03.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 09:03:34 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-89018fdf5a0so3080029241.1;
        Mon, 18 Aug 2025 09:03:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVDU0xS1+ttDu2tl+wT3rQXkcF9DsNNvbvT3PA02nFnHtjsHyW33glQaa8uEjyyazXO3FgYu1/iRR4ZMRFEpcc3f7I=@vger.kernel.org, AJvYcCVz6pj7TlG084rqMXNr5fwzrPdaWGDYFKZT+lgKoe9vkDWwrbkuwZRJqQEwvtXhmg1y20gEKaFuirzk@vger.kernel.org, AJvYcCXkQ/046f1mr7IhpRGSb4O2mBuapGGpybBCUZZkzMTTskmwczVxZnWitNhy6HQEQ8WGS8RL0uUfwfCmzNo4@vger.kernel.org
X-Received: by 2002:a05:6102:a53:b0:4e6:f7e9:c481 with SMTP id
 ada2fe7eead31-5126b10e52bmr4914294137.7.1755533014567; Mon, 18 Aug 2025
 09:03:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250812200344.3253781-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812200344.3253781-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 18:03:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx2_D=B=UHWjwL3dk+jO-85HrYyoiA4SV15xiRQYRt6Q@mail.gmail.com>
X-Gm-Features: Ac12FXzp5dE-fnt9Gs99h43L_XyP0JhWgde5mQ1-qcSrAXuvIIToag4FSJZsG20
Message-ID: <CAMuHMdVx2_D=B=UHWjwL3dk+jO-85HrYyoiA4SV15xiRQYRt6Q@mail.gmail.com>
Subject: Re: [PATCH 13/13] arm64: dts: renesas: rzt2h/rzn2h: Enable SD card slot
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 12 Aug 2025 at 22:04, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable SD card slot which is connected to SDHI0 on the RZ/T2H and
> RZ/N2H EVKs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi

> @@ -104,6 +116,35 @@ sd0-emmc-ctrl-pins {
>                 };
>         };
>
> +#if SD0_SD
> +       sdhi0-pwen-hog {
> +               gpio-hog;
> +               gpios = <RZT2H_GPIO(2, 5) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "SD0_PWEN";
> +       };
> +#endif
> +
> +       sdhi0_sd_pins: sd0-sd-group {
> +               sd0-sd-data-pins {

No need for repeated sd0-sd-prefixes in the subnodes.

> +                       pinmux = <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /* SD0_DATA0 */
> +                                <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0_DATA1 */
> +                                <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0_DATA2 */
> +                                <RZT2H_PORT_PINMUX(12, 5, 0x29)>, /* SD0_DATA3 */
> +                                <RZT2H_PORT_PINMUX(12, 6, 0x29)>, /* SD0_DATA4 */
> +                                <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0_DATA5 */
> +                                <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0_DATA6 */
> +                                <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0_DATA7 */
> +               };

SDcard uses only DATA0-3?

> +
> +               sd0-sd-ctrl-pins {
> +                       pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
> +                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
> +                                <RZT2H_PORT_PINMUX(22, 5, 0x29)>, /* SD0_CD */
> +                                <RZT2H_PORT_PINMUX(22, 6, 0x29)>; /* SD0_WP */
> +               };
> +       };
> +
>  #if SD1_MICRO_SD
>         sdhi1-pwen-hog {
>                 gpio-hog;

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

