Return-Path: <linux-renesas-soc+bounces-33640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BD+wD96GJWrsIwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 07 Jun 2026 16:57:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC35650CD2
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 07 Jun 2026 16:57:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=e0StwP3U;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30F023001A55
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jun 2026 14:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B7DF3859CE;
	Sun,  7 Jun 2026 14:57:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66014071E4
	for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Jun 2026 14:57:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780844248; cv=none; b=IQwGmJ2ZLPVVHLBUCTX4+Oy8wNTY6Rw33oVdpC2GM3sxVLHNxjj2QfQR1/132gkPJ5UKF7k5keqNK4PozwyMq/6WOQHvJA2Oh+ZoBIJxdiBQtdKu4aEHzppcOHcZbg9CoVS3B/crPhotyFSvm6RKEqMO1GPc7VbApSMmGUUp30M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780844248; c=relaxed/simple;
	bh=ZtqC+qnofvrCmCjX+K7HBaQPUaVjjEi2PlLXZ9QOs3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9sAxaQjm1Pm9HU9yPApLGf2lUlb343Jgkf5NEDRPL7Se+CGkpjYKq+CwrexfUFN7zJnuB8o6ppxXtdeB5u7xW2y65R6U31E+2dJXsZ/y6cBIdxSTMwgPAH7MS/nqVYpf7xHviWRwz83H/EcK8wFIPTxCqLJ1Mms3ZL/oV+n+fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=e0StwP3U; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ZtqC
	+qnofvrCmCjX+K7HBaQPUaVjjEi2PlLXZ9QOs3U=; b=e0StwP3USm72zyvo2mQU
	YcHKr5/+CFQI2aKUNnf7qjdFK1HwL4d6INirsC0FkSENYKu8NxGVPaEu5tHsbfGA
	OCUcK25hBpWATPhRO7dix+lZ1Hge2swcF5GdaERhcwfGq71RoURu6tKz7cGzgczv
	E4Aq9NooUaf/ZgZHBDJqrEBfCzOA7zUbzazjxd+Ahi/sL4L+k53/J/88uCn//EfQ
	soOWQdw9cRVk1vNLPCsY7lVuqF7vdnbJFx3Rh9LX6/NxhE9zF309f5TgnRiQJHRk
	9u/4EIFtbBDZYcPauHG3gf9XE6UBznzg0DvF4d8suH+14Dre2sI0E1NGZiK/Rw6p
	Dw==
Received: (qmail 505574 invoked from network); 7 Jun 2026 16:57:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 Jun 2026 16:57:15 +0200
X-UD-Smtp-Session: l3s3148p1@Eq0JHKtTCyRtKXG8
Date: Sun, 7 Jun 2026 16:57:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Ben Levinsky <ben.levinsky@amd.com>, arnaud.pouliquen@foss.st.com,
	daniel.baluta@nxp.com, peng.fan@oss.nxp.com,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Tanmay Shah <tanmay.shah@amd.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v3 0/5] remoteproc: cleanup shared carveout and
 resource-table helpers
Message-ID: <aiWGyj0KJ5I3qB2U@shikoro>
References: <20260529021637.2077602-1-ben.levinsky@amd.com>
 <ah2aVdlsLqy9aeHP@p14s>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah2aVdlsLqy9aeHP@p14s>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mathieu.poirier@linaro.org,m:ben.levinsky@amd.com,m:arnaud.pouliquen@foss.st.com,m:daniel.baluta@nxp.com,m:peng.fan@oss.nxp.com,m:andersson@kernel.org,m:linux-remoteproc@vger.kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:patrice.chotard@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:tanmay.shah@amd.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-33640-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[amd.com,foss.st.com,nxp.com,oss.nxp.com,kernel.org,vger.kernel.org,pengutronix.de,gmail.com,glider.be,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,sang-engineering.com:from_mime,sang-engineering.com:dkim,shikoro:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DC35650CD2


> Wolfram has already indicated he wanted to test these changes - Arnaud, Daniel
> and Peng, please do the same for your platforms.

Testing is more involved than I expected. Didn't work out this week.
I'll keep trying for next week. But it may end up the week after that.


