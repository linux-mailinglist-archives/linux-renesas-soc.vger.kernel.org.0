Return-Path: <linux-renesas-soc+bounces-12487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D3AA1BCAF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 20:16:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3585B3A3F11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Jan 2025 19:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65C01D319B;
	Fri, 24 Jan 2025 19:16:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C63CA64;
	Fri, 24 Jan 2025 19:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737746173; cv=none; b=QaDf5r5ndCKi4q5ORnw17qE/CL6SAmRBX3e3Dl46+2Wusq7SKB93HluJmO0ZrZLf2uUcDGMPD3LJXN7TpQY+JHrYhuKTj4zFCxpQfUhQ6X3EAp6WGnN+Uj9KquKTVmxe+rWagG2wDt2ZS0jmwlqejQu7cKtMTFJbsgQsBEPONLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737746173; c=relaxed/simple;
	bh=B1TY+gWfw5kSsTv05I5LRy3PXH7u3mxBGlY9hpCbAow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ed7f4W4zJY571p+7c9XSz08RsYyN4I+b1cSr1eKfEvL4LwVwU5f9+PK8iYm020WMxasmSvcpNgHsqfIt8izFgjbisCEfkKE2Y0ntxbjktJTlblId+Lsmwd3pxRk76UlS8NK7qy4T7WAIgasDVtRUTRsrCZI9cLhb1R7QJx94ENg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-4afe6a8d2e1so1293668137.1;
        Fri, 24 Jan 2025 11:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737746169; x=1738350969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sUiAggrw836WY8haHSpcFLw3hnkVmLvRNNQSCCN4ANQ=;
        b=F3UO53gPppp+5SP7QN1veXXAF7pbKnrGajrr+SR4iErAh1cG5EZ5yvJiYnhNDQgIxR
         LFTxxfRe2NhAnK0PYXa7+7RUsOG5v+dQB0F3+Gm/i7XIjOh3jyShPs8+d27ONglz8tNa
         0bqfN58K8PUZIQPuLSABGAwMEqbQA7m1ivq0M/ZYfRek1dQTmJDMlWV40f5pEEZV1qXJ
         /WibncZiwQcfv1ebFRKDsXUgMwaQB/prl3pmArVRfUgnDX9Z16p/7SwOa08MgSJh2uNg
         +GUmyDBmA7Gbn0Fm60AEizdwSZsgiso7t7bCZUvt7tt6T9wr9Y7HRLMG9EGbWztrg26q
         d6fw==
X-Forwarded-Encrypted: i=1; AJvYcCV0J/PiowvGIgPkENmII3DBhlcSgIITc1/NeVYfzdt4aEXjdFnkdQEN8YCC93t49XevtVfZbZN+2E2n4q3vYEhF2dE=@vger.kernel.org, AJvYcCXc7/1roRqprocvOdhKSz7iRbtRW9BHKYo3Zaq/Ac/hnvRdUEmi/BgLLZqsicO9b3c+m2f+rlZTwU8ludI3@vger.kernel.org, AJvYcCXeQwBn9YYxgFoXCbWhqHcIK7msFkg2ZCt2ltYzBo8wJYkn+qybioS3+YaaLLaziGZB6bPkTshlsTgw32hQ@vger.kernel.org, AJvYcCXwHj7h5ykf4viTp3qDeopqCfmXFs3ldTiYXvvBi5q5/1C/9A8GpH6aV7IJzJ62okr3iXDZ1yn1A3D1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7bJwk/lOb0RHkoAm/mY0iEgpvML8yqa5CbupHGFWbBt3BG8x5
	APFBw7KDVGX8IisvMTZ/C+6REIxRA9ifTDJS4+lLWjQ/zir+yAI/rcSLlbYn
X-Gm-Gg: ASbGncuecu3dlPV6RBJfzTX/CZwHCHjEDyuCmsdRJKEF3HTfwOF61pB43Y7tM6Ex9Iy
	rfhpvmPc6v7LEhHmdSduAQDYTVRHgVCDKGrSxxSPBLvaeV8uWIysokh4Pcf/prTlCeZ8KyR5N2g
	42L5boJ5lX9GKH/vKbnQ7SzNPn5fDuJEKJM3dzOma5BFSIwwpZF7yMeNPtYI+vYOpBJKbjI9oG2
	PZvmzJsjmyenySin/kxiQtiogMju3xcoZbF089WkJ/E+MoHNhPXNk8J/Zhn/wGGUqwlm/MQ7i8Q
	g2QYAymUDJMAbpImMfKaaKCRcVyNPVslyad6o+5GArg=
