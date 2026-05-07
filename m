Return-Path: <linux-renesas-soc+bounces-32245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EDE/ERKL/GleRAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32245-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:52:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B7F4E8818
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 14:52:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F7163006383
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 12:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74C403EE1DC;
	Thu,  7 May 2026 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="POIXU4pZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5CB3AB275;
	Thu,  7 May 2026 12:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158351; cv=none; b=XLDBazHXDZhr4P9TlqUI9mZW0VXxKpnjPP3ilamRCOWlys1k9fAzLVn8mRi8taXJUAMJk1mWO9itkHd/h3n4YdRCzXXuir+0mpmhxD1nGukwRpKmXbBUg4Xe4CSaHOpakwyysEv8Xj2/aJvFos0pMVWZzrky6nDFZWOqaRUJzoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158351; c=relaxed/simple;
	bh=QiQOSWF1x64jlPOqnU1W4KqrhQ2aByMEzV6kw7lCihw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ha6Td+KP6kr6Aej0fNZAZS6lIOvDGwSZnfuqPO4097EiQKbp7fzBIgAAf3V3zTyS6goKEIAudYig7rsbUsyfFoF9PVN9Xv9po5F97owUKY19ZPL4zV23DyhRMz7uhoiIwytQlTwRzFOkRqzgrra5ZyEdsj2ZgUWDDYO0ESUoPo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=POIXU4pZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23072C2BCB2;
	Thu,  7 May 2026 12:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778158350;
	bh=QiQOSWF1x64jlPOqnU1W4KqrhQ2aByMEzV6kw7lCihw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POIXU4pZA2FZfYxUmDk7E257EMwYUawh2v/qqcAgbNaphQ5bizEHT8V6dKYNn+zzv
	 CcbY5uiQuhwyU8IH4YGR8yAxW1MmlgbI8zMc/mh8ADYr8i4/FZPanlj6h0dt7CTxnz
	 /04Jja6D07yijOPe+SjAc5B98DNi1gsh7ZxNLen6KuFQTnTRd7EwLRI7btPLFqQMcR
	 XYlTJ3XAKYHMIGqvQ8t544oxwxVWwFpaQ9PwItDAm1ojSfzabbh7L+WDb0tbr8bqFw
	 06qFOZNAsIYSNyvBPhX6Tx1i5Y90KONmwVWGVoX7QRmk33YBZx7MgaEOS4Xem0s/OT
	 g8PYiTfwLkSSA==
Date: Thu, 7 May 2026 13:52:24 +0100
From: Lee Jones <lee@kernel.org>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 05/10] mfd: rz-mtu3: make reset optional
Message-ID: <20260507125224.GL305027@google.com>
References: <20260410163530.383818-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260410163530.383818-6-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410163530.383818-6-cosmin-gabriel.tanislav.xa@renesas.com>
X-Rspamd-Queue-Id: 85B7F4E8818
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32245-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,gmail.com,baylibre.com,pengutronix.de,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

On Fri, 10 Apr 2026, Cosmin Tanislav wrote:

> The Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs do not have a
> reset line for the MTU3 block.
> 
> Prepare for them by making it optional.
> 
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
> 
> V2:
>  * no changes
> 
>  drivers/mfd/rz-mtu3.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Also fine.

> diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> index 37d12030e069c..689dbb181d305 100644
> --- a/drivers/mfd/rz-mtu3.c
> +++ b/drivers/mfd/rz-mtu3.c
> @@ -331,7 +331,7 @@ static int rz_mtu3_probe(struct platform_device *pdev)
>  	if (IS_ERR(priv->mmio))
>  		return PTR_ERR(priv->mmio);
>  
> -	rstc = devm_reset_control_get_exclusive_deasserted(dev, NULL);
> +	rstc = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
>  	if (IS_ERR(rstc))
>  		return PTR_ERR(rstc);
>  
> -- 
> 2.53.0

-- 
Lee Jones

