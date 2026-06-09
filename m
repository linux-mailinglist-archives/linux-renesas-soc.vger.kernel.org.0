Return-Path: <linux-renesas-soc+bounces-33736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mCWWELvfJ2of3wIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 11:41:15 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FEB865E6E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 11:41:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=lqR9IIvD;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33736-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4427D30C4790
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 09:25:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB9A3EFD10;
	Tue,  9 Jun 2026 09:23:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA5263AE1A9
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 09:23:03 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780996985; cv=pass; b=ny4HwLIPtB/UlwOBa7UTRNOo4GRDEQafLrP0CEkbyzZMvJWrsJ1pVlVpz9COZ89Ef4NQsWx6tZFKUtBh8nbcKQ0fvUfqAVUf893OYhm6PNTgWpenAVurL+Sek4yLv4H6Th0G+tPSZF0vVzL6z0Oe9nTyUUKjKgjDuD95i5f3Jhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780996985; c=relaxed/simple;
	bh=dsTfQXdWXveui6Dm6dnofvs2mvgUGCQBF9A4gl7pVtI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KvyK/ZcTmvX4ppt8csp43foc7ukUA2ij5VvApX9DOgPldKJY/gzDfiGq7j1TKp9ngew3/RqqSjL7N3MbhaqlpccfQxXQBLxIjsRcMESK2Uy0OwPNOY2+HlCiPFd8HV0PMJe6ihz/0LedxgXLpjnfr/hAGMf3b2UQGXiDCxjf93U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqR9IIvD; arc=pass smtp.client-ip=209.85.221.46
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef189aa1cso3752063f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 02:23:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780996982; cv=none;
        d=google.com; s=arc-20240605;
        b=If8SGaqqFNFOnw248pH+8ph5f9OwRrF324yNGIXHT3eVHfs4ZDjVjOuES4dy5VA25e
         8krIVzZ+3e9KSgIYaXU0HVIR9rG9Fz36RzttthTC6Qrfwi9QWQXhPpO7HXJ2FTQluEZI
         +RTBXii4/2P4WJlNLxGOvtinzRg0rDJLpzrs42l9I5okZM22Ii+Qa9dvjpkeHT3FPRPR
         /+6EPFdPe1LS0QFyvhCfJoph7AcGjqr9r5ZG5ZSHNSOHzP7nHhyV3uSzkMck42VZ0lNd
         +iWKV0Ka/k7xwAfdCAn5m2rdqwNkfUbnzFbpv+0oRakRxd1DbiR0XWwatw0FF/0NmFvA
         u3oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OIEEiASgL7Q2k4J2FB54QvTgD+CBIsfvndbp4S4JS6Y=;
        fh=0ZR84WTrKDDUeI6eRTs9dGgkO9AgHmtvx5P0xH7SuH4=;
        b=PaZ+Rvis06tWN0iw28ilmy5g3aQA8AiC6fcqBzdpS0/RBymwXTm/BzfhxXuZPW56yO
         xYPbsMBx7RGerB9Md7U2NHrgQwv21K0cqzx1L/JZlhKiZihOmCc156/g6b80KQOJN2yN
         vpbRq3REdj7mw6SZ3LHw3cg/pM+V7YoxRgAgehVfnVrFSziOnERRRzs+jn6t9qhmYOVE
         ki6dG1XYxpgTuKuNXr2R0Gfm5uqN+ZyVJ3txdsa3UeE1xSLnoxk0YsJHDccRhqQXVTlD
         r3AwEfS9zoX7c9EDU6L/UkGWObE49u+rDF3R9NEyRZVvfCYkwuoaNBxlxuM1ZZ34DJdV
         nFVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780996982; x=1781601782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OIEEiASgL7Q2k4J2FB54QvTgD+CBIsfvndbp4S4JS6Y=;
        b=lqR9IIvDLVq4SQqkwFkyfVhZXEFJrofjb3QPfGz7CQLSvAyUIOfh0YmrCFzwVG+mya
         YtRRhcbV1Z+hGTd6OMuCjW4Ri+ow8x2DEchuIVGAy+y9SrJpc4tFLI6Coq/zEhgdx9s3
         zrYm7+c1rh8MM9kgHuAZUDzPLqkNhHF+51gbZvDGxMD08Go+K3LmdFXsl1a5GrPZwgE8
         bW9todlOEDBLzwHvWWKM4fVwVtGG5Y2CUTMSC+gvJWKgvZqVUhARYB1kDffZ1HSxL2Pz
         QNUQuE9bbpVqawKR4DFyujDa/aLzf/ttQmCiskJp+RN1iqXdndjIJYV/vzOD5YYUwdMr
         3M/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780996982; x=1781601782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OIEEiASgL7Q2k4J2FB54QvTgD+CBIsfvndbp4S4JS6Y=;
        b=rBUkveUo2st7JQcsD2/hZ0/FjlFs+lUHVOluIaYOgjfxfW+k5FuX6+f1HnPfyRsdDX
         4eQsRU4ULxKpDGM50jFwmwmV8gRgGk/pvCirl75euwzrEGHcEgVX1Nv/5rR6Y8seF1xW
         Rlb82DiZUs6lvmYqKBUx8itc36swBQwcFSB5/wTh4rH573S3mjnSJE5/hlhHt80HywL8
         shYP+Pi2r5hxMyckzH2E+1LEsrhfXuL2V9erYbiGW75PJYiJMRLHudlT8Td/Dx/BLhJE
         EODp2lopP0u8g7tkm4E59Q5LkmV5u3SuMtsTTyEk0X4dWeNlvFFNyDuHcqg98avxmCmi
         AyGw==
