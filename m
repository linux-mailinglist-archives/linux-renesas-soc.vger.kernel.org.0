Return-Path: <linux-renesas-soc+bounces-29987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EM6SJRoLvWkO5gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 09:53:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F022D78A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 09:53:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4890B3006B14
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 08:48:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D23D92E7621;
	Fri, 20 Mar 2026 08:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LVnqLlze"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB98284693;
	Fri, 20 Mar 2026 08:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996521; cv=none; b=iyXVG3E8ufJuZ5ptMuSBzoxrEfrcbImtWKf+I9jrnat6rheS8nM9Dh5i0uSyE1ZGvAW13eJB5A4awmpB+PIajMV06BmTSjYp9lPby6N+8TmQUSEsz/togTS46Mm+eTWr6u5jxV0FspWWvUoo961rkT8MIcHhhdQuIqwS20/T33M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996521; c=relaxed/simple;
	bh=/3SW80o8iSXUs17t16sqzadFC2FSXmFWxQpqy+g2zcI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HcNRtpSCh95xqcm7MXWNCGSSxVsWmVG+EKx9pQDG69dup/vJMBaUt4tny7DJA5rIOuT7bnK72ejkrSejdX+kkrX0HVgJgzOP7qHBUUfV+yjS+Y4XNFiiTicLVZR8uPfZk6xDCH9VwyVmT9Fl4HFNbpKPHZnaFt0sGLeyJ/e3BKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LVnqLlze; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9AFC4CEF7;
	Fri, 20 Mar 2026 08:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773996521;
	bh=/3SW80o8iSXUs17t16sqzadFC2FSXmFWxQpqy+g2zcI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LVnqLlzetGzwgBagkDmnLAYQKlR66NQtifTsQBxl9/I8rCQooNPt57mqezT3z1JVu
	 yRpH9qgp2eaTH+3sGBMlbalMzyF/kZb+lvgVx/KQrfS7saGKzs3BJLpH1Cuh+gF63Z
	 v92hKJbHb1reqriiqOxOJrT/9oomZ1sb+NuAgI9pRkL1Rt3V9kXOe5hDpL1RE+3H8Q
	 PJvzkoCRQXMyCNSF3smMHtbkxYcJly5P+sFWLwNFQ1UbQWr0CVoj+LyBKJLcFO+qM5
	 Lxw4Cyk+Vk6lXJvTcrZK5dk3x6f+e5EoL6F5m0GkYugU9mqTUZzZ/R8G3EawW0+wpC
	 fi+NihWyvk1lA==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 07/15] irqchip/renesas-rzg2l: Replace
 rzg2l_irqc_irq_{enable,disable} with TINT-specific handlers
In-Reply-To: <20260311192459.609064-8-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
 <20260311192459.609064-8-biju.das.jz@bp.renesas.com>
Date: Fri, 20 Mar 2026 09:48:38 +0100
Message-ID: <87o6kilwd5.ffs@tglx>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29987-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.251];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 35F022D78A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11 2026 at 19:24, Biju wrote:
>  static void rzg2l_tint_irq_endisable(struct irq_data *d, bool enable)
>  {
> +	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
>  	unsigned int hw_irq = irqd_to_hwirq(d);
> +	u32 offset = hw_irq - IRQC_TINT_START;
> +	u32 tssr_offset = TSSR_OFFSET(offset);
> +	u8 tssr_index = TSSR_INDEX(offset);

u32, u8? What's the point of those data types. We use uNN usually to
explicitely denote that this is hardware related. All three variables
are just for calculation and can simply use unsigned int, no?

> +	u32 reg;

This one makes sense.


> +	raw_spin_lock(&priv->lock);

This one can simply use

     guard(raw_spinlock)(&priv->lock);

> +	reg = readl_relaxed(priv->base + TSSR(tssr_index));
> +	if (enable)
> +		reg |= TIEN << TSSEL_SHIFT(tssr_offset);
> +	else
> +		reg &= ~(TIEN << TSSEL_SHIFT(tssr_offset));
> +	writel_relaxed(reg, priv->base + TSSR(tssr_index));
> +	raw_spin_unlock(&priv->lock);

