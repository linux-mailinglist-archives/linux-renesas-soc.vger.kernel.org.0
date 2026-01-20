Return-Path: <linux-renesas-soc+bounces-27125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGwbMv6ib2l7DgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27125-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 16:45:02 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8672446876
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 16:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 9BAC85CC23B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jan 2026 15:24:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDFA24657D8;
	Tue, 20 Jan 2026 15:06:24 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51A6844DB63;
	Tue, 20 Jan 2026 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768921584; cv=none; b=j6Fj+r3/hZgM7SraIcDG6pnHZXrZw2ABpXsoM/xtcdts2zdGFGTzIHenVYIU45FlfWsGpK+rze5Lj4MUFDudvIWLMys38DSkhSiXU8UicotXFvN2mbNqn/xNE72kvci21wCEEl43gNwmtOrH1kRcfHXmiwZcN58/HNPyd6bTC9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768921584; c=relaxed/simple;
	bh=g74mkjYd/T1r49iTPjhmB5mxAtAAYnDMu7MuP8yatps=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fcFWB1THE8ckzp/7zWxMXK8UQuwzmAzDFKKxYyrbgr4A8RqkjsGTBrKiW8xXtY07rrKxb9Vigi/8wflhpkojv8ag6nkqXsgvRsYdJ8zYSovphOhbmiMql3Nradh64tOwlQeltPjnd1tmWeF68sKkrODRl4R9wkR2OJzX6ffkfFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: NS3+FQE1SNuDrS2ILb8POQ==
X-CSE-MsgGUID: LcuSTYA9R6ysKuhq9B6G5w==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jan 2026 00:06:16 +0900
Received: from vm01.adwin.renesas.com (unknown [10.226.92.24])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C65F2402261F;
	Wed, 21 Jan 2026 00:06:12 +0900 (JST)
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
Subject: [PATCH v2 1/5] clk: versaclock3: Remove unused SE2 clock select macro
Date: Tue, 20 Jan 2026 15:06:02 +0000
Message-ID: <20260120150606.7356-2-ovidiu.panait.rb@renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
References: <20260120150606.7356-1-ovidiu.panait.rb@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : No valid SPF, No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27125-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com,kernel.org,baylibre.com,bp.renesas.com,renesas.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[ovidiu.panait.rb@renesas.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,renesas.com:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 8672446876
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The VC3_SE2_CTRL_REG0_SE2_CLK_SEL macro is no longer used since
commit ae6040cd7c7f8 ("clk: versaclock3: Prepare for the addition of
5L35023 device"), which switched SE2 clock select handling to use
variant-specific OF data (se2_clk_sel_msk).

Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
---
v2 changes: None.

 drivers/clk/clk-versaclock3.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 1849863dbd67..f387cdb12f48 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -61,7 +61,6 @@
 #define VC3_OUTPUT_CTR_DIV4_SRC_SEL	BIT(3)
 
 #define VC3_SE2_CTRL_REG0		0x1f
-#define VC3_SE2_CTRL_REG0_SE2_CLK_SEL	BIT(6)
 
 #define VC3_SE3_DIFF1_CTRL_REG		0x21
 #define VC3_SE3_DIFF1_CTRL_REG_SE3_CLK_SEL	BIT(6)
-- 
2.51.0


