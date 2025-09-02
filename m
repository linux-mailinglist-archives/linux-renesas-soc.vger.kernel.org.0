Return-Path: <linux-renesas-soc+bounces-21213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91319B40915
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 17:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2846202A95
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3E5322DA1;
	Tue,  2 Sep 2025 15:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7jQM8xy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCBA2FD1CA;
	Tue,  2 Sep 2025 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756827477; cv=none; b=tUScePcUwCB5idSF+JrecuLwKu6lKl6x3nJ8F51TSEQNwxvuo1xHfV/pLbvm0sRoKFCtLp3lk71ghwwbjd/+gviDfjEvRDFnmy1INjAScVFpBM1HnHD5+dLoljLkkcTrM0o1Fx1YZ7XfojxEN0cG02fHaWuyM759N2zkqHkm5nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756827477; c=relaxed/simple;
	bh=Q0V0+8/9cQhFYhyJ10VGhON8RF6qKxEQag6+/cJWUfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cinsdwP6Iwamz7LYWSjq+6njp/BwjmZ85Ckwqa20RLy0Pb6dJ4qbOSc0J7j4CbNIEvQDvQtLtFLFfqQjyjYDPRmEGHtziIYRcgbCaWzBgR9OWgTYE45uqItmBDhRhilEelxAHawEu1/ugFl4uuLN8Helz7IWHwabv7wTl5JN/Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7jQM8xy; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b040df389easo509580166b.3;
        Tue, 02 Sep 2025 08:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756827474; x=1757432274; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToovZG8SQtuUFFknVRkxm5fUqcSGP9vu7/1Fx5ABo6s=;
        b=Q7jQM8xyQD5Cq4+HfFezvIrf8qGKs2443M5lO2nFF0oCyUdLfSeG7hIWNYZn0FMbBE
         FxlursyWC9t9t9MnN/S/CkqUC3A68DfmJEQJ/7UNfrH78zRXUpDFZGxiGgHZnudGEibu
         f2b4CvCfrXrE+1kVroC7ZZbQt7fG8Wl0EEqn2tKIjUHLuVmIBjtPdVCmC1jbd62t4u1N
         9G78MQDF9DPxzcFlDg/9zgb9jW8hZr5DX0b5+nJWM1nBiRLzQH9X/qeuvbqft4dPrM2l
         PcKy/cOk+41hEcShX2ZfPg3SyAcKctEgbL1b8evm4qTGQQEobz/WnzGcWcIQ0B4IM/B0
         1dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756827474; x=1757432274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToovZG8SQtuUFFknVRkxm5fUqcSGP9vu7/1Fx5ABo6s=;
        b=fUgyUPYbJqOzgAg1p0qBxfoaPTWC3dOOtob5ZThgqTmlrSSUacmg/hhKEsLlV1n1om
         LvSNlzy04OEOp5dBCn1Sy8CI7H2/cLcggv7g8lK8PIhFzpPsaRUtVZmeh17y4PqA82TX
         XVeSZVDW2RouG9RPejZOkOD1gm6g0xPr0XntujdVMPIRUuLU2jj4WBtKzoaxf3nuVkCN
         +qG3Kf2AOr6W9TDrhzanQkWmGPVSemwF+etisZihnscpOYDYWgxka9HYYgAVkpXwv878
         rgwWsXQkFn+3zABQAsrPrBq3NYabKhGSVU4pCN+mStnSpPj+6vKFe6k4GfWDDyLK3flq
         0OTw==
