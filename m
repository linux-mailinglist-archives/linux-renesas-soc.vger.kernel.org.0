Return-Path: <linux-renesas-soc+bounces-9425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 168779904CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE58128144C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CF58210193;
	Fri,  4 Oct 2024 13:49:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F590149DF4;
	Fri,  4 Oct 2024 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728049742; cv=none; b=fQmVHy2AZYGrxPcyJdmJu4SyI6OalXFZ8eh6P58k7wtOxcHrP9yiAfQCmK1GMJsvuYa1HSZxxZcFMW2VMcC/G+1LqWckuF1HM8fpRhNv08Yv/DUnUVO8oG4tzVe8/Neht4T/WWpt49j8T1FBWcwkkmWYTsEp5A/pNqj1x/JvTQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728049742; c=relaxed/simple;
	bh=La1RZzqdcgND6v74DXh259u23beHq7OvgMq3wsA7KTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lNZFm/rXlWullst4IGhoYg46xN55OKr0GY/EdhzYJ9yrYTgInkMrhyh8toZP6PT0Yh44G8ROBlq++ZDQlDsyJ23swDjAuIEB3o9vWU3Cd0ygTuaTH7lhxyI6a3qSGFvILBRmmJ5RAySV0TN0FTk46A/g7A4OTerHi7OY+rQyUCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6ddfdeed0c9so18528057b3.2;
        Fri, 04 Oct 2024 06:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728049739; x=1728654539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHKoAwqXulFkGr1s8WuJh0TKfYBMEx3Cq+Dg6W38EIM=;
        b=AV+w3fKp6d9Qkq7KtIsq6dre21YPo9vt61PporPa6azDTmHeA7nfanz1fk1CCYK/2P
         MQueeqzWgOJYfnfXzc7/pFe8M2fVRrui0PZlS6vL0fjmZXxSDc1jfM+NNLf5gH2jBMZR
         +ZMh+aN8zc6MirDNUzk7b5E2/0jy9GQCeHUspe1NqK9aARYokaOM2Z4hffee2aoUrcqm
         dWILjBZwM581Rdh5Yt1VxfoQdHRGXZxFG/NcO39uPZaQ8vnjcoNOgl7Kd2OVJPi5FX6V
         rb+Mx2KHB/A9tCkKWhzSSbBv9d1p2BFUQb5Ll47yMy78300mNVlvrjfUGzlP7F0m2U53
         9YHw==
X-Forwarded-Encrypted: i=1; AJvYcCXj60Cqj++BHpfv6aLimylg0bSDlab5VrWA/49Akn9e4wTdBJSmzsHQeIogNSUi8K0Xv9xHvhOr23yT@vger.kernel.org
X-Gm-Message-State: AOJu0YxS6Mv5xAxkTBVYfWIPx2GZCdhqbrMy8MuZUdAPrVzhNOB+1VgI
	Fwf9s8Z9Ds6OYF/6/qceXkMNotbIyrVSdgT4HRTNUpkDSKAbI/kcC+kJ7PkiOGY=
X-Google-Smtp-Source: AGHT+IFBVd+kUMKXwzUQ7Vndh4oPIryxr/605u3bxYn8YxG0K1cPewWcvjDeGH7VRiL0HByrcP6QNQ==
X-Received: by 2002:a05:690c:c:b0:6b2:d72a:9dfc with SMTP id 00721157ae682-6e2c7289a5amr22640137b3.33.1728049739251;
        Fri, 04 Oct 2024 06:48:59 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6e2bcfb36c6sm6334197b3.117.2024.10.04.06.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Oct 2024 06:48:59 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6e232e260c2so18389657b3.0;
        Fri, 04 Oct 2024 06:48:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+yd0R16/Cwse1maAbKPZTloHZDiJ1L3jnE3W1v6AJ3I8sWjCLAmhj1A73qVE51UqNJnmSR5Lh8raU@vger.kernel.org
X-Received: by 2002:a05:690c:6187:b0:6e2:a129:1623 with SMTP id
 00721157ae682-6e2c729e3f1mr25838597b3.38.1728049738852; Fri, 04 Oct 2024
 06:48:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240928092953.2982-5-wsa+renesas@sang-engineering.com> <20240928092953.2982-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240928092953.2982-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Oct 2024 15:48:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXV9Sbk-rjR3FfwWOsWyaHv3XCh3+XooYZB0Z5tbXY0_A@mail.gmail.com>
Message-ID: <CAMuHMdXV9Sbk-rjR3FfwWOsWyaHv3XCh3+XooYZB0Z5tbXY0_A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: renesas: genmai: enable MMCIF
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Sat, Sep 28, 2024 at 11:30=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Luckily, I still had an MMC card lying around. Works fine.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

> --- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
> +++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
> @@ -88,6 +88,15 @@ led2 {
>                         gpios =3D <&port4 11 GPIO_ACTIVE_LOW>;
>                 };
>         };
> +
> +       cvcc2: regulator-mmc {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "CVcc2";

Odd case. "Cvcc2"?

> +               regulator-min-microvolt =3D <3300000>;
> +               regulator-max-microvolt =3D <3300000>;
> +               regulator-boot-on;
> +               regulator-always-on;

The regulator is not always-on, but controlled through the MMC
CD signal.

> +       };
>  };

The rest LGTM.

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

