Return-Path: <linux-renesas-soc+bounces-35020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rkwoHYi7UGrB4AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:29:44 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3167390CC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:29:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=aCOsNMFN;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35020-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7ACB6303D09D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 09:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EFBA3DA5DA;
	Fri, 10 Jul 2026 09:13:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D228F2DCF74;
	Fri, 10 Jul 2026 09:13:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783674798; cv=none; b=arrAijx5YgtuOXcP+64nFiYmMTWCOB0xl177IZ0oaRfBokve8dvUgM3YvGqUWFer0lk11/0CwQoPyS/8/riEPMjz3BnSAmGRxNX6wAcjWnzzbjwBrowJis3chsrCaNMSX52Us4dk6wEWGnVrM1g/UwAlI7QSEc1uM+UErgdNNAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783674798; c=relaxed/simple;
	bh=Bi7jdPhoSijk8fMT1+N9Z3GA8k77oLKhSuPKJu++n9A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XPQ3wscEMbiPuI17xGw5L2MkDAXwnjTgF2pDi8dJ9kBImhE5RIB3Ra+iBfyEufymHcHLm/EeSBqUizhJtVrLAEou67mxI8CLkejzyoIQL1YtQ8eyXqLouXiSnNEz3mFX5AG7+QeYjwjMbkWOEwVNYpwFaSp7dKSQlDifEOJUyYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aCOsNMFN; arc=none smtp.client-ip=185.246.84.56
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 339ED1A0F2F;
	Fri, 10 Jul 2026 09:13:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F008A60341;
	Fri, 10 Jul 2026 09:13:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37D8211BD144F;
	Fri, 10 Jul 2026 11:13:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783674792; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+hnMtueO5HvdeOz/acHZQ5idFrOiiproNtY+oH5bOPM=;
	b=aCOsNMFNwJCz+pqwsKb34jscePr8UTAlP3OTCYZhqZDfpn5Xp2bcz7eM8z71Lebx0Y4Tbr
	9MqwpZsw8MSn5iqblwJc/tvpxlE/UtDOOv5R+5abHAmfQruyPYGjXjboo8AuGUQv9XE42j
	3yEYBatBS3YIbd5gQoaU80LSdTbENZ8Es1Nd9SuJTgfSEh2FxB3aeOn+IFbIEXhkF4yBpK
	GB84ttbxLOtTikvPShhlgJxtaUkWiucn4VMmeF9n4TUAww4qo2vvC0ZdetAdgjnSxtxzRC
	nDS63qfIatYMgGfnpymBc4f3YTHHeHOUcBcOfgubCit3aLNfWxAsEhKEbeGX+w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Brian Masney <bmasney@redhat.com>
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
  linux-crypto@vger.kernel.org,  linux-renesas-soc@vger.kernel.org,
  Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 06/16] clk: tests: Add clk_parse_clkspec() Kunit testing
In-Reply-To: <ac0j5401vyjIvjCo@redhat.com> (Brian Masney's message of "Wed, 1
	Apr 2026 09:55:51 -0400")
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
	<20260327-schneider-v7-0-rc1-crypto-v1-6-5e6ff7853994@bootlin.com>
	<acqNRVLrPxABvecZ@redhat.com> <87mrzn6opj.fsf@bootlin.com>
	<ac0j5401vyjIvjCo@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 10 Jul 2026 11:13:03 +0200
Message-ID: <87fr1ri4ww.fsf@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35020-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bmasney@redhat.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:olivia@selenic.com,m:herbert@gondor.apana.org.au,m:j-choudhary@ti.com,m:davem@davemloft.net,m:ansuelsmth@gmail.com,m:atenart@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:thomas.petazzoni@bootlin.com,m:pascal.eberhard@se.com,m:wsa+renesas@sang-engineering.com,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:wenst@chromium.org,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org,chromium.org];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,bootlin.com:from_mime,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CD3167390CC


>> >> +	of_node_put(ctx->prov1_np);
>> >> +	of_node_put(ctx->prov2_np);
>> >
>> > Is there a double free of prov1_np and prov2_np? If this is dropped fr=
om
>> > the test exit, then they should't need to be in the ctx struct.
>>=20
>> These two calls increment the refcount on the node:
>> - of_find_compatible_node()
>> - of_clk_add_hw_provider()
>>=20
>> However this makes me realize maybe I should call of_clk_del_provider()
>> in the exit() function. In any case, I believe keeping a reference over
>> the nodes during the test is correct and if there is an of_node_put()
>> call to remove, it should be the on in the _init().
>
> Take a look at drivers/clk/clk_kunit_helpers.c.
> of_clk_add_hw_provider_kunit() will call of_clk_del_provider() for you
> via of_clk_del_provider_wrapper.

Nice, I didn't found that helper myself. Thanks for the pointers.

Thanks,
Miqu=C3=A8l

