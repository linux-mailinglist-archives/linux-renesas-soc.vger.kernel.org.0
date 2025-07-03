Return-Path: <linux-renesas-soc+bounces-19162-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8254AF8482
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 01:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C84A1731E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 23:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9E3D2D94A8;
	Thu,  3 Jul 2025 23:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4Ns7qZy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905D529C351;
	Thu,  3 Jul 2025 23:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751586712; cv=none; b=opR+1w3sCEjH/ZlHFlK1OLfGPyIzjxK396hgJNdJSXdFBeBAq78ndqKo4+ybybxNWVTnE9sK/ql7Ya6fRttdHawWf0XDSaOUo1zgDYv9oyFj6oGXB930w1BNV5qZbCFEpBzLQTVYBdWE1JMDnFXlUBHGdZXO/kcaQnISfPLh8j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751586712; c=relaxed/simple;
	bh=KvHHtrfgF4CSuZYuOUxRpt/NuCwgFqb7dgBuXPKoC3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqZogW9syGix4w9XAgTWgutUDeGPvRyDL5b4LKOVI0MTe1fDFP9DrLg8mdZk5+FC39B5S/yUk/xNp24lJSlkqsD0bxVvlIPKJP2rPe+wx9uiweD6zk2NLSUpF3UVr4QvbwzCqJUFCIxpPtpfwcdARsRTh8Nkwmrmsxr5I0A6oac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4Ns7qZy; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-451d54214adso2322065e9.3;
        Thu, 03 Jul 2025 16:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751586709; x=1752191509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WBXSaAnuO9ltZCL/yHL+tFT04JX17HctJnK7SOXFyM=;
        b=P4Ns7qZyjMBkMzeUcJD7EcUIYZhSk1FujZMV72prLqjedYJQLI1iKMc5dW45ixqjm0
         M6VBewILmMW6pY0mAr7ipaq9IcELs3Wdcc9/XolFH0Iu66chqlaXkI+i0RF+hottYupW
         JXMJQgq2jtgfGRyYX9upF+9jvzjB9lZ4BWcRoy0VSAlYnxkOQMjMjvbCGzqlcIxjVyQ4
         37dJRmaxpPXH/CxdU2rSTuPoGnj327HFuZ9kYHoVOimyboeHl/2u+o63c2vNgK3Q5ksZ
         gf7zcnhvn9D7OkYFD8yMNyt092qHkko/zI2X0udM2fkI8D9zPs5nSzbtsPLBKUTLdufh
         Ei5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751586709; x=1752191509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WBXSaAnuO9ltZCL/yHL+tFT04JX17HctJnK7SOXFyM=;
        b=eQWk9CnTfhTp/zxrmoZ8XbUoBRHCzI2z9cOIgieMDIyKk+tBIG7iFWw6Th29jC36Fn
         j6I3z/hu8jbJkYPozxiWKNuvnJtEH/saSudoBd47hsgHQOoqKWzD5od+y+LUNh1JvF1u
         VjDSeAQ3Qlf03egSxGFFU9VjZgHiQkaQZc+THIbN2QB4mTfkmnX5taoboW29wXTtQSb8
         EWeufb6v+D0gG37K2dmE/Djlk6GE5WgRhrY3mAwhHXCAt9YqQDhRILBcU7P6xqNGBd6P
         k7mwWpWVFwmjxvPBTzjJi0znF5c3uQXpX7FFpdzCWw+FORUaY+kexxevrYfy8JyvDKRv
         hA3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUForolE8ieW0aKIDVQD5AAIzLxEx2DxprPxREk6OLg46uqVXU6ewi8pCOFdLu88o+vapJ2CDjTmHx2@vger.kernel.org, AJvYcCUXyMkEQWbwvk0bhSyEH6TFpaZEL8npIuk6w5E3pTUZHLH1kbJB9E4y/wVasVIzNv+jBnWPxKqE22cmLE+J1O17DVY=@vger.kernel.org, AJvYcCXFko/6C0jFhSwE3nfhiPhWrolZ7YYWPchIQhfBHHsYogLmRLJNo3bwsFI+UN4s6A8HWPqGDaY0Z/SK7liJ@vger.kernel.org
X-Gm-Message-State: AOJu0YysXwjkL5nPj7UrwiJ/XTD67kaJW0IOEM982IOsvQrd5Zr23jXc
	9WVDBIeYYr/iXE2WqsVZtGCpSsfTP/FHH4Ee6sZ78OScxNtZZB1BYReCRx4p6z3OyU1lIJS9bca
	D3neYF/uFahWlM+aSwWfbBXUbImWB8GA=
