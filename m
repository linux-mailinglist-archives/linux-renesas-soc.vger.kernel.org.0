Return-Path: <linux-renesas-soc+bounces-18187-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA94AD71E8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 15:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33D403B7B96
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jun 2025 13:25:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA49248F6F;
	Thu, 12 Jun 2025 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MYnMjsV0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA31C242D63;
	Thu, 12 Jun 2025 13:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749734707; cv=none; b=jJpnLuseY3YSi7e1X0VjCgk680Udt5nAODZthsp5LYgDD3D5gRbSNilcmoPpfuo0K55K+NdWY5Ew6++CBYDwMxuQnBIIkyzUCN+vy3jCQ7R5B0WUPoLwqjOac6EblNdHWJZ0KmZVe2oRrOi+s3xtUCiKYJEZROByUKz68ZwjCZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749734707; c=relaxed/simple;
	bh=IqqMPWUk2v+uBcqO5EM/Ty1qGKfeCbv7fRGmGpsEBz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bdkG1RN6I1G1DfAkIj/jG0FnKZoob1GY88Cp+D1GA17p6faMz5aroEzByfVSbjGFUYoLlbp9lAtHrC9tUJWusGS8HpW1r21v6jM+AlFf0qhBS2RfQdl7oMfRshD4Trd8GK26+A6L8AqLe7IioIVju5FRnlN+JYqsQZkFu8tXwNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MYnMjsV0; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45310223677so7979515e9.0;
        Thu, 12 Jun 2025 06:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734704; x=1750339504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BZMLBIoT9gJSSjfo3bjWT2EO/rqNo4VRFJWQeolqXMA=;
        b=MYnMjsV0qKnRjk9/VCnD8eDK0E/q2b0JSo46N1zOBLELR1dt0fzgULEv+H8w6D1ZSl
         fq4+IeofIasVEXLdXSsrSja3PCwes8qN/Qt7PSpp8OFS14lvVF8yifQ0pl5NFCa9Ld8g
         HBFXkQBsdppT5NKgvr/hZnjKLl5voIBMH6wCSbz0cpKoFAl8ZTnJ5LbGDu/1XILaDQJD
         fBnaSrTiGWVFDdC3ICcwem3D/LhS4NLDq7CbX1KCMvr5C51xp/bPx4QEQ5lJXNeR/SdP
         n3y+LsD9uXLHvrOb2bgKi5SZSyWJOb6sNCf7bKIr6v2KSS5X6j2pKGvtl+/6FGOKHvy5
         Et/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734704; x=1750339504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZMLBIoT9gJSSjfo3bjWT2EO/rqNo4VRFJWQeolqXMA=;
        b=VYN4nvCREMKY2TKtwdVdvbLQBYFu4voWy0O1bLBHc3VCKdhYtttlUW+OFGkDPU2/77
         FOaYV5U7A41jNBAPjuGh0vpitkyQgDgBIp3CBEceVWXHxJep+o8bUjeh4SLsd/6uQn2v
         n9r+QprQEIc6MvlOMPHRZBouWT19MAn92fL+blA2vpGJGwCuqba4X6uzbwiwvtGdyT4e
         lwd9DbAMY+M9qq7q6XJ4hXY/ogpsDsoO2fmsOjZvIOFrJ8LyCVcHJ7i8X/iPbDSHBwoe
         Az8/qnQNaW6cxVTbmwmKVRXIqdE1KYeG17DC3of/Md2WkvWYCKDDA3tsNutcpXnTx2pW
         CLZw==
X-Forwarded-Encrypted: i=1; AJvYcCV/Tz9y3nFdVsR+OUnCvelTbpFYnqY4sonADRR5KhrMrNuLh7mQlc0ng3PvJuzmTfhoi86qenMpB0JVbuQf@vger.kernel.org, AJvYcCX4g/JeEgpVtNetxA0YqaKOlHF5Tju81VjvFwF7zVmVaWU/MCK4Z2XMX+/eItB6bG5c3TG1nnCu80wd@vger.kernel.org, AJvYcCXMHjzFT3kDBT23W+dM5MDXvX0GH8DsTfqkfsy+2AyF5uPwydEyOB1hLw0OQv1igqQ60zNpeM850kkVDzmcwtLFJw0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMSdHsWwhfNDgMiKKWAJ1xzBV4LwP4Gu8hLA13230lVHEGxlJ/
	Gy5ESpKc3kSUitqDqIQw+mfW5QlALPyhznM2VV05I8/YLtkPzer7mrMNxPt9gqlL/dL+vtxMtZy
	gTDCS5pVNhbbS6TVQJTbqLtpKk4TALF8=
X-Gm-Gg: ASbGncsd/S/thsrtoiPfTJIqawvz5DZbp94ZloFhBghcf3XKVd0uQ34hb4WuUu1veWX
	A1h2Hge2c8d5Kv+Mc3YHORiUTPnDpz4Z7BrwjlT9p7QjDqrE5EVA9hVBB3KWnbXTY+gDDcgP0zq
	0r0BBfJ34xBjwLS6EDwfD4wmwc603jlwNwLpJN10/7m3iqYw==
X-Google-Smtp-Source: AGHT+IGojv7wi+EXgUrJ1iAcaQXcq2yh/a6c2FWgiCP1FdZTWn9scfT0ormpQqL7u63zFto7esDU9JQ3yZ95W1IoapU=
X-Received: by 2002:a05:6000:420e:b0:3a4:fcc3:4a14 with SMTP id
 ffacd0b85a97d-3a5612dc4edmr2358774f8f.34.1749734703859; Thu, 12 Jun 2025
 06:25:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528140453.181851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250528140453.181851-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVa4axB+aKhH18KxK4DVafeix6wn407PEhMxV_6xfpraA@mail.gmail.com>
In-Reply-To: <CAMuHMdVa4axB+aKhH18KxK4DVafeix6wn407PEhMxV_6xfpraA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 12 Jun 2025 14:24:37 +0100
X-Gm-Features: AX0GCFtWM9emtIyXyU7iiWJWdsMZ7qy_zlJ1u6yeICmsB6pfXTrDdlaHSfP6HUA
Message-ID: <CA+V-a8stpis6RuFZ8X+g=nnQhQQNJN8X8kpma6kf2Hmi+3hf4w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable
 USB2.0 support
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

On Thu, Jun 12, 2025 at 1:49=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 28 May 2025 at 16:05, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable USB2.0 support on the RZ/V2N EVK board, CN2 connector on the EVK
> > supports host/function operation.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
> > @@ -302,6 +317,16 @@ sd1-dat-cmd {
> >                         slew-rate =3D <0>;
> >                 };
> >         };
> > +
> > +       usb20_pins: usb20 {
> > +               ovc {
> > +                       pinmux =3D  <RZV2N_PORT_PINMUX(9, 6, 14)>; /* O=
VC */
>
> Any specific reason why OVC needs "bias-pull-up" on RZ/V2H EVK, but
> not on RZ/V2N EVK?
>
On the RZ/V2N EVK for the USB20_OVRCUR pin we have R13110K0603 pullup
resistor, this was missing on the earlier version of the RZ/V2H EVK
due to which we saw false OC condition (as seen below). Said that the
actual EVKs for RZ/V2H for which support is being added do have this
pullup resistor. After testing I will post a patch to drop the
`bias-pull-up` property from the RZ/V2H DTS (thanks for reminding me
:-)).

[    2.672424] usb usb3-port1: over-current condition
[    2.792424] usb usb4-port1: over-current condition

Cheers,
Prabhakar

