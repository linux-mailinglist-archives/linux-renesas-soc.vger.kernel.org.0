Return-Path: <linux-renesas-soc+bounces-14932-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F3A73A4F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 18:25:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 610E2189359C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 17:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC14B18CC15;
	Thu, 27 Mar 2025 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UxUQ8LQB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609681DFF8;
	Thu, 27 Mar 2025 17:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743096300; cv=none; b=smSeCVaDp6TUgcHRgmXH+907TT3dux6sv7I5BseE3nZBTgPiAWyepXk8ueqOP+Q2LpNuDGm1X+vJdiamyiIdnf86Ibut7+IzIGckSHLjzDie8O0hXDv5Twjih2cM5mnakt1AShR3Bzun9D8B2FvN8ggV1U6fSUql0dgmkxfoKuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743096300; c=relaxed/simple;
	bh=PanSUjI5ZwL5VGGgcOQ1nw+DYlqUsbtgRWhq40jlhO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AyGnQ4a6NcI4vZLY0OkXhOforuDYu3hz/I4zyYKKgcd5A1M1Eb8EZ8OxRztWtOw3zm84Dqle2WKZXJYd2fTrQWKgjeiyLiHU+gSXEUpYZGwv8lLtUu9ogMb9xDcbRQ+sKCEkTsEvSWdwhaFA/zOgILCG+zuWv+kk2v0BNMlDdxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UxUQ8LQB; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-86d69774081so618846241.0;
        Thu, 27 Mar 2025 10:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743096297; x=1743701097; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PanSUjI5ZwL5VGGgcOQ1nw+DYlqUsbtgRWhq40jlhO4=;
        b=UxUQ8LQBe0Rq8LDJYDyBtxullHQkdOQ9UVaxoF0/OQsDOGoSX5+MQGP0G2REjeyxql
         DXaTRASB6BxVtSp3c6YJ3XTY1+O4JbTxppEHUVnTbH7hCvHeP4rVeMM28K7zpbrfNFUM
         SjgoAAZdfQ+A+KLi4Nu/sWqDyH2aPjbJPcLstMAIyENoW+LWxs1b4vxXv4vIPchnj7cJ
         tO0LSShhttkm58W66oJJkPoghCMnzQZNKg2sfosCar2G0QivjgZhh/7zkdCG8u4DJk9h
         XYvpsOAaSK6wmWb9cXKXmAaKES3ekRe4/SmeKk+FFl/6PPaNBRVRdBze8G+q+h4FLZun
         T7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743096297; x=1743701097;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PanSUjI5ZwL5VGGgcOQ1nw+DYlqUsbtgRWhq40jlhO4=;
        b=X1DUQNUjTPsqYpXNlf2Vv5WHmZYwUALzfLdXExbii6wXw7qL5QzZuxP9fM5Zf6aw0e
         7m6nrUID4LU7xJaffF2A2EplZIwFzCIq7Gp/GDG+aA7mNMBKpIfEFaPx4Lbo4A5SVVU1
         kgQs1swmbdC58Xe4NsRq7JtPpfkAHUHbMfMgjaIf52VRoik1atFKyGq7zU1tL3DDO7Db
         0jkxbmyPkRmvneU1eKStoKD/P4dFA0UDSFMHcqVWScaurca2l3GihZi/ZP589f/UKHkz
         O3mdXo/yndIWU0o1u/mlB9SRnEYABI8BX+9ueB+1gI0rtCe74bRxRk7zoA4QfbPaKvf4
         wysw==
X-Forwarded-Encrypted: i=1; AJvYcCU/ORf5FFN+ZRcbpfzSewIf0PT2FDfO9RR3KcSGokdjFhj6Gfs8coI7nLIHzqACBvMhF3jm0+d3FP6jDKqn@vger.kernel.org, AJvYcCUUEJf47gTVl/OqHUKOMdDb941CKlr5PM8smtPMxobINnzQEq0pjy71DryLOslc2dxVtsE8YHetuesI@vger.kernel.org, AJvYcCVemkZ8DyfWS/ff28x6q6GolEToLRDO8/iWbugPmV442hvBN2qInYRpNHuY8FI3+h+vgTQKB3dl0/HGGsGKlszheZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyL3KWgCiA5d1NuL6L/QZ+FZKIsmidDpWfkVkq2nHxtRhaiT6fy
	zcHGjofwmhh+y6nuLBqwejD/QW+kz+SyJBlnQsmUpfUXS/YBZXt983UXD/p3bmhFpSa9nonjaco
	s7JzRKxXGmV7PTEkqN726x8R32KE=
