Return-Path: <linux-renesas-soc+bounces-19048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C2AAF633F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 22:23:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 960EA7B4FCE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 20:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF12220F36;
	Wed,  2 Jul 2025 20:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mk444hVW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3490C19E7F9;
	Wed,  2 Jul 2025 20:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751487792; cv=none; b=F/sqYeMWsQlPEi1dBxUhk0lahFtbNSaillXKk4ynGC9UfjfIdMeusUAwA8Juixh2beFKX1Lf+lw3bw5RpIqdNc5x3wU5hZQfTPK2ZzkUpnW9sBc1kz3Hp5FavCp36DlCr0Jlg3hO47riklQqrt/etjawq1h/v1kfPmUMYiHP36o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751487792; c=relaxed/simple;
	bh=2HJtGLQp0IqQaZbtP2rO+zFnFGQhR91Au8VO3qnW5Wk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f7yDKKnMg+o8r+kZ+6B3/4WAPaqlaeCbKPBZjfx5KO7xxqUz7b6b8m7MyyUiU0StcErFaoAWPLoq7odoDdqPcgB3kU5huJdP/JbiPFsbUUzHU2HgVl3aaKReu4+E4XWW1rQRDyoGcXGQjCOneqWSMQF5SL5Nh4RAX4fohJU4FDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mk444hVW; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso8219792a12.2;
        Wed, 02 Jul 2025 13:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751487789; x=1752092589; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nviHylhLA75u1Ss4+o3d3hD2AAn1Y5q3p3KrUwdNg18=;
        b=Mk444hVW8EwSoJ9AtI1KdnnpGaPEQnX0goiLsWsAnLkP16j1br5vUmFb/tF1ckbQCE
         fgi/zUpXiuxs6I5ipWKSHromqrpzNH1cCLeY9EC9sILDhbG1hT0RBGmmr4WQNfj621rs
         PKtkUQwYYHOdIQ2oHuzcag4mOMg3lUha8YwwONErlw0gMIG2Dc1ETruh3FZql7NFJ8Ed
         XRkJ38NL4jspbMxorSkBUy2y5cHF7wKPb4J9ww4HarLBaPerZ2r3OkvIU2uINOB5+p0Q
         Kk+RkXZkkzE7DTYpdWJcALgIrfoRLA2MHThflrgavAkg1Wf8rqalxMoizsIqUkc7aODL
         qZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751487789; x=1752092589;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nviHylhLA75u1Ss4+o3d3hD2AAn1Y5q3p3KrUwdNg18=;
        b=AKJcbEr+pIAb8atCMi+I7lG7tvF9mQPymE8MnMUTgn8nEDFuOPRLOkea8+rs53/isO
         nsCCS45FbpygsmdYrO5WyWcAvk59uhLAYt2UXMBj1rGVyIs33cCtqI7DcvxuIWPnkehG
         gETHtUHvtBZaK9/z3n0DM5X4aN0L6NCnAQgTBbgCAukZWwf2IagvMpPspxMS/37tGGXC
         d76DhNcMa/BebgXMntiPUgiSIp9cssOG8iHVBGyewJPvUUt4BhP68zgEmn9/0NmLE3Ev
         9e7tpeRjTq3kV1+0Evp7rbVEShM88rgTmfYyoq3uJNmMNcmymv/TMRVwAktVfof77m1j
         69Iw==
