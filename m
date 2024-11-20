Return-Path: <linux-renesas-soc+bounces-10645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F729D4349
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 21:56:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 89B54B2478E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Nov 2024 20:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D51E1A7259;
	Wed, 20 Nov 2024 20:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UqXhWAqU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0883B13C695;
	Wed, 20 Nov 2024 20:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732136155; cv=none; b=SoZsCQsM+zWxjCnJrqpCOG9xuDBhCq8EOdYB/9oNe5HiKiIPkf0geEtmk64cFmgqW2Yx60yLEW4e28ROrxP81sXZgKWKf/tm4327cyLgibxfyVJwobmAyTXqVG3NgUo9CWNu6RsL2jGUPpqG/l21BgkFV2Z060a20OICcvbp0/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732136155; c=relaxed/simple;
	bh=ZisMCBuDw4zgg6vBzkFwOHsOdnjH2kev28w+6dW7xcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gy0fUQ3Qt9sdOS8NGsgX3WIM6972KFWeLYHeqN7mQ60kkq1S3TdncWU+mt4ksH2IMm2eYJRu2d/mXCxYrVf6slRktM+2yod0Ms5jYcNYnhYifGR6srxtwA8qbdH6gu/j34e3vi1HLjT5NK120fUyUcp/uRWA0UvRnbkfnC9G4zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UqXhWAqU; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-50d525be53eso63737e0c.0;
        Wed, 20 Nov 2024 12:55:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732136152; x=1732740952; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GEU16SY6D2+FNGsv+vi6MOGftSt+XXRnPBa2/XQnoQ=;
        b=UqXhWAqUWzrlOcTvHNVMx9zT35OCt8VCoORUNOrDLi0SipsynV3cYTRyVzXNxBXhoA
         6PE04nWoKs8YuORTV7/GJNpNfORX+cw3/m7u4g057e8GBP2xBYkwMPaMhI3QM86p93l1
         NMo7hu/zehUpg7nawqBFo93rEhVanF7g22868+XN+UpcUyVeHVx8X4aWX9luR4EqncyY
         pMT5qxvfF53WeGiF0fJuPviHR8Y/qreNTgn3vH45uWSOycnS8io55nvTTao9Tqp0NZ56
         h2xcYX1K5gF0gvIuWg/77LM8EmPM5t+9uyc9DsoT/G0FYWztAShjlVh6QVD7pSZaF3u8
         mfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732136152; x=1732740952;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GEU16SY6D2+FNGsv+vi6MOGftSt+XXRnPBa2/XQnoQ=;
        b=pd9z/BxhtDXUeoy8bxyV7FMcnEhEipWGI0mw+BSXro8k3egV+6DvelHaREJUUGyZDu
         ESpmv6a7F8WUK21Du1QPEtZ/MP/7RsQ2SSMMkzbeJs1+o/rE5QWDutyx7mFnAX8SvlzI
         BEGZcFO0mZfIFm3ELbTEyFC+2a83hDyyupZqTkGKQctMG8sBiclNX0idNTC5uREWCsyY
         YOFub15Qx+9/dJdDcdMvRqK44NiYiqSFkjHsTcLMFeeKd0GgDO+54rdJ/v/zYpRWXI4L
         PJkzzFHG6U89nEg83HRbtPuYvgZ9dEecuhuW+dANkxHtS5Mpnu8fzqSHG9F2cy/YXnLP
         FAAw==
X-Forwarded-Encrypted: i=1; AJvYcCWGIwo5LRbNxkz3EgmpHtA9h84UlpapKo+rIEsFS/iUPnYHnz3dDogiSx5DPJGUXQ40g+5U3o74BbpMIcY=@vger.kernel.org, AJvYcCXhJRwh7nbrkKJKRMSOBrWy81QkvypBMncSyjCtwWmvafQGsi5mfY9jCiUsmQMnhMgsxtNF5b3UVT6iBk4j45rCi8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpomzypcO3lAqJCbLvw281PctnCLSaKSHWKn/VzjP/wM/TH59v
	bYPZbqBhfVRkP5EYSq7TuJQloXStCKrjk82JldIpmfPOizY5FR1YPLpcptcYDKCL3WSEozeRt8Q
	4EbcGqFBNF6WVnHMZpLS0iJDUZIE=
X-Google-Smtp-Source: AGHT+IEJuSywj88ou3300eGP//EzJLr4FP2P+jKiwz9tfQIZzaYG3//rsXhc6t95YYxAuz5GXhpf8bORiIoKSUEgTug=
X-Received: by 2002:a05:6122:3d0c:b0:50d:4cb8:5b10 with SMTP id
 71dfb90a1353d-514cf8bbcc0mr5324149e0c.4.1732136151922; Wed, 20 Nov 2024
 12:55:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d33c9e3245c0bd3073d9618fcd014ba37e90e6bd.1732098271.git.geert+renesas@glider.be>
In-Reply-To: <d33c9e3245c0bd3073d9618fcd014ba37e90e6bd.1732098271.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 20 Nov 2024 20:55:25 +0000
Message-ID: <CA+V-a8uo3R8OpzRCJWLU9K=DgKw=JrLdLX76RER1mt9Lqmi6KQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: Disable Renesas SoC support
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 10:28=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Follow-up to commit e36ddf3226864e09 ("riscv: defconfig: Disable RZ/Five
> peripheral support") in v6.12-rc1:
>
>   - Disable ARCH_RENESAS, too, as currently RZ/Five is the sole Renesas
>     RISC-V SoC,
>   - Drop no longer needed explicit disable of USB_XHCI_RCAR, which
>     depends on ARCH_RENESAS.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Apparently I forgot to submit this, probably due to Palmer's version
> https://lore.kernel.org/all/20240917131936.18980-1-palmer@rivosinc.com
>
>  arch/riscv/configs/defconfig | 2 --
>  1 file changed, 2 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index b4a37345703eb357..db0ce2c2c766ac15 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -27,7 +27,6 @@ CONFIG_EXPERT=3Dy
>  # CONFIG_SYSFS_SYSCALL is not set
>  CONFIG_PROFILING=3Dy
>  CONFIG_ARCH_MICROCHIP=3Dy
> -CONFIG_ARCH_RENESAS=3Dy
>  CONFIG_ARCH_SIFIVE=3Dy
>  CONFIG_ARCH_SOPHGO=3Dy
>  CONFIG_SOC_STARFIVE=3Dy
> @@ -201,7 +200,6 @@ CONFIG_USB=3Dy
>  CONFIG_USB_OTG=3Dy
>  CONFIG_USB_XHCI_HCD=3Dy
>  CONFIG_USB_XHCI_PLATFORM=3Dy
> -# CONFIG_USB_XHCI_RCAR is not set
>  CONFIG_USB_EHCI_HCD=3Dy
>  CONFIG_USB_EHCI_HCD_PLATFORM=3Dy
>  CONFIG_USB_OHCI_HCD=3Dy
> --
> 2.34.1
>
>

