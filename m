Return-Path: <linux-renesas-soc+bounces-15767-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E75EA847F2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 17:32:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB0077A2094
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 15:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C821E883E;
	Thu, 10 Apr 2025 15:32:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019C11E990A;
	Thu, 10 Apr 2025 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744299162; cv=none; b=t/IBkEg3j/9VvHBIxKmzihgzur+ccRIL/Az6eHkc4jVXAxLsAuvLsfsItObM86j1DraRTT7wxmbWuVk87WX1bG7mLpb9jgQcgf9//IZnjXqeD0/vjxxsOeP25bbUqAG1CeZVKjlqr/X0o3CpTo/SsLEAvhPunHrVNGGMB6RNWT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744299162; c=relaxed/simple;
	bh=BfUCJ6zQhrT/3wpw/JuvHEuL8osOaMWGT0eLdP72w1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fM0M7Ep4k2dN70YHvMD66B10Noa/0fO6XW00k5LAS5J5NwHemGFJ2uIuS3bgm4NFSqRQbBDsc8yU9+bBQw8zxA9nmvv4d1OIEfPNBPIOfEXyrBtLlkEXWALO/oiDRjrSQGyVlA4i8+zYNPp4V29aZNnzLnnfyNw8gNFg8UMtvZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c55500d08cso90550385a.0;
        Thu, 10 Apr 2025 08:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744299159; x=1744903959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oeaUuCNBxI4Oq+ZUmEOLJH7N/qGDywoJMkgl4ao7Rcs=;
        b=bbmMOAgt6dY5oWHESGVM/MG0T7DVchHHs4TxlxiXGGqS4QJqG6Ozd28Zg1sQDAL7b6
         yp98MqP1pdlutxJort2SvLnzLNgrQ08tHjyqw0vc9BkZ1lNcaa5mMfUCIFchofjRl5JP
         k8D+NIsf//Q7u/1h1tTcAf1TUoLYnkS/VR3VyrS3AIc0HG9SoXMh88WbAqhHUy/pNnhQ
         bJbC99aJjZw+RMfN/15etPr2vPFIAEo8CT8YjjMgzXavZh4vjJSWg50+ed8dBZxfRvR4
         2ia1oO/yXN+yEViZCc8tbV0/r+9Ybfk9myrZwYgjF1ogQG1SfATXxjZit139LPToXOI+
         mShA==
X-Forwarded-Encrypted: i=1; AJvYcCWO+qKizOwXrl67GBwTwJiW805B9m6OKswk+84tr1MTMm/wnEHT6kI94Fp47uK7+z+g4iJaQ/qr+7su@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjl1blX/Vq3SmslbUJwH2lzu9r0CE2qiquiBi5D3pixvbjaHSQ
	X6NhZCgmvxYsF7GBvBYGTippbMoptWN2EzHjoEmT6mNr8UGa4T9htZUbNmdWbsQ=
X-Gm-Gg: ASbGnctP05zmNRy1j8A0GlvOaADNB7fup2Q3ua7IIZkOFLvlWL61OarHSue/+OfzELT
	FVpkgZjj7CqPHeX/8QrTUycUJqg0VB7mU1VCtOt53oeLOXpMC4dxqLqdtuy19xmLW0K3+Y/igHM
	J8hJHedZ23/kQXxbmyFplqJ9xT+cZOLPNsAyb63GtpjHoN0lEeK/nt+IQjgfhc6tSf3oXAs4uJg
	62h4xV2vjlrPw2UMoA3pNgtbMq47WFdXs4h9riR00yKz+99ZPUSzoRt3s+mSIkcy84TvwZPfFFa
	zt3yBaylXEFThCOW6hdYLv2FNYmgj0CzRlV3Jjv8Fto1Ikag2/WTQe36YgPL0qcdzDJdhV4V1uN
	XgVPl3gY=
X-Google-Smtp-Source: AGHT+IFyxIjrlwakseKVPLOdD42J8HJP+mFffnGX7T/4lPFCYJzgV7mn4gEVhSfVXOtSZXOMGiwuLA==
X-Received: by 2002:a05:620a:5e54:b0:7c5:a249:901b with SMTP id af79cd13be357-7c7a76d049fmr421800985a.49.1744299158919;
        Thu, 10 Apr 2025 08:32:38 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a89517f8sm102921385a.37.2025.04.10.08.32.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 08:32:38 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c55500d08cso90547485a.0;
        Thu, 10 Apr 2025 08:32:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmtoawaXqcte5PlSGh8QzhHoQBem743FbNNSnqAPqbRoGgzMmPdUAGsCMsQpFFHrHsvUKiTraqJsu7@vger.kernel.org
X-Received: by 2002:a05:620a:4589:b0:7c5:57d6:ce3c with SMTP id
 af79cd13be357-7c7a766e1e9mr418492285a.22.1744299158252; Thu, 10 Apr 2025
 08:32:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250313102546.27335-1-wsa+renesas@sang-engineering.com> <20250313102546.27335-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250313102546.27335-3-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 17:32:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWO7M+SyvD6gj5h2yFFzpwyXhHzrxWgSCTz8hJb+puzBg@mail.gmail.com>
X-Gm-Features: ATxdqUH0Q5tpsgQ5jw3fGMblfnYOD24QcVcje-dZdTnoL8MRjCSnCEJ-emxVekU
Message-ID: <CAMuHMdWO7M+SyvD6gj5h2yFFzpwyXhHzrxWgSCTz8hJb+puzBg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] ARM: dts: renesas: r9a06g032: add second clock
 input to RTC
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 13 Mar 2025 at 11:25, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The external rtc clock is populated on the RZ/N1D module, so describe it
> and add a reference to the RTC node.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> For the non-RFC series, it makes probably sense to split this patch into
> two.

Indeed.

> --- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> +++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
> @@ -47,6 +47,10 @@ &eth_miic {
>         renesas,miic-switch-portin = <MIIC_GMAC2_PORT>;
>  };
>
> +&ext_rtc_clk {
> +       clock-frequency = <32768>;
> +};

That's the mighty 0.033 MHz crystal X2_1? ;-)

This change is good for sure.

> +
>  &gmac2 {
>         status = "okay";
>         phy-mode = "gmii";
> diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> index 7548291c8d7e..458dab9d3b7f 100644
> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -73,8 +73,8 @@ rtc0: rtc@40006000 {
>                                      <GIC_SPI 67 IRQ_TYPE_EDGE_RISING>,
>                                      <GIC_SPI 68 IRQ_TYPE_EDGE_RISING>;
>                         interrupt-names = "alarm", "timer", "pps";
> -                       clocks = <&sysctrl R9A06G032_HCLK_RTC>;
> -                       clock-names = "hclk";
> +                       clocks = <&sysctrl R9A06G032_HCLK_RTC>, <&ext_rtc_clk>;
> +                       clock-names = "hclk", "xtal";

This depends on whether we decide to provide direct access to ext_rtc_clk,
or through the system controller's clock provider.

>                         power-domains = <&sysctrl>;
>                         status = "disabled";
>                 };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

