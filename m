Return-Path: <linux-renesas-soc+bounces-17351-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA18AC084A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 11:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D03011BC144D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 09:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3179158A09;
	Thu, 22 May 2025 09:15:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A07CC2EF;
	Thu, 22 May 2025 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747905331; cv=none; b=qvD7GyMb6C/l11MKNQ/sdMjsEhYYxd3mqUPRobphpvRd8MpOEsb7gUCp02aqGeJn63smh7JwEanr6Jc6UMyWKTs+B9QcXq/TxLzJO6ce6P9wYaYOEEIKXaLiWqF/jBQTnYRsdMD0lrQb09qBVfB+ynRpOT2KsLKfYQLChJEQhIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747905331; c=relaxed/simple;
	bh=YD6GihKh1cczePzoQGpCMcErqyKih26+mFItiyntCnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPhrAh8fh8Ctz3zJqoaFOgNjg+AKH1apBmEI5KY3JWK3Fa05OuhRB+3Ed9/TrpYsY8RCaKklSvpmuMH7wKWpacDPvO/JThj+x29y8szYFC9rOFBm4Ha3k8NKs8FKxSD8u8Z0StPCtnZ9w6ShdV/R6Gj9HXAmfiW1HS4MaMa4EXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4dfa2aeec86so2776330137.1;
        Thu, 22 May 2025 02:15:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747905329; x=1748510129;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mtHcMdP/wOh1XJjpbNuQz6SWOI2tVDt0ecPazsD7iGY=;
        b=AcPLkPhm2x2so5WJ/piC2b04teuQBgi0tWEtUQkIMKNc3Stg7vhuJcRX+x8FfBClAn
         WrQPEgxFob7n6EZhceTwJlggdGdvbLMfC2YcB7RHlpBHnWJIHh9yyZqluWQD9t7zIbZ5
         GxXtXhjqB5/85b2/svhG/OMZ8GqycanUlxEzSh/7PDZdV70g4TzLBpqGIbntqpKL5En2
         /tRF0tqIDAuz2XVB5cTsY1OU9XPwHfZoc+VlpFTGXGJxC8Vle7bT8l0Nuqvm3jfMKrgh
         +N/JFSYCkzLZO6AUtKaz7MTRmjQipnm+lyK4MWiWh8A7svzqRWggDFL184bTyA3X2PIb
         R+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWxUdAxb078aPXIwj5NkejiMJNz0V4eOUQ0Z/SsiLGPtm2VPKPm5WzqvJUjyBHxRzha3jx+ugLJqEyu@vger.kernel.org, AJvYcCXUxDO7PUVPNVhByiVPkg8gtlMl275Ap6AMXhlbFdGjB0NfrWNGLHyUyFJh1cicKkcch982vagyMdZKASbx@vger.kernel.org, AJvYcCXqZGeSG8wt30HXV+guyJ2EkqBuD9/KWbE6li0nEUf7GbZ59HzQD5scuFT9r7jQak5UQYkLIlUhXMCb8XCEmUGJ/yE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1b1HxEPd8/ny8fy1OQzRKCvfscioQ6bxQpnVVhxZZrQvbvRwZ
	bFB4LVpL44tim9H7n4KHSIVYHoboRNaQGAJUOnd5mXG+W+RS2kaXolVCAv97k+sK
X-Gm-Gg: ASbGncscLnqEnaY1RkbMxZpJKfjOYzbku42oBADyoeCf+M2eiq/u4RDJflNp44EcyJz
	8uU98YD82Jw2+aQgrX0J9B7b1jxfnxwDCfpdm5Z8QJauPCoU+Rr1/CBnOo/ZGELKYdzcA1dI33f
	lLwOq09XSyRToN3OszPmxxQnTBEkfT/Z0yZr44ovf1K5e9GDV58osMdmL7PGPooWZg7q14XJnrf
	21K6x0RYwHz0W3VRIfu9010e87/xYf4SUcWONe9hn7CkaFa+kiZW+XCLxHRyoEX8nHvCv1Hv1+Q
	DbF4ETbo12LjGr8IKJa5pRvUFn12B6cSQHNmltyVhsU5Q9kMYFtIpUPg3HnG/pnxj8a1l8io618
	O+1+HbI8zO6fISnZzTptf019T
X-Google-Smtp-Source: AGHT+IHf4OfjbPqiaHBlrlWV3/y0Fvmk1ldFF6JknHDAJNlawQoiEbDUnsHZPsF6M+0ndfLXyERXYg==
X-Received: by 2002:a05:6102:f13:b0:4e2:bae4:200 with SMTP id ada2fe7eead31-4e2bae40b81mr5578266137.17.1747905328789;
        Thu, 22 May 2025 02:15:28 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec2299a2sm10273043241.32.2025.05.22.02.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 02:15:27 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e290e420eeso1388297137.0;
        Thu, 22 May 2025 02:15:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVa7GFpm+AIHTTI2Q2/9flLPDMPtNAnhpib3u5Ry8NarLGvGB6MZbh28W+PII+lqvWdFJHhWGqo1ukK@vger.kernel.org, AJvYcCW+nZrvTrN0qchgvEvo7qyssvh1/3hiisuJ8qXa7DnDb6ZsOSWXsDBEKTmJh0J2nSpF7+LiiZ3GYsr/duJ6@vger.kernel.org, AJvYcCX5LI+LtebKRI4mCCWF5aMmOSk6Gonje4h7j4NV5fZfNOMV0QUnr8+pWnG4qJmBQ5BA+rC9CXp7tsnG+ZvdOTxUWrA=@vger.kernel.org
X-Received: by 2002:a05:6102:f14:b0:4dc:9486:b055 with SMTP id
 ada2fe7eead31-4dfa693fba4mr23514102137.0.1747905327490; Thu, 22 May 2025
 02:15:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250514101528.41663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250514101528.41663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 May 2025 11:15:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7_gBgvvB5GK-CpnPG-dMJYRZhi59xOV6Ejoye-7B6jQ@mail.gmail.com>
X-Gm-Features: AX0GCFs6z3ntZaEj9BBJdu8JY5gNbcvuBF61v5jnmSlXn3hi_STnjOAxMbGJUEo
Message-ID: <CAMuHMdX7_gBgvvB5GK-CpnPG-dMJYRZhi59xOV6Ejoye-7B6jQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] arm64: dts: renesas: r9a09g056: Add GBETH nodes
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Wed, 14 May 2025 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Renesas RZ/V2N SoC is equipped with 2x Synopsys DesignWare Ethernet
> Quality-of-Service IP block version 5.20. Add GBETH nodes to R9A09G056
> RZ/V2N SoC DTSI.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
> @@ -268,6 +268,215 @@ sdhi2_vqmmc: vqmmc-regulator {
>                                 status = "disabled";
>                         };
>                 };
> +
> +               eth0: ethernet@15c30000 {

> +                       mdio0: mdio {
> +                               compatible = "snps,dwmac-mdio";
> +                               #address-cells = <0x1>;

1

> +                               #size-cells = <0x0>;

0

> +                       };

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

