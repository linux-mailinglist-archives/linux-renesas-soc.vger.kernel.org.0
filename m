Return-Path: <linux-renesas-soc+bounces-27840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADXEC3n9gWk7NQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27840-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:51:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C2DDA25D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 14:51:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D0DF73034EF2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 13:51:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C2339E6C3;
	Tue,  3 Feb 2026 13:51:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A94F38E11F;
	Tue,  3 Feb 2026 13:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770126709; cv=none; b=GqCnVmcG2ZQACEbFPwiIwg4O55vTPFTOo1FXcDzS9vVUDPjMIriOZmql2bE1ioehxRvLlEhdetq4+Z8TwhTPYBJpbats0xO0Teix5IjJX5fx8AeorQHtWnDoOHkzQAOZRqvdkkiePAZ/D00Dd2T9Qinp+VPlfFuAENemZGByw4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770126709; c=relaxed/simple;
	bh=Yja9z00myolK/rxijUf6vQvKKm/kk51yjjM6oZ7Fmas=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fbUMvFLMBGXRXZTmdIKk1jrB0G5GCzOb4TUknJlX9vFkLT9YzOb4oLbFNPKbTt9GcGmBhSJo7Zc1js5eSqINroI3nR7IKHp2WXaHoJfQ+URrx4Kfdf7jC9KXMILESEvVqgl0nxB1TX/FdL+spSl5svAGLPaANBr5Zl3sOKbXMNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: EBI8gsTxQiqdqIR1jwIr1g==
X-CSE-MsgGUID: +HlSqTVwQqWedxIFktftKg==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Feb 2026 22:51:45 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.93.5])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2AE66421BAEF;
	Tue,  3 Feb 2026 22:51:40 +0900 (JST)
From: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	biju.das.jz@bp.renesas.com,
	fabrizio.castro.jz@renesas.com
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 0/8] Add versaclock3 support for RZ/V2H and RZ/V2N EVKs
Date: Tue,  3 Feb 2026 13:51:31 +0000
Message-ID: <20260203135139.28151-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27840-lists,linux-renesas-soc=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,renesas.com:mid]
X-Rspamd-Queue-Id: 71C2DDA25D
X-Rspamd-Action: no action

Hi,

This series extends the versaclock3 driver to support registering multiple
devices at the same time, and adds support for the internal freerunning
32.768 kHz clock. The 32k clock is used on the Renesas RZ/V2H and RZ/V2N
SoCs as RTC counter clock.

The dts nodes for the RZ/V2H and RZ/V2N EVKs were updated to describe
the versa3 devices found on the boards.

Best regards,
Ovidiu

v3:
- Fixed a NULL pointer dereference on the error paths.
- Added support for registering multiple versa3 instances at the same time.
- Made clock names unique by prefixing them with the DT node name.
- Rebased the internal 32k clock patch to match the new logic.
- Added comments in RZ/V2H and RZ/V2N board dts to document rtxin_clk and
  qextal_clk routing.

v2: https://lore.kernel.org/all/20260120150606.7356-1-ovidiu.panait.rb@renesas.com/
- Added versaclock3 dts node for RZ/V2N EVK.

v1: https://lore.kernel.org/all/20251021175311.19611-1-ovidiu.panait.rb@renesas.com/

Ovidiu Panait (8):
  clk: versaclock3: Fix NULL pointer dereference in error path
  clk: versaclock3: Remove unused SE2 clock select macro
  clk: versaclock3: Reference parent clocks by type and index
  clk: versaclock3: Add per-device clock data structure
  clk: versaclock3: Prefix clock names with DT node name
  clk: versaclock3: Add freerunning 32.768kHz clock support
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock
    generator node
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add versa3 clock
    generator node

 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  25 +
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  25 +
 drivers/clk/clk-versaclock3.c                 | 618 +++++++++++++-----
 3 files changed, 506 insertions(+), 162 deletions(-)

-- 
2.51.0


