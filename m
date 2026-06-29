Return-Path: <linux-renesas-soc+bounces-34507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0minAJZQQmq44gkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 13:01:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 228606D9267
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 13:01:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=DMIFmaxu;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34507-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58A42305F5AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 10:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB079367B98;
	Mon, 29 Jun 2026 10:55:41 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40558360EEE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 10:55:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730541; cv=none; b=Q4FKFcKLrHfhH5JW4VarwhLPooswr38jrvx4BDsxpNZIXTLl9xnsDdK+73gR7RMEWHfPdxVVLvSnIfCAvFUg50jMaMwzMXEE4p9jm2ZRT/ju+WCDCkq1lRGBljOZthRjI8iuZhjSPXCqhY9ZJ7m/mfDMmC7CCGUJ12NlrAL3R8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730541; c=relaxed/simple;
	bh=XKfimtIR+il32u0UDPqnf5oheier5kQZfQrahbFYCuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wkh6xJtN1xbLrisrtqMU/n9cHseHfP44KGc82IQTrpT0fwqe71MFh0VOKbFkiHF8tsy3P/YCvWQ95oYdHgybFvZ9cLB/+pdKVD5HpleNh31mUGaBD9wPMtkYloL/Rqow7smbH1fncs6X4yPTttGgSRNp9ABNEzObwlyLA8wLGwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DMIFmaxu; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XKfi
	mtIR+il32u0UDPqnf5oheier5kQZfQrahbFYCuc=; b=DMIFmaxucrIhIz8myJFC
	Rk+9t1Yg3xaxT2lz33GkRKubfLHKCNwaL5Uq+4m9SIFj93Yp8KVoPmux+Uq2szHh
	W6O/7dvMztx0RvzX/tYVFV/uCMYVEds+B0vVhJi67nRUvToeNLuZviANlkDgsiwP
	F+4baShcvu+cWUysUFjI88Quaw54KLIMyuvKaAGC4Kha0Y9arg+wcmFone1CzkTI
	swd544D/BxPYr+Y8ccvKSJpQsy7p13Xeyl4Y5DfL5ivo1MkHmcGtkmBHD1n83LEX
	9ekBuRHQue3oYaNUSnP0AnNPDLeHx4AVrcwi7ONYKNY+MlMUFMigksdndhUV+Jvm
	NQ==
Received: (qmail 347391 invoked from network); 29 Jun 2026 12:55:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2026 12:55:38 +0200
X-UD-Smtp-Session: l3s3148p1@6OlzTGJV3ucujntC
Date: Mon, 29 Jun 2026 12:55:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthew Wilcox <willy@infradead.org>, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 0/4] hwspinlock: add summary in debugfs
Message-ID: <akJPKZIKlZBuUmvE@ninjato>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <ajk_u7TVT-kL8z2A@casper.infradead.org>
 <akIzahjROM4GAlOR@ninjato>
 <akJLmLwO8IGu5KbP@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akJLmLwO8IGu5KbP@ashevche-desk.local>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andriy.shevchenko@linux.intel.com,m:willy@infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:baolin.wang@linux.alibaba.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34507-lists,linux-renesas-soc=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 228606D9267


> My 2c that we should follow the IWYU principle. XArray header is not generic
> enough that we may rely on something else to provide it. And hence I'm fully
> with including that explicitly. That mentioned users simply neglected the
> principle and I consider that as an inconvenience.

I tend to agree, would need some more checks, though, to keep the amount
of patches low enough.


