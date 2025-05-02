Return-Path: <linux-renesas-soc+bounces-16646-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10780AA751D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 16:38:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DB5C7A1EF3
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 May 2025 14:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 031D62561AA;
	Fri,  2 May 2025 14:37:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9528533987;
	Fri,  2 May 2025 14:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746196677; cv=none; b=WJgobdP2bCbV8S62N1uSyZM/7ji72hrb2cq9OsRGhB9qANvYYWf5aCdhFufe95SufsoqQ0gCkgBlL2gxEU0bUPePvpH1E6712XrZJvCtCu5So2WdD8ZtDD+tBUgU5wk0FkuRNCwxgq+qU8dSUSs952FCSjlkbkqHab3D9oIT/2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746196677; c=relaxed/simple;
	bh=vzgrb/q3Hm4MTaMlWwWBlnRqa79jcllS5HRJIz+gNbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLwqrBMo0OBao7Cn8119k7d+SkednsoOWlbgRS4IKg+KEqV1IOLkpJInVUj39Ewbw62lkYMQdiAoGxLfS0kMkwF+R4iYCvgV7uDcFT8jkbmhbT8drn2xOcqd9CsJKIQzWRGbg9s3x17k18s70gudoJ/uMt+qWQuYSa8PgMQJTYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86b9d1f729eso553174241.3;
        Fri, 02 May 2025 07:37:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746196674; x=1746801474;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djH4HCkZ8fHRpSMq+w9X5Wtnm+h0rA+LbETzrFeQVdY=;
        b=Gc9rP+O50iiHtztdtZSTzsVMVlwSfYFoxIqOuNFQeUndKhnmR4CBLJCblkKSqWkKzQ
         PU345QlBMl8or5rj4kVb3Tifm7pGtFkhyHVHHDmuAIrRO1PmbBwv2uMGZQAiVYu28FP6
         R4CkBr6pxBb1M2YV38bA6DNvmUjbsLSY6VW3sAMZle2RsqwMBP20SdeyyoyxI37UklCK
         VXzDakQO/oussCICV/SfVttWTPH61hsnMjRTfJWGwIsrXYxLCgqHSohCabNuZfSlrCPs
         +EDZs4D2QUn/jbulwIyrUIN4i4i6iz3GDHilBxJTAyUsVqOEmkDwE1wpxkIck686FXWY
         w4Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUHm7u2n23WQbJZ1Emw6suF0DGnQCS1HKsHyqlIXx5EgLgRT7B2+TDGdEtKdqXHJRhIiLWat+Ub5YtdArwi@vger.kernel.org, AJvYcCVRhs8qtH+RZpwAWMr+69syT7MBgEOMxvDcQBuGa+40jQFo3JlYJcstX3CAcAh5xV0mGnuovoLzHJsdGDM6Rn9irSo=@vger.kernel.org, AJvYcCWShQwqjU88kbV8PG3tFI0LQBpnvliHL/ixI8Wb7O2J+ju6WikALk8iQxgokTmGbriF4hSaj/1SPnWS@vger.kernel.org
X-Gm-Message-State: AOJu0YwpXLo966OavUZ8lJEZnJbZq9R8KBNgw+xZ7aueDtySf4h6iAQb
	pbPTOMZXeQsoWykAWQt+HIJ80gI/6MZlIGy9V0GFEXS3BTNBz6qANgj/FXrZ
X-Gm-Gg: ASbGncvKe5uDVEpwXkMmsBfCYptiqxxTF6ZgOmfmppBRd0rEeobmE0ruJ2DaFbC706c
	Opv4TAc5fXTQpiQJx5ausZG8pCi5SY48jKWmmt37ykIVsx2kOL2l3RsaFuR4J86hNSnTCVT3Bui
	eoFrG6QTlmEl0iiQ+/yO49XnJrpQiMvai6xYWYeVgiBsFICeb07pS7rVz6mdU885Ek+HG5JMRlz
	8jsqUvaAXBLazDy4Uq0vfBfdc84e19b5dyiXu4p0a0/Ql83czwEKKMd4vs4kiZI/yjE6l6R4qV4
	ncSKyKBC0MDPc7IlCwE6KpcAmJ53hgCdr4FGbhYZIoQcUN7+Tn8x+4cGIBgxmxQqAaov5ZUXciE
	fmXkrgoIdBoa2lg==
