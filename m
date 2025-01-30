Return-Path: <linux-renesas-soc+bounces-12735-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 519D3A229BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 09:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD5131887D2E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Jan 2025 08:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3071F1B0422;
	Thu, 30 Jan 2025 08:40:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994821AFB36;
	Thu, 30 Jan 2025 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738226438; cv=none; b=E+Z0a28XV0vARfrZY6cm8CQPWeUBMVVht3atQK2c51fGwJiEA/J1bfD+sv8xgkizgyl4KCMwXZqKgPyVYYuUc821YweET/Pkg2pFZ0YbmWHk4KqmBe+jXyQEgK30DFht0ZS3bCNzRGNCJ//72+l8i01cfnWhDvFdNmBtOqnmqek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738226438; c=relaxed/simple;
	bh=I25I53tKnpgJTRS/GrRux20jaj3Vvn2RwNk+4ICeVgU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YYU8GbmepDrpwrMkluuLUoeoZ57xlbrfy8MGvG7YyV59/t6ISnYJy5M8Bm3oW6yNXuvEp83aU78f1z5l6LLiXvgqFFtxtnQvxpJMtZCuUvzceyrpvbhlZpqQttEmxDJf14f1/DIwEHSSVq2m4lPlSmQqJdfA4B4EIij8KHt6CMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4b1279ca1d2so169382137.3;
        Thu, 30 Jan 2025 00:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738226434; x=1738831234;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=reKlDefPaChUTykY+ITPpKv9Nus8Na5+cRD7++mWhUI=;
        b=Usd6Zpe5Mgg3nySaUdco6BT8j5NklNj2SPS0413kqHnJN9l7krtKzFKeyjwqh4TEtI
         Lni0CncKgbWKs4tRso9TRyTkFkJc9eSHaPJc9EfqRfPKrf4q7KALtBXyBSCkNGZjC6j3
         bG62+/1E2WFpXbjOjtFA9MrjyUDjSl2aoEdnLTRjIT5Nlq4CyERXukVl66On5taaxxT+
         mVx40VGl8SNrP2KGUQFU5eW23sbklfsFzPn0D+RwwA1k7YknfX+rQ7YUpXNPbx8vsNCI
         G06huM6V038Mv8ymuXBptYI1CD8TKm+J8FyAJNTWZy+yTQpWg5g+bQ7AR1IuFAllLOZc
         p5kA==
X-Forwarded-Encrypted: i=1; AJvYcCU46ZdsgkWGmeyFntUPWgygPcCy+aIfJNhEdqCjdjFpnWZTWJaPhvqKrRIXTNWAaWMatQNYpbQOwvmBVQg0hkfeFl0=@vger.kernel.org, AJvYcCUWZtODl3cFsqcZS2154ZUBdp84RhycJIeo2wZ3VCdeqI1k2+mL4TtT9leXPHculPcS0JNY41sAKpDpNrI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwD/a6jNsFytfEzgurLJXQgy4N6AXbts7iiKM/eE0CPj1OeVJ53
	6PG8HhMbFQv6lMGeOM2yw+0DheCu+1pnWPsUJ/JZO1mPLjDxtoOfc5O4Zn4w
X-Gm-Gg: ASbGncsVfk+8uI+AKNhHyWOAPTr3Sw8p66qmlXieCmfQM+1w3530NtBcXquFrfxkJ6a
	jgrgLvJXKNeg36735VVPsRGbcTZ7LboeZO9LSI8taKJaY61PU+bkihu3zIMhdX4eaJ13wYoLLvd
	ca4YdmQnz2NfN4SUv9cmwkxvmAfOOphph4yvDdWC13e+SzrC3aSqr/t3ArvXaajCheiYKyTMORG
	CUpyvchEZXlap1KNexViagoi1+QO7jbJUTqgIvnMWMgI1ZvNQQsrWkKCSXLXb6I5Cse9Lc75rCB
	kscOWFvGm5qQI0FXr8DGuLosHULTgPNKO5ZN9JKTjwSKAQQmPjE/yQ==
X-Google-Smtp-Source: AGHT+IHEC8BbHV3pzAM7WgMTc1gGGOXf0HfAlRqi+5oYb6wfLZB9r1ScEOB5SxBHeYfxUtZg/VNi+Q==
X-Received: by 2002:a05:6102:3e85:b0:4b2:48ba:9943 with SMTP id ada2fe7eead31-4b9a527dademr6122206137.24.1738226434223;
        Thu, 30 Jan 2025 00:40:34 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-866941f13b0sm166539241.30.2025.01.30.00.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 00:40:33 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4b11a110e4eso180461137.1;
        Thu, 30 Jan 2025 00:40:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVC28MCQiCskGuZtswN8VCvkH+trHD0iINhkbUxMEMN5Dp1wxK8eFNalJrfhqP3sdWe8t2Kkfbbs96WYt8=@vger.kernel.org, AJvYcCWr0rQkodLZ04wM0pTgyGMFUyG4cC0ltP3fSFDt524BVm/HwD9ezKEm/F4gtZT9huAJRW2mUhBRQXEl/IrRa1e0/FA=@vger.kernel.org
X-Received: by 2002:a05:6102:38d4:b0:4b2:ae3a:35d6 with SMTP id
 ada2fe7eead31-4b9a52369camr5735036137.19.1738226433365; Thu, 30 Jan 2025
 00:40:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com> <20250129165122.2980-15-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250129165122.2980-15-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 09:40:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW3KFJzNx3tEpMTobNYT9odEJ3S1g+wx7NY32TFv91TWw@mail.gmail.com>
X-Gm-Features: AWEUYZmW_sT5X4Wa-mPPzDPgmdW5QEJL-LtPYhMiRhBaVWxg-vKjEcEY64LYB6Y
Message-ID: <CAMuHMdW3KFJzNx3tEpMTobNYT9odEJ3S1g+wx7NY32TFv91TWw@mail.gmail.com>
Subject: Re: [PATCH 14/14] defconfig: Enable RZ/T2H Soc and RZ_SCI
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC linux-renesas-soc

On Wed, 29 Jan 2025 at 17:57, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index c62831e61586..a1cc7a37386d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -486,6 +486,7 @@ CONFIG_SERIAL_TEGRA_TCU=y
>  CONFIG_SERIAL_IMX=y
>  CONFIG_SERIAL_IMX_CONSOLE=y
>  CONFIG_SERIAL_SH_SCI=y
> +CONFIG_SERIAL_RZ_SCI=y
>  CONFIG_SERIAL_MSM=y
>  CONFIG_SERIAL_MSM_CONSOLE=y
>  CONFIG_SERIAL_QCOM_GENI=y
> @@ -1457,6 +1458,7 @@ CONFIG_ARCH_R9A07G054=y
>  CONFIG_ARCH_R9A08G045=y
>  CONFIG_ARCH_R9A09G011=y
>  CONFIG_ARCH_R9A09G057=y
> +CONFIG_ARCH_R9A09G077=y
>  CONFIG_ROCKCHIP_IODOMAIN=y
>  CONFIG_ARCH_TEGRA_132_SOC=y
>  CONFIG_ARCH_TEGRA_210_SOC=y
> --
> 2.43.0

