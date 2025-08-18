Return-Path: <linux-renesas-soc+bounces-20629-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F94B2A83F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 16:02:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC0B0585FEC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 13:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53A8335BBE;
	Mon, 18 Aug 2025 13:51:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FCA335BA3;
	Mon, 18 Aug 2025 13:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755525109; cv=none; b=km7oEZAcvIN1001d22tx8nbXoljniV6CM2jfItqYInmE+l8jyZT9uWEmJtW1xgXo0LWijt6Ug128cHkY/dGCSNAi9ru/sKmgIqHe2VQ9Pg/DRVW8KrKySW/cXH0ICP9Vo/5ZtFg00iqIKWozVqogBVd3ztx94JuMiFFfh1xvAe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755525109; c=relaxed/simple;
	bh=TM3v39gvv9yVUxNSjsGy0cb0pbFWdamF+PyxThgcsVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SHRtlhvYuj/26inzbVDZk3Fq3jOVen9fqqlliiaGoshROA025Iz7SC+LKfe9hf6itSiQRWnsoz7A8oH95DopTMBAY0+1A9lYbnRJ9zyV2YFDZSu8rOkDyh0YFZmoH0bQ69TRleDIxwBRWQXZKEmbCToxBOdHjihHDGqjBmHbTZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-53b1be89386so1331075e0c.3;
        Mon, 18 Aug 2025 06:51:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755525107; x=1756129907;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AKkclQyL7PgodXAxmHrK7kyRV4SuaKqCEVi7cTjbK6Y=;
        b=EyX+2SRPMZbetGLioC1SOb0zAK6N2AJu+iX9kCMelUWHnf4a0+krUUzrIVkOsntjgs
         a+XignvF4baiD6jGXHub2xGb7fKSiwJtT3KoQlOrrU8myFXRBoUtJ7ehuTkZ5egV/gmo
         ib3MasqiYlLCA0RVS6xIgSA2wVI3BSpchbodAO7JE+eyxu8BAw7ML/42K6tzE+POy8jN
         qBbdpa+7vp8D2AtSB3m2eZZkZBB356/MWOb8nicNywc1rFiblvJBHZ+s89ejFrYK2NQ1
         wn5iIMiEYX630+5VY3eDNwn5oVFwvTogRkwEbcLmGJkToWdmqOgeNIeU62U+E0cs81+g
         z5hQ==
X-Forwarded-Encrypted: i=1; AJvYcCUd7wX/5eopfqvBF2z9dXxRj/rIPGPuXGiSO3FCQ648GeHXFZ1cR9svUe5GRSthv5ima0JCtpBHDCsf@vger.kernel.org, AJvYcCVIeAHX7wNwsq7X4vZo+1VEi9KirA81DlKUiFfUxdKG6bUmgxJkU95h7umjPsgy52OFUudvd6NtgTpmBNSr@vger.kernel.org, AJvYcCXXhr02lckAQ82kt12+9N2joONJPALMrXOf7i9sKQwdKKimNq9Jj4STwVyxORS7cR/6Q/rYdC5ks9hiJ3hCdzcfA+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+01Non/5580TP+mJkfGfGSwz/uCvkPQd3FIyGp2K8d1hTQ8+g
	aLr6lNAKq0Fu4VdcJRHkCndqh8S3gGZkd1TbbdLdqE7ZJt/PKy1doQhElNIiXQwV
X-Gm-Gg: ASbGncvNARKvH4JResNQwaS1sLbmwJIZ1SQM/CYtEULY/U5Tm8sVngkTh/rrB+HIbPA
	Df/eWMNex05+LcQLsFHHpIhoVjqLqIUc5X2M/2GheJ6xLFbmKVjpG83Zxvu5FivnCfEwJ5wvjEc
	u9y+nhQMpE3b+BSTnLvGFLVKCUpY6LdxaiXDSXazAGpNWbhXWI67UanQZKgKMoV/mQVN8l2SHn2
	9ytrEyXfvJZTzmqhkAiwYVmzyF8wEuWtUns+a4KDHpf/hpdGg5oc30QSU6sfYEjpSNzACD8Kj1c
	bXfbNHjyFDzlIy2aY4PuO0nVgpdFbR56FUSCrGsvsHm89cAThJSG368mDJ0qXxp9wXhEmeaFU1J
	M/GTVdBiuPAZN2vJ2IALP2R+O9LVq9/qUzpGDj0yohaJoDqLGFv9kosAZjHKufryMx6bBaic=
X-Google-Smtp-Source: AGHT+IGznCOKOhSCL22o+0Q40UP71FEaVbM0mKlewj928WEgi2IgKJzUpQBHEuyyElf6QG3s/bZfAw==
X-Received: by 2002:a05:6122:8284:b0:537:b2b6:e387 with SMTP id 71dfb90a1353d-53b2b8551a7mr5158912e0c.6.1755525106754;
        Mon, 18 Aug 2025 06:51:46 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bf216c1sm1891916e0c.31.2025.08.18.06.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:51:46 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-50f85ec0885so2910762137.0;
        Mon, 18 Aug 2025 06:51:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWFhvKezA7HMemH82yIaHxGKQcVO7eV8kJnLewEKNrvu9FvvcCKrImjdOM5S+G+vxPLWxhw6cp08f0F@vger.kernel.org, AJvYcCWKfDqv2vmt2WU8ql+tda4yPkRXocseWOk29/YaKymR0VeWDguXfZGXuuBEphHRPafqJiqQN6pfhYBtGFqB@vger.kernel.org, AJvYcCXqbfN9FXWYT3wB69EZFVqRldgJ/bLuCHBWl+YFBM/mra0jz9XmzlIuYDhYdvJodwaLKvmf1Bp8l2tMF8KC7R37nrw=@vger.kernel.org
X-Received: by 2002:a05:6102:5114:b0:4fb:dd4b:26cb with SMTP id
 ada2fe7eead31-5126af224cemr4478475137.8.1755525106193; Mon, 18 Aug 2025
 06:51:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250812200344.3253781-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812200344.3253781-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 15:51:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRwZ6PNt6LDi-NZWiUH_eNtw026UscwF9pZTjObVU6fA@mail.gmail.com>
X-Gm-Features: Ac12FXwTFbY67CZU_pBaw5fN8TBnQVJcI80UHicbT-cI2JgQVmsmIDDqGz2FS0M
Message-ID: <CAMuHMdVRwZ6PNt6LDi-NZWiUH_eNtw026UscwF9pZTjObVU6fA@mail.gmail.com>
Subject: Re: [PATCH 09/13] arm64: dts: renesas: r9a09g087m44-rzt2h-evk: Enable
 I2C0 and I2C1 support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable I2C0 and I2C1 on the RZ/N2H evaluation board.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts

> +       /*
> +        * I2C1 Pin Configuration:
> +        * ------------------------
> +        * Signal | Pin     | DSW7
> +        * -------|---------|--------------
> +        * SCL    | P03_3   | 3: ON, 4: OFF

1: ON, 2: OFF

> +        * SDA    | P03_4   | 1: ON, 2: OFF

3: ON, 4: OFF

> +        */
> +       i2c1_pins: i2c1-pins {
> +               pinmux = <RZN2H_PORT_PINMUX(3, 3, 0x17)>,
> +                        <RZN2H_PORT_PINMUX(3, 4, 0x17)>;
> +       };
> +};

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

