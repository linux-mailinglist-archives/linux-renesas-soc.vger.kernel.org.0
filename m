Return-Path: <linux-renesas-soc+bounces-30221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKWADk7Fw2kVuAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30221-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 12:21:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A57A323D1C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 12:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1DC9930C5676
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 11:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D7C83C8701;
	Wed, 25 Mar 2026 11:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eOePdaBu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ABB3C943B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 11:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774436845; cv=none; b=sA7LoAnY4C4wRBu0YzzVqm5C5FBMPU83ZzEnV0ZtZdH4q8itCgWFQUr27orrbrlQyZ1Kz7y6RuXO+/O/fyFJT8j3/pScu/PCk9Im+1OGXwnG//tTIrMsN2ksezUKIxVJSFt/AceABLPXSFF++NtUoD9fxa6FuE47xwqt15AqD+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774436845; c=relaxed/simple;
	bh=gT0ZXWJ1uiV1TcdQdeuxG+3Fiq3ngx1rL8+Gdvpc5pw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lF2I2V230f7gRKeoLkN854si+B3UFuHD0AdpYb7MdT8TpmLt8Wur3s5KKG1sR3HJoiteYIk5kDCzhQocl2A5p22NcvGdD2NnspYH0ejSJKiJ7z+rwu89IrgsRftclCesVfg8VKgXtgxdulWX0lbt207JIHiD/QwFqbY7CJN0XuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eOePdaBu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=E8yh68TeQnns/y
	3/ib3am8CB2h57aExT1LK3V3hcdww=; b=eOePdaBuE5Oe9b/NmJMJDocc2JQBhU
	YhEuc0upRfr6E/U8DIilmRA1UNMk7l2wNeTyCDlQKw0zHyWblJVTH0YUJ1mrqwpP
	qOQW3ZtTiPKdY2yfLy8koJcDCMNUN0KCdvGW5RGPDsjvM9WbUKmw/lNpQZhBufRy
	ynXUIg63UlcXBn68z0xioCpaky/xZcHs1NvzdXCrsMNcpCTRSqqbPNpoyDxV+5kx
	zNlnkC5ygV/dOxUQGv8MVTJoqx/4cuz+Ymmm9Dos20UHZasH6gnSO7JKlet41t0I
	L9kGFJA1VxUkmXTO/qUuBvffIWLbgvcaCqX9UtX+aR0KPC4gIP2A4iUA==
Received: (qmail 3520732 invoked from network); 25 Mar 2026 12:07:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Mar 2026 12:07:18 +0100
X-UD-Smtp-Session: l3s3148p1@DoRsRddNVKIujnt7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 0/3] soc: renesas: add MFIS driver
Date: Wed, 25 Mar 2026 12:07:12 +0100
Message-ID: <20260325110717.17083-1-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30221-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[mailbox.org,kernel.org,vger.kernel.org,sang-engineering.com,glider.be,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:dkim,sang-engineering.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3A57A323D1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes since v1 are in the patch descriptions.

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

Wolfram Sang (3):
  dt-bindings: soc: renesas: Document MFIS IP core
  soc: renesas: Add Renesas R-Car MFIS driver
  soc: renesas: add X5H PRR support

 .../soc/renesas/renesas,r8a78000-mfis.yaml    | 187 ++++++++++
 drivers/soc/renesas/Kconfig                   |   9 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/rcar-mfis.c               | 344 ++++++++++++++++++
 drivers/soc/renesas/renesas-soc.c             |   8 +-
 .../dt-bindings/soc/renesas,r8a78000-mfis.h   |  28 ++
 6 files changed, 576 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
 create mode 100644 drivers/soc/renesas/rcar-mfis.c
 create mode 100644 include/dt-bindings/soc/renesas,r8a78000-mfis.h

-- 
2.51.0


