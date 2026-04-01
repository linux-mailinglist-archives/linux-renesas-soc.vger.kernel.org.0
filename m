Return-Path: <linux-renesas-soc+bounces-30674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALLPHs7bzGmEXAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30674-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 10:48:14 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BA037710C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 10:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 819933004DF2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 08:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 979F23B0AF1;
	Wed,  1 Apr 2026 08:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O8gwdWor"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1033396D2B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Apr 2026 08:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775033284; cv=none; b=OZ7C3lBuKxHaExDHoz5jlfWHNn7ABEHtZZlaDyCj0L1y+9UeSWy0XD9BUBj3oj5lXhpeZr+Lc9LjJriVNAPsEXCjUYiekeaFvfY/BrAM4+95azy7pvyobyLBSPExFh9rRw1qtft39wWk3sT/11ulXUopvCuPVnw0OLqisc0xeMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775033284; c=relaxed/simple;
	bh=kbzqwPjUI5FPIJ6Pezp/hV9jTHQNFhZvMfXHh1uylQM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CFEjtTjWNbwSsPQZE7v5kvUoxcgE1WckWYU3U3Lze2WgSUuZiDv0BBy5jPaaDUPgK0IOD/mamQNGERO6bgjwykU42W3WVZQwGX134haD84496odZcI0vXoUut5ECKRhd2paUYx57AZrVT6eWOax6VfEVJDzycKn9qdfOXRlxYR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O8gwdWor; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 183C4C59969;
	Wed,  1 Apr 2026 08:48:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2799F602BF;
	Wed,  1 Apr 2026 08:48:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A232104502B1;
	Wed,  1 Apr 2026 10:47:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775033279; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MulX6YMpnNOMv0Pee5WdBa40QBlB89kOy61SqtPUmhY=;
	b=O8gwdWorFGZ31oS+MUxUypavWrJm+WPFW7B9iYYf3nLc9EIVFbgNYH63p4x6hVyLOQ0owi
	DVEKZRJGe9fKHyuKzeosSHTJjPuClPcoe3qKSHiASpnph+6DJYEI1QO86tbKGmq7tNAaCa
	eOZa4WUj92yF+GeqNgexZfhQ6FQVTPliQN9YsLW/80Qi3IgqJuVChweuxfHjjKvFjwRShm
	3GZ2JwjptP7jnvMgvRTcNYaI887GlPBQOYCE2fEkiYjuNSFuqKDRTX48XzHD3BxGfmK6Xj
	ThbolGyeWrENnGcYTK/LswFcFGTPIfjdoy0tPogo5o9nL3igAjB/PihoOY+Mmw==
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
  linux-crypto@vger.kernel.org,  linux-renesas-soc@vger.kernel.org,  Herve
 Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH 10/16] clk: Add support for clock nexus dt bindings
In-Reply-To: <acqT3Dh03y3JiLLc@redhat.com> (Brian Masney's message of "Mon, 30
	Mar 2026 11:16:44 -0400")
References: <20260327-schneider-v7-0-rc1-crypto-v1-0-5e6ff7853994@bootlin.com>
	<20260327-schneider-v7-0-rc1-crypto-v1-10-5e6ff7853994@bootlin.com>
	<acqT3Dh03y3JiLLc@redhat.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 01 Apr 2026 10:47:51 +0200
Message-ID: <87y0j76p8o.fsf@bootlin.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30674-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,selenic.com,gondor.apana.org.au,ti.com,davemloft.net,gmail.com,glider.be,bootlin.com,se.com,sang-engineering.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-0.913];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:dkim,bootlin.com:mid]
X-Rspamd-Queue-Id: 15BA037710C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello Brian,

First, thanks for the whole review.

On 30/03/2026 at 11:16:44 -04, Brian Masney <bmasney@redhat.com> wrote:
>> -		ret =3D of_parse_phandle_with_args(np, "clocks", "#clock-cells",
>> -						 index, out_args);
>> +		ret =3D of_parse_phandle_with_args_map(np, "clocks", "clock",
>> +						     index, out_args);
>
> Before I left my Reviewed-by, I should have double checked Sashiko. It
> has several questions about this patch. The first is:
>
>     Are there other places in the clock framework that need to transition=
 to the
>     new map API to ensure assigned clocks work?
>=20=20=20=20=20
>     For instance, assigned-clocks and assigned-clock-parents are parsed in
>     drivers/clk/clk-conf.c using of_parse_phandle_with_args(). If a device
>     specifies an assigned clock that routes through a nexus node, will it=
 fail
>     to configure because the map is not traversed?

The goal of the nexus node is to isolate what is behind. Are
assigned-clocks et al. supposed to traverse a nexus node? I am tempted
to say "no", but I'm open to discussing this ofc.

> https://sashiko.dev/#/patchset/20260327-schneider-v7-0-rc1-crypto-v1-0-5e=
6ff7853994%40bootlin.com?patch=3D12563

I have mixed feelings concerning Sashiko's feedback. I will go through
that page nevertheless, there are interesting comments in there.

Thanks,
Miqu=C3=A8l

