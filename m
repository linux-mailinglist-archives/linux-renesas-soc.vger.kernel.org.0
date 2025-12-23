Return-Path: <linux-renesas-soc+bounces-26063-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C38ACD982C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:54:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE5BE308C1ED
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 13:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93C152D9494;
	Tue, 23 Dec 2025 13:50:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E932D7DD3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 13:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766497857; cv=none; b=q/2A256k3UUuR10PqlTokwkkkTmBFhOhYrNWDyJRqtfCYp+CemhxTkJOJ614Pll3DVeYVnVaW019u1fVm+AH6SQdFV0vQXc8CVDwMutsX0WzZ6TQ+VctTPjG6lXiv7TjobLR5B0sDizm6mc2YQ4SN9l3ul3mPXe78K0jblf9AEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766497857; c=relaxed/simple;
	bh=5muInitChGsMSj6kPp99AfFHw72VmyRJFeeekTtjmcU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHzSJMs1LgBn4jqWzhF9hvSw+DRMUK7zUpHCEFhIhgGQAQjdopcCdCINUgdqGXftD9ianPkrn9j8YO5zWWEXLy7hL5zvpqBsIRggHX/aSzviMN7aKgqnb6/kF+k2aK6mkEbJh9kq4lLumvJ73RcCSAPvayq9hYY0VN4gO8fEiAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b7a02592efaso723597966b.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:50:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766497854; x=1767102654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxgwuYv1GqkX/JgxOxMK1IynEvwBQ0HN2CK1BOB0UKY=;
        b=SFKpWoVLgF5Tgu3AQavH1bi0j/hmT5EulzEd2yUmRmusk3U6nwEYB7Ck66H4ZP9Sn/
         9VnP1FtsWCDSFF5B+eiVkT8CZ10+LZRKxHnENHgGrc1+63ZoceazK/eZUSaFAd9no4mh
         2uWcb/LzyGko8BYUroLUpZNFcZZSNYncSG3Lw/ggZ7jh0wSkV+uqaVVg4mTgevacljHi
         tTJjrYXy0eExdpRwr81MDAjf+6SIUPgl8qUSME5IihWjcQ9y3f/HGF0fCjQRcbhUlCyI
         50K6dSwpPRwHggs4XV2+hILRI74ZU1rf0vkZ7c3sG0fv4M5xpBl4BL/8kaAX70Q+UJIr
         r/iA==
X-Forwarded-Encrypted: i=1; AJvYcCUj9ZWFBW/KwnQ/pzICHXq8e6Bs0GVXNIU6m9pXDFOCgv1dVBv0AL79DxEeeylmEBpsTOmABHP084a+56h5s20DBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9/lVWKpUkJLU4pw7s4TTWVFazV38VQagM9R46VJxOHOr7FztO
	/rDP7GAu1D251BBhx1bJZt25bICFkQ+qxsdCMhZ9Zh0aoX+whtAEPEVsCLTeNS/vrjQ=
X-Gm-Gg: AY/fxX6+qyMKlNVbEZ0JtO9qf3aHDvK6dp+Nhrib5/ygxPTP2vDj8Dmr8g1CwrIlP7u
	JfbJzCnsSj595Ei4IgweKm/2plQ7+wH29ncE4vGV1jnH0DP3dUqwbENjeMNXqx4ADgNX2zEBdWn
	E/zXfmU20PVfGUX0jNUZLh7jA+zv90Far/FxoCSxp0lffy6d4QuII3hfpqs8Vgimr6xQ9vi0kwQ
	EYTtnQbUXT9keOJf07gy6AUlHzR+N0UlmOD0Rrh8tTVt3A/XSlweJCKcDF6IXlsDrXglaA6oCvC
	4FBqfgVJu1sf7WrWLwxRlH94FYP/4wsMSEI+t9soQCPQfooXb6ldO9vk9V01sGh1CA3BU/ZAerD
	OfuPpol327mxoSlVOJmFRhIW//yeTLH6ojhxK7wzuTHyqjlcw5EMDY8CXjXxQnAT2KJz1q9dvoX
	pKx3xksGZ7RgXtZet/ZfMQQ74r2meA37k05oOsKqrpWkD7TkjhvKkd8PvRJD4=
