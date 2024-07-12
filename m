Return-Path: <linux-renesas-soc+bounces-7301-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5726792FBC7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 15:49:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0073B1F232C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 13:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7DB17108E;
	Fri, 12 Jul 2024 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWCWqkEp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05B716EB6E;
	Fri, 12 Jul 2024 13:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720792140; cv=none; b=MNtuf9hoO23v+p8WVQGZfETFkKfJs1ERJUTYPHjpSAGESM8KF8/ZBBeJQS9vCPipcV8K420wSZPBVoT4Kr5vLLBivRhXibqOPEo4Kgp/wIqjwuwkbK5wXvI8yjGjXYNLDRE+z+WbDP3Zj1sQTU/pMe8p1sTXKQWfYE+Lxap0jaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720792140; c=relaxed/simple;
	bh=Tu42nau61uQUrM2WkU0xQHoUNzdUiCiLufs8uTvML20=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dau1Na2BE8Z7EUCffRu2L8fcfzbSjdemTnUD+5NEeSBpXI720edKLKp3hjuNAIW+neY287n9I8v8GVVsOTgnNkDgUNuFuxRHebtn+bsVlMrOcpkew5eVNrn/FpA+Ca1auU7AtQDGMLeYcWSqyKr+aeoZBkkmSubzE/2L1/VQHh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWCWqkEp; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4ef76f04977so667966e0c.2;
        Fri, 12 Jul 2024 06:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720792137; x=1721396937; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CNeMMGyKMUpPSQSPubxQiT+hSpfRpgXCDkgjBJjYMQA=;
        b=VWCWqkEpmrLYYAAi6RSLkFhP9XA1iya9+W+R+f/5LhnSDKLjbXlEmtsmpbSayacbW3
         qKXF5c4PDOJqvobdhwBVX7LjEvQAMeswibXu1OIBTKES1hbkML79KwflC5ie+imN9G3V
         PvWsIvWts7YM38Cw/eDHULufuN54tGSwYc6IlWbzVJygJ1asntRTFi4OaZhZ29W89KOG
         3w1HrRx2Lh5ixhsAof7L9cD3AxbWDqSePxOMWc73zvxtx2B+C87xs4rWNasrmwXsEogh
         PXMmfTxOrNuNx/iF7Qq9u5jqzTmvDV7OlFlO9/1zo4Yh5ztCylOd1eLP01xK17KudiXd
         S32g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720792137; x=1721396937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNeMMGyKMUpPSQSPubxQiT+hSpfRpgXCDkgjBJjYMQA=;
        b=JErKuJzgma2aDIcmr5TQcqSlviSd9vTeHizvHSY3CXxS/JEDls4QW8EtMRJ6lJ0f+f
         jnoh4FuUklpQoKJAtLv7qhBoUbjAsO8pHNDC2UOjZncgUTO+N0smUbfk4KLBLljOZIYC
         IvQKhgYb0YVF4JSeHLSv3+gyu8xZBA7t9eGIdGI4UgOWkFirIMTBaZF0Zov4Qp4TtRW2
         uuYSegfTOJwut5I59lyVBUB9UBj7wcDG57g/4e+kNDEluMOhfY0dkoakBaNmDiBLsrKj
         EFpwbWLrH+7zB13s748m7xHANB1U5cyMk/t8RD1XQRCZvBhvp9Wx/h1535bjYtI6wJ9m
         Qx7w==
X-Forwarded-Encrypted: i=1; AJvYcCUp4zKAVFjhSvjGfTXBDRFIf0Jq8w/00YrGx0f8sWqi04Lb/miJ4x9AXcOT8QDGdy2ekEpXRSQfWE9ChyakBnWP8YlGaN+KxqMOxTe1LERsqXQCBNsGdv9b0UzGN+5PthR8FzBYxpdHz5zZScxcy6L7kjgxnI7c5UAUdA+KURFh8Bzkj4Vf5Mc/mzj2N/3haC4ZsZk1RdqI3MVWxpvIQsFHxvqH0zaO
X-Gm-Message-State: AOJu0Yzujh3AwkofQ0tmxar71oorpHpErfweHz8FT6J4t9l9yeMnaqak
	x1wAyYf9CXpnJiFOE35XVD5EtYTJaDG9j2yQb2KvMkcUcEsRozQVKYR3g2fzbkY7yowopl8vgXF
	L6Kd/SWIglwKYn6Qi9gu+zVmonwQ=
X-Google-Smtp-Source: AGHT+IEVNhqRMz9n9crf1r6WaUvNgJ/dyDPHlu7D7kgnmKPUhB8R0X+CUwUXHsUwxzcfSlFGxKZUeQJI5wevih/Gk48=
X-Received: by 2002:a05:6122:21ac:b0:4ef:52e2:6763 with SMTP id
 71dfb90a1353d-4f33f318833mr13257634e0c.13.1720792137495; Fri, 12 Jul 2024
 06:48:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240627161315.98143-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV4GUKc=LFStKHO47vPJLZs3Vmvz-L7L81bC5DmdK5ztA@mail.gmail.com>
In-Reply-To: <CAMuHMdV4GUKc=LFStKHO47vPJLZs3Vmvz-L7L81bC5DmdK5ztA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 12 Jul 2024 14:47:27 +0100
Message-ID: <CA+V-a8t3GVMo8N=uBn58=S9=0MtuaCtxxN4OC5F-i7Vp8ntcpg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: renesas: Document RZ/V2H(P)
 SoC CPG
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Fri, Jul 12, 2024 at 12:58=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
<snip>
> > +++ b/Documentation/devicetree/bindings/clock/renesas,rzv2h-cpg.yaml
> > +  '#clock-cells':
> > +    description: |
> > +      - For CPG core clocks, the two clock specifier cells must be "CP=
G_CORE"
> > +        and a core clock reference, as defined in
> > +        <dt-bindings/clock/renesas,r9a09g057-cpg.h>,
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
> Using hexadecimal for the final number may be more readable,
> also in the DTS?
>
> (1 * 16 + 3) =3D 0x13?
>
Agreed I will update the value to hex.

> > +    const: 2
> > +
> > +  '#power-domain-cells':
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
>
> (3 * 16 + 0) =3D 0x30?
>
OK.

> > --- /dev/null
> > +++ b/include/dt-bindings/clock/renesas,r9a09g057-cpg.h
> > @@ -0,0 +1,21 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > + *
> > + * Copyright (C) 2024 Renesas Electronics Corp.
> > + */
> > +#ifndef __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
> > +#define __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__
>
> __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__
>
> [...]
>
> > +#endif /* __DT_BINDINGS_CLOCK_R9A09G057_CPG_H__ */
>
> __DT_BINDINGS_CLOCK_RENESAS_R9A09G057_CPG_H__
>
Oops, I missed updating it after the file name change.

Cheers,
Prabhakar