X-Google-Smtp-Source: AGHT+IERqBXqrt92Awczcok8WHg32ZBmC0GA/7zPOV3ZdcEacFcK+wEzNJ9sIdOSAsHM/PJHGibkPw==
X-Received: by 2002:a05:6102:80a6:b0:4c4:dead:2f36 with SMTP id ada2fe7eead31-4dafb20efa3mr2370719137.0.1746196674152;
        Fri, 02 May 2025 07:37:54 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8780affe7c1sm282969241.11.2025.05.02.07.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 07:37:53 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4c9b2beb272so517101137.0;
        Fri, 02 May 2025 07:37:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWETlzIR5rv13WR5EZr4aO3SF1zXxom6SYJC/HUmRCecKDl9OP5w3W9yfh2basXa8E8TVPzXgAtbhTb@vger.kernel.org, AJvYcCXReGVuIeTtYQG5u2BLK26uIIsANrtUchGrjce9Fqk9zWd0FoGCSmvY8KBWhUh9Hd1G9PHFq7CXSDIQ6mgFx41CKUw=@vger.kernel.org, AJvYcCXUzLxWLM8XV3Fj3c6sbFn/0/Brq9LKTt0SIcLPc8ZENZZ2wzpBdvyPqdTPo5WxToathDwur9HiUXfN66Q/@vger.kernel.org
X-Received: by 2002:a05:6102:3ca0:b0:4c3:64bd:5405 with SMTP id
 ada2fe7eead31-4dafb4e491amr2229877137.9.1746196673576; Fri, 02 May 2025
 07:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502124627.69644-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250502124627.69644-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 2 May 2025 16:37:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
X-Gm-Features: ATxdqUGHGVa5bIvq47sWpJM4d0i9BJCZPMZeIzvLmuPiSn_UaSOHz6YGgg0iKKU
Message-ID: <CAMuHMdVXeBUah-r0YQsjhvxeja9oMZpLYZHTwxgdi=ezqY=iBw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clocksource/drivers/renesas-ostm: Enable reprobe
 for all ARM64 SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Chris Brandt <chris.brandt@renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Fri, 2 May 2025 at 14:47, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Change the OSTM driver's probe condition to `CONFIG_ARM64` so that the
> platform driver will defer and reprobe on any ARM64 Renesas SoC once its
> reset controller is available. Previously, only RZ/G2L and RZ/V2H(P)
> were covered.
>
> By matching on `CONFIG_ARM64`, this avoids adding a new config entry
> for each future ARM64 Renesas SoC with OSTM IP. RZ/A1 and RZ/A2 (ARM32)
> are unaffected-they still use OSTM but do not define a resets property,
> so the deferred reprobe mechanism is unnecessary.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Hi Geert,
> I've restored the Reviewed-by tag from v1 with your suggestions applied.
> I hope you're okay with this.
> Cheers, Prabhakar
>
> v1->v2:
> - Instead of adding config for new SoC, changed the probe condition to
>   `CONFIG_ARM64`.
> - Updated commit message
> - Added a Reviewed-by tag from Geert.
> ---
>  drivers/clocksource/renesas-ostm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
> index 3fcbd02b2483..6a5785f9c9c1 100644
> --- a/drivers/clocksource/renesas-ostm.c
> +++ b/drivers/clocksource/renesas-ostm.c
> @@ -225,7 +225,7 @@ static int __init ostm_init(struct device_node *np)
>
>  TIMER_OF_DECLARE(ostm, "renesas,ostm", ostm_init);
>
> -#if defined(CONFIG_ARCH_RZG2L) || defined(CONFIG_ARCH_R9A09G057)
> +#if defined(CONFIG_ARM64)

Sorry, I've just realized RZ/Five also wants this.

"#ifndef CONFIG_ARM"?

>  static int __init ostm_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

