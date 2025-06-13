Return-Path: <linux-renesas-soc+bounces-18312-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33903AD9190
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 17:38:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 933E81BC4188
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 15:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 687D51F2BA4;
	Fri, 13 Jun 2025 15:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HP+PCI1p"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D501EEA47;
	Fri, 13 Jun 2025 15:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749829104; cv=none; b=l55P2Oeq38l0qFR+Nl4BFkSgtZbO2GVKiA8zJtYv6YUt1UGLnLwC6Y5yggbyYCP/OcwxaHtQ69f7cSSII2wIVKvx6GK/9u3dCLbrrzVh6nRbzmIp/Ms1IGmRhWXGc9eHP6ojp8FEpOsOtLv9mG5S0I/2dsi76E0tdlIUgY51snM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749829104; c=relaxed/simple;
	bh=HQhTZfTnw4diVZnHhB7ZoGRrWk9EQDmPViI90O1QwPg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r+tM1otCyOo9rcYN+AEDpoXDwdqV5HHolGO13VhDEqO2e0q4eeDudSwEVRQyqr3q7U4FFnTP/VuU6r/p/dhvXjHRhcHpA+l7XzkrcOmoIRZmLAEi16eDpn4Za+830pwB6sN4oaHAntuFKipSc3HuE4VWDK0HsP/WuKaBSDzWYX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HP+PCI1p; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a375e72473so1410695f8f.0;
        Fri, 13 Jun 2025 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749829101; x=1750433901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wci3OULWlGFVwJ58oYx/jmZbLNoBsgngvOoZDnSz/1o=;
        b=HP+PCI1p2WndYBorGxD0G72q7j3QdzuvcFRtKgRln+9DJsUJMW/XpODPJ2ADnKryMw
         /fmh0c9U0aIc8r7taRf3Yu3hkYkYxiIAX5GEXz8coBaTSoWmK6iLMnhJ1qcI2emkaXTn
         CjUxgruPMQBVPAO5tBjYYPvb5dMcpLX11DHPCAlVoz01owY7itpbY7VMSCs1ulO7QjAO
         WG8DyHDvF8eEa40mH5wu4egRk9gWK4eNBAMq2UFt/C8EBNQyl1vaXJ3GlV3yvv6j8+6l
         COmC0HWTFIQMpyXxeSpHuJdoQPdH1+qqAFzAn+LgD+yDS0K8SySKQHx9sHFk11P8gUb1
         Y0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749829101; x=1750433901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wci3OULWlGFVwJ58oYx/jmZbLNoBsgngvOoZDnSz/1o=;
        b=DViOGAcnPVEYvQ31/U6IXxI3NUS6j3n/1RJ8QsvfM9UA6p31ld8SMvftPqs6x2/Mha
         vCNWSTPy24ABMryH92E0RqNiGUX3UnUjkdJd74+eFPyUViojNrB6cVQpLb/q2IQ54yaX
         cSinGFKKf7FbGl7HFjgtmUQT6tDgNRGwPhuB1udT4hzo48ODUQP5K++FJQY9quOoUQIs
         uIJdUvszCvB/IkUa7uFQ6PZZZpVVE0LvZ3yio7XSJvMPbd3rpGEy9+AQ43/mSF0LvzvR
         Ie0f+Zm7HHoqWVyejTjW1hHU1xkRyJdF9aDfN510Yl4UBm6ese6Nwf4dNbUqByWgAp7/
         wd0A==
X-Forwarded-Encrypted: i=1; AJvYcCUNIVbZ//jtnLBVpd3QEWlt1UoIABjvcS4DQmfp81Pc0lsYD63cJ7jIy0i3QWiHBXDRuJzOxeX7mdli@vger.kernel.org, AJvYcCVFWLrUCz9j3TXAD4TlCggzyFwQEu3h+J8net6hcpGNcuwBg3AvHtm2Oifv0Q60ldcgroD6sJq33hCvnTf1@vger.kernel.org, AJvYcCVhjly38mA8nCQ1f3FeVMnQXOg4hVOnPFdilGSixJ6RR/hD5YKtHoccGdqmv0YYnAlm+KSBh8sQqOEym0yIEs68wKo=@vger.kernel.org, AJvYcCWMmll+UlWzQs5rVG+xJuiKlRaTHFsPidpI8Nf97uEzlWLtU0NPNMNkFj7Rp1+Z9S3HpNMP4jwCcibW@vger.kernel.org
X-Gm-Message-State: AOJu0YxgF+D8fOUCoyPUITcdWrEky5De3DOgaaRmCpWT6m1X90lpJwU4
	i9mN3P72OqrIsuQd0okUrQ+8hA0TRqVxYIe/9SjcTzyJNfxoHKVyof5Pwmjf83FIJkWMHIFI9yx
	JaNCiawnIAKMQBFeDLBsc+io9tuXEc0o=
