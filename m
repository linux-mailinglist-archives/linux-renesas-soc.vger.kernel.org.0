Return-Path: <linux-renesas-soc+bounces-9542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AF4993604
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:24:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 230091F221B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838501DDC3A;
	Mon,  7 Oct 2024 18:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auZSIcTo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8541DDC37;
	Mon,  7 Oct 2024 18:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325396; cv=none; b=DcwbGoxVaE+oenER74DIch/KcLekiB+5DH/edJ/Os0mUiMshLToE1YTQ1GbxX8gzH/8CYW/va2c2JoCN2339PcKy5aprMf9xLncpGhqoi2iOQtp9j2Nk70AG30FDLL7SuwfIUjbL03AgzXUfKD+Q/LjEtBll9XteL/nW1uoWJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325396; c=relaxed/simple;
	bh=Hh2ig18gLZvweWNAhYprKeHX7bIhw/8ZNwK4kQGA7sk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ys0pJy0AcB6LIIPyl05p+VFDQkA685r9ZDD+rWmSOKHrXik/IDaQYy20EZoSPCVmXGg9NOQgNAoTF7Lo+Sv7N7RwKOKze88jztuJj9ecC+doz5hNru8Bs0adOXK4bClx97eqEg+1MujPRjx3tb+IlghZSqcFkcccJssRve/20t4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auZSIcTo; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-50ab6eabc32so1338329e0c.3;
        Mon, 07 Oct 2024 11:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728325394; x=1728930194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7yyfCAQpX892WCgCAtUoTvnv470/Gjv2sixN+Fk+oA=;
        b=auZSIcToVftUsIfkK9HoE+mk8ocXuE+cqvj2+G+LSBkLVpaf1UCTc0N3FwqHCrEc02
         dGW2DOfWbfsm2fLjwqKOtDhijueaw7zA8Ro2+czTDHN3J4atZ2NoTXNqBb58LrAVJfcJ
         mBtfA7TmCS+TbGiy0+Xe6uDHJYneU50/KDPpgP8/YmwOdyIhUqkK1v1gCD7yMplqRxw1
         a9dg3X4/L8NIJxHabjR7p1KXPqWp+BFEpaKyupB78PUjnYIaF4W0p1aVdlzlsUOdutMH
         Jb8ygskWibCzp51sx0BbAVAr+sPeIPoC5XcmRjlIMlxRbHyf9PiZd+3UUZ6RVeTAu5mK
         bDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728325394; x=1728930194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7yyfCAQpX892WCgCAtUoTvnv470/Gjv2sixN+Fk+oA=;
        b=Df3gt0b4XSxWad+3UcGuIQU45whf3vJeNTizCtA3BpdLA/T7/ppsk8sHd68nC4AavV
         s/WXJvYKtHFy0aR2Qg8VyZzB20igrbDWYFI8vKUwidp/hSU/gMSJVXOrrnv+XxgKncSd
         Ys8XUbExxjMPfsSx04yPNirXskjIIxRuthZ2FgD7V3dIKWGBgbCpAbkRbAKyP/P7KbFU
         nv2PWXw68g+2lxsLvCoqIZ8fIbj4IhfL1rELfsyPvp94uoW9ozpi7FnCwJJEQk6m9X+m
         DAPJ1TTEhYKaiT23olb0KsE7O2m5F+LiEv7fq8pP89UWT+LpWV/3+EwM+kyOJQoCuDBm
         U8vg==
X-Forwarded-Encrypted: i=1; AJvYcCU+Q2jP31lm5bqjWaTF0pYjIvo0ztFnE8pglN/uSyeobdnD5ud45AvL8xfnNvAaap6T29VpgrazPKdU@vger.kernel.org, AJvYcCUh0opUbH/924UaT9RhSZ2zVdnIEXcQNccXcLNzbhJYz++cq5yQF1R9DBgAwCxa5dXPLwRmSHX6m7zqjgZG2H/aiHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKyZ68kecDXMZ5b0LMG7MMFzJ4z0H1h8xZ4Gl4WYaxwaHU7YU2
	sG6ZfpqfmBxX6GRRYYpSkjjtfJCdFKiJkT4ZFBcjf3LR98bVYJ575r6R69SAvICM+8fV7H6EM2S
	1dXRSMVwp70VAkbne5kPxBEqOiaU=
X-Google-Smtp-Source: AGHT+IG31ngMT8ctZ+aN1t82JfCdHPld7qHO49GZ7XkHdSfBgdELuO632Ucx3SSgJz9Nd2djVB1cbx+9JGGTPvcylU8=
X-Received: by 2002:a05:6122:3c4e:b0:50c:6514:956d with SMTP id
 71dfb90a1353d-50c85583589mr7782678e0c.13.1728325393799; Mon, 07 Oct 2024
 11:23:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <14948b763694f3e78e8c4af35fa9c17ec91b2997.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <14948b763694f3e78e8c4af35fa9c17ec91b2997.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 19:22:47 +0100
Message-ID: <CA+V-a8s2BhviDcxpfMR8PP7nePzLfLjxDspBcu1oc1-2UPMrgA@mail.gmail.com>
Subject: Re: [PATCH 15/20] arm64: dts: renesas: Use interrupts-extended for PMICs
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:27=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/ebisu.dtsi           | 3 +--
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 3 +--
>  arch/arm64/boot/dts/renesas/ulcb.dtsi            | 3 +--
>  3 files changed, 3 insertions(+), 6 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts=
/renesas/ebisu.dtsi
> index 54ebffcd82d4337b..b4e0347d3617a83e 100644
> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -514,8 +514,7 @@ pmic: pmic@30 {
>
>                 compatible =3D "rohm,bd9571mwv";
>                 reg =3D <0x30>;
> -               interrupt-parent =3D <&intc_ex>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&intc_ex 0 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>                 gpio-controller;
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm6=
4/boot/dts/renesas/salvator-common.dtsi
> index ca0b5c070ae57dce..08f4e35c414ebbcf 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -617,8 +617,7 @@ pmic: pmic@30 {
>
>                 compatible =3D "rohm,bd9571mwv";
>                 reg =3D <0x30>;
> -               interrupt-parent =3D <&intc_ex>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&intc_ex 0 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>                 gpio-controller;
> diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/=
renesas/ulcb.dtsi
> index 4cf141a701c0625a..3d4a64d103b64bfa 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> @@ -247,8 +247,7 @@ pmic: pmic@30 {
>
>                 compatible =3D "rohm,bd9571mwv";
>                 reg =3D <0x30>;
> -               interrupt-parent =3D <&intc_ex>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&intc_ex 0 IRQ_TYPE_LEVEL_LOW>;
>                 interrupt-controller;
>                 #interrupt-cells =3D <2>;
>                 gpio-controller;
> --
> 2.34.1
>
>

