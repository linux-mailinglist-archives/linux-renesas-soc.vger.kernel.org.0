Return-Path: <linux-renesas-soc+bounces-7429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF8B938FD0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 15:19:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03752B20EDD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5790416CD39;
	Mon, 22 Jul 2024 13:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PlviBwLd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE18916938C;
	Mon, 22 Jul 2024 13:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721654379; cv=none; b=t0zoKC/0ikrmJPk50Lx4pb3qnw/kZSD3WwigTTk3nFw5Qmqa2Z1YZf9XdA2GyvXf0w8Ftobu5udYZ32aJUEUppwNCHruzexArkw1Xc/itUkeerkZqGN0xEDiRzqQp/chfnOwYsx8cNgU9Y3iUU3AZCiKUOICpxEMgwlZ5/11Mhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721654379; c=relaxed/simple;
	bh=6nFLP/ciY3DfP7kbKQXLTQ5W82Xb9tsB2hQvnQAFRCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JcfLwoHzj3ZK55z8qEfE5j0fVfxq31o1HyTfBsfL8ADTaZm40d8OM8j++uO84oYYIydtOD0yIoRneVPqC8BKrI9prSH+FO4kjlh8BBippKVjI26REtl4P34nfvDgV/m0I4jK+dOR0RcE17Gjpo7MiT4PYpunfphKiSbz46P2uxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PlviBwLd; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-823227e7572so2227939241.1;
        Mon, 22 Jul 2024 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721654376; x=1722259176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07fP8yssZ0tKq69jIj+FMPQwqseZTcnXvz35hYzvfjQ=;
        b=PlviBwLd5n8tXjI8YUB8WezuDx4iC5Rf2ZfnwaGAVCoR6T4TVl7ZfFjtU20Lm64Evw
         CUENtpEXouzGK9Lm3f2/nVV5WRlIAJvCe4KkhFJbYZlZ6ytcgwVsAt7HJ3UZQL8Bdi0J
         8dswlgUD8A1TrPEjkEel5YyObOjrGw/mzdBr0DBq/otQJi098O4DEt5ECzqoc36bajxv
         Ehe0LQl+Hnb0ynND8G8c2TQYbYvIapHf4RmTC3MOnoa14vRVHSv/hVPMmQm7EHPrd2vh
         p/pLg/MdtlwySk0utsgt/Xfx1EeUtwwOcrJGKWJye5EUiFqPIZyIV4iE8/luW+AmATxj
         KDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721654376; x=1722259176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07fP8yssZ0tKq69jIj+FMPQwqseZTcnXvz35hYzvfjQ=;
        b=SGlrwr3kaMxxHV5UJN6GyxGwphYDpjrImGgFhOakOQo8+w2GVostWoLyRjLK4YY33A
         3QpNB2fkY27B0L1qBgzZ1osSmuxYScOyIwV2P0khgaP9weEmbgDU/VXgAwWA/6FuX8L3
         CjPwyfjrzM3dj0w3O2hm4UQ1JpwLE+4f+vIahxaT4hFDNDjMW+XcMZTLJ9cCGfcXcH8U
         n3WcUp9h/CdJX9fVwJiWyl0F7EviESD0aaPha/VvvwTFPtU2PYxSFhBDdLFk8P4o+04p
         PnzQAT5mGqqQEXaJOrWdDxCdTY796iDrn56BajG6ulK5hbjfS0122ueMW9KDHMLywcOJ
         P/yw==
X-Forwarded-Encrypted: i=1; AJvYcCXHuXECc6QCqySyGAyBrLasc9MZAgodF23/ig0K5ZQi4KnON5sJy0+6wbvUSUXPd3Vn4jGmITpMXiIIjD8pc2+dbZAKjO4gs5QGRB25anIdYtE233u6C3H+/ngVD4LOLke3YAjaAzfMMrMBzuSmKbK9j85HVxAal2EJscd+fIKJq2txnpdWzFYJd9FwWsK7FWAeDKVMayZyJNGD7ZMd+6bTpJUxQ6p7
X-Gm-Message-State: AOJu0Yy1IyCvLn2DirkHWUFpmVTedLiya21yVk4VUfFtiwO7MPFI7Ae5
	XjJHPrqq3uxy+Eww1w8IFnNBJXOMg+h0kI4bUWE8swhds8SyBmfj2+rHj4cBhRzKLYp0vGiD+Vh
	IW+JoApAH9uD5wY/gEpVj9+Lx5oc=
