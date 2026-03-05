Return-Path: <linux-renesas-soc+bounces-28908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOnBMjzaqWneGQEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 20:32:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E9A217910
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Mar 2026 20:32:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9FFB1304706E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Mar 2026 19:32:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23D183CC9FF;
	Thu,  5 Mar 2026 19:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vLDZ3TNT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C713D5232;
	Thu,  5 Mar 2026 19:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772739121; cv=none; b=DS9XTys8vU8rCMkyMol9xo9x05OnsZkOo6/ecTqcEkJj/Juw5JqiikrxKuMw3Akv50qnvtYhV621NmxJD8YmNYDg02ObxOyYStRHKpf/FY2uc9xH+laKmMX7/HUnzmdFKBrLbpEwOe+M5eaP0Qf3lFybCbv8zlY1sAag3TntE7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772739121; c=relaxed/simple;
	bh=qXTJBGHSML+jFLUPKU7NcgHwvhU08pW8YqcVNyjSrN8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WOwGFYHpLykFcWPdTZDdMKDmOGGooj8wMXVIVcymqt6YsW6J60AW/nKSaAhIZ/JwHeCiYmlLgtg0OwUJ+gAmyLvEKD6haCa+VnteJGme0IeUJ3vreTPdPIVfvGvNSBB0kGGQ3J7i0Zb2ac3c7LpHTsrz1Fs0EWnGNXM8sqREvw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vLDZ3TNT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5EE5C116C6;
	Thu,  5 Mar 2026 19:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772739121;
	bh=qXTJBGHSML+jFLUPKU7NcgHwvhU08pW8YqcVNyjSrN8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vLDZ3TNTG/O4IPCURPTuCz59DzzXh7JIfL0+qxyZEHCTUacQegKcuHexTAkCzrC3s
	 /RaUcre39+BgT1yhhJ2j1FtEztcwAxW5VEDVEBBaC6K+g2VuNFqUgEU7+GIH1z1sT5
	 HhLyIm7MZdhsbu3etXyxfCc8Rx3MGWLS4Iedp6LT8NXYB5OWnsH9VcPypf06qEvIxf
	 TcflUPnKUCsVwEAyy837e4LD9E73GKByv8WA3h+a6PCSTV3zFlZ+viSJQX0H0WXMa8
	 9UsJoDSp7f+rAFpIdHYSLDbyblhOJfzvCihDumnbdc3I6v6ier3R8uDuh2RU/2DnpX
	 GUAWTME6oZL5g==
Date: Thu, 5 Mar 2026 19:31:52 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] iio: adc: rzg2l: Convert to FIELD_MODIFY()
Message-ID: <20260305193152.253dc267@jic23-huawei>
In-Reply-To: <d42ba403c1fb1aca88b82ba3020ad0ec442a455f.1772705608.git.geert+renesas@glider.be>
References: <d42ba403c1fb1aca88b82ba3020ad0ec442a455f.1772705608.git.geert+renesas@glider.be>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 33E9A217910
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28908-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu,  5 Mar 2026 11:13:55 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> Use the FIELD_MODIFY() helper instead of open-coding the same operation.
> This requires splitting the double OR operation.
Hi Geert,

Looks like similar can be applied in 
rzg2l_adc_conversion_setup()

FIELD_MODIFY() is useful to shorten code, but if we are using it we should look
for all good opportunities in a driver.  Please check to see if there are more.

Thanks,

Jonathan

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/iio/adc/rzg2l_adc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/adc/rzg2l_adc.c b/drivers/iio/adc/rzg2l_adc.c
> index 1010e0511b3e09c1..dcbe112efa863419 100644
> --- a/drivers/iio/adc/rzg2l_adc.c
> +++ b/drivers/iio/adc/rzg2l_adc.c
> @@ -401,10 +401,9 @@ static int rzg2l_adc_hw_init(struct device *dev, struct rzg2l_adc *adc)
>  	 */
>  	reg = rzg2l_adc_readl(adc, RZG2L_ADM(3));
>  	reg &= ~RZG2L_ADM3_ADIL_MASK;
> -	reg &= ~RZG2L_ADM3_ADCMP_MASK;
> +	FIELD_MODIFY(RZG2L_ADM3_ADCMP_MASK, &reg, hw_params->default_adcmp);
>  	reg &= ~hw_params->adsmp_mask;
> -	reg |= FIELD_PREP(RZG2L_ADM3_ADCMP_MASK, hw_params->default_adcmp) |
> -	       hw_params->default_adsmp[0];
> +	reg |= hw_params->default_adsmp[0];
>  
>  	rzg2l_adc_writel(adc, RZG2L_ADM(3), reg);
>  


