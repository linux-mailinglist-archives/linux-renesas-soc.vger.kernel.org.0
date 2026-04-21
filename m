Return-Path: <linux-renesas-soc+bounces-31470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIiRK8W+52l4AQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31470-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:15:33 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 517B543E82A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 20:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8C185304FEC2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2026 18:12:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A729B3BED02;
	Tue, 21 Apr 2026 18:12:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6AE3A9DAB;
	Tue, 21 Apr 2026 18:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795158; cv=none; b=OiSArZ4cCcs+1dDkDMzD/qexnM56f+vSn4Pbwy6zrGKlLB2BL3cSNThlgn7WZefqP5Uod+jQup4yn6EAVRkQMxjALCb3RxsXW7EMKXL/w0pNcsC1d5dW6BH4tIYMuENYvFdILFlgtBC6/hRIRlSl7cHmRFrqvYf+CPvZudWrkp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795158; c=relaxed/simple;
	bh=Otww8j8idL7DQsJ/09F2hxIYpv1fu0aeOBNW9omx36U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W0VPQ+Sy/Hud0gNh/OtY/d+GBvxZrjmlehlJIMyDJ3Ql8bPTQ+TyR27jJiURbnzSyoHuD1tyFsTcL6PFBKGe0JQB4nKIqYfrnsfHK1+NDTRgzwkfD7bQLZ5ND65rbLV85nj+rQADqUpxstfP3ei3KzF5//5ygJSCtYLXaIaGKmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7D0C2BCB5;
	Tue, 21 Apr 2026 18:12:33 +0000 (UTC)
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
Subject: [PATCH/RFC 08/14] reset: Add reset_controller_get_provider()
Date: Tue, 21 Apr 2026 20:11:41 +0200
Message-ID: <87edde434e1760bbe9e2741856724301d02a4fc8.1776793163.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31470-lists,linux-renesas-soc=lfdr.de,renesas];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,gmail.com,baylibre.com,pengutronix.de,broadcom.com,sang-engineering.com,mailbox.org,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:mid,glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 517B543E82A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