X-Google-Smtp-Source: AGHT+IEL/nroc1mlmfx0Yrfx++3jeFEcvf1cyf4cZ36K2s4RuLwjF/Sft1Y4OHQJQBZTjBPk3OfNuuEFvFwQVGkuinY=
X-Received: by 2002:a05:6122:3281:b0:4f5:2849:598d with SMTP id
 71dfb90a1353d-4f528496166mr961245e0c.4.1721654376282; Mon, 22 Jul 2024
 06:19:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626132341.342963-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240626132341.342963-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <ZoUb_olfaVapoYBi@shikoro> <CA+V-a8uJ-jv65fK7=XYtMvCCiEbFKcRHW3xNj8SQd2TJ++43QQ@mail.gmail.com>
In-Reply-To: <CA+V-a8uJ-jv65fK7=XYtMvCCiEbFKcRHW3xNj8SQd2TJ++43QQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 22 Jul 2024 14:19:10 +0100
Message-ID: <CA+V-a8uQz4fbCHeG-88Re3sxa3ye+5NfZ=NRdgV-58=9tHpN+A@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: mmc: renesas,sdhi: Document RZ/V2H(P) support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, 
	Magnus Damm <magnus.damm@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wolfram,

On Thu, Jul 4, 2024 at 7:27=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Wolfram,
>
> On Wed, Jul 3, 2024 at 10:38=E2=80=AFAM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> >
> > On Wed, Jun 26, 2024 at 02:23:39PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > The SD/MMC block on the RZ/V2H(P) ("R9A09G057") SoC is similar to tha=
t
> > > of the R-Car Gen3, but it has some differences:
> > > - HS400 is not supported.
> > > - It supports the SD_IOVS bit to control the IO voltage level.
> > > - It supports fixed address mode.
> > >
> > > To accommodate these differences, a SoC-specific 'renesas,sdhi-r9a09g=
057'
> > > compatible string is added.
> > >
> > > A 'vqmmc-regulator' object is introduced to handle the power enable (=
PWEN)
> > > and voltage level switching for the SD/MMC.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Can we have an example here? I can read DTS snippets better than YAML
> > code :/ Also wondering about the "regulator-compatible" property but
> > maybe the example makes the problem clear?
> >
> You mean in the commit message or comment section? (I had added below
> in the cover letter)
>
> SoC DTSI node:
> sdhi1: mmc@15c10000 {
>         compatible =3D "renesas,sdhi-r9a09g057";
>         reg =3D <0x0 0x15c10000 0 0x10000>;
>         interrupts =3D <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
>                         <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
>         clocks =3D <&cpg CPG_MOD 167>,
>                         <&cpg CPG_MOD 169>,
>                         <&cpg CPG_MOD 168>,
>                         <&cpg CPG_MOD 170>;
>         clock-names =3D "core", "clkh", "cd", "aclk";
>         resets =3D <&cpg 168>;
>         power-domains =3D <&cpg>;
>         status =3D "disabled";
>
>         vqmmc_sdhi1: vqmmc-regulator {
>                 regulator-compatible =3D "vqmmc-r9a09g057-regulator";
>                 regulator-name =3D "sdhi1-vqmmc-regulator";
>                 regulator-min-microvolt =3D <1800000>;
>                 regulator-max-microvolt =3D <3300000>;
>                 status =3D "disabled";
>         };
> };
>
> Board DTS:
> &sdhi1 {
>         pinctrl-0 =3D <&sdhi1_pins>;
>         pinctrl-1 =3D <&sdhi1_pins>;
>         pinctrl-names =3D "default", "state_uhs";
>         vmmc-supply =3D <&reg_3p3v>;
>         vqmmc-supply =3D <&vqmmc_sdhi1>;
>         bus-width =3D <4>;
>         sd-uhs-sdr50;
>         sd-uhs-sdr104;
>         status =3D "okay";
> };
>
> &vqmmc_sdhi1 {
>      status =3D "okay";
> };
>
> Based on feedback from Conor, we cannot use the regulator-compatible
> property. This would require us to implement separate drivers (one for
> VMMC and another for VQMMC), which I believe would necessitate the use
> of regmap. Currently, this seems unnecessary for controlling the two
> bits as a regulator. As Geert previously pointed out, the PWEN and
> IOVS pins can always be multiplexed as GPIOs on the RZ/V2H SoC (as is
> done on R-Car devices). Therefore, I am inclined to drop the internal
> regulator support for now.
>
> Let me know your thoughts.
>
Gentle ping.

Cheers,
Prabhakar

