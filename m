Return-Path: <linux-renesas-soc+bounces-27938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kID2NO5ghGng2gMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 10:20:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D6AF08B3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 05 Feb 2026 10:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 83C7D304466A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Feb 2026 09:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6FE368263;
	Thu,  5 Feb 2026 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kYrOM7L7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68D729D29E
	for <linux-renesas-soc@vger.kernel.org>; Thu,  5 Feb 2026 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770282974; cv=none; b=XqveYX+7RAmwMJbfkTZcSWkU+ZdrjMtg8ueE8wskSRP6UdbHZV4buIbhSpii5BTOYOkwdBKiA+5DsidhEbNwZoJcyDZ9j62BOf1JL1he5/XnT0o8f1SqrVuGvClQIEhF9pQzEUVjJeYCzuD+UvCg/kyh1wMGU9Dj1pgKWGk3BBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770282974; c=relaxed/simple;
	bh=lfyDH/EtMDxUMAlHqjlG/srZY4gDA1nFKslB8ivNFGc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=c971fE7SXXKeVMm1PwAx8U5IBLmUXY08mz9A15nEengxyOLbaLbDxj9nJ19nPuFaz6rAV9f6Uv8Pr8x0EyQblIh5nD2sWNGCWrufuh9zkNcHRrnG71SqqIrmB2toz0/e58mRMZU6VGTr3KXg7HHCO2MoET1dvKJPVeAobPQSso0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kYrOM7L7; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 26FDBC243AD;
	Thu,  5 Feb 2026 09:16:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FD9F606FD;
	Thu,  5 Feb 2026 09:16:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BC00119A88F7;
	Thu,  5 Feb 2026 10:16:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770282966; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9nFcXg3tPp7Xl7rf98Pg7rTcjp+5AL6yQ44qr6m3xjk=;
	b=kYrOM7L7Vso54SE4Gz3sQZDTUQGFuWZKxMDIfA/x36iBlzHe0/Q+vD+Y3DFl5/SRwttAMG
	Csp2a1atP4Kk6cihcXjB+vYJg/CJxMwNB59mrCY88qQK86crIPf98G2CSPCdstk+bxAL4T
	RM4sNUqQaolDXq+9psRRjtqZJ2wmY2k+f9I5hRgArQBDQnjy5XRV7o3jmghks3M5AyvPi9
	WDh7egCmZX2Vek0IqZedG+9gCaHARhMN6XlZ4VewuEQTTae6SEl0wxKEeCzDwwy7FboQmW
	X1HNqb7SWmGDLSUCox7WXykDEvvY3kBy2CVPWc/P4QUYq5wElvXbND2K8AGHsw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Geert
 Uytterhoeven <geert+renesas@glider.be>,  Magnus Damm
 <magnus.damm@gmail.com>,  Vaishnav Achath <vaishnav.a@ti.com>,  Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>,  =?utf-8?Q?Herv=C3=A9?= Codina
 <herve.codina@bootlin.com>,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Santhosh Kumar K <s-k6@ti.com>,  Pratyush Yadav
 <pratyush@kernel.org>,  Pascal Eberhard <pascal.eberhard@se.com>,
  linux-spi@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-renesas-soc@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/15] spi: cadence-qspi: Add Renesas RZ/N1
 support
In-Reply-To: <176968523282.21695.1970063208785534195.b4-ty@kernel.org> (Mark
	Brown's message of "Thu, 29 Jan 2026 11:13:52 +0000")
References: <20260122-schneider-6-19-rc1-qspi-v4-0-f9c21419a3e6@bootlin.com>
	<176968523282.21695.1970063208785534195.b4-ty@kernel.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Thu, 05 Feb 2026 10:16:01 +0100
Message-ID: <874invft4e.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,glider.be,gmail.com,ti.com,bootlin.com,sang-engineering.com,se.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27938-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miquel.raynal@bootlin.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 53D6AF08B3
X-Rspamd-Action: no action

Hi Mark,

> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-ne=
xt
>
> Thanks!

[...]

> [02/15] spi: dt-bindings: cdns,qspi-nor: Add Renesas RZ/N1D400 to the list
>         (no commit info)
> [10/15] spi: cadence-qspi: Kill cqspi_jh7110_clk_init
>         (no commit info)
> [14/15] spi: cadence-qspi: Add support for the Renesas RZ/N1 controller
>         (no commit info)

Git was actually smart enough, it solved the conflicts without asking
during rebase :) Shall I resend these 3 patches (+ the typo reported by
Geert) updated after a spi/for-next rebase or do you prefer to wait for
next -rc1?

Thanks,
Miqu=C3=A8l

