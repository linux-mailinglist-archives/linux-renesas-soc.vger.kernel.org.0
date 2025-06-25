Return-Path: <linux-renesas-soc+bounces-18736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 62236AE87BA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 17:17:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 903B87AD520
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 15:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4823726A1A4;
	Wed, 25 Jun 2025 15:16:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301C24C92;
	Wed, 25 Jun 2025 15:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864616; cv=none; b=W4VUXOf/2MFWOSjJLiHG92hfY/TtirXXfrWSglvm4cbTr9Z+1CkedPbg7VMiKAXkc+fSP2pwFQNXHGMgGRF+2o41qhQcs1FO4F8nJBdGoX/DiIq2lsfUYeD9Xb1GXBKKW6vObbh5acBxFaNdbhQG5bRaxFMYVtW+0ku4uFNCAe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864616; c=relaxed/simple;
	bh=aC91EhIBP9Q2k/q5j/lTyvwBktXILvM8FcypRg/WJSI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t3uaiFa1OmkDD0CvZaJc9lTs1PpTrUWkzdk9vJcbM7HJwkvlmWVpryrPuvOM3N3gKUhhwXoi2hnHG82EKq1LILCQ6WMIyoPUWFJP/KD1fE/tAmlnFQoXLzPu8VDJPA9DoNi/lC2A6kiu7WHqLJuzape9zxAdUUuwUh/maux+/iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72bc3987a05so15986a34.1;
        Wed, 25 Jun 2025 08:16:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864613; x=1751469413;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUSrPdP6U4ZVmBBJkCBaWIz0r73N/ZlYRZqiR8xQJR4=;
        b=rzgliFGqcrzyPDvQv2ZYywQUkunsniQG8fxbvYdkIYEEhUcjvCMjIlvBEauf+DgGZt
         raB/Y6YmfDeARQn52gkb/8IQXbv8h1nmvhe2MqeEnoQQaZ6hy88QRI4XzAwvfBxB3p64
         BaRRfaPC028LjpotkvvuXviFhvWzpalZfmFspdp55NR81fkzH88RBYRTTjbDE3099OAC
         FijO05flqAa8k+/zlJeVt/Ms2SZm+NRd0IDtJOJKPVbM1GSE44xZmJZDgh1RlcgnI8H3
         z4/7y35e58nsPbEO/zVPqEbUBd5LOX3SnQjlqJjIC1qIZyK7hBokuFMd0a7btb/Yxf4w
         +lag==
X-Forwarded-Encrypted: i=1; AJvYcCU3rUidmSzWYHU7tuRhXdV3A4SPULmN6SN5flEYf1jC2Uo/40g77+pMP0pShHEH2ZXGeIbzwSEJysgZ@vger.kernel.org, AJvYcCUEM3IVRnSdrogglh4IUS3Pq3EMuNDUR83RAmQkVzeTyg4ankHe6vJMfi6InIi5hsyiXbBA/50JhBN7@vger.kernel.org, AJvYcCUYTuCkAq160RzlJL2uC16Zj6GbSM8W9y1OwnsPdPvKwHKDAzc9qpsP6rPoImDgQaAZLTgk6hq2/ZlOBp/r@vger.kernel.org, AJvYcCVjiSO5k/WsuA3ynOx+Kc+P4norsLz1pTJ5it3aD2i8RNkzx5CZoKHyvo4eniZOm6wAJbx1LK6J@vger.kernel.org, AJvYcCXBln157d1A7BjV0bJa6r6WEfy9TlBBkJtfT7D/gjrXXx64vwZkygmkY3eddHBTb6fcsUnwxbL5oMHtAK9qqnJGNPI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcw1j82VkRXlw5wN/2mdNd+io6oDvpMZPLMO2wLRl4V5DmVY44
	Eh23FBIDal8ZlZZgQyH6sYC/Rw8fkB3am2frpFjHqY2jpcGPc7Cu2MXSIsK+YzOL
