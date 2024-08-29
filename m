Return-Path: <linux-renesas-soc+bounces-8519-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C550D964F34
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 21:41:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 815331F23882
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2024 19:41:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 431CC1B86F8;
	Thu, 29 Aug 2024 19:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMkNroon"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D2439FC1;
	Thu, 29 Aug 2024 19:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960487; cv=none; b=g4FEx0gNqewB+Qi1HA0lLa0xhJo7LYWaUZvjHv3C1QpeXzc3bOzFbDU2OuDtPYlF/jLzwK6gzaA+tn2Z7eVasIgfy2mK0zPVu9xYXF6MrufGgGqbo1+SwvCAiS7AHl4xT2gDeqx8sUiVLtamTgQYC6y/K7zGwge+/4yLOJizjkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960487; c=relaxed/simple;
	bh=aEgdcyCL7ZcPw8eEcl45Mvtrfxya4knG7lRS3KlWJ0g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=evwAsABYlYYNWXy9tuFtRUMO7flmIP8VaBDeVBm6dbYMXGhU+d6nNSv516PSmtAtDyZePjpb3ZnE1DC6j0gkKuZAEgSzU6tLsr9Y/SbFPbCKLoABibnPV0kw2pI2qiJQywjTF6CZKSPi6gQ1DHaw+Yf7ZIBZlKVDfD6kK8r7imY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMkNroon; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4feabcf2b10so1346872e0c.0;
        Thu, 29 Aug 2024 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724960484; x=1725565284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TthVPs+vTemiyjynyVdKWsAuxC8mmtX2DEQSDYY8MEo=;
        b=lMkNroonQdNk9WxMx2O1aPwPxHKJglOs77G1K+uq03th9ccCqm7HTw0Nio4b3ewCkF
         9lMHp6DuhhGx224PMp6eEhzTK69O3HrI15eboGGriuI0mfAUZJKx1275BV7qn6Jfs6p1
         JMG1L1BPa6lgunEPKaqebl3rwh+NeFicGST6Xd7CnWu3dwTVP2ldaRB3pomthCs4HgTM
         D9ApzQg1WAz+InbLtLAgBmOFbKZd5YhdU4sKmB8TGj6XyY23K/JYk9yGRgV3tWs4nC7h
         IJ4Zt3fQWxAa0GaoKmHFZ3Ls8G2wA7I6WVWglxLhogk6+Us1xbIk/dnbpnEkOrsLAwCj
         UIKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724960484; x=1725565284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TthVPs+vTemiyjynyVdKWsAuxC8mmtX2DEQSDYY8MEo=;
        b=r6JnUwOQGKkTeQ9fzscxO/aDvapox0LCo6CJ5X8OvQNlr0Wm/6brbk39R4a72YIzBo
         2nU/VF6qRShCgpWVBzdRwUGN8zv1ScmM6Wl42Qc7vdDCrUvip6A+el4wTLsHrvoPewMV
         A5Yw1k6EyR4SbfWBhLfUKgR5P4Z9eT9CoHMCpNHvAVhitAGcsjcioOSkNi2DYJWiJxrT
         Bi9ZyuLBrUvaQILFcRdsShK90VsaH2Q0DYwvJBrT5QXoTUJOHkl4y/cMWx+hhERf4umO
         bkDihE6FfCQXWE6KI/3AhTGCfwZPDmGKxuBzcZ3wBVA8dwQSP4rcFq607Pjmu3SLi2RZ
         vaLw==
X-Forwarded-Encrypted: i=1; AJvYcCWEvDV7troJCQCGrRj+/eP+KCqb5v+dVVG30+3e1M9BIVyU+HevtEEMfWtx/SBa9IPEgzfB8FkyU5oEjcAF@vger.kernel.org, AJvYcCWrWX0sRoDkLBPIsDYKtj61WPW/oU7ggQJztUH2M5puKjWFpFP+FAxr/W2DPup9Mi/N3gxtb2OiGsTx@vger.kernel.org, AJvYcCX1TcpB0V4vbu9zVgcfGs0CO39EFOef9QOHU6OM0b45uaPrAOJ26wdxbLX8HsYlafzvbWF62iX9YnjtQOgi2MBUahw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKVZ6UmC9xqUM3dswaMtiyD06xaIPjYWjyp5NWiiIDBgxdLObJ
	qXXmApiDqtL3lN8vOt8blGSePHHHCuP0B0NEqCcyK5dc6NX4KU/DPCMmzvkj0E0U/j/rbQu2BlP
	igct8DoKby+nuzJSEJkbeKNbYj1PdmmSu
X-Google-Smtp-Source: AGHT+IHngsa7s8jtoOqpAnPkgTHvdxTx7qaqSPQhYsA7wsw5GbJTvrI8BuKmQHIfr+U0WZeHkuDYb6I6QPq2OafK2yE=
X-Received: by 2002:a05:6122:2a04:b0:4ef:58c8:4777 with SMTP id
 71dfb90a1353d-5003aec2ff5mr3540260e0c.4.1724960484429; Thu, 29 Aug 2024
 12:41:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240828124134.188864-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUNGBYCsxK60eTF7wSWS2LtAwOPO2-PvD_OMHx8dC8r9Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUNGBYCsxK60eTF7wSWS2LtAwOPO2-PvD_OMHx8dC8r9Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 29 Aug 2024 20:40:54 +0100
Message-ID: <CA+V-a8t0G0wER9vuVppwTqtBnM0+m5scQ65_HFpPC8C1aivfOA@mail.gmail.com>
Subject: Re: [PATCH v4 5/9] arm64: dts: renesas: r9a09g057: Add RIIC0-RIIC8 nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Aug 29, 2024 at 11:24=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Wed, Aug 28, 2024 at 2:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add RIIC0-RIIC8 nodes to RZ/V2H(P) ("R9A09G057") SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4
> > - Used hexadecimal values for clocks and resets
> > - Sorted nodes based on nodes index
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.12.
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -201,6 +201,195 @@ ostm7: timer@12c03000 {
> >                         status =3D "disabled";
> >                 };
> >
> > +               i2c0: i2c@14400400 {
>
> [...]
>
> I'll move all of this below the scif node while applying.
>
Thanks, I missed it.

Cheers,
Prabhakar