X-Forwarded-Encrypted: i=1; AJvYcCV9pdpArH/GWHqZmC6xvpL8FVCfxzQ4AhF8IsxFvgWIbAj7/eSyRyipVOfYrBDz0lIhH/Ua74p+dGSRt8PfC6Z0eAc=@vger.kernel.org, AJvYcCWPqVSh2ekbA+JGI/MtZbyYlCy4pH9vaIq7B0tkQJJEi7okXSFnNI2EqMclyf0Ky21Jf8eVd3IGoeXf@vger.kernel.org, AJvYcCXise5q84XrsDGzOTDXAGJb6jy5PCYHBga6foXeelKGtV3zJ0o8tVZoF+YC3AvltQ58rbzvvFpcsVqsu6yR@vger.kernel.org
X-Gm-Message-State: AOJu0YzLoGzm0o1TpVEp//O47P1aVlIsKxydbCMtqjv3lnid7HyUBQ3c
	rzYnx+Z6a6gSgltZY1ZuN8rMT7lbVo0QwgSCUn69Xf/O2vE/4wS5fuw8m/8B7vQ8OMiZ5s69aVy
	U8vHu0vGyTB91ynDBZeXUEFyPK2ljRBhZ5iHC+gM=
X-Gm-Gg: ASbGncuakXdYZ8GBDCu2jdBKBnwp5DkLyvZ3Ax4C6fmosu7bgdVHZvwWZK0WmPWXpcq
	mLJm6WjHF30LhRwhHpL5Yd1dhJLK+gZ3MGDXMCoSemD+/tLNgAghA3QZMZ/9N6iVf4WpSBMRhow
	quaivLaW5yeZY9YWB6RincL9Tyn45CPxPjqCKK4s9W81gYEw==
X-Google-Smtp-Source: AGHT+IGsQaHYjl3sMyKqMj4TcLZ/DbPpwCwnnOJhNG88eiKuXSWJg4GxUQCDWw5TymaU91vezRZWnQCXPEgk1eVeajw=
X-Received: by 2002:a05:6402:1e92:b0:601:fd36:6ee1 with SMTP id
 4fb4d7f45d1cf-60e52c0e567mr3585556a12.0.1751487789161; Wed, 02 Jul 2025
 13:23:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627193742.110818-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWaoToq0ZHx5_nFCx0iL4B2PUHRkegm5Vy3K+5MG2YSrg@mail.gmail.com>
In-Reply-To: <CAMuHMdWaoToq0ZHx5_nFCx0iL4B2PUHRkegm5Vy3K+5MG2YSrg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 2 Jul 2025 21:22:43 +0100
X-Gm-Features: Ac12FXwL5r1SZPjGbV3Lp7OjhO1QhIQIVWXpM9HKD6RPg-L0rq_E6-1AvigrxwY
Message-ID: <CA+V-a8snbBAeBP3+sz8R96A6Agdg33qp00GkffqB8DqDpzBXLg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: Add CN15 eMMC and SD overlays for
 RZ/V2H and RZ/V2N EVKs
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

On Wed, Jul 2, 2025 at 2:19=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 27 Jun 2025 at 21:37, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce device tree overlays for supporting the eMMC (RTK0EF0186B0200=
0BJ)
> > and microSD (RTK0EF0186B01000BJ) sub-boards connected via the CN15
> > connector on the RZ/V2H and RZ/V2N evaluation kits.
> >
> > These overlays enable SDHI0 with appropriate pin control settings, powe=
r
> > regulators, and GPIO handling. Both sub-boards are supported using shar=
ed
> > overlay files that can be applied to either EVK due to their identical
> > connector layout and interface support.
> >
> > To support this, new DT overlay files are added:
> > - `rzv2-evk-cn15-emmc.dtso` for eMMC
> > - `rzv2-evk-cn15-sd.dtso` for microSD
> >
> > Additionally, the base DTS files for both EVKs are updated to include a
> > fixed 1.8V regulator (`reg_1p8v`) needed by the eMMC sub-board and
> > potential future use cases such as HDMI output.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Dropped patch 2/3 from previous series as that has been merged.
> > - Dropped adding alias in base DTS instead added in overlay.
> > - Switched to using single overlay files for both RZ/V2H and RZ/V2N EVK=
s
> >   instead of separate overlays for each EVK.
> > - Used RZG2L_GPIO and RZG2L_PORT_PINMUX to avoid using SoC specific
> >   macros.
>
> Thanks for the update!
>
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > @@ -161,8 +161,16 @@ r9a09g047e57-smarc-cru-csi-ov5645-dtbs :=3D r9a09g=
047e57-smarc.dtb r9a09g047e57-sm
> >  dtb-$(CONFIG_ARCH_R9A09G047) +=3D r9a09g047e57-smarc-cru-csi-ov5645.dt=
b
> >
> >  dtb-$(CONFIG_ARCH_R9A09G056) +=3D r9a09g056n48-rzv2n-evk.dtb
> > +dtb-$(CONFIG_ARCH_R9A09G056) +=3D rzv2-evk-cn15-emmc.dtbo
> > +r9a09g056n48-rzv2-evk-cn15-emmc.dts :=3D r9a09g056n48-rzv2n-evk.dtb rz=
v2-evk-cn15-emmc.dtbo
>
> .dts?
>
Ouch.

