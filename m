Return-Path: <linux-renesas-soc+bounces-27899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKQYOPltg2kFmwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 17:04:09 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B258E9D0E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 17:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2D98B3126E8D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 15:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA192421886;
	Wed,  4 Feb 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkJMH7Ix"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79D541C31F;
	Wed,  4 Feb 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218524; cv=none; b=abx3rBq/qYiEA1/tLTJ8CbN1ltd1JQkwutUm7LNrlIRIDMTN5l+e9Ibj1Kz9jBls34teSzLMG69CBZMvMKqrkx/5EHEKm53RA5oN5EcKnkojy6uT6bRjCMFVoQbpRSuwRgNogtR9G9pDwnIO+tFsspDXmor7xeOuFlWPYWXUPF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218524; c=relaxed/simple;
	bh=iNUrX/5cETioElxv1qpC3ihSn00cWgUdnpDijcRIxHE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S0SX9j6H2gv95NXXR9GAQ31UUwxUR7x5AdTRbshUKI4AvHN7xuzAJMcVRczDpHuDcojWubF549QcqdDpGbgBoCcT+VlYWYVnIdeQOV6ut+ttG+hyMDzIqoeQRw0+uNDRZpB1LABjI8z0UgyV16LKNteeAoJfUDiglOrJd7P+YwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkJMH7Ix; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7BAC116C6;
	Wed,  4 Feb 2026 15:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770218524;
	bh=iNUrX/5cETioElxv1qpC3ihSn00cWgUdnpDijcRIxHE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=YkJMH7IxhFwTxTodLPHc7+04viEQRet4tKBfel3a5QBsKn+2FUwlEMI0HHYPKjMjb
	 gbwsbmhY6qL0P83xInGyMNkPkt22aGkocmWKtKXR1sx9pRlOXnE4vSoUBLLcukUGBP
	 NwxVv0cjyhPm710cwZGbZZKByTm9wksmxz8Y+WTGLa46RWOXERUBFKn2+jZTEg1Fw6
	 rSDLOSqDDMOAGJMDvUpCMcwH2cH4G6MOFIZH2CgZBnNn2Ls52C/Ai45cOpBklbagKE
	 lJT7Tn5dz6dSLWOji0GavYZX2cRMFzm40bceIM0Gv/Kmd5HtoB6nzLrmXfu001bl/A
	 bn1Rlp8xs4fUg==
From: Thomas Gleixner <tglx@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 6/6] irqchip/renesas-rzv2h: Handle ICU error IRQ and
 add SWPE trigger
In-Reply-To: <20260203231823.208661-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260203231823.208661-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260203231823.208661-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Wed, 04 Feb 2026 16:22:00 +0100
Message-ID: <87pl6k1qlj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27899-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B258E9D0E
X-Rspamd-Action: no action

On Tue, Feb 03 2026 at 23:18, Prabhakar wrote:
> +	/* 1) Bus errors (BEISR0..3) */
> +	for (k = 0; k < ICU_NUM_BE; k++) {
> +		st = readl(base + ICU_BEISR(k));
> +		if (!st)
> +			continue;
> +
> +		writel_relaxed(st, base + ICU_BECLR(k));
> +		pr_debug("rzv2h-icu: BUS error k=%u status=0x%08x\n", k, st);

Why hiding this behind pr_debug()? That's all diagnostic information
which helps to monitor system health, no?


