Return-Path: <linux-renesas-soc+bounces-33882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p6VHAo2yKmofvQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 15:05:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A726722A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 15:05:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33882-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CBEDB301DCCD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jun 2026 13:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB05D407CF0;
	Thu, 11 Jun 2026 13:02:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4ED3FF1DC;
	Thu, 11 Jun 2026 13:02:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182976; cv=none; b=G9+uhzepcxd4h3dHTJcCVshmyF01dM13+zxVNX9DV+oxuTfAAwsPLIG5MTg8csAdnIKxW2RO7NzsK4nLlYLD8Fm/mLXkuN5iFSJQwWOz20Tii13RVBABTYWOYr3eC3aPjCkIxxoDbYNcxTE/bUAVdyYJc5N8rEvVBdJX7oQklfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182976; c=relaxed/simple;
	bh=MZ14121BhhBK+chB/crNCo/dOLG7ZvEOSQqT3DgJtYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UB2rUAkONxI63D941MnB2AWmByp3JRH/ssZlMXABfmDZcotG2b6Rdi0qYTRv7zvsSbp9e3UW29JhPvqfxgzvtGwdHfdivb3MlBieQ/sufhKf+nSW5aalrW/d3vs1xpwYTIBZQw+HeHgqAfcR2+jOljNQYRGHi5LkBYghdU/xnSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29B871F00899;
	Thu, 11 Jun 2026 13:02:48 +0000 (UTC)
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
Subject: [PATCH/RFC 7/9] pmdomain: arm: scmi: Add clock domain support
Date: Thu, 11 Jun 2026 15:02:11 +0200
Message-ID: <e99b203025504306cd858563d438df32ea47605e.1781171706.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-33882-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,glider.be:mid,glider.be:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,clkspec.np:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4A726722A0

PM domain consumer devices may also part of a clock domain.

Add support for managing power management clocks in a clock domain
through Runtime PM.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pmdomain/arm/Kconfig          |  1 +
 drivers/pmdomain/arm/scmi_pm_domain.c | 81 ++++++++++++++++++++++++++-
 2 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/arm/Kconfig b/drivers/pmdomain/arm/Kconfig
index afed10d382ad7f66..11c4db47c1eadab0 100644
--- a/drivers/pmdomain/arm/Kconfig
+++ b/drivers/pmdomain/arm/Kconfig
@@ -14,6 +14,7 @@ config ARM_SCMI_PERF_DOMAIN
 config ARM_SCMI_POWER_DOMAIN
 	tristate "SCMI power domain driver"
 	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	depends on COMMON_CLK_SCMI || !COMMON_CLK_SCMI
 	default ARM_SCMI_PROTOCOL
 	select PM_GENERIC_DOMAINS if PM
 	help
diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index 8e67f971c707e121..838917d3b236e3aa 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -5,9 +5,12 @@
  * Copyright (C) 2018-2021 ARM Ltd.
  */
 
+#include <linux/clk.h>
+#include <linux/clk/scmi.h>
 #include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/pm_clock.h>
 #include <linux/pm_domain.h>
 #include <linux/scmi_protocol.h>
 
@@ -16,6 +19,7 @@ static const struct scmi_power_proto_ops *power_ops;
 struct scmi_pm_domain {
 	struct generic_pm_domain genpd;
 	const struct scmi_protocol_handle *ph;
+	struct device_node *clock_domain;
 	const char *name;
 	u32 domain;
 };
@@ -39,6 +43,67 @@ static int scmi_pd_power_off(struct generic_pm_domain *domain)
 	return scmi_pd_power(domain, SCMI_POWER_STATE_GENERIC_OFF);
 }
 