X-Google-Smtp-Source: AGHT+IEL2nNKaU1SqWY6jSQ4d6IHw3BfXoc1f1P7cdIjuAiHGr7IaKkHt+fWdte5TMR2tdvMw0+QFg==
X-Received: by 2002:a05:6102:3596:b0:4b2:cdf4:81f7 with SMTP id ada2fe7eead31-4b6f7a1ea2bmr9696507137.5.1737746168935;
        Fri, 24 Jan 2025 11:16:08 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b7097cc426sm548553137.13.2025.01.24.11.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 11:16:08 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-85ba8b1c7b9so1353500241.1;
        Fri, 24 Jan 2025 11:16:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUHBbQhiULRc0jrUYNf+zjjBllj6GT5ZJV9pVf6jucLRZChKHImT2cCTypNcBU9OWXtjnvtLq85OjSsRatj@vger.kernel.org, AJvYcCUJtQO8D91aCsYVdvRSYs/Plh7839QXWE3cnHvCduFI/ZFNJ7sZT1/GmAIbOGRtttNe5kHrz1SOCVxk@vger.kernel.org, AJvYcCVQjT7u1P0c7m0UOoaR0OL7kJ9N1C8HvWONe5Eg6UvTyWb5DHCZjx4VVOzdKdb8Eg92poxHiJIeZD14Z/Hco28rJM4=@vger.kernel.org, AJvYcCWrJoepeWTLZ3HyS6AbJS0d/+Fn1q/f202BApDKNYqUe7m+aVwYArlSFYlGSxUE3L9DShTmbl8N+psNn+Xt@vger.kernel.org
X-Received: by 2002:a05:6122:3b8b:b0:518:8915:89ec with SMTP id
 71dfb90a1353d-51e4fb65a5emr4782858e0c.1.1737746168139; Fri, 24 Jan 2025
 11:16:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120130936.1080069-1-claudiu.beznea.uj@bp.renesas.com> <20250120130936.1080069-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250120130936.1080069-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Jan 2025 20:15:56 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVjvKmR-0ZiYGiAwXf6dfx9O9HtG2JXht9iDwV7oKdwDQ@mail.gmail.com>
X-Gm-Features: AWEUYZk4daPJyNEFJ3tb9_WILi26dZhW6oaUjWo8962k_8YMza8zSBNUc9xrvAI
Message-ID: <CAMuHMdVjvKmR-0ZiYGiAwXf6dfx9O9HtG2JXht9iDwV7oKdwDQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: renesas: r9a08g045s33-smarc-pmod: Add
 overlay for SCIF1
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: magnus.damm@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
	p.zabel@pengutronix.de, claudiu.beznea.uj@bp.renesas.com, 
	wsa+renesas@sang-engineering.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2025 at 2:09=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> =
wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add DT overlay for SCIF1 (of the Renesas RZ/G3S SoC) routed through the
> PMOD1_3A interface available on the Renesas RZ SMARC Carrier II board.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -143,6 +143,9 @@ r9a07g054l2-smarc-cru-csi-ov5645-dtbs :=3D r9a07g054l=
2-smarc.dtb r9a07g054l2-smarc
>  dtb-$(CONFIG_ARCH_R9A07G054) +=3D r9a07g054l2-smarc-cru-csi-ov5645.dtb
>
>  dtb-$(CONFIG_ARCH_R9A08G045) +=3D r9a08g045s33-smarc.dtb
> +dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a08g045s33-smarc-pmod1-type-3a.dtbo
> +r9a08g045s33-smarc-pmod1-type-3a-dtbs :=3D r9a08g045s33-smarc.dtb r9a08g=
045s33-smarc-pmod1-type-3a.dtbo
> +dtb-$(CONFIG_ARCH_R9A07G043) +=3D r9a08g045s33-smarc-pmod1-type-3a.dtb

s/7G043/8G045/ while applying...


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

