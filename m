Return-Path: <linux-renesas-soc+bounces-13012-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B3FA2F235
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 16:55:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5A8C1613DE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2025 15:55:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E47A243967;
	Mon, 10 Feb 2025 15:55:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD44243945;
	Mon, 10 Feb 2025 15:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202899; cv=none; b=qb8BCkpjXWZOT/KKxYYxPXyHwncFgUY/UoQcCQul2kRhM0+zY9N0CBn72PHmcMgxmBftmsiqbLOsqZGTa9qR3fA8xOcob/WEr54qwcIQZ5NZ+EPtiBnBcP7bumWy171/YC8B91wjfUFwVYoyy08ZzTRC7zDwL8A2ioq75nxPqAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202899; c=relaxed/simple;
	bh=hhsFU8gPjECmItok2kUI2lFVPDCYOcaW+TghAH+ay9Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Et65XmO9qRGp6mDkTV80xqjn9gOVtJ6MCGJt7Dpjrk91MfrH6RnXDSgIvo4hnSfopW6BbgB4B7/UW+YCg7mBlh9r0y0Br4BS2w9l4gfcbwM6rm9i5Lt8n9Gio96KXGhMZlKFizk1982rWFhbrTRdK6zDaYgIDoqpBAuH5//MOME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-51eb18130f9so1242096e0c.3;
        Mon, 10 Feb 2025 07:54:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202896; x=1739807696;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JK/1qq/3I2HSkSoByzgJPyKcW6MuWYkz0tPFTzqda8s=;
        b=rTyZPkD1MLp6VwSfiLU0fC72VQM8oef4yqaeWowwYKTwmNDJ1cx90WQwb3gLKOrfSY
         /s3yS6w+89algXwZRbSeLLUmfCPIZ+PqughcusdCJxYOQQT8jrbQSU2I5uckgE7yTqgC
         qJ5FIiwZn7cNaVNecH1yeMsMtLawQm8FRT8Rwxlclb5OJTdOnTvyEVyPJaS1kB0HlaWF
         Zo/QNURZB5S34MEjl75nYWpGTfAozCYxKXOUXbz2r2OUR5MfTTfUmshXhTO5ak5YashN
         ytdSzdRuN34qVVklhxSIDcicZOka6Pz4LjEYBo0ytoyQr1uDmI++s1RsgOI+Hw7hQvB5
         E9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfcGWoKAExrEP5Bg44+dMw4gW748dWzwux4sbukfuurLCqZDt7f5kwwYFyBpoyb/Y62m3YdvAwCECeJXGa@vger.kernel.org, AJvYcCWLdLJh+XE3Sx2a/R9ilZNp2Rdb6vod+m2FMQGoAkeHPBq1WOcEH+Qzl3VkvVan/lFp5g2dWcu8brqIQxqGITwVk7g=@vger.kernel.org, AJvYcCXxcsQA8vzmqr/2SQgO5+qCRavwMuePjq7hgYDoSWpaOPtm5kVGx1Zzvx7SdKvo3dIECLW45OxTUvud@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6mxnK4ZHsE9Z3UA4s5pffMsbDEV6MvurcxN9ieJ+qhcdxGPHB
	0JtSdUPmIYISLneVjLdJFXcxXjpzSdpRKef2PEDLtno+yyF7jlTX+yMnb3IT
X-Gm-Gg: ASbGncuH0P1JVNH9pJu0aWbRxYUaIsDGc6sqhBVXXawR1GZyXxl3vokfXazloMAnA9q
	iH2tkYUzI3hGilhT7vyUMJs8oA8a9tcojagtXRcS8DG3wp6ZdeG0R8zIsRun0EksEU9vL06yAhA
	8Qay/VhhVnikq6chTvV9jad60gGaf2iRAvpCXSG4JiL6sC9Xp2nV7mW2gLudH7srdbn46kiYU8q
	Cnaind1JvGzupe9/jjiyZJjmYOgchLlH4an7wtMjWnov4+wxOiVXNEe5JG2C+I98Zil6gYtm+Yz
	1c7I9rP7kKMQIyxaOPMkI0IQvJcJTzet5YtwU9iPLqyWDRK+QzOStA==
X-Google-Smtp-Source: AGHT+IFFOZGN/ym2gJpCceGs0duNhKS+4twLIIwgt/iw2QH/MfpEqMwEM3Q/94yKWMdDaJast6gXyg==
X-Received: by 2002:a05:6122:a26:b0:520:3e1c:500f with SMTP id 71dfb90a1353d-5205721d689mr267577e0c.8.1739202896568;
        Mon, 10 Feb 2025 07:54:56 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51fde67e00asm727716e0c.18.2025.02.10.07.54.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 07:54:56 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86718c2c3b9so397451241.2;
        Mon, 10 Feb 2025 07:54:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6qnSRgxmn6YjJ8biPz9Xwniu1Rmv0RZmL9IhENvQCacnle+w1pnnaU1kRO8UQaFnpWMcBM2vfPb31EUQ63V0V/c0=@vger.kernel.org, AJvYcCX4UqmbQRIwBjqd3+iyUo4EzgEknrO+TJu6WhkvCLZLAdQWDH0PdYDMdrKZU4WOaAKa0nPf8LiZtQpu@vger.kernel.org, AJvYcCXM67e/TIn4yhzHiAiNeLVCPhIj/rKCj9ay+dQnPoyU1LxRp3onI1IJMtxKmDEDnXoV6aK6XL6NlBjaWIsk@vger.kernel.org
X-Received: by 2002:a05:6102:2d05:b0:4bb:c490:7d77 with SMTP id
 ada2fe7eead31-4bbe054ee9amr241383137.23.1739202896216; Mon, 10 Feb 2025
 07:54:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-14-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-14-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Feb 2025 16:54:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWtX-MK4HNvq2VvBxYdX6WtH5Re2aMz1w_CpCv=+1515A@mail.gmail.com>
X-Gm-Features: AWEUYZlhXz_pMLLXmRFGDXOST8wsuL6L1WEG7yOjaQ_Bnufz2H8DKm6AyuygLEY
Message-ID: <CAMuHMdWtX-MK4HNvq2VvBxYdX6WtH5Re2aMz1w_CpCv=+1515A@mail.gmail.com>
Subject: Re: [PATCH 13/14] arm64: dts: renesas: Add initial support for
 renesas RZ/T2H eval board
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Wed, 29 Jan 2025 at 17:53, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add the initial device tree for the RZ/T2H evaluation board.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> @@ -0,0 +1,37 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Source for the RZ/T2H Development EVK board
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + */
> +
> +/dts-v1/;
> +
> +#include "r9a09g077m44.dtsi"
> +
> +/ {
> +       model = "Renesas Development EVK based on r9a09g077m44";
> +       compatible = "renesas,r9a9g077m44-rzt2h-evk", "renesas,r9a9g077";

"renesas,r9a9g077m44-rzt2h-evk" is undocumented.
Missing "renesas,r9a9g077m44" in between.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

