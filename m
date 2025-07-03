Return-Path: <linux-renesas-soc+bounces-19163-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D03AF8487
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 01:52:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B64B3583DF3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 23:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28D5E2D94A9;
	Thu,  3 Jul 2025 23:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cySnBQPJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E9F2D94B2;
	Thu,  3 Jul 2025 23:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751586772; cv=none; b=E3Xk7ROKLvzkf1SvYsi9NhXZZu1HuaCMoBKR+rYrZc/9mPnCky7N2CheVOBXV5Ewd1gXyaeN4xUWZwCprW+gJcc6YIclk0jNgn90zdSVSajlLbGhdLn7/6BWTlvoeNTfw2ZN+tyeO6OkBBEIpA+zkCLFHEq5W5Z3nqMUsxpZVk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751586772; c=relaxed/simple;
	bh=V1UYmBDJ8crD9bOvRK9l1fhsZ+ceqFNLW5MEzF6Q8zM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nRUMM7JKzdCchTVxzm+VDTkMMRKEKX69crs4zITT109Yf1TGlRVgvIaIDY5aKq5wSYcGiPFXDonNLrEZXYgsOyIrCRfUEqJTMhOg5EMJEYOB/KUbqV7BkNB1PdB1pV/atmGjNpNx2vdBIF98eC6ZKuIU+UFJ78OCNFF+giL9SRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cySnBQPJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ab112dea41so156901f8f.1;
        Thu, 03 Jul 2025 16:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751586769; x=1752191569; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WjgRkH+bTc903ezURKQlj2KKbiOMBZBx75L6S/GZAM=;
        b=cySnBQPJznLcgqWiIUGoSENYVV95Mx8yhBJ8a0N4s3ufUUSQfa+rvlzxIughOIbImP
         hDvjWSpAO61Mxp0xUTXc/j6BuzH9x5MFCgMC3JuOkZw57J7DKeezAIP/zClo1ZAZHrEr
         cZ+XjE1Zwu0KYd2+JuLzgOQ4hdKC0pW2IZcRvwyI/Z8odnhADDv68mZRHh3jToByvy2m
         nd+nGD2wEJsFsEnlmoc/vZr262vJm0W/CUIp/MWyDY6VUx8oUbubOWzDW8WVGsA0x5Hz
         0B3N1Z1DkCG7yRnBklLjULeYZkqL6fB5E3AfF5PfioOnfvtwMV4Jlc3KX3cO1yG27los
         gsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751586769; x=1752191569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9WjgRkH+bTc903ezURKQlj2KKbiOMBZBx75L6S/GZAM=;
        b=P4GGMhyHxbGZsQYK8I/I9t3CPZ61TejJm8idopClDn0wcgWOhFpPYiCmNsb2dDrqxm
         f5VXKGCeUs0vFyy2S9f93fhR+xxW1l85xBhwVsBEAdpK/b18PRI3yy9PgY/vRERGlmFI
         5gJJUW54zEj3avIJ+ttjfkHR6irfAtsjFxSORrHBIlOQo9IVC4nEXJm3D2Z9AZmr4BWD
         0RL0lMZnkgqPRndGk8rMD1RdmQWdwmkxenNPAWtYJmO2DBb5snWP4i5Ihb/0l0b1Dpqj
         FI916hvK2DAdCBYoBgd1FOOCtdnrDdOIF1B8vPyRGaOyDL7xr2sg2Zd0z4WfR3fm82PH
         hQbA==
X-Forwarded-Encrypted: i=1; AJvYcCUETZCyz35z9IiHZTAtaA6VqtC2te2Rnpk2DLkLkKz6NHfjDm8aQDr0bxqWcmWE63uU5cj7TnKXA0h0@vger.kernel.org, AJvYcCUnXMkdRoxjkYM+Oxfi2kW9G++u2F0Z2I7zRAhQZKDt5n8RhgJEi+WUDsXsmyrkBnLEuRkKd5W/EVaFSihN@vger.kernel.org, AJvYcCV6Eu164yAEmCimngkJo4Vsa8SsEQyJsTR9iueWeHO6LWCocZD2lGZuoY1oQjvleV2sU3SzguCz5QPD6XXkEkoLSps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzodBDQMSJ5kzGK22/iiSNgUWf6JtnOwcv/tws7FJ1Kv+/TGmWH
	CovL5rwnHacrVTNjOVXDIH6gJYHJrRsrEbd5iXCKSf0O2TqAlLQciRujBXQYNUqmwqMfPFHTwNT
	0YNobkwI4i9AGnt6vC3dlpxphr2kNfFBg7XlmuKg=
X-Gm-Gg: ASbGnctq4Rj612bhlESajWyiCsha1lOIQPavRY/n0adtYMmynRzxfHakn/HpA7qUmOj
	BSf0EQe5FV08ZRYiWrM1KhiPCRysg8IhwTGs4R76V+1Giux9u14mIQtUzkgfAkKqIjVCw+3wgl1
	yH7LwXw0ZdsdJiH/Pg5maRLUi2vi8V5Lg0NvMS0wWFrEsKKK7p8CR5Vx1+xAcfdArtnFHY/XF7I
	4yN
X-Google-Smtp-Source: AGHT+IEJfFjP+ULBtr3P+k8xraDG3rE8L3c4Q0Ziq9frY5SIvTMddPXRhbEbhVuktLYFQ+eMF3YMd78E+hXH57GthZU=
X-Received: by 2002:a05:6000:4387:b0:3a4:cfbf:51a0 with SMTP id
 ffacd0b85a97d-3b4964f1f76mr243430f8f.21.1751586768439; Thu, 03 Jul 2025
 16:52:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250625153042.159690-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVvxebkm9A4g9hADww=9zREXJqyW3eQ6tFVwVJvkUkEOw@mail.gmail.com>
In-Reply-To: <CAMuHMdVvxebkm9A4g9hADww=9zREXJqyW3eQ6tFVwVJvkUkEOw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 4 Jul 2025 00:52:22 +0100
X-Gm-Features: Ac12FXwbdb5TkfDPftwijg02Dnk6LlfK6idE7Ev6TRai2_YfMwny2dFPPFWhBbU
Message-ID: <CA+V-a8s9r9U91CqUdC5zDxZGuAA51upduJ1epgmMdKPeYPJQxQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: renesas: r9a09g077: Add SDHI nodes
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

On Thu, Jul 3, 2025 at 10:56=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 25 Jun 2025 at 17:31, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add SDHI0-SDHI1 nodes to RZ/T2H ("R9A09G077") SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > @@ -155,6 +155,46 @@ gic: interrupt-controller@83000000 {
> >                         interrupt-controller;
> >                         interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> >                 };
> > +
> > +               sdhi0: mmc@92080000  {
> > +                       compatible =3D "renesas,sdhi-r9a09g077",
> > +                                    "renesas,sdhi-r9a09g057";
> > +                       reg =3D <0x0 0x92080000 0 0x10000>;
> > +                       interrupts =3D <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH=
>,
> > +                                    <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>;
> > +                       clocks =3D <&cpg CPG_MOD 1212>,
>
> 1112?
>
Agreed (and below).

Cheers,
Prabhakar

