Return-Path: <linux-renesas-soc+bounces-34202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DpnJNEjyM2o8JgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 15:27:36 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 309EE6A07E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 15:27:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LCE9Ut8n;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34202-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D09AB302E40A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 13:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DC9C39B48E;
	Thu, 18 Jun 2026 13:26:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E520E3905E0
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 13:26:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781789197; cv=pass; b=iwqJYszM1pL5H2OT2Is1WKEtJ5hpqcxFK16u9a+9uCCEcO7ag2gKWLMWv9edYPa0BpL8KopKi9FjsZODQQ9gbagKnMcj0bL62t0GUbHXNX2KTQRfKSUoImlqZjUFQd4k5mwWCXc+RalN34TfNHdpM6aMCIZv20rpnt/YsPHcnI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781789197; c=relaxed/simple;
	bh=rwavQHNR5vCqgAC2vGU4xALCWjqvGo2uf7/b/yg58XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZkFmSQmaZ56v7nqtYkcS1ak4Gny3/OWbjDUzjs9Fdj/vCGS0CrR01rLC92sGSYeQBJgWrV1cqpwCvTe8bWNtAf4vBNtywaFomKQD5x/5CuPunXMat1G2XqL0kI8FDZDj5CcLheFVBcxx4TzCPDi935i6wZnFOPhCo/NPRn+xGw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LCE9Ut8n; arc=pass smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4645995069bso394958f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 06:26:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781789194; cv=none;
        d=google.com; s=arc-20240605;
        b=kciJlqyF/Z2JfLe89MD9QMKyU84Fubt9Uut1ufaIstWKKfYQPU10dg9K8hwfSYnjTg
         PhBfJYpoi3bkHk7MAJZ4c5Aih21qLmDKPVeK8dRjDX15G6C/pZ2Pc6hrEnp/exfsF4g8
         UstXpzLmNAM4TBWWob/Nohx2o/ZyZ01uZkhZhisu4le1BH8Sk5ULAeGC4CRPMMjC31S+
         iXBopYhwhL2EVpP2v4b69wIrdnGYTUIki6H5YyPF0O1C8u9WzkYVdVGhymhuEoFkYi/5
         hIgqipTcDVMwDeXdLo08ZW+9Ch+NN+MME0VVU4M9wiwq88Zd9y0y1MkH89A9VHauK76c
         kh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zPwka4rh++Oi4jW6U/0Wwv1+lcJvYpPIzYXrVw3cc/g=;
        fh=V3xM1A/HmxSF/6nHpOh1CbrNpoH85EPSPx7frTpRK0c=;
        b=adK+EaifEV9+/qtZfprj7eFgUAJg5j9lsX+pK1dih6Y61E5zwqPZljRNobSzVK7cpQ
         kCDeGxnCvbabGiGJwBVGN0Na0DlkGOWevSTckmoRMxAqpk5U9RkG/TZqkHwanDEU0Tu8
         rYfbAc6t5fCg4CoI1BL7g+wIBgAHm2szJotP9lIaT2e2pMaUcLhPiFkIb1aWlY2v+79i
         LMKW8Xri/RH4Y30mkzh1zWt/CSpibLfpkcKIsKo+oDhdceZ9pAXUMzJFiJPThpwjxhKS
         HEFG516YgXzZ5O4RYYRF1IXkwvoG4YcAypHktCgq/40hgmaJIauVd6XXNzVl1n1F12Qf
         PCtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781789194; x=1782393994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zPwka4rh++Oi4jW6U/0Wwv1+lcJvYpPIzYXrVw3cc/g=;
        b=LCE9Ut8nr5XQKA9mqz0RAx1uXSQ6iSs9JYchrR0t2lU6Rm25vLWFv743kzSDdlsSx4
         szJSCkKdQvMlx2xZccpyTWCEUTbQ/sliF1So2SegEOMtECdlypU7Yv/OEGJqgaCSmOJW
         5qq6tE3AZN0HeJYE3WSysGISHE5/BCV4pBOIDO04l0Fem6Ovqoc3QFMW3zKAFCvNEsqA
         25DEgTgSFD3Mxi2VYHvSBzaXH3eRGjFRsgBamwWjL8ASGJSfi0x2o+CI1z4TeBRwWBCx
         bBgWyeoXgf8+Sr4MXqU7H0A/ZXhR5Nbt24dUhrjaZFHuMUUEDPy/wlkiWVB5/dYsCaaB
         xmSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781789194; x=1782393994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zPwka4rh++Oi4jW6U/0Wwv1+lcJvYpPIzYXrVw3cc/g=;
        b=nqrQmgagwMjCGMg1CowUzKrESQw5KAzw6P3cp1mA/QpHssmo7V9UspTzMQMlsKrkpC
         gX/CTizHaB3/3g8DkpaJoQYBRVRspQdZ1k3B6iE7RQQxhxorEN6/NZrH9J2NEeYc9/Nk
         ubMFhgnCOyTaC+qMI7ApLbk3WrYq34JU2cASapAfiv8BrMegwSljtRwE06kSrLJ3atnR
         kKiEsu2d/aNG7L+QvGUB+Gw2aAki/7dvlHyCep4IqmvBIKl9l0zQ7UgWu9y0P7vzBL1w
         VukJp/qJ52UY4jhRvnIVfy6VdxSCLXnFhabUhWGB8N17HuJHo6MLdtrXMcacbSRekeou
         DSdw==
