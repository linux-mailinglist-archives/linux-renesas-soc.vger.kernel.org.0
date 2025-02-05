Return-Path: <linux-renesas-soc+bounces-12872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E856FA28E87
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 15:14:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72348162266
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Feb 2025 14:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E1F1494DF;
	Wed,  5 Feb 2025 14:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsGK/3QF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316651519AA
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Feb 2025 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738764844; cv=none; b=mm9m+nlfU0CTDRzrdhANhIeVw+HrjbWe9TnK9uJ7rf1MsoH6n/lntQKS82uyMiTYslE/0XZ5lcCkwQa1O7EHvT2FWtyZmkdi/evU3ATJ2AtmgUtWMGmjcwpVVUT8umhKqfNNmLPjeewBBAXxPuGuU5oQ3Jiu9JqA4sm6kEOIs6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738764844; c=relaxed/simple;
	bh=8G3pdmLPUL8nwQ67PrY+OiDknV/QWiQsMXtrZALGckc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m0PIHRQ8knvuAqrQ1aEbRdRH4OzNx2gVoOpOKcKYi0P6aGVTogTA/y0WDT50rntDJagtYjjnBZpS9eS24IJioIJcLNCLEb+Eg2d9f3I4/xy9dQMc3oOY31bKO3hvn8lLIHjH2nHQL1WplF9j3QW6OYdgDnmQK2wu8IFA/NfPJlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsGK/3QF; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-51eb1818d4fso3523445e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 05 Feb 2025 06:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738764842; x=1739369642; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0xTWwRdjjKhlQ5L0/DBHR6AelyLikMHlBGThrkh4pU=;
        b=bsGK/3QFI69s+j+E4xfZ6APM/3SP+GFLCjGYTukJgFbNucSMMmBqFJOIaZiRo6uVmu
         L646zkPlg0YqyIUPyuDTmaI5fAcaIkkHWRj3z0DsG8mwIgx7MPEMNOwuH9J3hNAElw00
         BLPL9i2kknnUoGA3a2gSdlmNO/gyqISKfReoqrpYEUwHn3UjZX0FdEbhBHMzuTMEvKyp
         gJSikHeZ1qsLx9PXskNMOSpOTpsM6R0PWg5h0uC3tCX1uAOUf6KlGcqM9boRvyFU+FQP
         grzd0Pbb5lKZJX/WjuCpcCbmEbPCe8bf2eb8QA0XrmJt2+W48dO/YzN4ULESL5etdVaZ
         9S6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738764842; x=1739369642;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i0xTWwRdjjKhlQ5L0/DBHR6AelyLikMHlBGThrkh4pU=;
        b=GSb//+8L/Y04AD4YyU+QWrJr/KVufL1eJyt0pZOSZ3gqIPfN3WMIBgtOPnbIWtu/kL
         kou3SzCR+MYusbpP2hvNn/UdCwM1XxW9JxcS7aASBaaThumNwwKRRo5N0zTIf3Y+/298
         6eKuWsYe/cKYKFRdJZuR1ym4GoFZ8N6mO3pRXyJ3QVYad/HRD/MSPWUS7eKVy6k5Ol8f
         PWav57lqpWso3HQ5vGMfaUZhyqfSy4/uovYxgdxnchdTRTtmxAer0la4JNq9xBA3EXBm
         3o9S+IC1NPlPzQb/qxPmrdHFNRRbZ2uRs2LvUo+ZIasD+uzxNl7DRWGOhpPf2KSlt68N
         ExRg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Pcgkv+xxUP3ZqVNrdsMyYq7XS4EIoq50DdswPY/lHCZbj5S3B9gR9nVH1GAd/4rvO9UputP4WkKGgOEU0tPcoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDIy4N4L6dzCo2GGgbw33Vo2SluPvY/Xw2UU0ANVrjiObaKPRt
	zOyhm9iZ70FMAxSb9ulaawNBg/YQO1Ilc2Nxjh4+l/SHbZGIjW2LVwQTli6ZlR4B6CzeV3gUA54
	sfpykrLgceMgc4FECk/ussQBz/oM=
