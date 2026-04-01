Return-Path: <linux-renesas-soc+bounces-30679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cG/3BefizGmjXQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30679-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:18:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E47A377713
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 11:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74390304B4E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 09:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614993C73CF;
	Wed,  1 Apr 2026 09:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="LwhwsEKj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C50392819;
	Wed,  1 Apr 2026 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775034639; cv=none; b=lp4V2engbHmURT/xEuL190kHLTkNslparbotU54sOuhbHT2NROlki7lR7QakaJL0RpZkA1kuCsNVRVhvOuSEsAri3+DJgIoaSuHCrR8lJ4ucXTuPsihVmsf7jPN/awgyb8zXdH9YVIwKmq1S9JbAlkAc+zgmwUU182oJ/Onx1GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775034639; c=relaxed/simple;
	bh=67tehFPULsnBQBSHurQ2H+katU3ihm8OP1wiQ5SN8fk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pa7LvKZ7V3HmPpzEK0nyHAPTDd+vIjcVYmzoPDsyU2D5NgccDAu28PNR/Sk3i6dio+IGkSBeTrTcPk1+3t4vzdYPnKBVCOIMoMC0EWUe2rha5NlJ+WyyKkwlLvWxAmJH7mOeDBJGSRors2khKTtgMcYOYvsXTdrTa0//u8JMglU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=LwhwsEKj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 710984E42887;
	Wed,  1 Apr 2026 09:10:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 41314602BF;
	Wed,  1 Apr 2026 09:10:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA9F8104502B1;
	Wed,  1 Apr 2026 11:10:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775034634; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gfFQ035rSqrjjpjp2jqpEiQh/kF9oL8HMuP9CrZqj/Y=;
	b=LwhwsEKjNlEBqqEVyofN+JFGNFS15C4QOr1PXfOjON/7jKRYAAQiD028lxS7GCtUJR8+f2
	TzoBwQKcYTWGoVgCLXvajbBd9zGtjWBRqo43GIsGlSObzXofhEwEd8Q8MNkqS1Ok5/TdIB
	IHbPeVMmtpsmK9X90J+CFkSPqhUF3R0CvQSuTti+Vfq+GcT4capSvhSRZSvdsVc2X/9Ppg
	jnakrNXj0PDlHGbfHQMDaNKe26qjnNEyd2aWX9/apcjTtz0tubwQAB59nqAt7bnzo70FuZ
	DIajGeSqt590jxe/ifGehmLSYe5WWY3rGWBXrbXV6AKPo0YaeZ7Njlmsj0WhSQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Olivia Mackall
 <olivia@selenic.com>,  Herbert Xu <herbert@gondor.apana.org.au>,  Jayesh
 Choudhary <j-choudhary@ti.com>,  "David S. Miller" <davem@davemloft.net>,
  Christian Marangi <ansuelsmth@gmail.com>,  Antoine Tenart
 <atenart@kernel.org>,  Geert Uytterhoeven <geert+renesas@glider.be>,
  Magnus Damm <magnus.damm@gmail.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Pascal EBERHARD <pascal.eberhard@se.com>,
  Wolfram Sang <wsa+renesas@sang-engineering.com>,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-crypto@vger.kernel.org,
  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 12/16] irqchip/eip201-aic: Add support for Safexcel
 EIP-201 AIC
In-Reply-To: <87pl4oayll.ffs@tglx> (Thomas Gleixner's message of "Sat, 28 Mar
	2026 14:10:46 +0100")
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
	<20260327-schneider-v7-0-rc1-crypto-v1-12-5e6ff7853994@bootlin.com>
	<87pl4oayll.ffs@tglx>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 01 Apr 2026 11:10:29 +0200
Message-ID: <87bjg36o6y.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30679-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.920];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 5E47A377713
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Thomas,

>> +struct eip201_aic {
>> +	struct device *dev;
>> +	void __iomem *regs;
>> +	struct irq_domain *domain;
>> +	struct irq_chip_generic *gc;
>> +	u32 type;
>> +	u32 pol;
>> +};
>
> Please follow:
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct=
-declarations-and-initializers

Ah, I didn't know about this document, I'll go through it and fix the style.

Thanks for the feedback,
Miqu=C3=A8l

