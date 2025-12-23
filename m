Return-Path: <linux-renesas-soc+bounces-26064-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB59FCD9838
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 14:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 385E4302D5E5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 13:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203B4256C8D;
	Tue, 23 Dec 2025 13:51:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EB32522BA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 13:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766497876; cv=none; b=E9QyFolDt+3RDsEviVrwOmpcjcJ36y8nha7m7Kd0YbWjWEu8tbzsRUGYifsEldrZa4ILblNlU9qon/IJ6Bts88/nir1eZPwYRJLudpIOZOsq4d1Zhzi8n5w2FsuyUEFkK5Cxx0pzj9VeuaE2KlPreSa5BP052UefLHdbKVG5VBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766497876; c=relaxed/simple;
	bh=+vgDq4lQzhcJ/PmjToagAIXB+7UjAyqauVh2qc4S2YQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkmYUEznFMvqSNQ0Plkm+aE7mQr0RuMqWM5JwpJl8a6J/bvLWBVFFSMYYxgIMcoLoLGffJja7j97xh3y+w6pYEqdFQ3WBiC4QIhcaKfFVf1xNDRfIVHhxbhowHM5OtFbi1mbS52bwqlya6CszQPYtaNt+3T5xlY92WyGJffsmIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59431f57bf6so5056501e87.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:51:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766497872; x=1767102672;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U258/dz1ml2wi6XM7goSRHkqu3ww0wtWLKndOq5PViQ=;
        b=iR4UkBy4ixyxF6vsFilqVbiVtQxZa8TP4aYB9lwqZ/cmEJGa9V7guOSqjxbJVs6zit
         BHraOe0aqdh9VRmI/fH+OIo83PrjQ2aKTbHNEzH3+n5EZgmbhJWdP9yGAhplsUZDvHEL
         hur3apfBdNsT11dW+Ke/gJ6FrNcU+S6mkRo43dq+nKbk63MSCvFoo65pKa5x0OBN1QGw
         gGXXeKIpPF/TiwX6Gi2Cc9oEsA8QDRrQqarM4S3yTKfP1aCx3UjSuhF8uQUaDp9aRHgU
         8ZIpjoXZ7WwNhvtrk7nKYi40ppYuJo1+nd9LWjB5UFLLP5htQyHN3QG/xOGzbsNBDhyp
         tueA==
X-Forwarded-Encrypted: i=1; AJvYcCVzaZKtbXHgvdTA8Kanpk0r3urhmiUQeOr2hARFOXWn/dLOSBYtJKo0IK3bpnW8Q5bVnrxID2pzy8p0YOXRzLgJ0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw57FcozarlK7k/K0nBB8HhEcNrDT7oMaOBkcmKro7WVxoboI5C
	zDJ4BH3eD6jWcDGXqGC3emoIaWLiIWm3x4W/Qok0eN5jO3Pzp31YHM5fr+O3I+1vy/U=
X-Gm-Gg: AY/fxX6/+SLk1/S8G60U05uzUB1BUXQdDkArK9vRH36/9BG2CA9Y51kYP0VGzV1XX0R
	IorOqPoha2fRCD0dHJj1wrJfQWMxJTBCgXh69gAfXEDvXkGtdjwhGZ4t18oyyDx5hsLgMBTGgUE
	GYj4X1V4ZQCsbMrxUNNFKWy4qj0WqG6u64pG7jvHiy01PDscWzf73U9MqK6bBeFzBxNIbM9lVvp
	eJh3D+JqJzNZe7tuIFAXs3SP8ISADjw6OzAuXd5liqNmRkXH+cJvbC+nKNs+YJyOSyPyYqzUe9E
	V9vvfzr9PgcEmwX9QkYfGYm2r9DtT4JDe9bnBdVnS/EXLSy8baXuaPhV7EuM2nCXEAKiXh1PJLB
	cdhmNzQkcrUnIc2K7ZitTuU56ZVR7z37UHLDFG/qftJ6PtAxfmMjvo1mJR8a9ReNLZ+8mONwbsI
	1G/tls9y5kACyVL2HeiZ73fAqjCbNQcu2F3sfI3JPJVIzenp+6
