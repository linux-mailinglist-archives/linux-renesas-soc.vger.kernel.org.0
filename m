Return-Path: <linux-renesas-soc+bounces-34952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id A4nON7KLT2qWjQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 13:53:22 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0941E730B08
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 13:53:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=qwUaHM6E;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=DOOtB6P8;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 106AF30013A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 11:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B838F413245;
	Thu,  9 Jul 2026 11:53:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D70E32BF41;
	Thu,  9 Jul 2026 11:53:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783597996; cv=none; b=Cdv4WGNTJzGf751OZMQf0czRvzinHSODGpUVEuzva0rft9v6bUvX1tNICjUToF6i2I5Vhd22SWJcCkm28/rks5d03wfIgFsK9RDv+8Q/7FnaNc2wBQBlts3ufGlzy2l+1g0ef0XhU5xPxaniDogD/SrQfAnl8WbMV5JMVTaL06c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783597996; c=relaxed/simple;
	bh=Jt3bWshzIpAZ7zdD0ClTg2301JzotUeMVtwHUve6YUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FH8F4uHTaWFqGV1+4aSehqQQJwVoQZE+1W2TKxRi/+3T0e24XXkPnVMJspfkJUuMqHW8e8jM6n9eyA08uYOZPCOKwOFJUt5ScVfuoJ2fU2PRTmnYF4BNr4vETxLM4PyLhyGJ5uyubLd8yl18a36bxuz7Y2BsUDlsdpj4iOxXe3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=qwUaHM6E; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DOOtB6P8; arc=none smtp.client-ip=80.241.56.152
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gwtdM40ZMzKw0Q;
	Thu, 09 Jul 2026 13:53:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783597991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cfmRBwpMkOAL1gdqiVsz8y3IJffq2RYA84kWTiYDvV8=;
	b=qwUaHM6Eg3Ou3Bb0vunTLAoXs61dFPHLMhhiF803+/Jk7tGXPQHdkPqRqdFwX327XNZbfY
	AGx84tbDctqfUeDtdV7muYc5c9MTJ6/5bQe5aJSl0RJvyfnAG7zBXzAbS1WGBy/8VXozCw
	lgwaXl1i84PU/h99cC0CnWhxCMZqZP8dXB6kYcB/65GtrGQ+qBVfnNZl19aKurE/EJAbN5
	ZAHhFia89/apdfMAKjk3ueNTBX5ajX3OO5ybC5755NvmlBRD91slVDshtWHy8eEViT3UEG
	GphaTDKfONhxR9prkcBdrsKt3dVXvfCQTWcpcyChtwOh0iR+ehCiV24h5OQnPg==
Message-ID: <c0c8f839-d3e7-4253-9d95-85bf425c88ff@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783597989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cfmRBwpMkOAL1gdqiVsz8y3IJffq2RYA84kWTiYDvV8=;
	b=DOOtB6P8+pOLeA4ezin/VGU3dZ/2eAbqKz0Rm/2pZxSeukm/lorAVbfc68T7EQvZan9PiD
	8eDFhl+etBS6dr/LrnEEjo69DVUUmoEZdX6SNeqf7K8Yik2bmxPr6YxfW1L4h/x1+bUXtX
	HDRgOmafzDfBZi7gbMAg+aF6QCjVj3cToFLLZc6/wiSkBpOdRxbSdL0ifwWbAALBQ9K8n2
	m8WXdXok25uC1/CO2Nr9s8IKLPOE/DMZ0BW5IGjBGxFxCoa4eJAsNW6JSlYqYxCxlkKFzd
	5/JZvXB/pBcgJB5UB4iLO4yCnSkyoBGVuoGytn9nOlj3P5EhqR9q45BejKkYIQ==
Date: Thu, 9 Jul 2026 13:24:00 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Marek Vasut <marek.vasut+renesas@mailbox.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1783505142.git.geert+renesas@glider.be>
 <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
 <59725f93-5269-4b0e-8633-48821219877f@mailbox.org>
 <CAMuHMdXCooODm3YuE1JjZJAc2BeQuD==kWbA+ZzpXRA3fqa0Vg@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdXCooODm3YuE1JjZJAc2BeQuD==kWbA+ZzpXRA3fqa0Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 3um84g88ek55xnbu4c56jy8ahwccrd9w
X-MBO-RS-ID: 50f867c705c83dacbe1
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34952-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:dkim,mailbox.org:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0941E730B08

On 7/9/26 12:24 PM, Geert Uytterhoeven wrote:

Hello Geert,

>>> +             mdlc_ddr7: system-controller@e8380000 {
>>> +                     compatible = "renesas,r8a78000-mdlc";
>>> +                     reg = <0 0xe8380000 0 0x1000>;
>>> +                     #power-domain-cells = <2>;
>>> +                     #reset-cells = <1>;
>>> +                     bootph-all;
>>> +             };
>>> +
>>> +             mdlc_hscn: system-controller@c9c90000 {
>>> +                     compatible = "renesas,r8a78000-mdlc";
>>> +                     reg = <0 0xc9c90000 0 0x1000>;
>>> +                     #power-domain-cells = <2>;
>>> +                     #reset-cells = <1>;
>>> +                     bootph-all;
>>> +             };
>>> +
>>> +             mdlc_rt: system-controller@19440000 {
>>
>> Please keep the list sorted (0x19440000 should be before 0xc9c90000).
> 
> These are sorted by instance (Module Number), as per Table 18.1
> ("Target Module hierarchy of Module Power Gating and Module Standby")
> in the documentation.  This order is indeed a bit odd, as it differs
> from both alphabetical label order (unlike e.g. hscifN), and numerical
> unit address order...
> 
> Any guidance?
Do you think those MDLC instances might be on different sub-busses and 
we might need to model those busses using simple-bus in DT ?

