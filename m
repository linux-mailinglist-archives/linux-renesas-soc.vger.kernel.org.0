Return-Path: <linux-renesas-soc+bounces-9539-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 076629935E4
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 20:18:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6A795B20B28
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Oct 2024 18:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7931DDC0C;
	Mon,  7 Oct 2024 18:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h99Ls9c6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AC51C173C;
	Mon,  7 Oct 2024 18:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728325077; cv=none; b=bbpotZVE4CEyC4oSrZSeITsWyFLmMKbpS1eq1nnrTs3fvM1Uljq1ZP4gV3o2Veu/PItFZ2at/4ZEzI4DfKfvnwcHCj1NnQbdVrT/8AA/nIylVX57aQBJw4rRc8btbYOqKZBMkh+AUx89nn3F0mrobw0MB0WPUkCJJmHMB9MgxpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728325077; c=relaxed/simple;
	bh=W7MsFP52SYudjwIHbNJ9uL6JkA7QEjPPMLkrYVK1Dxo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IhHf49zXYZGOh3vS9TxdlHV2WFaWfaSaANSshv2zURAmpTtDFatTBWP5WtokZ+BQCnHXbZLiTdVGOKqK74tYctwrGsDyE8YdKNtE/kJF17FAZLMw4cD3KsrK0/7Q2gp3V9zZMNHYNoSCC0sdtKSDwyxiCa2CgOm6BZYILLanwCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h99Ls9c6; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-50c8330c69fso2044221e0c.0;
        Mon, 07 Oct 2024 11:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728325074; x=1728929874; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Mwbm1YLlOMLHbIU8mojlBkZ0PSQEH2kJZX+92MdmP4=;
        b=h99Ls9c6FNZ7JmSqO+VrO5CIpufYz8zUK5JXUxJTcSo39YEqSREzQBAqDVSBE1VKW8
         ScKyJMw+O6JBbcynLOnmI8HgfLByZBG+JR+BDkmmBwYTQZ6AQNW3oYf+hOow6pfi11AW
         6SueXGuhnBtbgGWADyMtFFtaHvvTGB8DoqIAU04ivrhmTH1cguPgE+ijuUcp7W3W2UEw
         lb9XWMQc4yqaKbkHY92k58Q6b3htfQaAPRJlPCCGbOAykDiFhzPV/0gbtxr1U0BBYec6
         Hk73YpcKMKqvITlqsu8ZAInBTQSe0smgZjN+3Jhlp+mIrMXmjmfrtnRpUg74F/c/68lK
         ExmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728325074; x=1728929874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Mwbm1YLlOMLHbIU8mojlBkZ0PSQEH2kJZX+92MdmP4=;
        b=Wttk0Lfz4Vfdqkckx55hyYjqB42LxpsKyv/xy83NNYzLnAKvK3++nOXO662a1E3Qb1
         PIuqYX+aFdsUVouhH+HZ3ogoMXboJ61xuhw/KC0+RZu8CSIYBknNnvLT5czu7FEDDkD6
         sPDMBhUXY41uWxO8cllD1cNoWwjLSOwmAXN5xJ9fEnPPY9zAhLGhi46WhMRSKT7/lgBL
         8cBg/3xbMpNlI1naUkBbUlo1jXca0DGl6RAlNKD/vmAcF+nXrWtsfy7dNFepmpQ5g0rT
         /o0bAKywuzkxqA3drNs/fcPgWYFlQmSYMAMniA3/lGtr5KTxCo8xgL+f8woj3THVypKz
         V8Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUyEYg+lYFJg7FhONcpWW6Xeoi+79o2AQ7p1NTIXdgzGAiGeUDBeB+1qIxewqFQPOw/T+vi8p97zaPw@vger.kernel.org, AJvYcCWY/vEcMGA0Q2WNwjEa1uXRMLTLlPEbsOzeqv1iNK7lkOdbd/h9jMXagPahHwHZpY/3PCux2L0iS3WeboJn+zy8eJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMFBZLA8wgzlk1poWqtsbwsyCkWKbS0ssj3BOpS2MlyUZYefPr
	Kj0FJGAXBX/282laEYmlv4D7I0MP+OaJ3/sbj0Mt1py+7Wh3WnaCl+PDeZGLFU6K3UQPC2FiUGL
	JNhjmEjKU25fe9kj25ET0/1Jb7M4=
