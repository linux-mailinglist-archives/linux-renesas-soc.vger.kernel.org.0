Return-Path: <linux-renesas-soc+bounces-11911-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E485A03F8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 13:45:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A44643A1C26
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jan 2025 12:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225821EF0BE;
	Tue,  7 Jan 2025 12:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYmcSX4J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7C41EE7DD;
	Tue,  7 Jan 2025 12:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736253879; cv=none; b=bgluSUZ3UzPQhSduXyy/dZSbOeICWkCo3ZrE94oQ+u5SozRkEjXrhPBkciMB1IwZmgqGWLSQzvS+jXZRqLVv4e2AFdXNpeSLgEmX5oa63bbAzwtN2h1ahdlWskd0I606Y38lbRNpGuedoGFURfqoWOFTz8Z/i/Cd/wugI1DWupU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736253879; c=relaxed/simple;
	bh=la3Y9Ge5sT2tYR9Z3wYV0OgXgJDEcRI7i2B/zUsMvVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lID6s43mLQZt7YWP5fG708gx6i/FnaPRgXLh7EFCE/JLhTayVxbkJYwVtUaN4pOLN4Er0vd/Cc2CESZ4s7I7jmA9d3DbMZ2M/N5A+aTuOy82qLU3Wku36lT6ZqdhPH9t4tYOIYkwlISDh/Zb6fZdOLvMaFlQf+1/h39QdJ0jGJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYmcSX4J; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5174f9c0e63so4858467e0c.1;
        Tue, 07 Jan 2025 04:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736253875; x=1736858675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7c8gZPVbFAuzmLir8d+zjecdoml3ldGdOpDBiPs3UCo=;
        b=kYmcSX4JU5QgOkHlOvmmP19QqLRd0ltYYLY7sh5494XqCKA1dVUu+cNsrlaVjRJfh2
         PZzUzBmPrTFel2cA+oNuhNJ/4aV/yMnWXqObPJL5mRvBdCHM4x5LkjQR0r3jhTt3v7Zl
         vqIrdr7UTJkVv+xKvWkSEV0rPOC6uaN8W5NmGTL5C+wQaH7MaqmA5s2Sg9RowBT6ui/q
         Y7lsLK3/UAOc573336Lam/R0MxMmd0hrNMdQHvK7q+8m1DeDxlFiyGX3iCX6wfJyL3PS
         VbH9KL1fE6nCCw0a3Jazqs6PAcP2ogaZl/wrjYWVKSB82yJ18wjKmLYiZkI9w0x25cwL
         4nUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736253875; x=1736858675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7c8gZPVbFAuzmLir8d+zjecdoml3ldGdOpDBiPs3UCo=;
        b=CbT5egs+zP2c0B8innOYH0QZedZduI0CmBhx7pcF+YboUBpx7zlYKoMjEwDvtoFQrL
         JwTxLREdCkht3aN6RLnau7Qkf7wmgUKjZ/A9qi0Utcze4wwfUt/al+cxDT0L3A+0ml/2
         pg4V4uTkde0qkbuHQt6t3xt3djsd55C9nPbrGoFSE8drAX3cJWWMn/e0vBf5Pmwt/R5k
         32X0D1up4w1BvG2Kygvpp0ITvBbGr3BRAehWrdoeX2qKFSEcM8Y0NR70Bq3KLRGDooHu
         cf2OeM/w4XeY4GxH+weHmcx0ZxMTwi8dsWrmT2I6ESmDXyak+w0i92TnafX1hNx3/vXx
         ppNg==
X-Forwarded-Encrypted: i=1; AJvYcCUm7d1GG/nxUCaHmIAOSShR/bxUC57nbh6tbk3OXKWwakL/VfRCj/OLAuavDE4iAhLyC0jljjnJmNj5vYMQ@vger.kernel.org, AJvYcCXMT49hqL1QyHSPJ78iRK8UJ7Y2A+UAeAMdCvYQlNxuyTVtDyYRzNVrlmyFmqzmZfHocQIHmETjXqU=@vger.kernel.org, AJvYcCXQz4QsywVv7SLsFALGbdm49XXGAL3PWBF4i0fQgmuyYZKQyrA2bxTp7ccWuJMXN71cY4LeaCPiHyRkJcvyAKWAH+0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkv6Yu7QJwEHPtvnfeejmRFDq+WOeWwPWAwF1D0JEkRpjCRJ4T
	un+MXW8fqEfPzvnmL6anMs2XDDuPamjOnKXHOpmJe1YW+2bLtY7TLumurSGGl2Nz2genkQgKSPT
	zOmJubg4oTdal5HmT0rC5k8mjs4Y=
X-Gm-Gg: ASbGncuItx8G/m8OgeZfaaBPG4OVnds2wzNuBPAqpfJMvMHEYVqpIl8X/HAcFjf/tcQ
	F17xH7BQXiX/0CxSFPvslUKYGlHqXIbQ/6Lmroc8=
