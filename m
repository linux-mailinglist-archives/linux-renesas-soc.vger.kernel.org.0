Return-Path: <linux-renesas-soc+bounces-26332-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB32CF9FC7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 06 Jan 2026 19:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 137733070ABB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Jan 2026 18:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE5C33B6DF;
	Tue,  6 Jan 2026 17:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HA1WiDHb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1E8339861
	for <linux-renesas-soc@vger.kernel.org>; Tue,  6 Jan 2026 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720408; cv=none; b=YyGCf06iAPED65mArKXzItEBXf+obSRykdPIW6X6Cj3L0H3NMV44sg600CgG6ShwmkJCtrk7b84TuTZTjo93qyT7ullDh7fHtFrkqAk73z1JyjTI0u2fSi3U4zcgtZezIWAH3MECS+0A7S2OlfS7YIBpbKf99YWEOq6RjHBRciI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720408; c=relaxed/simple;
	bh=jIERsNeLWsCMRsQUhVUyTdjFaVz1btYgxR4tH7uHWbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p5bv1bpWBibU1a/TqjLrptRsIzP2YgdqnO2aOohY2lEZvOsJx2rCaFuKPfrgj8mCMkXOcLHbB25K0KaXd48E6jjPa7IY8q2tK8VWni5D7xx0zvGV9p7mkjbfZR6xRdu8CLIWpaKZLh8WnE+io8FaOMUS/9y07CEAAEjZCD1zxVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HA1WiDHb; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so7863345e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 06 Jan 2026 09:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767720405; x=1768325205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pMHpVSuzSyUl3NaYsDNZbwWy9/z4ne3LRaPNYd9gtY=;
        b=HA1WiDHblkzmbBh+R3ra8Vi0u3Y+Hl7+/3c0w1xec3HDYnK/dh35FFm9ns9faoksmB
         pvhLb2DEYD1yfJThms691VLJAN+tmwllhkkRuGFxQad44rO3kd3WiNB0YcGP8HAkLout
         gBBp+ZiSCSLoDz61BiUbwdWnbu7ur6269vecvNBUNuLZuLrqVbgQsSehVunl0xeVNkAA
         0yzRf2tBrZPtRM1I31NrkWZXnWpnDFVAO1cBLwcD5jEokR1E8g2xaGNkFWhhuPh4/ozJ
         sO/XI/uWOduQx0C4LB/LS5ODbLaIIipekDBdIcRCn1SIwgyg3l2ED8mIoYeLbqJf02nG
         HoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767720405; x=1768325205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2pMHpVSuzSyUl3NaYsDNZbwWy9/z4ne3LRaPNYd9gtY=;
        b=ka6c4tMWxMy1ZOdQ59vf3Iv6dciIE1X8rl7SUz1PyEJSvd/IwfJkU1XSEnN/hDLM33
         tXpqMioM5Nzn2OUPIyB3LlML6Bhn3OwYDcWyqrEgwn2zbvLHsa+x/hpvAxGyitUKdupG
         BoAe9z+iFHBwAMKgmSux0QtdH1R6cxXJ01/la06dzd+KP7SjWdQEA+4yFAPYVMlzsje9
         0zcKkWzz+6l0TolckTfZfXaF211L7AjW0qGNggOdgKN87T84Qfc8gQWpeoumHYBMgjsY
         X/T4jiLmbLNx7HdKMRsNlVYyJUS+tZWdMt6sEK4gIkbmy1YHB07fWscDaEFHErIBYkcj
         K25Q==
X-Forwarded-Encrypted: i=1; AJvYcCVi5mNjdWlKOeu450wyOrVMvm+GBjjZgMUX0E5ijha4ceOOCDYOtADEH5ZQTVMh9k3MVSAe2IExmJQGW9Q+Lc038w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyY5UJuvA35zmksCNffONMX2Uk5H72DVomyyleOy4pfl3c8JxKR
	5XJjst253G42z/0r8PXnnQzrL3j4abQPzWVA4T0C1AorjAlb20uXJpTZn4hQAuyFD3bVS1Xc7MW
	02m9tCOP00i+4LJpKltDgt8Y+WUdv3BQ=
