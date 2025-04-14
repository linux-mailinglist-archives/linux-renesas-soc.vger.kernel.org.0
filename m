Return-Path: <linux-renesas-soc+bounces-15916-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE43A88454
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 16:17:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE100440DA0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Apr 2025 14:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049B527A125;
	Mon, 14 Apr 2025 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xh6AtiVp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8AC27A12A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Apr 2025 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744637904; cv=none; b=LX5tWG68OEub7wskGU6taFfxTYrJPTFOXBkKlLYh8y0/bvGNZNZFvbn+K7Yi2WcMVlOCFbf0zjJXV2XcHyxJQGucnadjd86UuaOPZUx/NedEu6PD2ABdV1uPnzb2/EtCP85dGoBYeo+ULAJTXAW2el/Kw3ZIfGvy4PcIH+nusyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744637904; c=relaxed/simple;
	bh=Pv2V2VhpdkYlbhgVfeukbCv4Tx0mAuBeaBcFT9P0iC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SjvqmLwTnTqrHKQjqRkhyoa1GCetEVQCMl97165rk0MyS+0YXA/blkkIrGn5Xs7GBH2g3GAss6ins2pARYREls8A1iwIe8kCvHZaOSLqKlnjWSkxi4gOS5x8ksnQSbXD1vPBtkV98Y39Ysi564uJwqdzYQmolEWaXlym4KCm1TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xh6AtiVp; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-523de538206so1561306e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Apr 2025 06:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744637902; x=1745242702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdOyg+2P0A9LyI7v9bMQUosGIWlcqV9SODyJZSi6D3s=;
        b=Xh6AtiVpv08YOfGjM+4B/WrT1FSpiZpHWWrP7R9SnBTGu7H2z3SEDK9W6OKK310oHJ
         1v9aKZNggu1//L8cE665coyNS6S3DK75IqmSgiyTQtRmwuIhhgzZLwJxJPYBdd/kctDU
         N79cmXWHm5Ju16ig/vUixcLjvsT7klzT0nJ/nX2nZyWilxA3ryYRKqVCHuJGmGlC8Q+8
         u1ReLz5gL5gWSh/zBoXyqHUsfqlBIwenftfhL6itPfyEtnxxAUUFDkW3iekmzAMNd1BB
         3XEHb7gv+7RZNIJaSuxbli34LO1oplZFXTGiEr1ZuLFyrZJD98W5UTVZUVfJOCHMefR+
         4XlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744637902; x=1745242702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kdOyg+2P0A9LyI7v9bMQUosGIWlcqV9SODyJZSi6D3s=;
        b=DocKvfFZ1zqH6IWezhnsshUB2gaF3RJlaHndR5a13YwlwfcKrY9SmFN3KD0ecv9Z9N
         YvI1RXUYCiOCREaeIiMb0joZAeQNxCG08e9Mf6D8v5ehDjvrIl09k2+GsVFGJrXBqZer
         gXvlHruv2VTxNdZvpXz034+VqcgyTXZ3Syxitulq1LGxb8o7NIqV+tmb9yIkcCF42QMb
         az86xSrnVgPNzKEm/2x44uhM7wf8sfH6T7gHpuF8g5czdKNrGE4mx2P1TC39nyLnowUw
         WKQgmfg9TGQ2u9qq8rE5Yaya27qjL1ejlV7jiGjYQ5M0JONVLzqxTiqj7g9OGsJLis/4
         sKLw==
X-Forwarded-Encrypted: i=1; AJvYcCVV7BbQvmhK0cKAyxMeNI/HS8N5SIHUEeKc0aBlH4dj82obgIKrDpBswzjA64fChJ9uueac3wKjGTWvp1p8wDoY3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzfqHI7zEnNtkBKOZzD5y00nFManM++TjjKri+tUA23R0uTa9N
	TbH1hYjkFFGyKjgs/dYl0Kmrj0YUre7Ded5E4dAas/Hr69TNbHlz+yNAkuSTLDiY2ttkZ5jH/K+
	p1HoEvVSrzrIN2vAzKjS9z09RSsQ=
