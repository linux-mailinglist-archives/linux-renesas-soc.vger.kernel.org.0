Return-Path: <linux-renesas-soc+bounces-21125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9B8B3E695
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 16:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A30DF18838DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 14:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2703133EAF5;
	Mon,  1 Sep 2025 14:04:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727F11D61B7;
	Mon,  1 Sep 2025 14:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756735445; cv=none; b=lxXr4q7xaif4gC0EAonX83ndoa5fTrQE3bVczJ2Ysm4q8N/phvkkX4x8urFoCBUMvSUYMzlFvyGNpR39FGw9SDgF4Pt7cximXRgcmDqRGTCAIKaJeut2zwjuZoCOcYOrWaajpQkt7WxWLcaM6nUy60JdiSR3rwCyzekrg76S0Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756735445; c=relaxed/simple;
	bh=yPOX6WomI9n5O+/vHyOaMmHiGhds1c8OH2bM1SDeIZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p086RDy/mCca0XtXM9UP9vSpHljzcLLumjdZTo3dnQYyWWflVg/qlWk6dBJWyJd7XuZ4dVMCmQxhfTM0drQGfgglN2oCfcukfILjQ+51TmwkxtKqhfZ1CrwriEoY/1dGtMqzCCPAexxZCgVXdGc7yMNFzDU5JJ3aNNfo5FNpF/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e96e892081eso3391223276.3;
        Mon, 01 Sep 2025 07:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756735442; x=1757340242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VhestZsri02gDfPQk+gUxtvkYAG5NOW4q/0J5/W4Qbk=;
        b=ZNVLUgmXranHp1FrsdWsnnjOHatZx8i6FO02QhftPf/xOuyF0JTs8hpa/fuk52iMxM
         4CKBAKOiZfF3p1Dezkr3hsNgOegAOXBJ2jJ7jSuJjP11ZBGevOmvl/eolPYWjM2o32Ca
         bbz6hgpTqyQXfPj+1taigTCqjcpwzhOQLVSYuMoldjSqY65GiFbw6BKPxcExQxyO8GC5
         Gxav1A+zTOfqiBLAhYDqWF6dV2nB5LLIbrDtoEQQSmPdlXASmqRM4yBO0s1Y646ykZU9
         wErqnwX4akcT14n9HPpSWCX8bsp7fYAFqvDlj8Iob4H0JnNHwIhtRcOa7WkllLyqmaW7
         ji7g==
X-Forwarded-Encrypted: i=1; AJvYcCVZUgc+eSRw3YT6yHybGl8xZE3hJdEQPcDXqQpBXH5ntAmv7biXN83aACgfj+b+zIyaWSpTpIblHUfRBQnVl+gGG10=@vger.kernel.org, AJvYcCX3nI+KMA2aSGLCigB20ePKLMzvhCxGbcR6CY5iNluy6WSGNEYtn3Pdv17b2Hfj3ppqhgK9OfWnxjIm@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0DKWtY/ZgDinUTcwabwr97ez2Dv5B6pHkxaJrXOvcQlDXIizU
	g4IsD+OUQWVjJvDKLQ8y6e39KEPm3BfIOnx6Znbaac9OMp9/gk4wg26SM21MHEk4e30=
X-Gm-Gg: ASbGncsVSyKu5roH2wB3ksfwcHXGT6fHko15W8PGCqtaGC6nY9pH+Ws1NOm8YBmQ8fq
	N8KvauXYxkeoIE3bY6Pq2HXkBrvgoh90L8K3gWA2uR/1S/9zv5VGAUJx810SGEhkcgrRKJqUmeZ
	ouoqHPvG+xplINNnfHiSnsCblyIIdRtjjrHMlfhhYbNbp+gqGD1w4ndABHJ9z5kSqcI0e9G45zb
	ot9MLukxArPG/OMMKMH2bAMlKM+ihtHKMhwAEHn7TSUTZzw32iPQDjFVA1omLNjx471mkZHh6Mi
	FR5T4sVZgqUXd3Rpgew0qKvgNgA5uG5Nzui48f2BgY7S1JDWvgqDcw67lMldVwBEKScO9IB0SD/
	OS2QCiVwC9hggYzSm/e0/oLhLh7hEzBPk/bQK+A0JK9BLI6NGn48jQHQaANtj/cZ6
X-Google-Smtp-Source: AGHT+IEKThX6qCxLXb9bS0z5WfS8UMTivSW59e97bDfl02OxTrsId93l86rqAjoKYfZIaAzRXfWWGg==
X-Received: by 2002:a05:6902:728:b0:e97:7f7:434c with SMTP id 3f1490d57ef6-e98a5839e5dmr7638464276.44.1756735441301;
        Mon, 01 Sep 2025 07:04:01 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e98ac42026esm2028461276.2.2025.09.01.07.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 07:04:00 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71d6059643eso33788927b3.3;
        Mon, 01 Sep 2025 07:04:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEu2/ys0ttRuUrrIMQH4BaIqsTJ6zy7krYw571xMvFj66QMrsucoReQzwe1Xt0mEJF5uR7IIhBF0u9@vger.kernel.org, AJvYcCWQHgyGqHfTuIhJNTqalC11shYzAm5wcRdp7q4UXdILBQb9mMZ7HMDNWuV7Vci7KU1KuxRjTGkd3MaK3mL+pXESdr4=@vger.kernel.org
X-Received: by 2002:a05:690c:6f0f:b0:71f:bde8:8dbc with SMTP id
 00721157ae682-7227652c5fcmr86810567b3.38.1756735440633; Mon, 01 Sep 2025
 07:04:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250827221424.640770-1-niklas.soderlund+renesas@ragnatech.se> <20250827221424.640770-2-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250827221424.640770-2-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Sep 2025 16:03:49 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUOKJXjk78Bgmazd4prGX21SDk_h=37ewEOwgdf9iAfcA@mail.gmail.com>
X-Gm-Features: Ac12FXyO2LJ8Itf_knNTcJsCa9Ro_Ryh9nnlc3sn-fhxGrnK2xQSo6QBQHEBjs4
Message-ID: <CAMuHMdUOKJXjk78Bgmazd4prGX21SDk_h=37ewEOwgdf9iAfcA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: renesas: sparrow-hawk: Add overlay for
 IMX219 on J1
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Niklas,

On Thu, 28 Aug 2025 at 00:15, Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Add an overlay to connect an IMX219 camera sensor to the J1 connector.
> The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
> pipeline behind the CSI40 Rx to be enabled to process images from the
> sensor.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v3
> - Use correct port@0 instead of port.

Thanks for the update!

> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -96,7 +96,10 @@ dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g2-white-hawk-s=
ingle-ard-audio-da7212.dtb
>
>  DTC_FLAGS_r8a779g3-sparrow-hawk +=3D -Wno-spi_bus_bridge
>  dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g3-sparrow-hawk.dtb
> +dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g3-sparrow-hawk-camera-j1-imx219.=
dtbo
>  dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g3-sparrow-hawk-fan-pwm.dtbo
> +r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs :=3D r8a779g3-sparrow-hawk.d=
tb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
> +dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g3-sparrow-hawk-camera-j1-imx219.=
dtb
>  r8a779g3-sparrow-hawk-fan-pwm-dtbs :=3D r8a779g3-sparrow-hawk.dtb r8a779=
g3-sparrow-hawk-fan-pwm.dtbo
>  dtb-$(CONFIG_ARCH_R8A779G0) +=3D r8a779g3-sparrow-hawk-fan-pwm.dtb

Usually we keep the related parts together, but we indeed already have
one case of interleaving.  I am not sure which style is best...

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

