Return-Path: <linux-renesas-soc+bounces-34862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id jMYCCU0lTmo2EAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:24:13 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B57377243F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 12:24:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34862-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7D2C305E4DE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 10:18:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7142A3921E9;
	Wed,  8 Jul 2026 10:17:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5099E381AFB;
	Wed,  8 Jul 2026 10:17:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505835; cv=none; b=aHAUeFoeLDnnhHXWRqUsXpXqLXjWEbRGANz27CNpso7OmucrWjkNyuCVRb1vaAxHXeJXTWkfqgNgAiVby+Tsi3uRyNdRxjGhQHic53Ug3wTOHoAWR6Xyj1mDgve55cee0PrgnZgeuswfFQ22TH313mnsRhNU0cAQnHUAIH0qLEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505835; c=relaxed/simple;
	bh=f8r2i9i7CX8Gwc26tYpu7pRUh3hJHo6IjOds+y/riL8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Or8DFre6Q7P7qcg0UmV7ZQjmyNu+qCELDwnks0IT9Ik/VE+5CIwuP3dh8/Ez/YjO7+pJurx/livNw4VNS3UCxE157AftkrPQxVhE8AHBVeK7VGI1P9CZ/sPoKlI0FaDCS3kwD/2uJiRgpDgt3wZE++ZA/QmeVH1UeyE4oWBzwsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2317D1F00A3D;
	Wed,  8 Jul 2026 10:17:08 +0000 (UTC)
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
Subject: [PATCH v2 04/10] reset: Add reset_controller_get_provider()
Date: Wed,  8 Jul 2026 12:16:22 +0200
Message-ID: <c415dc5f468e62cd0e2a6b9639abb92a82c01324.1783505329.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TAGGED_FROM(0.00)[bounces-34862-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS(0.00)[m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:ulfh@kernel.org,m:rafael@kernel.org,m:p.zabel@pengutronix.de,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:vkoul@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:khilman@baylibre.com,m:florian.fainelli@broadcom.com,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,glider.be:from_mime,glider.be:email,glider.be:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B57377243F6

The reset subsystem differs from the clock subsystem in multiple ways:
  1. It does not provide a public way to lookup resets from a reset
     provider (clock has of_clk_get_from_provider()),
  2. The xlate callback does not return a reset object, but merely an
     index, which is converted to a reset object by the reset core.

Hence add a public helper reset_controller_get_provider(), which just
returns the provider, and will be used by the R-Car X5H Module
Controller driver.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.
---
 drivers/reset/core.c             | 11 +++++++++++
 include/linux/reset-controller.h |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09b270..57c427bb33b322e2 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1135,6 +1135,17 @@ __reset_find_rcdev(const struct fwnode_reference_args *args, bool gpio_fallback)
 	return NULL;
 }
 
+struct reset_controller_dev *
+reset_controller_get_provider(struct fwnode_handle *fwnode)
+{
+	struct fwnode_reference_args args = { .fwnode = fwnode };
+
+	guard(mutex)(&reset_list_mutex);
+
+	return __reset_find_rcdev(&args, false);
+}
+EXPORT_SYMBOL_GPL(reset_controller_get_provider);
+
 struct reset_control *
 __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int index,
 			   enum reset_control_flags flags)
diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index 52a5a4e81f184407..0c17a36466115ba6 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -74,6 +74,7 @@ void reset_controller_unregister(struct reset_controller_dev *rcdev);
 struct device;
 int devm_reset_controller_register(struct device *dev,
 				   struct reset_controller_dev *rcdev);
+struct reset_controller_dev *reset_controller_get_provider(struct fwnode_handle *fwnode);
 #else
 static inline int reset_controller_register(struct reset_controller_dev *rcdev)
 {
@@ -89,6 +90,11 @@ static inline int devm_reset_controller_register(struct device *dev,
 {
 	return 0;
 }
+
+static inline struct reset_controller_dev *reset_controller_get_provider(struct fwnode_handle *fwnode)
+{
+	return NULL;
+}
 #endif
 
 #endif
-- 
2.43.0


