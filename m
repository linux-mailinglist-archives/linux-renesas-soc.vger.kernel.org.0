Return-Path: <linux-renesas-soc+bounces-31467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHSLGsm+52l4AQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:15:37 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1122E43E841
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:15:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id ACAAA303AA33
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 18:12:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B1D33ACA6B;
	Tue, 21 Apr 2026 18:12:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AAA35972;
	Tue, 21 Apr 2026 18:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795143; cv=none; b=YCzT/PborJy5BBSRGb+Q4XkqnDrAd/UvqkeCC1E+EAMEPrGLD0wiRlcqbM/YBj1koYVseqGDwmGG+E+qb2YLWxGQy0X1ahw23oZ7pldgrjujrZOWKT19N4dPF8NqEHcCOhtwp6ZBVHSIge2n3HYgX5Va51cmqAyc8cjb2QyechU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795143; c=relaxed/simple;
	bh=X663d4IHOAyYFQoCnPaOg4te2XgqLTCjAjyVj26Dxeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K26S61DcHqufLH9PIsijzvbPIeKzzGOjvveiRz9El6oXZoaGMzkb8e9cRZc3IJfJNX6DnEEvVCoFcN2j175MDyu3r6zFHjMhCzCWv1A/MRX1A4S5D6J+gSQaTjlcnmckvcgFK0NdJFQPY4dknqmxO+vNwl8KaILfDdobw/ZfIWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A668C2BCB0;
	Tue, 21 Apr 2026 18:12:18 +0000 (UTC)
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
Subject: [PATCH/RFC 05/14] firmware: arm_scmi: Add scmi_get_base_info()
Date: Tue, 21 Apr 2026 20:11:38 +0200
Message-ID: <72e2a0e7a5abda02fe36b3f5851842f7a77b2593.1776793163.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31467-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,glider.be:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1122E43E841
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently non-SCMI drivers cannot find out what the specific versions of
each SCMI provider implementation on the running system are.

However, different versions may use different ABIs (e.g. different clock
IDs), or behave different, requiring remapping or workarounds in other
drivers.

Add a public function to obtain base protocol information for the
selected SCMI provider.  This will be used by the R-Car X5H Clock Pulse
Generator and Module Controller drivers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/driver.c | 31 ++++++++++++++++++++++++++++++
 include/linux/scmi_protocol.h      |  8 ++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e0d975ec94c4485..dfa8961775aa952d 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3504,6 +3504,37 @@ int scmi_inflight_count(const struct scmi_handle *handle)
 	}
 }
 
+/**
+ * scmi_get_base_info() - Get SCMI base protocol information
+ *
+ * @of_node: pointer to a device node for an SCMI provider
+ * @version: pointer to write base protocol information
+ *
+ * Check if an SCMI device has been instantiated for the passed device node
+ * pointer, and, if found, return its base info.
+
+ * Return: 0 on Success or -ENOENT.
+ */
+int scmi_get_base_info(struct device_node *of_node,
+		       struct scmi_base_info *version)
+{
+	struct scmi_info *info;
+	int ret = -ENOENT;
+
+	mutex_lock(&scmi_list_mutex);
+	list_for_each_entry(info, &scmi_list, node) {
+		if (info->dev->of_node == of_node) {
+			*version = info->version;
+			ret = 0;
+			break;
+		}
+	}
+	mutex_unlock(&scmi_list_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(scmi_get_base_info);
+
 static int __init scmi_driver_init(void)
 {
 	scmi_quirks_initialize();
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 49cc39e0cbca5a0b..52eba920de264bd7 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -972,6 +972,8 @@ struct scmi_driver {
 int scmi_driver_register(struct scmi_driver *driver,
 			 struct module *owner, const char *mod_name);
 void scmi_driver_unregister(struct scmi_driver *driver);
+int scmi_get_base_info(struct device_node *of_node,
+		       struct scmi_base_info *version);
 #else
 static inline int
 scmi_driver_register(struct scmi_driver *driver, struct module *owner,
@@ -981,6 +983,12 @@ scmi_driver_register(struct scmi_driver *driver, struct module *owner,
 }
 
 static inline void scmi_driver_unregister(struct scmi_driver *driver) {}
+
+static inline int scmi_get_base_info(struct device_node *of_node,
+				     struct scmi_base_info *version)
+{
+	return -ENOENT;
+}
 #endif /* CONFIG_ARM_SCMI_PROTOCOL */
 
 #define scmi_register(driver) \
-- 
2.43.0


