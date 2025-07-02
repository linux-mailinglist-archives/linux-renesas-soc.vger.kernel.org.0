Return-Path: <linux-renesas-soc+bounces-19051-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A454AF6394
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 22:56:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D67C52067D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 20:56:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D3362D949E;
	Wed,  2 Jul 2025 20:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PgIelIcR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A212D6415;
	Wed,  2 Jul 2025 20:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751489765; cv=none; b=gUJ/YjieyYL6HzbC+tqGt4NJCBVGNc7nPv1gCMQeUC4B153Wi+V8EhfJktIBUM6expVItsiHht2p7xBWY8k1OrDr9fz7TDdlBIX3kJqU55GyO0z6lE5BDoVyz2AWHfhAIK3tqq2RDPlw6LL862CT4CXe6iDOsYmzYrRq45Rrrn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751489765; c=relaxed/simple;
	bh=GUbirZnxWIxVyx4KfmVp/Io9+GWDEoK9glS6Q93eOHo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XojvA7lCP21fBkKBB53b3EbF6zXSwpjch2UKMKSClJOgIYGtsAe3cf+ssAlcXrjJZk5TbZuXeo5QxWCZLw9XkW0m+Np5ON6CCQ36TDUNoTxBJwUQzHFsEixlFeUGIfdbcIW3e07RauTcCAh+ZUal7jyzR3Ew1menaIwERKA1wfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PgIelIcR; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a54700a46eso4047270f8f.1;
        Wed, 02 Jul 2025 13:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751489762; x=1752094562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gO7oyA1heXGUUHmE0hl+hVc6JdGSyQeN+FCreDhZ64=;
        b=PgIelIcR89LmDfKiXNzERMjBaAfp3MlqLa4sVsxbg0waBd6EHYuMqBkOM68Sb/fURP
         UD23Cx0A3IPQ/bZdftxFdu4zltZIjqndknjnk31dprJ1UD1FNyUrOC7DO8My06tqWHCB
         1OvtJTYT2wYQJIMtyhy38vWJXC7JPVR6l/FrdymTmqePDtxvFwInVe3fx6AyT3B/sa1l
         zlJuIrdiqFWv2dgWF9ucNU+TKl5h3yNSwBTtAgCxfroa7lUckS3S+43VZsQ76oVHdr3u
         88K+d6zSCkRo0jfAzVjFbONvhczRjLGfJ94BvWRnjU339fPL2vIZihzCN3e0yg2SguRI
         deaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751489762; x=1752094562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gO7oyA1heXGUUHmE0hl+hVc6JdGSyQeN+FCreDhZ64=;
        b=gdwKzLZeBVyUyIlTnN1iFcoCrt4ycgVClTPG2Gs3XGs/dvChCYe5me8wErP/w0erjh
         Sj8ceVjyi6Pf0c04nGfpj9E8S0O9ek2TbzHfgg9sRMNwj7Bh+EeDvH4dLAJKZ11mhUts
         rzFeF6UDKjOk61pC4PSWAjPp+OPRrT1iWRkfHzQFbXtIUTYQvL+uDJrYJtD17A8miyot
         h8es6Ud/fuDbDTuMG1bUcBTY6Iagx1akNIsc9cvJiFCITME7p8tMZnpffc5H5ScRZj8I
         JitXOUtOIutYkwIV2vpQU/3CUogbwookqqEy4I295Var8fgohBsKRAopmrHuKIgL/K4F
         LJzg==
X-Forwarded-Encrypted: i=1; AJvYcCVbo7bO0GrU3gXDICwMkaH33/t/iBChh5GEVj/cetyAzC5ukXAHpGmynDitbSpsOaVZQBq6C7W+nApd7xtx@vger.kernel.org, AJvYcCVijBrm2CygWcLPV0TyRPAkGzMqI7106P7hKUG9qEam4NPDOEjBvtUb50TrYeQJqPoA9Obph2ejsmv1MRuI4T8bWQw=@vger.kernel.org, AJvYcCXlJBo3WIc/OxoeaNz2nf8oqdJkt1UkJpCyNlKEcvTxCDbx+HLXTO/vBaqO/D0CxIFvLZgIvlbYz4Ch@vger.kernel.org
X-Gm-Message-State: AOJu0YxzE0WgEV3ELXxq9REbmJ5qovUGSwhb8VvA1ptAEwNWL3LUDfIK
	imBj+GFqsTDUo9DYFmXXKzAHmSgBfaFippjkyINDb1ZwNk6rjDombtiylm/YVPyuu6bE6MSCcEQ
	bpxNswrqpGVDrE/NrGo+AujzssUQryZ4=
