Return-Path: <linux-renesas-soc+bounces-31751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFfMIq/w8WkOlwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 13:51:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 65776493BAC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 13:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0A1D5300382C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Apr 2026 11:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5AC3E8C49;
	Wed, 29 Apr 2026 11:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="K8yAvEqX"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29623A8FF7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Apr 2026 11:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777463465; cv=none; b=cFbQJ1MZKAdV267LoOMvz2fVRRALsSWK6wsvQv8z+k87pd1blRiAmjTSPqMWA8C6PprtHLFLCAyVIKhGUJ+GgwY4Yi1E/u5R6q6kh2E2IJotuF7Zlbz48kDEoxhgq+BHL8t3dlr+KF9ZuTLbRl9DPQPDdGPyfG0S2K2jprZOerU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777463465; c=relaxed/simple;
	bh=Tb8wmZ61gI+OmJBJtdJsHhw25HlvMNagXkHEhHkQ9QA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=R0GqXHOtmS7IB1QZn+ApkWqccmx16p4DBYNKky1Nw2WoH9D86nj5EKzU9XHBjHCPkOcoKjjT0UHnswUoGtKm3kt6XA8gRAiEJ9puFZpoi1XT3OfXkJ0p4FjjELk6n7MSTIazB/sZUl3UgzXghdIRhT7FxoegPV/REe6B6xNyASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=K8yAvEqX; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 22EF61A33DA;
	Wed, 29 Apr 2026 11:51:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9F59601DF;
	Wed, 29 Apr 2026 11:51:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D761F10728DD6;
	Wed, 29 Apr 2026 13:50:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777463461; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=K9cyTrwGnbpvlaM7HmRvj0LaO77nlDUw9QrZtOu/MfI=;
	b=K8yAvEqXPwZQpBxD51rr0w1yO4u1Hpvw9zjL0YVYpxdXsAJeBvsCI3Xr2XaLpCRUB9axRt
	1zzAiHIjBAHQpkZzGGNaftGq6+kjjmpOggW3Sb753VqUn5AQw0WfCH/yvhQrPDpLJAX9sp
	HD8nlYiihXJECDhgeAQwIt3/BMc2h4er9UM1qeNXbrbSLL1grT6K09nrTUDlhKYkC191j8
	zlQweeBlCa3mOKFQ5pMCSscJTls5ejn73DZlG8loYT/siZh2yhpHo/K6qzTXUgbxjT9uB+
	IYpyABd98GOn0MzD0gPLUyzNS0Hc6ZTn97D6rR34mWwLwC21efJcwTsYHULZ0A==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: [PATCH v2 0/4] timers: Add support for RZ/N1 SoCs timers
Date: Wed, 29 Apr 2026 13:50:19 +0200
Message-ID: <20260429115054.158160-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: 65776493BAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31751-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[sang-engineering.com,bootlin.com,kernel.org,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[herve.codina@bootlin.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:dkim,bootlin.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

The Renesas RZ/N1 SoCs family has two timers block controller
available.

Each controller is charge of 8 timers (six 16-bit timers + two 32-bit
timers).

Each timer has its own interrupt, its own prescaler that can be used to
device the clock by 25 (timers block are fed with a 25 MHz clock) and
all timers can work in either one-shot or periodic mode.

This series adds support for those timers blocks.

Best regards,
Hervé

Changes v1 -> v2
  v1: https://lore.kernel.org/all/20260331152616.197031-1-herve.codina@bootlin.com/

  Rebase on top of v7.1-rc1.

  Patch 1:
    - Drop minItems related to interrupts property
    - Add 'Reviewed-by: Krzysztof Kozlowski'

  Patches 2, 3 and 4:
    No changes

Herve Codina (Schneider Electric) (4):
  dt-bindings: timer: Add the Renesas RZ/N1 timer
  clocksource/drivers: Add support for the Renesas RZ/N1 timers
  ARM: dts: r9a06g032: Add support for timers
  MAINTAINERS: Add the Renesas RZ/N1 timers driver entry

 .../bindings/timer/renesas,rzn1-timer.yaml    |  74 +++
 MAINTAINERS                                   |   7 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi      |  34 ++
 drivers/clocksource/Kconfig                   |  10 +
 drivers/clocksource/Makefile                  |   1 +
 drivers/clocksource/timer-rzn1.c              | 442 ++++++++++++++++++
 6 files changed, 568 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,rzn1-timer.yaml
 create mode 100644 drivers/clocksource/timer-rzn1.c

-- 
2.53.0


