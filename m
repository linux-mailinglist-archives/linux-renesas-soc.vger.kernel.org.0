Return-Path: <linux-renesas-soc+bounces-29988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIfmL34MvWkO5gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 09:59:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 677952D7A1C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 09:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0491030312C5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Mar 2026 08:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6BB365A14;
	Fri, 20 Mar 2026 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ykdb5U3/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8FD361DB9;
	Fri, 20 Mar 2026 08:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773996637; cv=none; b=aca4xiDAbMYC/4Og7A/qOWAjVpyxcotdazqULkEFnk0yxbcAvdxCzG8X+7DzVBZ+ru4csugqSv2Y/0cmVblYPB0CQBuMzIvrn51LWhmS/1EdEGwRMX3SErMfpddhWapB+yN1efzkwnofN3uLZc9gztK8MroiZNEWrqDGXsmWk3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773996637; c=relaxed/simple;
	bh=qn+VF/RnXfcuUW6vF3jfCd/mXPb/2kQIDgKojghCpC8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KDWCjT2W7XkNg9JnU8OMMsULiyyqiOoVo1OTTbXVFroUtyGTGcdKvUmztST8SjA1LWi6au6t6TyMSeSHtPhoHkhIOKASgAzuimbecn9W8Py5yKB7ceTdA+chNBt8aC1fOn6EvGDmlYAaZai/Kh9IavUGj7iM0mL4PDqgINh3uLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ykdb5U3/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F3CBC4CEF7;
	Fri, 20 Mar 2026 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773996637;
	bh=qn+VF/RnXfcuUW6vF3jfCd/mXPb/2kQIDgKojghCpC8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Ykdb5U3/59nBn2EGB5y84zihnS74/YTk5W9/Q/yX7cB+UtXGzj89RtwvL+88jP8ec
	 mau14vqDQoc2uiaxgxmUfj9eayDjPCZO2YrAcWbpk1ZeXq2kFUTd7Pl7uHlF4lX/X2
	 Bth4jK1EckJ6cLkx6x94Y4wesoSfBJ8YBLfkyE8ivYou+kiWPcn936fAw7zLnyqv3o
	 pwwHzOvht4Z7DSlgi6pkAHKG6/W6HAj9W8uXtWmvUBqEUYaym8HQ85pireujAnzKsE
	 nSjJuBLfTriNRNTj8JX12wK+FoxIDW03fxOm/7gGaI0TIZrn59kiqZjLVCWjd5VPuF
	 Bu3gIHMkGUUPA==
From: Thomas Gleixner <tglx@kernel.org>
To: Biju <biju.das.au@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das
 <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 08/15] irqchip/renesas-rzg2l: Split
 rzfive_tint_irq_endisable() into separate IRQ and TINT helpers
In-Reply-To: <20260311192459.609064-9-biju.das.jz@bp.renesas.com>
References: <20260311192459.609064-1-biju.das.jz@bp.renesas.com>
 <20260311192459.609064-9-biju.das.jz@bp.renesas.com>
Date: Fri, 20 Mar 2026 09:50:33 +0100
Message-ID: <87ldfmlw9y.ffs@tglx>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29988-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.057];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 677952D7A1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11 2026 at 19:24, Biju wrote:
> +static void rzfive_tint_endisable(struct irq_data *d, bool enable)
> +{
> +	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
> +	unsigned int hwirq = irqd_to_hwirq(d);
> +

stray newline/ The previous comment about data types applies here too.

> +	u32 offset = hwirq - IRQC_TINT_START;
> +	u32 tssr_offset = TSSR_OFFSET(offset);
> +	u8 tssr_index = TSSR_INDEX(offset);
> +	u32 reg;
> +
> +	raw_spin_lock(&priv->lock);

  guard()

Thanks,

        tglx

