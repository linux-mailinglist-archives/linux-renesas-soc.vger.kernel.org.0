Return-Path: <linux-renesas-soc+bounces-35022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8XhmDJ+9UGqq4QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:38:39 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7DB739286
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:38:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b="q8mV/dQy";
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 08CEF30297A7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 09:33:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974D63F5BE3;
	Fri, 10 Jul 2026 09:33:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC513F482D;
	Fri, 10 Jul 2026 09:33:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676004; cv=none; b=pALNEDCVK9SgoiQDr7+S6LatWzcsUJpK+ul38lv95zS6OU9DjgFKIRhgNQBvNFEF0DK9Wu+Vf/V/zknQXW4+xZhu3Ii259U88AhIM3uG/mSiNH0Y0/F+yhOBANYi1+AC3j9lRqiMg0DOGpqNPgulNy8fBkclTKm2Dh8f5gYqSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676004; c=relaxed/simple;
	bh=T04Yklz3oRFt1PRpe4Yj4K9rJt4571BACCXcIi5ZLgs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YgnVC1s4lqEegkmSYDD392yarQ4P4R3tMo9EDzhe9w7w0QmMiXze0T3MZ+ReYVwlsfc3MnqOvtpPfnidlkACGxat7x3OtBFsCHtu8GEdl9eXK8bYTDxYQvWO9xYmD9ghh/ruLW2IvFQQCAFtR2MoIvAK4Ed4c2TRY5PF8aXNrZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=q8mV/dQy; arc=none smtp.client-ip=185.246.85.4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B97A84E40D44;
	Fri, 10 Jul 2026 09:33:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8397860341;
	Fri, 10 Jul 2026 09:33:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6785F11BD280C;
	Fri, 10 Jul 2026 11:33:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783675999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=PdzuN4WWG8ww2PkB8OywBoYS6cV9TEq80igjFkOCi/E=;
	b=q8mV/dQyQsB2f4rYUwBqW3OZLRasJRAZbKA3DU+PyPTl31vCsxi+uQtCG2pbCJGi5Wx/zz
	RgU0cRWpd2k0SPbMFGJwnAhZAwtJYZZ9E1s/RdzaCJUhjbS1xR6Tkv/7U8ZZ/kia6h18AC
	J/h6yzyJdM8QsdGfsN8lrk0mFvFTHTLDkAFkuSiU75sqGVZdKpJD5k9y+meBwBvFzRl5u1
	IE7+z4uRTXMqy/vfwpwuFx7Iwd4KfgAMG0oqKRKU60xA6BrH3vORoo4pIS2irNWU2sKSIn
	0sZZcjaiDevXL9spIHjAH7Vb4Wd7i+0GVphUqHZw6HFVsaYgXQm0+J9eOpB5rw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Antoine Tenart <atenart@kernel.org>,  Christian Marangi
 <ansuelsmth@gmail.com>,  Conor Dooley <conor+dt@kernel.org>,  David S.
 Miller <davem@davemloft.net>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Herbert Xu <herbert@gondor.apana.org.au>,
  Jayesh Choudhary <j-choudhary@ti.com>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Magnus Damm <magnus.damm@gmail.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Olivia Mackall <olivia@selenic.com>,
  Rob Herring <robh@kernel.org>,  Thomas Gleixner <tglx@kernel.org>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Pascal EBERHARD
 <pascal.eberhard@se.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-crypto@vger.kernel.org,  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 01/16] dt-bindings: clock: Introduce nexus nodes
In-Reply-To: <177595659711.5403.18166114937625609985@lazor> (Stephen Boyd's
	message of "Sat, 11 Apr 2026 18:16:37 -0700")
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
	<20260327-schneider-v7-0-rc1-crypto-v1-1-5e6ff7853994@bootlin.com>
	<177595659711.5403.18166114937625609985@lazor>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 10 Jul 2026 11:33:11 +0200
Message-ID: <87a4rzi3zc.fsf@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35022-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sboyd@kernel.org,m:atenart@kernel.org,m:ansuelsmth@gmail.com,m:conor+dt@kernel.org,m:davem@davemloft.net,m:geert+renesas@glider.be,m:herbert@gondor.apana.org.au,m:j-choudhary@ti.com,m:krzk+dt@kernel.org,m:magnus.damm@gmail.com,m:mturquette@baylibre.com,m:olivia@selenic.com,m:robh@kernel.org,m:tglx@kernel.org,m:thomas.petazzoni@bootlin.com,m:pascal.eberhard@se.com,m:wsa+renesas@sang-engineering.com,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,davemloft.net,glider.be,gondor.apana.org.au,ti.com,baylibre.com,selenic.com,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bootlin.com:from_mime,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AD7DB739286

Hi Stephen,

>> +title: Clock Nexus
>> +
>> +description: >
>> +  A nexus node allows to remap a phandle list in a consumer node throug=
h a
>
> Should this say "remap a clock specifier list" instead of "remap a
> phandle list"? A phandle list sounds like there are zero cells.

That's right, thanks for the suggestion!

Thanks,
Miqu=C3=A8l