X-Forwarded-Encrypted: i=1; AFNElJ8dH1xbzZOB9PMq+Dyh8Z2eJ9zgCWeyVQdZ3gsrHF0yxTsF7HPlJ678xwYYdBjnYNBHBd2ZRy9HQL1uLrnew3lLJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDGB8BcMnWcq9l1KZpf/3AGU2g9QSV059jysqk3LQq6pYOhrxC
	myBlxykxt8PUlTLhRuEoDgT8AD3t1djgCsv9Krx/zZeLG0PT4deEf3ppIl2ZZclw7XVZsEjQ3k3
	3mkLf+110NsoALEaOG24ufB6vNwpQ1Rk=
X-Gm-Gg: AfdE7cn+/LPtZ3iDPmMZrI/c3iVzWUF4pI3AVwnrlzILDkQs6m0BavwGNBsmtyNpb9V
	fZEdjTxlKGxXhWzwnsRu+8/BxwGLxrCipAYYc8NlNlDauA4SWjPWF1bumaEFM6SfQKLCkK/MCz5
	MvPWzfaGwbRp1XUlLM56pnj2SlFbHvulSyrv8DDlSeXE1J/650ypnKaqii6zCGFTIVAlobKjlAW
	Gx6KQnpzQNyeXLJsWgIq9fcBmt9iTxuUPuXXLUYCW8dadaLedTb8nQ3oSqcDsK6uNZ2OdJTM68Q
	976tGZRl7N0XsF9YIh6TbrQIJKUpB5cjN+6Vb+zakguxmXRGl3JhTXbzw9r57dFvojPYEgiB1K8
	VTtiwhnXL1rEG96M=
X-Received: by 2002:a5d:5091:0:b0:45e:eec6:500c with SMTP id
 ffacd0b85a97d-463ad9aeb84mr4495060f8f.39.1781789194279; Thu, 18 Jun 2026
 06:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-12-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajJ_qwXhJbKB3Xli@shikoro>
In-Reply-To: <ajJ_qwXhJbKB3Xli@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 14:26:08 +0100
X-Gm-Features: AVVi8CdXToo6cMOBg12R_0ExFj-dio5Daw5TR9InAuTm1Ov-5-tnr0T-5nBIcxA
Message-ID: <CA+V-a8uhjm2Pmgb0VNinHJXKhxfbXJvqFMxG0rWeaBdWnSTWrQ@mail.gmail.com>
Subject: Re: [PATCH 11/12] rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for
 register access
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34202-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email,sashiko.dev:url,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 309EE6A07E7

Hi Wolfram,

On Wed, Jun 17, 2026 at 12:06=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi,
>
> Sashiko found issues with your patch. I curated the list and left only th=
ose
> which I see as valid. Please have a look at these issues.
>
Agreed, I will replace the 0x3f with RZN1_RTC_SUBU_RTCA0FX macro in
the next version.

Cheers,
Prabhakar

> Thank you and happy hacking,
>
>    Wolfram
>
> > Thank you for your contribution! Sashiko AI review found 1 potential is=
sue(s) to consider:
> > - [Low] Incomplete refactoring: open-coded logic remains for RZN1_RTC_S=
UBU_RTCA0FX
> > --
> >
> > commit 2e16f66c80c483d619655d20fbb859a42e9d1b6d
> > Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > rtc: rzn1: use FIELD_PREP/FIELD_GET and GENMASK for register access
> >
> > This commit replaces open-coded shift and mask operations with the bitf=
ield
> > API in the rzn1 RTC driver to improve readability and match the hardwar=
e
> > manual.
> >
> > > diff --git a/drivers/rtc/rtc-rzn1.c b/drivers/rtc/rtc-rzn1.c
> > > index c7ef3c81180f4..9f9cf9882fc49 100644
> > > --- a/drivers/rtc/rtc-rzn1.c
> > > +++ b/drivers/rtc/rtc-rzn1.c
> > [ ... ]
> > > @@ -306,7 +312,7 @@ static int rzn1_rtc_read_offset(struct device *de=
v, long *offset)
> > >     val =3D readl(rtc->base + RZN1_RTC_SUBU);
> > >     ppb_per_step =3D val & RZN1_RTC_SUBU_DEV ? 1017 : 3051;
> > >     subtract =3D val & RZN1_RTC_SUBU_DECR;
> > > -   val &=3D 0x3F;
> > > +   val =3D FIELD_GET(RZN1_RTC_SUBU_RTCA0FX, val);
> > >
> > >     if (!val)
> > >             *offset =3D 0;
> >
> > [Severity: Low]
> > Since the stated goal of this patch is to replace open-coded masks with=
 the
> > bitfield API, should the remaining 0x3F masks for this register be upda=
ted as
> > well?
> >
> > In rzn1_rtc_read_offset() just below this change, there is still an exp=
licit
> > mask used when calculating the offset:
> >
> >       *offset =3D -(((~val) & 0x3F) + 1) * ppb_per_step;
> >
> > Additionally, it looks like the write path in rzn1_rtc_set_offset() was=
 missed
> > entirely during the refactoring. It continues to use open-coded logic r=
ather
> > than FIELD_PREP when constructing the RZN1_RTC_SUBU register:
> >
> >       subu |=3D RZN1_RTC_SUBU_DECR;
> >       subu |=3D (~(-steps - 1)) & 0x3F;
> >
> > Would it make sense to update these locations so the bitfield access is
> > consistent across the driver?
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615154805.=
1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com?part=3D11

