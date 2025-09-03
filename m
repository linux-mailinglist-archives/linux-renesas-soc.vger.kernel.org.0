Return-Path: <linux-renesas-soc+bounces-21250-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AE7B41AD7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 11:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1D5D170541
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 09:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D61BF2E7620;
	Wed,  3 Sep 2025 09:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4YdJ3cQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AC5271450;
	Wed,  3 Sep 2025 09:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756893349; cv=none; b=k8FhxrPOjQAO0q8p9KZLZs5JrYpPPN5IhrAFD1RCvVZf3WXJmorWhckdxaobL1UKM3PRMq5AIuxnRj/3CgldoK53yco8e4HfWD8SOCiIK02yd67G1KrPohawOwqHM7jx9TnQvJVVMaMDVnCV6z7vHob3vBV5LHIO+spAhJVSt4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756893349; c=relaxed/simple;
	bh=cuwEHE8scLbkAHSJTScWsVHg3Xyk8wTB3QH9kGIFXo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CqISwsEfWLoOFCczshzSuWbgTDQTJixLnsjZX20PPtwFUj+CjdEIGA4FZ8XIuKBb8h5n/HyN2vujmZqorAfLy2OliIKeO1h8sdDcLfs/uvIMqWpm3HYrl9Q7y+r8t+KJBmbfq5cIluvwXUVoEqx/Bjb3Sj9WvaHlOA6Zz9qHonw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4YdJ3cQ; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3cf991e8bb8so3131011f8f.2;
        Wed, 03 Sep 2025 02:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756893346; x=1757498146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQcHCfTkoX8DW9g+q+vnDFgdDm7eFni4pk58hwmWzSk=;
        b=R4YdJ3cQ8iEgRalIwJ2GZwGpsuT/LEt7jdzuavp15Cy4lfZaQXjQYsboeZy7db19en
         gIs/0+SHwXWQeE6yAl+goFkiAE2T2tCLz5ckHzGXcp0tzCHpJ4V7ksmy7eEzijQvHPHC
         AG7qWXq2Nwc4OqaKyHjCcF/20DBujReNkzrcSlsHzTS6B/+tr31V25cdtOdgNHfVmrgW
         1wTaEfz8POaV7ScUYlvh6UAi2E8SxoOZHi6SVm7Vr968Wqex1T+MWrbDUaouwLcad/dM
         J0UGv0DtDbucfPs7GFLJCZ0biXqm3qYgb3RP/KW3mmJyxyBpXWJxrLF4l7cQrb+xMabQ
         0+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756893346; x=1757498146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NQcHCfTkoX8DW9g+q+vnDFgdDm7eFni4pk58hwmWzSk=;
        b=f4Of3T/chj833ZPMgS3saf7M2vtohXjKP5kL+z68B1R/Tg0X8p3Yme/y9Q2wJtjMEQ
         ebuEVXIHN0gafZzJxG5vBB6Lp5PtBXgd0RdCplPH6csuLvp2AmzV360tvGsLG+N5kT0h
         98jcRVZHEQ6TNfvkD1QEyVIHVTVjAS0AxJd/rk+XIByh9uqgmeSE4espHYo2rdP1fhmT
         qVYq0sipE/gh5kBLr+XU8vw0LLgNy3q6wzyTlNH1+HcWPLGlZ+T5OKT5V6EZgjo06F4J
         3ClrQ2zHpyzhpSbUIvFYzkMoymcbHqecNiwMuLBzZ0SCcN0jBTKLpealPjMVL3uCKC/Z
         t9cA==
X-Forwarded-Encrypted: i=1; AJvYcCVAHA4knoMI8uavsaPy+cBkK15ociY0RsGHlBW4eeHyAqkFSDdrh7T738yHKCilheAop3NzOWGM/u6o@vger.kernel.org, AJvYcCW/MB6en8SCVxJtJkpfcUqNc6kw3IBNflqCiLqsCZx8MFuad27px7FX6tVetd53gpkloYdr1qVCWACzFiTupF2wJFU=@vger.kernel.org, AJvYcCW3x012v6tUS4AfSbS7n04mIQ/eDKcFJcVRkmYmuXrhWiH/r0wkZkmdnny8bUK5jurgShAaF+o0@vger.kernel.org, AJvYcCXfpeQdafzbKxzEgIxx3Vjj8rTe5bgsB9+fPDLTjR/GrsuVIJAbWx1qtnrhlV6lJAlsOaqJYvH8QK8cBosX@vger.kernel.org
X-Gm-Message-State: AOJu0YzdujDGeb6sMl7Eq326shwdbF2JcJJJOxLuSu3jMvysG0Low72w
	5etOmtGBJ6J3fLobmJTfNEHKJUUHLgUpXVkmZFfxcHnzB5kX7udWCFqidgB/nQI8DyFJ0f+mi+B
	K8lJ1x+Y1up2VZOIWSRT+JAXicQfArpU=
