Return-Path: <linux-renesas-soc+bounces-17186-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE84ABB738
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 10:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3789F169697
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 May 2025 08:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF73269D11;
	Mon, 19 May 2025 08:28:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6DF244677;
	Mon, 19 May 2025 08:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643337; cv=none; b=fKZDlrtwFgWupPtt/nPHGgDyfC6lU/v55YRYCEuKBYwpl//8OcZhBCFVhF5vq+PXC4u31OVQBzaNFpbnxY2kcYAWonhDf/K4s2KDSNhhSedRqU9uDdcvvxfblYuwCzilSfjNbwtHG/dvRvEujVwo+pngkt4IEUYpfkSHNCuFVDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643337; c=relaxed/simple;
	bh=UWFbPyytxweRaEV5wkVpnTnFztvjndqSlq4xyidb3vE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQQ8pihS9iGUe6bPeu4CpJgQEP4JE8NMKx5s7wzCZBmdAWjiRxCYDXifbtpv5viQPris+xOBT8OGZzPH1sldiY7daAigGpBmN1IJD9e7PYYeibc6mnFlQD5HUF99FuVXUF51SEq1JEZClMUoY9NJ9tLP+hIKq3fuo1jHQRy8OUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-87bfec852f9so1220014241.0;
        Mon, 19 May 2025 01:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643332; x=1748248132;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sG0Vgx6eZvZ1zn29nJUshiE+mwvntoTIRVn0XAt2PWI=;
        b=jS7BAwQWpyFnY3Cb5/EJUMr1oqhSI2GsKWjpMOiCJKcBNJvRTy2/OtBWc3MkTGWIOv
         hnl+ECiiMTNk9Q20aSPQz/f03hNkNPUmjaerAZWXn3Pum4a3/cokmxD1f493bappMG4K
         jYDyubDfh7yhv4mVB66W1TBGcUPauUDwsQu8EMRAqAIZ3PejXd9X5LzuViKTaDwQZCUs
         SdKT4rp+Wct6U/YTmFiVn6lRa7dKbzJXw8/545j8S6/7GaZGy5/t60wUmHu5KwFl2FGF
         Cs+Rlm3PzWQlEyRsL0kO+k4G9EJyeAe94vSwKG4BNV/yXCDkdeJxvqtpI2/2x1JkZ3fk
         2j1A==
X-Forwarded-Encrypted: i=1; AJvYcCUvIIa0sjKpjWdmx8ojl3K6gXo+eIRP4b5nRHyLVx7dOXXezK1AKvmwNig/iHTSC2FXHucxDarOZwk37HvuNW0FZbI=@vger.kernel.org, AJvYcCVadWC/K235+F9f9UCK2fnjHzlC2SXF3bucAjLpLy7pPj8FROfMfwA8SY2ozxGH4UGcNOkn82tQTIUG@vger.kernel.org, AJvYcCX+WS8wQQneRUdzHUZbylN3dvqT5VUO1AOB3TsiEyOZ+SOQgP1bdTn2CSS0gVNjlyWLLWmu/jiR3jQP+G9B@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk33w9vmJYyOW3ICoj+DCg6+/u8NMD04d7QCXyupZsfyqprNIC
	3W+hT/wd0yDdTkn0Fd9bH/7YCrwGWgQt+IYHr+GS1IUaDKaFO6A6tBrXTeCTNqvb
X-Gm-Gg: ASbGncs+aKxYYojMoaL5ystAln6REk/AApXqk0ik0majNewnS4lOAEUXTahKzZsSbAx
	u3EB6km2uUsyFoe5ojyalgR3vNpeC493R5AQTt5HOp17gnNjayL6P/rpP8WNp2ilZX0CWyyTQVl
	a23O/KaQq1DGlMqZ4mhyN1qasrHsW21tAXHogE/LUOH2Sv4JmYO9fXWusx/RTK9r9Ef29NgaZAr
	7vu7cNlLlDl1qD8q0CX9jd34UFwrt7pprVWRJKiTPTVQeuEwYYmuSzazyC531La8xkx7KqqTrY8
	cjWP5fRcW4A82Ug7VD95AXgSBM5qJSHcp567Sn3vCuQjGDgOzAr1dGnyel3HnyA/8cWse1Maw1X
	wkgQlIpxiCUVa3A==
X-Google-Smtp-Source: AGHT+IHOgcZByLNb8GrOk3mHRNnGMER1afEd+bdr06Wvig0w3tFJDFIEO/6z0uNrjs4b7sE5Up+1iA==
X-Received: by 2002:a67:e916:0:b0:4df:9aed:3114 with SMTP id ada2fe7eead31-4df9aed3425mr10721325137.8.1747643332554;
        Mon, 19 May 2025 01:28:52 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec228c01sm5481665241.33.2025.05.19.01.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 01:28:52 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86d587dbc15so2987588241.1;
        Mon, 19 May 2025 01:28:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYTT3q8kyT1sTkM+6ZENekGBGeIC2MrXjT/3MIGMjUlVaKrXNBCVJhxsin4v7wjAUzmCUC/+zGBMwAZbuOaAdGz5w=@vger.kernel.org, AJvYcCX+tkk8VugKj9Dy8H3pQA64vzXOmgh+dxREZQd3WAZDEgIHQENW4IxpLcWT7xilNBeaKQUF66AmzlLG@vger.kernel.org, AJvYcCXuAZc4hMjFJxK5gueqpBp769UjIcsh1KPQn+kIXSriXy8Uvv/WFm8ZTbNS8A/k9XVRMovawNfIPLxBShHt@vger.kernel.org
X-Received: by 2002:a67:e99a:0:b0:4e1:1010:6d88 with SMTP id
 ada2fe7eead31-4e1101070aemr6078294137.1.1747643322070; Mon, 19 May 2025
 01:28:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250518220812.1480696-1-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20250518220812.1480696-1-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 May 2025 10:28:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX3tmRsWH=T76UESxPO59uG=8di72FuSsV__hHNsmw_CQ@mail.gmail.com>
X-Gm-Features: AX0GCFuiis1u2ELfiUv24ok_PJVWF78OrNSCHzKyqOXBijoCAr6Q7CPbjRDUUIA
Message-ID: <CAMuHMdX3tmRsWH=T76UESxPO59uG=8di72FuSsV__hHNsmw_CQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g047e57-smarc: Reduce I2C2
 clock frequency
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: geert+renesas@glider.be, magnus.damm@gmail.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Mon, 19 May 2025 at 00:08, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Lower the I2C2 bus clock frequency on the RZ/G3E SMARC SoM from 1MHz to 400KHz
> to improve compatibility with a wider range of I2C peripherals. The previous
> 1MHz setting was too aggressive for some devices on the bus, which experienced
> timing issues at such a frequency.
>
> Fixes: f7a98e256ee3 ("arm64: dts: renesas: rzg3e-smarc-som: Add I2C2 device pincontrol")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
> @@ -85,7 +85,7 @@ &gpu {
>  &i2c2 {
>         pinctrl-0 = <&i2c2_pins>;
>         pinctrl-names = "default";
> -       clock-frequency = <1000000>;
> +       clock-frequency = <400000>;
>         status = "okay";
>
>         raa215300: pmic@12 {

Can you please clarify which devices on this bus do not support 1 MHz?
Or perhaps this is a board layout issue?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