X-Forwarded-Encrypted: i=1; AFNElJ9vGj8WghMRuen0UGm3dpfgIDCseqHxHJvMqysWm0mfysQwmo2z46f21R4p3B+7Vf+ktMX8ZyDclyfjx6I+LQSxYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQcEGC2Hz2aalwSZ5EiN9egFbbGlkuKU5hj0QPgLbKFYQA2Opq
	w5Dl/YluWsF2d790TIdSeVaC0jSdhSo6mISDhCEnQ1ykD2jzbqSIkMr35r69ma/CcNnotGEqzyS
	dc88pJtpADFp1D22eJiIVxZrPbvZJqcM=
X-Gm-Gg: Acq92OFblZ7KK8mnQdsm6D0pv6vlgR6LFCwuQKWA9qdyRrGq8j9IcgwhRtOY75U/yvB
	pOMk3FSKxCsIdixQjJ0dtkL+rKAOy9vky7cQj1BErMY4BUjLIMFbofzsjT+zh/rpC+Gjgrry4AC
	A/n0W8u+zkDl72NjXpHlGUqa5joMLXyhXgfC691X0hP+9faJs0ugYU6sbdoUYNcSQdeJtsnIroQ
	Gy1j1VDNARUS0vbKgp0qxEGht7PZrKfTNH+thovlDhjPSFTZaoGNAWifmuYWQ6ffk+xsm15WvuY
	9SaYiPfst2/TFchIf3RnzMSwv4xehEOojxay2u+QXniq7He49xlzYiScZnx23+UjSFDsaZn9BlQ
	i+K0=
X-Received: by 2002:a5d:504e:0:b0:45e:f302:95b with SMTP id
 ffacd0b85a97d-46030767c03mr21925116f8f.37.1780996981886; Tue, 09 Jun 2026
 02:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260511191910.1945705-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXh6YhDp7nEra3GbrR9hkhqqj15UXnv0DHeei=mj56XJQ@mail.gmail.com>
In-Reply-To: <CAMuHMdXh6YhDp7nEra3GbrR9hkhqqj15UXnv0DHeei=mj56XJQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 9 Jun 2026 10:22:35 +0100
X-Gm-Features: AVVi8CeeObicykNnGA2iNO64dGKHVIYZcZfOf-WaYEjsA4Aa85keX4ByqxRaSc0
Message-ID: <CA+V-a8ujd4CJmPkRoHfwrmC-gEA98xm3N9ANacKdHZM-6CX_tw@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-33736-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,linux-m68k.org:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5FEB865E6E7

Hi Geert,

Thank you for the review.

