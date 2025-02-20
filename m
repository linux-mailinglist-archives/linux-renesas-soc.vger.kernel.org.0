Return-Path: <linux-renesas-soc+bounces-13397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA2DA3DAB9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 14:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C7F3919C091F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Feb 2025 13:04:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F364D1F3FCB;
	Thu, 20 Feb 2025 13:04:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11F91D63E8;
	Thu, 20 Feb 2025 13:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740056651; cv=none; b=cwpI1rLJIQFrHZFYToBzXxNU4i9tFa+8O4xVtJ95UKF4Drn4RtJM3cY57E2oG1KbkiehA1vRmY/DZJX4VksBcQV1tRp9h/6WTXvIJ+LROH3uzjKsGb4/KwdxCTz+FGSumxrsXkPuSGxFcYTOJhhkJq2S+OwiaGUT38YE5MBxOUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740056651; c=relaxed/simple;
	bh=Mha/8UrxRleFZQYMkP6GQUQk8CTzZhBFY96OkKnYSjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6/JMjq7Pa9L7OU8aOcXl7iAWgyuQV3owcZxDOXkdN9/yGB2hn+ZuhcDnuZJHbOCtc4PRmLg/rlbwBq3cX19Nek+cNG/ZQPggTuxkqEfLUOjSC6eikJO21pKtl5Xd8fOVd0NO9ZDNrCV8gjaMzlnaAMCjzMHjGONQSk3yudedvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46fcbb96ba9so10330321cf.0;
        Thu, 20 Feb 2025 05:04:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740056648; x=1740661448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V6W8Q39R68WnbcobKnCWwlaQPZp7/owzyTSa6NkVd/0=;
        b=BlT76OjD/cc9E6zeDoo0zSN26nhWQ31MUdBn6NqGGkpKd2DAt177AMK59yp5mj9J6C
         HCbPblS6pjPWoUktqgr/hMO+MSZnaC8lserT4D0Q1M3X2GET9KpsPPh2MuiZJqwBya82
         Aa/PD2qn5tA/0sLbgBscqIsObuCP8MT+VhxyGKuxRrmBFPLwVL9GeeI2B8HKcmu/Px0w
         cTavfSaj+Bv/aAQg9bzYf8rDLnIzbOmKAK9NVUGCE/7jbhE40pKl0ZqdikRWVtZduIVt
         vjs+PlC5Wtr57tWLOC6Jvi36z+w8Brgw6rPyvuImV+Codpu3zSEXCKKGU4sVUl/eEgm5
         ZdSA==
X-Forwarded-Encrypted: i=1; AJvYcCUN8ERr+FocLlsfeO7sOSVGvN/ojv6ShViOftcoIUma7smRl01/O4PATLvubo7qWDUyAOqju3oKbg2L7KLl@vger.kernel.org, AJvYcCVXXA2JgFnATcaSbsOZZaS/YznKn9b+w6Ietqcixt48MuMyIzbMzccaQ49lJHYQNNT+PeODdZRp1cYW@vger.kernel.org, AJvYcCWwl+LRAtaRnSO1m3p0av3qJMrP8bBKCyokckuSIor1iI8K4/b1KuZBMPo5JwuvvK6QcsP6tS8qmWe23sONm4BuY1k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5Qx28cpuHmiFaJb4MY1xuYfvNB0upV1ctQmlpRwPNdoBjnvpf
	BAwyLzq2NhHiVSre8VLll17kvdusLkrmjMopN6BWBECOZqZuidZQtJnFa/SQ
X-Gm-Gg: ASbGncvk4XDmkr1rhvWuo92oGpU2RygJXwDm6oucz8o9VcGzdfjlKS+BIL7FvGasNK/
	VKQNntGPy62Dk6Xw+yG50x7IDBrfoM/drJaw9E7TMTgMLfV1wxE0VMf4balJmaJgkUa6Ssmc57V
	KB1dw+R6VpesOBoe1HnMAN1SZ1DB0FLZeV5MEsA4Oh6M7E3Fv1yJeIZxYGmd91fTVMgcdZxzNi7
	Bx7fGkUQJ8IrUOcmBMWOI5vTuz9Zaj1r1F2dEjKxYep3/LPSKbW2b7WaqR1tJ9eTA7M606bksZP
	KFmxOoPsWf/cLqDgKURsNSgHQRfPtjOds/xqWI9URtqTya5242JH2A==
X-Google-Smtp-Source: AGHT+IGE2RuroQyGy1aaRRm1atUok6TisnAW63CFyKY/2LW9ya3J7mRQNvGGJcOaMRoGA7v/HGbS3Q==
X-Received: by 2002:a05:622a:1649:b0:472:a26:744c with SMTP id d75a77b69052e-4720a267587mr77432021cf.12.1740056648283;
        Thu, 20 Feb 2025 05:04:08 -0800 (PST)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47206db8041sm23133581cf.39.2025.02.20.05.04.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 05:04:07 -0800 (PST)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dd01781b56so10799886d6.0;
        Thu, 20 Feb 2025 05:04:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVkRRRDRkMhKKLjsT+3dFnTxXBHUMBHzhr3uebWZqr8TQ9C430hKbzFht6fySjl0jCdWCxb9exwewcUzPXV@vger.kernel.org, AJvYcCWblsNfupDfG7m5PXc+eU34p685lMQmJ71WgbAha8uaXWMDIWRaSYlYr87k5nnGEF+JEH82NHKa4QwbRGgbT9Ghig4=@vger.kernel.org, AJvYcCXkWoVp6oWYfJ5CY7PlPOyuXWqQ0dZGvNPytLMpCsL89aUydsukY9aV7g1wuuzk69Y9JnnQr3NyWIHV@vger.kernel.org
X-Received: by 2002:a05:6214:2244:b0:6e6:591b:fa61 with SMTP id
 6a1803df08f44-6e66cc892ccmr359413246d6.7.1740056647522; Thu, 20 Feb 2025
 05:04:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250217105354.551788-1-thierry.bultel.yh@bp.renesas.com> <20250217105354.551788-13-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250217105354.551788-13-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 20 Feb 2025 14:03:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUE0OZrSXDhEDyVgis8wTQiAB6P_RrZYGSNMgGfTnbqwA@mail.gmail.com>
X-Gm-Features: AWEUYZlffVkFKENb1UN5sgmQVBw_zHj8WBpcHEQxtdBCTKHWSHN3FWEQrj0J-tU
Message-ID: <CAMuHMdUE0OZrSXDhEDyVgis8wTQiAB6P_RrZYGSNMgGfTnbqwA@mail.gmail.com>
Subject: Re: [PATCH v2 12/13] arm64: dts: renesas: Add initial support for
 renesas RZ/T2H eval board
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Mon, 17 Feb 2025 at 11:55, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Add the initial device tree for the RZ/T2H evaluation board.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
> @@ -0,0 +1,35 @@
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
> +       compatible = "renesas,r9a9g077m44-rzt2h-evk", "renesas,r9a9g077m44", "renesas,r9a9g077";

s/r9a9g077/r9a09g077/

"make dtbs_check" would have told you...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

