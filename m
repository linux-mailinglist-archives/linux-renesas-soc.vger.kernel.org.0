Return-Path: <linux-renesas-soc+bounces-29606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFLLAGRTuWnYAgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29606-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 14:13:08 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A10192AA9C4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 14:13:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F19AA3117096
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Mar 2026 13:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80F2C3C73FA;
	Tue, 17 Mar 2026 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cQDjlp5y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10E23C871C
	for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Mar 2026 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773752814; cv=none; b=c+Q7ugrvnHWBk+Cs80uxUXTbKk+mTIIPupkoijOPO55VUq2AzNS5JU2Ogq9Z9U/Rd4/mEd5f0B1/Jwd27zrh8EJTV/Uwt7AjKEy8u+tTZuO5K53EZBmYsyeF2diQyWuFM86szARAOx/cCX1E9Uf7alU5o1dxbH/uqr+j8JHxyKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773752814; c=relaxed/simple;
	bh=eywiuJMaarmR4gXa9r17Jp3anb72uz5fUEzoM+TcjMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RyJv5evLTGg3+kyNCu8B0rVgz5GJA/uSBZDxqPGQ/IxASExZSyI4wFCUr65K4VbatgDMm9AxQV3YdTIJHq7TYLJE5NJk8iczJmwf8r7CEWMa1fXOQqawAe5fdZ5a+jYzzqZZndc63o7ZEBUyc8ebsBelDks1t4YHMeNRTg44+mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cQDjlp5y; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=i5leJTNSZ9xqKS
	zodyw9T9EgJC3Lw9Mg26dnbg+U0gI=; b=cQDjlp5yklbzV1cPTIRYSCNkrARDGo
	3F4KK0eRjKIkeX5EcD2eylUfJbxgOXlTYKh4mlo2GMf9xMXWXvnnARBG0us1ZGkx
	JZXe7fo4UYgTX9sZlajhFgW/d6B636+Tpk4mX8tXHbyGL/VLJPMcWKhhWDlV5vSK
	TP4zB4M28nnGoRPXVm16sqwegBhuZb2FNnmtwa/eI1owuww8Jxkl7CfOxTD1qYZc
	ARZrCAromtVYGDCztMZTtEa9+3z/rC9qA5PlFQBErSJghJycqPFhBiwGzyNoxPf3
	47MvHigec8Fj8mDoiX60R76VG8GM/i4cnMZ4OzKGDu9PdLnYTBQobzww==
Received: (qmail 287502 invoked from network); 17 Mar 2026 14:06:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Mar 2026 14:06:47 +0100
X-UD-Smtp-Session: l3s3148p1@eDgFAjhN6o8+XdJ7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/3] soc: renesas: add MFIS driver
Date: Tue, 17 Mar 2026 14:06:33 +0100
Message-ID: <20260317130638.2804-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-29606-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,sang-engineering.com,kernel.org,glider.be];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A10192AA9C4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Renesas R-Car MFIS offers multiple features but most importantly
mailboxes and hwspinlocks. Because they share a common register space
and a common register unprotection mechanism, a single driver was chosen
to handle all dependencies. (MFD and auxiliary bus have been tried as
well, but they failed because of circular dependencies.)

In this first step, the driver implements common register access and a
mailbox controller. hwspinlock support will be added incrementally, once
the subsystem allows out-of-directory drivers (patches already under
review). This driver has been tested on a Renesas Ironhide board (R-Car
X5H) and is able to communicate with the SCP via mailboxes. Also, the
mailbox-test driver was used to confirm back-and-forth communication
between two application cores.

Because of its multifunctional nature, the driver lives in
drivers/soc/renesas. As large parts of these patches handle mailbox
support, review from mailbox expeirenced people is much appreciated.

A branch can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/x5h/mfis-single-driver

Thanks and happy hacking,

   Wolfram


Changes since last internal RFC:
* no functional change
* extended parts of the binding description
* reworded parts of commit messages
* dual licence the dt-binding header
* dropped unneeded Kconfig dependency on HWSPINLOCK
* rebased to linux-next as of 20260316


Wolfram Sang (3):
  dt-bindings: soc: renesas: add MFIS binding documentation
  soc: renesas: Add Renesas R-Car MFIS driver
  soc: renesas: add X5H PRR support

 .../soc/renesas/renesas,r8a78000-mfis.yaml    | 160 +++++++++
 drivers/soc/renesas/Kconfig                   |   9 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/rcar-mfis.c               | 325 ++++++++++++++++++
 drivers/soc/renesas/renesas-soc.c             |   8 +-
 .../mailbox/renesas,r8a78000-mfis.h           |  27 ++
 6 files changed, 529 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
 create mode 100644 drivers/soc/renesas/rcar-mfis.c
 create mode 100644 include/dt-bindings/mailbox/renesas,r8a78000-mfis.h

-- 
2.51.0