On Fri, Jun 5, 2026 at 2:39=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 11 May 2026 at 21:19, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add the clock definitions and PLL logic required to supply the LCDC
> > (VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. The RZ/T2H displa=
y
> > subsystem depends on a dedicated PLL (PLL3) and a set of new derived
> > clocks.
> >
> > Introduce a new PLL clock type and implement rate recalculation,
> > programming and locking sequences for PLL3 using the RZ/T2H specific
> > divider and VCO limits. Add the corresponding muxes and divider entries=
,
> > expose the LCDC core clock, and register the LCDC module clock using th=
e
> > correct PCLK parent.
> >
> > This enables the RZ/T2H clock driver to generate the display pipeline
> > clocking tree needed by the DU and VSP-based composition engines, allow=
ing
> > upcoming display support to be integrated without duplicating CPG logic=
.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/Kconfig
> > +++ b/drivers/clk/renesas/Kconfig
> > @@ -218,10 +218,12 @@ config CLK_R9A09G057
> >  config CLK_R9A09G077
> >         bool "RZ/T2H clock support" if COMPILE_TEST
> >         select CLK_RENESAS_CPG_MSSR
> > +       select CLK_RZV2H
>
> That includes a lot. Perhaps spin off the required functionality in a
> separate file, like CLK_RCAR_CPG_LIB?
> That would impact the MODULE_IMPORT_NS("RZV2H_CPG") in
> drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c, too, though.
>
Ok I will create a rzv2h-cpg-lib.c and incremently switch the DSI
driver to use this new lib.

> >
> >  config CLK_R9A09G087
> >         bool "RZ/N2H clock support" if COMPILE_TEST
> >         select CLK_RENESAS_CPG_MSSR
> > +       select CLK_RZV2H
> >
> >  config CLK_SH73A0
> >         bool "SH-Mobile AG5 clock support" if COMPILE_TEST
> > diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/=
r9a09g077-cpg.c
> > index f777601a23b9..48052e7b93fd 100644
> > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
>
> > @@ -66,11 +73,26 @@
> >  #define DIVSCI2ASYNC   CONF_PACK(SCKCR3, 10, 2)
> >  #define DIVSCI3ASYNC   CONF_PACK(SCKCR3, 12, 2)
> >  #define DIVSCI4ASYNC   CONF_PACK(SCKCR3, 14, 2)
> > +#define LCDCDIVSEL     CONF_PACK(SCKCR3, 20, 4)
> > +
> > +#define PLL3EN         FIELD_PREP_CONST(OFFSET_MASK, (0xc0))
> > +
> > +#define CPG_PLLEN              BIT(0)
>
> CPG_PLL_EN_EN, for consistency with CPG_PLL_MON_LOCK below?
>
Ok.

> > +#define CPG_PLL3_VCO_CTR0(x)   ((x) + 0x4)
> > +#define CPG_PLL3_VCO_CTR0_PDIV GENMASK(21, 16)
> > +#define CPG_PLL3_VCO_CTR0_MDIV GENMASK(9, 0)
> > +#define CPG_PLL3_VCO_CTR1(x)   ((x) + 0x8)
> > +#define CPG_PLL3_VCO_CTR1_KDIV GENMASK(31, 16)
> > +#define CPG_PLL3_VCO_CTR1_SDIV GENMASK(2, 0)
> > +#define CPG_PLL_MON(x)         ((x) - 0x10)
> > +#define CPG_PLL_MON_LOCK       BIT(0)
>
> So all registers are calculated based on the CPG_PLL3EN register
> address...
>
Yes.

> >
> >  enum rzt2h_clk_types {
> >         CLK_TYPE_RZT2H_DIV =3D CLK_TYPE_CUSTOM,   /* Clock with divider=
 */
> >         CLK_TYPE_RZT2H_MUX,                     /* Clock with clock sou=
rce selector */
> >         CLK_TYPE_RZT2H_FSELXSPI,                /* Clock with FSELXSPIn=
 source selector */
> > +       CLK_TYPE_RZT2H_PLL3,                    /* PLL3 Clock */
> > +       CLK_TYPE_RZT2H_LCDCDIV,                 /* LCDC divider clock *=
/
> >  };
> >
> >  #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
> > @@ -83,10 +105,51 @@ enum rzt2h_clk_types {
> >  #define DEF_DIV_FSELXSPI(_name, _id, _parent, _conf, _dtable) \
> >         DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_FSELXSPI, .conf =3D _conf, =
\
> >                  .parent =3D _parent, .dtable =3D _dtable, .flag =3D 0)
> > +#define DEF_PLL3(_name, _id, _parent, _conf) \
> > +       DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_PLL3, .conf =3D _conf, \
> > +                .parent =3D _parent)
> > +#define DEF_DIV_LCDC(_name, _id, _parent, _conf, _dtable) \
> > +       DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_LCDCDIV, .conf =3D _conf, \
> > +                .parent =3D _parent, .dtable =3D _dtable, .flag =3D CL=
K_SET_RATE_PARENT)
>
> I assume you can't reuse DEF_DIV() because you need the extra accuracy
> from interfacing with rzv2h_get_pll_divs_pars()?
>
Yep, thats correct.

> > +
> > +struct pll_clk {
> > +       void __iomem *reg;
>
> This is the PLLxEN register address, from which all other register
> addresses are calculated: pllen?
>
Yes.

> > +       const struct rzv2h_pll_limits *limits;
> > +       struct device *dev;
> > +       struct rzv2h_pll_pars pll_parameters;
> > +       struct clk_hw hw;
> > +       unsigned long cur_rate;
> > +};
> > +
> > +#define to_pll(_hw)    container_of(_hw, struct pll_clk, hw)
> > +
> > +struct r9a09g077_lcdc_div_clk {
> > +       const struct clk_div_table *dtable;
> > +       void __iomem *reg;
> > +       struct device *dev;
> > +       struct clk_hw hw;
> > +       u32 conf;
> > +       u8 divider;
> > +};
> > +
> > +#define to_lcdc_div_clk(_hw) \
> > +       container_of(_hw, struct r9a09g077_lcdc_div_clk, hw)
> > +
> > +#define RZT2H_MAX_LCDC_DIV_TABLES      16
> > +
> > +static const struct rzv2h_pll_limits r9a09g077_cpg_pll3_limits =3D {
> > +       .input_fref =3D 48 * MEGA,
> > +       .fout =3D { .min =3D 25 * MEGA, .max =3D 430 * MEGA },
> > +       .fvco =3D { .min =3D 1600 * MEGA, .max =3D 3200 * MEGA },
> > +       .m =3D { .min =3D 0x40, .max =3D 0x3ff },
> > +       .p =3D { .min =3D 0x2, .max =3D 0x8 },
> > +       .s =3D { .min =3D 0x0, .max =3D 0x6 },
> > +       .k =3D { .min =3D -32768, .max =3D 32767 },
> > +};
> >
> >  enum clk_ids {
> >         /* Core Clock Outputs exported to DT */
> > -       LAST_DT_CORE_CLK =3D R9A09G077_PCLKCAN,
> > +       LAST_DT_CORE_CLK =3D R9A09G077_LCDC_CLKD,
> >
> >         /* External Input Clocks */
> >         CLK_EXTAL,
>
> > @@ -242,6 +335,8 @@ static const struct cpg_core_clk r9a09g077_core_clk=
s[] __initconst =3D {
> >                          FSELXSPI1, dtable_6_8_16_32_64),
> >         DEF_MUX("PCLKCAN", R9A09G077_PCLKCAN, FSELCANFD,
> >                 sel_clk_pll4d3_div10_div20, ARRAY_SIZE(sel_clk_pll4d3_d=
iv10_div20), 0),
> > +       DEF_DIV_LCDC("LCDCDIV", R9A09G077_LCDC_CLKD, CLK_SEL_CLK_PLL3, =
LCDCDIVSEL,
>
> "LCDC_CLKD"
>
Ok.

>
> > +                    dtable_2_32),
> >  };
> >
> >  static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst =3D =
{
>
> > @@ -481,6 +577,272 @@ r9a09g077_cpg_fselxspi_div_clk_register(struct de=
vice *dev,
> >         return hw->clk;
> >  }
> >
> > +static unsigned long r9a09g077_cpg_pll3_clk_recalc_rate(struct clk_hw =
*hw,
> > +                                                       unsigned long p=
arent_rate)
> > +{
> > +       struct pll_clk *pll_clk =3D to_pll(hw);
> > +       unsigned int ctr0, ctr1;
>
> u32
>
Ok.

Cheers,
Prabhakar

> > +       u8 pdiv, sdiv;
> > +       u64 rate;
> > +       u16 mdiv;
> > +       s16 kdiv;
> > +
> > +       ctr0 =3D readl(CPG_PLL3_VCO_CTR0(pll_clk->reg));
> > +       ctr1 =3D readl(CPG_PLL3_VCO_CTR1(pll_clk->reg));
> > +
> > +       pdiv =3D FIELD_GET(CPG_PLL3_VCO_CTR0_PDIV, ctr0);
> > +       mdiv =3D FIELD_GET(CPG_PLL3_VCO_CTR0_MDIV, ctr0);
> > +       kdiv =3D (s16)FIELD_GET(CPG_PLL3_VCO_CTR1_KDIV, ctr1);
> > +       sdiv =3D FIELD_GET(CPG_PLL3_VCO_CTR1_SDIV, ctr1);
> > +
> > +       rate =3D mul_u64_u32_shr(parent_rate, (mdiv << 16) + kdiv, 16 +=
 sdiv);
> > +
> > +       return DIV_ROUND_CLOSEST_ULL(rate, pdiv);
> > +}
>
> The rest LGTM.
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

