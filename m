Return-Path: <linux-renesas-soc+bounces-28240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIxyCT73kmlx0gEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28240-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 11:53:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C25E6142879
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 11:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 31D6A3005593
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 10:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669C12DB7A9;
	Mon, 16 Feb 2026 10:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jz7SX77q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38EB3016E0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 10:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239227; cv=none; b=N19aP/AIywJnGPt+VcqpvrQYmvkyOFzrJBgrZPofHYriu1gRiPXuES8mx+UAdlOl1AwpQ14HFS45utJnnRTKrd4kxgS8QIbyMmc10vln0i2HIEYWqDT330B6nBLdex8dROBVw81U7iOfdqc3Lscjq+YxmTNWLMiHK9Xvii1q840=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239227; c=relaxed/simple;
	bh=yiCrxtYWRStBcB48EVBaE3Qi59Fgvi3biq62nXCK5YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nDs6qVLaiPkoaTEkeRcGp7P4rpjxLMtuJPBEA1UJ7BM6GWO5pNGzSIA692HD9qsGTuVA0L0klxj7LNkOWP2p9W2yfaoxkgalk+zfVDRnTa0x7dvKHEtVmYqEzAqPugqRzgs2TSubDJA2b3eIXSTnDHvFNGTPC5MAz4jJ5gd8lQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jz7SX77q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yiCr
	xtYWRStBcB48EVBaE3Qi59Fgvi3biq62nXCK5YU=; b=jz7SX77qvlrbNw4hCYfO
	yCt1rz9NMBX3YTdqNAfVGeZxI9+Zm+h2GlAMFRyMKl9wz1u+Ub98NVdPovxla7QN
	5r0OcbuhkZHKECkQkJ+/b/7PvAFlM/zi4MM+y3ctN/Buiov/FAu3yCe53zWLbkX8
	BjiCN7t4x6yiJgl6V6y0kplGJ0fzdkJFEgXJXHRyUh6vemc01G1h5MURkBp7sBdY
	nfSvkkCSax7aBUYlkrrzWaktywBBTvrNXmkfiFHBk3nKDBwhh1wxpKRhVhutjy9l
	88OM9Ue2nsEdhsw9MEWthIAJE6kFGNY0ini5b6aQTP6h6gFn6XDZ+++7jU2MnAV9
	tA==
Received: (qmail 3207498 invoked from network); 16 Feb 2026 11:53:40 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Feb 2026 11:53:40 +0100
X-UD-Smtp-Session: l3s3148p1@2MaMxO5K3I4ujnu0
Date: Mon, 16 Feb 2026 11:53:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, linux-renesas-soc@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
Message-ID: <aZL3M6hT45I2WUaQ@ninjato>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
 <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
 <aZLVU9toZRX2vKX7@ninjato>
 <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28240-lists,linux-renesas-soc=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: C25E6142879
X-Rspamd-Action: no action


> Is that the statistically most-used response to that question? ;-)

That I don't know. I just know that I did build-testing for the whole
series and the buildbots reported success. Need to look up why this was
not caught.

Sorry Sergey, you were right...

Hmm, so is merging all the user-conversion patches into this one an
option? Maybe the RFC here can be reviewed per-driver and the real patch
set have this all merged?


