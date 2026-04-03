Return-Path: <linux-renesas-soc+bounces-30824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BFpIVKAz2mvwgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:54:42 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D834939261B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:54:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 46E6D30BC681
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 08:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3C037EFF4;
	Fri,  3 Apr 2026 08:48:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25B92D94BA;
	Fri,  3 Apr 2026 08:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206115; cv=none; b=tMeQv9CZ4bNBvjxJ+pcr0lKEuVOyB+vt4fUpsLbm97AdbUMyyjCSpm/MQsuXffZxDbwRI1WbZVPFbIZFfJB2Cvofawq4JIRZL026bmPOIk8mcs9d6/k0/+v2aVSiWRKgA1yYGiPagY5XvR/A35SfyR8A1ZC2U3ZULf2PgsRTAfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206115; c=relaxed/simple;
	bh=fJWeq4JGBPXVNBW/iUBRI9wUh3kZ6DeQJIi+JFzRxlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MO7IrV64xGyZfcxZP2XsAABgE9HLlTklevp7VbaY8IUBzHiO6z1m69CT2z77rcUqeamcRhMszUTfZoX6K/XEzXESYOwkHPuX26cJYIvbTkzELBHoUGrFJaxcsyDJn9gn2cblXTPWbkGf1Iq5u+MrHxGy2QfVzmTDPksKMu+V52A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17CF9C2BCB0;
	Fri,  3 Apr 2026 08:48:33 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] irqchip/renesas-rzv2h: Kill icu_err string
Date: Fri,  3 Apr 2026 10:48:23 +0200
Message-ID: <c7472bec20dea2c4d63e390e8e293b7d7003ef39.1775205874.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1775205874.git.geert+renesas@glider.be>
References: <cover.1775205874.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30824-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,glider.be:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D834939261B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace the string variable icu_err by its expanded value where needed,
to improve readability.

This reduces generated code size by 16 bytes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index d075196bdc741c7f..1633b118731f925f 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -755,7 +755,6 @@ static int rzv2h_icu_setup_irqs(struct platform_device *pdev, struct irq_domain
 {
 	const struct rzv2h_hw_info *hw_info = rzv2h_icu_data->info;
 	bool irq_inject = IS_ENABLED(CONFIG_GENERIC_IRQ_INJECTION);
-	static const char *icu_err = "icu-error-ca55";
 	void __iomem *base = rzv2h_icu_data->base;
 	struct device *dev = &pdev->dev;
 	struct irq_fwspec fwspec;
@@ -800,14 +799,13 @@ static int rzv2h_icu_setup_irqs(struct platform_device *pdev, struct irq_domain
 	fwspec.param[1] = IRQ_TYPE_LEVEL_HIGH;
 
 	virq = irq_create_fwspec_mapping(&fwspec);
-	if (!virq) {
-		return dev_err_probe(dev, -EINVAL, "failed to create IRQ mapping for %s\n",
-				     icu_err);
-	}
+	if (!virq)
+		return dev_err_probe(dev, -EINVAL,
+				     "failed to create icu-error-ca55 IRQ mapping\n");
 
 	ret = devm_request_irq(dev, virq, rzv2h_icu_error_irq, 0, dev_name(dev), rzv2h_icu_data);
 	if (ret)
-		return dev_err_probe(dev, ret, "Failed to request %s IRQ\n", icu_err);
+		return dev_err_probe(dev, ret, "Failed to request icu-error-ca55 IRQ\n");
 
 	return 0;
 }
-- 
2.43.0