X-Gm-Gg: ASbGncsmIujHSql7BtgCkfQD5NjSOhX6AX37cRx31+Etsc+vY44cBO9hEME3faqmc6h
	XBhTTgNgHNxCzeo9M/RDEl/1Ob0ibt8K6aEV1lebaiqQCJplKHQcVCNNtpj11ItVYkqxUgl4Q3I
	ksgpx4VAdNdTyP5QT4bH1JFNOlE9Dkj0sYyCQE7K79Ye8=
X-Google-Smtp-Source: AGHT+IEMrjsiK9P909xoQb43iNVR6qh9Ty1yLTa5JLGU6Mssh8oQxVdmG4OaKVUa4OkcVm1Om/tDr6y6PKQ/juNx3+8=
X-Received: by 2002:a05:6000:2c0f:b0:3a4:ef2c:2e03 with SMTP id
 ffacd0b85a97d-3a5723a2c47mr224793f8f.33.1749829100900; Fri, 13 Jun 2025
 08:38:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609232253.514220-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWoWqrMKgNSYN_NDOtROD-SAq7ProhREPJTEBTOPCeH=A@mail.gmail.com>
In-Reply-To: <CAMuHMdWoWqrMKgNSYN_NDOtROD-SAq7ProhREPJTEBTOPCeH=A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 13 Jun 2025 16:37:55 +0100
X-Gm-Features: AX0GCFvZCGvYpOP-G07AbNUHUOwIj4rYaSPCHj8y71th97TvgAtpMZZM4unZwDg
Message-ID: <CA+V-a8sBhF-FwV0BXCxpHkuhdAg5YcwDsWPFRPSV_BdmNpLWYA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: renesas,sdhi: Document RZ/T2H and
 RZ/N2H support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Jun 12, 2025 at 4:47=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 10 Jun 2025 at 01:23, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add SDHI bindings for the Renesas RZ/T2H (a.k.a R9A09G077) and RZ/N2H
> > (a.k.a R9A09G087) SoCs. Use `renesas,sdhi-r9a09g057` as a fallback sinc=
e
> > the SD/MMC block on these SoCs is identical to the one on RZ/V2H(P),
> > allowing reuse of the existing driver without modifications.
> >
> > Update the binding schema to reflect differences: unlike RZ/V2H(P),
> > RZ/T2H and RZ/N2H do not require the `resets` property and use only a
> > single clock instead of four.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > +++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
> > @@ -129,59 +131,75 @@ allOf:
> >          compatible:
> >            contains:
> >              enum:
> > -              - renesas,sdhi-r9a09g057
> > -              - renesas,rzg2l-sdhi
> > +              - renesas,sdhi-r9a09g077
> > +              - renesas,sdhi-r9a09g087
> >      then:
> >        properties:
> > +        resets: false
> >          clocks:
> > -          items:
> > -            - description: IMCLK, SDHI channel main clock1.
> > -            - description: CLK_HS, SDHI channel High speed clock which=
 operates
> > -                           4 times that of SDHI channel main clock1.
> > -            - description: IMCLK2, SDHI channel main clock2. When this=
 clock is
> > -                           turned off, external SD card detection cann=
ot be
> > -                           detected.
> > -            - description: ACLK, SDHI channel bus clock.
> > +          description: ACLK, SDHI channel bus clock.
>
> According to the documentation, this is the SDHI high speed clock...
>
Agreed, I will update it to `CLKHS, SDHI channel High speed clock.`

> > +          maxItems: 1
> >          clock-names:
> > -          items:
> > -            - const: core
> > -            - const: clkh
> > -            - const: cd
> > -            - const: aclk
> > -      required:
> > -        - clock-names
> > -        - resets
> > +          const: aclk
>
> ... i.e. clkhs.
s/clkhs/clkh

Cheers,
Prabhakar

