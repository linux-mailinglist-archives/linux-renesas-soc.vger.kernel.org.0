Return-Path: <linux-renesas-soc+bounces-30822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGOcEhV/z2mvwgYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30822-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:49:25 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E15A739252C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 10:49:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0551E304B2EB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 08:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27093381AF5;
	Fri,  3 Apr 2026 08:48:32 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EF237FF44;
	Fri,  3 Apr 2026 08:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775206112; cv=none; b=oY/Fg40LYhYLSdZcnuwnCAEbVdCMEIFo0s2XQA5HtKK0IQ7X2MBAOZ9ceQ58KFgcHLrksvi4TQlbPAnBUewLzJeNyot6TsIkIO32NAxvWG5sjvRqd09qtw0vVbwiPFUUFBBIanqmCXhkL6GaHQJ49qq8HWMWve/RgFYi/8xbq1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775206112; c=relaxed/simple;
	bh=ZiuLrgKsZYEpfewvxh4CcbmyajviW8yBBvV1yOgUefI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4RLKaoCvc3YNtDQpDss3AeZIHrBaIXtMwpHvFX9boUAy5lkj2GFqYxOQuB+rUaECmPRqNQ+RVBztPHRIjyTxYdf9Og1E+zGY1RsxwtgH7C8QO5H+DYjfczvoXR4lz5YOPYa3ZZYLo9lpxLdElec88m3K19YsmsEDLtYZhmehT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900D4C19424;
	Fri,  3 Apr 2026 08:48:30 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] irqchip/renesas-rzv2h: Kill swint_idx[]
Date: Fri,  3 Apr 2026 10:48:21 +0200
Message-ID: <0f32ba2a4701311710d02ff4fa2fd472b56745c4.1775205874.git.geert+renesas@glider.be>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30822-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[glider.be];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email,glider.be:mid]
X-Rspamd-Queue-Id: E15A739252C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The array swint_idx[] just contains an identity mapping.
Replace it by using the index directly, to simplify the code.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-renesas-rzv2h.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzv2h.c b/drivers/irqchip/irq-renesas-rzv2h.c
index ce790590f7ca9932..6fa8141adcaa59f2 100644
--- a/drivers/irqchip/irq-renesas-rzv2h.c
+++ b/drivers/irqchip/irq-renesas-rzv2h.c
@@ -745,7 +745,7 @@ static irqreturn_t rzv2h_icu_error_irq(int irq, void *data)
 
 static irqreturn_t rzv2h_icu_swint_irq(int irq, void *data)
 {
-	u8 cpu = *(u8 *)data;
+	unsigned int cpu = (uintptr_t)data;
 
 	pr_info("SWINT interrupt for CA55 core %u\n", cpu);
 	return IRQ_HANDLED;
@@ -760,7 +760,6 @@ static int rzv2h_icu_setup_irqs(struct platform_device *pdev, struct irq_domain
 		"int-ca55-2", "int-ca55-3",
 	};
 	static const char *icu_err = "icu-error-ca55";
-	static const u8 swint_idx[] = { 0, 1, 2, 3 };
 	void __iomem *base = rzv2h_icu_data->base;
 	struct device *dev = &pdev->dev;
 	struct irq_fwspec fwspec;
@@ -780,7 +779,7 @@ static int rzv2h_icu_setup_irqs(struct platform_device *pdev, struct irq_domain
 		}
 
 		ret = devm_request_irq(dev, virq, rzv2h_icu_swint_irq, 0, dev_name(dev),
-				       (void *)&swint_idx[i]);
+				       (void *)(uintptr_t)i);
 		if (ret) {
 			return dev_err_probe(dev, ret, "Failed to request %s IRQ\n",
 					     rzv2h_swint_names[i]);
-- 
2.43.0


