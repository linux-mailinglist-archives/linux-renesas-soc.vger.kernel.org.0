Return-Path: <linux-renesas-soc+bounces-29727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA4lENhhummoVwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:27:04 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE702B7ECA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 09:27:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 99A7D301DD19
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 08:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E5F237F006;
	Wed, 18 Mar 2026 08:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwaXoYv5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A0D37754E;
	Wed, 18 Mar 2026 08:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822280; cv=none; b=QL5WbADFKtRWehynz9/dYglVYF/CqxrqOosnzIVMOHRm27CoeTbvpeuG/VJR0qjg8FVyvIPlFwxCazHXvmJSGX3AnRxWQhY/Mq98YLpkMPhypvvqhbqRz4djFEkE/NzRfmX2goKNUatz3kbJ4GNfih42bwM4UsHtEQc34ud/W9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822280; c=relaxed/simple;
	bh=oj3/+sZUIJ3popq4EHGAmg40vT3v23TMUBlTnBagB90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JwRnJR/XfkFIxV107buc5r99SSXw++zxZB7rsvpWAXwgUPlohWncwISBemTyMs2FdjnD7Nq2IfTr0CqmgGWnUBArZOYkZHJx1pJvDea9YN21qVyjIyjzQyM7SlN2xDOEr4LK67UedUcLlMlJBxMRjrjMLPw8KdoolruL1aLjHHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwaXoYv5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D847DC19421;
	Wed, 18 Mar 2026 08:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773822280;
	bh=oj3/+sZUIJ3popq4EHGAmg40vT3v23TMUBlTnBagB90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwaXoYv5ASO/jzntr5A25pcCixxW0v4ZrXZDjdVHDbDotqfoukvVsZgnxrHqKaxMB
	 55BiTxuEYFEQoZBs/5Q7IFj+Q4aBWDO/RQxTV8x1apF0Kzsq8/xggQnjwcBBDqAMqp
	 4W8BbU+n//AadOWNEGxmkCfDjlCE2KQyKlgK4nDp72ZAHbUPUXzi6Ulu0RYAYoifv/
	 iKktdsIlCs+BHMfzgRJ1/kF7gMha/e721xWbKuC0nLYkKaifsWKSEv+6AtfSJP7Q/u
	 f23Hvnq3oOxqJ5yyRuU5TE7sxfsN7PZeAAKvLM3IxVVsR+YGFUvPV3QeiiWUt+V7Px
	 Rmcxwgc0Ndemw==
Date: Wed, 18 Mar 2026 09:24:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawei Liu <dawei.liu.jy@renesas.com>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, 
	"geert+renesas@glider.be" <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	Grant Peltier <grant.peltier.jg@renesas.com>
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: isl68137: Add compatible string
 for RAA228942 and RAA228943
Message-ID: <20260318-cordial-robin-of-revolution-05e79c@quoll>
References: <20260316053541.3903-1-dawei.liu.jy@renesas.com>
 <20260316053541.3903-2-dawei.liu.jy@renesas.com>
 <20260316-intrepid-koala-of-snow-33eceb@quoll>
 <OS7PR01MB11926C7139DE648454D744DA2D540A@OS7PR01MB11926.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS7PR01MB11926C7139DE648454D744DA2D540A@OS7PR01MB11926.jpnprd01.prod.outlook.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29727-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[roeck-us.net,vger.kernel.org,kernel.org,lwn.net,linuxfoundation.org,glider.be,gmail.com,renesas.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3AE702B7ECA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 09:00:24AM +0000, Dawei Liu wrote:
> Hi Krzysztof,
> 
> Thank you for the review.
> 
> The RAA228942/228943 are register-compatible with RAA228228/244/246
> family, using the same PMBus command set and the raa_dmpvr2_2rail_nontc 
> driver configuration (2-rail without TEMP3 sensor). 
> 
> In the driver code, they reuse the existing device configuration, so no 
> special handling is needed. That's why they're added to the enum list in 
> the binding.
> 
> I will send v2 with improved commit messages to clarify this.

Read netiquete about top posting.

Best regards,
Krzysztof


