Return-Path: <linux-renesas-soc+bounces-8035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944F395BA09
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 17:26:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3EC8E2852DC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2024 15:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6247D1CB146;
	Thu, 22 Aug 2024 15:26:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ACA2C87C;
	Thu, 22 Aug 2024 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724340371; cv=none; b=oRBqYH5fZoLeJGysb8hw06/D7N1jhRqU5tz30XgTlCpOvrlctwXhUbdtgpPnEPWCBRh/2SRU0aNF00R0RVvxHXZ6/tCfZddj0TZdCtKwPxdbRnWfjgQM799fe8xLi96vsS7O8RI1zUlRVkeAjYNQV18kZJ1TtN61K0Pp85xWPpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724340371; c=relaxed/simple;
	bh=m1+rWWJ7yV3CU0sWqRP7z6pUkhu2qCM85IhYkydvA1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GkKC3EKJK/wDf3BkJ/31Z0ruNefMBKahbYiJBobAL+oY/6pC7V37G9TtjcGoun1v38hHW1hEproZHDL1HwUXjHQ02DrAk13hJmHjnVyhc2eRTeGFBGm0zQ2BtCMeR1MuDZsw1yYGUw0WMPCSkbWrA402rg+urg4J0rsBgKJZn9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6b8d96aa4c3so8696117b3.1;
        Thu, 22 Aug 2024 08:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724340368; x=1724945168;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=191j81Yd6sne0wYFlddNBd2+LA1E+9DzGpITjvADgxQ=;
        b=mS64VZsjilDy3P+QCnLGGH5bJ5N8RkqTk5j77YP7h7bsXCQJH8joWDwF8g3gDiLjPl
         MrnoylMllMOFcUEcXdSSqYu83JnLFTQNo/vDGVsCMeMXRK7g563E3Q1TwUPJrS0TaM/5
         wV7e8Gg7zdZSUfC7YQx99GnTdPa/4a2TtkB52BEgMaAqwRX/dwsFmvZpuUINB0NmLGVb
         5xoSwqDX/dWaxOrEhWfy0+dQEIL/pcO65nMcf+Q1LovolJRP0qxcRqffZz6SabOa2U6A
         6634qgT7r75MpfpvNs+GSxv7k+H60cbEV/NVvBs5ZmuU1AmQwB9xhhkOtnbVktK5IcA/
         +qag==
X-Forwarded-Encrypted: i=1; AJvYcCUOYAUYxZtnZvo/8WprnZsfAjwlEEmkwbqGio5ILwAQ+q1Ai51dpSCItyudr4UubJ0MHy3HXwN6ZojO@vger.kernel.org, AJvYcCXhFloS3BhotqMQHnd+tZjVmxS7Iw118J84j1LUzBynkRfZNzObCFe2oWbN6HKloQ8VBQFImhzVKjd6F2H62+N7mhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGyHsJU3gowS59Mrf0wqIRDi4ptZc96pQ6qDu/sr0cuXEXl7Kn
	2kvwUqQ1uz3PzDpkbxbePYrGrloOf3AN6Bp/8P8XlMBdhFjy9rDupnqeI2wk
X-Google-Smtp-Source: AGHT+IHpmN9/V/4fyu9+q1Y0MOhizRuL2+Tqs+HnAwPzSl2Jrtdt/Wcm5AYxRYmC8TsEvokwwg8zdw==
X-Received: by 2002:a05:690c:f94:b0:66b:8443:e843 with SMTP id 00721157ae682-6c09c1c01c4mr83249627b3.7.1724340367850;
        Thu, 22 Aug 2024 08:26:07 -0700 (PDT)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com. [209.85.128.173])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6c39e500a79sm2433567b3.137.2024.08.22.08.26.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 08:26:07 -0700 (PDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6c130ffa0adso11157787b3.3;
        Thu, 22 Aug 2024 08:26:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWHzTD+qaz5eNMfS1Q1IKtdjESXc3yGyRinc5iunNKC7v0+dQZWTqDrg18ZCB2xAqZ7ixtgSlqCyw8OEQBKViMvSVw=@vger.kernel.org, AJvYcCXrZQ9/tDUqECeelkv0p4dskIE3XspIoQDuQCF1rJU/8Pd4R4LWwDiSm+lhzE6T6eI0Ij1uwhp4+Yd6@vger.kernel.org
X-Received: by 2002:a05:690c:5292:b0:6b2:28c3:b706 with SMTP id
 00721157ae682-6c0a0ae87a9mr59467997b3.34.1724340367154; Thu, 22 Aug 2024
 08:26:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701145012.2342868-1-niklas.soderlund+renesas@ragnatech.se> <20240701145012.2342868-3-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240701145012.2342868-3-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Aug 2024 17:25:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXctKKr2dKfH5Y=K=LCjkSdZ-ydxq54NVtObvd571SuPw@mail.gmail.com>
Message-ID: <CAMuHMdXctKKr2dKfH5Y=K=LCjkSdZ-ydxq54NVtObvd571SuPw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: renesas: white-hawk-single: Wire-up
 Ethernet TSN
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Mon, Jul 1, 2024 at 4:50=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> On the V4H White-Hawk Single board as oppose to the Quad board the
> Ethernet TSN is wired up to a PHY (Marvel 88Q2110/QFN40). Wire up the
> connection and enable the TSN0.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.12.

> --- a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
> @@ -24,3 +24,54 @@ &hscif0_pins {
>         groups =3D "hscif0_data", "hscif0_ctrl";
>         function =3D "hscif0";
>  };
> +
> +&pfc {
> +       tsn0_pins: tsn0 {
> +               mux {
> +                       groups =3D "tsn0_link", "tsn0_mdio", "tsn0_rgmii"=
,
> +                                "tsn0_txcrefclk";
> +                       function =3D "tsn0";
> +               };
> +
> +               mdio {
> +                       groups =3D "tsn0_mdio";
> +                       drive-strength =3D <24>;
> +                       bias-disable;
> +               };
> +
> +               rgmii {
> +                       groups =3D "tsn0_rgmii";
> +                       drive-strength =3D <24>;
> +                       bias-disable;
> +               };
> +
> +               link {
> +                       groups =3D "tsn0_link";
> +                       bias-disable;
> +               };

If you don't mind, I'll move the "link" node before the "mdio" node while
applying, to match the (alphabetical) order in mux/groups.

> +       };
> +};

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

