Return-Path: <linux-renesas-soc+bounces-33876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eIr1I4WyKmoXvQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 15:05:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F30BC672295
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 15:05:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7DF1307BFF1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 13:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75ADD3FE34E;
	Thu, 11 Jun 2026 13:02:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483963FE344;
	Thu, 11 Jun 2026 13:02:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182950; cv=none; b=EOTar21spm+j+yJaXQz76mPuKGSdQ8N50YfctYTItUeehlbSME5/ZY8W2N8/OobImgb8I4mAx01D+nDSW9obm8xtvwmapiwVc5gRuTp4+2USHkzydNJfKqBV6m3E5hNV2Z+cY49cpONLCpjObzTkO614ky+1m+nJ9tti/S8AmPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182950; c=relaxed/simple;
	bh=Cs+wVNE9TrDpVQx7y4k4Dn9Hnr6orLxp/JM7ceN9OwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e/sd8MY4f3H6ie5AcdNPRS0XCEETnDMVgd0J5M10SMfN2C4spNMhRt9MWLx4OR6eD+YwFjOYWiJN4QA0L9MWIos8chKS7qZ7Hr7v41+RbumeTsexpioCjuxfl7SM/jRJ8pgDVZYiP7WM+MHc4t+DR0WZb/rIZH28EMdLMwUhMGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DF1D1F00898;
	Thu, 11 Jun 2026 13:02:25 +0000 (UTC)
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
Subject: [PATCH/RFC 1/9] firmware: arm_scmi: Replace scmi_power_proto_ops.name_get() by .info_get()
Date: Thu, 11 Jun 2026 15:02:05 +0200
Message-ID: <4957c0d80d2d30ee21a0f6dd596015f57965340d.1781171705.git.geert+renesas@glider.be>
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
	TAGGED_FROM(0.00)[bounces-33876-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:email,glider.be:mid,glider.be:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F30BC672295

The SCMI power domain protocol operations structure does not provide a
.info_get() method, unlike most other protocols.  Instead, it provides
a .name_get() method.

Replace the .name_get() method by the .info_get() method, to increase
uniformity, and to prepare for returning more information.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/arm_scmi/power.c     | 17 ++++++++---------
 drivers/pmdomain/arm/scmi_pm_domain.c |  9 ++++++++-
 include/linux/scmi_protocol.h         | 10 +++++++---
 3 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/arm_scmi/power.c b/drivers/firmware/arm_scmi/power.c
index 28ef63a4ecc2e1df..a00f7c298efb74f9 100644
--- a/drivers/firmware/arm_scmi/power.c
+++ b/drivers/firmware/arm_scmi/power.c
@@ -63,7 +63,7 @@ struct power_dom_info {
 	bool state_set_sync;
 	bool state_set_async;
 	bool state_set_notify;
-	char name[SCMI_MAX_STR_SIZE];
+	struct scmi_power_domain_info info;
 };
 
 struct scmi_power_info {
@@ -132,7 +132,7 @@ scmi_power_domain_attributes_get(const struct scmi_protocol_handle *ph,
 				SUPPORTS_STATE_SET_NOTIFY(flags);
 		dom_info->state_set_async = SUPPORTS_STATE_SET_ASYNC(flags);
 		dom_info->state_set_sync = SUPPORTS_STATE_SET_SYNC(flags);
-		strscpy(dom_info->name, attr->name, SCMI_SHORT_NAME_MAX_SIZE);
+		strscpy(dom_info->info.name, attr->name, SCMI_SHORT_NAME_MAX_SIZE);
 	}
 	ph->xops->xfer_put(ph, t);
 
@@ -143,7 +143,7 @@ scmi_power_domain_attributes_get(const struct scmi_protocol_handle *ph,
 	if (!ret && PROTOCOL_REV_MAJOR(ph->version) >= 0x3 &&
 	    SUPPORTS_EXTENDED_NAMES(flags)) {
 		ph->hops->extended_name_get(ph, POWER_DOMAIN_NAME_GET,
-					    domain, NULL, dom_info->name,
+					    domain, NULL, dom_info->info.name,
 					    SCMI_MAX_STR_SIZE);
 	}
 
@@ -199,23 +199,22 @@ static int scmi_power_num_domains_get(const struct scmi_protocol_handle *ph)
 	return pi->num_domains;
 }
 
-static const char *
-scmi_power_name_get(const struct scmi_protocol_handle *ph,
-		    u32 domain)
+static const struct scmi_power_domain_info *
+scmi_power_info_get(const struct scmi_protocol_handle *ph, u32 domain)
 {
 	struct scmi_power_info *pi = ph->get_priv(ph);
 	struct power_dom_info *dom;
 
 	if (domain >= pi->num_domains)
-		return "unknown";
+		return NULL;
 
 	dom = pi->dom_info + domain;
-	return dom->name;
+	return &dom->info;
 }
 
 static const struct scmi_power_proto_ops power_proto_ops = {
 	.num_domains_get = scmi_power_num_domains_get,
-	.name_get = scmi_power_name_get,
+	.info_get = scmi_power_info_get,
 	.state_set = scmi_power_state_set,
 	.state_get = scmi_power_state_get,
 };
diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 3d73aef21d2f9942..965592e828741b11 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -76,8 +76,15 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 		return -ENOMEM;
 
 	for (i = 0; i < num_domains; i++, scmi_pd++) {
+		const struct scmi_power_domain_info *info;
 		u32 state;
 
+		info = power_ops->info_get(ph, i);
+		if (!info) {
+			dev_warn(dev, "failed to get info for domain %d\n", i);
+			continue;
+		}
+
 		if (power_ops->state_get(ph, i, &state)) {
 			dev_warn(dev, "failed to get state for domain %d\n", i);
 			continue;
@@ -93,7 +100,7 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 		scmi_pd->domain = i;
 		scmi_pd->ph = ph;
-		scmi_pd->name = power_ops->name_get(ph, i);
+		scmi_pd->name = info->name;
 		scmi_pd->genpd.name = scmi_pd->name;
 		scmi_pd->genpd.power_off = scmi_pd_power_off;
 		scmi_pd->genpd.power_on = scmi_pd_power_on;
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 5ab73b1ab9aa4fa8..1c17515ba45d1fd4 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -191,19 +191,23 @@ struct scmi_perf_proto_ops {
 	enum scmi_power_scale (*power_scale_get)(const struct scmi_protocol_handle *ph);
 };
 
+struct scmi_power_domain_info {
+	char name[SCMI_MAX_STR_SIZE];
+};
+
 /**
  * struct scmi_power_proto_ops - represents the various operations provided
  *	by SCMI Power Protocol
  *
  * @num_domains_get: get the count of power domains provided by SCMI
- * @name_get: gets the name of a power domain
+ * @info_get: gets the information of the specified power domain
  * @state_set: sets the power state of a power domain
  * @state_get: gets the power state of a power domain
  */
 struct scmi_power_proto_ops {
 	int (*num_domains_get)(const struct scmi_protocol_handle *ph);
-	const char *(*name_get)(const struct scmi_protocol_handle *ph,
-				u32 domain);
+	const struct scmi_power_domain_info __must_check *(*info_get)
+		(const struct scmi_protocol_handle *ph, u32 domain);
 #define SCMI_POWER_STATE_TYPE_SHIFT	30
 #define SCMI_POWER_STATE_ID_MASK	(BIT(28) - 1)
 #define SCMI_POWER_STATE_PARAM(type, id) \
-- 
2.43.0


