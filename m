Return-Path: <linux-renesas-soc+bounces-31355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIibHF3m4WmKzgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 09:50:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4F24182E9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 09:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7F5AF30059B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Apr 2026 07:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07EA138228B;
	Fri, 17 Apr 2026 07:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kSSVjutW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D1DA382287
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Apr 2026 07:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412244; cv=none; b=uNcFfCXXMe4B1JXgy/a3afGnUNSpo5v2t71a/KyGZq15d1ENTQtLmiU88pI2C95tGMcSYBaJwdUtxaDBLwU0AG9dChWfMpLdUG5e5U6UPUY1psIPOyx9/J5KBj3zjqjtLh3RPVXYmdtHVTIoOp57nSEkFNp7v35KPRl2gU8sBGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412244; c=relaxed/simple;
	bh=mN9SIeXfRCe7zV5stdN76y8+361AYnzBpG7i78ynP6E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Oh15f104Rcl5zhYx7a2YPvDYoMAuZtnA2P4ufWb6CPpzNXLUSA62vNcoIpFPmjy8UdQgy68bMbaqtJJgC+/Z+Nm07RWqp6oSn1fNYLlmvE7sXFEC1j5GyAbdSdAKeV8a0NPhqh7uPCGVlL+ARBs53i0SUA5hI5GHu4sMZ34jcAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kSSVjutW; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 304B91A332D;
	Fri, 17 Apr 2026 07:50:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 00A6360497;
	Fri, 17 Apr 2026 07:50:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C98CC10460952;
	Fri, 17 Apr 2026 09:50:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776412230; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TfT7hmmZx8Kr7kxPd8PXiGjFEe0ZJMTCF2H4FVfguC0=;
	b=kSSVjutW5+6st3wLsgmGMbKBs+AWGo9jKztX2gQQHiLq/D5ZaxHz6TQmy6/ktSAAKONcQq
	f3ydv7wWoVRA6Q5iHv23NRExFtqmD9MxBsLqw46YhA1XbbTeTWEdLuqNRIiUJ25ghokeOm
	+b2o1rbkO6Ue3xrujQzfvDBIKF4otZMr3Wl6w4NGIFcwa7U9Ibfj777V/EBtTxB9DL9ix4
	gLttANP+B7PX+lLr0ygG+R9l7BDCTonz097+IYQlWJdZ0Ug7lkLK82rZhjofdasPo+lkbr
	XIsX6CNajkMrXAtWPPRhhFfWhMYEmWYGQrV8PRbFtQl8v/l3UL9y0V+mTI3WFw==
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
Date: Fri, 17 Apr 2026 09:50:20 +0200
Message-ID: <87tstac9fn.fsf@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31355-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[wp.pl];
	RCPT_COUNT_TWELVE(0.00)[23];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 1C4F24182E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Aleksander,

On 16/04/2026 at 20:04:03 +02, Aleksander Jan Bajkowski <olek2@wp.pl> wrote:

> Hi Miquel,
>
> On 27/03/2026 21:09, Miquel Raynal (Schneider Electric) wrote:
>> diff --git
>> a/include/dt-bindings/interrupt-controller/inside-secure,safexcel-eip201=
.h
>> b/include/dt-bindings/interrupt-controller/inside-secure,safexcel-eip201=
.h
>> new file mode 100644
>> index 000000000000..ead73bd96296
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

Thanks a lot for the heads up, I didn't had that information, I will
adapt the naming to make it more accurate future proof.

> As for EIP-28, it is also part of EIP-94. EIP-94 is supported by the
> amcc driver.
> EIP-94 consists of four components:
> * crypto accelerator (unnamed?),
> * PRNG (EIP-73d),
> * TRNG (unnamed?),
> * PKA (EIP-28).
> Only the first three components are supported by the amcc driver.

Is this driver upstream? I didn't find it. Anyhow, thanks for the
feedback, I will update with this knowledge in mind.

Miqu=C3=A8l

