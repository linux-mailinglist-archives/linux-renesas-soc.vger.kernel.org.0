Return-Path: <linux-renesas-soc+bounces-6147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB343906964
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 11:54:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ADCB31C22675
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2024 09:54:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2DA14039D;
	Thu, 13 Jun 2024 09:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Byd4tdTF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C291304AA;
	Thu, 13 Jun 2024 09:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718272464; cv=none; b=reqzbrOw7u8Qg6Z5Ubwd4Qh4E8B2qNJWMNtzQpnNIBuwcT6xCiGA/C7n7BtFdhK1CE4EHGvlun47Io98qWqGwmBh0vA4IGSe/d0gZCjCz4xvpwLfhrXL9E21Ad6TC4/w8vf2O1Pv5w5YiKkVgMLTgr6UhAT1BufbsothZ9Pjgt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718272464; c=relaxed/simple;
	bh=7aAGjMds4cC7C5pA9pH7zWzRxwd4zaZ7obLTR9e8hlY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYe2LC5VBrK9QryfbyQrinAiRlGog1DnmGKijyseO4clIY/WIneH1yYpSJ0wHojZtqtzL3BvcYyUTe2bJQoGFdcTQALL1pudeKvrIdY9NQFNoNLUMpjBE1+YFJqjyM9JI1wutCTmDh/wdrCe2ODVE86QuUcqf8MahPnQymVcu34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Byd4tdTF; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-4ed0ab952b0so304371e0c.3;
        Thu, 13 Jun 2024 02:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718272462; x=1718877262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K/vq8+DzyU0cJDbrOi0VwZbaVD4MN4U9YYAh7ulwD8E=;
        b=Byd4tdTFQ0OoZbiGJ7mqRTGHa0xy7ELws4eNuDOGOKxw94cS06VXxby80jIL5p2X6O
         1C0O4RXTQVeJhGjOgqrg7TynXvdfcFrk14+HQ7lBFdH4xgKPK7I6CeNDzttu21ld+CZX
         vAz1OSpRRDoqOjA0E9nToY5RCPRTEjAkV+ms/k5WyOs3dd1E/clES1Li+3MuLE+EYX0q
         i0uakLUvi+G8L1cgM7oMAOD1gdIwBhRhr3tvunBhbb/PKEy0jQO/mRF9hSMFbc8Gu8Aq
         ldX7ez2Hvsipf3qqVh0EyfM/bxnjHN6hGi/gQegl6sVOx7m4Xl+IxwlnBR06+s7wC30x
         hJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718272462; x=1718877262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K/vq8+DzyU0cJDbrOi0VwZbaVD4MN4U9YYAh7ulwD8E=;
        b=oUypJU6kyRa/7D09eTCzFUWMgl7PiLdNVkOVt/0JCayQ0Zn/9SumiDEfU5sKaYz0N3
         3tX0g+55hwxPufa1OSVoaXp4GqmgielUQmdQgDvIrEd0V190vmuyZR8vwP6v8+MitiID
         Je6WIhqP4JAdrHNVk79bxCNoKAiqeCAoPf62TB8mlxmy6l5AcEIrmacrxI0ax0QOJprn
         raKu0c3JEM8vyrjKupigmEXzdNOPED7wDEg8WvsVdWtxr28ywrTvxtSapxragB2MgVJQ
         rxWuOFK65bf4wdu7x5bsupP3J/k+RANwAsk92D41F3ZYQ5KwX8MxxS2zOnyhqnG5GtKJ
         J53w==
X-Forwarded-Encrypted: i=1; AJvYcCWMXr/OefzBkoF/VMrVqPT417MCajM17cNJE5YDs/f6ufrCiPjb3sRibIZawgZlkt1Jk+ZJzHxVziD/WVEbi4s03jLRi2pgzcmth8xZPfwyLNUEWkeegD/9XttnFdoutRqV9tJfHY0CjvpNkcpwMAiSnmGszBmICR+z7GSkxjYJzL/HtovLH4Bo+QaN7lzrhBUYkA13NM1Ull/LX1pdo7c8Ha0gzBXJ
X-Gm-Message-State: AOJu0YzArrY3vS9nx6g6fvsyC5sRhdzZS6EzywtQ8NltTkT6hOwhIOdy
	xmMd3jgg6J7xeA7tR84pw1B7pDNtpOkBUu69qaLKWrhjLBHUwlclJZXKMaMKO1gN79Qwcj5FCw0
	Q3qGny044L85fJWE3LjyCLByAdKc=
