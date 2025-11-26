Return-Path: <linux-renesas-soc+bounces-25162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3DEC89838
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 12:28:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 099EF3ACA70
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Nov 2025 11:28:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3616320A33;
	Wed, 26 Nov 2025 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HFpOe9vw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058A331BC96
	for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 11:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764156506; cv=none; b=bZw8Y6BxGhr5WxG+A68PZ2zrarQo/bEaavgdtYpKPuEUBdruNH8//IdLgOpZ+XrTZDNTFva64HX+gq7iC2Y3pw910HuLrTj8MM8RdPM80qlfK5Eh6NQFYKytfOshI055qSw+fYWU2FF2YJwFEvrmCZfdSF+38IbyddqU2cH+qtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764156506; c=relaxed/simple;
	bh=oOe//IQucPCQt2/bOS8ODblOWIAKg3QxQhc/xwnFTmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r8xDpmnMuXHF7J7asy3+Wuo/isq4qvta5n6xls34KnjapoltmIZe/VLyEJYFqUI+ETNiPh5WUBHxaEI86m+2zRHrTk/tyMg2QQ+xUwnlA8Fr3CdKih0jDdZjxuX+zJSjOtm9H/kkwqt00riyGLsPpNVruNtirmZg2LE9j8SZdFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HFpOe9vw; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso64331605e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Nov 2025 03:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764156503; x=1764761303; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gjsPWAG5XU4d0gqUFjGMxsHwALFfrAEbUfu0r8tuP0=;
        b=HFpOe9vwfZxp494ZoRR7QYTNRMaSKDmrzFmhrLgfYZqF3oRdO/uZsvdVOVRaqChCmo
         WnK5srletzBK4pRZ4eVw3QuPLC3dyuSQWiAQWrKPvvhFZJ7ZTmBtK4O3XOi7hpJJph5E
         58RlbLX/aNs2Ne0LCrYWqliHiIyg3Ta77HzaTdFJ5bQ3wt/n21uRnESxh2ccWGqKtG2v
         bRFbPWhS7fk+aDeqh+h6XqSjgQAX0FKgR7lY8zH5gfYavab35O9/eVXnlDAlHAZuXPJm
         Y3FtsPD32+BX5Bo+RyjTyxpamtz3/6SYNxj+K0dRTb46AJZrDv90gD/b7vZUTZPGjJcZ
         YxhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764156503; x=1764761303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0gjsPWAG5XU4d0gqUFjGMxsHwALFfrAEbUfu0r8tuP0=;
        b=rOJD7+/kbJ0Dp/5cFBL/K4tJchHvZKbMKeIBwvucIxuvmd8/7J201eReUiVJ0PWoy5
         Gvn1c++59MI6v9RGJ2X0b7ZXfdZFTK6ZyA0ff/h/F+keeG6jUS25NA0gsVGyrcj2QjXl
         wM2vtxakuH5WZlwiqBbquwVs140mh0TKWORFog66fkYaIC6sWFegiDcaS1HPxJMiXQGn
         Wky61ORZWh0q+orqgZOU7efp7nZxI/B7yAgz/UrBV0MXQQm6G2zSDRquzaqzLD7LOAgA
         k8R/miZb6VqIdLp9jpGassLMqdLf3w0yEejpOr1ls0L1SoYvQ2B8wdueNd203FZrs4wU
         EbfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnSUKA6cfvEgfATZKsbzRDn1a+Lp+piattgouU3N+GRHAAsgeliJc7mzuuKT/3Sd7eZKOsT16sUs+cNpaseBlGgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5YrhxmpTLM29tpb+m/2BWe3HtHTHvk97gd2ctdu1rZyXs+1ud
	c5vt4AfifT1d/j4yorAgnvsSh283jmGU4G66i7EZI987klzucMeik0Wa2hJa2VqKvm+y0QnOGBp
	WSZ7kTFQcAGuOZzM7k0NJq62jAlQoVc8=
X-Gm-Gg: ASbGncsXRfB8fOmB+tTa37OMT1+0Yk12TihD22s89rwTpiuwHclu2rSsZX0suT69GbC
	RxsOnLGdxquMrOLmkLuFBtnEQJkcnPIlTdbqT7JANszASJAx+2bxtymniAK6Mmy/1FwoGCQWL1R
	f+cIzEyNg09lCwBuVE64XOLnOvbFoYuSaFlpqoSkNSX7dSbvzF1YnSTA7mbirN9l30ObL41vMu5
	kj/IUQva493GlopoE6Pz/yKmd96CPJYXFWBVzO2HOXtpbzPnUYrOxF+/gaOUPv45llVISdaV/s2
	3LRWopXNgbpPk8E+oAR0gcXh1qI1
X-Google-Smtp-Source: AGHT+IGsGcs9+b0V3iUNaDuT6vqIfILjTB5HiIs14Gmbnk+BUj4GXUftbhZPK55s4SyHtNzqE7Y/0TU4HaYBxD5Ddgg=
X-Received: by 2002:a05:600c:4f4d:b0:477:9ce2:a0d8 with SMTP id
 5b1f17b1804b1-477c00ef4f9mr222627375e9.0.1764156503239; Wed, 26 Nov 2025
 03:28:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125213202.270673-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXKQc3kyT5e_juyMfWz64-oPHig840zAt5qrA+X8chYig@mail.gmail.com>
In-Reply-To: <CAMuHMdXKQc3kyT5e_juyMfWz64-oPHig840zAt5qrA+X8chYig@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Nov 2025 11:27:55 +0000
X-Gm-Features: AWmQ_bl4aspipnH-3EWQKAVi2qBEC4jRR6AuNeqGN4j0z5FbdvMiGA2DRzh7CJs
Message-ID: <CA+V-a8t=T3s3bM6Tkt_E+oWr3O620bmouYNcF_kq=GGX=FT8PA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: renesas,rzv2h-icu:
 Document RZ/V2N SoC support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Nov 26, 2025 at 11:22=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 25 Nov 2025 at 22:32, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Document the Interrupt Control Unit (ICU) on the Renesas RZ/V2N SoC,
> > which is architecturally identical to the ICU used on the RZ/V2H(P)
> > SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rz=
v2h-icu.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rz=
v2h-icu.yaml
> > @@ -20,9 +20,14 @@ description:
> >
> >  properties:
> >    compatible:
> > -    enum:
> > -      - renesas,r9a09g047-icu # RZ/G3E
> > -      - renesas,r9a09g057-icu # RZ/V2H(P)
> > +    oneOf:
> > +      - items:
> > +          - enum:
> > +              - renesas,r9a09g047-icu # RZ/G3E
> > +              - renesas,r9a09g057-icu # RZ/V2H(P)
> > +      - items:
> > +          - const: renesas,r9a09g056-icu # RZ/V2N
> > +          - const: renesas,r9a09g057-icu
>
> Given ICU on RZ/V2H has lots of extra registers compared to RZ/V2N,
> I think it would be better to drop the fallback.
>
Agreed, I had missed that. Currently the driver does not handle these
regs but in future we could so it's better to split out.

Cheers,
Prabhakar

> >
> >    '#interrupt-cells':
> >      description: The first cell is the SPI number of the NMI or the
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

