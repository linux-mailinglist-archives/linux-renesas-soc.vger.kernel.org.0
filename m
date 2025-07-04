Return-Path: <linux-renesas-soc+bounces-19248-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB53AF9981
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 19:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4459C17D1D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 17:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9946B293B42;
	Fri,  4 Jul 2025 17:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwH5AepA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E212E3713;
	Fri,  4 Jul 2025 17:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751649196; cv=none; b=NgnY8J/n5cewMG57+MWjrBhoWt37rSzDQ7VunulwVW6vdNxAMpQ1bYknvfdTpoPY9X4NwkPATCOylm61Xv7uU7AJVZ/th5H4DVpfdP2p44munkOnvD/rnTwXls5Rsv+59+OKqi1gzM3GBJektPn/PZ2PplySLB3jz6qcu1MXDLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751649196; c=relaxed/simple;
	bh=1EyDVXXMVLol+7QZs1VPMEJtlkKlZUBeMC4m/Udzxc0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fzUxxKrswc7XkMGIC/zCgPdXbBivPIeI0vvtMzEPgePy6s+6DfTe1st41XqgKNiyLVzGrkj2fdKdoCaNV16BernFKuKPY16QYmhD40vzELbKt6ghPehXZtV1RRjdmpA/PqdjAeD6Vr66xqkGrzoba8ZX5mZ+RL3a/JnOeVbQ1TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OwH5AepA; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so6127395e9.2;
        Fri, 04 Jul 2025 10:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751649193; x=1752253993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/2fEHQ1GEiGNPuo9j5/RpeCrkwSbYJX6sR6izT+TvM=;
        b=OwH5AepAdxJTu1Rxuwtj2m+oR7pq/UEL6s4xgQYeZE+2g1xNyYjKzI1j0bk/Ij4mPY
         3n9O5EDw5FWjPiW8Zp+oKumWbMU3SbIvx4opGbLnU6Jz+uU7YYnRHCkiGOx7RUNWqLrj
         h5BBh5I931QI0mUkvSJHBF2gqIcBLoKHn17q6Bl4zkai/l2WXLVNT92mPt77mpkLn4Xg
         z8TSQUrfpRQEZbIGCJjPqM3Yul8Fjm9SzCF1Vn1fumYGhZFlFFmIGb/haPC9cJlIYdYP
         eFkk8RmAkyGMYjEyLbd5jgk93YLdIRVXWxDJ3eiZwpWZ1Q3sWhmmHG0PTxgLmvS3QMjD
         W3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751649193; x=1752253993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/2fEHQ1GEiGNPuo9j5/RpeCrkwSbYJX6sR6izT+TvM=;
        b=Gy9wBHCOXf4mnxyFPhgCrNw7aJ2+9uK2w6m86WChMO8NevBY6+SOgXK6XbdfxaQZMg
         C9yNR7yMvpymmMi2XtmwlupkXovSCwqojEYKvGWEwxlTBRm/tYzinfnbVPo4u+hGwaiG
         Qh7ffjC40VQssXFO07sYmDYrHhr9RpOFZ9LL/uH1vqdXe7QjJvVH7sNnqTHLy3+Kfa15
         lLPOX9noUIcDNv/AXj+eeNlnF6Rq4IOVxlfL7MaGUF3u0PzL3yW3LAvdVCvBBDDspCOQ
         xrvUe+KEXdrecMrsTIIB7BklX99hAvi4kNijs5gaaM+x6cJeozzLky5MRe2/fezxWX8G
         p5HQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVf9Y4wrfUKqQnh7MIDTW5YL/p7/SHrCKqNfc+B6GKe7tpxukEOCqUkG0z6uEYR6vwlHrFutsNdpLk@vger.kernel.org, AJvYcCW5sq9cTczpA1N63MRVRMKGcQbDc+5PDEXxz0KtseQxV+LwF/LLAO8Yy+kmCaZQzKYvcrjVw8rhpK9J66t+@vger.kernel.org, AJvYcCWGsEeoFVBB1CeNjjtpt6V3C7On8S85wQomtGeIG7pSMRwPqKodWhJpDMLdKxH9pA9116ov1BkCStRbrJDtTggYxIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS2KJsKZNHjinfVR+hGnrWqmUBHvHNhA6oWgRv9gmMXeAY6L4Y
	nRLVH0HVOAHgvRdfju4wk1RKnR4QGFsWfjwscdnHSBY4tz/3QFlWmoDY/tTryiK31ZzUJOqvwIi
	zcWOeNzS9+OvZnFSQIAf4nDjQzpV+VCw=
X-Gm-Gg: ASbGncvz9R0vNODOMtGc6mixjT4j79PwsxxYPXipAJxaSfwv0sDKpQV0Es4ONzDY5Ig
	LWVszYGbkunb80MfUNcGMJm59rVwHzzTG4KayLA0SmNGsXIqTjUN+YGb5uufixg9x9XYnPnLOMq
	3Mf6TFSnsNBQJ57QkD8qRqcH+7vHGtWyC2c6vQorq2uWaE
X-Google-Smtp-Source: AGHT+IGSFx+iMx3ZbRiYNNO3ouCFIIMLPoYmfc7VjUeo056sKlRi94k+VtSLPgIFIfLYCOyuW4DIE4zkra/OfPvYyss=
X-Received: by 2002:a05:600c:8b84:b0:451:e394:8920 with SMTP id
 5b1f17b1804b1-454b929f1cfmr9296375e9.27.1751649192567; Fri, 04 Jul 2025
 10:13:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625153042.159690-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250625153042.159690-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVvxebkm9A4g9hADww=9zREXJqyW3eQ6tFVwVJvkUkEOw@mail.gmail.com> <CA+V-a8s9r9U91CqUdC5zDxZGuAA51upduJ1epgmMdKPeYPJQxQ@mail.gmail.com>
In-Reply-To: <CA+V-a8s9r9U91CqUdC5zDxZGuAA51upduJ1epgmMdKPeYPJQxQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 4 Jul 2025 18:12:46 +0100
X-Gm-Features: Ac12FXzVFMcau5ucG50XdB4zOyogQv_Qrb-IfgDeSTpZyuqB7m9XeWgyiVFn8j0
Message-ID: <CA+V-a8uW00iMUFfSczBsFsC3JLSK8SbufMhYGd_1XgrZ29C1Cg@mail.gmail.com>
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

On Fri, Jul 4, 2025 at 12:52=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Geert,
>
> Thank you for the review.
>
> On Thu, Jul 3, 2025 at 10:56=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Wed, 25 Jun 2025 at 17:31, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add SDHI0-SDHI1 nodes to RZ/T2H ("R9A09G077") SoC DTSI.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > > @@ -155,6 +155,46 @@ gic: interrupt-controller@83000000 {
> > >                         interrupt-controller;
> > >                         interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>=
;
> > >                 };
> > > +
> > > +               sdhi0: mmc@92080000  {
> > > +                       compatible =3D "renesas,sdhi-r9a09g077",
> > > +                                    "renesas,sdhi-r9a09g057";
> > > +                       reg =3D <0x0 0x92080000 0 0x10000>;
> > > +                       interrupts =3D <GIC_SPI 782 IRQ_TYPE_LEVEL_HI=
GH>,
> > > +                                    <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH=
>;
> > > +                       clocks =3D <&cpg CPG_MOD 1212>,
> >
> > 1112?
> >
> Agreed (and below).
>
Sorry, it is indeed 1212/1213 as the bits belong to MSTPCRM register.

Cheers,
Prabhakar

