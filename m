Return-Path: <linux-renesas-soc+bounces-33880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V6NSBQCzKmqRvQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 15:07:12 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F14F672317
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 15:07:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33880-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 694A730E2445
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 13:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89ED5404BDF;
	Thu, 11 Jun 2026 13:02:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB8F403AEE;
	Thu, 11 Jun 2026 13:02:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182967; cv=none; b=HqpBGTkMRHTWPRmiMwIelkPtvUAQu+yY8J4Rb16gnF1OWv4YX0TjYttvYTk/AtfeJ6lw8IS6/beylJNG4NH2rrtGW+ndt+/2UXb2ht0rRoz+svcVKd0Tj1iUxSLtw79UJAbcwu28nu+z5Rxs2DiEdoLTduJ+u+33EX40mgBweVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182967; c=relaxed/simple;
	bh=BZYRUafz0PZfiuP8RjO86Iw2TkwMsiuvbgKc02CLGKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t836jEJ/j49hiTXMamZ+XsB06Msz6++Ei/aDlaxUwbvRTWcLrQeUZ5kcIZZNqdXIz+Gk2kVddyULKbmgdVC7VjMTjE7KEmtr+te5WwWRO9sZyWGBvyfjksYxboJeXhS58SuA4ovFwt1T4BJyHu6kPuqH4m88wdWgRm5xNSQ3ykg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40ADF1F00898;
	Thu, 11 Jun 2026 13:02:41 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 5/9] clk: scmi: Add scmi_clk_is_pm_clk()
Date: Thu, 11 Jun 2026 15:02:09 +0200
Message-ID: <af9666e8fb841606b42d865d42adcaf472099ce1.1781171705.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1781171705.git.geert+renesas@glider.be>
References: <cover.1781171705.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-33880-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,glider.be:email,glider.be:mid,glider.be:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F14F672317

Add a helper for querying if an SCMI clock can be used for
power-management.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/clk-scmi.c   |  9 +++++++++
 include/linux/clk/scmi.h | 17 +++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 include/linux/clk/scmi.h

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 7c562559ad8bb47f..20e6da1859290b75 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -7,6 +7,7 @@
 
 #include <linux/bits.h>
 #include <linux/clk-provider.h>
+#include <linux/clk/scmi.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/of.h>
@@ -364,6 +365,14 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	return ops;
 }
 
+bool scmi_clk_is_pm_clk(struct clk *clk)
+{
+	struct clk_hw *hw = __clk_get_hw(clk);
+
+	return hw && to_scmi_clk(hw)->info->pm_clk;
+}
+EXPORT_SYMBOL_GPL(scmi_clk_is_pm_clk);
+
 static int scmi_clocks_probe(struct scmi_device *sdev)
 {
 	int idx, count, err;
diff --git a/include/linux/clk/scmi.h b/include/linux/clk/scmi.h
new file mode 100644
index 0000000000000000..12c338598d09296f
--- /dev/null
+++ b/include/linux/clk/scmi.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+
+ */
+
+#ifndef __LINUX_CLK_SCMI_H_
+#define __LINUX_CLK_SCMI_H_
+
+#include <linux/types.h>
+
+struct clk;
+
+#if IS_ENABLED(CONFIG_COMMON_CLK_SCMI)
+bool scmi_clk_is_pm_clk(struct clk *clk);
+#else
+static inline bool scmi_clk_is_pm_clk(struct clk *clk) { return false; }
+#endif
+
+#endif /* __LINUX_CLK_SCMI_H_ */
-- 
2.43.0


