Return-Path: <linux-renesas-soc+bounces-30659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEOtCen3y2kXNAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 18:35:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8D936CD09
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 18:35:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C7B20304ACC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 16:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B83D42317D;
	Tue, 31 Mar 2026 16:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sRvrEw/g"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 186A7421F1F;
	Tue, 31 Mar 2026 16:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774973760; cv=none; b=G7jy6O6nVh1Jq1dsfjoAq9BEi/hT2HGCIrcSfIIOPNtMUE2bniHBweKX37ekNf+isexKmDioU/fbkMivBoQplP0YOj6xIYVlKVj+8zcHCUSVP4Ixw5YhyehWakEBnJqUBf8lOEGIbgA/7wh2Y4dSoNpW8vaARaEsIHtXFpp6ztI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774973760; c=relaxed/simple;
	bh=VQJpEakpHyXz1AXwi3fnVUfQb7cG4Qft4cGZmSL0jCE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QeULyic/sWLGC2x1Vc9l4Um+rzEfgr8ii9wfsgbpKg0ICm3gLj3fQ40I9wZFaWCSjQ3Y98FJAKofshIhwabXYo2+i0YPqEvlciXjVUnaMx/GHuPYYLUcKXDFM5DAb5k1OQ9UEq1vYD4evBzpp8YFN7SetAfeg5l5MbZqfJLP75Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sRvrEw/g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E791C19423;
	Tue, 31 Mar 2026 16:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774973759;
	bh=VQJpEakpHyXz1AXwi3fnVUfQb7cG4Qft4cGZmSL0jCE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sRvrEw/gFSD7kZfgpVlyx8XOsky0hGzXrKLVXcMhFbDyh2q4gLXpXOymHE7roF1Td
	 qT9jLoiCogBp1/zZwgtY4E8uYtoPks/qEbr/6ZF3PNkABlCQzHbLB895j2U23wTqZX
	 yMomq7ePF/fRHICQX5tAAJEd0v2xVqt9PTev3uN9J2GUwUvznRxuu5j6v1qDl9Zwtg
	 R2nvXL7KQ85tigZ0wNMsnhTZJK4rIiBfvCnS6n3PoyVMza+q3zcjX80qebmFZo6Vwt
	 3tqdwDxLopWTCHUeERoLwBl2zxCbov1GKEJkttEp370QxroMHnn0AjfL7w2g3kYVyX
	 y1TJMWUn5Owqg==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] irqchip/renesas-rzg2l: Add NMI support
In-Reply-To: <20260328103324.134131-4-biju.das.jz@bp.renesas.com>
References: <20260328103324.134131-1-biju.das.jz@bp.renesas.com>
 <20260328103324.134131-4-biju.das.jz@bp.renesas.com>
Date: Tue, 31 Mar 2026 18:15:56 +0200
Message-ID: <87qzp07z5v.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spamd-Result: default: False [4.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30659-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD8D936CD09
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28 2026 at 10:33, Biju wrote:
> +static void rzg2l_irqc_nmi_eoi(struct irq_data *d)
> +{
> +	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> +	unsigned int hw_irq = irqd_to_hwirq(d);
> +
> +	scoped_guard(raw_spinlock, &priv->lock)
> +		rzg2l_clear_nmi_int(priv, hw_irq);

Is priv is shared between regular interrupts and the NMI?

If so, then you can't take the lock.

    // Some other context (task, interrupt)
    raw_spinlock(priv->lock);

--> NMI

        raw_spinlock(priv->lock);

--> Livelock.

Thanks,

        tglx