X-Google-Smtp-Source: AGHT+IEjSZLI7mBklIAKGMPwHLTWsATiL34WioNm+5lE6Y+DoV9S+TFzq2WSEzqpMmCHwjtNuZp54Q==
X-Received: by 2002:a17:906:c14b:b0:b73:826a:9102 with SMTP id a640c23a62f3a-b8037197467mr1705231866b.49.1766497853800;
        Tue, 23 Dec 2025 05:50:53 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037a61595sm1433324466b.8.2025.12.23.05.50.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 05:50:51 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b83949fdaso5987210a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:50:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWhwMfZsY63KNMpdYCf0BEl8Zipg7u1lfeH/ok/+z2gN7lKC070fkXuW/Mqraxqnv401N9UuqknX+QDmRnF281xOw==@vger.kernel.org
X-Received: by 2002:a05:6402:13ca:b0:64d:e1c:4c0a with SMTP id
 4fb4d7f45d1cf-64d0e1c4d98mr11290130a12.0.1766497850916; Tue, 23 Dec 2025
 05:50:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201124911.572395-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251201124911.572395-5-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251201124911.572395-5-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 14:50:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXDhi9KqE5hS=z_UqWQ8Hzhy82NaqBMOm7c2q15=M=SBA@mail.gmail.com>
X-Gm-Features: AQt7F2pBYW6Az37iaIR_8IHqN4poQvGi9qJio54afeSNgWx41VFy7kVT0EKlhFU
Message-ID: <CAMuHMdXDhi9KqE5hS=z_UqWQ8Hzhy82NaqBMOm7c2q15=M=SBA@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] dmaengine: sh: rz_dmac: add RZ/{T2H,N2H} support
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Johan Hovold <johan@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

CC tglx

On Mon, 1 Dec 2025 at 13:50, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs use a
> completely different ICU unit compared to RZ/V2H, which requires a
> separate implementation.
>
> Add support for them.
>
> RZ/N2H will use RZ/T2H as a fallback.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

> --- a/drivers/dma/sh/rz-dmac.c
> +++ b/drivers/dma/sh/rz-dmac.c
> @@ -15,6 +15,7 @@
>  #include <linux/interrupt.h>
>  #include <linux/iopoll.h>
>  #include <linux/irqchip/irq-renesas-rzv2h.h>
> +#include <linux/irqchip/irq-renesas-rzt2h.h>

As this has a hard dependency on commit 13e7b3305b647cf5 ("irqchip: Add
RZ/{T2H,N2H} Interrupt Controller (ICU) driver") in irqchip/irq/drivers
(next-20251217 and later), Vinod cannot apply this patch without
merging that dependency first.

>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -1073,12 +1074,18 @@ static const struct rz_dmac_info rz_dmac_v2h_info = {
>         .dma_req_no_default = RZV2H_ICU_DMAC_REQ_NO_DEFAULT,
>  };
>
> +static const struct rz_dmac_info rz_dmac_t2h_info = {
> +       .register_dma_req = rzt2h_icu_register_dma_req,
> +       .dma_req_no_default = RZT2H_ICU_DMAC_REQ_NO_DEFAULT,
> +};
> +
>  static const struct rz_dmac_info rz_dmac_common_info = {
>         .dma_req_no_default = 0,
>  };
>
>  static const struct of_device_id of_rz_dmac_match[] = {
>         { .compatible = "renesas,r9a09g057-dmac", .data = &rz_dmac_v2h_info },
> +       { .compatible = "renesas,r9a09g077-dmac", .data = &rz_dmac_t2h_info },
>         { .compatible = "renesas,rz-dmac", .data = &rz_dmac_common_info },
>         { /* Sentinel */ }
>  };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

