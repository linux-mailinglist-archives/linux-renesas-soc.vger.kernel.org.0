Return-Path: <linux-renesas-soc+bounces-28915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id FR3UOv+Oqmm/TgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 09:23:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC7221D062
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 09:23:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 200273052629
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 08:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95587372691;
	Fri,  6 Mar 2026 08:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a0el0AhV"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F452347527;
	Fri,  6 Mar 2026 08:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772785104; cv=none; b=CwPJ5WmuIHQS7A6ndHwwyjSbq82M6AIDoR4GZPwm2y/LHG8pQ9xfrqeulrShd9esQhWikRKUn8PFT3jAQ7lbA1M3YVq5yS00LFlRkbtudPDrqDC/rJun15YvAvpLfTaBkzTE57pP4U5JeChAw+keWF5Z9yrF/PXgtKkeUDCYzXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772785104; c=relaxed/simple;
	bh=IuG+vsZROFDb7NeVDqWVEGbfJg4FLMzqUC6J2najeSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jhbNQup7P6sYdE78VjD2D+W1ylNzeeSucIevuAbRJmgNgSY4Q3AGl3qhWdTxe0U4lSBi5VsjXzCFDe+t8D5dx3Uxi69ZvhGyra2jI26i0PFwg6gc4cQ9HoFiDFV87gsecJVtQvccUiTofe5w62dfhTwaItt9VhDIEOWrFyUKXFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a0el0AhV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762C5C4CEF7;
	Fri,  6 Mar 2026 08:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772785104;
	bh=IuG+vsZROFDb7NeVDqWVEGbfJg4FLMzqUC6J2najeSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a0el0AhVp7tvh4fNnLUed+ARY0AUUV5WbxJCXnU41KcRWBiKElkzcQNnpNpRH851g
	 qAuAe2vZRkdAbu388yiczDhpVgmOx1sGMd9KgHnCorrcGej4/YUmXTI9FoZseHylr8
	 IP74jCXxkZy2yfLrWMkrTF2DhWnqwD7/AI7DxP++w//DS2Jrbhl8UJiTAtBQYQjqv5
	 knqUK/dbeLV0W3o8b2V74DzeEu/rLYwTYDUDd/06yLVhBrhGtB84sogJ520k3e8cHr
	 Bm/BLIvSmK7qUqC2RAU6pUcS1fRzFULrFerFJ197175lLD79sDMAdJsHM9B9LYBWcL
	 SLp71mTfcAW5g==
Date: Fri, 6 Mar 2026 09:18:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: phucduc.bui@gmail.com
Cc: dmitry.torokhov@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com, 
	javier.carrasco@wolfvision.net, hechtb@gmail.com, wsa+renesas@sang-engineering.com, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: input: touchscreen: sitronix,st1232:
 Add wakeup-source
Message-ID: <20260306-fossa-of-unnatural-authority-29e0ed@quoll>
References: <20260305113512.227269-1-phucduc.bui@gmail.com>
 <20260305113512.227269-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260305113512.227269-2-phucduc.bui@gmail.com>
X-Rspamd-Queue-Id: 8EC7221D062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28915-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,glider.be,wolfvision.net,sang-engineering.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCPT_COUNT_TWELVE(0.00)[14];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Thu, Mar 05, 2026 at 06:35:11PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Document the 'wakeup-source' property for Sitronix ST1232 touchscreen
> controllers to allow the device to wake the system from suspend.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  .../bindings/input/touchscreen/sitronix,st1232.yaml          | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
> index 978afaa4fcef..672544e5a26e 100644
> --- a/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
> +++ b/Documentation/devicetree/bindings/input/touchscreen/sitronix,st1232.yaml
> @@ -32,6 +32,10 @@ properties:
>      description: A phandle to the reset GPIO
>      maxItems: 1
>  
> +  wakeup-source:
> +    description: Device can be used as a wakeup source.

Drop description

> +    type: boolean

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


