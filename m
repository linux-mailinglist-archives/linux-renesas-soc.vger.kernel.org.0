Return-Path: <linux-renesas-soc+bounces-24252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A14C3BA60
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 15:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B39FC56305C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 14:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1C0303A12;
	Thu,  6 Nov 2025 14:09:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166AA230D0F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762438149; cv=none; b=R/xVnC4MMWzhs0bbNezV3vJwgU8BijDJ8xKtYcnHtcgX9dMDRZIa2/tg/c+i3v4Jzxpx886C9Chq0nWfoYWhf+oEBH8T1C6hUE37ERTRCUdnYMvPTKIQC614bSUv1IyddOt6pdMBvOHF2cWTovjorWMbgxhiViguiDQbPPzq2HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762438149; c=relaxed/simple;
	bh=mHmb1VB9qB/vGEkXjmWNrkSJpxIgCAhoKTnr817fja0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQ0wmwrIriUdXzu8Pq2ZNmcL1uwlogAr+LhyavcmpAfqZmypeUzfmETamT10+EZ0Gx3NCuCtk/8DM49kxCxg8nyEZjHqzfrZ0QG7K4UiplFOQi78MxZfn5ZoD93N+bPJGMkTNocQmvKjcUaftwC7t3JnOQBazCm+MhqWM6caWLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b729f239b39so69161866b.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 06:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762438143; x=1763042943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lizrVusrsLOAQyowXz5s1Qp7I158lhdEAu4sLj0s0D8=;
        b=TKBoz5SrgeUyINHwwlztIjig7Tk4zTLIVB96UdzYA+wdY8u0hSrsoU5EXatwk6+w/b
         RNH0TygMtkuTlPPvFdpXUBPsc9KcU5fiF5UBuw8YCXXxCIvf3kmyDiwyoQYJ2yeC04vZ
         EjKqTxiL5Th8dlYP17LlAfgaFVY0f+DMAV77cO0LP0IM0tTqWwOMDiOaPdLutlYMtrve
         FuQkZjKmQptHJVdinwxt85/U4UoDX+XZqcX3yI+QszueQBw38ktrJNdfvjIpBjC7+gDm
         TVk7/Qu1LzhiskY0gPsKVbrzLtej9u3oXpuFyoSfSj6SWrJK9/pyAaGphT9xuKF9OXQF
         sGOA==
X-Forwarded-Encrypted: i=1; AJvYcCU0fnsf82Fj7Tf6zCfkwHDKI2Cp/H+dhbbys/JM1jAKL/oiqz0JXOT9ZhUDdMtYpuHrP8VgtSVjmiLGjVB7XyoMRg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzs2JbwtHEnI7H7FxRUyz80LxdjrdELDLRC/CSfZH4zulTHjWq
	zOCNNJq5ynMQ4Th0dRoieLEryDMYhh5+GhASJcy7JkR4HC8NFIYbSH0JlXpCKv+4w8A=
X-Gm-Gg: ASbGnctqli9OsFYSxXwV3on4OUrt42crUPzbLH8BOU2VHMnmAdtJgXS0+ivL3tfkEYu
	KEaRZjpRiZiWruD/UofqdCFidcKjfqgqy+tLf6eQyHR5KYnj0T45xogCBvBOVej9JEGu3e05hQq
	3OSRAm7L6wbrOmv9OXnn3bCCcNqSxfF86VaKFNuJiR4XNRZfuiFdfnBgntoTRGV3+yJ0Tql7FOt
	QEEi4jRComIrlZ5OvsEiTAizKkpWD8G7EkjRHhXO/jXgussHubIi2DNPlzJMpptDXdYJgIAA1+X
	L6wcKYrRu7PmpylZWVGEfV1r/tuWoEfb4Cd5Kz63uQ+8A6499t+OKFPm/q696oKo2OO9HaxV88J
	EVX2dhX9BeNbELDXqGXK27n+frWIUTq+UY+N2xtH530sprrviVlyhaXbaHCRtcqjYqcZe39QJc7
	7IUkdvXC3PKRf2/vX86lIdhIjJLCiM2fg5ADeLxw==
X-Google-Smtp-Source: AGHT+IFYDbLuBJrg/0sDHETbhpNPRw6BEH/jhUQR/3bFQs38xmIt9gtPMAwuEZ+bjKIZkbjzwyzK1Q==
X-Received: by 2002:a17:907:3d4c:b0:b4a:e7c9:84c1 with SMTP id a640c23a62f3a-b72893578ecmr403088866b.7.1762438143286;
        Thu, 06 Nov 2025 06:09:03 -0800 (PST)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72896453adsm221105366b.44.2025.11.06.06.09.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:09:00 -0800 (PST)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6407e617ad4so2096481a12.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 06:09:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJ96BjFllhqI5WtXJqPd/c2kC2+aVhUe84Xow15ofNRb0bIf5r3rlHbQbFwCjgZXpoxPj+vlnoEYCS9lzcFBP66A==@vger.kernel.org
X-Received: by 2002:aa7:d343:0:b0:640:931e:ccac with SMTP id
 4fb4d7f45d1cf-6411d17972dmr2555913a12.7.1762438140350; Thu, 06 Nov 2025
 06:09:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105232737.1933437-1-niklas.soderlund+renesas@ragnatech.se> <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20251105232737.1933437-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 6 Nov 2025 15:08:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWGZa6E_Yu-hF9O6yi3rRemWnFdkUeKg3SucqmmLFUUAg@mail.gmail.com>
X-Gm-Features: AWmQ_bmyVoqHrTmXlpr1ElP362H1OrWvK3sMuHRjQlEwD_rKvK_e3yJJeGhG1Kc
Message-ID: <CAMuHMdWGZa6E_Yu-hF9O6yi3rRemWnFdkUeKg3SucqmmLFUUAg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a779a0: Add GE7800 GPU node
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Matt Coster <matt.coster@imgtec.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, 6 Nov 2025 at 00:28, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Describe Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A779A0 V3U SoC.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -338,6 +338,23 @@ cmt3: timer@e6148000 {
>                         status =3D "disabled";
>                 };
>
> +               gsx: gsx@fd000000 {

Please preserve sort order (by unit address).

> +                       compatible =3D "renesas,r8a779a0-gpu",
> +                                    "img,img-ge7800",
> +                                    "img,img-rogue";
> +                       reg =3D <0 0xfd000000 0 0x40000>;
> +                       interrupts =3D <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks =3D <&cpg CPG_CORE R8A779A0_CLK_ZG>,
> +                                <&cpg CPG_CORE R8A779A0_CLK_S3D1>,
> +                                <&cpg CPG_MOD 0>;
> +                       clock-names =3D "core", "mem", "sys";
> +                       power-domains =3D <&sysc R8A779A0_PD_3DG_A>,
> +                                       <&sysc R8A779A0_PD_3DG_B>;
> +                       power-domain-names =3D "a", "b";
> +                       resets =3D <&cpg 0>;
> +                       status =3D "disabled";
> +               };
> +
>                 cpg: clock-controller@e6150000 {
>                         compatible =3D "renesas,r8a779a0-cpg-mssr";
>                         reg =3D <0 0xe6150000 0 0x4000>;

The rest LGTM, so with the node name and sort order fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

