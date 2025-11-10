Return-Path: <linux-renesas-soc+bounces-24419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C22C47664
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 16:05:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA27018806BA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Nov 2025 15:06:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18F163128B4;
	Mon, 10 Nov 2025 15:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxjfSyKj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7C31076C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 15:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762787139; cv=none; b=DnmObJBiMRm0tavYPYGqUX/VLoHEEUW84LVB9JY57soDKOn4yKMhUuxxsEMAsexvHirnXzs0L99zpRqqdvfXcg8lQ/897y3kgMW7mqgq8s6pYHOgD2RRmrDiOplN6sgoF4ypm4mQldt/BKChSsQBLlxcQaGHAgbbHw6CRarJSAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762787139; c=relaxed/simple;
	bh=oX7KG6ZnAOmeMG7mP0nT2WTsvMrLHigm3CA6kTMfGZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fNWWH2/0IjjFsH/EFkiQHOwU9O00yL/3pRv/gmTOvTBcPiLHcSGixN90wtS3SNb43bz0W6Pae/yEIyJGV42yiBmN9hDGfo+U43VOcMG5sj/g/B9AQIvDUJfU6tAy2BfReqtqk6YUv2lPnWumYlTxQJEIP3GkQpbojngL3m/JrzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxjfSyKj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b70bee93dc4so425360466b.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Nov 2025 07:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762787136; x=1763391936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FyWOi3lRqgHA6tp3HEA6JKNOCPHyopKIjea6wFDOAz4=;
        b=gxjfSyKjjCWIG2Q+tnqyt/HgOR/teiig6XkKpUzV5BAghl+PM5dbHDTjHq9SmtFMvx
         9+IQl61kUggbYyZej69lFqhU/6WllZd6AKoUScFjHvJChrRxnG7DmKMK3o3f+enth7oZ
         kfkDqBgu8ZSl7GzGAc1MJBMce2fmBbN5ryBuNyklQ1v4FaCflHbQVudphibwr/Hrc0d0
         NnaPjqOTpTILWKDBdszq55L9ptMFW8mEge5CNa/jAGewIZx/8NJV5c1Zy9euchLVzYwD
         E6A+Dq90FMFPCZ7F4nF4WnxbKFlPt9Qc33WwM8j+BD93KJVp3ztcHM64bH7CQ8FITOzz
         qQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762787136; x=1763391936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FyWOi3lRqgHA6tp3HEA6JKNOCPHyopKIjea6wFDOAz4=;
        b=kHsbVOMj9zkgAK6bV8t7FP6ExXTRx3utgcjCjEBCPQE5ESguK647spOgtakw3zzGyc
         BXhp+2DKKTNhPaG4wAkIi0nheMhLDiaYsrZA1Tt+3zfKAGR0RVM7GU5WUaSWKciuvShJ
         4A81eCEwpO3wKPHKakg6nRzRcldRQl7nNJQ/36/LJx5Tc6B/b6PM7efxcwW/y8O9gUsQ
         z0/HeUW6s4zVxzfgRnYStBzHh/PwgpynXe4AA1KX7SuO+R3PNMeOg5Ywlb9WgPqQFbaW
         /Ej3L8rSrp9bG/W3e7R8vNCoVkKVH520rMLnYd92Agf1JHjf6WIU2lk4je5+YEzo4zF/
         P1ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXB8bRy5WYP66aSeXJJhCUq+fNCUowlXJQOq9wr2wf2CfDAKNoUI7jY3kI588FFNWMBbqYDmEk7fuk19q/Uzg+9Ew==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9pt1ZWioRIKiorxzSJ95NTxar+pRky+F2BQ76lbctA35CdXZp
	+DCQ57STpNlrVi9iune/4SSoXtvEAqwYWLhp0pSnIQhg69yhoqxBdoAR/+oV+g76pzWSfV5vs6Z
	Ath+l0Cx2khyz6Lmw3jxG+8/4MtkCJZA=
X-Gm-Gg: ASbGncs545hYK5wrIBRsEuVH0OTFLWbBRHS92jh3ZV8rLNCEL4I1ZZ7KaDB3HOpAkMz
	yuGDnXXMW4jT7LuKf2thDjbuG+zSIFJDoUaqef70wd6GKPFpsY3QTFkOU4e4BOLSQaPhPFYevLt
	bTRpq26B8Ku4d+sqcVTGFnUIj5V1XUDUIVY13mXhc6V5bJrC25635fjDg4qjyOGwDXnElK96zU3
	cbqjmEUWpIX+8mdGtArPeQfCdmPlv3ASSWI1l24Zo7vR0V5v3YvfH7qLn1E19prd5Kx++DSWTkw
	oifMvKJa6f5+5mFgcB0=
X-Google-Smtp-Source: AGHT+IHeciyStpTuG5iYET+fyHTcJqtDM1+foUuR1aSu7JIqQM7u89xv+xjRaaVEyUz8OAeksl4hsRtVe5mFo0odlpw=
X-Received: by 2002:a17:907:3e0a:b0:b70:ac7a:2a93 with SMTP id
 a640c23a62f3a-b72e047b3d8mr883107266b.43.1762787135424; Mon, 10 Nov 2025
 07:05:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251028175458.1037397-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdV1jaDDrAruoMK860UP7UXRBf88nY5rr9WaR8Nggy9yEw@mail.gmail.com>
In-Reply-To: <CAMuHMdV1jaDDrAruoMK860UP7UXRBf88nY5rr9WaR8Nggy9yEw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 10 Nov 2025 15:05:09 +0000
X-Gm-Features: AWmQ_bkqzUyz7wVqjBdmxW16qEIhFvcCMuwmIBCywj4hEuL2egOBdkrWJgyZKWs
Message-ID: <CA+V-a8uE4KMpWmaF5kBiMamXtTyDRaNOZR6eBajgBrCA9rOHGA@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] arm64: dts: renesas: r9a09g077: Add GMAC nodes
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

On Mon, Nov 10, 2025 at 2:53=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 28 Oct 2025 at 18:55, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add Ethernet MAC (GMAC) device nodes to the RZ/T2H (R9A09G077) SoC DTSI=
.
> > The RZ/T2H integrates three GMAC interfaces based on the Synopsys
> > DesignWare MAC (version 5.20).
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
>
> > @@ -495,6 +933,13 @@ sdhi1_vqmmc: vqmmc-regulator {
> >                 };
> >         };
> >
> > +       stmmac_axi_setup: stmmac-axi-config {
>
> I will move this up while applying, to preserve sort order
> (alphabetical).
>
Oops. Thank you for taking care of it (and also for patch 4/5)

Cheers,
Prabhakar

> > +               snps,lpi_en;
> > +               snps,wr_osr_lmt =3D <0xf>;
> > +               snps,rd_osr_lmt =3D <0xf>;
> > +               snps,blen =3D <16 8 4 0 0 0 0>;
> > +       };
> > +
> >         timer {
> >                 compatible =3D "arm,armv8-timer";
> >                 interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
>
> The rest LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.19, with the above fixed.
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

