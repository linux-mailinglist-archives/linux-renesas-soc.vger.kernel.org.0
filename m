Return-Path: <linux-renesas-soc+bounces-29986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBOnFXoLvWkO5gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29986-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 09:55:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B052D790C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 09:55:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFFC6318265C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 08:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA14D3750A6;
	Fri, 20 Mar 2026 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6/goNLb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8754737474A;
	Fri, 20 Mar 2026 08:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996156; cv=none; b=fBYJprIk61kqvSN8VS2ES/jF/uGwe1ILDRx3rrr0E+5DgT+esCh6VvEhUK00NdroCa7bqcC6veu7n8mPUnZX3dQBl5gK/ir4mlwb/FrtVgCUEdRqgpQ5jzFpIA0ptO2hQp0gz0FpgCizhbkz3IiQc2QByFtWhnFHbcyksFeVgxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996156; c=relaxed/simple;
	bh=0yHGHy2n+Wnju0cJWKZDinXzldzBeapTGCeLcuDCzJk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=P7fYO4QEUQDnomr/yfRenYaDpuaILpfT3W6+lTjDjn92eKMTnJLbwsUIc9KFYhEubH6RLoFjPBBcnPuxvzV80IY2yW2E6Y4pr0usGt+pDGZsOJfm71UGN4dd2ro6PvlVWtpZ47KQ5Kb6pfNDk4NVKacbFeGHfDuRMJC08I8ozdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6/goNLb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BA75C2BCAF;
	Fri, 20 Mar 2026 08:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773996156;
	bh=0yHGHy2n+Wnju0cJWKZDinXzldzBeapTGCeLcuDCzJk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=X6/goNLb3nk6R48Uk/YjcRMMrfH9P9BaHf+GYni7pzfzMxtL5d7ud3wnBhxxEZjNA
	 l7aW1TJQty9ZRFydPsqVKuXMfbI+PMQ0GGd+W9eb0LSHIKon7ObXmsxPSjZJ9pdMvA
	 kcaTALVG2J2vZJT33C7PGVc3Oqpd6RCcThBRCQhJALOhHAeQivZCydQlJRhj3v/fy8
	 pSNsOHLcuXCyvCIaP3gL2E8gVuBx+8UL2LtE3k+i0ngUGUQjmmN2QoGdytrxBnXel/
	 8PhV7kOd1gy4HFLy3gpqN/zRzfFtVaJcGIVtdH6I86zrUr0BPo5sL/dwc6Wzv194n3
	 JqxP19lqGElkQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 05/15] irqchip/renesas-rzg2l: Split EOI handler into
 separate IRQ and TINT functions
In-Reply-To: <20260311192459.609064-6-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
 <20260311192459.609064-6-biju.das.jz@bp.renesas.com>
Date: Fri, 20 Mar 2026 09:42:32 +0100
Message-ID: <87qzpelwnb.ffs@tglx>
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
	TAGGED_FROM(0.00)[bounces-29986-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
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
	NEURAL_SPAM(0.00)[0.215];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: F1B052D790C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11 2026 at 19:24, Biju wrote:
> -static void rzg2l_irqc_eoi(struct irq_data *d)
> +static void rzg2l_irqc_irq_eoi(struct irq_data *d)
>  {
>  	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
>  	unsigned int hw_irq = irqd_to_hwirq(d);
>  
>  	raw_spin_lock(&priv->lock);
> -	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
> -		rzg2l_clear_irq_int(priv, hw_irq);
> -	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
> -		rzg2l_clear_tint_int(priv, hw_irq);
> +	rzg2l_clear_irq_int(priv, hw_irq);
> +	raw_spin_unlock(&priv->lock);
> +	irq_chip_eoi_parent(d);

Please convert the locking to use guards while you are changing these
functions. So this one becomes:

  	scoped_guard(raw_spin_lock, &priv->lock))
        	rzg2l_clear_irq_int(priv, hw_irq);

	irq_chip_eoi_parent(d);

See?

Thanks,

        tglx