X-Gm-Gg: ASbGncvm8I4mVsWc7YqqoZ+sn10YdgHVP/gVSQ87QJRy4o3lgIEnG3FwdCFptsgB6aT
	GwamOh6cu/f/DsZeQnv1yqOvZeulVjkr+aS9+7PjRlIAhXMaoaHnItRJDtUUumDyIKZe7VLI38i
	LlI8Nldpdonz541kJhB6OMYQcn1jXbd1ex3C/9YnFLYSNZwR8O9bfKEiRyIXI4nxfNXzNS6nAgJ
	WZgnrusXiwkJopCLZVbpVjBnx0lH5CNuTFbgeHhGoOWmnHeMvqEySDtmJRN3BHK1Iyj+ijmITxZ
	jo5mSWwE4a+3qgHC4hBuS9XRm1jNX+HGynuRi6M8GQmDYrmeNWSVOrRDJD80oSuNw8iu2R/WR3C
	xVoZBZFj2Hb6Y1/WUvvmtKcfr
X-Google-Smtp-Source: AGHT+IHuXLtIWOaJwXGV/ztLpzcozr9Sc91kdhR8HipSvYLmaY4KtGgBdo3upY/lQPoR4Layq5pcOg==
X-Received: by 2002:a05:6830:6c87:b0:73a:a969:a42e with SMTP id 46e09a7af769-73acbf0b2b1mr4323576a34.14.1750864612540;
        Wed, 25 Jun 2025 08:16:52 -0700 (PDT)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com. [209.85.161.41])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eead8dc454sm2544674fac.42.2025.06.25.08.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:16:52 -0700 (PDT)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-606668f8d51so22350eaf.0;
        Wed, 25 Jun 2025 08:16:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOGm42NreB4noYxs88efd8RLgc0vT6P0C+Mvu70oYLbV+/yNzGwITO59Q0IsyIrX8GmiHhzkPoi36p4MYZ@vger.kernel.org, AJvYcCUbsibKhR5DlQrOwT8JAGdfL6hxDAs2D/NB/xG/nHWmYQRfxsr0AzDTaQC6fuvQdD7Sy+2oV0bR4dWb@vger.kernel.org, AJvYcCV7D1ZBXIqQbMclChTbU1kvDjyRWAlMQup+zJBTaMiFQ2VK8wX7D/yl8UFHjg0hJSplSO4BkdFS@vger.kernel.org, AJvYcCVF7uwDjHzQMvXgHX3aAtZGy9kXazAXce2W7rtH62hPuNtrRbcXNMlDoy+RQNeIBLIL0sTrWRcJyUDI@vger.kernel.org, AJvYcCXKFdARBW5WibOX4ucCuw8TaWW3P/DHtsWPWQ3nNqhZ60EQwDvWHN1ZQtD3aEYHWuJhX9H3cNjtlyLUXKIb4NMY7wg=@vger.kernel.org
X-Received: by 2002:a05:6808:16a8:b0:407:9d24:af03 with SMTP id
 5614622812f47-40b06a5d677mr2449444b6e.14.1750864611838; Wed, 25 Jun 2025
 08:16:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623080405.355083-1-john.madieu.xa@bp.renesas.com> <20250623080405.355083-4-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250623080405.355083-4-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Jun 2025 17:16:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWtciRt+H3eQjwLw3O5T=NCG7Vqx8a=pGWBoHTJ2Q_G1Q@mail.gmail.com>
X-Gm-Features: Ac12FXxYBhNRo2UWMqofKkmEF9Ij-68i63gUw7rsGP9Hb2xLeqaEwM1NGuspIyU
Message-ID: <CAMuHMdWtciRt+H3eQjwLw3O5T=NCG7Vqx8a=pGWBoHTJ2Q_G1Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: renesas: rzg3e-smarc-som: Enable
 eth{0-1} (GBETH) interfaces
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	richardcochran@gmail.com, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, netdev@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Mon, 23 Jun 2025 at 10:04, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Enable the Gigabit Ethernet Interfaces (GBETH) populated on the RZ/G3E SMARC EVK
>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> v3:
> Updates mdio separately, based on phandles instead of node redefinition

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi

