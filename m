Return-Path: <linux-renesas-soc+bounces-28001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uCARB5HVhWl7HAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28001-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:50:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73977FD5F2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 12:50:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 22B5E301AA71
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 11:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BC136404D;
	Fri,  6 Feb 2026 11:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fREOkgcG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9575E33CEB2;
	Fri,  6 Feb 2026 11:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770378616; cv=none; b=RiRahXUMHZx0gxU80Z32danbHkagTbwB9trDG3S/i3MXa450SlUvfRIiT8Z4qi3jRXVPTjzOiOlXw+HeginovirNNSy0JJhc2sJ0rz3Eu6/0mkYt/A6pXkv3rPQNgSmEcXB3Hdzhlvp4vpdf2f3JP8oejfS4K01lKvN3Hj61NjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770378616; c=relaxed/simple;
	bh=mtO+0AyoAlMKJC5KjXWpuclRRsTnwlWxefNVs0FBL44=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qCJ6LWacJuTECQO1yabEpG3+89bmap9zlORMk/avWOxEbRNfY0rHpy+nuyfkAAoFlob7aGkw2q9yObA3he9dLoMTexh5fc2w3oommeHkQkBUganZXM5S3TiHF47W6ikQhsWlpjZYJINIGRxCpLRSBbQffAEJ94v3OHG0NqJxJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fREOkgcG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E3BC116C6;
	Fri,  6 Feb 2026 11:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770378616;
	bh=mtO+0AyoAlMKJC5KjXWpuclRRsTnwlWxefNVs0FBL44=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fREOkgcGKYWJkKMtp29SVFxTtiayYRcy4Y8mGmyWMry+ah41KuCG0Govqf0akA9IZ
	 cm6tJjNCwYTlhY2DJ8LNudS0PqTOJat+oxpABTXwC6IWEkm+nWmYbAqRIkuhoqrgYA
	 zyMkc6J0FlM1ukLJD0aT+biFCO63wkUnUSZCePizoktxFszlBl5dslKQc134FXOBUO
	 HHw5OEEp/vlAgGviPq5Ga6YAtCucmgUOPDju419KmnQgEXp26CspDmjaHnmfD6D/F0
	 vCffanr/M4s1Y7s7cfT1v4Qphnczs29V/XwA0qhVTJBYbW62UmknWIDF+KyspqUcEr
	 2TbDEc8lX9K/A==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 4/9] irqchip/renesas-rzg2l: Drop IRQC_NUM_IRQ macro
In-Reply-To: <20260206111658.231934-5-biju.das.jz@bp.renesas.com>
References: <20260206111658.231934-1-biju.das.jz@bp.renesas.com>
 <20260206111658.231934-5-biju.das.jz@bp.renesas.com>
Date: Fri, 06 Feb 2026 12:50:12 +0100
Message-ID: <878qd6147f.ffs@tglx>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28001-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 73977FD5F2
X-Rspamd-Action: no action

On Fri, Feb 06 2026 at 11:16, Biju wrote:
> +/**
> + * struct rzg2l_hw_info - Interrupt Control Unit controller hardware info structure.
> + * @num_irq:		Total Number of interrupts
> + */
> +struct rzg2l_hw_info {
> +	u8	num_irq;

Odd data type. Whats wrong with a good old unsigned int?

> +};
> +
>  /**
>   * struct rzg2l_irqc_priv - IRQ controller private data structure
>   * @base:	Controller's base address
>   * @irqchip:	Pointer to struct irq_chip
>   * @fwspec:	IRQ firmware specific data
>   * @lock:	Lock to serialize access to hardware registers
> + * @info:	Pointer to struct rzg2l_hw_info

Why a pointer?

>   * @cache:	Registers cache for suspend/resume
>   */
>  static struct rzg2l_irqc_priv {
> @@ -81,6 +89,7 @@ static struct rzg2l_irqc_priv {
>  	const struct irq_chip		*irqchip;
>  	struct irq_fwspec		*fwspec;
>  	raw_spinlock_t			lock;
> +	const struct rzg2l_hw_info	*info;
>  	struct rzg2l_irqc_reg_cache	cache;
>  } *rzg2l_irqc_data;
>  
> @@ -136,7 +145,7 @@ static void rzg2l_irqc_eoi(struct irq_data *d)
>  	raw_spin_lock(&priv->lock);
>  	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
>  		rzg2l_clear_irq_int(priv, hw_irq);
> -	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
> +	else if (hw_irq >= IRQC_TINT_START && hw_irq < priv->info->num_irq)

Ah I see. To make this more expensive by accessing yet another cache
line. Simply embed a struct hwinfo into irqc_priv and copy the data into
it at probe time.

 
> -	if (hwirq > (IRQC_NUM_IRQ - 1))
> +	if (hwirq > (priv->info->num_irq - 1))

  hwirq >= priv->info.num_irq

This -1 logic is horrible and error prone.

Thanks,

        tglx

