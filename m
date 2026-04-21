Return-Path: <linux-renesas-soc+bounces-31465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uNQ4Oqi+52l4AQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31465-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:15:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCFA43E7F4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:15:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E1C34308D99F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 18:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B55C93D524C;
	Tue, 21 Apr 2026 18:12:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F35F3A9DA9;
	Tue, 21 Apr 2026 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795133; cv=none; b=Ize3EPi4s4mg0x/QWNsisRIabILLTlu5J9hw0lUH/EL/jh6rRVld5q1dErSD816uSDQPUjxnuU3rM8sODItEGV/sKbcPtoxr31WtYJpZ1E4D5SbfxEiU6ddaIG0yS7SBpz+s0AD2iK8dUz93oEMu+qLkJQFjfxhonZ1pdpavILo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795133; c=relaxed/simple;
	bh=NkOwwlNHq7+Ht8Nh8QJy30xjiiGIR5iUBXMJt/v+Al8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwX9VFtbuCeb2rWwr9pgAFcWKo/zELcr0UGVyELeUybtjLuetWo94sg30W0EqScfDOL5zDhqrlb3NJ5o27R+IVCrXaOoyViOShyxzxjFDlKkZZPJHbfr28mIEeUP1a1OVrbMIxiB238/uR0SsxTR5SktRg+e9A9PjG07VrhbbsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EED0C2BCB8;
	Tue, 21 Apr 2026 18:12:08 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 03/14] firmware: arm_scmi: quirk: Handle critical clocks on R-Car X5H
Date: Tue, 21 Apr 2026 20:11:36 +0200
Message-ID: <e2d0f13794ba0e64b6820a354e5b22268a77161b.1776793163.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1776793163.git.geert+renesas@glider.be>
References: <cover.1776793163.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31465-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ADCFA43E7F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Renesas R-Car X5H SCP FW SDKv4.28.0, v4.31.0, and v4.32.0 advertise a
few clocks that crash the system when disabled.  Add quirks to prevent
such crashes.

As SCMI clock IDs are identical for SDKv4.31.0 and v4.32.0, the quirk
for these two versions can be shared.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Some of these could be handled by improving hardware descriptions in DT,
or by the CPG and MDLC drivers.
---
 drivers/firmware/arm_scmi/clock.c  | 23 +++++++++++++++++++++++
 drivers/firmware/arm_scmi/quirks.c |  6 ++++++
 drivers/firmware/arm_scmi/quirks.h |  2 ++
 3 files changed, 31 insertions(+)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index d530882a0bac88c3..4fec8c3216df7a51 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -920,6 +920,26 @@ scmi_clock_config_set_v2(const struct scmi_protocol_handle *ph, u32 clk_id,
 	return ret;
 }
 
+#define QUIRK_RCAR_X5H_4_28_CRIT_CLOCKS					\
+	({								\
+		switch (clk_id) {					\
+		case 468:	/* MDLC_INTAP0 */			\
+		case 498:	/* MDLC_APRTMGINT0 */			\
+		case 840:	/* CLK_ZD_APU0 */			\
+			return -EPERM;					\
+		}							\
+	})
+
+#define QUIRK_RCAR_X5H_4_31_CRIT_CLOCKS					\
+	({								\
+		switch (clk_id) {					\
+		case 464:	/* MDLC_INTAP0 */			\
+		case 494:	/* MDLC_APRTMGINT0 */			\
+		case 836:	/* CLK_ZD_APU0 */			\
+			return -EPERM;					\
+		}							\
+	})
+
 static int scmi_clock_enable(const struct scmi_protocol_handle *ph, u32 clk_id,
 			     bool atomic)
 {
@@ -950,6 +970,9 @@ static int scmi_clock_disable(const struct scmi_protocol_handle *ph, u32 clk_id,
 	if (clk->state_ctrl_forbidden)
 		return -EACCES;
 
+	SCMI_QUIRK(clock_rcar_x5h_4_28_crit_clocks, QUIRK_RCAR_X5H_4_28_CRIT_CLOCKS);
+	SCMI_QUIRK(clock_rcar_x5h_4_31_crit_clocks, QUIRK_RCAR_X5H_4_31_CRIT_CLOCKS);
+
 	return ci->clock_config_set(ph, clk_id, CLK_STATE_DISABLE,
 				    NULL_OEM_TYPE, 0, atomic);
 }
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index e27c21b14220ab5f..4ca6d06f85ebc7b2 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -173,6 +173,10 @@ struct scmi_quirk {
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
 DEFINE_SCMI_QUIRK(clock_rcar_x5h_no_attributes, "Renesas", NULL, "0x10a0000-",
 		  "renesas,r8a78000");
+DEFINE_SCMI_QUIRK(clock_rcar_x5h_4_28_crit_clocks, "Renesas", NULL, "0x10a0000",
+		  "renesas,r8a78000");
+DEFINE_SCMI_QUIRK(clock_rcar_x5h_4_31_crit_clocks, "Renesas", NULL,
+		  "0x10d0000-0x10e0000", "renesas,r8a78000");
 DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
 DEFINE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains, "Renesas", NULL,
 		  "0x10a0000-0x10e0000", "renesas,r8a78000");
@@ -186,6 +190,8 @@ DEFINE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains, "Renesas", NULL,
 static struct scmi_quirk *scmi_quirks_table[] = {
 	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
 	__DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_no_attributes),
+	__DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_4_28_crit_clocks),
+	__DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_4_31_crit_clocks),
 	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
 	__DECLARE_SCMI_QUIRK_ENTRY(power_rcar_x5h_4_28_bad_domains),
 	NULL
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index 67818b6cf0909f8e..56adb5fa87de0127 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -48,6 +48,8 @@ static inline void scmi_quirks_enable(struct device *dev, const char *vend,
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
 DECLARE_SCMI_QUIRK(clock_rcar_x5h_no_attributes);
+DECLARE_SCMI_QUIRK(clock_rcar_x5h_4_28_crit_clocks);
+DECLARE_SCMI_QUIRK(clock_rcar_x5h_4_31_crit_clocks);
 DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
 DECLARE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains);
 
-- 
2.43.0