>  &pinctrl {
> +       eth0_pins: eth0 {
> +               pinmux = <RZG3E_PORT_PINMUX(A, 1, 1)>, /* MDC */
> +                        <RZG3E_PORT_PINMUX(A, 0, 1)>, /* MDIO */
> +                        <RZG3E_PORT_PINMUX(C, 2, 15)>, /* PHY_INTR (IRQ2) */
> +                        <RZG3E_PORT_PINMUX(C, 1, 1)>, /* RXD3 */
> +                        <RZG3E_PORT_PINMUX(C, 0, 1)>, /* RXD2 */
> +                        <RZG3E_PORT_PINMUX(B, 7, 1)>, /* RXD1 */
> +                        <RZG3E_PORT_PINMUX(B, 6, 1)>, /* RXD0 */
> +                        <RZG3E_PORT_PINMUX(B, 0, 1)>, /* RXC */
> +                        <RZG3E_PORT_PINMUX(A, 2, 1)>, /* RX_CTL */
> +                        <RZG3E_PORT_PINMUX(B, 5, 1)>, /* TXD3 */
> +                        <RZG3E_PORT_PINMUX(B, 4, 1)>, /* TXD2 */
> +                        <RZG3E_PORT_PINMUX(B, 3, 1)>, /* TXD1 */
> +                        <RZG3E_PORT_PINMUX(B, 2, 1)>, /* TXD0 */
> +                        <RZG3E_PORT_PINMUX(B, 1, 1)>, /* TXC */
> +                        <RZG3E_PORT_PINMUX(A, 3, 1)>; /* TX_CTL */
> +       };
> +
> +       eth1_pins: eth1 {
> +               pinmux = <RZG3E_PORT_PINMUX(D, 1, 1)>, /* MDC */
> +                        <RZG3E_PORT_PINMUX(D, 0, 1)>, /* MDIO */
> +                        <RZG3E_PORT_PINMUX(F, 2, 15)>, /* PHY_INTR (IRQ15) */
> +                        <RZG3E_PORT_PINMUX(F, 1, 1)>, /* RXD3 */
> +                        <RZG3E_PORT_PINMUX(F, 0, 1)>, /* RXD2 */
> +                        <RZG3E_PORT_PINMUX(E, 7, 1)>, /* RXD1 */
> +                        <RZG3E_PORT_PINMUX(E, 6, 1)>, /* RXD0 */
> +                        <RZG3E_PORT_PINMUX(E, 0, 1)>, /* RXC */
> +                        <RZG3E_PORT_PINMUX(D, 2, 1)>, /* RX_CTL */
> +                        <RZG3E_PORT_PINMUX(E, 5, 1)>, /* TXD3 */
> +                        <RZG3E_PORT_PINMUX(E, 4, 1)>, /* TXD2 */
> +                        <RZG3E_PORT_PINMUX(E, 3, 1)>, /* TXD1 */
> +                        <RZG3E_PORT_PINMUX(E, 2, 1)>, /* TXD0 */
> +                        <RZG3E_PORT_PINMUX(E, 1, 1)>, /* TXC */
> +                        <RZG3E_PORT_PINMUX(D, 3, 1)>; /* TX_CTL */
> +       };
> +
>         i2c2_pins: i2c {
>                 pinmux = <RZG3E_PORT_PINMUX(3, 4, 1)>, /* SCL2 */
>                          <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */

Based on the feedback from Prabhakar on v2, I understand this needs to
configure output-enable for the ET0_TXC_TXCLK and ET1_TXC_TXCLK pins,
and to add support for that in the pin control driver first?

[1] https://lore.kernel.org/all/CA+V-a8uizu5MCur_=g5vJyWbWSTSP2J6FkQ89JB8ges7GWdsjg@mail.gmail.com/
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

