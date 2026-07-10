Return-Path: <linux-renesas-soc+bounces-35072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BJsVEpc1UWpFAwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 20:10:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D4473D3DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 20:10:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="nv/sA7Mc";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35072-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F146A301860F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 18:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5733F3803D0;
	Fri, 10 Jul 2026 18:07:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05E737C0F7;
	Fri, 10 Jul 2026 18:07:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783706847; cv=none; b=atD/cqILollJZqHxyzVjfoajDmSLcvfjOALaUHh/WhA46KxOgIKstIrfM3xfhu9xrtaXG52vKC9vfImQTR63b0bDyQQCS3aJeZoDNQR64TVeJvqDw/okbjeKbF/neuhFojH9Yew+VEhN4nJRIcB8dA1ILwJEKwqyxp/01/q60rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783706847; c=relaxed/simple;
	bh=eAITFPOCEuW56hJol+BRhwmU47JapVeAE6fdtHRutWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PbdmgIFDw6/Eigr9EPbbEmD911alVCpm6PGy6ALksf6eT9Xxm0KdXGmNZw0Zf8mK33AmUvM+xAaBVJ//niHksiIxlzrJy1pIRFkaFmss8cuVoXaa6v5fgQpkZXTYT7qz3ofRbMBKj0JUkcZXNFf5HZ+mY4WkDNU6JiD+BvAf2QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nv/sA7Mc; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF0D81F00A3D;
	Fri, 10 Jul 2026 18:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783706845;
	bh=EFkeIeU2FBGbEqfcB14GA6QRcO1JY2uvLVTQLi5eGUU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nv/sA7McvirQ8iJD+fR1bLLLazEgXdvuEpdtkHhcl2rUVUwrl6VHvYdddrb0PMH5J
	 n/40Ffim08ig/rcuOQhq0pt1iOaz7JBOpu1OB1ks9yCCgqAP/Kl4WNKNvA8zoMru+B
	 nKMcHOGBW+Rpf8oTizPXN42+nSsGXQ0bmG4lMF2O4mWuMoC35SRSviBBHMiqcMp4W1
	 gls4lv4dt0Y/1pvI5pHR4Ag2/dF5aL7f0E3vatZw+xViWr08HyOwXeg491vocBMoR6
	 3PGl9s9feCv3+8tfyOb8KSoRTir0tSPLsFEEeyIJmihBr2AsyyGdNvmTX6MTX8Nfpb
	 Sy6kyPbMrIe+A==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] hwspinlock: propagate errno when registering single lock
Date: Fri, 10 Jul 2026 13:07:10 -0500
Message-ID: <178370682988.2572738.9921265128936208294.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512084856.30497-2-wsa+renesas@sang-engineering.com>
References: <20260512084856.30497-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35072-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-renesas-soc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:baolin.wang@linux.alibaba.com,m:ohad@wizery.com,m:linux-remoteproc@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C1D4473D3DD


On Tue, 12 May 2026 10:48:23 +0200, Wolfram Sang wrote:
> hwspin_lock_register_single() always returns 0 despite checking the
> result from radix_tree_insert(). Propagate the errno to make sanity
> checks in callers of this function actually meaningful.
> 
> 

Applied, thanks!

[1/1] hwspinlock: propagate errno when registering single lock
      commit: e088ffa9a00eaaaf90da74763e774ca160969c26

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