X-Gm-Gg: AY/fxX5iBeM/k3Enm7KeP1Dv8i/NFL5+OrSIC0Xk9vZqcjVeGxDCtNTssM+wH7YGe9c
	2i5CnP4H9GZV5hXVaF0ajPGcHkQL20pQuFp5WcZvvPdliYonIm3FTIUQ7cjhgT929P0/wK4z8C4
	lwbIrpB9AyNn5z4Ldt02TJ3z3Ukf6pHn5nSqV9eJVlCP0qdxwi3VEiYUMfQyMV3xhQTgqXUlySt
	t+E3rm82UeR2KgHOWNUsshkomUaTTjb1JOJFh+vGYqvcikUFC3Mssm0xPWAdN/j/7y3TozgrqT8
	Khrgle/FEm2qfqZXv1HfNfyGUu3FcJodxw2O67jdXeQAL0E8cxq5IGdpaT+eqUl9UIJA2R6K2oE
	QvWrQj4f5xEsBVe1P+zgih9E=
X-Google-Smtp-Source: AGHT+IE8gvKCbSJq1z8Cd0vdaqEHelQJRB7VUwu1Y6OV1SxZq84Rtw9xQvuGr69PPYzoTYxNGWtVKyAC81y0wEosCQQ=
X-Received: by 2002:a05:600c:154c:b0:477:6374:6347 with SMTP id
 5b1f17b1804b1-47d7f098beamr41642405e9.22.1767720405159; Tue, 06 Jan 2026
 09:26:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230115814.53536-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251230115814.53536-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260102-petite-gentle-wasp-81bbb8@quoll>
In-Reply-To: <20260102-petite-gentle-wasp-81bbb8@quoll>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 6 Jan 2026 17:26:19 +0000
X-Gm-Features: AQt7F2oLYuXOHzsB0MroBEn6dGAE93yUvo9CAwzUHg627WTSLy-aKKnPg1k6phQ
Message-ID: <CA+V-a8sryz1f_woi_r8jx_4x7TczrWPyjZoo+P9p=tG8KyK8YA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: can: renesas,rcar-canfd: Document
 RZ/T2H and RZ/N2H SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Thank you for the review.

On Fri, Jan 2, 2026 at 11:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Dec 30, 2025 at 11:58:13AM +0000, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the CAN-FD controller used on the RZ/T2H and RZ/N2H SoCs. The
> > CAN-FD IP is largely compatible with the R-Car Gen4 block, but differs
> > in that AFLPN and CFTML are different, there is no reset line for the I=
P,
> > and it only supports two channels.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - No changes made.
> > ---
> >  .../bindings/net/can/renesas,rcar-canfd.yaml  | 26 ++++++++++++++++++-
> >  1 file changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-can=
fd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> > index fb709cfd26d7..4a83e9e34d67 100644
> > --- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> > +++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
> > @@ -50,6 +50,12 @@ properties:
> >                - renesas,r9a09g057-canfd     # RZ/V2H(P)
> >            - const: renesas,r9a09g047-canfd
> >
> > +      - const: renesas,r9a09g077-canfd      # RZ/T2H
>
>
> That's part of other enum with single compatibles.
>
There is no enum with single compatibles as of in next [0], there is
only one compatible `renesas,r9a09g047-canfd`. I can club this with
RZ/T2H one.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml?h=3Dnex=
t-20260106

> > +
> > +      - items:
> > +          - const: renesas,r9a09g087-canfd  # RZ/N2H
> > +          - const: renesas,r9a09g077-canfd
> > +
> >    reg:
> >      maxItems: 1
> >
> > @@ -179,7 +185,6 @@ required:
> >    - clocks
> >    - clock-names
> >    - power-domains
> > -  - resets
> >    - assigned-clocks
> >    - assigned-clock-rates
> >    - channel0
> > @@ -243,11 +248,30 @@ allOf:
> >            minItems: 2
> >            maxItems: 2
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g077-canfd
> > +    then:
> > +      properties:
> > +        interrupts:
> > +          maxItems: 8
> > +
> > +        interrupt-names:
> > +          maxItems: 8
> > +
> > +        resets: false
> > +    else:
> > +      required:
> > +        - resets
>
> Why is this de-synced with reset-names? Properties are supposed to
> behave the same way, not once requiring resets other time requiring
> reset-names.
>
There are SoCs that have a single reset and others that require two
resets. For SoCs that require two resets, the reset-names property is
marked as required, while for SoCs with a single reset it is not.
Apart from the RZ/T2H SoC, all SoCs have either one or two resets.
This difference is why the properties became de-synced. Let me know if
this can be handled differently.

Cheers,
Prabhakar

