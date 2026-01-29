Return-Path: <linux-renesas-soc+bounces-27641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPtHDBLQe2m0IgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 22:24:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C904BB4967
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 22:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3183C30054DD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jan 2026 21:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310DB3271F2;
	Thu, 29 Jan 2026 21:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J76RYCIL"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE60F265CBE
	for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 21:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769721872; cv=pass; b=Sh3kmHl2R7l+XTVqT0NbXCv3Gm4fqAYl/vFObudGyx58IT0Kg1FeYcWyHkbjRD2JWPDi/7HQWDVijsolfGZsgLxsWGlS9ONbTapzLSft04fZv6vxPu9V+YUu+o4nIIyOQ3IdKvAyLFHNPQa5rFDupk6ANHGw9pvQn7nvJDDIbwc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769721872; c=relaxed/simple;
	bh=jYa3b7kXJjactGbl4GZxAcGkmFdYG7BQ7dAtZXLB2uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fI/O16BvUG/ZSrGlIUIX2FBbYcNJB0oG7bN9hqyOzEqYyKwoEL7j+/x0ghtekTfmKiN6DCCcuo2HNq7JSpq/rOZIsoafPfrBtvolp7wAzgzw1S37hfxmHMekrDi6unfGZV5EnJG5dNXPkuG7MWwOI/HZlgrQ4vdfE3oRB35f0AE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J76RYCIL; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43246af170aso942873f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Jan 2026 13:24:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769721869; cv=none;
        d=google.com; s=arc-20240605;
        b=RcZKd7CW42x6egTNCM1AVLB0LXjjK4RPvI6ZilJYWk4btPn3e1apuFR7EV+/zL58hM
         x+zrFqDrEXU5U+wDEX3JCxZQb6L2YRXtaEy65okJT1IS//LtJ2iZcZAGarUEMihCy1kD
         2ze/uYGCMj2KJIbjZqveZaYXEUhvHgVJEpyX3D2L+j9MuAwAK5VGfA1xNUWprs3Jmixm
         pD9XyY+9SAaOEA317PvLosjvafJbeo21OkrxVoPHMNKlIpSDqnUVMo/29/yUSeKgATgB
         4M8M4vITFGHH0xzSaZzI0gZcTGRATQUs82oJO6NA7QlycVPeXMDXWKRniNrQxp8b7oiw
         6ytA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYa3b7kXJjactGbl4GZxAcGkmFdYG7BQ7dAtZXLB2uk=;
        fh=kcJAONjk22JINSS8/teOVVG39sBOn4gST2AB/1S18Mw=;
        b=aace9R1ynm98ryyzXIdEtNurss5BbzvtvYI7nD7+gQsuxhPtkn29f3rNuhnpoahKzs
         xko1IicQvbdvBlnXhZ+UzQoVKB434LbGXfW/leo2Ztcnlgc1rMinvzGj7PoHG4azFnVh
         2f5jNDl5/UUBPdtyzT2jswb91kv9Hno6h4XXbPo5CM0wRzIKFIDfW5cAl+OSrKm7SePx
         5eOASFnr9YpgqDJ0sNL4M8eqc4/sND3Fn4OA+P46jmY51KqnSnJb6ReQx+1000dGa8I1
         UYTEhcyf9z14tba5NdCKuEjCA2bcNFjx06Cj2+OD9j89vHAgFkvMadgrQtIla9196Shh
         9TQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769721869; x=1770326669; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYa3b7kXJjactGbl4GZxAcGkmFdYG7BQ7dAtZXLB2uk=;
        b=J76RYCILBF8sVQy7U+WqMj7G+t77n+lfC3ach54r9Yq20/WgbQT0nhnrjeW/QDAv5h
         oAGkdP2M4fKg2kvj4DEsCgYoiXkWV4XAPqRF8Kg6QbTDNu2QC8ULD1SolAvjZcgWtOJH
         b3qX2qXxD/sR2LKYGsORqvhzR6pZ5WC1r8B6rr1IOiOCVj2b6CKUTE6WQXkV13RQDXJt
         Ijxx690qdfGGcOn+NME79Jxbequ54mNhwzffmcuSaFhrIrQbGAiem5kunDA85O5jBlzv
         eLKLjwOC+KokoR5LvmFGeMKhENvrYja9nieEMsX8aXZD3dCbuRqYddxXAfpFBXqIKwDB
         wUHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721869; x=1770326669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYa3b7kXJjactGbl4GZxAcGkmFdYG7BQ7dAtZXLB2uk=;
        b=qKFo7rOceaRV3Pnv2PQqkIK8/nRYXc8C39e/O/oKUAl7O+IsF2PmjKeGHXkaF2s3Nh
         VLBsX6voiRPKFuFTCuFu36dQkXeg7vs5gaosbVUErLJgFPQHs6J9fTalbGo1SR0jcxKK
         w+684cZIFUhyrQY5uwr3aR1fjh1TfQHjOaYHdwJXxTJMBgwFv9yIMjKrVrM9nubkmCQC
         N6FMsEoDNIs9VMTbCAGUF+txc0rb1ik5fWoRL5jlNma1P27n/oey5KMKkZk3c/VU5z95
         aBJxwBhGMpt4ZXPVUYNofWH2eq3VXvj+njIh1xvMjgiJt01ICMeCGMEd1dEmCGK4rNFm
         tKmw==
