Return-Path: <linux-renesas-soc+bounces-16818-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 406C7AB01C8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 19:50:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C0EA7B2A9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 May 2025 17:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215D62868B9;
	Thu,  8 May 2025 17:50:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC5128688A;
	Thu,  8 May 2025 17:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726613; cv=none; b=POqqcYqDlNrNblCwsHSgE9La3lIVn4N9VOd3uKwrZcR+GlGjfEyrbqi/FyEFi9w3yeTfmiEpWvu96Wb1IAyN6+sXtyEvZKiBtpdIPDaHte2lKthpOJeHaLJlC6c2hG27m0MM+iEzXZzAVSeGMR9UGzlWzGIhv5L4wq/fDNcny8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726613; c=relaxed/simple;
	bh=in2toxO73EnJlogMytpjcTx5ohxW74vwdzQEfD0cjq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IrBtiYY/RmuY6cWMHv+UpB1+8atQumfqCJcHU7XRd1MGpOmzXsERTaAqp0ME+csAeAAHOkwvZXtDXUECF2KGrKlAwrKSNNGP5V9RlvmgtZ2wfTbSy+C8fpDnBgmlMbmiGhDV2GrTzrzg8DCbcv/A097wOlUWNzxuDCtIb3hQthU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86feb848764so379456241.0;
        Thu, 08 May 2025 10:50:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726608; x=1747331408;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dJ5Y43B6glDBHLDXx79PXBVL7ZOKH4M+Euez5/1503s=;
        b=lEsL1O+om7abRc3Dusoy3s9mYW7O4VtROZntK8n/T4lZsgbOpZ5Ysh5X1EYOyuEefD
         gtZWh9/ZZk5Zau4SwLt2Z7fNIPhqIrfiEuKvMCV9qe5w/1GhYU8bqZodfzy7qjrl2nj/
         2DN67/fa8dtmQyGH3Kv/8hIhf5bdxZM5J8k0mqIhHal0TWR/1WGfObC8En9WD6uu05D8
         iDotDkaYLoVjVF9R7GfvshT4VjEIVKa1HXl+amc5G8ln8Yf8Ywq0BXaS57xi4cRzEYa/
         c6qDOTb9diqKQb+5gP6S0b3dYlNp13BvaqQzE09X+Hfh1Bv8kXuVj8eCD99LEC3tfKqw
         O+iA==
X-Forwarded-Encrypted: i=1; AJvYcCV5msQ/Tzq3il1VUYhKwMVzAjmojM6nXUaxk7ovclaaviLQamXxAp+dL5z72XW5STudibwy8Y9/P+72@vger.kernel.org
X-Gm-Message-State: AOJu0YzNOnhtCIUPK1FirA2S030ybCOqPT+2dpfK53+QOPYh935wuhy7
	EI4XqGrTTGF5kzYyYiiVRcU80onuY0g3hyiED6LF4sjSgzqWApl9cUAuFBNQ
X-Gm-Gg: ASbGncvmxGEkK8OM4BUutb5p75SD1bptR6JEeUiGUXHM7OE3zQQyq3drBFH55J4rTVo
	9OWq0zDNuu7VmYcm7qW/G69uA4GhJZM+7ngBd7sN+gWxaDD3/M7fQET2g3EYOk7mwfF+83x8CF8
	CrcvD/Xx1i0x6VzQOgq920BiBDypZ1aiNHFWaQLoifhGyVgpSyg0+aBSoRQPGXBEQTDxkvACL4I
	kxZbTZdHgZK9oBgQf4hw5C9EvHtvfbwvIluZ+z2YVnC5uhxmryK34phjHpTVhHVUoICSHkcX/WB
	A8dQHhKFZEeobGQNW0ClBacxg8JD3eDlyMlextEZawnvNFvm0mjrVwkFizZBH3yjRQrEdT5NWV1
	6G1qdgzCgBIyufA==
X-Google-Smtp-Source: AGHT+IEBvsqliWLLPLrk89ELR9Zf/BKYNYI9rOUzry5QkODkIEbybmE7aq6e466Cr737J40CwrKjRQ==
X-Received: by 2002:a05:6102:15a0:b0:4c2:ffc8:93d9 with SMTP id ada2fe7eead31-4deed33e036mr348367137.9.1746726608105;
        Thu, 08 May 2025 10:50:08 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f603551dsm129621241.0.2025.05.08.10.50.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 10:50:07 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4deec18dd83so75137137.1;
        Thu, 08 May 2025 10:50:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUW/SnjfwqdmRqgYMTRdZJXIbYkLxCHpnJStF0qtTKvE2VQaogg1anGqJR4a0TkDfrW/oD1Vche4qX7@vger.kernel.org
X-Received: by 2002:a05:6102:4b85:b0:4c5:5aba:94bb with SMTP id
 ada2fe7eead31-4deed30e61dmr296135137.3.1746726607510; Thu, 08 May 2025
 10:50:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508074311.20343-4-wsa+renesas@sang-engineering.com> <20250508074311.20343-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250508074311.20343-5-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 May 2025 19:49:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUZzMh1seVTW3T_1A3Ge9Mya8sq0G7Y=zb4Kcv03GgzLw@mail.gmail.com>
X-Gm-Features: AX0GCFvSloOfcdSVHuxyOALjzULJPhKiaVcOUlOxxqmCC5swTTJsu00zb4OsiXY
Message-ID: <CAMuHMdUZzMh1seVTW3T_1A3Ge9Mya8sq0G7Y=zb4Kcv03GgzLw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ARM: dts: renesas: r9a06g032-rzn1d400-db: add
 pinmux for the CPLD
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 May 2025 at 09:43, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The CPLD has no dedicated driver, so apply the pinmux settings with the
> pinmux driver instead.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16...

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> @@ -170,6 +170,9 @@ &mii_conv5 {
>  };
>
>  &pinctrl {
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&pins_cpld>;
> +
>         pins_can0: pins_can0 {
>                 pinmux = <RZN1_PINMUX(162, RZN1_FUNC_CAN)>,     /* CAN0_TXD */
>                          <RZN1_PINMUX(163, RZN1_FUNC_CAN)>;     /* CAN0_RXD */
> @@ -226,6 +229,13 @@ pins_mdio1: pins_mdio1 {
>                 pinmux = <RZN1_PINMUX(152, RZN1_FUNC_MDIO1_SWITCH)>,
>                          <RZN1_PINMUX(153, RZN1_FUNC_MDIO1_SWITCH)>;
>         };
> +
> +       pins_cpld: pins-cpld {

... with this node moved up, to preserve sort order.

> +               pinmux = <RZN1_PINMUX(119, RZN1_FUNC_USB)>,
> +                        <RZN1_PINMUX(120, RZN1_FUNC_USB)>,
> +                        <RZN1_PINMUX(121, RZN1_FUNC_USB)>,
> +                        <RZN1_PINMUX(122, RZN1_FUNC_USB)>;
> +       };
>  };
>
>  &rtc0 {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

