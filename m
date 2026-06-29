Return-Path: <linux-renesas-soc+bounces-34498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Nb+tGLs1Qmp91wkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 11:07:07 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFD16D7DD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 11:07:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=AXDGbT8i;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34498-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 68752300BB8F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 09:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 330FA3F825F;
	Mon, 29 Jun 2026 09:07:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEFA3F86FC
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 09:07:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724025; cv=none; b=R5gjoyy2HJieHayYbRhI3ozIcuDK9IreUrgcaTjw7N1IrrlPiOEARwuapF9gU8KX9MIaNTKyO8ejogA4YA0xVEBBtsfL7rATIRdbQXWU+n1z95kERWR7R7Hrt4enbP6zSYmY8rJB+rOhYIfHar5mUzGWJgZnweH4xuIda4sddoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724025; c=relaxed/simple;
	bh=hwGq5vvBEQS7g1MnAVw3grcl208Dw7MxaJ6Fg7s90IE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lM1pQKlljb9pHDDmPkL2Ao129B5t1x+DeQU6uleVAa0pWJC94++QLeS/lCIpVO4pOk9W5VwgHiXWJugg8AUz0Fg4wo3Am+mSjYrjH4EZm2VIwxlHbKrul4ph8t2ZEFI9WQqSPfCVyhDsIjPpFMycob4v029P3K/oTiKe3HltR20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AXDGbT8i; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hwGq
	5vvBEQS7g1MnAVw3grcl208Dw7MxaJ6Fg7s90IE=; b=AXDGbT8il2QBjcvj5pV7
	MDdBWKLzQ2+hSTKQS3g3YJxS8HYIdo8ysbfrjeFj7CFqWl/G3gVTQNgym5u7pXWa
	4NIHcPRxJKRf0UpshUB8CRkJ8nPjYMSbj7nFNMmU7vCSATf8hiKDr/3CdjFLMAw7
	sZd60l08BeUtkc6FHUB8Q7EwuSLijzWZ5f4ooM1iNneT4UIsofxTYhYcY70Bz5xY
	uUhDktnr+zwftGmIrV/M23jcESqKXnbpZAGXLggtIs0QT5e5RXSdxAG8fxpZmRCY
	CKSRVl4ARN4HpjugdzLhUyqRuPkCc4fEB2VVjY9CEx+prBYhRen+B+9sESa/U7Lw
	4Q==
Received: (qmail 311221 invoked from network); 29 Jun 2026 11:07:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2026 11:07:01 +0200
X-UD-Smtp-Session: l3s3148p1@LXYEyGBVns0ujntC
Date: Mon, 29 Jun 2026 11:07:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 3/4] hwspinlock: annotate slot pointer as RCU sensitive
Message-ID: <akI1tYjNpErOQKzz@ninjato>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <20260622085204.54248-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260622085204.54248-4-wsa+renesas@sang-engineering.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:andriy.shevchenko@linux.intel.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:baolin.wang@linux.alibaba.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34498-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:from_mime,ninjato:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EFFD16D7DD4

On Mon, Jun 22, 2026 at 10:52:02AM +0200, Wolfram Sang wrote:

> Because 'slot' is used within an RCU read-lock, it must not be accessed
> directly but with RCU helpers. Annotate the pointer to enforce checking
> this. Sparse confirms the missing annotation:

This patch will not be needed anymore thanks to Matthew's XArray
conversion coming with the next iteration.


