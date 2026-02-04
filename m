Return-Path: <linux-renesas-soc+bounces-27873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CtzIbQgg2nWhwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27873-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 11:34:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C1398E48E8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 11:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 812E73028B06
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 10:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1633DA7D4;
	Wed,  4 Feb 2026 10:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKIE/N+N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD903DA7DB
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 10:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201142; cv=pass; b=LFnlg5yfA8zwPMFKuOuE9A/HpXXSxCLraHoEV52LluNlH1H9gMJQNDDBeNMIE2mwQjg3pLdRdUokFOyb3ezEDiEConwj8y62ZjsFns2WtYzXxQ2L3jN9N8iAm9jUSQEskb2GXkvHdydQWYA8dPL6kcECTzXvnzYiLpY1qBrGbUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201142; c=relaxed/simple;
	bh=Sm8qaURT/bNzNTIXl7RTPlO4KJWd267f476QB9Bhcps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMepdq9Hf3xrdnq2vVG3nWM9JWvRsDqVtcMqRdmpGF9DRDmECHWaRzBaKqR6erPRa7SFoVCUxemioP7utjk0CxcPQUrF6lH5eH5jm6u4Kksuk0izG4WllSZg+l2oEcqrXC86buhOlk8Pa69fLITl20qSytNvXspSxKIcTOSmQX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKIE/N+N; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-432d28870ddso366577f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 02:32:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770201140; cv=none;
        d=google.com; s=arc-20240605;
        b=lbKZzP38xf4yShPY154snMQSDjeQ9U3uHEU+fpsfG3SimigPQVjUJ3a2nlfRwuHtAU
         sqVBEk6ddRZjFHMDn48rFhrpMmYMuc2Vbs/H6qkh4EWMRhyG+4fBcwJNJjdwW/cY8l3+
         nr3ukit7YJVUXmS43oOfTJZ69Kv1vR988MDBbBU5k6MKYMKtQxf085uEF0m2xfTXYNOr
         xUVn5z/Zw5EZ0c78NoeAndd7dnPazOdvLeRKi6rBX2RnirqXjxWpew58aNVmmYLyvX1N
         //jjDRWUYa+VvAdkUAZX6Zh49MPBHa/moc9BskOdBUdI+BjN9rf0A2L1mDasYV4X0n4u
         ElHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NY89OiYbksVQWQ/hKbKDMmcGNiiKCGF6eM+GGcG2hZU=;
        fh=/lyu2Px3qfgOwncsxustZSwKvx08dEuvcXpUPzBSq1I=;
        b=dMK50Z42Ek1SZY6D/JDepvYK+VOfC8iQLjjbyMgPdrz6aiN7pmrwSt30BTV+Rx6Lr+
         r+/AdbIdDoXrKz4xqOAT/BQcpNnIBjT393RupfRKCf+UJLxTICd55CnRApFcXDRJse9B
         uquWwiEwBUXceyMQvZAquo91D2oq51yIbS2j3OwtnhaY1C957IVDfswZAS8b+NOPpTKw
         sg3d6xtlXJwfgMq18jFy1mmwXpUDHvvqGx3NvnpM2x8KI1qOXMQEEbU+4gri0WpLWZOJ
         4YRDmy8zGB9BKES2KwNrh/JzAPpDWpr+JwPOVLZpo43lPTNE6e9Rge3/DhbItAgAF/wW
         JIlA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770201140; x=1770805940; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NY89OiYbksVQWQ/hKbKDMmcGNiiKCGF6eM+GGcG2hZU=;
        b=ZKIE/N+NTh5B5xcqggw2lV8dvxqWO9Syke7hCt304k8XBclw++gb6jep0YofRtrPT7
         32UXGFoBbkz2/nqSbAPXDx7O5LekVRCSnLYQpp3ByRy0ictfFUEYK8cS4HSdWztTbM3K
         4BlSiPB75Qv2ffvnMrN8yBfC0DgNpsO3LlOARksk26xqTd+pPl7txXgy/JsT//gXQ6Tw
         hWuj6kEuswS68ng2lR8XM5Ei0HjQqGMiCllthZHb6BnMBAZNQXRXrtZgnRat4R6aDMGw
         MY4HASWNE8C2xE4MAxdrR5q6MQGE3Kb8uwV0hFvApwtHNB3s6bqS2SZISrp4Ulhvv2RJ
         QJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770201140; x=1770805940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NY89OiYbksVQWQ/hKbKDMmcGNiiKCGF6eM+GGcG2hZU=;
        b=vtjgqDuKf1YZRhuYHQB7fYVBOBG5+XvJD6e4jjwjZhn9hl3PlYbuMikniHwltd5PIL
         2Xa3Mn7C3EBVjTTSLq4wDdXTvCd0+LymLceKHYsCXpzw2COfQcs8GJbdZ95v7CnD8A1e
         s3KQIixi8CLpy6dbkMraDhYO3aJlpVVgT7r865+N8IrpR+KVq32l8eI5/7Jf01rHiBzY
         yEAQvQRLDfbOEeoprvRD2U5Jcw2V6VZAgSgxwdZ2RHFka8vNWfOZPpsGEBe/hKOKSrk1
         J++A+LAtJD+a3fKZbNVeHX9FeByixS/gopW8N+uc+aNnHNaINbvbz8QDzT1IdifW8b2q
         2+vA==
