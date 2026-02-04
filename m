Return-Path: <linux-renesas-soc+bounces-27902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKjNBbBvg2lgmwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27902-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 17:11:28 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6646DE9F93
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 17:11:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C666D312BFFD
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 15:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DE43ECBFB;
	Wed,  4 Feb 2026 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoQ8nit1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586093ED127
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 15:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219906; cv=pass; b=U84ZLFEmw0LuT44LUKcEaXtjOl7WxbVzla/FVyD3o7+32nB4waGoEVxZ3HIBqZpR7o+l4p5O1DzXHmDqShzKaKD+sYGfW96zP0hZ3WdCypnsZN1DwFrfbuJaLc9Hha1vWKA8S84Psmo8Jo+ouVByLRxoJBMxNCBES45l5ocWyIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219906; c=relaxed/simple;
	bh=GCT2Bno+Rq2Gwp59AkdhNo+pX5kZS9Q8hp2AK+rH2Bw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txuoFKawDQF4xOqBU7rzD6VYsGCc81bqiBiEVcf7aHZMjgMRIY8152truyiUs8Xt4JDq1J8KEsldaIuBcyRkfL4h+PLBj4nG2tgqv9MgksNSsLss5bHJOXqRFW3u+5MleEbsoYP/6Q0+uO8TmHOcqqyLBGmAvubI8hBC+79JmQw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoQ8nit1; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso59543935e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Feb 2026 07:45:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770219905; cv=none;
        d=google.com; s=arc-20240605;
        b=SBibkVI4aAbR+xFyInOj9PSU7770WMcZixjAjYBIR7EzroYNY+T2nfEeSYRDYf4zRH
         W4zhMP9/jx6vpOT9U6mPVHUcKzCC9bB3UWlWjPu4/L6H/toYHicP7Y72Q/3aVHhGhQ1J
         YCJfmpUKUKIeft081KK6MO2J3nbnYPXNneewdg4U4TcrYPqMOh4BQvS+2hMhTlPSV3I2
         QUvy26F7i4n6qhV30v4VhIdHUuVQUiynkuo187eAqoCH8cTV0R8ZPaQrgIZQ9AIDpDWT
         VfWNX8sJzq9NLETHUUgW33pZolmqac0kI4nlgT2FUaEg1EZy/BaHNasGVZXEwaFz78al
         K7xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mSrQSB6/X4VetkZoSXlB48QVpCmm3NNzTkFhivd3s0g=;
        fh=AE2XRgYKpB+S0TsP5+BWRXMqa5anYy5dQRanNbmSQow=;
        b=HZ28pR+VYChm3jlOjX1bFYzJ5FCSPfNTzO+acJLIgGrRd2xX9GDiWJJIXxBsWtDhpC
         zxjAq5G4J/GRyJDZakCTnsoXKte2daNl0YEzNyOrDddq4jpixLu5FB4HR8oju/4rFHRe
         2DbPKn7KN5WQHo571CEd6qhlzNy0KOX5rnsE+BzewdjF++8ciwDd6KpncuFXLONdeIHM
         WlxNDQ9xcmEVxOdIdJRqHJgrO8u/w3G6yTTsyS5B8CvISSBvXJ3ZFqdrcm1GOi2GPfeS
         kkqBxIVX400kxeFV95veRXXqenQB/RWq76tC9kV0gBI0M6XJlA0u/i90h1tQjtfwZu3y
         Z8ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770219905; x=1770824705; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mSrQSB6/X4VetkZoSXlB48QVpCmm3NNzTkFhivd3s0g=;
        b=AoQ8nit1F4tQuBv5Gyafy/z9NL+rGXgdh51hDymPYb/jnEdFIu9wL+cVeCL6qGWRqH
         QPHbQHHBsKrqyp3ksk+axLGqeV1oUQoR+cMEnwHddxJl9QtUz1/g4r8oMuZVQw5yhKYg
         X5kb8+NqLibhycwztFdUuqKNuimbmlY3Pkw5jGCySWo5lbtkA9ryEbMKKlONm7oGerZv
         Yu84LpgahuvgQI43PJ86KAecuX4+PSi3gYhKcNIvqs2ts6NeJtIL0XXamV5W4Wq2Z3X6
         lL1OdYjBKFS3fje6zLEHc4TpBrua5arHyq4LcImG1bWuXi/usomYl7BJmDGDbdPbv1FW
         N50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770219905; x=1770824705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mSrQSB6/X4VetkZoSXlB48QVpCmm3NNzTkFhivd3s0g=;
        b=kY6rFq8mBllvyceMLCY/Za/LeE0VsxaAc1t4dpteXkSYU8WWrb01GgFi8cGPLXN3W/
         eo8bAdQQLLqDHqFcPL/bEjWkK+1WLjPek3qxYumzvcHmqVwBJ+e3z6QEC+fOs5MXoAQM
         fwNo3sPr8N7DyTzUyXTSHHyYE9eOaikdNZ5xO8VO8nlhtV0VTIDUzc3QIwJcSUTY8+/7
         pd4xwGQ0kLNFGnr0IJn6hlEJCUbKtge/muglSjQLJfBJvMlUBjLb/MKw9HUdpzEKznjJ
         Fr+/WskHcqB9E76iRQkKSi2gW4UNYRNLCthgxXMfXXhJT19LJfjB2vOhaLrZclt7Q+IN
         M01w==
