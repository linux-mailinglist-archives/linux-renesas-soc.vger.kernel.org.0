Return-Path: <linux-renesas-soc+bounces-34502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4GMrF5hEQmrt3AkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 12:10:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D61296D8B99
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 12:10:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=FRk66QTB;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34502-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3A45030B7E08
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 10:03:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 541623F8883;
	Mon, 29 Jun 2026 10:03:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAFF3FBEB2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 10:03:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727419; cv=none; b=nByTm1Qms8o1cWeziS4im43AftsKsgsANGRkFo0hcRNX3LufH+BI4qaQbz/AVZaEIA+NT7hdGiIJhq3v0xkqnemq+84qmtQRTAFMoJj4iBQpet38UdybaKNdG2yjPwAkRsIC0UF75Lp/6ZDilVVCReufXEKaCMjrKgnc1IUeevI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727419; c=relaxed/simple;
	bh=S9oewPD5KGae5HcFjUetqQBJ4wpwcMp0LSlhnfH7KCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AtnGmJoSy6WGXjrdgFR0p+mDiaxwOjD8lQpiuKCrhlDmC4t7YxLJ3vSuRfnQvQsegxHCTs4K/eZxLqmiUFyENvdzOvduEqOEh8HVT+7FPH4R5hf7S+BS3tBXVxGCJa0gLLDVXh0msVJhStbggOoNnunWmbJjYMj6YF29u+ySE8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=FRk66QTB; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2B0V
	N+5r8iusgnu733VSe+8cjXcjm/fgii3cqlMfGjc=; b=FRk66QTBKQJ3JMy+8jYC
	jw+7NUjyvGeim4e5Q0CcQlYMI56XNcXhuike3AMSgR2dxFRAOqojaGUKheZf3rrb
	XGgXEcZr2AtBoI+h6gQKpsOQzJdFLL/utT+Hi0Su/zlrKplesHWsrlOrW68wEScX
	fNvWhl8tl29IdTdzrZov8Pp5OqyjImLMCMJems6rhrwsAcw1W/WIlM9DC/aHLXjS
	xDJnyT/nH4t8KMYoRVrAOOgOWlNdZnzM2jwCrNZBgVBa0dUxfzXJlE9kn+xQnkM7
	PY0xi3fJOgAbET+TIzVPcnHP1nUiP+kpOKucbaYzSd1Hn7sBwlT8gJ8PAwaeqbuq
	DA==
Received: (qmail 329910 invoked from network); 29 Jun 2026 12:03:34 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2026 12:03:34 +0200
X-UD-Smtp-Session: l3s3148p1@FGRDkmFVsMYujntC
Date: Mon, 29 Jun 2026 12:03:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: Re: [PATCH v2 0/4] hwspinlock: add summary in debugfs
Message-ID: <akJC9pD2b5GQbB0u@ninjato>
References: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
 <ajk_u7TVT-kL8z2A@casper.infradead.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajk_u7TVT-kL8z2A@casper.infradead.org>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:willy@infradead.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andriy.shevchenko@linux.intel.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:baolin.wang@linux.alibaba.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34502-lists,linux-renesas-soc=lfdr.de,renesas];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,ninjato:mid,sang-engineering.com:dkim,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D61296D8B99


> The hwspinlock_tree_lock is not needed as the
> spinlock built into the XArray is sufficient for all these cases.

Are you sure about this?

In hwspin_lock_request_specific(), the spinlock is taken, then:

hwspin_lock_request_specific()

-> __hwspin_lock_request()
  -> pm_runtime_get_sync()
    -> __pm_runtime_resume()

This starts with:

	might_sleep_if(!(rpmflags & RPM_ASYNC) && !dev->power.irq_safe &&
			dev->power.runtime_status != RPM_ACTIVE);

Isn't this a problem?