X-Gm-Gg: ASbGncv4/ZkYUJjdMbns59wjhlO9cXM+qS7b+ODMO5HZ5XvFuLZzUY2lOzaQytALjrH
	lx0vTZCrUsdYwhGn9JoBpoJ+DHwjIbA05Yv6VYO5IlwLz9pHeF2YkXP9B5Gbr43r0shC0dNHu
X-Google-Smtp-Source: AGHT+IH0hm1roYOsKfWhB9Oc9nU9TN7dMhTrVhBpALu5/YhxdXJVjaTpzRXH/M3caU472fR/U2lIIlsiOdKsUsJkt6w=
X-Received: by 2002:a05:6122:3542:b0:518:9040:6700 with SMTP id
 71dfb90a1353d-51f0c51b48emr2049535e0c.11.1738764841890; Wed, 05 Feb 2025
 06:14:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d184b4527cf7791f8c0d6f46ce4c901e662692df.1738749745.git.geert+renesas@glider.be>
In-Reply-To: <d184b4527cf7791f8c0d6f46ce4c901e662692df.1738749745.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 5 Feb 2025 14:13:36 +0000
X-Gm-Features: AWEUYZmZ9ptk2ug06M4_mUepyObgEbqM_WZibh21YXaeJDb9Pal_0-SRMrYAPP4
Message-ID: <CA+V-a8uFq_jam5UJ8ytwg+LmuD3odPf3UH0dtxdv4gvjNvnpLQ@mail.gmail.com>
Subject: Re: [PATCH LOCAL] riscv: rzfive: defconfig: Disable unsupported ISA extensions
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 10:10=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Disable support for ISA extensions that are not supported by RZ/Five:
>   - Svnapot extension support for supervisor mode NAPOT pages,
>   - Svpbmt extension support for supervisor mode page-based memory
>     types,
>   - VECTOR extension support,
>   - Zawrs extension support for more efficient busy waiting,
>   - Zba and Zbb extension support for bit manipulation instructions,
>   - Zbc extension support for carry-less multiplication
>     instructions,
>   - Zicboz extension support for faster zeroing of memory,
>   - T-Head vendor extension support.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Not intended for upstream merge.
> To be applied to the topic/renesas-defconfig branch.
> ---
>  arch/riscv/configs/rzfive_defconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Boot tested on v6.14-rc1

Cheers,
Prabhakar

> diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzf=
ive_defconfig
> index 14bb3fa1ed104d6e..b98acc93e3e37566 100644
> --- a/arch/riscv/configs/rzfive_defconfig
> +++ b/arch/riscv/configs/rzfive_defconfig
> @@ -31,7 +31,16 @@ CONFIG_ARCH_RENESAS=3Dy
>  CONFIG_ERRATA_SIFIVE=3Dy
>  CONFIG_NONPORTABLE=3Dy
>  # CONFIG_RISCV_ISA_SUPM is not set
> +# CONFIG_RISCV_ISA_SVNAPOT is not set
> +# CONFIG_RISCV_ISA_SVPBMT is not set
> +# CONFIG_RISCV_ISA_V is not set
> +# CONFIG_RISCV_ISA_ZAWRS is not set
> +# CONFIG_RISCV_ISA_ZBA is not set
> +# CONFIG_RISCV_ISA_ZBB is not set
> +# CONFIG_RISCV_ISA_ZBC is not set
>  # CONFIG_RISCV_ISA_ZICBOM is not set
> +# CONFIG_RISCV_ISA_ZICBOZ is not set
> +# CONFIG_RISCV_ISA_VENDOR_EXT_THEAD is not set
>  # CONFIG_EFI is not set
>  CONFIG_PM_AUTOSLEEP=3Dy
>  CONFIG_CPU_IDLE=3Dy
> --
> 2.43.0
>
>

