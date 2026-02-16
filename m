Return-Path: <linux-renesas-soc+bounces-28231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LQ7KoXVkmlMywEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 09:29:57 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1754A141920
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 09:29:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D13B7300E716
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 08:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61E92305E28;
	Mon, 16 Feb 2026 08:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="amzlBXRg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E357304BDF
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 08:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230554; cv=none; b=Wx9sk3ejsMn3+nehcl4WJO4dhjaFgW6abFoQprQ6l0sMR+Edfxgbsf2hkq6QPkr/3tEYXyiVDg0SvVCUmP6DBPUoyrxg9n/po9F2UkEeFIs5RHR0rcJU4ZqEmVZYvHeoXe94n1JLPRNCLDwvQxTQ5qYvAHBWtF5cLs2eGAHTZ2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230554; c=relaxed/simple;
	bh=mTBsAANyzCgZrfUjL0K8fMktL3GqkfQK6Lu6uNMTep8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qoW908XYp9BqU8n+URgNZiyRyKpbLBZ3jV7zPjMZ8M6dtgJEWO66b/gGf1NJxKNxIcwnlVtgrUkvAGhojIuc+JmbvUadd7N24k5V8tBIXygRYXKBFYzwTHorLJfecdAda8u0X2zz7fSrgwkjkGNYq25BGspqmhe2v6yv33belko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=amzlBXRg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5SX/
	d54PXDjewqxCGR18EtEsbX5HuHmXdDmZUtDAJKY=; b=amzlBXRg6ZSAHSuMwTK9
	fxzgQIr3ynoNeTpGYNEXubCW5Wi73ac6vU3LhKIl2+M2hard43Sl85cN5S95SR+D
	i1Z3J4ZR75SjEt+M+lSQbltf6/PsMlBltEfxAgnmXWnDY6PsGim6jK7QjEi3NQZZ
	WABZhMOCYalNPqAewYTbjLYK6a/ErIi89LTwUvur7Dlul5qbsYMFvxx706WkSzQq
	Hi+npE0Qpte9x7ho6NPYQ/SQdOos+iA25htIvjHEXdTa/DpAuELe8O6oV7NrtG2o
	s4pomPV4qsDjsTdc8SzTGY/Mg/2/p/Jfk1qBo+IM2mtYCc88jhCKkCzCSxRzniRT
	Hg==
Received: (qmail 3162847 invoked from network); 16 Feb 2026 09:29:07 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Feb 2026 09:29:07 +0100
X-UD-Smtp-Session: l3s3148p1@ObiYv+xK2JYujnu0
Date: Mon, 16 Feb 2026 09:29:07 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-renesas-soc@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
Message-ID: <aZLVU9toZRX2vKX7@ninjato>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com>
 <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
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
	TAGGED_FROM(0.00)[bounces-28231-lists,linux-renesas-soc=lfdr.de,renesas];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1754A141920
X-Rspamd-Action: no action


>    Don't you break the existing users of this API with this change? I see
> you're fixing them up in the followup patches but that's not how it should
> be done -- the compilation shouldn't be broken...

I am not breaking them. The helper is an additional feature and the old
way still works until patch 8. Until then, all users are converted.

I built tested it :)


