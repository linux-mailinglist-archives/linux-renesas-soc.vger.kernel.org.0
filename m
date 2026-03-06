Return-Path: <linux-renesas-soc+bounces-28944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOmFACbFqmnVWwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:14:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 754EC220537
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Mar 2026 13:14:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 13ED83069E69
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Mar 2026 12:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911B438E5EE;
	Fri,  6 Mar 2026 12:13:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7519E225417;
	Fri,  6 Mar 2026 12:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772799224; cv=none; b=EoQ5s9X/hnTYf/fSk5agE9sOe2GcNcnzeDzwdj4kVxHttQh8RUETf150bNQba8LdwPIgC7kE8gTKlrr1uyZ3WOuW8SfAA/gCMosQzpC+gAw8JP4lVmWEunJWnjkU08T0NTX34g98t0ga03e1PgOsrYcatgt0IhTfzNrrdtNu9Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772799224; c=relaxed/simple;
	bh=iw+E3/j8x5Vhs1vzyIvjpZbYjczzSMklcBlspOG5m9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B+G2YaHkDx6s363FZmWGjbZyfYtNAX2jiIV1v6wblFq7WH2gaR6V8AMqxWNM9sA2RmuIQOjdaQa0gWRncgM9JYh6NelsKdCgAU6oJhaNDWQxxw7F+xPmjCz3ukkXLjQkNELhyGpmfmZF4c1EAssJfbv9exL3hcIF2A6EYSchA1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BC0EC4CEF7;
	Fri,  6 Mar 2026 12:13:42 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] irqchip/gic-v3: Print a warning for out-of-range interrupt numbers
Date: Fri,  6 Mar 2026 13:13:32 +0100
Message-ID: <ce695ea46decc816974179314a86f2b9b5cad6a9.1772799134.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 754EC220537
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28944-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,glider.be:mid,glider.be:email]
X-Rspamd-Action: no action

gic_irq_domain_translate() does not check if an interrupt number lies
within the valid range of the specified interrupt type.  Add these
checks, and print a warning if the interrupt number is out of range.

This can help flagging incorrectly described Extended SPI and PPI
interrupts in DT.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This would have prevented the issue fixed by "[PATCH] arm64: dts:
renesas: r8a78000: Fix out-of-range SPI interrupt numbers"[1].

v2:
  - Fix off-by-one error in PPI range check.

[1] https://lore.kernel.org/1f9dd274720ea1b66617a5dd84f76c3efc829dc8.1772641415.git.geert+renesas@glider.be/
---
 drivers/irqchip/irq-gic-v3.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 20f13b686ab22faf..9e97505d4b767043 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1603,15 +1603,27 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 
 		switch (fwspec->param[0]) {
 		case 0:			/* SPI */
+			if (fwspec->param[1] > 987)
+				pr_warn_once("SPI %u out of range (use ESPI?)\n",
+					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + 32;
 			break;
 		case 1:			/* PPI */
+			if (fwspec->param[1] > 15)
+				pr_warn_once("PPI %u out of range (use EPPI?)\n",
+					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + 16;
 			break;
 		case 2:			/* ESPI */
+			if (fwspec->param[1] > 1023)
+				pr_warn_once("ESPI %u out of range\n",
+					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + ESPI_BASE_INTID;
 			break;
 		case 3:			/* EPPI */
+			if (fwspec->param[1] > 63)
+				pr_warn_once("EPPI %u out of range\n",
+					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + EPPI_BASE_INTID;
 			break;
 		case GIC_IRQ_TYPE_LPI:	/* LPI */
-- 
2.43.0