+static int scmi_pd_attach_dev(struct generic_pm_domain *domain,
+			      struct device *dev)
+{
+	struct scmi_pm_domain *pd = to_scmi_pd(domain);
+	struct device_node *np = dev->of_node;
+	struct of_phandle_args clkspec;
+	bool once = true;
+	struct clk *clk;
+	int ret;
+
+	for (int i = 0;
+	     !of_parse_phandle_with_args(np, "clocks", "#clock-cells", i, &clkspec);
+	     i++) {
+		if (clkspec.np != pd->clock_domain || clkspec.args_count != 1) {
+			of_node_put(clkspec.np);
+			continue;
+		}
+
+		clk = of_clk_get_from_provider(&clkspec);
+		of_node_put(clkspec.np);
+		if (!clk)
+			continue;
+
+		if (IS_ERR(clk)) {
+			ret = PTR_ERR(clk);
+			clk = NULL;
+			goto fail;
+		}
+
+		if (!scmi_clk_is_pm_clk(clk)) {
+			clk_put(clk);
+			continue;
+		}
+
+		if (once) {
+			once = false;
+			ret = pm_clk_create(dev);
+			if (ret)
+				goto fail;
+		}
+
+		ret = pm_clk_add_clk(dev, clk);
+		if (ret)
+			goto fail;
+	}
+
+	return 0;
+
+fail:
+	pm_clk_destroy(dev);
+	clk_put(clk);
+	return ret;
+}
+
+static void scmi_pd_detach_dev(struct generic_pm_domain *domain,
+			       struct device *dev)
+{
+	if (!pm_clk_no_clocks(dev))
+		pm_clk_destroy(dev);
+}
+
 static int scmi_pm_domain_probe(struct scmi_device *sdev)
 {
 	int num_domains, i, ret;
@@ -48,6 +113,7 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 	struct genpd_onecell_data *scmi_pd_data;
 	struct generic_pm_domain **domains;
 	const struct scmi_handle *handle = sdev->handle;
+	struct device_node *clock_domain;
 	struct scmi_protocol_handle *ph;
 
 	if (!handle)
@@ -75,6 +141,8 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 	if (!domains)
 		return -ENOMEM;
 
+	clock_domain = of_parse_phandle(np, "arm,clock-domain", 0);
+
 	for (i = 0; i < num_domains; i++, scmi_pd++) {
 		const struct scmi_power_domain_info *info;
 		u32 state;
@@ -106,6 +174,12 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 		scmi_pd->genpd.power_on = scmi_pd_power_on;
 		scmi_pd->genpd.flags = GENPD_FLAG_ACTIVE_WAKEUP |
 				       info->genpd_flags;
+		if (clock_domain) {
+			scmi_pd->clock_domain = of_node_get(clock_domain);
+			scmi_pd->genpd.attach_dev = scmi_pd_attach_dev;
+			scmi_pd->genpd.detach_dev = scmi_pd_detach_dev;
+			scmi_pd->genpd.flags |= GENPD_FLAG_PM_CLK;
+		}
 
 		pm_genpd_init(&scmi_pd->genpd, NULL,
 			      state == SCMI_POWER_STATE_GENERIC_OFF);
@@ -113,6 +187,8 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 		domains[i] = &scmi_pd->genpd;
 	}
 
+	of_node_put(clock_domain);
+
 	scmi_pd_data->domains = domains;
 	scmi_pd_data->num_domains = num_domains;
 
@@ -134,8 +210,10 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 
 	return 0;
 err_rm_genpds:
-	for (i = num_domains - 1; i >= 0; i--)
+	for (i = num_domains - 1; i >= 0; i--) {
 		pm_genpd_remove(domains[i]);
+		of_node_put(to_scmi_pd(domains[i])->clock_domain);
+	}
 
 	return ret;
 }
@@ -158,6 +236,7 @@ static void scmi_pm_domain_remove(struct scmi_device *sdev)
 		if (!scmi_pd_data->domains[i])
 			continue;
 		pm_genpd_remove(scmi_pd_data->domains[i]);
+		of_node_put(to_scmi_pd(scmi_pd_data->domains[i])->clock_domain);
 	}
 }
 
-- 
2.43.0


