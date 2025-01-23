Return-Path: <linux-renesas-soc+bounces-12382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49991A1A23D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 11:54:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8829C160D6D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Jan 2025 10:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1D2320CCD2;
	Thu, 23 Jan 2025 10:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="AVhH+3WO";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="LrFuegTd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C761C5F14
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Jan 2025 10:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737629644; cv=none; b=bIG7RZIaxT3aEdy3gc1fzPtyHeqLdYEUSwmSIIf5ujAfd30nnz+hMpJDf8qFdaIZuOPhsxS1bIyTZwWLlKbTPzlgUKc9VAXz2VJy6nHOCipav6VvIqSF9NrEIx0LkNNXZDayjVEpnW29YtKnX/KRsmUjRuf5b46CylBIgqT/8Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737629644; c=relaxed/simple;
	bh=H99TNHs+V8uvo6ifST+96PbMvOXysnY0rDtSCB+cmNw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F+3jeaPfS93CE+eQD66aneF+VIyosp17aghtX56Sk+tEJ4RpghMR08ocf4NWMs/7qt3kaMt23McvDv01sI56YYXAwu2fdUMg/eONnfK67qQ3HVrpigTBjA9JLiWB6BnC2Md6PWkCAT2jW5jLrvqyYybKb4QeXP7hlJTxajxu5sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=AVhH+3WO; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=LrFuegTd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1737629641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5fXaHzQN5YD2cjQArtjCieToUhUxgv9v7969c/cbLE8=;
	b=AVhH+3WOhCShd4YUy5bo3m49T5NbCzkeba5EQgKzBoonGEY7Hi3eyTwR6Fcdbrc+omtC4k
	ywXa1k6bH6TuKLw7whQLURYaJ6c4AOh4w/rYYcDFPRfsplvTKxNcalAiOelCHbiLEDpnkR
	KJD+0gV2ac3WfZIahg2Yip4EVkQyGEdNnV8wmy881nuc7mtR1G54TBgG3tD+EldxtjBJ7W
	ePbvBWJOJy81WSGFgDXez8vO6ZlfWmXbnPOnMx86wD7vaXzf5/6XILutH9QVUoRSNgygV8
	Le1ZAV80/LFT9fDzN1nzee/rGi4kPCG1hqt/aqErgr7vjm0QJmTMYN0U0Av8DA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1737629641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5fXaHzQN5YD2cjQArtjCieToUhUxgv9v7969c/cbLE8=;
	b=LrFuegTdhLVT0EZ38G0ZoWtZX+XEl+CLb3NJ2Q9HLoAW79T2IF5lW47GJhR2gfRhv9oETK
	mCVoJAndVCHLGSCQ==
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 06/11] irqchip/renesas-rzv2h: Add max_tssel variable to
 struct rzv2h_hw_info
In-Reply-To: <20250120094715.25802-7-biju.das.jz@bp.renesas.com>
References: <20250120094715.25802-1-biju.das.jz@bp.renesas.com>
 <20250120094715.25802-7-biju.das.jz@bp.renesas.com>
Date: Thu, 23 Jan 2025 11:54:00 +0100
Message-ID: <874j1pajhz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jan 20 2025 at 09:47, Biju Das wrote:
>  /**
>   * struct rzv2h_hw_info - Interrupt Control Unit controller hardware info structure.
>   * @t_offs: TINT offset
> + * @max_tssel: TSSEL max value
>   */
>  struct rzv2h_hw_info {
>  	u16 t_offs;
> +	u8 max_tssel;

Both the kernel doc and the actual struct members want to be done in
tabular fashion.

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

>  };
>  
>  /**
> @@ -298,13 +299,12 @@ static int rzv2h_tint_set_type(struct irq_data *d, unsigned int type)
>  		return -EINVAL;
>  	}
>  
> +	priv = irq_data_to_priv(d);
>  	tint = (u32)(uintptr_t)irq_data_get_irq_chip_data(d);
> -	if (tint > ICU_PB5_TINT)
> +	if (tint > priv->info->max_tssel)
>  		return -EINVAL;
>  
> -	priv = irq_data_to_priv(d);
>  	hwirq = irqd_to_hwirq(d);
> -
>  	tint_nr = hwirq - ICU_TINT_START;
>  
>  	tssr_k = ICU_TSSR_K(tint_nr);
> @@ -514,6 +514,7 @@ static int rzv2h_icu_init_common(struct device_node *node, struct device_node *p
>  
>  static const struct rzv2h_hw_info rzv2h_hw_params = {
>  	.t_offs = 0,
> +	.max_tssel = 0x55,

See documentation.

Thanks,

        tglx



