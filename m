Return-Path: <linux-renesas-soc+bounces-34859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DTRPB7AlTmpfEAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:25:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAB7724478
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:25:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34859-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61BDF3087125
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 10:17:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 191E63B27D4;
	Wed,  8 Jul 2026 10:16:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB653ABD9D;
	Wed,  8 Jul 2026 10:16:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505819; cv=none; b=owMp2hID3ttVfLYF7Ss3mh0mGRoPIH2w3fTu+n4b8dq32ECidf173gh8DkIeoRCKYSzbcT6+HEZFmz6QkZ9jumq6E4BP7UEW3UmkNNfcilCj/ny3UV2w7skMxYceosC/7kqlNE6YiK9spmkrqQTdghFmP1M3mICA9I37r1ASuP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505819; c=relaxed/simple;
	bh=sSNcREUONuG9Q0IMzd+pkyQi8DzZ1wSZentNPFYra8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VicF+ve0Qg+ZKSafyrM931VnjyzPtiEs1q5qXzSMCLaMgJxlHI5gYH95meNfErlmdYxAL5VueI+OAFSsuS7gCZJhrTYI5VymhVyWzPTbpCcLAab31aebDz4Ga7ZO7vpan6sEeb8S1Qcx/itwAvnq2l9yRC79w07+kTW4o7TGzYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 799901F00A3A;
	Wed,  8 Jul 2026 10:16:52 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 01/10] firmware: arm_scmi: Add scmi_get_base_info()
Date: Wed,  8 Jul 2026 12:16:19 +0200
Message-ID: <32745b4b7744587ee50ea32a818a5bb369b8ef1a.1783505329.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1783505329.git.geert+renesas@glider.be>
References: <cover.1783505329.git.geert+renesas@glider.be>
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
	TAGGED_FROM(0.00)[bounces-34859-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:ulfh@kernel.org,m:rafael@kernel.org,m:p.zabel@pengutronix.de,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:vkoul@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:khilman@baylibre.com,m:florian.fainelli@broadcom.com,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,glider.be:from_mime,glider.be:email,glider.be:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFAB7724478

Currently non-SCMI drivers cannot find out what the specific versions of
each SCMI provider implementation on the running system are.

However, different versions may use different ABIs (e.g. different clock
IDs), provide different abstractions, or behave different, requiring
remapping or workarounds in other drivers.

Add a public function to obtain base protocol information for the
selected SCMI provider.  This will be used by the R-Car X5H Clock Pulse
Generator and Module Controller drivers, to map hardware descriptions in
DT to SCMI abstractions provided by the SCMI implementation present.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Add that SCMI may provide different abstractions,
  - Add missing asterisk to blank kerneldoc line,
  - Return -EPROBE_DEFER or -EOPNOTSUPP instead of -ENOENT.
---
 drivers/firmware/arm_scmi/driver.c | 33 ++++++++++++++++++++++++++++++
 include/linux/scmi_protocol.h      |  8 ++++++++
 2 files changed, 41 insertions(+)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e0d975ec94c4485..80a29c3289f0a841 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -3504,6 +3504,39 @@ int scmi_inflight_count(const struct scmi_handle *handle)
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
+ *
+ * Return: 0 on Success,
+ *         -EPROBE_DEFER if the SCMI provider is not ready yet,
+ *         -EOPNOTSUPP if SCMI support is disabled.
+ */
+int scmi_get_base_info(struct device_node *of_node,
+		       struct scmi_base_info *version)
+{
+	int ret = -EPROBE_DEFER;
+	struct scmi_info *info;
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
index 5ab73b1ab9aa4fa8..fd2d648964f68f53 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -971,6 +971,8 @@ struct scmi_driver {
 int scmi_driver_register(struct scmi_driver *driver,
 			 struct module *owner, const char *mod_name);
 void scmi_driver_unregister(struct scmi_driver *driver);
+int scmi_get_base_info(struct device_node *of_node,
+		       struct scmi_base_info *version);
 #else
 static inline int
 scmi_driver_register(struct scmi_driver *driver, struct module *owner,
@@ -980,6 +982,12 @@ scmi_driver_register(struct scmi_driver *driver, struct module *owner,
 }
 
 static inline void scmi_driver_unregister(struct scmi_driver *driver) {}
+
+static inline int scmi_get_base_info(struct device_node *of_node,
+				     struct scmi_base_info *version)
+{
+	return -EOPNOTSUPP;
+}
 #endif /* CONFIG_ARM_SCMI_PROTOCOL */
 
 #define scmi_register(driver) \
-- 
2.43.0


