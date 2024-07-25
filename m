Return-Path: <linux-renesas-soc+bounces-7530-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A04B93C631
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 17:11:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F2F7B21ADD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 15:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D19D19D07C;
	Thu, 25 Jul 2024 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGshEXD2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9070319D89E;
	Thu, 25 Jul 2024 15:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721920285; cv=none; b=eFcE5R/ZqcnWHWLRjjORh0Y7ApspeUZCsUZjdQtlOh5nawPBpdAc993ht6mkjmLgh2ZOsrNafOmVXAfEl8MGg3iSxA9DgCauqTpNf1BBOALl4DTlmo0JAd6sdaumFm/MyaYifD2eao3Jf0dI6lqok1B1QuFI5tB5qRRaXB2U/DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721920285; c=relaxed/simple;
	bh=4xFnelDtECeH12No2ZkIyBhksNciFIDqEg03JTXCIaI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DqQ8qWotWJNsBxuJb5L0TmOScmOKeOYwwG9aC//OIkNPVWSLBBoAcWY8KYp2v9qK0/E59bAF57pE3L7JZ5hV6fqnxRFF81bxUEExDcUqcIeOLu1NYMDo0+4f+9/0oUbzXI8uCJIQiV6AodZAZcljyOBvJ9bOsw60qJ4ql2lkmIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGshEXD2; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5d4fb707895so640725eaf.0;
        Thu, 25 Jul 2024 08:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721920283; x=1722525083; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6gG3oCe4oYk3F0rr8MDa2StMvMgMwiYddG9zhTTTwCY=;
        b=kGshEXD2uWuW8sVzOLLo9PyVhG3rHHomuYYIpQuZxMgZi6dQhf9M5h6bmKi2AVPdhi
         obUESdH2cve2Wre5JGs3KYciwaBlsIySVE/zfVumYjKxSPTlX3UraYR8f4quEUZBMaBM
         NGn1jUghtVYt6Uh7++g3El1jG57H8n1jvz2BoDPiCAZ1j/maKLcQKYF5uIurrQbtegk7
         kBrk1BpaDHY5Xmkv8TxVu4LBEKUX5nKyT9RODTyNHWi/dbEZK2czDZw5ToiM2jhB35kk
         DyEU41uErfPB3zbObgnZ4f9mThPAOxYwyY683pKTMAXRlX3uhDWvB1TkoCh3khdnjH2W
         Zu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721920283; x=1722525083;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6gG3oCe4oYk3F0rr8MDa2StMvMgMwiYddG9zhTTTwCY=;
        b=rQOsoGWS4969EEFWdUT6vsRtrCS46+FdU3LE1Lp1yufAZpx5SWizPK0GvO5A5ZzGYk
         dUVcsbm50Bd1tpgsjFIXnq2+kyC52XLErlepfPzFpWx9qqIKBaoUVA2FyA3zyWD3NRUE
         ga2x4sG5XGYoXXYsGTLOaSRMUQotDRKsK3lzQiaClPR2ZBWKaY9yshY0QTJbT03xihuE
         P5qYQp4SujI4RZYGbj2Q6/X3XBvYdvJerXojGorkf24K05/CJVrnvzWRYYfXgSCYn607
         yez3+Uj6P0TcQrs6SXaFEFX+EQwzJGVUARy3xs3X8a4cD9jWdEWyfrMqAHRsZ3E6j6P/
         Qk0w==
X-Forwarded-Encrypted: i=1; AJvYcCXHJCIf9a2KYTvoKBleebKQSnUU8eU3qT/dy6kgSskibc3wikwbfOmkYEpkI4u1f2PtCAibFuzlqIqMCFUHbCdHbGFzWM2R/OpwYAVp9DSN1Eyq5nbz4lPNfnjK1XNyNo/kws2zZ1yTDIypBq5Azq7+KlTY85Zj3MCb+fyHYWGU0+/YTac5EnnndQKK
X-Gm-Message-State: AOJu0YxHb7Ptsv2Euan2qL9CVzkphsOUnl3LGMefKA+YF0pogEsX0Q05
	hLS6muaRd18moWxrU9rCLhFXMj1iJMzSagbcvSW3CDFitej9RkOuC3xqXOGNGwiYkeYrs2/7MvR
	UyaZAHOLo3MWmo6/lLvxSCApdYc8=