X-Google-Smtp-Source: AGHT+IE111X8NnYlgkVD6dCAh8KCb4pShlj2ldze9/imuzmayq2f01KzefaTEAGljD+wzKwY2/EBkXnjRQoJSwJgljY=
X-Received: by 2002:a05:6122:3d44:b0:518:97c2:f21a with SMTP id
 71dfb90a1353d-51b75c6e59emr49322521e0c.6.1736253874701; Tue, 07 Jan 2025
 04:44:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250102181839.352599-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346C123E18F61A009F6F0F586112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tO-d35+aPLYoCmC4xKW4cMoNyzM_Vmyw6CzOJjyjj=_g@mail.gmail.com>
 <TY3PR01MB11346C6E247A83F6835F0C7A686112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8v3wdwEk9zu26MeQVmOnWKm=RdHJzdH6tLKrvRLeoQ2DA@mail.gmail.com> <TY3PR01MB11346E9B6CD4CDB6EF93B99C986112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346E9B6CD4CDB6EF93B99C986112@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 7 Jan 2025 12:44:08 +0000
X-Gm-Features: AbW1kvaRsyB3wcv5Zh9nWrS_jHmhTAPyFSgELU9PSuR8R-l_KZHwrSPWBXRUFMg
Message-ID: <CA+V-a8uekQ=_KyTnm4vOg+DVXfXm5q9BrEb4Ms1k+je7a9aiDw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configuration to
 per-bit basis
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Jan 7, 2025 at 12:38=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 07 January 2025 12:31
> > Subject: Re: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP configura=
tion to per-bit basis
> >
> > Hi Biju,
> >
> > On Tue, Jan 7, 2025 at 12:25=E2=80=AFPM Biju Das <biju.das.jz@bp.renesa=
s.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > > -----Original Message-----
> > > > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: 07 January 2025 11:46
> > > > Subject: Re: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP
> > > > configuration to per-bit basis
> > > >
> > > > Hi Biju,
> > > >
> > > > On Tue, Jan 7, 2025 at 11:24=E2=80=AFAM Biju Das <biju.das.jz@bp.re=
nesas.com> wrote:
> > > > >
> > > > > Hi Prabhakar,
> > > > >
> > > > > Thanks for the patch.
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > > > Sent: 02 January 2025 18:19
> > > > > > Subject: [PATCH v3 4/6] clk: renesas: rzv2h: Switch MSTOP
> > > > > > configuration to per-bit basis
> > > > > >
> > > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > >
> > > > > > Switch MSTOP handling from group-based to per-bit configuration
> > > > > > to address issues with shared dependencies between module
> > > > > > clocks. In the current group-based configuration, multiple
> > > > > > module clocks may rely on a single MSTOP bit. When both clocks
> > > > > > are turned ON and one is subsequently turned OFF, the shared
> > > > > > MSTOP bit will still be set, which is incorrect since the
> > > > other dependent module clock remains ON.
> > > > >
> > > > > I guess this statement is incorrect. Still in group-based, mstop
> > > > > bit is controlled by usage
> > > > count(ref_cnt).
> > > > >
> > > > It is valid, consider an example say IP-A reuiqres MSTOP bits 8 | 9
> > > > |
> > > > 10 and consider IP-B requires MSTOP bits 10 | 11 | 12 (of the same
> > > > MSTOP register say MSTOP1). Now this will be seperate groups having
> > > > separate count(ref_cnt). Say you turn ON IP-A module clock and
> > > > correspondingly clear the MSTOP bits and similarly now lets turn ON
> > > > module clocks for IP-B and clear the MSTOP bits. Now let's say you
> > > > want to turn OFF IP-A so you turn OFF module clock and set the MSTO=
P bits 8 | 9 | 10. In this case
> > you will now see issues with IP-B as MSTOP BIT(10) has been set when we=
 turned OFF IP-A block.  This
> > case is handled by switching refcount on per mstop bit by this patch.
> > >
> > > I agree, Do we have such use case?
> > >
> > Yes, for USB2.0 on RZ/V2H.
>
> OK, then it make sense for per-bit configuration.
>
> >
> > > Consider another use case, index 0, bit 8| index 0, bit9| index0, bit=
10 and index 0, bit8 | index1,
> > bit 0 | index1 10 is addressed in current patch series?
> > >
> > Can you please elaborate, the above isn't clear to me.
>
>
> I just provide a random example for a future IP, where
>
> IP_A requires mstop1 {8,9,10}
> And
> IP_B requires mstop1 {8} and mstop2 {9, 10}
>
No, this case is not handled by the patch series.

> Note: I haven't seen this scenario in hardware manual.
>
Yes, neither do I. For this case we will have to re-work the
BUS_MSTOP() macro. Let me know if we want this case to be handled.
I'll create a new patch on top of this series.

Cheers.
Prabhakar

