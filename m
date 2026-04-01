Return-Path: <linux-renesas-soc+bounces-30668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEl/KljFzGkWWgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30668-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 09:12:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0DC3759E3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Apr 2026 09:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71216301CD9A
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Apr 2026 07:11:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BB4234214A;
	Wed,  1 Apr 2026 07:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jyLoxiU5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05242262A6
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Apr 2026 07:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775027510; cv=none; b=XTjnubdi2QBryJ6IDuEKH6G+BbLk3cZpakh+r5ATxHESw5P1yKzREEeVVdZtOxnQsQmGQhxAMYyCSfPmalfSvDdiqQhfaR6be9CYTrruIu3FAFg16Tp+QNjv4gvVZjggRc18D0Ne3Y1IqvWiQEYQgDhoV3cBwPtrPAEDbZS0AO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775027510; c=relaxed/simple;
	bh=Vx6dMOtnPiJY6WMYhdd+wHpqvHTzS63BrWwhhiHE2z8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ty0P6ZlbPtEeszIdPulmbEcbzxoh6vNTR6m/lk2uIvLBSgBD0r7fVvo4eo3+ZlieTFi/sqMVeoaqfmmRJcTNOTCaE26YDZASYglvoMLgPv7OCS9EbHZEqmixuKLiXWDTokPCk9MWHfdfHsZg7BReEj34idf9tdKMcAR3myiA5Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jyLoxiU5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=k6ZXB2M93bA5FI
	UMoEbLvEJgGSE4j7dc243fvIGTs2E=; b=jyLoxiU5gnq1phyRSrJAWGeWE+zbKR
	mK6N7hF4cTPldW8NC55hZOu9zCCYdcUV0Hltb7PHSA+NZu0xuZEZR5EodlVg3Z8K
	NQV9ay7CyevldB1cMGHcCO8NGBFfv+SXY89hsygCkytHK4w0X5xTfsDVyqc5uBTa
	yukqUaOa8mW0jRYuh+3htW8gbEnzbN2YmkU+g0kUt9jC2E1Kl3OmC2auQyvcQl7H
	/dJ8zNg/Tx+6NpjfO4lX87qwI0Q0rnTv3mizPxrdf2zLHlBSZD+rwKyEtIj0GU3X
	zYfr+0WtnKsGWCOYuGSBdXHP4d2mVxDKRD5y+A35kY4JRNJcRdy+jtzQ==
Received: (qmail 1986474 invoked from network); 1 Apr 2026 09:11:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Apr 2026 09:11:43 +0200
X-UD-Smtp-Session: l3s3148p1@Qp/Jy2BOTtEujnuR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-remoteproc@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH 0/2] hwspinlock: remove platform_data from subsystem
Date: Wed,  1 Apr 2026 09:11:38 +0200
Message-ID: <20260401071141.4718-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30668-lists,linux-renesas-soc=lfdr.de,renesas];
	PRECEDENCE_BULK(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3F0DC3759E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series removes the use of platform_data from the hwspinlock
subsystem. First, the last user is removed because it turned out to be
obsolete. Then, platform_data support is removed from the header.

This has been in a larger refactoring series before. But this
refactoring turns out to be a rabbit hole where more and more fixes are
needed before I can do the actual refactoring.

These two patches are quite independent from all of the other needed
changes, yet the platform_data removal simplifies further actions.

So, I hope we can still have this in 7.1, so I can base further work on
it. The ack from LinusW as the driver maintainer is already there.

The only change since the last version in the refactoring series is that
I also removed the Kconfig symbol in u8500_defconfig.

Please apply.


Wolfram Sang (2):
  hwspinlock: u8500: delete driver
  hwspinlock: remove now unused pdata from header file

 MAINTAINERS                      |   1 -
 arch/arm/configs/u8500_defconfig |   1 -
 drivers/hwspinlock/Kconfig       |  10 --
 drivers/hwspinlock/Makefile      |   1 -
 drivers/hwspinlock/u8500_hsem.c  | 155 -------------------------------
 include/linux/hwspinlock.h       |  28 ------
 6 files changed, 196 deletions(-)
 delete mode 100644 drivers/hwspinlock/u8500_hsem.c

-- 
2.51.0