X-Forwarded-Encrypted: i=1; AJvYcCW4k14tk1UwfR//ROAAolzErZqX7FVzzwWEofvsniOa24NzB1bZZDZwQicqNRKAgWKwa7BuGGUWfsTBbGoX@vger.kernel.org, AJvYcCX99qajrD8d0ocsnh3iIJfsG+9x6Vi1FUsRUSt2Pn6aHtxJUwxegHnDc8GMPhdlXLxv/0fIZIzrOMgN@vger.kernel.org, AJvYcCXKCbZDho7GeosTLV19ujAAxT3pbDwUkR8sk4JMxqck9k+lC+iKmQYOUd7sc1MAi4QEH+TwaeGgBdtSTp54b2wSFVY=@vger.kernel.org, AJvYcCXosOOVbyQT1T9MOzjJYEq7F0604yhEgbx9I6jWs6km37Sr5/hF8Ed/3ETAW5OnLVEHYsC7YVNIxpA0@vger.kernel.org
X-Gm-Message-State: AOJu0YxP3DiwI4rJG0Aj7qBATdXUNA+gecZBkpw3/ZNXkAd9IU2q+8cL
	vr8QzQbqtXTFf3vKixGtGo3CMnBw/83agC3HTfw0vO40CNMh6VGKqs3TCzytB0I0SXP7xt8Kbd9
	n7knfHN7rHNkautE51kAOJ8iiSLVDSxU=
X-Gm-Gg: ASbGncvoxip/W+KlxzHOtVCQkKIG09yIAV3A42mxScmhFzNizWercxjCMNGWewSv0BZ
	vuBLpu/MV2/hLnMSVkSt/yQHVGkvVTusiMtlKlSBWdwS2U35Lq2nAX2ihPkiFe1rBR2UQSeILFr
	vorz7qXrOHxIWVWXMyvtkETb/d9dSFikz6PViAnntXWqvHhHI1Evjroakzl7I0RjszEhJo8GIiT
	yokD4jBBbKzkRdDG7fm+r3FP0nf2/gWLnvLSLsf
X-Google-Smtp-Source: AGHT+IFAIdNO+1gO9Ilx8n6K907nn54bmjXBWyPpLuVOa8774PJjRCJs7SoLDLYXImHEg2v2acrnfsYECCp+2+KrFLA=
X-Received: by 2002:a17:907:86a3:b0:afe:d3b2:8b2c with SMTP id
 a640c23a62f3a-b01d979e9b2mr1145170166b.52.1756827473256; Tue, 02 Sep 2025
 08:37:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901183000.1357758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250901183000.1357758-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV+-WK3KQNfwrN30LFCGaWgRuRH4QOpMMC_6cko1bz3uQ@mail.gmail.com>
In-Reply-To: <CAMuHMdV+-WK3KQNfwrN30LFCGaWgRuRH4QOpMMC_6cko1bz3uQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Sep 2025 16:37:26 +0100
X-Gm-Features: Ac12FXwcT0gz1a6x2-m6fCf1bNV0IkrlzXdNyK7bJFVkGSwJN082tnh18fq-a8A
Message-ID: <CA+V-a8v9SBF7zkCq4zgZJV=B-=t6Dea7dG=whA0YjwOrPrO5Hg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: renesas,r9a09g077/87: Add
 Ethernet and GMAC clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Sep 2, 2025 at 2:02=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 1 Sept 2025 at 20:30, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clock definitions for Ethernet (ETCLK A-E) and GMAC (GMAC0-2)
> > peripherals to both R9A09G077 and R9A09G087 SoCs. These definitions
> > are required for describing Ethernet and GMAC devices in device trees.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Thanks for your patch!
>
> > --- a/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> > +++ b/include/dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h
> > @@ -26,5 +26,14 @@
> >  #define R9A09G077_CLK_PCLKL            14
> >  #define R9A09G077_SDHI_CLKHS           15
> >  #define R9A09G077_USB_CLK              16
> > +#define R9A09G077_ETCLKA               17
> > +#define R9A09G077_ETCLKB               18
> > +#define R9A09G077_ETCLKC               19
> > +#define R9A09G077_ETCLKD               20
> > +#define R9A09G077_ETCLKE               21
>
> These five LGTM.
>
> > +#define R9A09G077_GMAC0_PCLKH          22
> > +#define R9A09G077_GMAC1_PCLKAH         23
> > +#define R9A09G077_GMAC2_PCLKAH         24
>
> I doubt you really need these, cfr. my comments on [PATCH v2 2/2].
>
As agreed on patch 2/2, I will drop these macros in v3.

Cheers,
Prabhakar

