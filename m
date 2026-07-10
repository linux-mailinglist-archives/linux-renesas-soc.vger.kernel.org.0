Return-Path: <linux-renesas-soc+bounces-35047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nYdJIHXbUGp/6QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:45:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C10373A609
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:45:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bootlin.com header.s=dkim header.b=QYTxTAwl;
	dmarc=pass (policy=reject) header.from=bootlin.com;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35047-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 717B3304B686
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:45:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9A10421A02;
	Fri, 10 Jul 2026 11:45:29 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC98A4192FF;
	Fri, 10 Jul 2026 11:45:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683926; cv=none; b=dcJHNI/Vk/Qc9zvfexPDccgA9RE4bXFOr6nrpldaLUHxcGf4eym2QUzd5A/HHztT6AJQnTIOYvTKVDOWffcmnvuSP9OHUuirzY7sypDDnhaZ7ZiFeOnPXTNwTQ41UDaSOaYgOaacVWUQ7eAIv4uKbd7zmve7y9c0abMw4sRAECM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683926; c=relaxed/simple;
	bh=u5nphNG168GZ/VoM3JlEPFsfbmOIChAwWaJlqtZYhRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q0SUhZRuVfAbjDd0AtHz2u7lQK67f3bohd87gAIq/UGu3Sl4UV9YReOUsDn4kxZygSSetFOXszbQQSL7DmZIH8p02GmOii9IF+i/C+DE2YN+wC3A3tlWCI6VnRjgWrNW5aD0ydTHk3W4gtjbZKJVDngLT4Xcyh8LwQo2Auhdb88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=QYTxTAwl; arc=none smtp.client-ip=185.171.202.116
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 761ACC2F4FE;
	Fri, 10 Jul 2026 11:45:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 828E560342;
	Fri, 10 Jul 2026 11:45:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B21111BD0281;
	Fri, 10 Jul 2026 13:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1783683909; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lNEfnd2GOwK6OV6o3n233rtSH9H6bRRqMfAyW9Ht5sQ=;
	b=QYTxTAwl8ZZXjQUPTzcKeqjX0JGuQk0ZxPy1WBaHghwxQ14Zbow3vbxZLkweXwy9an4Rrs
	iF83k5c+2MPNBs52qoP9HCDa10QpUnqxWF+90v+GHdaaFRIU8sH+BsNMsRcfJIPqNhQoj5
	/JyDADaosgmQ3YFMvJa/694nNHppGxSrixD96m1Z9qWZ3LfzvDacOcUJfbQ3NT4Yzvy90v
	Gj3FoBW+DOqcbX/E2tByHZxsmKxfTeDAezvKuaFuFlmdgV4016fhRh1xRKFcbAIEEL9mdG
	Nchh02+7vjL7SK9qqTVdwab/4W5DIfcjRyILYca8ShWQjF4smF+DWQoc438ZRg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,
  Thomas Gleixner <tglx@kernel.org>,  Olivia Mackall <olivia@selenic.com>,
  Herbert Xu <herbert@gondor.apana.org.au>,  Jayesh Choudhary
 <j-choudhary@ti.com>,  David S. Miller <davem@davemloft.net>,  Christian
 Marangi <ansuelsmth@gmail.com>,  Antoine Tenart <atenart@kernel.org>,
  Geert Uytterhoeven <geert+renesas@glider.be>,  Magnus Damm
 <magnus.damm@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Pascal EBERHARD <pascal.eberhard@se.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-crypto@vger.kernel.org,  linux-renesas-soc@vger.kernel.org,  Herve
 Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 10/16] clk: Add support for clock nexus dt bindings
In-Reply-To: <177595635458.5403.1619739189587608339@lazor> (Stephen Boyd's
	message of "Sat, 11 Apr 2026 18:12:34 -0700")
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
	<20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7853994@bootlin.com>
	<acqT3Dh03y3JiLLc@redhat.com> <87y0j76p8o.fsf@bootlin.com>
	<177595635458.5403.1619739189587608339@lazor>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 10 Jul 2026 13:44:53 +0200
Message-ID: <87jyr3gjbe.fsf@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35047-lists,linux-renesas-soc=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sboyd@kernel.org,m:bmasney@redhat.com,m:mturquette@baylibre.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:olivia@selenic.com,m:herbert@gondor.apana.org.au,m:j-choudhary@ti.com,m:davem@davemloft.net,m:ansuelsmth@gmail.com,m:atenart@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:thomas.petazzoni@bootlin.com,m:pascal.eberhard@se.com,m:wsa+renesas@sang-engineering.com,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-crypto@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:herve.codina@bootlin.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[redhat.com,baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
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
X-Rspamd-Queue-Id: 0C10373A609

Hello,

>> > Before I left my Reviewed-by, I should have double checked Sashiko. It
>> > has several questions about this patch. The first is:
>> >
>> >     Are there other places in the clock framework that need to transit=
ion to the
>> >     new map API to ensure assigned clocks work?
>> >=20=20=20=20=20
>> >     For instance, assigned-clocks and assigned-clock-parents are parse=
d in
>> >     drivers/clk/clk-conf.c using of_parse_phandle_with_args(). If a de=
vice
>> >     specifies an assigned clock that routes through a nexus node, will=
 it fail
>> >     to configure because the map is not traversed?
>>=20
>> The goal of the nexus node is to isolate what is behind. Are
>> assigned-clocks et al. supposed to traverse a nexus node? I am tempted
>> to say "no", but I'm open to discussing this ofc.
>
> Why would assigned-clocks not traverse the nexus node? If I'm a DT
> author I would think any clock specifier should be routed properly
> through the nexus node.

Ok, giving this another thought, it may indeed be relevant to apply a
default frequency which needs to traverse the nexus to be active. I've
done the same change in the clk-conf.c file and tested with a dummy
example, it just works.

Thanks,
Miqu=C3=A8l

