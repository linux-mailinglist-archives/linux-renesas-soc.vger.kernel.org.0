Return-Path: <linux-renesas-soc+bounces-33805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XY6MNMcuKWpLSAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 11:30:47 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id D317D667DB0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 11:30:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=hFLhApMX;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="f bPSEoq";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33805-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DCE703046B69
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2026 09:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BD83BA222;
	Wed, 10 Jun 2026 09:14:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1943BCD3A;
	Wed, 10 Jun 2026 09:14:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082896; cv=none; b=YDlZ+kvL7mfV4Ytbk+ki26d+ph6yDUfQqcftFt4pphGgAKjcU2zYp8zRpegTtkpearaUF0kYf4HOkmy1tDkEhvvSVZN7QlTNcA230zpjOrUybyl6AH6vLVs01vJ63+lTjdfkMqfFKuWSPkSzPqcqGKpXAeP4J3JMXggf4c2S04M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082896; c=relaxed/simple;
	bh=HqIULhI3b7647nddpq6zQkDQPO1NJ/oNd3jU6sTQ44M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fFM4NFKvMadIWZV9JkfwPPug7eEocALvLCR/99A5f46jut84Fkug6SidApbUWwVJM5KGdqchOm8BlyOfMJsRxxiUnyMZ51UMbmo0uRgWADlMtT1cY4VLlxDak4LT4Yb3rsg7uk/DsaY/QMnvfbHxdycAnrQSFbZFdo4RZHHwGmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hFLhApMX; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fbPSEoqi; arc=none smtp.client-ip=202.12.124.159
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 9611D7A00E2;
	Wed, 10 Jun 2026 05:14:52 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 10 Jun 2026 05:14:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781082892;
	 x=1781169292; bh=3yo/U4zdqOGiza2buRx7viS4BvrMUEv8SC3a8B6j87M=; b=
	hFLhApMXWXSNfTuOF3aD+hMvkl/kRdi976659ghl7wtBd1R4RtbMMKDXqCeKLPSH
	UGwtNwiM5ZI/jTnJGoXdqE2eAWpxJnLm6JO/kbu2lOZbbVpSGJZRMbWIAvLICeh9
	5Sq/fwTSrdfV5udpWLTjP02JbReE1G6r1LHeIunsoqalDtNwxPvYYh65xb9Slc8x
	x/o18696boM/zX8PZwGO+bhw6qKix5FWWkf7QcU5YXek1nlLJtifaYWUGbs0xv1R
	6IYmRbTdEPJ7N2cXvGFoHl6k2hZNW7viHDHFW2v6Lfs9ksX0UAJolZSM/P4znVbn
	2NdQ2JacgFiJMbdim3FDaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781082892; x=
	1781169292; bh=3yo/U4zdqOGiza2buRx7viS4BvrMUEv8SC3a8B6j87M=; b=f
	bPSEoqiJW7mYRdAJ/0YN/xDLYzZT0+kqHnKsxu7JCJJds9IvB7xvs24d1JypnqhN
	2Yr8hR0vEJgCL3rqdEEuzczldUe/7Y73W5yD9j9vZ5PS58d3Idk+Q8S+byuf8qMi
	hcHDGZlTPYRHtYiQfHUVmk2A0jr/IBVX826SA0B9MOdCUpTN6s9mQlsTTxrai5+j
	8d6APD1VgcWPKu5Te+OmSjJg6aL3U7fhhydGCskrmKgzF8QuRrRZEfdJsYw+F0FK
	V3BnSOo1jOf6BwfAEXl/9BUl6az1UUoXl4kGJn1ckU6kpXEFa93+rWnxQvRGqhEc
	1Yk0STi9fDFYMlYtTAV9g==
X-ME-Sender: <xms:DCspas7o01iDubUTo5FT31CQ5VW_Ry_64WpERVOilHl_dcRyw41Yaw>
    <xme:DCspasZx0VYsYvCGhIMg-PlTptViZuEsRuW29p1KhFLrLKXlGiWrlTFyM_wFH4a6Q
    7jpjEs5ufWVF_fnP29gDmc4RsllInyKkq6dTlSjv2lPsRDYtUHY09s>
