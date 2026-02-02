Return-Path: <linux-renesas-soc+bounces-27782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yF1gFen0gGkgDQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27782-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 20:03:05 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D806CD060A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Feb 2026 20:03:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6E7BB30071F1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Feb 2026 19:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACA44964F;
	Mon,  2 Feb 2026 19:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZfjmOeQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 120893FEF
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Feb 2026 19:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770058982; cv=pass; b=ptD6qEKdD5mMyyGxfAr8WLX3uj6q6b/aXLL5ad9RoMHz4rl77UJowmKldS6uYi1BMnSFx7Za1Iu5nG/NYVyOUxQsuRDgPUHkTKuGz4svMWoaEPun1NV/yvZpUwnDh5XauP0JYoKbhckqVyVvQctx6V8Z+BXgihHN/rlmv+pk07Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770058982; c=relaxed/simple;
	bh=C+M9Di4yzYwbcVbRjGgX+9HJXEaOcnuGiZsRo6z+5AY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V0r3TJPmaC61c4YcEF8+G9QMAAXbWN6Vi5jsWRiw+86Hm0XxyBUrp3kKX9YqbttiE1aYDKp78x5PL4hUv7ONT7coo8mclprdLM291f5ZQZw3tAWVg1DIniIhfUHTrlF6eHsVUQo/oLRIjR1+/iiukySQxh/8Mlam3ZJTM6Vd1kI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZfjmOeQ; arc=pass smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-432d2c96215so4612680f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Feb 2026 11:03:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770058979; cv=none;
        d=google.com; s=arc-20240605;
        b=g2jfje0+GdoR1P6iIIRZlVrZ0OAX3g8LWktgvjWFkADcaapHI9RNflhW3NWvyZ5AIZ
         3JPM9D8kWOX0D2zxZIXBMwzuB7EgrkT7ik7eKa/hKLCyO+g1mW4lW04xFwWrdRNgHjat
         4V1eJ2auKispABI6Urdu9PgpuI2+GY3rkDHY7BPyPZJF1agxASC4eMZ/YsoWJrIhxkgp
         sDu3XVsUqsVEANUyRo7E0qWSC9oHCv8OpxYPTJ4oBTTBM8yP141E0A3pOemfxufELix/
         hSuUDQreRiqWWM/ZIQ3LwlkvA13rOx6pyzC+Z68Qbs2c7Sn2Sv9MqgVnDnPfizRmk/SO
         MucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V3jYOfPC3VKKjSNeTrQ9XN9J4GArvy98ZQXcEU4gMB0=;
        fh=yQCJHNHBsNJ+SDpGkzCYC/L2ZwdGpCZC7C+Fj5W25Bc=;
        b=Zwv171erRQxrdQjl9KbCRTUlOy9gomt2JwpjGlg0byEoHq6KzCu1fWDrm3xJBc3Uba
         4Wj6//5NAfrTHbzuAIy17gfck19aMm0H1nGR8Uq/RjCDp/AKfK2KxWt00D16hcZi5ut1
         Xz9Fo8eS00lWkUYeOc4zLnqFSAdGxVmBLDu7j8lunbA5cNCu0692NDB7Qrsx5lTaixA0
         iWss5QJC1uWr7BuqZqw1cVzc0Vn7SOPnMp2W1om9418ehlfMDJkUOQ65l1my3jxMS2wt
         FUrfrlGpIfK3uyTs4zxmjb0f54yQWNKBGZ4fDNYfYELLVwBg2KdQbNhju/xKyx3csJEY
         DVvQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770058979; x=1770663779; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3jYOfPC3VKKjSNeTrQ9XN9J4GArvy98ZQXcEU4gMB0=;
        b=eZfjmOeQ+WOhs4nhXEQXP3Y0RdKApKPlBS0X2HVpiSWwpG9YrjvdSqk7q8g38TXSkr
         +UAybi/0fUsCokKOcIIZokybLA+l1Rd/oDzDoapdjfcU/Ycic35nDRXVaoawvij2n20+
         qnziJTLSfEKZssle8S1Ovtd5l3WFEOkmF8nA3Ca5tSRPF1YrJhiLGexE2+qU2CfRST0Y
         62eQcvVJd9HFZvMd9pmkOqJHdMAvQqOAxiBiSVQphUHAiINz5CghLsFm7ix4Z49kpB6W
         Ao2jbXsuMeFdHZuuGZTiH7NOI0cJKUsCRALocY533CmmV0XEPg8O/6GcIForh4+ul8pL
         m+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770058979; x=1770663779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V3jYOfPC3VKKjSNeTrQ9XN9J4GArvy98ZQXcEU4gMB0=;
        b=W9kpQ2LHX9jpTsalMb746zVWeeGW7saKII9V/xDGYZE9EoFHL3EcwiipMJvMl0y8mm
         fE5JUXeaQMyjlbRnR5q+CR+imyQkekGo+3xHT8g/TrvFbBRY5skwoF/2I6ccNgerDtCL
         nZSu2c3IxLd3PP27YtDmLGbwbyh+RH9/vzR8T8QFep3hIBNdKzfffxsQ+9MSNNBTqHF3
         1lf2RpEQ6A0XBkW17KhKtTn77UHzZ/+txWpzJdOE8yMgXRzOEyx1r4zCmUL9rDdWbJlk
         Ej56IitaaohIgZn/Zryi5VpBMGH40xK7RR1C8DBPijGG60Oq/wp2PbQgkqs4M6lt0TMy
         wfjw==
