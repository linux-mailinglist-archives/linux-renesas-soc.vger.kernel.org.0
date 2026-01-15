Return-Path: <linux-renesas-soc+bounces-26858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B91D24A48
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 14:01:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34C60300815C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Jan 2026 13:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71C439B4B0;
	Thu, 15 Jan 2026 13:01:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8245239527A
	for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 13:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768482066; cv=none; b=BGANgHjWngip8a2NwwTloC7zOwpNoJ10NI7cwiMlJ+hhIRexZRNieXZNYbWlj7X592ubmmxjuVB1ErzbkP0KBAjWMGFGIlM9nDy1BsNYIJ8VUmdcfa7Cpdra/Da+4SMQx8ZVmjW6Ns60ptCCOd3wYMYbqEzmbkajoxQJwcTNgls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768482066; c=relaxed/simple;
	bh=Fb6cfrlDYSTdVoKacM7aiIt44RbJJ9yXtiwK/Pb98Pc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LBEqm2pRu56/7t/Tb+HDWsTeW9JxgXBBuuWvxSndxS4NaNxNLfvOwoVzkxox8b3IJNF4CO/Y8KzJdzB4+RvT7u3ZirWCspDFi/jh4pOHBkF2OwRIRJCLqbBTnWQwyK09pjRZ4jyLdug15nT2u19otp/8oi3yeM2YGnEfGVJi9tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5636470c344so664492e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 05:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768482065; x=1769086865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m5LfkH5b0Cd4aXVhitL2lfRzadsZBam/RVDEkq/qT48=;
        b=sfxY9U5R8m1LLzktKB6Fae4OA1y5JvPH4PE0ZvPG5tQcw+yxamlnNOPis02v4FCh8J
         kcxEV5JxdYYRl4gm5T8rpLf6O4bwTeJXOpkNNJ+Z51LJ65iQYhAui3ap7kHV/1/zdvns
         qXAmMm18WZUE9+FqL616nyrSwlosvJE7U4VLsAKHTGO6oNmXOor5Arq6qhDKe4mLWlOE
         dbBxs6nUD4ws8z/qvYojM8HDOknO40sfgIgiJ1jpYsKySONhXbMWL+DB+/F93PLvkEdt
         L+5AD6SoM8utYZYiutjSNCZNm4oykcPwlJjZEU/mazCCDT+1Li1nasPnizCu7Jkl+A8+
         Nm2A==
X-Forwarded-Encrypted: i=1; AJvYcCVtPToZ5cGwVH2gJhymJ9NF6YJvuh4heUexnU5D/CB+hnC3mOZL4xwDuxRg9IjEoHvw1iRsEddGA11ha93fgJlHrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1pq+nw/ATJVrEyYUWpGFt4c3QQRz8pCGtwy5KKDx1OtR/afO8
	IoOaJ8sJr44gE6Kx3KZudTuUuVFBxi4N1d9ZSMnQ/gaPXJjS5OoYq1bHMbmdz0+xTVA=
X-Gm-Gg: AY/fxX63k5U6/qy+8WUS1jTe4ODC9yHLJzR0IjtN4sLl547Fu39IsaWfCsq/86vfcav
	kQVuQEF5sfdRKuLc4ejlsE9XGJ3HUD6z49W5aBAhNtL/uy3U2um8g5Do+sfeuUPiiIGXJMV6Smr
	keItewH5v2/kP3izMGMXD7lPWo2Y//TogbnYUVujGMUhHRDLz30tvsZ43HjKhIX+atVg91Ngkf2
	ja3c4bF2m0rMmSEMGHH5Cez+ILqUWdp79xEFQHqWHczoXRRKUlpLE1u4K9HvCw0c04qFB5syGkd
	mMsqBIZwJlS+6Av1JDiLw5vNnYixeSvBaNuoDmB5131gxdFCgh14Pv9OmSZriNlQZ1cu/KlMNce
	tI4rIYCanlxEciJn5haBu7LpKisgHKRbXDS+3IkUHoRPI+lCLQUQwIZK3NJEnFjoh8dGap4iR4T
	tOVd0Kam5VpQFqTm2S1e2ReGPcQHBdiuulODMC5qq0xyvkDz8HB7Bu
X-Received: by 2002:a05:6122:1d53:b0:560:2368:191 with SMTP id 71dfb90a1353d-563a09d0397mr2552310e0c.10.1768482064297;
        Thu, 15 Jan 2026 05:01:04 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com. [209.85.221.173])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5637f6ce00esm13756068e0c.0.2026.01.15.05.01.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Jan 2026 05:01:01 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-563610de035so670221e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Jan 2026 05:01:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVBFOi8hzgGV9xFk5GIWfLMId4mhY26E/tXk3YHsOvP2h2sDZJmIIIApFZ3b1CxDaSyI36eM7Nyr2lxyIFFfUNlg==@vger.kernel.org
X-Received: by 2002:a05:6122:1311:b0:55b:305b:51b5 with SMTP id
 71dfb90a1353d-563a0a2026fmr2362086e0c.18.1768482061472; Thu, 15 Jan 2026
 05:01:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-schneider-6-19-rc1-qspi-v2-0-7e6a06e1e17b@bootlin.com> <20260115-schneider-6-19-rc1-qspi-v2-13-7e6a06e1e17b@bootlin.com>
In-Reply-To: <20260115-schneider-6-19-rc1-qspi-v2-13-7e6a06e1e17b@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Jan 2026 14:00:49 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHwqBrNMQTO-g7yUA_owWXxT6bPi34Oxjt-J7N0Q2CXQ@mail.gmail.com>
X-Gm-Features: AZwV_Qj-rtbfaLket3bPJJXXpuT_68XztGQx-eBD01J-7kSXq9lOwz27T9URfFE
Message-ID: <CAMuHMdUHwqBrNMQTO-g7yUA_owWXxT6bPi34Oxjt-J7N0Q2CXQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] ARM: dts: r9a06g032: Describe the QSPI controller
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Vaishnav Achath <vaishnav.a@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Santhosh Kumar K <s-k6@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Miquel,

On Thu, 15 Jan 2026 at 10:25, Miquel Raynal (Schneider Electric)
<miquel.raynal@bootlin.com> wrote:
> Add a node describing the QSPI controller.
> There are 2 clocks feeding this controller:
> - one for the reference clock
> - one that feeds both the ahb and the apb interfaces
> As the binding expect either the ref clock, or all three (ref, ahb and
> apb) clocks, it makes sense to provide the same clock twice.
>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -66,6 +66,20 @@ soc {
>                 #size-cells = <1>;
>                 ranges;
>
> +               qspi0: spi@40005000 {
> +                       compatible = "renesas,r9a06g032-qspi", "renesas,rzn1-qspi", "cdns,qspi-nor";
> +                       reg = <0x40005000 0x1000>, <0x10000000 0x10000000>;
> +                       interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_CLK_QSPI0>, <&sysctrl R9A06G032_HCLK_QSPI0>,
> +                                <&sysctrl R9A06G032_HCLK_QSPI0>;
> +                       clock-names = "ref", "ahb", "apb";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       cdns,fifo-width = <4>;

<4> is the default, right?

> +                       cdns,trigger-address = <0>;

Where in the RZ/N1 docs can I find if these two properties are correct?

> +                       status = "disabled";
> +               };
> +
>                 rtc0: rtc@40006000 {
>                         compatible = "renesas,r9a06g032-rtc", "renesas,rzn1-rtc";
>                         reg = <0x40006000 0x1000>;

The rest LGTM, ignoring my comments on the bindings:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

