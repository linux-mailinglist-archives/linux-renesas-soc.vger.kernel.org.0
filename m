Return-Path: <linux-renesas-soc+bounces-32294-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOLMCMAC/mkTlwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32294-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 17:35:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC04F8C64
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 08 May 2026 17:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 271103024872
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 May 2026 15:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60AF33FD140;
	Fri,  8 May 2026 15:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Tw2Buhxn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7A593FBEC2;
	Fri,  8 May 2026 15:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778254429; cv=none; b=BlfkmK1gDrBRjWf/fMOMZRwgGPKHQzHr48Q6U6wnC/BeM0YuuQFI+UUvqTrwkBGVsE21IFMOY5v+p592cFIEgBwLXVnA1HtFVfmmwWjr/+6b2S2beeudeuXDmeZieGIEctrAIXghv/Q+85U3umyShB0CNG/iOYcbGYqRTqULSiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778254429; c=relaxed/simple;
	bh=O+pJK9yNpRW7ElmpapJx6mgOnLh69isNLEWDe2uLoJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNNw3uE41+2aYA/tAVKhCNlNlHO1vGGy1EjojMn/z8em0jVzlHNkvOl69Ml5jWNo1kCiJkyLVMobceSTqmIvtRaFuHw9vWZaecVRvi33R/LU4ohahKgwhoclTB2BC1BF0t1CgoBHkQ5Itma4up1TQuw0tz4xo1RO7lqJEOW0CXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Tw2Buhxn; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0E2B359E;
	Fri,  8 May 2026 08:33:41 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8853F3F836;
	Fri,  8 May 2026 08:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254427; bh=O+pJK9yNpRW7ElmpapJx6mgOnLh69isNLEWDe2uLoJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tw2Buhxn0MHjpOIImv4BM3iOROyKqlpEtq3DbYhamuHu2Q8jjLyemsJJWOD24tO15
	 LMHUCFu7LoxQE9MdprABVZx8WWnBIjWhOUTJ7bpvSD68BMxzDXDqyjNdG16nxE51uT
	 Hy2mc4xFghmE16IlJq4YNCcWy7dbK78ca0zqe8v8=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Peng Fan <peng.fan@nxp.com>
Subject: [PATCH v4 06/15] firmware: arm_scmi: Drop unused clock rate interfaces
Date: Fri,  8 May 2026 16:32:51 +0100
Message-ID: <20260508153300.2224715-7-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260508153300.2224715-1-cristian.marussi@arm.com>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 26EC04F8C64
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[arm.com,broadcom.com,gmail.com,linaro.org,foss.st.com,oss.nxp.com,amd.com,glider.be,renesas.com,nxp.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32294-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cristian.marussi@arm.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arm.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,arm.com:email,arm.com:mid,arm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Only the unified interface exposing min_rate/max_rate is now used.

Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v3 --> v4
 - Remove also unused public info.rate_discrete [Geert]
v1 --> v2
 - Collected Peng Reviewed-by tag
---
 include/linux/scmi_protocol.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 7283302b0c85..19834f85f5d3 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -44,7 +44,6 @@ struct scmi_revision_info {
 struct scmi_clock_info {
 	char name[SCMI_MAX_STR_SIZE];
 	unsigned int enable_latency;
-	bool rate_discrete;
 	bool rate_changed_notifications;
 	bool rate_change_requested_notifications;
 	bool state_ctrl_forbidden;
@@ -53,17 +52,6 @@ struct scmi_clock_info {
 	bool extended_config;
 	u64 min_rate;
 	u64 max_rate;
-	union {
-		struct {
-			int num_rates;
-			u64 rates[SCMI_MAX_NUM_RATES];
-		} list;
-		struct {
-			u64 min_rate;
-			u64 max_rate;
-			u64 step_size;
-		} range;
-	};
 	int num_parents;
 	u32 *parents;
 };
-- 
2.53.0


