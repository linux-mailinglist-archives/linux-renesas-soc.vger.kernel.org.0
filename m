Return-Path: <linux-renesas-soc+bounces-28418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEIUAfBWnWk2OgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 08:44:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA2418330F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 08:44:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44F88303FDF4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Feb 2026 07:30:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7C7021ABAA;
	Tue, 24 Feb 2026 07:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUPzOV84"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52B719EED3;
	Tue, 24 Feb 2026 07:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771918243; cv=none; b=fHnSdAm/0gCjwth+wkPOiCC0S/qsU492ntp5UqI9RP0smGw9g1j2vx9geUX3y0so0FxYXs4e5C/3EfMSYbTch57prJdWfB5OqM+qZc1F34QQjhI1L8HS5VBDOlg+xhEytJk60/ewikCgAdOiS0kGunge/nfntbuVi8SfEasS6Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771918243; c=relaxed/simple;
	bh=Bkhw7d97Hb5c4YfCkVQ/1lJbc4ZsJEtwSJMqN1Jj2AU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hdajT1zUSCHPxSuZF4kWUeZVbsC4g1RVTFzrISVtsHHrW/+6IeipvWF0ybrymlvyQNggTEQ/de7z76zPcWsqcJRsSRrIgTY+ayj0l0kfQXcfIliglARmiSEdAJa3vmJHXV6N9BjekDkpvl3DM8weIWqLZ9k8aHNut3BFc9fWIU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUPzOV84; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96A5C19425;
	Tue, 24 Feb 2026 07:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771918243;
	bh=Bkhw7d97Hb5c4YfCkVQ/1lJbc4ZsJEtwSJMqN1Jj2AU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JUPzOV846ZxoJR3AIyJggd9lReFeDywktedIlvMyNRpj9SukAYtE8D/YVwjcdU7nc
	 aoX/Q6VGwdW0814dJ+AsVJePAs8+fiMJNxsvtBF5XF9figmUq2t9r//Z+EtVY1/kOC
	 pRvXEkjVi4TSAMoPj+HMKm9JCVQQRPM8LJtcRnU61DuVFsxrkbEm6pyl0kMXBSJk8G
	 B1BjqgWnXkLyE26Uh1CNYFISkwMX+0N/9jxiHArDYlBsKxGKzkPOdiHWNxSET7wJet
	 CESVCA20kTrYa57O65/C75RxsCSpQ93875vdABxuwiJmYLzcBswxNUTKcftG8SrKh7
	 vWPOfm44zoj8g==
From: Thomas Gleixner <tglx@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>, Biju Das
 <biju.das.jz@bp.renesas.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v3 4/6] irqchip/renesas-rzv2h: Make IRQ type handling
 range-aware
In-Reply-To: <20260209104121.26172-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260209104121.26172-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260209104121.26172-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Tue, 24 Feb 2026 08:30:39 +0100
Message-ID: <87ecmavbs0.ffs@tglx>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28418-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5FA2418330F
X-Rspamd-Action: no action

On Mon, Feb 09 2026 at 10:41, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Refine IRQ type handling to explicitly bound IRQ and TINT ranges and
> dispatch based on the hardware IRQ number.

Changelog should not start with an explanation of the what. See

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#changelog

> This restructures the logic to clearly separate NMI, IRQ, and TINT

Restructure the ...


> @@ -175,18 +177,27 @@ static void rzv2h_icu_eoi(struct irq_data *d)
>  	u32 bit;
>  
>  	scoped_guard(raw_spinlock, &priv->lock) {
> -		if (hw_irq >= ICU_TINT_START) {
> -			tintirq_nr = hw_irq - ICU_TINT_START;
> -			bit = BIT(tintirq_nr);
> -			if (!irqd_is_level_type(d))
> -				writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
> -		} else if (hw_irq >= ICU_IRQ_START) {
> +		switch (hw_irq) {
> +		case 0:
> +			/* Clear NMI */
> +			writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_NSCLR);
> +			break;
> +		case ICU_IRQ_START ... ICU_IRQ_LAST:
> +			/* Clear IRQ */
>  			tintirq_nr = hw_irq - ICU_IRQ_START;
>  			bit = BIT(tintirq_nr);
>  			if (!irqd_is_level_type(d))
>  				writel_relaxed(bit, priv->base + ICU_ISCLR);
> -		} else {
> -			writel_relaxed(ICU_NSCLR_NCLR, priv->base + ICU_NSCLR);
> +			break;
> +		case ICU_TINT_START ... ICU_TINT_LAST:
> +			/* Clear TINT */
> +			tintirq_nr = hw_irq - ICU_TINT_START;
> +			bit = BIT(tintirq_nr);
> +			if (!irqd_is_level_type(d))
> +				writel_relaxed(bit, priv->base + priv->info->t_offs + ICU_TSCLR);
> +			break;
> +		default:
> +			break;
>  		}
>  	}

TBH, I personally do not care about the performance of your platform at
all, but are you really serious about having a switch case like that in
a hotpath function?

Instead of sprinkling this switch case gunk all over the place you can
simply have separate interrupt chips for each region and install the
proper one at setup time. Then the functions are clearly separated and
just handling the type they are written for and nothing else. No?

Thanks,

        tglx

 