X-Forwarded-Encrypted: i=1; AJvYcCXMlkJ3G5bpORixC41Z5o6fjAlC/xaH2CrTAgARs/FkJz5RZ+EpaE+3i6hqYZTZYygKzv4Cd6b1ASMTHORHTEeBTw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyoiy5pfTX0hixybvlPjC6pHQb8TCwCbuBVug29RSaAFh99VDTY
	8/KtaIrwYq7dcCtSNhudbWsmOVYxxZND2WYVLS0Rw8xXdF3xi25OO7Km9Re3Bxo8w0RyepAImG4
	P8d5+dVZ999uPg2raVmbXH2xW37XFg28=
X-Gm-Gg: AZuq6aKxjIFXXr4JYMsWwGpzKZYY6kJO9wP94Aw/BZuBt7627kZz9Q64s9kCi3JvNg/
	yTspV0aCM9R6UbIO7hgiMG/appyBNVW/NSqLMkh5DkcUAhNZC/m6UlVMSBmcmHqy3xElPNKwJL0
	oHJdDb4HnVmgKz75S2S/IjpHV081Yvm8rcwxtueeE9vS+NIt6oHLBdMqxwRXwfKyqFqg9yf990R
	/S1eGJ0V4fUPrfKZFm+bZcXPEX6OSqAug2qjNjlqiGP1FyUwZsJimCMM1cF4cOtOBbM2BdOlWOm
	q0It+7h7hu6lQrXdJ7qpEy8PWFFVF8dJcRIqR8LAmArnITyQePz3SELOHqcFQVODaZc30cFNuJI
	3zIWkRdxDxNytJA==
X-Received: by 2002:a5d:5f43:0:b0:430:f736:7cc with SMTP id
 ffacd0b85a97d-435f428aa6cmr731339f8f.1.1769721868883; Thu, 29 Jan 2026
 13:24:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260121150137.3364865-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <87cy2wcqe2.ffs@tglx>
In-Reply-To: <87cy2wcqe2.ffs@tglx>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 29 Jan 2026 21:24:02 +0000
X-Gm-Features: AZwV_QgIi_HlsjTygi1VQfNWmCgcOcKFBFJloDZxm-5fBplCGlSUuwhFfAWYY6k
Message-ID: <CA+V-a8trA53J5xt-p1odHkqeHgk_qXKQeXsf-QOfz2=JmTOSYA@mail.gmail.com>
Subject: Re: [PATCH 4/6] irqchip/renesas-rzv2h: Add CA55 software interrupt support
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27641-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: C904BB4967
X-Rspamd-Action: no action

Hi Thomas,

Thank you for the feedback.

On Mon, Jan 26, 2026 at 4:03=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Wed, Jan 21 2026 at 15:01, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The Renesas RZ/V2H ICU provides a software interrupt register (ICU_SWIN=
T)
> > that allows software to explicitly assert interrupts toward individual
> > CA55 cores. Writing BIT(n) to ICU_SWINT triggers the corresponding
> > interrupt.
> >
> > Introduce a debug mechanism to trigger software interrupts on individua=
l
> > Cortex-A55 cores via the RZ/V2H ICU. The interface is gated behind
> > CONFIG_DEBUG_FS and a module parameter to ensure it only exists when
> > explicitly enabled.
>
> Can't you reuse/extend the existing mechanism provided by
> CONFIG_GENERIC_IRQ_INJECTION (irq_inject_interrupt(), irq_debug_write())
> instead of implementing yet another ad hoc debugfs magic?
>
Can you please point me to a driver which makes use of it? In my case
the interrupt needs to be triggered when BIT(n) (n=3D0-3) is written to
ICU_SWINT.

Cheers,
Prabhakar

