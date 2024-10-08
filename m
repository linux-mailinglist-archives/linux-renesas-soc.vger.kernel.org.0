Return-Path: <linux-renesas-soc+bounces-9586-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DFA994913
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 14:19:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2113FB26E36
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Oct 2024 12:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AEC1DE8AA;
	Tue,  8 Oct 2024 12:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gz1O5NFx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B5933981;
	Tue,  8 Oct 2024 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389967; cv=none; b=alVkiB8Z+beSY4tbH89eMWLEYnPbFcBeQhdQjGZ2s+VciQLwJlS5SqKtijsqF0OLaQ6P9/2t1RWKoZLhZ3VvGLYgaB9jlYV/KbzHC8nyM5/l0t9szxFfrySiAF2VtAxkgOraHVsxt6RpZqNh9yKVg5Rp+mS+7nHRzybmDe4Fnwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389967; c=relaxed/simple;
	bh=FIAeavQ/gVeAtbxi6uncuBjEWr1Dz+YMFROEKKHm5PE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gqcfssyLrELLyecIks/g4F7MzyzMGLIuDVf/w7vKk4J2epm/ANFs4svqYZz3rw3LlrWtvkUiYXxQmBXA+sF/Bl3kOBOA2XKinvjPNS8Dv1FPuVnLIa9md0MPhIM/vzjcMMKKuPzC9r/at/BVPKbRCXLvh1Uiv4wygmCW4HtL3bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gz1O5NFx; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7093997dffdso1606074a34.2;
        Tue, 08 Oct 2024 05:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728389965; x=1728994765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quf//++Xbqy/yfLg/X0DJkUdlM0deuvR/WSCLaISByI=;
        b=Gz1O5NFxwnf5cxhc/trEHH4quok4LDWA7Am2ggfn/MvUjeGZ5xUdZXb0Ts6LZ/uYEg
         xh/tg3F6tEvKDKQWW7E9CIWZyFivAV9r4XF0XnaLQTgu5IQSyl34c6+BybHw2T8JNsp7
         EkeqmtsqZwZJe3pg8g3zJFjZQ6GGLE2c/E0vVdpAdN509aldIpmSM/XfMvOXGqWXSNNO
         ozWIkNK/tmejm8TLNE+H93s9/k5puLd2g9ZrSLeJ6vbq4pfl769DV/J1WSrn71c25ZOK
         JtkwjG2vZ1De1r8YMLZxuSUANgkFWL7eFjiNCb/Cd0cM0tntW7gwg9VIA1z2bNFz9Fen
         6tLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728389965; x=1728994765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=quf//++Xbqy/yfLg/X0DJkUdlM0deuvR/WSCLaISByI=;
        b=G+6EeVa3jxhCobgKUzbiVuZuapWnRsu2XlhPVruJtfdRLOn+Yr+hTCOTZUGKNJqWmc
         hwdOu/teSVvtEJi20UqRewt6gyHfWEVR2K1XuKeKsCi2s7mIPpy1PcJwhHIVWxNHjdzo
         EEDc/pbcx9EZa2lwsZJizJ+8dxRpOs9Tr2fKZ+lUCjiDM/XZMXt47gul1HRb6SiMgiFx
         6QBLPQdb+WygOu+XNvP+FROVKb3GabbP5IwL+rXLc3q+XEfmTz63nv0mkGFBix37idFP
         sacidx2DWUt6SR0MD9DJgI/i0MOtgsJUJZwd7zE8+XG4Y2LIn/FYgVXGzWvbfrp++Ic7
         Gy/g==
X-Forwarded-Encrypted: i=1; AJvYcCUgCd56/rF1H9lClWLuCgMuHD2fDxTz7byAoxO/lzc/VE6KDCQSaCk+jk+eLaUll5oBNikT8QnKC+sk9JfK@vger.kernel.org, AJvYcCV5bZ9d8aKydpkH2iSQJk3Ci6o5qgrIcFRpjXaP2UF5xyJ1jxTfv/qYa/CX62Cc5VWEWAomhPo5E1QL6u/Yx9Z7Z80=@vger.kernel.org, AJvYcCX3MVNYKeERr3vETonpxQsn7e0f4pm4Tdtiz9gYNm7AosGKMP0vK6erNhjHkisHVZBWaLYrp0p+U6Zx@vger.kernel.org
X-Gm-Message-State: AOJu0YyZv+i4GcpwkxOUG+lDZ4xD0lj1DoGY26rFqXvDyBdExwQzQOys
	rZaSGFwMFAaY7usdNE8bKV8xdTZS/OQvH9X2W1MpsobOdI5j4g/EDaB7mIk/ikwHahliQDq27wI
	ZTR9pn1ATX6wLKDEjw0uFIFQ+ZM0=
X-Google-Smtp-Source: AGHT+IGxSirj+Hv+ZX4ScQi8rvrb31b1FnfoPkqWHaPpBvs2xeJM5KPyQKlnaYPkgKJt01azZdoy5o2nnwnCPHvLHHQ=
X-Received: by 2002:a05:6358:9d98:b0:1c2:fab0:a2e with SMTP id
 e5c5f4694b2df-1c2fab00c80mr18386155d.21.1728389965343; Tue, 08 Oct 2024
 05:19:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004133108.779934-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXDc55KO-d0i0_ag0udh7sGCjFfJ78aw8o1-9zaHS15+A@mail.gmail.com>
In-Reply-To: <CAMuHMdXDc55KO-d0i0_ag0udh7sGCjFfJ78aw8o1-9zaHS15+A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 8 Oct 2024 13:18:59 +0100
Message-ID: <CA+V-a8smckrsxxauwJHPJ7zG0qfxemdm6oz6TTbMcN2TAwCu5g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057: Add OPP table
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Oct 8, 2024 at 11:08=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, Oct 4, 2024 at 3:31=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.=
com> wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add OPP table for RZ/V2H(P) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -20,6 +20,39 @@ audio_extal_clk: audio-clk {
> >                 clock-frequency =3D <0>;
> >         };
> >
> > +       /*
> > +        * The default cluster table is based on the assumption that th=
e PLLCA55 clock
> > +        * frequency is set to 1.7GHz. The PLLCA55 clock frequency can =
be set to
> > +        * 1.7/1.6/1.5/1.1 GHz based on the BOOTPLLCA_0/1 pins (and add=
itionally can be
> > +        * clocked to 1.8GHz as well). The table below should be overri=
dden in the board
> > +        * DTS based on the PLLCA55 clock frequency.
> > +        */
> > +       cluster0_opp: opp-table-0 {
> > +               compatible =3D "operating-points-v2";
> > +
> > +               opp-1700000000 {
> > +                       opp-hz =3D /bits/ 64 <1700000000>;
> > +                       opp-microvolt =3D <900000>;
> > +                       clock-latency-ns =3D <300000>;
> > +               };
> > +               opp-850000000 {
> > +                       opp-hz =3D /bits/ 64 <850000000>;
> > +                       opp-microvolt =3D <900000>;
>
> According to Table 10.1-2 ("Recommended Operating Range"), this should
> be 800000 for this and all operating points below.
>
Agreed, I had missed that. I added the voltage level based on the
schematic VDD09_CA55

Cheers,
Prabhakar

