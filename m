Return-Path: <linux-renesas-soc+bounces-9536-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CDF9935A0
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:03:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5227285636
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820821DDA3D;
	Mon,  7 Oct 2024 18:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COw14aOL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AA01DD866;
	Mon,  7 Oct 2024 18:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728324184; cv=none; b=GSY/nDUtnRudhi+3pFQoSTqqF1Rt9bsax/HUXRLXQ/C4rFZ5dc7ZsfTGCJrKD3+4zGFKOrQPwSZfUPat3MEX9cOhyETSEoJcbGohafliEzxBe4T9ayrn3szqg8ztG6yBDDQH5I88qqkNPUNHW185Jm/SxC0gNvcb5pKZxqwuYWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728324184; c=relaxed/simple;
	bh=BqajNFZC7rQ+2/Be7shdz9mr/RpdSSFb+JnrMEw5T5Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uYszOU0LAgyApewkrkWkrJ67t3UuvoJpOk49NTtgb3ERNnEDuqiBZQ56jlJEiadV9r47NCLUzm5uhAzqhKe7A5zcBXeryGxtn+SBzbc0MEDSFGce1x7VBCnI3q3nf8WGid0E5Gt/iBhXdAzKTiX6Q/Qia5XHCZ8pMyHh2RKgyFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COw14aOL; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-50abc034f6aso1388650e0c.1;
        Mon, 07 Oct 2024 11:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728324182; x=1728928982; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3yVQ8YptqM4xgPOKx0H9spCye9v1w1WuwCgghmwmwg=;
        b=COw14aOLu7tuHwumfKW8s9DeWY/dPydvBWKvCE7AZLya7oNDz2g+gNToooQNQMjnWi
         zIkLmRi81laokpCOVe7LC8cLXH7HQ8GmNir8xGnK4HApb2k05/+AcHd+Wb6X2N5Jxzq8
         63ye93Vsw8LK8nN/lh12vqnh3hp5JUL10XpGcayzgs8n4tCPPmgschwtWafARB4IwbCz
         UnCJDaqjEDQr7SPRDgibq8WD6/e8TcbEqEC4XOzRkb/5qA4Ik3yYJppoCgp/t0iH+25s
         3ag33V3B2deA6vjkQYk4onnZlCLpEY7JHkwRPnC5HsEXLJm0tiMPjcQBFc2YHFu40Up2
         zCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728324182; x=1728928982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3yVQ8YptqM4xgPOKx0H9spCye9v1w1WuwCgghmwmwg=;
        b=XYAKgwcMrPBxaOpLLt/g2JeymfX7DIhmnEgJ6AMi/VlIwL7TgGE+LhN+giQGsBnDVH
         0gN0iFsSe74W0EmsaOiZei06UXel29tCBt+hvkqUEjrQFtP4t3/f6zIEWVTwJKYIiPiJ
         NQOBKYkGuKVJtVfrgKjDI6+o9OK3vq5CynEimLxc8+G4y15WjXA2YQOZhRTjYdg1dDkp
         g1ASEkbj5e8nZfUDWg90FJ9X6a2n4lT4fzMI49kogPG3yKb9cYTSho3d7CvRNbDgYLxS
         VH3sAKwzQoZ+jnfXDEoJDAGgjxKWJDsKBcT7l+yXHXudeLVytcC5WjYUm2+bxZ9kqMWm
         532g==
X-Forwarded-Encrypted: i=1; AJvYcCUvJPdbiZ9oHZlOReOOuCL+w936AKuQNFcbQ/vln+zZSg/oCRSvciUAAgnbR0YACPRTlSr9/OBe2RAL@vger.kernel.org, AJvYcCWh+T+uPS50pNCdvFSglZsa5w8xV2TYvGgJHkyVt9X+R4ETh7/FhX1Vu8ANrWsNUCfV9riD0GH4cfa6QdRspiQ+BPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzhyQU80temeU6opVHjYbDQ9tJoKAocASqO23+k8WjTFrj8HAy
	y9Ij06gPgT5KI53/EJdynMmaY6qGBKJp6G/IQ9W4j0R/KfT/jz4lyvOf7Zr5WfyXc6x4lr3Jf+M
	kEYpXYK+8bq39P8Wtr7eHs47pkkJT4+jM
X-Google-Smtp-Source: AGHT+IENhB5fY3S6q8pCxB6OucuZ828sCwLtRysmijp4vsLH0EnQNxUE1M7e0dVeSAWCDfkOO53fAhNVvWWb+vGRmes=
X-Received: by 2002:a05:6122:1783:b0:502:bd0d:abe2 with SMTP id
 71dfb90a1353d-50c854949bemr9200068e0c.6.1728324181810; Mon, 07 Oct 2024
 11:03:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <2b217486221d90eb3c127f5e44f9c886161ab8c6.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <2b217486221d90eb3c127f5e44f9c886161ab8c6.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 19:02:34 +0100
Message-ID: <CA+V-a8s6t0xPdJGfvNWrJb_WiPMCv1EtuBWVyDYABX=3T_6DBA@mail.gmail.com>
Subject: Re: [PATCH 11/20] arm64: dts: renesas: Use interrupts-extended for
 DisplayPort bridges
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
>  arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi   | 3 +--
>  arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi | 3 +--
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/=
arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> index 99b73e21c82c2b18..e8c8fca48b6963c9 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> @@ -208,8 +208,7 @@ bridge@2c {
>                 clocks =3D <&sn65dsi86_refclk>;
>                 clock-names =3D "refclk";
>
> -               interrupt-parent =3D <&intc_ex>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupts-extended =3D <&intc_ex 0 IRQ_TYPE_LEVEL_HIGH>;
>
>                 vccio-supply =3D <&reg_1p8v>;
>                 vpll-supply =3D <&reg_1p8v>;
> diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arc=
h/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> index 6dc968352c046129..36f5deb7f24afc2e 100644
> --- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> @@ -246,8 +246,7 @@ bridge@2c {
>                 clocks =3D <&sn65dsi86_refclk>;
>                 clock-names =3D "refclk";
>
> -               interrupt-parent =3D <&intc_ex>;
> -               interrupts =3D <0 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupts-extended =3D <&intc_ex 0 IRQ_TYPE_LEVEL_HIGH>;
>
>                 enable-gpios =3D <&gpio1 26 GPIO_ACTIVE_HIGH>;
>
> --
> 2.34.1
>
>

