Return-Path: <linux-renesas-soc+bounces-35026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id B5lVKQHDUGq+4gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 12:01:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E2525739608
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 12:01:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=ffO+0698;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35026-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4CC0A30013B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 09:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1780B3F9287;
	Fri, 10 Jul 2026 09:48:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F663F164E;
	Fri, 10 Jul 2026 09:48:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676930; cv=none; b=tGdBT29alBeA1CyfTmQdI+cJ9PKZZcXn9DHTj/g0tY0p8jiQaGNMj2d6OSfOQeEq8EnI3xuSGmPYrOZvCO7kMsfZhItJXourbRKdDFgefD8KQ/KHMhaqRiC/JcKcUpQ40Ajeh0wE1OjiF1YbFWnysFJ9QaGu1fFAlmMMKGzzQ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676930; c=relaxed/simple;
	bh=wuG2shP5X+UkXSmhr4knH5rocVOOk/BakyEWwoAFI/0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=h/Fc8cwg0XpqisHisD4Uoa0SEE+DVd+3Z59Ixun8Jee6jx9L9O0nbzRxn2O2QPhkQ7bemOa+yoF0gAvbvDP6QZT3UsV5dsz+9eSKPyVO9qkd5zQAt8OSZUuThfJ0shkiSiriLE/xKFYra9WE5we+ZuY2aziMJwOXQlii/DRkQpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ffO+0698; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id EE7704E40D3C;
	Fri, 10 Jul 2026 09:48:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id ACA1360341;
	Fri, 10 Jul 2026 09:48:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A21C611BD2834;
	Fri, 10 Jul 2026 11:48:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783676924; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=S8k4iLzkxJVSSUQQwc8HGDvZ17LYlFShfGvdGTUVWi8=;
	b=ffO+0698dM6X34VENvE0Cje5NMC4UCdo5a7VKBYCqDDJFmSorUxab4kQs7JbvzFyYURbcv
	jTwk1gynEPETItolgJXuY0ZTtmn/jbcpEXq+ip3OLqPaOhyK16EgKQFGQFuquH2uf5F52m
	J6WZTychwmy5vzMTENDNgSuFjl0pgprv0h1iOM9ZGzElyDo4By8qCmfqGZL/lOW5ZhOBTm
	TshJisWrE6WbOzwCGGEDbxU9vtLiQ5GW5u/WIkf4RVB5FId3rIdJN7rrxB026RgN1sAavk
	3LxOHW3vk1FVgZPcgmmYNap0tUz1NvwrxangAvzwdh/FZZFRTiOKEAYRthfaow==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Thomas
 Gleixner <tglx@kernel.org>,  Olivia Mackall <olivia@selenic.com>,  Herbert
 Xu <herbert@gondor.apana.org.au>,  Jayesh Choudhary <j-choudhary@ti.com>,
  "David S. Miller" <davem@davemloft.net>,  Christian Marangi
 <ansuelsmth@gmail.com>,  Antoine Tenart <atenart@kernel.org>,  Geert
 Uytterhoeven <geert+renesas@glider.be>,  Magnus Damm
 <magnus.damm@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Pascal EBERHARD <pascal.eberhard@se.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-crypto@vger.kernel.org,  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 02/16] dt-bindings: interrupt-controller: Describe
 EIP-201 AIC
In-Reply-To: <444b4349-3873-4da6-aadd-3605e738ad0d@wp.pl> (Aleksander Jan
	Bajkowski's message of "Thu, 16 Apr 2026 20:04:03 +0200")
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
	<20260327-schneider-v7-0-rc1-crypto-v1-2-5e6ff7853994@bootlin.com>
	<444b4349-3873-4da6-aadd-3605e738ad0d@wp.pl>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 10 Jul 2026 11:48:38 +0200
Message-ID: <87y0fjgop5.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35026-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[wp.pl];
	RSPAMD_URIBL_FAIL(0.00)[bootlin.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:olek2@wp.pl,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:olivia@selenic.com,m:herbert@gondor.apana.org.au,m:j-choudhary@ti.com,m:davem@davemloft.net,m:ansuelsmth@gmail.com,m:atenart@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:thomas.petazzoni@bootlin.com,m:pascal.eberhard@se.com,m:wsa+renesas@sang-engineering.com,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RSPAMD_EMAILBL_FAIL(0.00)[miquel.raynal@bootlin.com:query timed out,linux-renesas-soc@vger.kernel.org:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E2525739608

Hello,

>> --- /dev/null
>> +++ b/include/dt-bindings/interrupt-controller/inside-secure,safexcel-ei=
p201.h
>> @@ -0,0 +1,14 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
>> +
>> +#ifndef _DT_BINDINGS_IRQ_SAFEXCEL_EIP201_AIC_H
>> +#define _DT_BINDINGS_IRQ_SAFEXCEL_EIP201_AIC_H
>> +
>> +#define AIC_PKA_INT0 0
>> +#define AIC_PKA_INT1 1
>> +#define AIC_PKA_INT2 2
>> +#define AIC_TRNG_INT 3
>> +#define AIC_RESERVED 4
>> +#define AIC_SL_ERR_INT  5
>> +#define AIC_PROTECTION_INT 6
>> +
>> +#endif
>
> This interrupt mapping is specific to the EIP-150. The EIP-201 is also
> integrated
> into other accelerators, such as the EIP-97, EIP-196, and EIP-197, and the
> interrupt mapping is likely different there. Maybe it would be better to =
use
> eip150 name instead of eip201?

I was about to rename the file (and the ifndef/define section), but in
the end I feel like it does not actually make sense to do that, because
it would require to include one header per container in the
driver. Instead, I propose another way: let's keep the file name as-is,
but mention with a comment above the definitions that these are specific
to the EIP-150 implementation. This way, if someone want to reuse the
controller for another integration, they can just add their own
interrupt names/numbers below, with another comment stating the name of
the container they apply to.

For future people who would like to extend this driver to another
container: mind that there is currently a list of "unused" interrupts in
the v2 of the driver (in the generic chip structure). This list may
simply go away if one needs one of the three interrupts currently
listed.

Thanks,
Miqu=C3=A8l

