Return-Path: <linux-renesas-soc+bounces-15822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC856A85552
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 09:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF3AB440B07
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Apr 2025 07:19:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D7C27CCCF;
	Fri, 11 Apr 2025 07:19:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92341ADC69;
	Fri, 11 Apr 2025 07:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744355941; cv=none; b=U4hLG3DFszUI95u1TMotmlHBZ2idux9loLFpoSE3QB8Z6kK/Dd5+mkESfMQ3bCaeVOVzAYYqptk/t/jVHnrNkXJS9Jq/uCJy+LrDzi3+4prHf/Jw5zWtcVJ23EM2B/tE7O2tKWk+CNK6SV+xN1pdO5/wtDF+LvDukG/LpPdRn7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744355941; c=relaxed/simple;
	bh=V+MQ/tXXHgm9QAFWUQ47i0G9RJRr1GVQZaKO7ZxG8n4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DSIVxi964BmjRq0XHGEcMGQZQmgGulTdZXcgFKSqz3abp5jLZ5B45tKW5rrsvKoRfjZgtykSD25WywZTtE2isYmZbQuJldbSLEigS3FagU2Otvm+QlEPAuiw+tdL1sYElpz5Q7Vdgi3hiQcydYBqcyYblZjgVK5tPmSqdVsdZRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86d5a786c7cso728718241.2;
        Fri, 11 Apr 2025 00:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744355937; x=1744960737;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZCr2H9xuRzm+S4rYjLCe77+cJE5VA9O5Xk8v3OZeiE=;
        b=WbT7moD3g9lMbo6XSjTutsyk3CTT0WzcNiSkiPh04qtq7MA+7KEH8xAe6I8bOFEz0j
         2D9Kwlzfslt5vDjnfutnI+km2Yzd+jAlH8LK+QnGxp8cNlhni+bvGmHxewn2yJO1mElK
         LQ6Fuw7JWi+By5aidGu/HpjIoRq1vyvP4huPsSfsLiL16XiW44g0ovMw8nHAtUoSiT16
         XwpPRDfBVrcF+UsJrCn9IrQk+ylfMABsAy0OsZFDuwq9bW6Hb61hgotdcBy2uhMX1VeF
         9/Fl8hAOJh1EG62muxDXpbUMvp3tvMqQNYEly1WBMWolvi9YSHuBZCpmiIWQFw/nAZWm
         HRbQ==
X-Forwarded-Encrypted: i=1; AJvYcCURnhHcdP0TgiqX9GbysZGnO5yS3M7gBHOFmFbl0kJUfQYQXDbth3HhpSimaKtbSqAx5Ih3xz4vGP4o@vger.kernel.org
X-Gm-Message-State: AOJu0YwS/LN961v5ut+vg8I65/3VjIei5bYOaBSdAZPemKjOBA8C4KNg
	D/tBm5R7c9kbg0b6IyJz3y6TGs5es7I77e9xKj0kY1CJqHYYV9fsdk56jtTYdvc=
X-Gm-Gg: ASbGncuFPoK7EpfTKgfQCWP5iH/oTGIP7qVORZwPreCluGJbULRWX4akhdWXtMKbN0Z
	GCefF0hzYQ2VuCFsxmDTPGLa66zP+AxEYsPtWJCEWNW0zyMOlwWBUM96Qvi0LUnQZZ7oNvmdP+M
	pWU8lJN/hgvLNjKENB2uIqDFAKoA70QKTHn89lRnVUgylgqTuQLfB14KmqmoIjFN3EobiFrF0gR
	mwxyi1CCJh4SkFCIYbKeWBfq5m2eW+IMPq11/OYvOuBZ+Z2ZOlDPfmbBBhDF9Xk701g85XTlQU2
	OjfaKY+diXESJMNx9NPekBP7LhoUeazKTQGctFiJOjOStRhVO06GjZoLDrhwq6aIzAPD1I1toAz
	99VU=
X-Google-Smtp-Source: AGHT+IEcxJaoNxwQNk3gq5JgiysdaF4GbIX3WmRV8Bs+3z0pyZHyHvJ2qSVpdTXjwZ/x76BuOJbuQw==
X-Received: by 2002:a05:6102:3348:b0:4c5:1fd6:5b68 with SMTP id ada2fe7eead31-4c9e4ffcc84mr760481137.19.1744355937618;
        Fri, 11 Apr 2025 00:18:57 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4c9c97a54e2sm929129137.18.2025.04.11.00.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 00:18:57 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86b9d1f729eso720584241.3;
        Fri, 11 Apr 2025 00:18:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8PdzanCQfXyZby7jq7eMqmzcDLi51MRL3TeL2YE8FJxsnBBHe8qUDKlLr40JFZHNAueXv3Gy3/xiI@vger.kernel.org
X-Received: by 2002:a05:6102:5788:b0:4b9:bc52:e050 with SMTP id
 ada2fe7eead31-4c9e4ebb1a6mr870090137.2.1744355936641; Fri, 11 Apr 2025
 00:18:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328153134.2881-7-wsa+renesas@sang-engineering.com> <20250328153134.2881-8-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250328153134.2881-8-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 09:18:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoxfOAbyBV5P-oO6Mp4LCu830zjxU6txcbLa9bxgCdqA@mail.gmail.com>
X-Gm-Features: ATxdqUFJbXSnCj42XhWj4cjau3Qme1VkueQa8DgetuguYiaj1sHzctRN3uxSkfI
Message-ID: <CAMuHMdWoxfOAbyBV5P-oO6Mp4LCu830zjxU6txcbLa9bxgCdqA@mail.gmail.com>
Subject: Re: [PATCH 1/5] ARM: dts: renesas: r9a06g032: Describe I2C controllers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Fri, 28 Mar 2025 at 16:33, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> To match the documentation and schematics, they are numbered from 1 and
> not from 0.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.16.

> --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> @@ -268,6 +268,28 @@ uart7: serial@50004000 {
>                         status = "disabled";
>                 };
>
> +               i2c1: i2c@40063000 {
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;

I will move these below while applying, as per
Documentation/devicetree/bindings/dts-coding-style.rst.

> +                       compatible = "renesas,r9a06g032-i2c", "renesas,rzn1-i2c", "snps,designware-i2c";
> +                       reg = <0x40063000 0x100>;
> +                       interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&sysctrl R9A06G032_HCLK_I2C0>, <&sysctrl R9A06G032_CLK_I2C0>;
> +                       clock-names = "ref", "pclk";
> +                       status = "disabled";
> +               };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

