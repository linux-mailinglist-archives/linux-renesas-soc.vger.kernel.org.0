Return-Path: <linux-renesas-soc+bounces-7527-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C06D93C5D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 16:59:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD6801C20BC6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 14:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF27019D06C;
	Thu, 25 Jul 2024 14:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/rdBEq1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B551DFF7;
	Thu, 25 Jul 2024 14:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721919592; cv=none; b=N64bSPbmXN8a9DxRvkF4Sniwk2m6LydHFmAVegycqO+JhwTxyGg/ULEABVm/s+xD+BbSCTtd8DUHMuhoJCXLrTzHJfHsrfXrtxdEAN5xYnRk/D1rUpxla4Pz4ijFxj0GGUz/Yi/2HVjtuxElDXrQ9kq11+e23ztfuFaQBk3jLQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721919592; c=relaxed/simple;
	bh=wA9cO2ijwhFDMlP/FDS2evKDtr/6tZx5A1S4+PKKYaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VRvrTrbuAMqVVdzEKtGnIiwa1uliiX64LrSsuKSeepFa8pjYw3ozd0L1ZcsVFD81z3wsO6oIJnSZ2gx72y/wsKUvy9CaNdWALtjs7gkJ2K49fi9JGyx3nexIHJInAD37tNgxaYz789H7ehOmkpyZWWLZXYOnS6JYqzObhBN0j+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/rdBEq1; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-4ef12e5658bso321661e0c.2;
        Thu, 25 Jul 2024 07:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721919590; x=1722524390; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPO4gtNKzKuekmNpwtacwmBBH3AcT7WjOijrZlXLQb0=;
        b=T/rdBEq1tlI9ZNM6tUiStwiiB/xEzTKllKjsD/76AJHWw9BvaL7bEAM16pJ79Qsdkk
         F/ZOM2n2eJVBqpdj1rpypeRMzaM3fRI44FZjsMxnGD7BEk67Xgla+mmMzDaWdxZdw0I4
         4+2Vdm8U5z1OR36vQCetgl8Vpq1lcuBLXnklRJkVjaIWXAMpHzraVCS5ZyzY6C9732Is
         QRdzT64fZR8QY/C5mhZMlVj2HFN62UHLGVcFpbRMRZjk6EuwS87ejRA+Cx9BabXXsUxN
         RdFXxVFe5RZDeERlQtBeiGivR1TzduUW+GTHjyS979KgI/5stf+Ft7m1JpJk9ug7/OVp
         FbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721919590; x=1722524390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rPO4gtNKzKuekmNpwtacwmBBH3AcT7WjOijrZlXLQb0=;
        b=WOD4gEIhZcxs1U5sqZgh8U62maaBmzqb9cB/kLkzgCpAyz04lQyZepKdezLFRJmRps
         AmKr+nWFXihQAEDCiVvTlZbKBypOwnAzwDNfPAPapexzib4+QmdrwYivzucbUO9AilaS
         FGzWFDiTacFkrg6VGXbw7pVaf6lmZxl9mGvUyPrOm0k1J6ssZgC4J/dfyIwdZUjF1E10
         0DIAXhXdpfflRcZkuKkRW/Aubs8yvtqiGehp50SaOYBRc9ZfybOzZA6PzPOZQHjQNuXj
         ycNddDRAoVLoVSTutPUOWqGz0gLkxEjetiqjGbcg0oaTtMtUKpf4kLLSitzHDldNlhy1
         B1LA==
X-Forwarded-Encrypted: i=1; AJvYcCXkTvFeCrAC5Voh87K/ouJUpNJ3zUCQpqILVml+OwOdyzE2n1Q81oSt0yXr+STh3uIaFhk600C1z5sG9LMmJ5pwah6nm3pwiudoefd4sOV5f9X0a+7EwILR4R5WrI+I31axNjPc1Yf6zNhoWYI+OzZ5Xul42Y2+ztxGRGXGZwYIDMoG84m9QVoEh7y/
X-Gm-Message-State: AOJu0YxZCBDeZcqJyPUhU+k/h8Nj5M+jrUIYDw3TtrRcC90Pgou/ZPXd
	BfrLGd6YRC3q+kYWFAG1dS1UXr2CIz30rbgGYskENdXx/xefcE5/K2N+/O45C6i4W3VUib/qL52
	nBdTrh/c+zr5rmwRvZ386brjTGiU=
X-Google-Smtp-Source: AGHT+IFaJSg0W9tovfwxfphFR6bmF5/CEKViDBBbhsWzrPf/EWQQcLVe1hmsptrLU5ywuBQ+Z/HChdCQ6RmSyWxfkAo=
X-Received: by 2002:a05:6122:2094:b0:4f5:d98:5ef2 with SMTP id
 71dfb90a1353d-4f6ca2c36f7mr2388197e0c.4.1721919590234; Thu, 25 Jul 2024
 07:59:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240725133932.739936-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUpZ6KWdjveVSS72jdSuySCB7KVgo=TSr7tt=G295bPXw@mail.gmail.com>
In-Reply-To: <CAMuHMdUpZ6KWdjveVSS72jdSuySCB7KVgo=TSr7tt=G295bPXw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 25 Jul 2024 15:57:57 +0100
Message-ID: <CA+V-a8vmiaYQnf4mCJD-Zx8BqSiDUS5NpaskYkOkuCpE7qH+3g@mail.gmail.com>
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

On Thu, Jul 25, 2024 at 3:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, Jul 25, 2024 at 3:41=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail=
.com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/G2L SoC is equipped with the GIC-600. The GICD + GICDA is 128kB,
> > and the GICR is 128kB per CPU.
> >
> > Fixes: 68a45525297b2 ("arm64: dts: renesas: Add initial DTSI for RZ/G2{=
L,LC} SoC's")
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
> > @@ -1043,8 +1043,8 @@ gic: interrupt-controller@11900000 {
> >                         #interrupt-cells =3D <3>;
> >                         #address-cells =3D <0>;
> >                         interrupt-controller;
> > -                       reg =3D <0x0 0x11900000 0 0x40000>,
> > -                             <0x0 0x11940000 0 0x60000>;
> > +                       reg =3D <0x0 0x11900000 0 0x20000>,
> > +                             <0x0 0x11940000 0 0x40000>;
> >                         interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> >                 };
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi b/arch/arm64/=
boot/dts/renesas/r9a07g044l1.dtsi
> > index 9cf27ca9f1d2..6f4d4dc13f50 100644
> > --- a/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi
> > @@ -16,3 +16,8 @@ cpus {
> >                 /delete-node/ cpu@100;
> >         };
> >  };
> > +
> > +&gic {
> > +       reg =3D <0x0 0x11900000 0 0x20000>,
> > +             <0x0 0x11940000 0 0x20000>;
> > +};
>
> What's the point of overriding this here?
>
Are you suggesting we drop this, as we have no users for it currently?

Cheers,
Prabhakar

