Return-Path: <linux-renesas-soc+bounces-31463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFQ3Ema+52kWAQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31463-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:13:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B70E143E76B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:13:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D9BAF307F55E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 18:12:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E0163A9DAB;
	Tue, 21 Apr 2026 18:12:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0324335972;
	Tue, 21 Apr 2026 18:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795123; cv=none; b=a4t4hMIDD/kOqgmBtjR09MHEg5rpPTwryZa18uAfXHLvac26IdCaNZdE6/k1Dydhbc/K4TVjEcO5KJAsk1BwtoYVBuE5N4r+FxqdvU9GrqHdQUg8d/9LYgBbINNpyOfOU2sbo3ieYiKZj7kmvevw6XHzLodyDomBDozhcUQdDD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795123; c=relaxed/simple;
	bh=5VEixkE58MNW6N7cqIB2r0d5ZtOUBNpC57TW2bIdFYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dt4vZ45zcMXn9E1sQWJrfLUh0Y3AXkyymJIdUANZFAN3TGYgQwcixcwxv+SgJQpj0nWLxRpLIKXR2JAPQGRgoQ601JmxE+xy5VDQ8kdU0g/S5wiwntGE+R/lrOOCB9AnsOh0f47Uq6/RCZelMvgcejs3JWZkbYbBhClWiXitTr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02FABC2BCB4;
	Tue, 21 Apr 2026 18:11:57 +0000 (UTC)
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
Subject: [PATCH/RFC 01/14] firmware: arm_scmi: quirk: Handle bad power domains on R-Car X5H
Date: Tue, 21 Apr 2026 20:11:34 +0200
Message-ID: <393522103906f8b2a6311c13c7c793bdcebbc96c.1776793163.git.geert+renesas@glider.be>
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
	TAGGED_FROM(0.00)[bounces-31463-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:mid,glider.be:email]
X-Rspamd-Queue-Id: B70E143E76B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Renesas R-Car X5H SCP FW SDKv4.28.0, v4.31.0, and v4.32.0 advertise a
few power domains that crash the system when touched or powered off.
Add a quirk to prevent such crashes.

As the SCMI power domain IDs are identical for all three versions, the
quirk can be shared.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Preventing power off could be handled in the MDLC driver, but no-touch
cannot.
---
 drivers/firmware/arm_scmi/power.c  | 20 ++++++++++++++++++++
 drivers/firmware/arm_scmi/quirks.c |  3 +++
 drivers/firmware/arm_scmi/quirks.h |  1 +
 3 files changed, 24 insertions(+)

diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
index bb5062ab8280e02b..81b9035aa5a2eafe 100644
--- a/drivers/firmware/arm_scmi/power.c
+++ b/drivers/firmware/arm_scmi/power.c
@@ -12,6 +12,7 @@
 
 #include "protocols.h"
 #include "notify.h"
+#include "quirks.h"
 
 /* Updated only after ALL the mandatory features for that version are merged */
 #define SCMI_PROTOCOL_SUPPORTED_VERSION		0x30001
@@ -150,6 +151,23 @@ scmi_power_domain_attributes_get(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+#define QUIRK_RCAR_X5H_4_28_BAD_DOMAINS					\
+	({								\
+		switch (domain) {					\
+		/* Do not touch */					\
+		case 29:	/* PD_RC08 */				\
+		case 92:	/* PD_ACL0 */				\
+		case 116:	/* PD_CMN */				\
+			return -EPERM;					\
+									\
+		/* Do not power off */					\
+		case 76:	/* PD_AC00 */				\
+			if (state == SCMI_POWER_STATE_GENERIC_OFF)	\
+				return -EPERM;				\
+			break;						\
+		}							\
+	})
+
 static int scmi_power_state_set(const struct scmi_protocol_handle *ph,
 				u32 domain, u32 state)
 {
@@ -157,6 +175,8 @@ static int scmi_power_state_set(const struct scmi_protocol_handle *ph,
 	struct scmi_xfer *t;
 	struct scmi_power_set_state *st;
 
+	SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains, QUIRK_RCAR_X5H_4_28_BAD_DOMAINS);
+
 	ret = ph->xops->xfer_get_init(ph, POWER_STATE_SET, sizeof(*st), 0, &t);
 	if (ret)
 		return ret;
diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
index 2b38ba3f59a13c9e..c1a2f58505c1a757 100644
--- a/drivers/firmware/arm_scmi/quirks.c
+++ b/drivers/firmware/arm_scmi/quirks.c
@@ -172,6 +172,8 @@ struct scmi_quirk {
 /* Global Quirks Definitions */
 DEFINE_SCMI_QUIRK(clock_rates_triplet_out_of_spec, NULL, NULL, NULL);
 DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
+DEFINE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains, "Renesas", NULL,
+		  "0x10a0000-0x10e0000", "renesas,r8a78000");
 
 /*
  * Quirks Pointers Array
@@ -182,6 +184,7 @@ DEFINE_SCMI_QUIRK(perf_level_get_fc_force, "Qualcomm", NULL, "0x20000-");
 static struct scmi_quirk *scmi_quirks_table[] = {
 	__DECLARE_SCMI_QUIRK_ENTRY(clock_rates_triplet_out_of_spec),
 	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
+	__DECLARE_SCMI_QUIRK_ENTRY(power_rcar_x5h_4_28_bad_domains),
 	NULL
 };
 
diff --git a/drivers/firmware/arm_scmi/quirks.h b/drivers/firmware/arm_scmi/quirks.h
index d8ba60b956522d04..108c8d11f6043a61 100644
--- a/drivers/firmware/arm_scmi/quirks.h
+++ b/drivers/firmware/arm_scmi/quirks.h
@@ -48,5 +48,6 @@ static inline void scmi_quirks_enable(struct device *dev, const char *vend,
 /* Quirk delarations */
 DECLARE_SCMI_QUIRK(clock_rates_triplet_out_of_spec);
 DECLARE_SCMI_QUIRK(perf_level_get_fc_force);
+DECLARE_SCMI_QUIRK(power_rcar_x5h_4_28_bad_domains);
 
 #endif /* _SCMI_QUIRKS_H */
-- 
2.43.0