> I take it you meant:
>
>     +r9a09g056n48-rzv2n-evk-cn15-emmc-dtbs :=3D
> r9a09g056n48-rzv2n-evk.dtb rzv2-evk-cn15-emmc.dtbo
>     +dtb-$(CONFIG_ARCH_R9A09G056) +=3D r9a09g056n48-rzv2n-evk-cn15-emmc.d=
tb
>
> > +dtb-$(CONFIG_ARCH_R9A09G056) +=3D rzv2-evk-cn15-sd.dtbo
> > +r9a09g056n48-rzv2-evk-cn15-sd.dts :=3D r9a09g056n48-rzv2n-evk.dtb rzv2=
-evk-cn15-sd.dtbo
>
>     +r9a09g056n48-rzv2n-evk-cn15-sd-dtbs :=3D r9a09g056n48-rzv2n-evk.dtb
> rzv2-evk-cn15-sd.dtbo
>     +dtb-$(CONFIG_ARCH_R9A09G056) +=3D r9a09g056n48-rzv2n-evk-cn15-sd.dtb
>
> >  dtb-$(CONFIG_ARCH_R9A09G057) +=3D r9a09g057h44-rzv2h-evk.dtb
> > +dtb-$(CONFIG_ARCH_R9A09G057) +=3D rzv2-evk-cn15-emmc.dtbo
> > +r9a09g057h44-rzv2-evk-cn15-emmc.dts :=3D r9a09g057h44-rzv2h-evk.dtb rz=
v2-evk-cn15-emmc.dtbo
>
>     +r9a09g057h44-rzv2h-evk-cn15-emmc-dtbs :=3D
> r9a09g057h44-rzv2h-evk.dtb rzv2-evk-cn15-emmc.dtbo
>     +dtb-$(CONFIG_ARCH_R9A09G057) +=3D r9a09g057h44-rzv2h-evk-cn15-emmc.d=
tb
>
> > +dtb-$(CONFIG_ARCH_R9A09G057) +=3D rzv2-evk-cn15-sd.dtbo
> > +r9a09g057h44-rzv2-evk-cn15-sd.dts :=3D r9a09g057h44-rzv2h-evk.dtb rzv2=
-evk-cn15-sd.dtbo
>
>     +r9a09g057h44-rzv2h-evk-cn15-sd-dtbs :=3D r9a09g057h44-rzv2h-evk.dtb
> rzv2-evk-cn15-sd.dtbo
>     +dtb-$(CONFIG_ARCH_R9A09G057) +=3D r9a09g057h44-rzv2h-evk-cn15-sd.dtb
>
> >  dtb-$(CONFIG_ARCH_R9A09G057) +=3D r9a09g057h48-kakip.dtb
> >
> >  dtb-$(CONFIG_ARCH_RCAR_GEN3) +=3D draak-ebisu-panel-aa104xd12.dtbo
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.17, with the above fixed.
>
Thank you for taking care of it.

Cheers,
Prabhakar