X-Gm-Gg: ASbGncsef9lr+CE/wHGZRPeSOnbojWEKcVs44f5rXBDxITG1/sihI101s8nwYeD6Eun
	SXVm7uAFoJsmSdNn/Owr3UHL8VUurh3YA8Dc4VoFx0cwBgjzSq4PoGkaxZugQYFp32DAaU/90fY
	AA7ekCCoyxjQLNMB9xLn84j6h0tT8+aVlLKtF4myK3Z680isrJGE9ZNBrCMVaqTAkpEyWi2KDKX
	jrLxYe5/ljcchFAZcY=
X-Google-Smtp-Source: AGHT+IGCwZhtyy180IUX4wVf0GQL8osoDoQthg9giifR2PA8VEvsMZ7ONsjxG9Id3PLywoN/vhMj4dtvx6zjX4oiljo=
X-Received: by 2002:a05:6000:26c2:b0:3cd:2fe9:efa3 with SMTP id
 ffacd0b85a97d-3d1dc5a28eamr9775370f8f.5.1756893345931; Wed, 03 Sep 2025
 02:55:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901224327.3429099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250901224327.3429099-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250902-enlightened-hidden-copperhead-4eefdf@kuoka> <CA+V-a8sSiNQ6W-ggmL8PP_G1sFq170DS1LJLFJs_WW0RC+XVEw@mail.gmail.com>
 <CAMuHMdVT+VknkQzFDTpXdiDh0JMwgUPXK7muKv99H2k7pzzodw@mail.gmail.com>
In-Reply-To: <CAMuHMdVT+VknkQzFDTpXdiDh0JMwgUPXK7muKv99H2k7pzzodw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 3 Sep 2025 10:55:19 +0100
X-Gm-Features: Ac12FXxib3LE_thJdEpo4IuHLom6nbssJ6zefKky-qUN2oXf5_wvK5du5lizrRo
Message-ID: <CA+V-a8s6H7t78MB-VYziP3FY903Gh27a0FrtuG0EM9pFgpT9-g@mail.gmail.com>
Subject: Re: [PATCH net-next 01/10] dt-bindings: net: pcs: renesas,rzn1-miic:
 Document RZ/T2H and RZ/N2H SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Wed, Sep 3, 2025 at 10:12=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> Thanks for your patch!
>
> On Tue, 2 Sept 2025 at 14:17, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Tue, Sep 2, 2025 at 9:45=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> > > On Mon, Sep 01, 2025 at 11:43:14PM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Extend the RZN1 MIIC device-tree binding schema to cover the RZ/T2H
> > > > and RZ/N2H SoCs. These SoCs have a MIIC converter similar to RZ/N1,=
 but
> > > > with some differences:
> > > >
> > > > - RZ/T2H has two reset lines; RZ/N1 has none.
> > > > - RZ/N1 supports 5 MIIC ports, whereas RZ/T2H supports 4 ports.
> > > > - On RZ/N1, MIIC ports can be mapped to various endpoints such as R=
TOS
> > > >   MAC ports, switch ports, EtherCAT ports, SERCOS ports, HSR ports,=
 or
> > > >   fixed PHY ports (covering PHY input indices 0-13). On RZ/T2H, por=
ts
> > > >   can connect to EtherCAT slave ports, Ethernet switch ports, or GM=
AC
> > > >   ports (mapped to PHY input indices 0-8).
> > > > - There are register bit differences between the SoCs, and RZ/N1 ha=
s
> > > >   additional registers currently unused by the driver.
> > > > - On RZ/T2H, the switch is connected to GMAC0 whereas on RZ/N1 the
> > > >   switch can be connected to GMAC2/HW-RTOS GMAC.
> > > >
> > > > To accommodate these differences, a new generic compatible string
> > > > `renesas,rzt2h-miic` is introduced for both RZ/T2H and RZ/N2H varia=
nts.
>
> Until now, we didn't have any family-specific "renesas,rzt2h-*"
> compatible values.  Instead, we always used " renesas,r9a09g077-<foo>"
> as a fallback for "renesas,r9a09g087-<foo>".
> Is there any good reason to start deviating from this?
>
Right good point, I'll continue using the previous approach and use
T2H compatible as a fallback for N2H.

> > > >
> > > > The DT schema is updated to validate these differences and ensure p=
roper
> > > > port and reset configurations per SoC.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
>
> > > > --- a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.y=
aml
> > > > +++ b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.y=
aml
> > > > @@ -4,13 +4,14 @@
> > > >  $id: http://devicetree.org/schemas/net/pcs/renesas,rzn1-miic.yaml#
> > > >  $schema: http://devicetree.org/meta-schemas/core.yaml#
> > > >
> > > > -title: Renesas RZ/N1 MII converter
> > > > +title: Renesas RZ/{N1, N2H, T2H} MII converter
> > >
> > > Don't use regex here. RZ/N1, RZ/N2H and TZ/T2H....
> > >
> > Ok, I will use it as above (s/TZ/T2H/RZ/T2H).
>
> s@TZ/T2H@RZ/T2H@ ;-)
>
:-)

Cheers,
Prabhakar