X-Google-Smtp-Source: AGHT+IHTNg/HUt+bXVJDMIhzaY+LzLgC26EDmTgJo6tyA21CR32TSuFcohgyHb7mAMUm2nHHkRCxewSlyEFLyU1L+aQ=
X-Received: by 2002:a05:6122:361a:b0:4ec:f52b:e4db with SMTP id
 71dfb90a1353d-4ed07c038f9mr3690216e0c.16.1718272460688; Thu, 13 Jun 2024
 02:54:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240610233221.242749-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240610233221.242749-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <34b21e6f-0896-4691-9b66-d06ef2f44905@kernel.org>
In-Reply-To: <34b21e6f-0896-4691-9b66-d06ef2f44905@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 13 Jun 2024 10:53:50 +0100
Message-ID: <CA+V-a8u6dDpbb5BrQ+ty_RbwcPOF-U6rnJnuASRXEDVdrhrvAA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] dt-bindings: clock: renesas: Document
 RZ/V2H(P) SoC CPG
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Tue, Jun 11, 2024 at 8:02=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 11/06/2024 01:32, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the device tree bindings for the Renesas RZ/V2H(P) SoC
> > Clock Pulse Generator (CPG).
> >
> > CPG block handles the below operations:
> > - Generation and control of clock signals for the IP modules
> > - Generation and control of resets
> > - Control over booting
> > - Low power consumption and power supply domains
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Since this is not a finished work (RFC), only limited review follows.
>
>
> > +$id: http://devicetree.org/schemas/clock/renesas,rzv2h-cpg.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas RZ/V2H(P) Clock Pulse Generator (CPG)
> > +
> > +maintainers:
> > +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > +
> > +description: |
>
> Do not need '|' unless you need to preserve formatting.
>
OK.

> > +  On Renesas RZ/V2H(P) SoCs, the CPG (Clock Pulse Generator) handles g=
eneration
> > +  and control of clock signals for the IP modules, generation and cont=
rol of resets,
> > +  and control over booting, low power consumption and power supply dom=
ains.
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r9a09g057-cpg
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  clock-names:
> > +    description:
> > +      Clock source to CPG on QEXTAL pin.
> > +    const: qextal
> > +
> > +  '#clock-cells':
> > +    description: |
> > +      - For CPG core clocks, the two clock specifier cells must be "CP=
G_CORE"
> > +        and a core clock reference, as defined in
> > +        <dt-bindings/clock/r9a09g057-cpg.h>,
>
> So second cell is not used?
>
It will be used for blocks using core clocks.

> > +      - For module clocks, the two clock specifier cells must be "CPG_=
MOD" and
> > +        a module number.  The module number is calculated as the CLKON=
 register
> > +        offset index multiplied by 16, plus the actual bit in the regi=
ster
> > +        used to turn the CLK ON. For example, for CGC_GIC_0_GICCLK, th=
e
> > +        calculation is (1 * 16 + 3) =3D 19.
>
> You should not have different values. Make it const: 1 and just use IDs.
>
Are you suggesting not to differentiate between core/mod clocks. They
are differentiated because the MOD clocks can turned ON/OFF but where
as with the core clocks we cannot turn them ON/OF so the driver needs
to know this, hence two specifiers are used.

> > +    const: 2
> > +
> > +  '#power-domain-cells':
> > +    description:
> > +      SoC devices that are part of the CPG/Module Standby Mode Clock D=
omain and
> > +      can be power-managed through Module Standby should refer to the =
CPG device
> > +      node in their "power-domains" property, as documented by the gen=
eric PM
> > +      Domain bindings in Documentation/devicetree/bindings/power/power=
-domain.yaml.
>
> Drop description, it's redundant.
>
OK.

> > +    const: 0
> > +
> > +  '#reset-cells':
> > +    description:
> > +      The single reset specifier cell must be the reset number. The re=
set number
> > +      is calculated as the reset register offset index multiplied by 1=
6, plus the
> > +      actual bit in the register used to reset the specific IP block. =
For example,
> > +      for SYS_0_PRESETN, the calculation is (3 * 16 + 0) =3D 48.
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - '#clock-cells'
> > +  - '#power-domain-cells'
> > +  - '#reset-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    cpg: clock-controller@10420000 {
>
> Drop unused label.
>
OK.

> > +            compatible =3D "renesas,r9a09g057-cpg";
>
> Use 4 spaces for example indentation.
>
Sure, I will update it.

Cheers,
Prabhakar

