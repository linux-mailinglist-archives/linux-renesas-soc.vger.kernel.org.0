Return-Path: <linux-renesas-soc+bounces-28059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INHlLWK9iWneBQUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:56:34 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E54710E6BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 11:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D06BB300644D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 10:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E289F31195F;
	Mon,  9 Feb 2026 10:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="C6ZryzX3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CFD36829E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 10:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770634590; cv=none; b=MKREVmWG9Rme0dSJoApBqswBgOG0Di7XIr4qdKNzs/OJyjTU0L8omCpDfR2UxILqRSS9HOhPJTQbLZOVWteLfQAyc3+lN81NQRB/FMJeRyJMBqbLePqUx7i8d+b6nQC+n7F7E/iijTinD589p4pFPnUjpys2sMic6mRqLZnM4MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770634590; c=relaxed/simple;
	bh=VdZYgGmDzLJyy5KARWDiIoXEtcW6cUiBB9Fl1Nla4rk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKBhh0+7Hux88EnfzmZGmIgb8MHzaLFJR2qJ45QEVh/xLqCXrDDxbppHKqD6Pub450oYSU89fpZGiFrQuFwBoxbgKEzgg4Aj3bHBTiK2Y/XExsee9auOrK89xbJQW/OCIL01X2RA8LcWbNKholPNaJR1NDNjHsUz3/CKN2PuzfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=C6ZryzX3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=osD3
	4MbzJ4JrKQn3MCvbtOMiNFpo9ySJ1s2YZPh08rQ=; b=C6ZryzX3Y5PvV8l1Myip
	t/ZAGbkwv50pNWo+70g/68Dw34JTGRKTYQFAz98W4MwuPXt4QUDNfriFr6PLApvl
	OSoRxNCOmv5CyOTz4jPZ5lDqWUbmiWWuWAJfRxzpRMqFU2IvHTQSKqP0T6GIvADa
	td3CHyEnKzYviQZUcFrPder3/8HF7YtFngtUNngMDzTSEF4r/N5zXom0Xcvdz82g
	s1JaOBy5Y4ezNqrxLlAYGJv+nBvMPhpgWs639uI2GrZK0NlRrMd2z5Riul0gbMVg
	SKKhnQLm3bKUfuBIFNjKVZYgM5aT6W49RSy7yEYbonQLOpqLFPBqMpACFEoDr5cA
	ew==
Received: (qmail 1131709 invoked from network); 9 Feb 2026 11:56:26 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Feb 2026 11:56:26 +0100
X-UD-Smtp-Session: l3s3148p1@4MeG/WFKyuwujnuv
Date: Mon, 9 Feb 2026 11:56:25 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
Message-ID: <aYm9Waibey1yG1o4@ninjato>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
 <aW5ifVcxVf6uux3m@pluto>
 <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-28059-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.957];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,arm.com:email,mailbox.org:email]
X-Rspamd-Queue-Id: 4E54710E6BC
X-Rspamd-Action: no action

Hi all,

> > > Implement new property arm,no-completion-irq, which sets all SCMI
> > > operation into poll mode. This is meant to work around uncooperative
> > > SCP implementations, which do not generate completion interrupts.
> > > This applies to mbox/shmem based implementations.
> > > 
> > > With this property set, such implementations which do not generate
> > > interrupts can be interacted with, until they are fixed to generate
> > > interrupts properly.
> > > 
> > > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > > ---

...

> > 
> > LGTM.
> > 
> > Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
> 
> Is there anything left to do with these patches, or can this now be picked
> up ?

Would love to see this going in. I also work with the firmware which
needs this functionality.

All the best,

   Wolfram


