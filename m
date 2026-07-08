Return-Path: <linux-renesas-soc+bounces-34879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zNNOFm5KTmojKQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 15:02:38 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A36CC726921
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 15:02:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=VOAH5+5D;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34879-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 42CC9300A271
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 12:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09973466B48;
	Wed,  8 Jul 2026 12:59:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D5A4657D8;
	Wed,  8 Jul 2026 12:59:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515597; cv=none; b=E3IIyr4HGxeGfmMs/L1gIVb8gwyOztGtIi5yPpeuV4GZ+w7JFiIW/kkTZ2SfnmmK/edAK3GqxWw8MF2YQAEbaLXHH6S766okxC0AmT4pqe/Kf12DPKQzzMciY1GIE9AyC7B7hvcZfMaBzm9biA0n5vIOpTzAHFSWgEaEPq7d7f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515597; c=relaxed/simple;
	bh=V7aK68/26qBGEJjFgpBRUzW4ex72yHCq+Vx2aTGwmY0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JnGPBq3OcKdOyrk310u43pTH5fvTiDyVqSc6eia3zHbfQ7jnyllsdePSiXbDZv9xBc7B2EUMm014XSKwFiAp787K+xaIAoLjYuviWqKf7SCOvZJuca9rMA5FViHTQoZu0fbotkh7U6SKRzDC4xjAcTtSL2uZ78TRC6K7giMhfxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VOAH5+5D; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C9DABC8F455;
	Wed,  8 Jul 2026 13:00:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D759060337;
	Wed,  8 Jul 2026 12:59:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C0E2411BC0DDB;
	Wed,  8 Jul 2026 14:59:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783515593; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KqbPk7W/xg9la/kQEemsDvBwfwa0jXXj/79ki0DXFUk=;
	b=VOAH5+5DHS2rc2xNoQRdbNJZoXcP50tsx2tg6u9Vn+1G8/gWEAO0EhcRuPez+p7StIu5MH
	5fcxKSvilbQdrohHObOos7NpPJBK8lX44UxS3cvlop87Sm0cSG8YYmO44ycvaW0orfuhZy
	NQghTqrl59BpuSjzHFOXtUQPv5YMjTLAtDyDT40cNKtXO8QcPdl1X4jtZiUWsz2zCJ2Rgl
	CeWCSdKD9pGBpJYBBUA9rQQp2tPdQ5D0x5EhdaZLqtQeTsFPLSGQ0Qy5JlSbbYP7ixkq6i
	602YLUhIXs7OP5tq88tgmqV5VIyFmyTd7GLXGVYeyb6fWcndHksvT6yg0Lgjzw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Thomas
 Gleixner <tglx@kernel.org>,  Olivia Mackall <olivia@selenic.com>,  Herbert
 Xu <herbert@gondor.apana.org.au>,  Jayesh Choudhary <j-choudhary@ti.com>,
  "David S. Miller" <davem@davemloft.net>,  Christian Marangi
 <ansuelsmth@gmail.com>,  Antoine Tenart <atenart@kernel.org>,  Magnus Damm
 <magnus.damm@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Pascal EBERHARD <pascal.eberhard@se.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-crypto@vger.kernel.org,  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 12/16] irqchip/eip201-aic: Add support for Safexcel
 EIP-201 AIC
In-Reply-To: <CAMuHMdWr5OT0iAbZMgDAizO9KnhmyUN3hsqFnp+JYRao4aKu_A@mail.gmail.com>
	(Geert Uytterhoeven's message of "Wed, 8 Apr 2026 10:05:18 +0200")
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
	<20260327-schneider-v7-0-rc1-crypto-v1-12-5e6ff7853994@bootlin.com>
	<CAMuHMdWr5OT0iAbZMgDAizO9KnhmyUN3hsqFnp+JYRao4aKu_A@mail.gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 08 Jul 2026 14:59:48 +0200
Message-ID: <87ldbliqm3.fsf@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34879-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:olivia@selenic.com,m:herbert@gondor.apana.org.au,m:j-choudhary@ti.com,m:davem@davemloft.net,m:ansuelsmth@gmail.com,m:atenart@kernel.org,m:magnus.damm@gmail.com,m:thomas.petazzoni@bootlin.com,m:pascal.eberhard@se.com,m:wsa+renesas@sang-engineering.com,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A36CC726921

Hello Geert,

Sorry for the late replay.

>> --- a/drivers/irqchip/Kconfig
>> +++ b/drivers/irqchip/Kconfig
>> @@ -826,4 +826,12 @@ config SUNPLUS_SP7021_INTC
>>           chained controller, routing all interrupt source in P-Chip to
>>           the primary controller on C-Chip.
>>
>> +config SAFEXCEL_EIP201_AIC
>> +        tristate "Safexcel EIP201 AIC"
>
> Is there any platform dependency that could be added here?

In practice no, because this is an IP block that has been integrated in
many SoCs (I don't have the list). However if you care about reducing
the list of possible options I can make it depend on the RZN1
architecture, where I need it, but I don't see this as an relevant
move. What do you prefer?

Thanks,
Miqu=C3=A8l

