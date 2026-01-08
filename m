Return-Path: <linux-renesas-soc+bounces-26423-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD102D02FC7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 08 Jan 2026 14:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98624302D5C9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jan 2026 13:18:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68EB7499CB3;
	Thu,  8 Jan 2026 13:18:10 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323744B8135
	for <linux-renesas-soc@vger.kernel.org>; Thu,  8 Jan 2026 13:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767878289; cv=none; b=f5LvWo0V/JtYpHaGTl/nSjO+g9ZDfy0YsUKpn/l8SCnfmuaJBDuAyrpuKmMdzwQlJtmV+NS59uRjOxR+NVhPqjDXvE5QbGqMWqhSuFxmLnD3k4cmKh499VFqt1/p/YpJr7yMb+sDvtsuZPv2dOpSHRWiEzY06ojWA7GGxf7NdIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767878289; c=relaxed/simple;
	bh=vgDrmkhic27ZLjMSwj4J99A0KVVOhBHys+2vQZ9+pyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AJv9UKZzvZYP748rQjXr2DgRneIsISK3ODucvXmQm68kKQXXXlaBk3bfcxOc1CzkM8h+GJlcPmZBbfcRjhm0sL/EAtZCEh/N9rhAhwh50BOKFHCNr1v7I98e7Jy2pOwhzLbO6tjsk7hOp855dOr/v5AsGj7qi54IXzXsJrWtabg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5634feea416so1075014e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 05:18:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767878283; x=1768483083;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsLKYiyEuA/wgueTeV19R3a6MuyQrCJBTiLN9VGhTa4=;
        b=Kl5JxX5NLRGi9Uohfg4rWIAwFE8i9eU+TPld0EUjmBJAqunfxKxwouUSZLndM/rpWd
         UDvVqz2QCOT7c7pQLw/xoJpXRsQ3BiJLzEdsREHXhRZ1cvLL0bHDXcQ651/ZgKUNzKPh
         aQMfcZ0E57V/slWSorhAGqnoEihUcvuLtPzMREGyHA7y1ZaE2YG/BLwE4wiRL7rNYrT9
         VNTZccuDzfvApDAQPj5BXcsNy/4mjs+crVzSpVNUWpYb4ou1pAqvFvwqQjEiEXhWyrDV
         TZ/NcTHAR4GGMmhQRH+MEFp/5wJXbRDXG1ct0IDz2oYwtGJ25NIJesGBWD6War1BxP9h
         zj5A==
X-Forwarded-Encrypted: i=1; AJvYcCUgdchfBjeGnJ3IUJueD1zXilFhgP67kh72Uoha468B3oAzfrLQuzVw4WK5tI7oHlRj3/q3/ZWIsYKXnzkS8otrPw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQRV7VaugW/JuO7EBLPxVn3WFYNjocFuCLlGC2zLzsOKygwZNx
	6WfcM9gFUOmDsiD2/s9y8lskTjw8Fa2L6zGPPPU5E+/owVKVNXyD1XYw9zZKXNUf
X-Gm-Gg: AY/fxX5DcxBIu2Hpb+hI2ll1F50dqn9PiD9dFu+WEE4BpgxqJcDNvgya5k3eZZyYMNV
	wWaj1aq36jIbMqrrLeNxdzhevK9QbO58w7IMO9nEZVGCViYEJtGCBYsvkN0ba+GjyYumQ7Cnznj
	uWovn+mA8k+9qPYDTBKdltn5m4sWROtOJFbRa0Bye7sPTi0wnfL7TqOYQmoyBRgeaM747td2a7G
	eW09RQy8NdkxdDPltvZfPTdY44CZb7z7/qmtssTHEmQJxflP5MS3CDWh9NpskMrjZ13zQMjXwxF
	dDXmJMYtYtoKjy7XY3pfLW6KzK4U7AC/9qTVhrIrKYMvzvgyzasj4VNTfH6OghlJn3jMUJoyh+v
	oZikNg8l0GOJTgz3mKumexfxmOR4ocLfj+3QA1B3vgF8M1krFxdSyjXUiVPV51HbnDkhTHsDIwy
	rBcjSd4QPz2jADTW1HTG6PuD26ErdVRnkE8/NIq+7FZhppF66x
X-Google-Smtp-Source: AGHT+IGjBW1N7yyZZfOLaCLzvuTA/Kr4+IACl6svxHLJZomg5MfXNPayb7DB/by4fpDNMrwq0/sjjw==
X-Received: by 2002:a05:6122:2a14:b0:55b:305b:4e32 with SMTP id 71dfb90a1353d-56347ffc521mr2244833e0c.18.1767878283001;
        Thu, 08 Jan 2026 05:18:03 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5633a443e32sm6101491e0c.22.2026.01.08.05.18.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 05:18:02 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5eea6f90d7fso60321137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 08 Jan 2026 05:18:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW5vMCmdlMcUaNo6ngQIQDsa9Vfbwd4s+yuGkmcWGPR/Q9+i7KRJPDdF8cVc4S+aGaVTFrPvXTmDm6s87lrYM65JA==@vger.kernel.org
X-Received: by 2002:a05:6102:3e11:b0:5ed:b56:67b9 with SMTP id
 ada2fe7eead31-5ed0b566b64mr2014198137.8.1767878281214; Thu, 08 Jan 2026
 05:18:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251215163230.227849-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20251215163230.227849-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20251215163230.227849-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Jan 2026 14:17:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeB0xYbnHx-RYf3F4aw4TQOzC39A_MWc8PoROo8-p1mA@mail.gmail.com>
X-Gm-Features: AQt7F2pOTVZIlAlsJmiNPps5MsL7sfU1mNamtPPYLMcacskS9XE4-d2ETNOQ2lo
Message-ID: <CAMuHMdVeB0xYbnHx-RYf3F4aw4TQOzC39A_MWc8PoROo8-p1mA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r9a09g056: Add DMA support for
 RSPI channels
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 15 Dec 2025 at 17:34, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Enable DMA support for RSPI channels.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> @@ -679,6 +679,8 @@ rspi0: spi@12800000 {
>                         clock-names = "pclk", "pclk_sfr", "tclk";
>                         resets = <&cpg 0x7b>, <&cpg 0x7c>;
>                         reset-names = "presetn", "tresetn";
> +                       dmas = <&dmac0 0x448c>, <&dmac0 0x448d>;
> +                       dma-names = "rx", "tx";

RZ/V2N does not seem to have restrictions about which DMA controllers
can be used by which SPI instance.  Hence shouldn't these point to
all five DMA controllers?

    dmas = <&dmac0 0x448c>, <&dmac0 0x448d>,
           <&dmac1 0x448c>, <&dmac1 0x448d>,
           <&dmac2 0x448c>, <&dmac2 0x448d>,
           <&dmac3 0x448c>, <&dmac3 0x448d>,
           <&dmac4 0x448c>, <&dmac4 0x448d>;
    dma-names = "rx", "tx", "rx", "tx", "rx", "tx",
                "rx", "tx", "rx", "tx";

Note that this requires updating the DT bindings, as they currently
restrict dma to two entries.

>                         power-domains = <&cpg>;
>                         #address-cells = <1>;
>                         #size-cells = <0>;

The actual DMA specifier values are OK, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

