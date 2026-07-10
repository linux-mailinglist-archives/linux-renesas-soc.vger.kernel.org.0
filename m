Return-Path: <linux-renesas-soc+bounces-35053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Z2f9CcXtUGqN8gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 15:04:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC4673B09A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 15:04:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=eBUf2nVN;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8FB13007217
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 12:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6C242B335;
	Fri, 10 Jul 2026 12:59:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0940B41B36C;
	Fri, 10 Jul 2026 12:59:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688382; cv=none; b=O+GBMZGVOHNXvWty9aXQp5mAfLcFbjrvo8nFMUGvbGxNlPlaI+DabcoMU4S3R6CHTVRTm3zCmlUMfba8+pLfJItWH9KKxgOmoxqAlDU32OKm/1VBWTuYBLYzhntRxomSfzOQW8pU81DxeFXnK4/0uzniR7GQCEdU5nViH8TtoVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688382; c=relaxed/simple;
	bh=/6sXJuUOctndqmdSaxuO2kvNa2414Xs031qJp2Qo3/0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G5EUHOa1P3FuNQAp+44oi2ldbnITYxNlXHFz9SJzG2+bLFfzJ6bmqavv2imTLzit5rnpTSfcUmdbePc+GXgqf4rZwe42ZA0IL9dNQFwrcMnQUczxs3zKSSgGe+LMZEkbGjVFNS9ANH77gNfH7+iGNdcGLHZ1x0YPBZZJSW7OW4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eBUf2nVN; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E2652C2C644;
	Fri, 10 Jul 2026 12:59:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1629960342;
	Fri, 10 Jul 2026 12:59:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7EEEB11BD041E;
	Fri, 10 Jul 2026 14:59:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783688373; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tVE3k2wNc11oGNnWAyHGoU5XfSdc5JYzcD9eXOmLp6c=;
	b=eBUf2nVN8AVKC6kOJnhTuK/k1N66T/yVJ/bHVl3sko1ofApykwoi8BTLKdwU8HriZh9YsS
	zJynoQn9LOafgWeqL29qT9ogxPZGhp+EhHgD6oMDDCEMjj97E/FbLfMCaa9KT6OefQ4jm/
	8IpPdMtr7Wbag7M4Tpv3pgyUYMvS/EyTAmO0PJFUGqUrJzu2/I2YIDHcQv1U9KWvGq56P2
	/naUd+n9+sIYYhAjAWI0bNvHa9uygtCYzyCnWMZE4S2LJ9jscI3aItLSvm1kvO8FdG4smz
	kiyq7TvXWb79NO9mRBWB3GnW/rqAQR2400EF5ZK9djy6Mf13KuXeRXKAE7oHmA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Thomas Gleixner <tglx@kernel.org>,  Olivia
 Mackall <olivia@selenic.com>,  Herbert Xu <herbert@gondor.apana.org.au>,
  Jayesh Choudhary <j-choudhary@ti.com>,  "David S. Miller"
 <davem@davemloft.net>,  Christian Marangi <ansuelsmth@gmail.com>,  Antoine
 Tenart <atenart@kernel.org>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Magnus Damm <magnus.damm@gmail.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  Pascal EBERHARD
 <pascal.eberhard@se.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-crypto@vger.kernel.org,  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 05/16] dt-bindings: bus: eip150: Describe the EIP-150
 container node
In-Reply-To: <20260407194449.GA3542959-robh@kernel.org> (Rob Herring's message
	of "Tue, 7 Apr 2026 14:44:49 -0500")
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
	<20260327-schneider-v7-0-rc1-crypto-v1-5-5e6ff7853994@bootlin.com>
	<20260407194449.GA3542959-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 10 Jul 2026 14:59:25 +0200
Message-ID: <875x2ngfv6.fsf@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35053-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:olivia@selenic.com,m:herbert@gondor.apana.org.au,m:j-choudhary@ti.com,m:davem@davemloft.net,m:ansuelsmth@gmail.com,m:atenart@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:thomas.petazzoni@bootlin.com,m:pascal.eberhard@se.com,m:wsa+renesas@sang-engineering.com,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0FC4673B09A

On 07/04/2026 at 14:44:49 -05, Rob Herring <robh@kernel.org> wrote:

> On Fri, Mar 27, 2026 at 09:09:27PM +0100, Miquel Raynal (Schneider Electr=
ic) wrote:
>> Part of Inside-Secure's SafeXcel family, the EIP-150 is some kind of
>> container node composed of:
>> - a public key accelerator,
>> - random number generator,
>> - an interrupt controller.
>>=20
>> It also acts as proxy for the clocks.
>>=20
>> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin=
.com>
>> ---
>>  .../bus/inside-secure,safexcel-eip150.yaml         | 58 +++++++++++++++=
+++++++
>>  1 file changed, 58 insertions(+)
>>=20
>> diff --git a/Documentation/devicetree/bindings/bus/inside-secure,safexce=
l-eip150.yaml b/Documentation/devicetree/bindings/bus/inside-secure,safexce=
l-eip150.yaml
>> new file mode 100644
>> index 000000000000..1b3d83a852f5
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/bus/inside-secure,safexcel-eip15=
0.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bus/inside-secure,safexcel-eip150.ya=
ml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Inside-Secure SafeXcel EIP-150 container
>> +
>> +maintainers:
>> +  - Miquel Raynal <miquel.raynal@bootlin.com>
>> +
>> +description:
>> +  The EIP-150 is a hardware container, it has its own interrupt
>> +  controller inside to which a random number generator and a public key
>> +  accelerator are wired.
>> +
>> +allOf:
>> +  - $ref: simple-pm-bus.yaml#
>> +  - $ref: /schemas/clock/clock-nexus-node.yaml#
>
> Generally, if a schema has 'select: true', you don't reference it as it=20
> has already been applied. And you have to list the properties here=20
> anyways because you need to define how many #clock-cells for example.

I see, I'll drop that line. Thanks for the explanation, very appreciated.

>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: inside-secure,safexcel-eip150
>> +      - {} # simple-pm-bus, but not listed here to avoid false select
>> +
>> +  clocks:
>> +    minItems: 1

Should be:

       maxItems: 1

I did the error once, and copy-pasted it two more times in this series.

> Seems to me you are adding this to satisfy simple-pm-bus. Maybe this=20
> should just be simple-bus?

I really need that clock, it feeds my container and is then populated
through the child nodes. I actually selected simple-pm-bus on purpose,
as my use case seems to really fit the description?

>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  ranges: true
>> +
>> +patternProperties:
>> +  "^interrupt-controller@[0-9a-f]+$":
>> +    type: object
>> +    $ref: /schemas/interrupt-controller/inside-secure,safexcel-eip201.y=
aml#
>
> Better to just list a compatible you require. Like this, the schema is=20
> applied twice.

Mmmh, ok!

>> +  "^rng@[0-9a-f]+$":
>> +    type: object
>> +    $ref: /schemas/rng/inside-secure,safexcel-eip76.yaml#
>> +
>> +  "^crypto@[0-9a-f]+$":
>> +    type: object
>> +    $ref: /schemas/crypto/inside-secure,safexcel-eip28.yaml#
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - ranges
>
> The bus schema requires all these already.

I'll drop them.

Thanks!
Miqu=C3=A8l

