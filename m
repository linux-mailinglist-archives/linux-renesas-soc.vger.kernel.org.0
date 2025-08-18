Return-Path: <linux-renesas-soc+bounces-20622-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F0FB2A693
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 15:45:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D96758332A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 13:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E91322A09;
	Mon, 18 Aug 2025 13:34:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F6C220696;
	Mon, 18 Aug 2025 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755524047; cv=none; b=YhZfJtzoxOt0WatL9zUwUV8jF3sHCcFl0W5m+tysEoyGBEwcbGxd7tOmE9YO8rnfuLf/RMjSgFaemn146+gxj4MW6HMttxZtLei613qDkGyyHbaCdooyX3+21CL2AAYX0M9JCPAabL+NvcKEdiP594i/s5tTa51eA7r2acnenA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755524047; c=relaxed/simple;
	bh=1pw3jI7BBV2KzsRXPuwqddCmk1U5bGLWdpUliQrhCAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIP3CMEFHsEI7dyUDmWqeNx9vNu4j2c14wWkXnGnodlRZAyIoXzF8tg/rTzMdlThfo5IwCw/pbgfKN8JyQeyzSBwtqvf+XthQ/wFXTOvlEZvwaY6N//Vlc2iQWcDzFsAmy0+1Batr/GTeWi5nD/dh/plEajhveukxZvxSVENAfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-53b174ca9bdso3172118e0c.2;
        Mon, 18 Aug 2025 06:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755524044; x=1756128844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgSit3yr4YOi0EHhRCuskcW3KZWGO3LCsBYUVodTm00=;
        b=BKibIjQhol/5gtHk0EsF2b8+JtBVvlMOEa/ITifiK6tKmc5qZwpu4AIIOTqAwPDjpl
         TGIaXTyu/PV+GegqvGtKYd2HwxN6oCk1zCEFn2+mE1mpHfz89Fw+kJuakOaMbR97fyiv
         jjY98nsyWCzLSHonj27RCCRBEFMx2g+y0k2f+/ao9vPIborD1HpXLbjhpJ83u3cLDuSS
         HRLPcShknLuRkzlenOwO2tmpFNEueNTvBW9oedzd6HjUDsnBwpldZ8f9VXC2WgsLcIu3
         hzxm0wAm/0tZY3eX49HrSZKMeng1z99F7zjz9sidOc7D5nyacZEfIoND7xU4AQvaMeI7
         yM4g==
X-Forwarded-Encrypted: i=1; AJvYcCUYWn1b7EZIGp9hPD5p3ofZqKGmEXXNUfu+IN75RRfsIsAsTbDk31E6UBR8Mq3avY/+LT4LXa2up/z1KgVEh9srqaI=@vger.kernel.org, AJvYcCV2cktIO3ndXNTXQMi72NSvIuG3PmAt3bMG4M34Yk9J7XNwBtUa/6WEchW5BaK9buqwvEuZdGYvYWZcCxgU@vger.kernel.org, AJvYcCXkJneKfnL2lx8voPtbOjGFMOAgdrgjFZkfZc4+AHZyAiS+DUHvIJUXwW9AU1RSFIAvZXJWcinigQy1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+1B1/Oh11VnHw7kAxgQoz3RVh3AmUaSgQUxRvS3+hbZjJ1cIN
	wf8VTeTcLeG/L9G52rPcTn/dcc2QjNjv6RPNAoyVmql6SgaIbD6JHk6UwGVOE/AI
X-Gm-Gg: ASbGncszr6eiDVWE4jDCofkSF7gG/kA4jIPJI65At8VZMse1FX4aJw8fueqHYknLuTQ
	VdpjrVw6hK8rDUTJctytdHYkwLgilniJAamVjJ8wozn1oImrQvjS4iBUJ1l+RHS+32093jRIj8F
	320TGL7Y2Rr2MbQzaKXnf2s8v1xs3caf1fdBMHNjxwENKYkeHt0bsFHnhbvmdGq6smKkOZp7OVc
	/jjt8OIJ4VFwqOBdqztKLOEA9hqWW27FilmJSsqpWMx/AfkbM5tOTpaDcK3s7NOvMup/bZ+M+/F
	APb2NTfwCm6x98VrTXsHNdGFH+b86yWvw4CKyppYTmioTJC7KUHeEkcOGXKhseMHlkCkzJJ24ik
	IsWyYpFus5roCIpNdT0Th5XDsI0D7pfY6Cn3cf14bDBoYo8AttReEiFRU99rK
X-Google-Smtp-Source: AGHT+IFY/0cfE4Ke9QE/QqwL7fCTa2dQInoYvb5Vyit6HT01a0rri0l50/XZp35P+S2dtEd0deXc7A==
X-Received: by 2002:a05:6122:3129:b0:538:dbc9:17a6 with SMTP id 71dfb90a1353d-53b2b81e77dmr4525471e0c.4.1755524043891;
        Mon, 18 Aug 2025 06:34:03 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53b2bed9fe1sm1965369e0c.16.2025.08.18.06.34.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:34:03 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-50f88ed81c8so2739539137.1;
        Mon, 18 Aug 2025 06:34:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUo1EJYH8YugCY2vnMNK9SY/zkQsyAy8PSpf9hHwrSTjWysZzLBzQvXhDx6hgYZs943GZIyypRQmkLH@vger.kernel.org, AJvYcCUq9c999X062YLuH3zH2lW1oBWO2OWgD0EH47K6lZS8V6Q5LTCVqnl2HwInIKaFDKACdGA92gO8Qub7dSunlhlNC7Y=@vger.kernel.org, AJvYcCVlZqSw2l2+5heuunZmbBX+GrWpa83xkahrhC33RCVWyyj0p7cemW2F4HiHRhxK2u0DmcqBmHFvH5Sy/I7d@vger.kernel.org
X-Received: by 2002:a05:6102:a4f:b0:4e6:ddd0:96ea with SMTP id
 ada2fe7eead31-5126af22ce8mr4578600137.10.1755524043532; Mon, 18 Aug 2025
 06:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250812200344.3253781-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250812200344.3253781-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 15:33:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=8rdWHyTpUmreOy5Nf-kiAoQMVakU051AyC2BoVP8vA@mail.gmail.com>
X-Gm-Features: Ac12FXz7U2bymUEbDTug3-Nx7SFQ-o7CnKN2bmCFrxf4VUWmLJsbplYrboKH96U
Message-ID: <CAMuHMdX=8rdWHyTpUmreOy5Nf-kiAoQMVakU051AyC2BoVP8vA@mail.gmail.com>
Subject: Re: [PATCH 04/13] arm64: dts: renesas: r9a09g087: Add pinctrl node
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
> Add pinctrl node to RZ/N2H ("R9A09G087") SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> @@ -5,6 +5,17 @@
>   * Copyright (C) 2025 Renesas Electronics Corp.
>   */
>
> +#define RZN2H_PINS_PER_PORT    8
> +
> +/*
> + * Create the pin index from its bank and position numbers and store in
> + * the upper 16 bits the alternate function identifier
> + */
> +#define RZN2H_PORT_PINMUX(b, p, f)     ((b) * RZN2H_PINS_PER_PORT + (p) | ((f) << 16))
> +
> +/* Convert a port and pin label to its global pin index */
> +#define RZN2H_GPIO(port, pin)  ((port) * RZN2H_PINS_PER_PORT + (pin))

Shouldn't this be in a header file under include/dt-bindings/pinctrl/?
Else you have to duplicate these definitions in DT overlays.

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

