Return-Path: <linux-renesas-soc+bounces-32224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iE7yGFxo/Gn0PgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32224-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:24:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CDF4E6BAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 07 May 2026 12:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8424B30055D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 May 2026 10:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8A693D6CA0;
	Thu,  7 May 2026 10:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Hmfo0pbw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8543E8671
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 May 2026 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778149460; cv=none; b=RjtBbt1QkMOJ991DfaXfmKCeqwqX2jzw7LeG1ADnnVXWbSgVntiL1vvKEAsE5NPqAe2BKSuoV4nMrfh+Hr0yU2dYg4Yv2A1Jalveef8FVOASvDplBsi0mmNnEr2/1jLZ4m2Q7Tj2jJVhhEiQlFG8CMOklbcODK32RY36o9f7eho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778149460; c=relaxed/simple;
	bh=95zihIsNKMOoXD5OwnlTEVyg8/vmcAqsbbGd8t9RAOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Yqdx5/KvggZ4xrEu6ENTwCMkL4s412MPwT6OwtQGA22SwnYE9P69rUCXVpdE1E5ArX0nsdaFAR6urpR+geXJSS708iKVXtck3j/mQ3HpabITx8peSZ2AOodg0+l34MaVe+cwRlcrNVZXU+LuwMa0lh6T0GVPvl5FJxJMt4axazw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Hmfo0pbw; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=U7lcVXhRrsNyaU
	ZcRjVHn9MrYR2QSycVByrONFV6V7k=; b=Hmfo0pbwBz01tYugrbmAHJQallIdxT
	nNxrH1gRC3KqLMin/Y7yyLnTnoH8jRMv/q0hQS8GspARYH628glx5gsmYbWRvFcM
	ouzgZsGLUslv/IyLXDLwsicjzcMdc43ztMKtDwgm6HctNFogOXUFqg3ZFA+49Tgc
	hBxOPlIrQPLbrn5Azq8RGUjczu28PwEYj5iiOaW7dJdAH01Pxb7W+c31yKXQy/XH
	z2YUfccHNKWVbcX3JinhmgoMLYDJlWdy/HVJiryiezxW2rUOpKzfgGeQJzSfTrgf
	xoWE8ARSNzSXTbqQaVq620JnQ+19z2vID6+xuPmEMItBPMCaJ2KvwXRA==
Received: (qmail 1070349 invoked from network); 7 May 2026 12:24:12 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 7 May 2026 12:24:12 +0200
X-UD-Smtp-Session: l3s3148p1@GTV7rjdRrOcujnu4
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-watchdog@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: [PATCH v4 0/4] watchdog: rzn1: clean up and drop irq requirement
Date: Thu,  7 May 2026 12:24:05 +0200
Message-ID: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: A6CDF4E6BAC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32224-lists,linux-renesas-soc=lfdr.de,renesas];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,sang-engineering.com,kernel.org,vger.kernel.org,glider.be,roeck-us.net,gmail.com,linux-watchdog.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Changes since v3:
* rebased to v7.1-rc2
* added patches 3+4 to remove irq handling
* added tags for patches 1+2 (Thanks, Guenter!)

For easier dependency handling, I picked up Herve's v3 series and added
my patches on top. Herve's changes to the N1D syscon are now upstream,
so the watchdog can reset the system directly. Leaving only his cleanup
patches to be applied, already reviewed by Guenter. Then, my patches
remove the now unneeded irq handling and make irqs optional in DTs. All
tested on the Renesas RZ/N1D demo board.

Please apply.


Herve Codina (Schneider Electric) (2):
  watchdog: rzn1: Fix reverse xmas tree declaration
  watchdog: rzn1: Use dev_err_probe()

Wolfram Sang (2):
  watchdog: rzn1: remove now obsolete interrupt support
  dt-bindings: watchdog: renesas,rzn1-wdt: interrupts are not required

 .../bindings/watchdog/renesas,rzn1-wdt.yaml   |  1 -
 drivers/watchdog/rzn1_wdt.c                   | 35 +++----------------
 2 files changed, 5 insertions(+), 31 deletions(-)

-- 
2.47.3


