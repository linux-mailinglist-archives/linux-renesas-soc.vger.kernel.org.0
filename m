Return-Path: <linux-renesas-soc+bounces-27192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cL3GCwuwcGmKZAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27192-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 11:52:59 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F9F558B5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 11:52:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 609EA66292C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Jan 2026 10:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517EE3BFE41;
	Wed, 21 Jan 2026 10:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="XStGGwYv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ECD34D4F6;
	Wed, 21 Jan 2026 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991957; cv=none; b=d59uY3u/DQ0aFi+8ke3N8BuBLYQvo1dJEVe7MhRt2aZQ5W5eZg/k/SSWWFu1eb+pD8+D4l4ZVL59eUD4DAo/eOO1D1uqXicgkrXZbrDhTb1rn49ivPAQly9PIRR5zZ773Tb18KB2Hj0FPBd/ZJXtTdP5eym+MQIqLNSl7pXUgBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991957; c=relaxed/simple;
	bh=B1iFdTnWdguGhyY0doGStm07ZJThdPbc6qy3UF/3NPM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=X2AvRd+0YUlrfDbMlUUPD5xT+KzxWVOaxbhUk9nPKnSncBxQL1gRLBA42zvafL7JXsStsyqLxXrwXZAKAyNer9CTiYoZGx7TO6gnMYYrxnMWpF1szvF5FEkPIQE6xTwDCsu6iA9eFwKGQXes6/Qp3hBuHpiF8nP3vJWeNd2Wv4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=XStGGwYv; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 59075C21A86;
	Wed, 21 Jan 2026 10:38:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 87EB16070A;
	Wed, 21 Jan 2026 10:39:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC935119B118F;
	Wed, 21 Jan 2026 11:39:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768991952; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9C2gF0qyhM8eqSeDpbcnEFwXTWl9i/IdHkoxWX/E6MU=;
	b=XStGGwYvqLbj+oEWCAhnIceDPZDBnhInkkRrEei5Vs6wNH+zoFm8gMKqPBLdm54b1Ybml/
	kOIh85QIQfjwq1h0zSdnpNmIkq8WJ6girq7brMRs0nUlzl2PzNYWnifimrhz82DiN03w7B
	0/QRnF5bbcFB6srKUf20e/M95HMK5ZTPCV6+mMwHSowNh/ftw5f4opI1i+DRu5yizL5YLy
	Ql/9Aj06b1HppB4juBBSJV4bVvHgmH1M/dMvref3bE7Z39p57w5WuBs+5KXCdEL5zRXUbc
	I0oHPWim/qh2lP9QDt77nbAlRv2QVF81X7mQl/2Fx4k8DxbBplyJeNYbNWXEjQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,  Mark Brown
 <broonie@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Magnus Damm <magnus.damm@gmail.com>,  Vaishnav
 Achath <vaishnav.a@ti.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  =?utf-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>,
  Wolfram Sang <wsa+renesas@sang-engineering.com>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Pascal Eberhard <pascal.eberhard@se.com>,
  linux-spi@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 01/13] spi: dt-bindings: cdns,qspi-nor: Add Renesas
 RZ/N1D400 to the list
In-Reply-To: <20260121024002.GA1845406-robh@kernel.org> (Rob Herring's message
	of "Tue, 20 Jan 2026 20:40:02 -0600")
References: <20260115-schneider-6-19-rc1-qspi-v2-0-7e6a06e1e17b@bootlin.com>
	<20260115-schneider-6-19-rc1-qspi-v2-1-7e6a06e1e17b@bootlin.com>
	<CAMuHMdW5hwNu-07-7xvyWdcGKUZy+pCX0=W=JNgd4h7m72wQFg@mail.gmail.com>
	<87qzrpucae.fsf@bootlin.com>
	<20260121024002.GA1845406-robh@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 21 Jan 2026 11:39:08 +0100
Message-ID: <87ms27qmgj.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linux-m68k.org,kernel.org,glider.be,gmail.com,ti.com,bootlin.com,sang-engineering.com,se.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27192-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[bootlin.com,reject];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,bootlin.com:mid,bootlin.com:dkim]
X-Rspamd-Queue-Id: C7F9F558B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


>> >> +      - items:
>> >> +          - const: renesas,r9a06g032-qspi
>> >> +          - const: renesas,rzn1-qspi
>> >> +          - const: cdns,qspi-nor
>> >
>> > Doesn't the need for (at least) the CQSPI_NO_INDIRECT_MODE flag mean
>> > that this device is not compatible with cdns,qspi-nor, and thus the
>> > cdns,qspi-nor fallback must not be used?
>>=20
>> I understand the question. It is true that I use driver data to limit
>> the number of features the IP can use and this data is associated to the
>> Renesas compatible, but I believe all other flavours of this IP would
>> also not work without driver data attached to their front
>> compatible. None of the SoCs with the Cadence QSPI IP actually would run
>> without their own driver data. For me the fallback compatible is
>> relevant because it describes the hardware as "this is a derivative of
>> the Cadence controller" (and it is clearly the case, and this is also
>> mentioned in the reference manual), even though I agree using
>> cdns,qspi-nor would definitely not work alone. But again, none of the
>> other flavours would anyway.
>
> Fallbacks should be usable on their own. We've generally moved away from=
=20
> having these generic licensed IP compatibles because they always have=20
> per platform changes.

Thanks for settling my doubts. I will drop the cdns,qspi-nor then.

Miqu=C3=A8l