X-Gm-Gg: ASbGnct39IitLZIq6tCyKShwvVmls1hKm/snLqRwKUmQQcQe5sUkpirWA84vFhiWKDa
	VrZ1Uh1LdjbL2+bkqsuSq7RcWU9BI8Q7WMveUvPwpJwirVgeK+AhbM8Frocex29+/yf8ll/+8JB
	P/N6s+EHCUHNW7FlwEVnPxs2uznRihR7zExQPuEHNKo3ngeN0Bbcoq30DS4GNDOm46kp54Nw==
X-Google-Smtp-Source: AGHT+IH7psqlWtperFanJw7HCkitwT0AoO2i8/+Zt2Fcb/0Tt691d7IAeHbzYWY0zgaUiDv83+szBL1e76peP52Plc4=
X-Received: by 2002:a05:6102:291f:b0:4c3:6a7e:c9f3 with SMTP id
 ada2fe7eead31-4c586eed6bcmr5311811137.3.1743096296962; Thu, 27 Mar 2025
 10:24:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305123915.341589-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305123915.341589-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250305-cesspool-headlock-4d28a2a1333e@spud> <CA+V-a8uQTL+SHYqVU_J0th4PT6YPF7q6ypzDu33nS_6onWLoOQ@mail.gmail.com>
 <20250306-slather-audition-a6b28ba1483e@spud> <18780ad4be2c28999af314c97ae4104fb161a691.camel@pengutronix.de>
 <CA+V-a8tYv_u4UM5XVysVMPbfJoVwKFHqucLdJOmDP-xrXZ0L5Q@mail.gmail.com>
 <CA+V-a8sfx-QwzPz_zEEmGAyAoqha5cfMs9CvWDVJ_b0-D7QfpQ@mail.gmail.com> <20250327-comply-murky-cffc47465429@spud>
In-Reply-To: <20250327-comply-murky-cffc47465429@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 27 Mar 2025 17:24:31 +0000
X-Gm-Features: AQ5f1JowAamdpvJJslPXiVbLTPPPaClo3d6CTBqNOXDrPfPhemkA4ErF8QJLmEM
Message-ID: <CA+V-a8tQXOwdTqoncvWCL-br7R2yx1NwCisfZwwQz3nTmZ232Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: Document RZ/V2H(P) USB2PHY Control
To: Conor Dooley <conor@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Thu, Mar 27, 2025 at 4:40=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Mar 27, 2025 at 11:06:33AM +0000, Lad, Prabhakar wrote:
> > Hi Philipp and Conor
> >
> > On Thu, Mar 13, 2025 at 1:17=E2=80=AFPM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > >
> > > Hi Philipp,
> > >
> > > On Thu, Mar 13, 2025 at 1:09=E2=80=AFPM Philipp Zabel <p.zabel@pengut=
ronix.de> wrote:
> > > >
> > > > On Do, 2025-03-06 at 16:26 +0000, Conor Dooley wrote:
> > > > [...]
> > > > > That sounds awfully like "it was wrong before, and I want to keep=
 using
> > > > > the wrong node name"... If you're claiming to be some other class=
 of
> > > > > device, "ctrl" should really be "controller" like all the other s=
orts of
> > > > > controllers ;)
> > > >
> > > > There are "usb-phy-controller" nodes on the rcar-gen2 SoCs.
> > > >
> > > Ok, I will rename the node name to "usb-phy-controller".
> > >
> > Fyi to chime in with other reset drivers I'll rename this binding file
> > to `renesas,rzv2h-usb2phy-reset.yaml` and have the node named
>
> > `usb2phy-reset@15830000` in the example node.
>
> At that point, isn't it then "just" a reset controller with only a
> single device that it resets, so "reset-controller" is the right class
> of device to label it as?
I agree, I will label it as a "reset-controller".

Cheers,
Prabhakar

