Return-Path: <linux-renesas-soc+bounces-20642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A61AB2ADAC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 18:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C1641897A99
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 16:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC6A31A070;
	Mon, 18 Aug 2025 16:03:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 350D92C234A;
	Mon, 18 Aug 2025 16:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755533038; cv=none; b=rhWnlZptDAl5rCTl21/D1BV0pu73Lz0B+xVGKLEnok9TX4+sb5hlCOk84cfCD5VkLRmzIg5kn9uUlITZYH1rXtrUL6mBrzdF75h913yy+k2VKDNQF1s7tBUcAT5CAXBPDUxXW5rH3oOzfvM3wiRMMrJVmNs99bIiMu1oVz2potY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755533038; c=relaxed/simple;
	bh=mYjBAMqZGZH/xLi6ms+MaVNfGzEp4zzE2h4TuEqsf8Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnkSPO+itFPyLMilWviet7Ldjzs8HaCd4cx/ulhXNxFpc6Zr5Hv/hKpknWOXdPISG+YDTGba2e2y95YCOLyN1oivl8+s8yrMwcgUapbBDUuC0nQwtnW9BzC1Sm4HnHgyyoY8CktqTl+Ao4PD5JK+qGrN7bNSj7nXjx0hEBXFIHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-53b1757a920so1258406e0c.3;
        Mon, 18 Aug 2025 09:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755533036; x=1756137836;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umdH8EMkWoPb5BxW9RQK5UovCpX0AzcP/CDA3p4lJMI=;
        b=idQlhkSJkdQAAozf9A3PGOU66mYLsNpoWjPoTzila1RQp18U8otID6MHQPTYbg3/d1
         RsCsVqW2kfwGWswGlruH26QW6/VpqWFkb3uI7+NjKR6lmt2YfVfusJuclnVBojq06N6f
         sqkpR6wnv54oFXkNENQFITGHX54Q3UGw31BwjpAD4uzyINDWHXBg/yob2NaaQyHleLJr
         vCMt6ihxmba1onusWsYnM9vP2rfFjnTSscQ+cMU/VJI9RtS9KmEcg5tVln4nWx9UbYSn
         XI3WrBcc+t7ogbETqd0dKOpchF4PqCJ7MArkfTObkFKNezmeyEGHDEnCfiYswluMflXb
         NspA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ5JknN1ey4zwsrAlGOXdnpEm9uiS2MJQuwwrFBu+OHbEzMf+R4EN4c3z0wpWOPfti5OgcbXRo0Erv@vger.kernel.org, AJvYcCWF6aYX50EDsQ8vTx1PxX9sQci9FglHzKKkCae+DZwAht+rzsYSItNBN1cg7vAh8yZlFkG9cLxyLUNuM+W1stX2548=@vger.kernel.org, AJvYcCXRB54V7FXtSGjvijQD5q+XEC78ssQYOTIG0+lv7gst468kciONonbsNVK2HMucqR+uzBHgjqpO0cSGZVKh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8A/psSi4g1vlTRz1EvHG40pc++QW+biL52NZQ+ZZpjYb+nvWd
	M3bijhlNIp0cCQipYmYnVG+CNI3TPnenYe9ziiQSyaF2O+5NCLiJWsU9tIrnB20P
X-Gm-Gg: ASbGnctmsU6bxOkR5NcUZBLIFOuG3oweXNeWzMtacTn1AAPrX0jAkoLkeQaQOaX+Vbj
	BOs3wTnKYdCJV4YhOowGV2TiaAwnm2AqPbCv+qt++Ttava1U78B2DjMNnIBea4MiGCrpHpZe+bf
	nsQ+V+HCXD0abh47BBqAC9EZovzMbsSsDlxO/kVhKTLN6RciVffHyRJ1oLepXSDotvseLTb0XPA
	mbjBdiO0zE7i/zsJ0T18YFMVTw/33tp7+6PvgifxAiMD97MxNzpvFBqUAoqsifCDe0677VsLklH
	ywXoc7h2rAWVAQfx6pdz75j9BidrP9rn61/fOAVtNFDcW78OAmVXamny82s/F5lZasq5j7SaYoN
	fz62Os7BcL7MCnzi6onsFVNKOWWVNchrDYYnkpSqlJ/9lU1c433qcoiuB5nV+