X-ME-Received: <xmr:DCspaiRx6S_EnkEZr3kJFwbmYVeNHhdWMKy5yKJIHEQykoVPCGxhb5Sjky6lcPgFwJwWIGjuQQv7GuQlC149aWO5sIO6gnU3SDux>
X-ME-Proxy-Cause: dmFkZTGs6pOpieH000WI8vwuexWh8o2R1t8h3HIWZjgnuP6wT5WtiXaBnwmkRethnSMxnd
    YZxod+uyAtqSHF4xD1vBcVdhkhs0RtPKfH+4bP+uygCX5mZTE7NMtD37whpkpbo6AL/YiI
    3AWwbaXeecdREQkXhD2JyRMOPrw8DtI+XeVS+LgSZDxcEpw2X89FYYvtdW4mNkauIMXECh
    y4M2OUc10URgivQshWEQTshordWIzEbX2n/KApYJ8hPfyfHdZrgW5ffjHIeZol4UPVK1vY
    rx4pO8XqNoA71FCdE0VgQjy5mrB7kGiBuqyF57fml1th6TUrn1fcLu0tXGOtAmA0tBsRin
    gSHVuBkzXlVr/GU/c1wV4NzQc5OhBg+F7VVO8yL2O/DlJvtiGWPVCTDp38mWyJRtfnxRha
    h+//alNAA0qtwVfO0dsBiRHdBTI5HVluDdBZSXH/2hzvRrwv8ye/ZdaRqD9APJikGFrV3Z
    FbaM5vPgrcTof/IJ7By+7HM9clgb8/eInnmsF88rtjtMS60AHisKfA0Nbfp5Wr7GgttQUS
    HpdrVFu1QCpg1iJRqrSkf0jxD+jjl1Z7/3IFgD7GIRlvTx9/GvCFGwMbaIhJQkRAnwAyLe
    HpOhkH2KGuk8L4V+gqwNG2bHrT/tw9Io6Sa/MU4ZWQIjTyL9fmWAdjgDgKZg
X-ME-Proxy: <xmx:DCspahLQoXgOxIy1_RX1uThey4w-4AWuf21DeXdvp4v1AgaStU9HYQ>
    <xmx:DCspaoUBbfpnTJw-qHByqhDkHWiJcJKg8D_tZgOM3pHucPqcrRaoZQ>
    <xmx:DCspatihm4j41yweRtBYhyarp-00SnsrqOO_oCE-HYe6PAwHJVcK0Q>
    <xmx:DCspasv-eF9uT5FJn2Utjyo2nJOWyg9mGkGx1TaNepx8-DY_5jxkWQ>
    <xmx:DCspaunuZxXvnOgCBbxTxV8KPPAUaiGJ8lhOIRB6pFwxkQtjUmf5FW59>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Jun 2026 05:14:51 -0400 (EDT)
Date: Wed, 10 Jun 2026 11:14:50 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"DavidS. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [net-next 1/3] dt-bindings: ptp: renesas,rcar-gen4-gptp: Add
 binding for R-Car Gen4
Message-ID: <20260610091450.GD2465390@ragnatech.se>
References: <20260609215711.2960150-1-niklas.soderlund+renesas@ragnatech.se>
 <20260609215711.2960150-2-niklas.soderlund+renesas@ragnatech.se>
 <6bd0229b-4895-48a2-9e36-0ea5296c7fb5@kernel.org>
 <20260610085354.GC2465390@ragnatech.se>
 <ded0ae1a-535f-4524-9c3c-e9970bdf387a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ded0ae1a-535f-4524-9c3c-e9970bdf387a@kernel.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33805-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:richardcochran@gmail.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:netdev@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ragnatech.se:dkim,ragnatech.se:mid,ragnatech.se:from_mime,vger.kernel.org:from_smtp,messagingengine.com:dkim,bootlin.com:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D317D667DB0

On 2026-06-10 11:01:27 +0200, Krzysztof Kozlowski wrote:
> On 10/06/2026 10:53, Niklas Söderlund wrote:
> > Hi Krzysztof,
> > 
> > Thanks for your comments.
> > 
> > On 2026-06-10 08:54:06 +0200, Krzysztof Kozlowski wrote:
> >> On 09/06/2026 23:57, Niklas Söderlund wrote:
> >>> Add bindings for the R-Car Gen4 gPTP timer. The timer enables accurate
> >>> synchronization of the clock in the control system. The timer is
> >>> system-wide and used by different Ethernet devices on each Gen4 platform.
> >>
> >> A nit, subject: drop second/last, redundant "binding for". The
> >> "dt-bindings" prefix is already stating that these are bindings.
> > 
> > Thanks, will fix.
> > 
> >> See also:
> >> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> > 
> > Not sure I follow this one, L18 reads,
> > 
> >   "Few subsystems, like ASoC, media, regulators and SPI, expect reverse 
> >   order of the prefixes::"
> > 
> > But 'git log Documentation/devicetree/bindings/ptp/' shows all commits 
> > in that directory use the 'dt-bindings: ptp:' prefix.
> 
> 5 lines below.
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Ahh, thanks.

> 
> 
> Best regards,
> Krzysztof

-- 
Kind Regards,
Niklas Söderlund

