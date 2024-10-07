Return-Path: <linux-renesas-soc+bounces-9548-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EE399365F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 956A11F2479C
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690ED1DDC3E;
	Mon,  7 Oct 2024 18:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFIL+8Sj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40C91DD549;
	Mon,  7 Oct 2024 18:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728326336; cv=none; b=QsaUwcwtkaB1dzdAKciKgM6T6vvxNCVWJpXPfh22/3khMMAPPkn7e5+qPCuR50glYoFh4O3x3KUfZa7vmOOvaWPFEaLX1kYA/OjzfDN7Jy3UgvybVixMqty3WnBjWCWraT4lq3Ep2GQpWqrMkaa2HsD5eFZqweBJQtiJJf/c1uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728326336; c=relaxed/simple;
	bh=WIRBrxbsoQ5r2D/903oeAriBOoYLj0hfWzhR3klC5UY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CF3gDyu/j+w4D354Xt6PELy4EHTV8DKxLKWBZ3ycpVAzR38BJ0DXUv7eB9+ZC3iOhGTnzHQf4JkSi0mbhUbADhh4yNJqBjxw7VxZWyInQdgZ/ec/Sj87t+B+pFEn3tA4Qj2rtlXvsuseHuxYjj8FjGuu2JlmDN1Dwg5JgLPun4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFIL+8Sj; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-50792ed3b0bso1389780e0c.1;
        Mon, 07 Oct 2024 11:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728326334; x=1728931134; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3UVdzXWA8Tey/If7hJVlHOn/BvVYJ6mjPuuKEJYy8s=;
        b=MFIL+8SjXbFVfNEEZ9+RiN/PeGUMwVQvuMds43GDPAvPRv8tBF4kxoZH8E8CGKo9zd
         uDBvL48t9t1honAkB3MQZLEs/uATGD+ce6dKOjekc8QWUF+PPvPyxL01uo851/9n+3X2
         iFpuumTCTdNOo409qcZiuBoIAZMV6tK5wIuz0QzHmG2TIRKAaafROLzbud6wxa5ijM/5
         kPof6hPnacGZgMzB/tt5qy3q7gau9O8aloNdYxgaEgjyL5//Az8JuS6cCorz+nQ//uOp
         kXTg1VVC63lOlKsuc6do0B7xZ8NqP7dAFdAsaTjmrXwR15TXoULICYSSj11Pa51J643w
         U/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728326334; x=1728931134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3UVdzXWA8Tey/If7hJVlHOn/BvVYJ6mjPuuKEJYy8s=;
        b=AV2XEPNnClwYVdHVGYw5zyZhm9qZ9CNpb2savnfPVMhxmGKHEoONSAPk0Ya/AinQXv
         mR958mKZBd+XC0FDJFD8NGjpSSEoSQ95MeDUz9kEd4LxcRDJ9XSrGW5J/E+N3l8Mc/9j
         cpuKbsl02rs4L/peGUHaxbl36Fx/bTv2Fq19Llvqm3hEwwgn/2qf1XTmpz+nee2oMFHp
         X0FxRKWkiiRJIHd1xvg80ZcjM1qW4S5us/tSMxe845tVvxRcUTCm3bn3R9bEMUlLX/8S
         d7BvGmvKEv9l5+lNAtOd4XEjNzNsFbR+G+W4FgQMxet/hkJBRA+pLznb7eUHo/hG/9QK
         YM7g==
X-Forwarded-Encrypted: i=1; AJvYcCX0UVwd9BJvBYyz0TU+em1ZmHpeJMk3GY2PZeFzJ4T59QUArwbiCWz7JIU0GNrJsfngtXItgcvMQWTYYe9PzQOTmO8=@vger.kernel.org, AJvYcCXu5lUwaJfb6s1el1+FwdurYzSg5Wra5oRvIMtCrvXO2imSTtKqVWcD1LEsCR2+ILmBBmYBcW3b3OEQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwP1AEzZ6VMxrrvQTnPrt58jc+tOr3A23ciuCeS1Uuq1NYmiAYq
	fSqryxQZ+xHWcRWXTwCpV1MM3GPUQhx0pbgrAg+GR2/hvy5Ty955MdhTEJQCksCvhnEutkvvIlF
	00/qfGnjq6H+r6APd35XC8p0h2Jw=
X-Google-Smtp-Source: AGHT+IEkXmQx2cAmrXa3gjtHSBRA5SbtJxWCEmCX1K4S478mzK9IXJbAJ1zb/WJmjG1j0Q+RRJHig+DDTMP2RAbKQDg=
X-Received: by 2002:a05:6122:489a:b0:50c:9834:57b3 with SMTP id
 71dfb90a1353d-50c98345856mr6565153e0c.4.1728326333637; Mon, 07 Oct 2024
 11:38:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <6214cd8ed068e3fc60a7b972093e4d99cdc0be1a.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <6214cd8ed068e3fc60a7b972093e4d99cdc0be1a.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 19:38:27 +0100
Message-ID: <CA+V-a8vbWo+28e+rj4ocbJtK29YT-g_dcKTN-5e_U3YxL4_E8w@mail.gmail.com>
Subject: Re: [PATCH 20/20] arm64: dts: renesas: rzg3s-smarc: Use
 interrupts-extended for gpio-keys
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 2:30=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> Use the more concise interrupts-extended property to fully describe the
> interrupts.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/bo=
ot/dts/renesas/rzg3s-smarc.dtsi
> index 7945d44e6ee159f4..4509151344c430de 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
> @@ -20,8 +20,7 @@ keys {
>                 compatible =3D "gpio-keys";
>
>                 key-1 {
> -                       interrupts =3D <RZG2L_GPIO(18, 0) IRQ_TYPE_EDGE_F=
ALLING>;
> -                       interrupt-parent =3D <&pinctrl>;
> +                       interrupts-extended =3D <&pinctrl RZG2L_GPIO(18, =
0) IRQ_TYPE_EDGE_FALLING>;
>                         linux,code =3D <KEY_1>;
>                         label =3D "USER_SW1";
>                         wakeup-source;
> @@ -29,8 +28,7 @@ key-1 {
>                 };
>
>                 key-2 {
> -                       interrupts =3D <RZG2L_GPIO(0, 1) IRQ_TYPE_EDGE_FA=
LLING>;
> -                       interrupt-parent =3D <&pinctrl>;
> +                       interrupts-extended =3D <&pinctrl RZG2L_GPIO(0, 1=
) IRQ_TYPE_EDGE_FALLING>;
>                         linux,code =3D <KEY_2>;
>                         label =3D "USER_SW2";
>                         wakeup-source;
> @@ -38,8 +36,7 @@ key-2 {
>                 };
>
>                 key-3 {
> -                       interrupts =3D <RZG2L_GPIO(0, 3) IRQ_TYPE_EDGE_FA=
LLING>;
> -                       interrupt-parent =3D <&pinctrl>;
> +                       interrupts-extended =3D <&pinctrl RZG2L_GPIO(0, 3=
) IRQ_TYPE_EDGE_FALLING>;
>                         linux,code =3D <KEY_3>;
>                         label =3D "USER_SW3";
>                         wakeup-source;
> --
> 2.34.1
>
>

