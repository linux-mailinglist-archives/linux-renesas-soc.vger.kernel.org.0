Return-Path: <linux-renesas-soc+bounces-16983-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB35AB39E2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 15:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98680863A6B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 13:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8245C1DE3D1;
	Mon, 12 May 2025 13:57:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7B71D515A;
	Mon, 12 May 2025 13:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058278; cv=none; b=pVVZscLECSZuW4I+m80bJOC3WWkFv99PDzKLrY2JDBlZgTn9EeQXhWjnOVpe19YuBwNuIP68+tH9cnN/Qn783fMkoGkeHLdjVL5yreEKOv8J4uRy3DGtZMIjKnEXQhQvf4Jset+jZ6DCFXKm5gOOOF6HNUZBu4fVGJcH+/S65BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058278; c=relaxed/simple;
	bh=Z6jMjE1t5RYVDM0B4EUWi7DiXy2a8XODml76LIEZWKI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F5jqYhS2TJ4WkIMl63BWDDonVVGgLmRf9q/Z/geW7O7zgBCDzd1kYPR07y3dS6+1GoY2hD1fS4G9z/rT+AHtX92JWf+kuZOLcca3jl5BioKOfAP0n2EPg6Knx/4SuA/h/twIZSBin7JWoe3hnX4ZR8/P+ISix96fkzQyYnDhyVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-878627ac2ddso1084691241.0;
        Mon, 12 May 2025 06:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747058274; x=1747663074;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kJi5+v3afPRHEEqTy/hNjhflaANAWOls6+TF20g+SQ=;
        b=lBctvNbI5jgdKCyC5M5n6Wfp1XbXaOyYsRIgdght0MhUJZN+cnnuIDGVcU89v9XgB8
         eSBXawIU7/V6LpwLJN7DyBq/vfwojtlREYnvZIlRyuqxXgX6s+podfbfAYjpjhC2gLgW
         CG/Liy6Y0vjfumRbmCZECe7df2Et0wt+szN/QoGXzEGZWaan+4oyn5XKB12PmvUZ0jSR
         5eo9kapTHEtuO6xBA5WTCIh/+u63OowmjQeVemwuf/vu4lxTEN/9d9DHa/DLmJRPpdh4
         tKKAMstW1dMMggXG2vkKjGmjMWfsNCUYYpfk2nZ6ERMiVijUJx9bm6aKvYmjq8miMqXT
         qj4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWuj2KSoA0eTfnCQ7igrvIFA/LpKm33kU7tmkB5O6WPx9gizVIX3XKYm60NLMo/JA5QsTmiGZXcHvmF@vger.kernel.org, AJvYcCX8zlx36eERRXAPZk+cyXCWbsckbTouSuA71oxzlFcfuV9e3yuHnVbrpKxtzQnEPV+TiilqeF4TRVsi2V5F@vger.kernel.org
X-Gm-Message-State: AOJu0YxGH3Me2KTVbOxXy8WTeu1BNTLKeWsCFL9MrN866AgVV023W0cN
	fAEdZwyDFFZPO9rNFgnvO4cOxp1eYS73RTjIoknaEWOHfl8Gviutl6dXuItK
X-Gm-Gg: ASbGncvFg/eP5z2mFxyrBw6OjTueIZESl8o4cTyQXk4NngHQ3jaeQ79Gtk9aXUqEEuS
	x4nDmnvvGbKA0fUWUywZhFPDx1i9XZAzCSJrzQvANhXtf/sgg4DdRq1Lof2vB6To8NvmTkNHAh8
	KYDWBpo1ZQFK1TdQxzI0SOEXXjGMqInFXfdm9+rhUG88HauxorYISCusfLQtHFdTV3fdtO4EfmX
	hcuY8ex0VrqfcwUNJLgzNLqpGcn3Ja4YIHQRKbM/PewiIVXW7MY4h7Du6JrbUpAANwf/wtAZ8Wa
	hYmR9IbAN3XURv0r5GMFwPjunDtu/PUd2AIcEBWQDEttHStw3rveUsAS3fYSr2y9IijtHx/SNgU
	ALuoHhxeOwW5e/g==
X-Google-Smtp-Source: AGHT+IEuJ1d1wpDqhMC5AsCDX4e67NWQSw+p0VO5xwhXEjcPTTdnjycA0Pt6mf9b8VIuvDENjgTQPA==
X-Received: by 2002:a05:6102:4a8c:b0:4da:de8d:9e34 with SMTP id ada2fe7eead31-4deed3cb965mr11255480137.19.1747058273880;
        Mon, 12 May 2025 06:57:53 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dea85df68fsm5015662137.18.2025.05.12.06.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 06:57:53 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4def13d3f01so1168495137.1;
        Mon, 12 May 2025 06:57:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUHZ8UMPKjUxYof72gG4QPaTMMUARvch+SAH2WvSunI8U7sl6YQUfLm3kt6WsHGqyCVbXmH05U61LL4@vger.kernel.org, AJvYcCUKMd1aC6GptDJmVkRoiWYqPcZlnaWk93aKEolVTR4NWVKN4pIJFU+KvQ0zHuaxcZr3qGKE1MP01SRmv4ZB@vger.kernel.org
X-Received: by 2002:a05:6102:91a:b0:4dd:b32e:2d1a with SMTP id
 ada2fe7eead31-4deed3e8831mr10308655137.25.1747058272979; Mon, 12 May 2025
 06:57:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512-daily-saga-36a3a017dd42@spud> <20250512-sphere-plenty-8ce4cd772745@spud>
In-Reply-To: <20250512-sphere-plenty-8ce4cd772745@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 15:57:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVwBqC3jHgwLJkLcNZo8W0Aw9ZfoXL1tRaL7B2EpKuWvg@mail.gmail.com>
X-Gm-Features: AX0GCFuHkNC9VJcdMXT2KkXYhqqFctrazjyBihAGbpeEUZz4Xn1jYevzEdCrE40
Message-ID: <CAMuHMdVwBqC3jHgwLJkLcNZo8W0Aw9ZfoXL1tRaL7B2EpKuWvg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: renesas: add specific RZ/Five cache compatible
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Mon, 12 May 2025 at 15:48, Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> When the binding was originally written, it was assumed that all
> ax45mp-caches had the same properties etc. This has turned out to be
> incorrect, as the QiLai SoC has a different number of cache-sets.
>
> Add a specific compatible for the RZ/Five for property enforcement and
> in case there turns out to be additional differences between these
> implementations of the cache controller.
>
> Acked-by: Ben Zong-You Xie <ben717@andestech.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for the update!

> --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> @@ -143,7 +143,8 @@ plic: interrupt-controller@12c00000 {
>         };
>
>         l2cache: cache-controller@13400000 {
> -               compatible = "andestech,ax45mp-cache", "cache";
> +               compatible = "renesas,r9a07g043f-ax45mp-cache", "andestech,ax45mp-cache",
> +                            "cache";
>                 reg = <0x0 0x13400000 0x0 0x100000>;
>                 interrupts = <SOC_PERIPHERAL_IRQ(476) IRQ_TYPE_LEVEL_HIGH>;
>                 cache-size = <0x40000>;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16 if there are no objections.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

