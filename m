Return-Path: <linux-renesas-soc+bounces-33883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nc0NBm+zKmrovQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 15:09:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 862AA672372
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 15:09:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7472C30BCAE8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 13:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E3C3FF1DF;
	Thu, 11 Jun 2026 13:03:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053EA403AE7;
	Thu, 11 Jun 2026 13:02:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182979; cv=none; b=klbyMcdjEDiGQrrnw/4okWBSsfI9/Ywe93dHgvprvCBinDBcyuDovY6SFZFkQBAJKzO2kB+wfTAVGL5UYoYP/6VmAEX4DE6h+6BJjxZNmYA6IScjGJ0g4g5N1FofG6VvxqZQ6cjJnExqMo9bSeoOf40+InOK9hHeJBupx8MFPCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182979; c=relaxed/simple;
	bh=3W5wFRe+urc10i12LtOB3bH3rgts0U54xCpl1kI0ZhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JnZmNhJkEVPcTkVfp8VlWaLyY+EA5e+MLJAQjtrzTwlsCAH9/vCG+RWzxGJZqrb+Mi6g+XcIf61bqxzSRlF/S7lvhp6LGPy47Eg/9U4yE9QGCAegvmqbb/Fucs6q0O3Q0f027WUD61SpwBsc6fRjXE6AP9JYq8GrYbsT3ZYzBqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B6A81F00893;
	Thu, 11 Jun 2026 13:02:52 +0000 (UTC)
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
Subject: [PATCH/RFC 8/9] firmware: arm_scmi: quirk: Handle power management clocks on R-Car X5H
Date: Thu, 11 Jun 2026 15:02:12 +0200
Message-ID: <570914c18b34684dd41a1b7b7be9bd7aa377690b.1781171706.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-33883-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 862AA672372

On Renesas R-Car X5H, power management of on-SoC modules is handled
through two methods: module power control and module clock gating.  The
former is exposed as an SCMI power domain, the latter as an SCMI clock.

Currently the SCMI clock protocol does not support advertizing
power-management clocks yet.  Add quirks to mark all module clocks
suitable for power management, reusing the existing clock_rcar_x5h_4_28
and clock_rcar_x5h_4_31 quirk keys.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This patch is included as a PoC.
This does not build as the quirk keys are not added in this series.
---
 drivers/firmware/arm_scmi/clock.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index 42e666a628c732e5..c2648f9f283f2488 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -355,6 +355,18 @@ scmi_clock_get_permissions(const struct scmi_protocol_handle *ph, u32 clk_id,
 	return ret;
 }
 
+#define QUIRK_RCAR_X5H_4_28_PM_CLK					\
+	({								\
+		if (clk_id <= 818 /* Last MDLC clock MDLC_GPIODM3 */)	\
+			clk->pm_clk = true;				\
+	})
+
+#define QUIRK_RCAR_X5H_4_31_PM_CLK					\
+	({								\
+		if (clk_id <= 814 /* Last MDLC clock MDLC_GPIODM3 */)	\
+			clk->pm_clk = true;				\
+	})
+
 static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 				     u32 clk_id, struct clock_info *cinfo)
 {
@@ -410,6 +422,9 @@ static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
 			if (SUPPORTS_EXTENDED_CONFIG(attributes))
 				clk->extended_config = true;
 		}
+
+		SCMI_QUIRK(clock_rcar_x5h_4_28, QUIRK_RCAR_X5H_4_28_PM_CLK);
+		SCMI_QUIRK(clock_rcar_x5h_4_31, QUIRK_RCAR_X5H_4_31_PM_CLK);
 	}
 
 	return ret;
-- 
2.43.0