X-Forwarded-Encrypted: i=1; AJvYcCV6SRn6pU7BB5TTkaD34RtfJ5Oiv+e9XFks1PLrFSp7tFToUQU+KQrv6AhvMupYNmRolQIhYg2eiHNb2pGXK/MLLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT0TRaqDLCAXIT7ReN9n00KxHHU+0ABjBLlzOfsSauj5e24MZS
	/suUb4vUjqj6eMnIYQKVCm2pJJC2NiGea68BB3dVFvUprq2kXchgDuzqCRVTOxWryuHQoN/lXMd
	CMaFvO3+QJ9KJ7IO27dvNKuv4qQvlGJI=
X-Gm-Gg: AZuq6aKI6Zs8JvCxfciQWU/F/mdprcL/EG5DpyoYhGLLUrtHJ6JPmnmM6nSG49atu5Z
	QI2IN2V+L2SC/+aGI8TyghOnNPH9eRee0OmD6lm4A6uupLHCYX7SzB67RVCBs52fNUoRhfMFQE+
	WHQL8iDhERItYdZcdCTos+BMCv8i2oEx8af2+d4os7tzW+kbEGJYgqBclSQBu9Tl7K7LRL2tAPT
	cfm8wYKLMfK63H1vAwLA0c3t4AbSayr23VnTd3jn96cAZPvTVEWcRKG6PaOQ3xjwxSJdoPLNPl1
	ebAquXQL0N6Ub4YNOPdZSHfpY/vLaho4spSl99gPBsl0HUFNjYvmc8cvgoY1vBgLmr23A7KtQnx
	zsq6Ngr2No95V80YSw4y4qkMk
X-Received: by 2002:a5d:5d0d:0:b0:435:e3bd:5838 with SMTP id
 ffacd0b85a97d-43617e3c9bemr1592520f8f.25.1770201140079; Wed, 04 Feb 2026
 02:32:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260203231823.208661-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346474FD45870A1047FB1F98698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tsUeZ6PsVxm3jHgS0X2wKRtuyuUWOfpp1r718mj_ay4w@mail.gmail.com> <TY3PR01MB113467F387FE21FE26DEC5C0E8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113467F387FE21FE26DEC5C0E8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 4 Feb 2026 10:31:52 +0000
X-Gm-Features: AZwV_QiXOY08PUKzdYM9ORKuPlZ9BqwTbVjuTiQtXe3ipJ56-bm7uvhZ9xKhXxg
Message-ID: <CA+V-a8uYBYM-VnUXQA3YwEMn1NzWLMkeGYgmW2jb8oo30aPvcQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handling range-aware
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27873-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com,vger.kernel.org,renesas.com,bp.renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,pengutronix.de:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: C1398E48E8
X-Rspamd-Action: no action

On Wed, Feb 4, 2026 at 10:25=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 04 February 2026 10:20
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Thomas Gleixner <tglx@kernel.org>; Philipp Zabel <p.zabel@pengutron=
ix.de>; Geert Uytterhoeven
> > <geert+renesas@glider.be>; magnus.damm <magnus.damm@gmail.com>; linux-k=
ernel@vger.kernel.org; linux-
> > renesas-soc@vger.kernel.org; Fabrizio Castro <fabrizio.castro.jz@renesa=
s.com>; Prabhakar Mahadev Lad
> > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: Re: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type handli=
ng range-aware
> >
> > Hi Biju,
> >
> > On Wed, Feb 4, 2026 at 6:52=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas=
.com> wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > Thanks for the patch.
> > >
> > > > -----Original Message-----
> > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: 03 February 2026 23:18
> > > > Subject: [PATCH v2 4/6] irqchip/renesas-rzv2h: Make IRQ type
> > > > handling range-aware
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Refine IRQ type handling to explicitly bound IRQ and TINT ranges an=
d
> > > > dispatch based on the hardware IRQ number.
> > > >
> > > > This restructures the logic to clearly separate NMI, IRQ, and TINT
> > > > handling and ensures out-of-range interrupts are ignored safely. Th=
e
> > > > change prepares the driver for adding CA55 interrupts into the IRQ =
hierarchy domain by making the
> > interrupt classification explicit and extensible.
> > > >
> > > > Signed-off-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > v1->v2:
> > > > - New patch.
> > > > ---
<snip>
> > > >
> > > >       if (ret)
> > > >               return ret;
> > > > @@ -507,11 +528,11 @@ static int rzv2h_icu_alloc(struct irq_domain =
*domain, unsigned int virq,
> > unsigne
> > > >        * fwspec->param[0].
> > > >        * hwirq is embedded in bits 0-15.
> > > >        * TINT is embedded in bits 16-31.
> > > > +      * Check if bits 16-31 are set to identify TINT interrupts.
> > > >        */
> > > > -     if (hwirq >=3D ICU_TINT_START) {
> > > > -             tint =3D ICU_TINT_EXTRACT_GPIOINT(hwirq);
> > > > +     tint =3D ICU_TINT_EXTRACT_GPIOINT(hwirq);
> > > > +     if (tint) {
> > >
> > > Is tint =3D=3D 0 does not happen??  I mean GPIOint =3D=3D 0 is invali=
d??
> > >
> > For the P0_0 case, tint =3D 0 and hwirq =3D=3D ICU_TINT_EXTRACT_HWIRQ(h=
wirq).
> > In this situation, we do not need to enter the if condition.
>
> You mean, no need to do the belowcheck if tint =3D0. But do only this che=
ck if tint > 0.
>
No, I meant we didn't need to re-extract hwirq.

> if (hwirq < ICU_TINT_START)
Ok, to do this check I will update the if check to below so that the
above check is done.

if (tint || (hwirq >=3D ICU_TINT_START && hwirq <=3D ICU_TINT_LAST)) {

Cheers,
Prabhakar

