Return-Path: <linux-renesas-soc+bounces-31464-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJySLYi+52kWAQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31464-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:14:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 325FC43E796
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4C62930868E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 18:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7B7A3B19C2;
	Tue, 21 Apr 2026 18:12:08 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785D83876D0;
	Tue, 21 Apr 2026 18:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795128; cv=none; b=pB1WIPbdwokq+3ICseQWDhpu7JjyRR3cLRBU1HfJIbEehevMczwOm+w0WzsUFPXHv7oeuX4apptw52mJExFXZEm7LFRHK+QCYkrloI66ifdEtQh5aopzfqYT4QM5UFf2oWdr1WMnFMeEkdk9x3JrxEvnE3v4IRQR90pouMGe8VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795128; c=relaxed/simple;
	bh=EKhm5N5EJOzTY3hGdBFEEWKdxcNbPJhJMZfobrbkHg0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fQGl16DC33pipWxiDVK9l+maGSugCyb+OtXBmUzuKcz6wvKk51YOs7lUoD31FFslEAyIsYgcajFF8eXX9BnsdCGeXQxhq0TNG8wIP7nRxekCPobT1ZVfAkLbO3HYKB0xpsVt2S4YmNvO2L6hC52+D9KkpCp1yugrNdkLRZOw07U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18295C2BCB0;
	Tue, 21 Apr 2026 18:12:02 +0000 (UTC)
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
Subject: [PATCH/RFC 02/14] firmware: arm_scmi: quirk: Handle bad clocks on R-Car X5H
Date: Tue, 21 Apr 2026 20:11:35 +0200
Message-ID: <24bea8791a53e6c969ef97b506cfec25054099c8.1776793163.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31464-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:mid,glider.be:email]
X-Rspamd-Queue-Id: 325FC43E796
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Renesas R-Car X5H SCP FW SDKv4.28.0, v4.31.0, and v4.32.0 expose a few
clocks that do not support the CLOCK_ATTRIBUTES or CLOCK_DESCRIBE_RATES
command.  Since commit 0d8b0c8068a8ff5f ("firmware: arm_scmi: Harden
clock protocol initialization") in scmi/for-linux-next (next-20260319
and later), scmi_clock_attributes_get() or
scmi_clock_describe_rates_get() failures are no longer ignored, but
prevent the SCMI clock driver from initializing.

Hence add a quirk to ignore such failures, like before.  As the quirk
handling is harmless for unaffected systems, make it generic for all
R-Car X5H systems using SCP FW SDKv4.28.0 or later.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/clock.c  | 14 ++++++++++++++
 drivers/firmware/arm_scmi/quirks.c |  3 +++
 drivers/firmware/arm_scmi/quirks.h |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/firmware/arm_scmi/clock.c b/drivers/firmware/arm_scmi/clock.c
index ce6f968925af38c0..d530882a0bac88c3 100644
--- a/drivers/firmware/arm_scmi/clock.c
+++ b/drivers/firmware/arm_scmi/clock.c
@@ -1232,6 +1232,18 @@ static const struct scmi_protocol_events clk_protocol_events = {
 	.num_events = ARRAY_SIZE(clk_events),
 };
 
+#define QUIRK_RCAR_X5H_NO_ATTRIBUTES					\
+	({								\
+		if (ret == -EREMOTEIO || ret == -EOPNOTSUPP)		\
+			continue;					\
+	})
+
+#define QUIRK_RCAR_X5H_NO_RATES						\
+	({								\
+		if (ret == -EOPNOTSUPP)					\
+			ret = 0;					\
+	})
+
 static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 {
 	int clkid, ret;
@@ -1256,10 +1268,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
 	for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
 		cinfo->clkds[clkid].id = clkid;
 		ret = scmi_clock_attributes_get(ph, clkid, cinfo);
+		SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_ATTRIBUTES);
 		if (ret)
 			return ret;
 
 		ret = scmi_clock_describe_rates_get(ph, clkid, cinfo);
+		SCMI_QUIRK(clock_rcar_x5h_no_attributes, QUIRK_RCAR_X5H_NO_RATES);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index c1a2f58505c1a757..e27c21b14220ab5f 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -171,6 +171,8 @@ struct scmi_quirk {
 
 /* Global Quirks Definitions */
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
+DEFINE_SCMI_QUIRK(clock_rcar_x5h_no_attributes, "Renesas", NULL, "0x10a0000-",
+		  "renesas,r8a78000");
 DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
 DEFINE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains, "Renesas", NULL,
 		  "0x10a0000-0x10e0000", "renesas,r8a78000");
@@ -183,6 +185,7 @@ DEFINE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains, "Renesas", NULL,
  */
 static struct scmi_quirk *scmi_quirks_table[] = {
 	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
+	__DECLARE_SCMI_QUIRK_ENTRY(clock_rcar_x5h_no_attributes),
 	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
 	__DECLARE_SCMI_QUIRK_ENTRY(power_rcar_x5h_4_28_bad_domains),
 	NULL
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index 108c8d11f6043a61..67818b6cf0909f8e 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -47,6 +47,7 @@ static inline void scmi_quirks_enable(struct device *dev, const char *vend,
 
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
+DECLARE_SCMI_QUIRK(clock_rcar_x5h_no_attributes);
 DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
 DECLARE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains);
 
-- 
2.43.0


