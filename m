Return-Path: <linux-renesas-soc+bounces-28659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBg7GJbEpWnEFgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 18:10:46 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 012B51DD94F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 18:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD0983016538
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 16:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C1FC41C2EC;
	Mon,  2 Mar 2026 16:54:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5ADBC3D7D78;
	Mon,  2 Mar 2026 16:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772470497; cv=none; b=go5n6c5GYIZhacPFOSccft3cNn2HFqpW98UjYeraqiZtZcDDQDdO8TzFgkTR4Hm1Nz4yOzEzm7ZX3fCZ+T3xLWSSjKTb3tYqCD6to+9VM3/upy8xsQKxb0Uapgj2mH0+nmS4iwVJ+01cmi6dxlFPpcGnxPlHdLDcMjT1IwDnr1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772470497; c=relaxed/simple;
	bh=M+KWW9jtWNzuJh3BnQ4NQ9icmYIMfuXtVW2CigPCsx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=It9xlxUt62RCDZcjOkI8dfL+C+R6VnHd4yh7qSBfRokHwLLkH02danC2GglXpFWdtJvrO6cOKV/MTOn+GUXvj9eoGW9KmxSiWdHLqAHXOK0wLdpnfE2K4t7uLncFk2s85QYKNFmUK84Lc+DaqByPX2NRlTiR9inDGzdRMe8Ly1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: FwUjZZ3OTgaAZhCtl+FtyA==
X-CSE-MsgGUID: NDMpaP98T8apridYVDL24w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Mar 2026 01:54:47 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.15])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 53FEF401C226;
	Tue,  3 Mar 2026 01:54:43 +0900 (JST)
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
Subject: [PATCH v4 0/7] Add versaclock3 support for RZ/V2H
Date: Mon,  2 Mar 2026 16:54:34 +0000
Message-ID: <20260302165441.4457-1-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 012B51DD94F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.64 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28659-lists,linux-renesas-soc=lfdr.de];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.816];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,renesas.com:mid]
X-Rspamd-Action: no action

Hi,

This series extends the versaclock3 driver to support registering multiple
devices at the same time, and adds support for the internal freerunning
32.768 kHz clock. The 32k clock is used on the Renesas RZ/V2H SoC as RTC
counter clock.

The dts nodes for the RZ/V2H EVK was updated to describe the versa3
devices found on the boards.

Best regards,
Ovidiu

v4:
- Used the I2C device name to make the clock names unique, instaed of the
  dts node name.
- Dropped the RZ/V2N dts patch from this series, as the latest RZ/V2N EVK
  board revision (v2) does not connect the versa3 chip to the I2C bus
  anymore. The PCIe and audio cloks will be added when support for those
  respective interfaces is added.

v3: https://lore.kernel.org/all/20260203135139.28151-1-ovidiu.panait.rb@renesas.com/
- Fixed a NULL pointer dereference on the error paths.
- Added support for registering multiple versa3 instances at the same time.
- Made clock names unique by prefixing them with the DT node name.
- Rebased the internal 32k clock patch to match the new logic.
- Added comments in RZ/V2H and RZ/V2N board dts to document rtxin_clk and
  qextal_clk routing.

v2: https://lore.kernel.org/all/20260120150606.7356-1-ovidiu.panait.rb@renesas.com/
- Added versaclock3 dts node for RZ/V2N EVK.

v1: https://lore.kernel.org/all/20251021175311.19611-1-ovidiu.panait.rb@renesas.com/

Ovidiu Panait (7):
  clk: versaclock3: Fix NULL pointer dereference in error path
  clk: versaclock3: Remove unused SE2 clock select macro
  clk: versaclock3: Reference parent clocks by type and index
  clk: versaclock3: Add per-device clock data structure
  clk: versaclock3: Prefix clock names with device name
  clk: versaclock3: Add freerunning 32.768kHz clock support
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock
    generator node

 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  25 +
 drivers/clk/clk-versaclock3.c                 | 618 +++++++++++++-----
 2 files changed, 481 insertions(+), 162 deletions(-)

-- 
2.51.0


