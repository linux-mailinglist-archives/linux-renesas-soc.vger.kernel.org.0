Return-Path: <linux-renesas-soc+bounces-27271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAiaBjTtcWk/ZwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 10:26:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 838396480A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 10:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9A4694E6E5E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 09:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1D032BF26;
	Thu, 22 Jan 2026 09:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g6PsdQEH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31E632FA32
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 09:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769073562; cv=pass; b=PEEP9eGdV/Atxs9qnX3jFgBMZLkMzPzjJXpfrJuWQIr6fhXb4NZtmHQIlc3G+shX3TmuoAktQ4oQkOI0I54BvKUpRHwCLDtdCIc2i3OYt2BSGUu3cNtJFsAdIfqWcW6tXMkAyH2b+w5cBTeqhrfIYezO2Zm3DgQ+UJdjhdTjNAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769073562; c=relaxed/simple;
	bh=izbj3WET28y4LWQcDrid6l4TdAD9PeuiY/haLWqH4hQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FyLo2zp4E0DDGyWj00Ul6Vysi7tnrcJc/NmrauOchjSS0I5M5byPfxOFfGe7bvzW1WX4fPChnAHnnG2NM8k9WDGXNTVfa+zq9qckTd6MCLM782sNzM6NJrruOcKFF6v6ga3AILZHnKUadZ9nYVuky21gI3e3NCHQJGKz/N+CM70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g6PsdQEH; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so649416f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 01:19:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769073559; cv=none;
        d=google.com; s=arc-20240605;
        b=eTNDsqfNGUAdiJT7Uc6lIlFzEXwoW32WBoSF2nh9N+Ft1TpGCZ/vNT6DvVj7wIqVB7
         GskLYtt+O8HKt0HdAIHrXH1Pxgfp2i4N9riBLCXm5yB6x/M21LYMMZsoPmdMdE4snDMx
         Q9IOuAj9xMAiXGt2VhxLPuWk+GI1Tu1En87NlLYrlRRzQB3ivjF1F3NXOzakg8u13rWm
         3iUfVhfHvRalfZ1ktYrBHcqG3Iv3c9RApFfuw4aodiIAB3a8qRhBoCEz1VJs/X585okh
         DyYN9pRJ+mg1fG0/Lrh6tVtTR9qF0qwjH3kn93jZtJb/zMDYOq3xWnl6+sM7mMoodEKs
         dl9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=izbj3WET28y4LWQcDrid6l4TdAD9PeuiY/haLWqH4hQ=;
        fh=BNxUdFM1CkIePHWjq18zSh8ev44wkMzJfOkj8csWaLU=;
        b=Wn1dZfopT+wX3n4mTko5+1229sv9QOi5a33cre8+NrsTtnoVGGQe+j8Z85BzeU8ig+
         AM2dxS6khSX4B055ursLErQ9RwHg0UaLNFzmdf317zDlCDoINFmjaP0r9aoUn2gbDVFA
         8hTLCQv2mh5EHk1oqci4cS/EuWua+EoETksiyB8t7TEAg9k+coBf21LEHL52aVkwBA1I
         81JKOwX8AaxfIR7zry9tubHUK3JlSbZ/q75k5FpWOAk1MvFzCuudi1S087dYyYC5h+8M
         jiGy08YwgQ8eCQptp4pneEsqwm/xB3t6a6BLyWhghHxrNBvfmjQriLNzQ1IhWbTUtO3X
         RpSQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769073559; x=1769678359; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izbj3WET28y4LWQcDrid6l4TdAD9PeuiY/haLWqH4hQ=;
        b=g6PsdQEHpriIK5tICVAQKkR1FcsI6e2u+lTKrHxQjDP0AlqbDnvUOev/MGtGxN/sWn
         OLbzhrfXrZLFqK3vaj17AEaLk5HjR2Qy9z9VJL4qiDTDyRlrCUpfXVekTmZZ3HBqts3u
         UQ9+rRf1TMfxvv5niKMBYAvCf5SwUw8az5t3UQJMShGmOT2dXwppMVp2ngBLJ9jv8Zu7
         TVeXOGbJOn6a86lyx9DG17vnO93PB5UpS+RVib73nCVnrYJx54fvYoKwf+Fb+cJG4j/7
         BOmvxeWSANWk0E7oaqN9pfnnwmze9zhIAGQvA9V4ETgIK15Vt50bt+/TYTe6e/AWdxnJ
         6bhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769073559; x=1769678359;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=izbj3WET28y4LWQcDrid6l4TdAD9PeuiY/haLWqH4hQ=;
        b=LcMTVcGnLAvURBcJzaXWsRLnMpADHsl/ALcB/vE4iAEa6/6ShT8wm2/HAM8jl8+8RW
         qsoolkIsmGlKJciRouHWeQltNlQaH+G7Sp77iYEVcIccKqNrwuWoWy5K4aQesjK9vXtQ
         4r8iVOgNJHnzWWXuYFao/ikpzb0IryrtSgwaJUbfV7CKhKT3nG4+rWHx6arWAwUgL2Ar
         /VSmirOAgqa1x+HvT91xauZBz37wy4FwoaTpsY+U0lAbTaBkNb8A3Fst2GpI5sykHu3q
         R9xxPqwjMkUzlwMPlko8KwXmjZXcvxx5GfIGgszpExTaIjiGems+yLR7AWVw2CAXhsn4
         R20g==