X-Forwarded-Encrypted: i=1; AJvYcCXZmzj/ewXuEuAjpkPBkOuTs13sgWFI9D+sGFXRdIerQ0803dUd4dzxI1iEP8/ngasCbCOk6l+tLlEy6MDyyASKNw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1dCrCNFMXZ92x/wrReKy/RgRunEEKvSzSPawk1a48I9cK9Gqj
	B69xyic4PYK/GAW363/sXYbBlm8Qp9s0nnIkSlgJFvx1kjxV7u2tcK5A89MTZJA3OpRbSAUkz++
	kQYVNYOBvPGAac1mRFAoy4x67nL2Hv54=
X-Gm-Gg: AZuq6aIKVIdGbZKQbbB6mXYw+zTocPRVpsZHiEL/SunEL6QOp5GpGoz9OU5R23pbmnv
	CUQYmLI3abloEMMlQ7SCIeggv41pXE8TqQTRMJDFn8dgzRQkbzRblm44HDTFI93Qp58z+jSTmTi
	jKt9W66KlU6+MR12LIxwM+FsvpqPonBsYg3cfagOWcsdWP3LtTOmMXFJM4jy0ZrWqb76bHPf5n3
	G6ZoV0qAQ7K10Bz6g2WTV0QelUrwBfB6YWGopgGDYbw3yYXocbLDy6t9hP8wTowQtrFB225oJhy
	3ci5qtDli9cVznPBq2iB11XPmtsNrwyNr+OXC0JqB6/k2xjyW3t2np+jLpnH5LGyXrL6xq6Rc/f
	OLNzIMzmGxAmiCQ==
X-Received: by 2002:adf:e645:0:b0:436:68e:3302 with SMTP id
 ffacd0b85a97d-436068e332cmr6717583f8f.13.1770058979146; Mon, 02 Feb 2026
 11:02:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121150137.3364865-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260121150137.3364865-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <87a4y0cq0s.ffs@tglx>
In-Reply-To: <87a4y0cq0s.ffs@tglx>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 2 Feb 2026 19:02:33 +0000
X-Gm-Features: AZwV_QgOz53Gk0-GcLXsx9o_1FJwgVuqsBJ6YVQ9dFPxizVzR6inAAzOp_NnCzY
Message-ID: <CA+V-a8s+wqRainda_J2uBbaoYO99OSgOp+LcpMe+5G+JLV8C_g@mail.gmail.com>
Subject: Re: [PATCH 5/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and add
 SWPE trigger
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27782-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D806CD060A
X-Rspamd-Action: no action

Hi  Thomas,

On Mon, Jan 26, 2026 at 4:11=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Wed, Jan 21 2026 at 15:01, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Handle the RZ/V2H ICU error interrupt to help diagnose latched bus,
> > ECC RAM, and CA55/IP error conditions during bring-up and debugging.
>
> Why is that only relevant to bring-up and debugging? Those errors
> can't happen in production, right?
>
The error conditions can happen in production too. So I'll enable them
by default and drop the debug module param.

Cheers,
Prabhakar

