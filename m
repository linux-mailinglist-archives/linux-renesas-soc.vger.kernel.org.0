Return-Path: <linux-renesas-soc+bounces-26341-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B94F0CFD240
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 07 Jan 2026 11:21:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6E603045386
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 Jan 2026 10:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58D712D8379;
	Wed,  7 Jan 2026 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khQCs0FN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAAB2EA468
	for <linux-renesas-soc@vger.kernel.org>; Wed,  7 Jan 2026 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767781074; cv=none; b=CcyqP6Xd4F+pRv8yTZccSqm8hIbY01J15IfzZGePYxrqukKV/bhaK3KDcwYt6xWsM+ejLuRNft/ekMiP0gSCy0LUy10yC7eoiKq9UzGArrVN8opG/HJtk+5IhuBe3lkgv3TJ+zhOyckbWjSX/Zr9DzAaC0OC4fd+f85Q1TbDicI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767781074; c=relaxed/simple;
	bh=Fh+YcAryspkOMbJ6kQCSJ/Y2zWxQmDI1Wh1oO5OLJV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9niq3N0AxO8bWsFjVNm62DJyycvW1vEW1QV/bClN/xkARuLvdTKR4ynQKM+gXqn7Sy4wyHM12b0XYkwQH3pMeCrom1qn8MRvc4yTNNNtBZ+NP/cHg8i2X733wPHkfUZCjcZsx80ybwdjpkXRQHXRaHx6s2GmOpgbKycTBiq6JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khQCs0FN; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-430f5ecaa08so824183f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Jan 2026 02:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767781071; x=1768385871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZCMvG6iuxDZ81zsXC7C9GnF47nzqraBg/3bYlAL4t8E=;
        b=khQCs0FNRI+aVXuF14EZXbXj8dhq88Vtb/hwnV43ifLrgwxx2Bg3vWAK+H5z87nx7f
         UwOPzvjM/CUahUOMa1Be7j9nnsArmCLuq5NDS1KKfZBl9l8EV9eGP9mXt3ZajlSdCfIC
         yLfzQrGlLDpWZO49IPOs9KBzynZELx995ctL/Z0mXHoHmvpmnfOJXZKNWBZBqWnC+nHw
         wa131lTqX0K6sRsE3I5QfD0tbZO1vihkRBd19v/Hu4nRRDCQ9UkLOlinddJZE979dAW9
         r+sbtwL0GgRItwu8sMG9HggSTvDI1/BAVlwJZN5NYYga2652STzi+KcpFcCg5HNqgozC
         FBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767781071; x=1768385871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZCMvG6iuxDZ81zsXC7C9GnF47nzqraBg/3bYlAL4t8E=;
        b=ONN1Umv4P6EqrqdktjJ1VFxUcvz20MnBjuPIV8tckhbzlwcETg1kWEvEM3XXzmwbli
         KpdyJkvJlp4ogDODegkJ9/lbb6m1pS35DskOk7UB+eXpuG/hiqqDojEzv4FZ8gNvygf5
         bLllknX2Ux9biGNGnf8H6Q/Su6fSkwRV9aTJ/hJ/GL+fuwiBjf3e4BXCoKZZgat7qFXI
         CZSUglFHEtXOJm6KyiQWmgV0heNfljZWN2xQepUVN5MkZ+1g9TvvmRap7K3AtiEWKQ8T
         DVIICcvAyTZTNyb6PqKV7mJa8M2TuBOJ57R+KaT+jAmCzmZJs/gVV5eqV0ArKIzKTfuN
         fQ6w==
X-Forwarded-Encrypted: i=1; AJvYcCUiDmz93JXcErijwiI9Ek3DM0tAWvvwAqx4VncWKBerHrJUYd4Hk2iKqgBJA6YRGNr3gRZDammPAc8mUZjImYm3UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhJNZUb3vEqW2QXVFDencsPGyHvy9VQ73VAsD/U+QQgR7oPSxp
	wrzXQ9KwlKoHNH6vOvZEM2SJ54s6TfdQObQTIhM5g+oB2NdsH11329rBqWhkeSkgExVnZUfG/id
	2xR5WtbFMZ3KgZS2pRWxz+uJPfc+trWk=
X-Gm-Gg: AY/fxX57aUf1XV2A9J/mPcU1KmyJCqJcdgGD+Xd3+47rNdGQGF7MtxpNiYuEK+kv+dI
	cUxgS4t9c3SEmhcMc3tDjkdipXEbQtyNaUEXmqYsPRRiUDVv1Q/r8xLDeqRIQXlLhBv1+xZaY4y
	XP52vs/yxT9a+LX1yihc+VeQEW6bxjZtgCY8NMofrBHCrQ/IPM8EPkR3Nrg0j4XNfwbzxyVCTar
	aRv2qsZJF/tBx/t51FXwc8ZHbaZ4IsZrjCGkDEq+8zsnvjxwQnd/KUimlalCZSZejYA5CqzO7S2
	tvoCjCiP1sTjdSTvj3d230Z2n3d22uQD6FilnAL5K2mEhqkNs4rkl5iWEiMmnSOumwzc
X-Google-Smtp-Source: AGHT+IG4yiqNY3j/c1o4cPI3yoDt2b8Su6tTmfqpaMAj23CwdtGJYPv5zqlb5KN1i3QUtPovBUPxYNL3qThp37faruo=
X-Received: by 2002:a05:6000:2085:b0:431:104:6dc2 with SMTP id
 ffacd0b85a97d-432c362811cmr1899709f8f.8.1767781070728; Wed, 07 Jan 2026
 02:17:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <97d3d70e42832f4ffa3888bec792b692a7ab700f.1767719409.git.geert+renesas@glider.be>
In-Reply-To: <97d3d70e42832f4ffa3888bec792b692a7ab700f.1767719409.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 7 Jan 2026 10:17:24 +0000
X-Gm-Features: AQt7F2oRzXoo1lvR9gZ0e5H9kwZwfeoCpSlgBeiC7opN6cHuXLQiuxIcWTPQ17Y
Message-ID: <CA+V-a8ufdEmF=Md7Ktb9L2XS7X5x=nSeAHnFZyvHPZ6sFOwRww@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: dts: renesas: r9a07g043f: Move interrupt-parent
 to top node
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 5:15=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Move the "interrupt-parent =3D <&plic>" property from the soc node to the
> top node, for consistency with
> arch/arm64/boot/dts/renesas/r9a07g043u.dtsi.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in renesas-devel for v6.20.
>
> v2:
>   - Drop RFC, as commit 1b1f04d8271e7ba7 ("of/irq: Ignore interrupt
>     parent for nodes without interrupts") is upstream as of v6.19-rc1.
> ---
>  arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boo=
t/dts/renesas/r9a07g043f.dtsi
> index a8bcb26f42700644..571de3cafa8214e4 100644
> --- a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> +++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
> @@ -12,6 +12,8 @@
>  #include <arm64/renesas/r9a07g043.dtsi>
>
>  / {
> +       interrupt-parent =3D <&plic>;
> +
>         cpus {
>                 #address-cells =3D <1>;
>                 #size-cells =3D <0>;
> @@ -52,7 +54,6 @@ &pinctrl {
>
>  &soc {
>         dma-noncoherent;
> -       interrupt-parent =3D <&plic>;
>
>         irqc: interrupt-controller@110a0000 {
>                 compatible =3D "renesas,r9a07g043f-irqc";
> --
> 2.43.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