X-Google-Smtp-Source: AGHT+IGjyHIPTWTNFE/LOwsEnpNB6gLKy/AcrAY7g/kbzO4bUGMHoREgH6lsE0Mvn5PqcaTAKkbeSw==
X-Received: by 2002:a05:6512:238c:b0:598:f361:68f8 with SMTP id 2adb3069b0e04-59a17d058e9mr4703833e87.9.1766497872101;
        Tue, 23 Dec 2025 05:51:12 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a18628284sm4123892e87.93.2025.12.23.05.51.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 05:51:11 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59431f57bf6so5056482e87.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 23 Dec 2025 05:51:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEYiftjQ6EWk4YhPUvbEWFt/umN7xhPspC9TiFVQmA5XYEhv4lCRnHiLSvganpqYJedFTqfwYk+GHXwR23uAeuqw==@vger.kernel.org
X-Received: by 2002:a05:6402:1e90:b0:64d:4894:776b with SMTP id
 4fb4d7f45d1cf-64d48947948mr7064838a12.27.1766497528286; Tue, 23 Dec 2025
 05:45:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251201124911.572395-1-cosmin-gabriel.tanislav.xa@renesas.com> <20251201124911.572395-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20251201124911.572395-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 23 Dec 2025 14:45:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV=EW4YbEBiXH2p0SeC5Kw-YmYWuQwsudpGgM63pgqcfw@mail.gmail.com>
X-Gm-Features: AQt7F2oX7CMa_8FU9LCOCZqrziankMeMXgDYxBV-ZhAtoMZJ9gqMth9qd4a31zo
Message-ID: <CAMuHMdV=EW4YbEBiXH2p0SeC5Kw-YmYWuQwsudpGgM63pgqcfw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] dmaengine: sh: rz_dmac: make register_dma_req() chip-specific
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Johan Hovold <johan@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Mon, 1 Dec 2025 at 13:52, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs use a
> completely different ICU unit compared to RZ/V2H, which requires a
> separate implementation.
>
> To prepare for adding support for these SoCs, add a chip-specific
> structure and put a pointer to the rzv2h_icu_register_dma_req() function
> in the .register_dma_req field of the chip-specific structure to allow
> for other implementations. Do the same for the default request value,
> RZV2H_ICU_DMAC_REQ_NO_DEFAULT.
>
> While at it, factor out the logic that calls .register_dma_req() or
> rz_dmac_set_dmars_register() into a separate function to remove some
> code duplication. Since the default values are different between the
> two, use -1 for designating that the default value should be used.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

You can find a few non-functional nits below...

> --- a/drivers/dma/sh/rz-dmac.c
> +++ b/drivers/dma/sh/rz-dmac.c
> @@ -95,9 +95,16 @@ struct rz_dmac_icu {
>         u8 dmac_index;
>  };
>
> +struct rz_dmac_info {
> +       void (*register_dma_req)(struct platform_device *icu_dev, u8 dmac_index,
> +                                u8 dmac_channel, u16 req_no);

icu_register_dma_req, to make clear this is ICU-specific?

> +       u16 dma_req_no_default;

default_dma_req_no, to avoid confusion between literal "no" and an
abbreviation of "number"?

> +};
> +

> @@ -1067,9 +1068,18 @@ static void rz_dmac_remove(struct platform_device *pdev)
>         pm_runtime_disable(&pdev->dev);
>  }
>
> +static const struct rz_dmac_info rz_dmac_v2h_info = {
> +       .register_dma_req = rzv2h_icu_register_dma_req,
> +       .dma_req_no_default = RZV2H_ICU_DMAC_REQ_NO_DEFAULT,

Since this is the only remaining user of RZV2H_ICU_DMAC_REQ_NO_DEFAULT,
and this structure does specify hardware, perhaps just hardcode 0x3ff?

> +};
> +
> +static const struct rz_dmac_info rz_dmac_common_info = {

rz_dmac_classic_info, as this is not really common to all variants?
I am open for a different name ;-)

> +       .dma_req_no_default = 0,
> +};
> +
>  static const struct of_device_id of_rz_dmac_match[] = {
> -       { .compatible = "renesas,r9a09g057-dmac", },
> -       { .compatible = "renesas,rz-dmac", },
> +       { .compatible = "renesas,r9a09g057-dmac", .data = &rz_dmac_v2h_info },
> +       { .compatible = "renesas,rz-dmac", .data = &rz_dmac_common_info },
>         { /* Sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, of_rz_dmac_match);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

