Return-Path: <linux-renesas-soc+bounces-18201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D88AD74BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 16:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1289E1626A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 14:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687CE26FDB6;
	Thu, 12 Jun 2025 14:53:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C9326FDA9;
	Thu, 12 Jun 2025 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740009; cv=none; b=K7K2gmGqa3ejaAIcM4TBYekUzVq2afN028R6ODwpMwU3OcY0uirwqm/MdT4yVwu+2qssxAJFZ4TAAQYkcn+Z94ea73cxo+2q+eqw8YCFZ6oyZqLiH98VTuIGHqhKIJdT2gMy08So+98DGWYGX8TuZenJpeLcuJ2dMDYXMv6OKjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740009; c=relaxed/simple;
	bh=Z46/+1bEbzFmd4IlLZVdFclzKMNgK/pNVt4Y2XAb92I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tr01n6uOM9xxohqqIWkeZi0nQ5o68Wt9NcRD7Ap5EHUAwwBCu2GmV9X5ACC+h6U+52tfslDFgtvg/pb7FmtZpZrzQtH4HNT7oUxpbPSIlvRBEtxA4inVX9SslqIndy0na/K1tAzFYp+USWG+nsJB5Im501v1/grtwa0I/FiwvG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4e770bb7b45so294234137.0;
        Thu, 12 Jun 2025 07:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740005; x=1750344805;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7x1d1vTJCh0XRTGcbKT1jF2AwaSX3xRvHIeZZnEYTPA=;
        b=aeMG4SnLTMNsDdQXgvn0yiWyZVhhwz+uw9kMgNv1FsvN8DTLQLbpDm+VPoUtmZClQE
         rgD7JNsmWST84ObVcIvB7fnH8AJlDf7dkqf81Cphj+SftTicU+t04QUOwPa0V4EmVSSK
         soJMwwxs8P+xSSQJHXotDBPhYo+8pbrpF6+P132JwSWaQLmqFa+AYky3FrJmHaaagPvg
         DcU5X64SmZk99wBPZvryvW3esGngrsCj+Lg5iX0XC+euGiR/gOJiS2l0F8m+XVr7v2uR
         lFYtiGUpkPpQAfNvyK+0UmmyQNUv1CfL4EeV0oXI03sLFp3c+feQwstuYA0LvVQyc7nc
         im6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4F/6kBGkej55avODavwCYGLcA1/Y50I8o973WULOYeyVdLZTs2d+oW2JwBXyFYUmwhR0T+dClH5zK@vger.kernel.org, AJvYcCVgK1BzzD/msE3rtkkiWyEFK+V7zQp8qrnG7JGtLtLZ7RZramT26G8k4YnDrvCSy0oFRQhwy6IUqJZLmwOb@vger.kernel.org, AJvYcCVlN9a050deTHhxjAfELqTQXwoF91kCt+a6tp5oBIPfYR2WldlRgNf/If01ZNSzmVQhOjIXRwM7uSG1Mjn2H/B0+7E=@vger.kernel.org, AJvYcCVz3Hc2zkwAhuL2ELxBYNz2pupa7byUaziqspUUTvNXLmHFZ/6ArI532KYtG6GMBvk8QNUKZA1wp7B9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4pMmGVd+W/NnztnN3W1TWy7lkH9QHJSbdV4F8OqJaLXez6mKZ
	qOpLuuHZHOj8dLL0jK6sPj8gx4u+CuAM+H4nO45TVTAfKzYpzRmoUocctHqGOoDo
X-Gm-Gg: ASbGncvMlQv/aSc9MxE3jcld8bdExMkCcGHKGPxTiM3qYLjiEYosD/Z07eDmtQMNaFp
	33cehI/8YOy66a3hhpFsYdkngrw5w6fSrgLemZEi9MzHZWSH/rHCVixDvPrPwT/KQ97sqbiecKp
	bUMzbdHTOHgokh2EmAPozZyWYE246rvAMQIboDVUIOAstk1jYnZizpadDfzJp4mZmpT/98re8xg
	rnXi8Tyl3V6+MlurXchNx+vbMIfINvcim3X4oszvdzgSSj1OFsEnLO2mJ2UqAWjHxxMLj/FRO3q
	wn45yKi2Z0ClzfhEI3ySeifW3s2ENN5fgEfx8rJSNfxgQql9zgpepa942NP417ZprbFWJXNkY/F
	aP/S6ey5pQRJVL4Zwe3WiKxIn
X-Google-Smtp-Source: AGHT+IHNTEaD5MAYAS1XrNXevImlvWWqfgcOUd/i+I88jXPZE13e9nNIBOhdvn+4/Zk5cBzty9BsdA==
X-Received: by 2002:a05:6102:41a0:b0:4ba:971a:41fd with SMTP id ada2fe7eead31-4e7ccd8a30bmr4525569137.19.1749740005004;
        Thu, 12 Jun 2025 07:53:25 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7d07d5642sm257908137.8.2025.06.12.07.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:53:24 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4e7b397cc2aso280563137.2;
        Thu, 12 Jun 2025 07:53:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgCBVjETYr783K4eEaqbsOnauVPF1M+LvQ0Jk+I9Oz/CcQaYKqw7WzJFDFrj+sPP2Ke4mB+VQfx7vT@vger.kernel.org, AJvYcCUx8aNtcwXM0bhU5EJf7pHF8eP2tM0+eFAcXUwkIu9Tq/Qds+sQsMviOe35mp9uP63VrYDgQ3roKFxNkFSW@vger.kernel.org, AJvYcCWq8OLCkZ8pU4pcabnGDRAnsV1MSaS0Mnrb3gDjfeLs1QMynM3Z1EfBv+sBsymV/F/ejpNYzXhcLjauXeB9e8pfbd0=@vger.kernel.org, AJvYcCXfRxXcxIQiKu2EF8JlErngYdb1THpBsH9vx5Sr7JrjmSFxpi5yEhaRJnddtu6txfm+gcr5dJBfjBfT@vger.kernel.org
X-Received: by 2002:a05:6102:5808:b0:4e7:b338:5352 with SMTP id
 ada2fe7eead31-4e7ccbf01fdmr4242757137.10.1749740004083; Thu, 12 Jun 2025
 07:53:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250609203656.333138-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250609203656.333138-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:53:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXbo7vytuCX0RW9w0PjPs9tWaNzuOAWCUrO7gF8xKC8Sw@mail.gmail.com>
X-Gm-Features: AX0GCFvi9455CjPDjLvZYIZKJZiEyx6KQ3aIhyUXcJMYE57S6zBSPXwrVsAtHMg
Message-ID: <CAMuHMdXbo7vytuCX0RW9w0PjPs9tWaNzuOAWCUrO7gF8xKC8Sw@mail.gmail.com>
Subject: Re: [PATCH 8/8] arm64: dts: renesas: Add initial support for RZ/N2H EVK
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 9 Jun 2025 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Paul Barker <paul.barker.ct@bp.renesas.com>
>
> Add an initial devicetree file for the Renesas RZ/N2H Evaluation Board
> (EVK).
>
> Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!


> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -166,6 +166,7 @@ dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
>  dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
>
>  dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk.dtb

Please insert a blank line here, so group DTBs for the same SoC.

> +dtb-$(CONFIG_ARCH_R9A09G087) += r9a09g087m44-rzn2h-evk.dtb
>
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
>  dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo

The rest LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