X-Google-Smtp-Source: AGHT+IFWtPsPdhc/uO2wgEkRb9dWEd3oQq3w8L/YXpRWnGErsvqqqV0H3TcLcE4Mhz/Cmo/hjQf7C0QpfimvBDiIN7E=
X-Received: by 2002:a05:6122:3b02:b0:50c:8c43:8743 with SMTP id
 71dfb90a1353d-50cd823e82dmr630072e0c.7.1728325074109; Mon, 07 Oct 2024
 11:17:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1728045620.git.geert+renesas@glider.be> <e9db8758d275ec63b0d6ce086ac3d0ea62966865.1728045620.git.geert+renesas@glider.be>
In-Reply-To: <e9db8758d275ec63b0d6ce086ac3d0ea62966865.1728045620.git.geert+renesas@glider.be>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Oct 2024 19:17:28 +0100
Message-ID: <CA+V-a8tEQg7WNCYvYRz4_ypf_UrAeM2CJQnk5EWHG=sch7Y3Kg@mail.gmail.com>
Subject: Re: [PATCH 12/20] arm64: dts: renesas: Use interrupts-extended for
 Ethernet PHYs
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
>  arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi      | 3 +--
>  arch/arm64/boot/dts/renesas/cat875.dtsi                  | 3 +--
>  arch/arm64/boot/dts/renesas/condor-common.dtsi           | 3 +--
>  arch/arm64/boot/dts/renesas/draak.dtsi                   | 3 +--
>  arch/arm64/boot/dts/renesas/ebisu.dtsi                   | 3 +--
>  arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi          | 3 +--
>  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts           | 3 +--
>  arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts           | 3 +--
>  arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts           | 3 +--
>  arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts          | 3 +--
>  .../arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi | 9 +++------
>  arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts            | 6 ++----
>  .../boot/dts/renesas/r8a779g2-white-hawk-single.dts      | 3 +--
>  .../arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 3 +--
>  arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi         | 6 ++----
>  arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi        | 3 +--
>  arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi        | 6 ++----
>  arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi         | 6 ++----
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi         | 3 +--
>  arch/arm64/boot/dts/renesas/ulcb.dtsi                    | 3 +--
>  arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi   | 3 +--
>  arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi     | 6 ++----
>  22 files changed, 29 insertions(+), 58 deletions(-)
>

Reviewed-by:  Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> #
G2L family and G3S

Cheers,
Prabhakar

> diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi b/arch/a=
rm64/boot/dts/renesas/beacon-renesom-som.dtsi
> index 68b04e56ae56232e..5a15a956702a6be8 100644
> --- a/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/beacon-renesom-som.dtsi
> @@ -62,8 +62,7 @@ phy0: ethernet-phy@0 {
>                 compatible =3D "ethernet-phy-id0022.1640",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <0>;
> -               interrupt-parent =3D <&gpio2>;
> -               interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios =3D <&gpio2 10 GPIO_ACTIVE_LOW>;
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/cat875.dtsi b/arch/arm64/boot/dt=
s/renesas/cat875.dtsi
> index 8c9da8b4bd60bf32..191b051ecfd458ef 100644
> --- a/arch/arm64/boot/dts/renesas/cat875.dtsi
> +++ b/arch/arm64/boot/dts/renesas/cat875.dtsi
> @@ -25,8 +25,7 @@ phy0: ethernet-phy@0 {
>                 compatible =3D "ethernet-phy-id001c.c915",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <0>;
> -               interrupt-parent =3D <&gpio2>;
> -               interrupts =3D <21 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios =3D <&gpio1 20 GPIO_ACTIVE_LOW>;
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/condor-common.dtsi b/arch/arm64/=
boot/dts/renesas/condor-common.dtsi
> index 8b7c0c34eadce5cb..b2d99dfaa0cdf19d 100644
> --- a/arch/arm64/boot/dts/renesas/condor-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/condor-common.dtsi
> @@ -166,8 +166,7 @@ phy0: ethernet-phy@0 {
>                              "ethernet-phy-ieee802.3-c22";
>                 rxc-skew-ps =3D <1500>;
>                 reg =3D <0>;
> -               interrupt-parent =3D <&gpio4>;
> -               interrupts =3D <23 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio4 23 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios =3D <&gpio4 22 GPIO_ACTIVE_LOW>;
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts=
/renesas/draak.dtsi
> index 6f133f54ded54efb..402112a37d75a8c5 100644
> --- a/arch/arm64/boot/dts/renesas/draak.dtsi
> +++ b/arch/arm64/boot/dts/renesas/draak.dtsi
> @@ -247,8 +247,7 @@ phy0: ethernet-phy@0 {
>                              "ethernet-phy-ieee802.3-c22";
>                 rxc-skew-ps =3D <1500>;
>                 reg =3D <0>;
> -               interrupt-parent =3D <&gpio5>;
> -               interrupts =3D <19 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio5 19 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios =3D <&gpio5 18 GPIO_ACTIVE_LOW>;
>                 /*
>                  * TX clock internal delay mode is required for reliable
> diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts=
/renesas/ebisu.dtsi
> index cba2fde9dd3688b3..1aedd093fb41bf44 100644
> --- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
> @@ -314,8 +314,7 @@ phy0: ethernet-phy@0 {
>                              "ethernet-phy-ieee802.3-c22";
>                 rxc-skew-ps =3D <1500>;
>                 reg =3D <0>;
> -               interrupt-parent =3D <&gpio2>;
> -               interrupts =3D <21 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio2 21 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios =3D <&gpio1 20 GPIO_ACTIVE_LOW>;
>                 /*
>                  * TX clock internal delay mode is required for reliable
> diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64=
/boot/dts/renesas/hihope-rzg2-ex.dtsi
> index ad898c6db4e62df6..4113710d55226d6d 100644
> --- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> +++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
> @@ -27,8 +27,7 @@ phy0: ethernet-phy@0 {
>                 compatible =3D "ethernet-phy-id001c.c915",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <0>;
> -               interrupt-parent =3D <&gpio2>;
> -               interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios =3D <&gpio2 10 GPIO_ACTIVE_LOW>;
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/=
boot/dts/renesas/r8a77970-eagle.dts
> index 0608dce92e405935..7dd9e13cf0074442 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -111,8 +111,7 @@ phy0: ethernet-phy@0 {
>                              "ethernet-phy-ieee802.3-c22";
>                 rxc-skew-ps =3D <1500>;
>                 reg =3D <0>;
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <17 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio1 17 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios =3D <&gpio1 16 GPIO_ACTIVE_LOW>;
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts b/arch/arm64/=
boot/dts/renesas/r8a77970-v3msk.dts
> index e36999e91af53326..0a103f93b14d71ad 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts
> @@ -117,8 +117,7 @@ phy0: ethernet-phy@0 {
>                              "ethernet-phy-ieee802.3-c22";
>                 rxc-skew-ps =3D <1500>;
>                 reg =3D <0>;
> -               interrupt-parent =3D <&gpio1>;
> -               interrupts =3D <17 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio1 17 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios =3D <&gpio1 16 GPIO_ACTIVE_LOW>;
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts b/arch/arm64/=
boot/dts/renesas/r8a77980-v3hsk.dts
> index 77d22df25fffac6d..a8a20c748ffcd1ed 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts
> @@ -124,8 +124,7 @@ phy0: ethernet-phy@0 {
>                              "ethernet-phy-ieee802.3-c22";
>                 rxc-skew-ps =3D <1500>;
>                 reg =3D <0>;
> -               interrupt-parent =3D <&gpio4>;
> -               interrupts =3D <23 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio4 23 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios =3D <&gpio4 22 GPIO_ACTIVE_LOW>;
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64=
/boot/dts/renesas/r8a779a0-falcon.dts
> index 63db822e5f4662b6..6bd580737f25d3cc 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
> @@ -31,8 +31,7 @@ phy0: ethernet-phy@0 {
>                              "ethernet-phy-ieee802.3-c22";
>                 rxc-skew-ps =3D <1500>;
>                 reg =3D <0>;
> -               interrupt-parent =3D <&gpio4>;
> -               interrupts =3D <16 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio4 16 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios =3D <&gpio4 15 GPIO_ACTIVE_LOW>;
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi b/=
arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
> index 33c1015e9ab38e97..5d38669ed1ec3440 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779f0-spider-ethernet.dtsi
> @@ -60,8 +60,7 @@ mdio {
>                                 u101: ethernet-phy@1 {
>                                         reg =3D <1>;
>                                         compatible =3D "ethernet-phy-ieee=
802.3-c45";
> -                                       interrupt-parent =3D <&gpio3>;
> -                                       interrupts =3D <10 IRQ_TYPE_LEVEL=
_LOW>;
> +                                       interrupts-extended =3D <&gpio3 1=
0 IRQ_TYPE_LEVEL_LOW>;
>                                 };
>                         };
>                 };
> @@ -78,8 +77,7 @@ mdio {
>                                 u201: ethernet-phy@2 {
>                                         reg =3D <2>;
>                                         compatible =3D "ethernet-phy-ieee=
802.3-c45";
> -                                       interrupt-parent =3D <&gpio3>;
> -                                       interrupts =3D <11 IRQ_TYPE_LEVEL=
_LOW>;
> +                                       interrupts-extended =3D <&gpio3 1=
1 IRQ_TYPE_LEVEL_LOW>;
>                                 };
>                         };
>                 };
> @@ -96,8 +94,7 @@ mdio {
>                                 u301: ethernet-phy@3 {
>                                         reg =3D <3>;
>                                         compatible =3D "ethernet-phy-ieee=
802.3-c45";
> -                                       interrupt-parent =3D <&gpio3>;
> -                                       interrupts =3D <9 IRQ_TYPE_LEVEL_=
LOW>;
> +                                       interrupts-extended =3D <&gpio3 9=
 IRQ_TYPE_LEVEL_LOW>;
>                                 };
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/b=
oot/dts/renesas/r8a779f4-s4sk.dts
> index fa910b85859e99df..5d71d52f9c654783 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
> @@ -197,8 +197,7 @@ mdio {
>                                 ic99: ethernet-phy@1 {
>                                         reg =3D <1>;
>                                         compatible =3D "ethernet-phy-ieee=
802.3-c45";
> -                                       interrupt-parent =3D <&gpio3>;
> -                                       interrupts =3D <10 IRQ_TYPE_LEVEL=
_LOW>;
> +                                       interrupts-extended =3D <&gpio3 1=
0 IRQ_TYPE_LEVEL_LOW>;
>                                 };
>                         };
>                 };
> @@ -216,8 +215,7 @@ mdio {
>                                 ic102: ethernet-phy@2 {
>                                         reg =3D <2>;
>                                         compatible =3D "ethernet-phy-ieee=
802.3-c45";
> -                                       interrupt-parent =3D <&gpio3>;
> -                                       interrupts =3D <11 IRQ_TYPE_LEVEL=
_LOW>;
> +                                       interrupts-extended =3D <&gpio3 1=
1 IRQ_TYPE_LEVEL_LOW>;
>                                 };
>                         };
>                 };
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts b=
/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
> index 50a428572d9bd933..0062362b0ba06885 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
> @@ -70,8 +70,7 @@ phy3: ethernet-phy@0 {
>                         compatible =3D "ethernet-phy-id002b.0980",
>                                      "ethernet-phy-ieee802.3-c22";
>                         reg =3D <0>;
> -                       interrupt-parent =3D <&gpio4>;
> -                       interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&gpio4 3 IRQ_TYPE_LEVEL_=
LOW>;
>                 };
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/=
arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> index 72e1ffe98585447f..b1d035ca4d97a51a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> @@ -181,8 +181,7 @@ phy0: ethernet-phy@0 {
>                              "ethernet-phy-ieee802.3-c22";
>                 rxc-skew-ps =3D <1500>;
>                 reg =3D <0>;
> -               interrupt-parent =3D <&gpio7>;
> -               interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio7 5 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios =3D <&gpio7 10 GPIO_ACTIVE_LOW>;
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg2l-smarc-som.dtsi
> index 83f5642d0d35c244..502d9f17bf16d017 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
> @@ -102,8 +102,7 @@ phy0: ethernet-phy@7 {
>                 compatible =3D "ethernet-phy-id0022.1640",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <7>;
> -               interrupt-parent =3D <&irqc>;
> -               interrupts =3D <RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc RZG2L_IRQ2 IRQ_TYPE_LEVEL_=
LOW>;
>                 rxc-skew-psec =3D <2400>;
>                 txc-skew-psec =3D <2400>;
>                 rxdv-skew-psec =3D <0>;
> @@ -130,8 +129,7 @@ phy1: ethernet-phy@7 {
>                 compatible =3D "ethernet-phy-id0022.1640",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <7>;
> -               interrupt-parent =3D <&irqc>;
> -               interrupts =3D <RZG2L_IRQ3 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc RZG2L_IRQ3 IRQ_TYPE_LEVEL_=
LOW>;
>                 rxc-skew-psec =3D <2400>;
>                 txc-skew-psec =3D <2400>;
>                 rxdv-skew-psec =3D <0>;
> diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi b/arch/arm=
64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
> index b4ef5ea8a9e3457a..de39311a77dc2a5a 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi
> @@ -82,8 +82,7 @@ phy0: ethernet-phy@7 {
>                 compatible =3D "ethernet-phy-id0022.1640",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <7>;
> -               interrupt-parent =3D <&irqc>;
> -               interrupts =3D <RZG2L_IRQ0 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc RZG2L_IRQ0 IRQ_TYPE_LEVEL_=
LOW>;
>                 rxc-skew-psec =3D <2400>;
>                 txc-skew-psec =3D <2400>;
>                 rxdv-skew-psec =3D <0>;
> diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm=
64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> index 79443fb3f5810304..1a6fd58bd3682a56 100644
> --- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
> @@ -78,8 +78,7 @@ phy0: ethernet-phy@7 {
>                 compatible =3D "ethernet-phy-id0022.1640",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <7>;
> -               interrupt-parent =3D <&irqc>;
> -               interrupts =3D <RZG2L_IRQ2 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc RZG2L_IRQ2 IRQ_TYPE_LEVEL_=
LOW>;
>                 rxc-skew-psec =3D <2400>;
>                 txc-skew-psec =3D <2400>;
>                 rxdv-skew-psec =3D <0>;
> @@ -107,8 +106,7 @@ phy1: ethernet-phy@7 {
>                 compatible =3D "ethernet-phy-id0022.1640",
>                              "ethernet-phy-ieee802.3-c22";
>                 reg =3D <7>;
> -               interrupt-parent =3D <&irqc>;
> -               interrupts =3D <RZG2L_IRQ7 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&irqc RZG2L_IRQ7 IRQ_TYPE_LEVEL_=
LOW>;
>                 rxc-skew-psec =3D <2400>;
>                 txc-skew-psec =3D <2400>;
>                 rxdv-skew-psec =3D <0>;
> diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm6=
4/boot/dts/renesas/rzg3s-smarc-som.dtsi
> index 21bfa4e03972ffe2..71424e69939ee56b 100644
> --- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> +++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
> @@ -103,8 +103,7 @@ &eth0 {
>
>         phy0: ethernet-phy@7 {
>                 reg =3D <7>;
> -               interrupt-parent =3D <&pinctrl>;
> -               interrupts =3D <RZG2L_GPIO(12, 0) IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&pinctrl RZG2L_GPIO(12, 0) IRQ_T=
YPE_EDGE_FALLING>;
>                 rxc-skew-psec =3D <0>;
>                 txc-skew-psec =3D <0>;
>                 rxdv-skew-psec =3D <0>;
> @@ -129,8 +128,7 @@ &eth1 {
>
>         phy1: ethernet-phy@7 {
>                 reg =3D <7>;
> -               interrupt-parent =3D <&pinctrl>;
> -               interrupts =3D <RZG2L_GPIO(12, 1) IRQ_TYPE_EDGE_FALLING>;
> +               interrupts-extended =3D <&pinctrl RZG2L_GPIO(12, 1) IRQ_T=
YPE_EDGE_FALLING>;
>                 rxc-skew-psec =3D <0>;
>                 txc-skew-psec =3D <0>;
>                 rxdv-skew-psec =3D <0>;
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm6=
4/boot/dts/renesas/salvator-common.dtsi
> index 3f8ce62488213bbe..ca0b5c070ae57dce 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -367,8 +367,7 @@ phy0: ethernet-phy@0 {
>                              "ethernet-phy-ieee802.3-c22";
>                 rxc-skew-ps =3D <1500>;
>                 reg =3D <0>;
> -               interrupt-parent =3D <&gpio2>;
> -               interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios =3D <&gpio2 10 GPIO_ACTIVE_LOW>;
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/=
renesas/ulcb.dtsi
> index a2f66f916048496e..4cf141a701c0625a 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> @@ -150,8 +150,7 @@ phy0: ethernet-phy@0 {
>                              "ethernet-phy-ieee802.3-c22";
>                 rxc-skew-ps =3D <1500>;
>                 reg =3D <0>;
> -               interrupt-parent =3D <&gpio2>;
> -               interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
> +               interrupts-extended =3D <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
>                 reset-gpios =3D <&gpio2 10 GPIO_ACTIVE_LOW>;
>         };
>  };
> diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arc=
h/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> index 36f5deb7f24afc2e..209cba75adec6d6c 100644
> --- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
> @@ -167,8 +167,7 @@ avb0_phy: ethernet-phy@0 {
>                                      "ethernet-phy-ieee802.3-c22";
>                         rxc-skew-ps =3D <1500>;
>                         reg =3D <0>;
> -                       interrupt-parent =3D <&gpio7>;
> -                       interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&gpio7 5 IRQ_TYPE_LEVEL_=
LOW>;
>                         reset-gpios =3D <&gpio7 10 GPIO_ACTIVE_LOW>;
>                 };
>         };
> diff --git a/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi b/arch/=
arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
> index 595ec4ff4cdd0190..ad94bf3f5e6c426f 100644
> --- a/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
> +++ b/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
> @@ -29,8 +29,7 @@ mdio {
>                 avb1_phy: ethernet-phy@0 {
>                         compatible =3D "ethernet-phy-ieee802.3-c45";
>                         reg =3D <0>;
> -                       interrupt-parent =3D <&gpio6>;
> -                       interrupts =3D <3 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&gpio6 3 IRQ_TYPE_LEVEL_=
LOW>;
>                 };
>         };
>  };
> @@ -51,8 +50,7 @@ mdio {
>                 avb2_phy: ethernet-phy@0 {
>                         compatible =3D "ethernet-phy-ieee802.3-c45";
>                         reg =3D <0>;
> -                       interrupt-parent =3D <&gpio5>;
> -                       interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupts-extended =3D <&gpio5 4 IRQ_TYPE_LEVEL_=
LOW>;
>                 };
>         };
>  };
> --
> 2.34.1
>
>