X-Google-Smtp-Source: AGHT+IGdvGm0ET9gz+yF8PYd3jHpdvWj7fDjAmm2jQoKgtNtCs99S21tDrFv1q7+jVKOpMYn380z+Cn3zdWyJwdoHFw=
X-Received: by 2002:a05:6359:459c:b0:1aa:c98b:aa0e with SMTP id
 e5c5f4694b2df-1acf89114c5mr444689855d.26.1721920282504; Thu, 25 Jul 2024
 08:11:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240725133932.739936-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUpZ6KWdjveVSS72jdSuySCB7KVgo=TSr7tt=G295bPXw@mail.gmail.com>
 <CA+V-a8vmiaYQnf4mCJD-Zx8BqSiDUS5NpaskYkOkuCpE7qH+3g@mail.gmail.com> <CAMuHMdVtdh-ykbm4EOoXU_ZTjOp9Jz9E00OusjtB1A-msTySjg@mail.gmail.com>
In-Reply-To: <CAMuHMdVtdh-ykbm4EOoXU_ZTjOp9Jz9E00OusjtB1A-msTySjg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 25 Jul 2024 16:10:56 +0100
Message-ID: <CA+V-a8uYKTpXjsW=p+jHpCtnsNjaAEA8xHNr=KeH=4g5jXmr5A@mail.gmail.com>
Subject: Re: [PATCH 4/5] arm64: dts: renesas: r9a07g044(l1): Correct GICD and
 GICR sizes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marc Zyngier <maz@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Jul 25, 2024 at 4:07=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Jul 25, 2024 at 4:59=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Thu, Jul 25, 2024 at 3:53=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, Jul 25, 2024 at 3:41=E2=80=AFPM Prabhakar <prabhakar.csengg@g=
mail.com> wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > The RZ/G2L SoC is equipped with the GIC-600. The GICD + GICDA is 12=
8kB,
> > > > and the GICR is 128kB per CPU.
> > > >
> > > > Fixes: 68a45525297b2 ("arm64: dts: renesas: Add initial DTSI for RZ=
/G2{L,LC} SoC's")
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> > > > @@ -1043,8 +1043,8 @@ gic: interrupt-controller@11900000 {
> > > >                         #interrupt-cells =3D <3>;
> > > >                         #address-cells =3D <0>;
> > > >                         interrupt-controller;
> > > > -                       reg =3D <0x0 0x11900000 0 0x40000>,
> > > > -                             <0x0 0x11940000 0 0x60000>;
> > > > +                       reg =3D <0x0 0x11900000 0 0x20000>,
> > > > +                             <0x0 0x11940000 0 0x40000>;
> > > >                         interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LO=
W>;
> > > >                 };
> > > >
> > > > diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi b/arch/ar=
m64/boot/dts/renesas/r9a07g044l1.dtsi
> > > > index 9cf27ca9f1d2..6f4d4dc13f50 100644
> > > > --- a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> > > > @@ -16,3 +16,8 @@ cpus {
> > > >                 /delete-node/ cpu@100;
> > > >         };
> > > >  };
> > > > +
> > > > +&gic {
> > > > +       reg =3D <0x0 0x11900000 0 0x20000>,
> > > > +             <0x0 0x11940000 0 0x20000>;
> > > > +};
> > >
> > > What's the point of overriding this here?
> > >
> > Are you suggesting we drop this, as we have no users for it currently?
>
> I didn't mean to drop it because we have no users of r9a07g044l1.dtsi.
> I am just wondering what would be the side-effect of not overriding it?
Not sure what side-effects we would see, maybe the IRQ maintainers can
comment on it.

> After all, all r9a07g044 SoC variants have the same GIC hardware block?
>
I would assume so, I dont have a r9a07g044l1 SoC to verify it. Maybe I
will drop this until it's verified.

Cheers,
Prabhakar

