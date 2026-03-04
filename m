Return-Path: <linux-renesas-soc+bounces-28790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFzuG45mqGl3uQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28790-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:06:22 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FEC204D74
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 18:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D0F7A3016899
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 17:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48FC371D15;
	Wed,  4 Mar 2026 17:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gUa6ToLm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC143630A4
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772643929; cv=none; b=UvD+W1CNqAO7Nq19rZBOHE8B3Ha35Qsan/T818n3E7pAwtXbQEIg6Zg876qVOmAR6N6i8p8wq5U+fp0uX5QZs3EM2w4+5WECflZXlmeGtfh5eEMON5vPK30BAZGC8DZCLv3s1mQNV4go79YirUdmlg/5sULViipTfH12h5+NFOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772643929; c=relaxed/simple;
	bh=OH1iVEGyufKJWZ6nGRBCTh5TbGVr0ahXb5ytegQDXX0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGOnhxyHZSnIWTmEHdUhoP2f9ceSoyfJ2OwViY+dVclLthor97V/msRaFzBaoXTDyhIywaKIsjowpUhYCMPbfY7qO67ifaYFEEQmyZ8g8VF7F1uDw+7KMkTidUTDnL0++Z6CXhZWMQUpbfUgFbGjrHyfaak2Ia6xmHUa/JyM+Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gUa6ToLm; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-38a1eb8b560so36101811fa.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 09:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772643927; x=1773248727; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nBw1fSxD2dFeBYtvLIBCd+WEBb8h9+p5M44FyAJ5Xvo=;
        b=gUa6ToLmuWM0OrLv9AywbGnfujj6GZ/nmEOwOXc6G/RWspZDdCLfILCNws6RkqJSPA
         8b/zjyw/nPBoZ+d40aC3l0Xz1zXF31bvrXujZtKrLT+cSKbcF0QJQ69LyIFeD/0zZRwD
         go/box5xt6durT9zXwl26ORkbsoddFFa0qz6Q2lteOcbVTOwvxFBY0qkfb4Bjkw2G0Rf
         c9nAOI2YdjNix0jmzo9lugkSHKDpAqBD5Of0i+x8QtIZk0QwpWlyrH7JnATiIT9/v7dj
         goClXYYF9hoetfca1DUcmnP1/OZWMKhT6fQfRe/cnl3WKQbuS1P8ssEa9U7uy99qxVcB
         WGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772643927; x=1773248727;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBw1fSxD2dFeBYtvLIBCd+WEBb8h9+p5M44FyAJ5Xvo=;
        b=Trn7KT/G9ztHBQM86FTtoZYIQ8A+Pknw3ZPZfStamB9uvxzu5mnQy4IuU2amFoUId2
         gJjR4pL1ngBUUaeQYsjjaQxrlbuT+OClN65neZXK9K62ipnxaOXal1SbOVAIds7s5vHr
         SpI/EV1FVTl4Bi42ZlIKJp4bbI7Du5SH6iCj5ClFtaYF4Eb7Wg4TReF5LJ4RuAHLN8JM
         D5T35pMXla1In6j08lxQvJtYKGAZ+SUky90II2eU/Un6AmvOCkhRqWl9jRUggu5DvwxX
         HGpkz2OoCtkipMEWWONlWQr8qguG6VCbeXF83imEMWLCWTb+RcTcnvE+JTAkaA/CcHOy
         hJbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+WFlRH7HhzOpYKEJqaSlxHGn8ksvfSvtZVrj5eamxsKDABYt/CJrJUaRqXT2SxLAuOHcwpkZ7pr3yksperm7uTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMs+oajORw4bwF66/lsdgh2iL46ds/d7scr11nqqDLPNCPtbwb
	V3449HO6XQUFJ6D2imGfF3zhY8nRnU9OohGOojPb7tidzovV00qF4Zdg
X-Gm-Gg: ATEYQzwxdnVR4UljneqdqSkHQjMbVZFaqzNR/ugaQ795cktfWNj9TC1GxxT5Ltmo7fv
	BBTt1YAgQRW1XNKSOem80eLaRoaLjD31hvX81PwdFUSSEPrg1wU0QAJbMyyMG6sAUr1NlBP0nN0
	kamezpElzxovCFquZd+rHUuldPJrqKVgxZ8+fnvhJmIRK8fdfDYaOqwhPn7Az9wcfDEM1a/2hSv
	7ML7N1AfqO2DCZ9ft5uDRLrHFTinDVz0oldsSMfyET6kKkcfXsnR8h5R50K0gW5fAMAJMFjPQkf
	KTpq9NS+i4JV7u/KK2PEBeY1AwHQMvLYjXLSwt09eYpoK8W5LzjQZu8XkNwIn4+0SCHPrHj3pQW
	7PH3Da90yNxUOLKt/9BO5VlJ+D2WmLuo57xOKSizAz34VJbFghzmiBlHj5cbPtl73dLUlxll84V
	50zMXz+WuSQ7Dnf4ClCUxGT+DDye5sI5ayf7Wd1haZmRoG2z+FDLFfH7GbRrN79iPU8BsVtRyTj
	SpTypwn6rzBx6k=
X-Received: by 2002:a05:651c:41d8:b0:384:9355:6a7e with SMTP id 38308e7fff4ca-38a2c5906e9mr21403371fa.17.1772643926140;
        Wed, 04 Mar 2026 09:05:26 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:2f9:5688:1071:60fc:93b:c6bf? ([2a00:1fa0:2f9:5688:1071:60fc:93b:c6bf])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12d81b51fsm397959e87.84.2026.03.04.09.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 09:05:25 -0800 (PST)
Message-ID: <535cfe49-4f70-4ed9-ae4f-92215140e6f6@gmail.com>
Date: Wed, 4 Mar 2026 20:05:24 +0300
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/gic-v3: Print a warning for out-of-range
 interrupt numbers
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <62b849967d71d73e028fb65efee717986ef847e6.1772641758.git.geert+renesas@glider.be>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <62b849967d71d73e028fb65efee717986ef847e6.1772641758.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 12FEC204D74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28790-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

On 3/4/26 7:31 PM, Geert Uytterhoeven wrote:

> gic_irq_domain_translate() does not check if an interrupt number lies
> within the valid range of the specified interrupt type.  Add these
> checks, and print a warning if the interrupt number is out of range.
> 
> This can help flagging incorrectly described Extended SPI and PPI
> interrupts in DT.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> This would have prevented the issue fixed by "[PATCH] arm64: dts:
> renesas: r8a78000: Fix out-of-range SPI interrupt numbers"[1].
> 
> [1] https://lore.kernel.org/1f9dd274720ea1b66617a5dd84f76c3efc829dc8.1772641415.git.geert+renesas@glider.be
> ---
>  drivers/irqchip/irq-gic-v3.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index 20f13b686ab22faf..d75163e71bf22473 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -1603,15 +1603,27 @@ static int gic_irq_domain_translate(struct irq_domain *d,
>  
>  		switch (fwspec->param[0]) {
>  		case 0:			/* SPI */
> +			if (fwspec->param[1] > 987)
> +				pr_warn_once("SPI %u out of range (use ESPI?)\n",
> +					     fwspec->param[1]);
>  			*hwirq = fwspec->param[1] + 32;
>  			break;
>  		case 1:			/* PPI */
> +			if (fwspec->param[1] > 16)

   Not 15? Don't PPIs use INTIDs 16-31?

> +				pr_warn_once("PPI %u out of range (use EPPI?)\n",
> +					     fwspec->param[1]);
>  			*hwirq = fwspec->param[1] + 16;
>  			break;
[...]

MBR, Sergey