X-Google-Smtp-Source: AGHT+IHBOGAJ3mu2ibKW0OzKUtoK8ZkdfeZw63tazlESlvJAWwYsb9DxB5r7NbE8tkNktkAEQbD8rA==
X-Received: by 2002:a05:6122:32c3:b0:531:2413:ce62 with SMTP id 71dfb90a1353d-53b2b8d3c8fmr4196664e0c.11.1755532975706;
        Mon, 18 Aug 2025 09:02:55 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bf05c9csm1940030e0c.28.2025.08.18.09.02.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 09:02:54 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-89021b256eeso1017325241.1;
        Mon, 18 Aug 2025 09:02:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUWlYaJNTtUuRjbji4gsZ0XQr+UdPnpW4vlh8Y4fPnkCH3GEm/qkR0rlb8IcQRX2M6cFIKAMJZHKvsv@vger.kernel.org, AJvYcCUsa7LYybOmnyTNaafZUov4mNI7+W5l3jFQujSrRyg6W5IALqAixMIte7UejnGkAqmo9RkFip4Q1TgCeMA9DJFpo18=@vger.kernel.org, AJvYcCXn7Z1pa/6g/NsQcstUh/JYhBEnR4ALSYJ+iqqEWR/yZ1C0v5JD7Dt4BHkazOunhzHkPSmJCoI3n8RhRB/c@vger.kernel.org
X-Received: by 2002:a05:6102:290a:b0:4dd:b9bc:df71 with SMTP id
 ada2fe7eead31-5126b10f583mr4562417137.10.1755532973827; Mon, 18 Aug 2025
 09:02:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250812200344.3253781-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812200344.3253781-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 18:02:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXt9O==nuO7e+iWP7Efx=yy=TPakmSxC6BhPsWGw_hG_A@mail.gmail.com>
X-Gm-Features: Ac12FXzF3SiGve5SGr_c4PZWmXIIUf8GhOhtRael8tL1-CxdX993SpeMnYVkOrc
Message-ID: <CAMuHMdXt9O==nuO7e+iWP7Efx=yy=TPakmSxC6BhPsWGw_hG_A@mail.gmail.com>
Subject: Re: [PATCH 12/13] arm64: dts: renesas: rzt2h/rzn2h: Enable MicroSD
 card slot
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
> Enable MicroSD card slot which is connected to SDHI1 on the RZ/T2H and
> RZ/N2H EVKs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi

No mmc1 alias?

> @@ -91,6 +103,30 @@ sd0-emmc-ctrl-pins {
>                                  <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0_RST# */
>                 };
>         };
> +
> +#if SD1_MICRO_SD
> +       sdhi1-pwen-hog {
> +               gpio-hog;
> +               gpios = <RZT2H_GPIO(8, 5) GPIO_ACTIVE_HIGH>;
> +               output-high;
> +               line-name = "SD1_PWEN";
> +       };
> +#endif
> +
> +       sdhi1_pins: sd1-group {
> +               sd1-data-pins {

No need for repeated sd1-prefixes in the subnodes.


> +                       pinmux = <RZT2H_PORT_PINMUX(16, 7, 0x29)>, /* SD1_DATA0 */
> +                                <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* SD1_DATA1 */
> +                                <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* SD1_DATA2 */
> +                                <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* SD1_DATA3 */
> +               };
> +
> +               sd1-ctrl-pins {
> +                       pinmux = <RZT2H_PORT_PINMUX(16, 5, 0x29)>, /* SD1_CLK */
> +                                <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* SD1_CMD */
> +                                <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* SD1_CD */
> +               };
> +       };
>  };
>
>  &sci0 {

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

