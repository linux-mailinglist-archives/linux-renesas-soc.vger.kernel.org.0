Return-Path: <linux-renesas-soc+bounces-17027-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5860DAB4CFC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 09:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A99F866EFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 07:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273AD1F0E2D;
	Tue, 13 May 2025 07:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OoYGeyAA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA2E1E5207;
	Tue, 13 May 2025 07:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122200; cv=none; b=VSJnatwz0HuF1Z+6xuKHxSwI6IVwiZFq3MLWyml05NjH5DGe0syt808lSejW93HZ9+rtdzSac4THo6iTB/wrXbxRDvCjqw5zK2oOfTUaAlI14DbJ+LGsXw/Es/XfRebAAWHvNCqi7bfZzon0+zS0jIvczaFLsc1i0pqQJtXs9Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122200; c=relaxed/simple;
	bh=jolsXHXKcmam1GMy6yynZRDnDDKcH0YQBj1q8mdncu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LlL48gsFKqmwFWcSESizvlQ05Axw4h3nYgDbknEwi0AvoPEVD2d0Qd50CJlTEqEq8MnJVxyW2sO14IzK1Y3ejUv4v74v2OSDYzglwyClCUebBPi9pfyGR8S1tcnVFGlGVGRQD13u03IZYfagkO0TToaWR0jdGxyIK60hR1mYs7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OoYGeyAA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a1d8c09674so2752290f8f.1;
        Tue, 13 May 2025 00:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747122195; x=1747726995; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fG8oqj+Wp78YD53lMG3NWPJMEgG7b7UFy7qM2sNYujM=;
        b=OoYGeyAAVV5eNvpgduPOelqJH975lQ5TiiSVm+i2kZVhoEd8vnp5u9niUOS0giUOly
         uoiZRnmioisFCKnpg6uXv6uXaaUZLDnycttyry5YG0hpMdsuFp2D7Btx8fN3CfF3Zq58
         aHzlc5R8E3zNBUNiafnUh8iU8rfr5oVZo4ZbzkirTmnSiiW6wp3T90tWIWn1maPSZz9E
         2w5cLs16sqyD9TiUPsuB1VQ//9wb4I4geXb10dH0Kld0DQugg/nGWG9qlkAM83NVwbZW
         pZON9516mYSECpj8+zJXpyIMjvO4g8OUTPAQQegxRom622n5IeXCGLW8HigzFUeRCi2s
         Zn9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747122195; x=1747726995;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fG8oqj+Wp78YD53lMG3NWPJMEgG7b7UFy7qM2sNYujM=;
        b=MAPtQVNZ3qJ9flHy6JekgdLI/Jv4ZMB4tNFawgHtASHAkD//bh+Y40cWd5lhQcwiBQ
         OXfwcYmpYONOAL9vzxbP3RkQQu6h3dhPGJ3IpkmSK6AWcb3k3i7XqdkbDUCiqaov8g+g
         GE8iPyJ3nL8ERwdy2tm8YKBSMqYNP8MUtfFv/Lvxplqu4GZPhBHiZnsloZrXi1qCKDjb
         xje303mLbSAOSdX/SftS2Ue5Bcgkb3OKxLH1KEF5cUzqKMe2xgbqpaVC+44Ocqg8gQCh
         fPX/pw7DogtWW/QiMtmBqarJi+Xgomc/rTI43BmrUsTLHXZf8ziUxb67KUxl951zzok6
         Nigw==
X-Forwarded-Encrypted: i=1; AJvYcCUOTASAAOVhgDJ/jw1MPJmOlzR2Cq5H0396IvNk3P0e0GRjuTcrEJZ+paJOASVIjV/Kv13+g4Z8OVw7@vger.kernel.org, AJvYcCXO/h9L2z23ldAoR78ELjqFDyxwn7Yxu9HURlm5yQDt+5oxebXVB4PxTFFG514PSbr8zugj8scUgdQ+p3V2@vger.kernel.org
X-Gm-Message-State: AOJu0YwIaa2tcV2IGbv4uJstIqOWPzqDlh4oJtCBjacOS/DmuqwwcLEV
	iQ2ZlioUdBpQ7RL2263Ywznzcl517ehDCHt94ERGvoa9OFYansOBpuAp5bw1h7WFDL/aNQFbgr/
	0dhNC1q3E8SXnJcI2JUbnoaEXn7g=
X-Gm-Gg: ASbGncuNtAKU98b1Kfy75i47DDPE1s1fNU5+qFsDcT/k7kwlfu9J7AX8wM9lcy0OozU
	vnYQ3iASk/ehTwOK+BSXbDfgotnNJrxph7LBZlIzbKLSMs1PtFhluuODy3ubbT51A+s2gvfnIeV
	lK/qU52z7uqGvC1AkiP8aeDl0EwDniL3bpevJW2NxT3yQVAw==
X-Google-Smtp-Source: AGHT+IEZGFUBGfpFWoH02PF3w4asX5yVpyJ9KxOfndhTR3c9CFgfuFIy472TCk4Qb3+UWsnv0YDG9mgYiKqGQ6eYoMg=
X-Received: by 2002:a05:6000:430e:b0:3a0:b5ec:f05f with SMTP id
 ffacd0b85a97d-3a1f6482aabmr12175878f8f.39.1747122195541; Tue, 13 May 2025
 00:43:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512-daily-saga-36a3a017dd42@spud> <20250512-sphere-plenty-8ce4cd772745@spud>
In-Reply-To: <20250512-sphere-plenty-8ce4cd772745@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 13 May 2025 08:42:48 +0100
X-Gm-Features: AX0GCFuqAHW_El1GmwQL0ffwl-eOvi3d0MKWaPdlKXmQfFMsGd_d4EiSnbBSRgQ
Message-ID: <CA+V-a8tgkNd92USA99UtgydA7F6BdYYB=eBXF7VNR_4h6ViOzA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: renesas: add specific RZ/Five cache compatible
To: Conor Dooley <conor@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 2:48=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> When the binding was originally written, it was assumed that all
> ax45mp-caches had the same properties etc. This has turned out to be
> incorrect, as the QiLai SoC has a different number of cache-sets.
>
> Add a specific compatible for the RZ/Five for property enforcement and
> in case there turns out to be additional differences between these
> implementations of the cache controller.
>
> Acked-by: Ben Zong-You Xie <ben717@andestech.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boo=
t/dts/renesas/r9a07g043f.dtsi
> index e0ddf8f602c79..a8bcb26f42700 100644
> --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> @@ -143,7 +143,8 @@ plic: interrupt-controller@12c00000 {
>         };
>
>         l2cache: cache-controller@13400000 {
> -               compatible =3D "andestech,ax45mp-cache", "cache";
> +               compatible =3D "renesas,r9a07g043f-ax45mp-cache", "andest=
ech,ax45mp-cache",
> +                            "cache";
>                 reg =3D <0x0 0x13400000 0x0 0x100000>;
>                 interrupts =3D <SOC_PERIPHERAL_IRQ(476) IRQ_TYPE_LEVEL_HI=
GH>;
>                 cache-size =3D <0x40000>;
> --
> 2.45.2
>
>