X-Gm-Gg: ASbGncvvhIvpktNam0C2E/ZEVZRX742Pq6HBT1VyRjnJl4Sv/J2bIWBoN+xd2rDU9rL
	aDXadB9pGEMfBw4mZwXjfSMORrn8x3rvj3Z/px3I/dZ5mfSSwMqM5SK4wEqvIHwFpgxEthphd98
	o+t0S29ygjoNiPm84XEli3bcyrExr/RHw1JNkMN/XXK3lzm9Tjp/U7DPDIcaH7NpcCUAOyyGNKY
	L7w
X-Google-Smtp-Source: AGHT+IFHZBEgtNRhzlyll8kxqSCaE/4L4kUukhLdJtN5vwxJF5M9Rm6ZeQmVlc4JtyQdOO4fjUfiIA81BxTySuTc92w=
X-Received: by 2002:a05:6000:4a1c:b0:3a5:5298:ce28 with SMTP id
 ffacd0b85a97d-3b4964c8e2cmr244940f8f.4.1751586708537; Thu, 03 Jul 2025
 16:51:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250625153042.159690-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVDjdgKDPA3ARPby=Os=WnrXRZQSTc_54oPJpbJ9GV8-g@mail.gmail.com>
In-Reply-To: <CAMuHMdVDjdgKDPA3ARPby=Os=WnrXRZQSTc_54oPJpbJ9GV8-g@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 4 Jul 2025 00:51:22 +0100
X-Gm-Features: Ac12FXwPlO_fb82LNYFScqazbDiJWVp6g5g1RcwBismSbvDSwOD74ocX9p8ULNY
Message-ID: <CA+V-a8uTbEfD+egzRHjw6og=mh-+WzhwLVT6gZPi6OHjAdLEQQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: renesas: r9a09g077: Add I2C controller nodes
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

On Thu, Jul 3, 2025 at 10:45=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 25 Jun 2025 at 17:30, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The Renesas RZ/T2H ("R9A09G077") SoC includes three I2C (RIIC) channels=
.
> > Adds the device tree nodes for all three I2C controllers to RZ/T2H
> > SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > @@ -90,6 +90,51 @@ sci0: serial@80005000 {
> >                         status =3D "disabled";
> >                 };
> >
> > +               i2c0: i2c@80088000 {
> > +                       compatible =3D "renesas,riic-r9a09g077";
> > +                       reg =3D <0 0x80088000 0 0x400>;
> > +                       interrupts =3D <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH=
>,
> > +                                    <GIC_SPI 615 IRQ_TYPE_EDGE_RISING>=
,
> > +                                    <GIC_SPI 616 IRQ_TYPE_EDGE_RISING>=
,
> > +                                    <GIC_SPI 617 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupt-names =3D "eei", "rxi", "txi", "tei";
> > +                       clocks =3D <&cpg CPG_MOD 100>;
> > +                       power-domains =3D <&cpg>;
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       status =3D "disabled";
> > +               };
> > +
> > +               i2c1: i2c@80088004 {
>
> 80088400
>
Agreed.

> Aha, the related warning was demoted to W=3D1:
>
Thanks for the hint, I always ran it with W=3D2.

>     Warning (simple_bus_reg): /soc/i2c@80088004: simple-bus unit
> address format error, expected "80088400"
>

> > +                       compatible =3D "renesas,riic-r9a09g077";
> > +                       reg =3D <0 0x80088400 0 0x400>;
> > +                       interrupts =3D <GIC_SPI 618 IRQ_TYPE_LEVEL_HIGH=
>,
> > +                                    <GIC_SPI 619 IRQ_TYPE_EDGE_RISING>=
,
> > +                                    <GIC_SPI 620 IRQ_TYPE_EDGE_RISING>=
,
> > +                                    <GIC_SPI 621 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupt-names =3D "eei", "rxi", "txi", "tei";
> > +                       clocks =3D <&cpg CPG_MOD 101>;
> > +                       power-domains =3D <&cpg>;
> > +                       #address-cells =3D <1>;
> > +                       #size-cells =3D <0>;
> > +                       status =3D "disabled";
> > +               };
> > +
> > +               i2c2: i2c@81008000 {
> > +                       compatible =3D "renesas,riic-r9a09g077";
> > +                       reg =3D <0 0x81008000 0 0x400>;
> > +                       interrupts =3D <GIC_SPI 622 IRQ_TYPE_LEVEL_HIGH=
>,
> > +                                    <GIC_SPI 623 IRQ_TYPE_EDGE_RISING>=
,
> > +                                    <GIC_SPI 624 IRQ_TYPE_EDGE_RISING>=
,
> > +                                    <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH>;
> > +                       interrupt-names =3D "eei", "rxi", "txi", "tei";
> > +                       clocks =3D <&cpg CPG_MOD 501>;
>
> 601
>
Agreed.

Cheers,
Prabhakar

