Return-Path: <linux-renesas-soc+bounces-32871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sC6PGaGzDWo62AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32871-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:14:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 883F958E987
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:14:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4A862303B39F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 13:12:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E2E3E275C;
	Wed, 20 May 2026 13:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uzrz3jMy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1312D36C5B2;
	Wed, 20 May 2026 13:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282742; cv=none; b=Jrgc/luqkLrZZSr3Blg+Gm/0pC9JQxaEYQK8EujAKfla21qVGP2ylZ28P5vIwAp/UMNFw+dVtwhQHcweVtzChpAQdLX5RYxzK1L8c2TqNIC6ZsM/jHHtRNwDRqpS6Grz0ou/8cMciV2a99tvW7AbLT0kn1TLE1onEgASK+I4F3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282742; c=relaxed/simple;
	bh=isNqYpEPQPwp5q3jaJBWsp35bUizqljfK/dcy3HWk6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVR4Gey48REC1tGypKT9CMamWoi1TIoso6itsY2G2KuRjH3ofyCPDhBjOS/MHqg8PfHzwiMtsVF2/uyysq1IqQqD4fatV/W4zYEMgyCU1TzOSYLPnO1FcoYz2sCQWO5ZiREauCuQGm3nvFyNmX3eQxIZwq8IXHToZnR6as6xXoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uzrz3jMy; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BE51F00894;
	Wed, 20 May 2026 13:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779282734;
	bh=2ZkHMQTXgNWvGQhiKoyxL7YDjlhPRCsA5ABjKF5RpUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Uzrz3jMyhoLYUkh6vDWeUmT8fmHvs8eqwzzs3UBb1NNNneF2EQbGugQwX4dWTW1gm
	 AwrUYqhjPm6Sv6DZlTDMZSm1u/88hqOoPNyAwvm8k5upUqCDuuUotrr1vdSMFNngJP
	 Bv5ewATfhSd1PKmemS70TaCfHNsEyqOJ+3ao+qg5rVAIcoOd/dS7A53yiMJx0jtqwH
	 olEqpr2eYN8imlV7MXLXUMe4iE4BM9yVwP+cSG0pvd8OgGLkKVYKRpjGb+n6HEjJks
	 uOpjgWEvDNqpmwNOe10hh7DERtkFbMlpWWiC/+WaIBr5WWIvcc7pxcQp1jYcoC6PKz
	 JTRQqeihqMlYQ==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	wsa@sang-engineering.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] i2c: riic: Use the "dev_name:irq_name" format for the interrupt name
Date: Wed, 20 May 2026 16:12:04 +0300
Message-ID: <20260520131206.932050-3-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520131206.932050-1-claudiu.beznea@kernel.org>
References: <20260520131206.932050-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32871-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 883F958E987
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Use the "dev_name:irq_name" format for the interrupt names. This makes it
easier to identify interrupts in systems where multiple devices may request
interrupts with the same name.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

 drivers/i2c/busses/i2c-riic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 68d359ce2e66..57b64d82b681 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -567,13 +567,18 @@ static int riic_i2c_probe(struct platform_device *pdev)
 
 	for (i = 0; i < riic->info->num_irqs; i++) {
 		const struct riic_irq_desc *irq_desc;
+		char *irqname;
 
 		irq_desc = &riic->info->irqs[i];
 		riic->irqs[i] = platform_get_irq(pdev, irq_desc->res_num);
 		if (riic->irqs[i] < 0)
 			return riic->irqs[i];
 
-		ret = devm_request_irq(dev, riic->irqs[i], irq_desc->isr, 0, irq_desc->name, riic);
+		irqname = devm_kasprintf(dev, GFP_KERNEL, "%s:%s", dev_name(dev), irq_desc->name);
+		if (!irqname)
+			return -ENOMEM;
+
+		ret = devm_request_irq(dev, riic->irqs[i], irq_desc->isr, 0, irqname, riic);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to request irq %s\n",
 					     irq_desc->name);
-- 
2.43.0


