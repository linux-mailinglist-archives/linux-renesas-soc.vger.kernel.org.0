Return-Path: <linux-renesas-soc+bounces-30649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM9xFAqmy2nJJwYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30649-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:46:34 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B3F368477
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 12:46:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CBD28301EF07
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 Mar 2026 10:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67C862FFDD6;
	Tue, 31 Mar 2026 10:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NRz36PcK"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53793A5E98
	for <linux-renesas-soc@vger.kernel.org>; Tue, 31 Mar 2026 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953945; cv=none; b=SFT/0QfQ4W0nivKCCDPahErDPh3SVzucxTz15TD8AxUPjB4gZc4q5aNXl5dGlw2RabLnYE1LmqlGGawRGMR11gfCGxoE8VETA+n1Tl2rNw850HL5ISz3pU/4RXpFctbc4x5fHbHl/BeI4KaMFHq2mSjcmAQpno7l0CjgigbkGXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953945; c=relaxed/simple;
	bh=bMjsUZsHpPSCfQhEY6mg1Y3MjKPSVEULK2xb/jUDS2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GTU7A9zRjv2JaD3dAkOU5edqajDCA2Z1bEx8+iZult0eze8VfrWX/4+siMmhBYWJW0Bm2kQnJGvw2fruWrMpFRdqLpAQXKulAvIH0Q1UDEiLysCCEH+jPHHD/TfQysa/7WKWOmf7ViZtdbYvOtsVFbrs7jv3jnnVOGbNJhQ94ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NRz36PcK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=JnY6xJuGEMXhz1
	/NIoxAxtOjTROifDyj0j3Tc1jrDIg=; b=NRz36PcKr9IHwUzMwG9VZ4tBCZQMmg
	XR+cvGASPVtFu8bUnrbN0mi/ji/f1WCqYsH8ayXbcuUjEuPmNc+L86dmpxfnGDUY
	Oq1BFo+S+Um26VcuY9q7DWbb436n3zAeYHlBqGjCIRUOLTg9p+Y/BQUpDjTTAc4L
	FGPLN5ORZd/csg6baZoE34K/t/fqRMcxkkv7j3HB+exGp7GGJofEkWsBsUUueQ4C
	Lxkd4LHOFUADShPqgsemF790HtZl0hIQJ9qO9afP3jurvzjaYlqn4eejTRNK26kn
	E2ISBjfBX9MIE21Skn6D14ngiUBWQV400fa8jnPbQOyHUjTy1y3kYZQg==
Received: (qmail 1653736 invoked from network); 31 Mar 2026 12:45:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 31 Mar 2026 12:45:37 +0200
X-UD-Smtp-Session: l3s3148p1@PeHtqk9O9q4ujnu8
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marek.vasut@mailbox.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 0/3] soc: renesas: add MFIS driver
Date: Tue, 31 Mar 2026 12:45:22 +0200
Message-ID: <20260331104527.29170-1-wsa+renesas@sang-engineering.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30649-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DMARC_NA(0.00)[sang-engineering.com];
	FREEMAIL_CC(0.00)[kernel.org,mailbox.org,sang-engineering.com,vger.kernel.org,glider.be,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E2B3F368477
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Changes since v2:

* added constraints and fixed whitespaces in patch 1
* use BIT macro in patch 2
* added tag to patch 2 (Thanks, Jassi!)

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
drivers/soc/renesas. A branch (with some additions to enable it on R-Car
X5H) can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/x5h/mfis-single-driver

Thanks and happy hacking,

   Wolfram


Wolfram Sang (3):
  dt-bindings: soc: renesas: Document MFIS IP core
  soc: renesas: Add Renesas R-Car MFIS driver
  soc: renesas: add X5H PRR support

 .../soc/renesas/renesas,r8a78000-mfis.yaml    | 191 ++++++++++
 drivers/soc/renesas/Kconfig                   |   9 +
 drivers/soc/renesas/Makefile                  |   1 +
 drivers/soc/renesas/rcar-mfis.c               | 344 ++++++++++++++++++
 drivers/soc/renesas/renesas-soc.c             |   8 +-
 .../dt-bindings/soc/renesas,r8a78000-mfis.h   |  28 ++
 6 files changed, 580 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
 create mode 100644 drivers/soc/renesas/rcar-mfis.c
 create mode 100644 include/dt-bindings/soc/renesas,r8a78000-mfis.h

-- 
2.51.0