X-Forwarded-Encrypted: i=1; AJvYcCUGY25YrjzPfaMKRIIrIl2hY0GLq1S6BKkYUm5C04VvdeFPxB6a4YAfL6rRYLSFSTzbv8dzOMFqxNo58uVahVz3MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoVkfj9+sLYWRBzfxCuhv7wp7C0Qoz0ZieDETpJWeyqoEh87n+
	nQ8up69PrVzVid+wr0+6+lGSl8Vexoc9EJxxa5NcUFWker6UZr+Nm6QsZ4ilCvWsk5VPOUEq5Iz
	41lZaYIvzO7BVjmHU8TzBp4gvYhUQWgc=
X-Gm-Gg: AZuq6aKDfMwWJdKxwQZmlGK5QRL1Ar+4n9PjOdJietHrdbg7TeVDiPRxgzyewM7152o
	nklJTbdu7rz0xuIqo88at3/CoqWToKjROig7JDyHEjn44qX5MC5PiXrFP3fhqA1X0uj3KplML62
	wsODqB9eogTSPCNOy4iJkAoZlHHucbiUv2KsD2I6RT1x/UoDBma4Vt4sFueRZ1MdrFlFBFsNNB1
	NyqrsTV84Yd3S4Wbvhzf2iOkVe9cbGHmDRld3HO5vU4bWqpnOe295McI9VMXlgjf3DTd3B1LKZU
	yqOtKkU2NV3Q/o0GccAT4zExkjLGwBd+aKSQetFU8r+GjvC6Ai9GRa9SmEDUDP7NZZtTc5K8KuV
	kqBL7ZJjjCXKXeg==
X-Received: by 2002:a05:6000:2303:b0:435:e486:af82 with SMTP id
 ffacd0b85a97d-4361805d41emr4798808f8f.45.1770219904344; Wed, 04 Feb 2026
 07:45:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260203231823.208661-7-prabhakar.mahadev-lad.rj@bp.renesas.com> <87pl6k1qlj.ffs@tglx>
In-Reply-To: <87pl6k1qlj.ffs@tglx>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 4 Feb 2026 15:44:36 +0000
X-Gm-Features: AZwV_QiBvSzbAoSZWZXas_qhET8mjUkmheO3H_k-dgH0BeLpnraTanf5U8CXuuQ
Message-ID: <CA+V-a8tyB-5c8MoySoDDgmMW-zm5N3OhfMrcgjuKk5p1rr4sAw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and
 add SWPE trigger
To: Thomas Gleixner <tglx@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27902-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6646DE9F93
X-Rspamd-Action: no action

Hi Thomas,

Thank you for the review.

On Wed, Feb 4, 2026 at 3:22=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> wr=
ote:
>
> On Tue, Feb 03 2026 at 23:18, Prabhakar wrote:
> > +     /* 1) Bus errors (BEISR0..3) */
> > +     for (k =3D 0; k < ICU_NUM_BE; k++) {
> > +             st =3D readl(base + ICU_BEISR(k));
> > +             if (!st)
> > +                     continue;
> > +
> > +             writel_relaxed(st, base + ICU_BECLR(k));
> > +             pr_debug("rzv2h-icu: BUS error k=3D%u status=3D0x%08x\n",=
 k, st);
>
> Why hiding this behind pr_debug()? That's all diagnostic information
> which helps to monitor system health, no?
>
Agreed, I'll change it to pr_info() (and do the same for patch 5/6)

Cheers,
Prabhakar