X-Gm-Gg: ASbGncsVDiodvCnoX5fWFnyy8mREntRkK/MZiVL0fkKu8J93/sucoqZdRjGdbeouWOX
	MmhfbAbWuJDZdyPpgaLV5v1z98rtDglRnInu+QvgK9jrETnpGdGI1bibeY66R6c1GpDtDgu2WkQ
	LwR/H6cydfgLyhmQRhytGkiHaI9zOGpDO8ryYy8sZJCQDH2Q==
X-Google-Smtp-Source: AGHT+IEKAkIibB3ZIFcpQ622xcSOPRGqhNF09cC5PWAtvYxOe88yGKFuauYcLykgn4UuUYQCbVG07j2b/vhW8i0azsQ=
X-Received: by 2002:a05:6000:25c3:b0:3a5:2beb:7493 with SMTP id
 ffacd0b85a97d-3b1fd74c2d4mr3372597f8f.9.1751489761946; Wed, 02 Jul 2025
 13:56:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624174033.475401-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250624174033.475401-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW2fkQZf_WG5X5oOnJJiU13gw16soH+V8xyb8X2WtoiWA@mail.gmail.com>
In-Reply-To: <CAMuHMdW2fkQZf_WG5X5oOnJJiU13gw16soH+V8xyb8X2WtoiWA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 2 Jul 2025 21:55:36 +0100
X-Gm-Features: Ac12FXxfws_jAoorxN319eoLwR1DERutT2E_pCSEBAXvIe4kmrlV3206u2W9h1M
Message-ID: <CA+V-a8ucoVPNpeKsXYe+BPSvZVkM96YzQ14_te4O-nBmtY0t0w@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r9a09g057: Add XSPI node
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Jul 1, 2025 at 1:08=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 24 Jun 2025 at 19:40, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add XSPI node to RZ/V2H(P) ("R9A09G057") SoC DTSI.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> > @@ -280,6 +280,29 @@ sys: system-controller@10430000 {
> >                         resets =3D <&cpg 0x30>;
> >                 };
> >
> > +               xspi: spi@11030000 {
> > +                       compatible =3D "renesas,r9a09g057-xspi", "renes=
as,r9a09g047-xspi";
> > +                       reg =3D <0 0x11030000 0 0x10000>,
> > +                             <0 0x20000000 0 0x10000000>;
> > +                       reg-names =3D "regs", "dirmap";
> > +                       interrupts =3D <GIC_SPI 228 IRQ_TYPE_EDGE_RISIN=
G>,
> > +                                    <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>=
;
> > +                       interrupt-names =3D "pulse", "err_pulse";
> > +                       clocks =3D <&cpg CPG_MOD 0x9f>,
> > +                                <&cpg CPG_MOD 0xa0>,
> > +                                <&cpg CPG_CORE R9A09G057_SPI_CLK_SPI>,
> > +                                <&cpg CPG_MOD 0xa1>;
> > +                       clock-names =3D "ahb", "axi", "spi", "spix2";
> > +                       assigned-clocks =3D <&cpg CPG_CORE R9A09G057_SP=
I_CLK_SPI>;
> > +                       assigned-clock-rates =3D <133333334>;
>
> Same question as [PATCH 1/4].
>
Sure, I'll move this to the board DTS, and also add the comment below
for clarity.

    /*
     * MT25QU512ABB8E12 flash chip is capable of running at 166MHz
     * clock frequency. Set the maximum clock frequency to 133MHz
     * supported by the RZ/V2H SoC.
     */

Cheers,
Prabhakar