X-Gm-Gg: ASbGnctzobsOUm5940HExvMfsR4/Ki3pVeaAzkjQs4//Sp+a0sqx8uGikREOt6sRvVJ
	mZIs7jWn8gG/NIsIQmvvNTX/8Wn1XPLbItXzQWtuKabv8VZMgDepw1+DNFSFMvBVmYEmLgehUKq
	QYrk2A5CK9ZxZpCepoQl0zjQ==
X-Google-Smtp-Source: AGHT+IG13gfr0GAgPV7Ds6Ycn78m/ayki5oSe9Ig4wNkl0vY/C2/ANdgtSPxdF8HCzD9eYF4cxp5yb2fgPpAh/iFRuI=
X-Received: by 2002:a05:6122:8c10:b0:526:1ddd:7603 with SMTP id
 71dfb90a1353d-527c32e67d7mr7637694e0c.0.1744637901961; Mon, 14 Apr 2025
 06:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8a76cfea356d60b15e1108e408ca09f3fff8c0f5.1744203111.git.geert+renesas@glider.be>
In-Reply-To: <8a76cfea356d60b15e1108e408ca09f3fff8c0f5.1744203111.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 14 Apr 2025 14:37:55 +0100
X-Gm-Features: ATxdqUFq7mzF8mtqKYboUma3Z_mmT5V2ML8BQ7asOUIO71cuc31YO-9nWruQ9-Y
Message-ID: <CA+V-a8vB246vpi99NQG9HGrizmqCL+KUxtsakkhkoAh5wuh_pg@mail.gmail.com>
Subject: Re: [PATCH/LOCAL] riscv: rzfive: defconfig: Refresh for v6.15-rc1
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 2:08=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Refresh the defconfig for Renesas RZ/Five systems:
>   - Disable support for the Zbkb ISA extension for bit manipulation
>     instructions, as it is not supported by RZ/Five,
>   - Drop CONFIG_SCHED_DEBUG=3Dn (removed in commit b52173065e0aad82
>     ("sched/debug: Remove CONFIG_SCHED_DEBUG")).
>
> ---
> Not intended for upstream merge.
> To be applied to the topic/renesas-defconfig branch.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/riscv/configs/rzfive_defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/configs/rzfive_defconfig b/arch/riscv/configs/rzf=
ive_defconfig
> index b5462ae3163521d6..e9998a22dee140cd 100644
> --- a/arch/riscv/configs/rzfive_defconfig
> +++ b/arch/riscv/configs/rzfive_defconfig
> @@ -37,6 +37,7 @@ CONFIG_NONPORTABLE=3Dy
>  # CONFIG_RISCV_ISA_ZBA is not set
>  # CONFIG_RISCV_ISA_ZBB is not set
>  # CONFIG_RISCV_ISA_ZBC is not set
> +# CONFIG_RISCV_ISA_ZBKB is not set
>  # CONFIG_RISCV_ISA_ZICBOM is not set
>  # CONFIG_RISCV_ISA_ZICBOZ is not set
>  # CONFIG_RISCV_ISA_VENDOR_EXT_THEAD is not set
> @@ -212,7 +213,6 @@ CONFIG_DEBUG_MEMORY_INIT=3Dy
>  CONFIG_SOFTLOCKUP_DETECTOR=3Dy
>  CONFIG_WQ_WATCHDOG=3Dy
>  CONFIG_WQ_CPU_INTENSIVE_REPORT=3Dy
> -# CONFIG_SCHED_DEBUG is not set
>  CONFIG_DEBUG_RT_MUTEXES=3Dy
>  CONFIG_DEBUG_SPINLOCK=3Dy
>  CONFIG_DEBUG_MUTEXES=3Dy
> --
> 2.43.0
>
>

