Return-Path: <linux-renesas-soc+bounces-26439-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B856ED04942
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 17:55:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B5A536B9FBC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 15:47:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DF9C2DF152;
	Thu,  8 Jan 2026 15:45:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3DF21FF30
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 15:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887112; cv=none; b=o85iKNO/2DvTiZGGzufPgq7EPws9EqIEBzxpQAfM/4SMmcAqepK/4ZhK5MabOaXFxCaeBBhBxIjjUvjAQALZd7SBO53Y6C1aalrHbLj7rg1Lv9IE0f2n6jcT06A340YUKup9uZ/x4sWlrEkJf35acZtSR8TkOUu/dDBqGUhgsdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887112; c=relaxed/simple;
	bh=BBsNKmsId5cR8LindZ/7FZKftktXvKprwoHo7JbEZwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uY2xlYN8yXKIOwmjVqmO10dvdxxt8aKZPn4ZPw1Uwlbdt0yWaE+yx9mXTsxBvlKcL/OmH81ueIRJYJLCXuxzAIfyr22K/s4RefqEZyvJELodQo938V3NPTlmrLltbYG59ExhrNThyQW5Iz3/xeGe5yjc3VSmxpoqJV1SEAigTrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94124140e02so2057775241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:45:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767887110; x=1768491910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lx9OXbti98lXjfXlLYihiIxjP9eLHg+VOozfKRmOdZY=;
        b=rzc1jdWb0OMQw/J1CIGGowvJakMDWSWtKPDH4ONpmn7hdgvViVFoF+D547+NzFqwCR
         Y9irPbBasd8u/y9eqv5tBvia6AkVRJ6LgCqNW6m5yiY6YS3TC9ILMiBGZx6stujUmjbx
         83kb/FfXbsp5ePltcQRqg+rFVz8KUjSeeZ6+2XathtP2tbKqb0YHQ4bFz7zZsqjgtcBG
         7bB0VkazfLz3nxhALu59zStSnvIdgJOg+v8RdOp/rCPvnHshi4Q2xCBNFuyvj29NsIra
         MQJ32EeniXuoR3ZCZFMnwxoskFYSM+1DIppqRPUVqOHGJ62Z8wRmbua8x9oKgYfvqQx+
         O09A==
X-Forwarded-Encrypted: i=1; AJvYcCUkwFGWWBUAFjA8xN22O57GMgD8UGHfmWwI4Wfk5wtHkA1iFBjW5QUYi/4/aJlfvOVrj8UhjnsoCnVU2jOSMmBe9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxGtxK+URhwUxsm6vSesBm7VjyGm9xPYyxHe5Vhd/gI5MGKAMDA
	gc2N9rQNyGuQRP7AEzFuOJ97zJ79wgrMJM7XYNM/iVvSmkG1+p4fP6UzaohvP/zD
X-Gm-Gg: AY/fxX7hzzrBRhdaUzgJXJqXKAl7suV9CUFUmJ1dOEKymsssVkCoDflRcwBc1Tr50M4
	l08bEE1cxCRQ6/FfK9KoHEcV2aoKzEOqI+KuPYL9jKTpxA4MXXN/j5xUtZhw5gO/0AN2PC54B/9
	RUF0ChAk+ZZcqszcCANGTnnTNMQ8DXA6zh80pE8hVqwOMiRskcZ0wgIhZXaosM1zFlK53Q85ILg
	lbDrgnKxMJ+vqBxXvwLBkNmbLziKAl51owyELyKn02MuQ0UKGc12HqUAzad/1S43SHgRjWca3VY
	c4dffEeLRojSh5oAEfETNhaeyN3aFeo9yPExHBqZOw62EaxUSIPlGDVyFrfOPcE1KaXGF8zcPNn
	L82aOAx1emNVZEZDZNhVR4c6qtKgQ5rIclibOefnciEpXQqR/kBAgduzhmZry3ewLVQKG4aPQHc
	/wwyYi0S1KRxXqBmHvwlyr8Rk2FX6P2b3yw0dPGaxv9v3ZapLo
X-Google-Smtp-Source: AGHT+IFFPUwBv+NM91R/NYhF/5sFH2tFH23JfQJ1+cFMTOwenuD8jK3Zvt48u2J9uDgOIxP83P6qHA==
X-Received: by 2002:a05:6102:919:b0:5de:93bb:c564 with SMTP id ada2fe7eead31-5ecb68d2db6mr2979350137.28.1767887108181;
        Thu, 08 Jan 2026 07:45:08 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ed082abc75sm5194617137.1.2026.01.08.07.45.07
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 07:45:07 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93f500ee7b8so1542920241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 07:45:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXpNFN/E8NKeGqUjF6OBN7f+HyJ5xkTXKocOCEaoixlOvn44E/b/uRbHTgDkgtzRJKwQ3Py2ecbUqb8IVrnH+sIBg==@vger.kernel.org
X-Received: by 2002:a05:6102:6050:b0:5ed:d33:a65d with SMTP id
 ada2fe7eead31-5ed0d33ae20mr2185253137.34.1767887106092; Thu, 08 Jan 2026
 07:45:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126130356.2768625-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251126130356.2768625-10-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251126130356.2768625-10-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 16:44:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWajzk_NxzmgvazqO-SHiifqtq42rf84JeAQPD8jzEAGQ@mail.gmail.com>
X-Gm-Features: AQt7F2qatq2GmDh9d4ZT43bcryI7HhqWDkEF1PCTTBINYtLEjKdyngOLyqdhCe4
Message-ID: <CAMuHMdWajzk_NxzmgvazqO-SHiifqtq42rf84JeAQPD8jzEAGQ@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] arm64: dts: renesas: r9a09g087: add TSU and
 thermal zones support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Nov 2025 at 14:05, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/N2H (R9A09G087) SoC includes a Temperature Sensor Unit
> (TSU). The device provides real-time temperature measurements for
> thermal management, utilizing a single dedicated channel for temperature
> sensing.
>
> The TSU loads calibration data via SMC SIP.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.20.

> --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi

> @@ -955,6 +970,37 @@ sdhi1_vqmmc: vqmmc-regulator {
>                 };
>         };
>
> +       thermal-zones {

I will move this after stmmac-axi-config while applying, to preserve
sort order (alphabetical).

[...]

> +       };
> +
>         stmmac_axi_setup: stmmac-axi-config {
>                 snps,lpi_en;
>                 snps,wr_osr_lmt = <0xf>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