X-Forwarded-Encrypted: i=1; AJvYcCUhoOQJhuXKHyBcTibVJ95YpPGqyRpjIrZEK/dSSKPjUro3uFfhg36J6WqOEJVlAmy//FM4JEzBfiZL3/LqTkGMgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx68bjR/L6bif9MjJ//3wolCNhhVLlvoRcWFX1jI6zXU7ZI3TJs
	uDotHKbVsb0+OGtKR1/CnbYthisQtIux4QVbx0qovGE2+P90ZiIEs00AVG4WEYORm4d8tc23gFq
	7tbB8UE7J8fmN9gqLA+4dY9gyrPJ3MUAN1VrwARmFLA==
X-Gm-Gg: AZuq6aK+q5pkqwXjX2esItxLokaDj95LsBsgGWVSc6L+YA+1OoVnM1OuSbc0OjSmp7+
	G6obYFg9OdoXXdv69u/Pqf52war8q6FRC0YDakLDgxKeHFaYM6f5KSscMgAkdZGYt4oHcZVKJUP
	/aFs9z4qXsnKisCvT5Vg68XSN/gWwxJRRwrjdQv2anYR+IeX+pT4pA4AQNOMFS+FvA9RIdqchqd
	kq9vbmWGIwRrqgbO9/5vQu8kymDt7QYV0ZEWTrX2/0smkwrUwcMuxk0cCnqW4zsp4Q5qIfqzcTL
	uAP80PZcenG+FO8/WQ/HRtxTuXhbReX3nNf58I+uIUml2iSRZf9EziNaZw==
X-Received: by 2002:a05:6000:4007:b0:435:95c9:687a with SMTP id
 ffacd0b85a97d-43595c96c1bmr12520564f8f.4.1769073559154; Thu, 22 Jan 2026
 01:19:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260121150137.3364865-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346DB069193A06BB45DC62A8697A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346DB069193A06BB45DC62A8697A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 22 Jan 2026 09:18:52 +0000
X-Gm-Features: AZwV_Qh6VLpsatMJUQywrFMZosIlLLpEhmuar1Ryzx1zwGDnlPkUAkIk4G3Ym_M
Message-ID: <CA+V-a8vGJeoeDig+7FARuzF=qczFRE4TNMHqtW0ia3wzRWrmQA@mail.gmail.com>
Subject: Re: [PATCH 5/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and add
 SWPE trigger
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
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27271-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,glider.be,gmail.com,vger.kernel.org,renesas.com,bp.renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 838396480A
X-Rspamd-Action: no action

Hi Biju,

On Thu, Jan 22, 2026 at 8:20=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 21 January 2026 15:02
> > Subject: [PATCH 5/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and ad=
d SWPE trigger
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Handle the RZ/V2H ICU error interrupt to help diagnose latched bus, ECC=
 RAM, and CA55/IP error
> > conditions during bring-up and debugging.
>
>
> Just a question,
> If the irq handler is meant for debugging/bring-up, can this irq handler =
activated only for debug session
> instead of unconditionally enabling it?
>
The IRQ handler is registered only when `irq_renesas_rzv2h.debug=3D1` is
present in the bootargs.

Cheers,
Prabhakar

