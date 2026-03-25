Return-Path: <linux-renesas-soc+bounces-30283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGfqBTg3xGnkxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30283-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:27:52 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1442532B3D7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:27:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E400304ECA5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:25:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A4D3FCB23;
	Wed, 25 Mar 2026 19:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOHJn4E9"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBD93F99E4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466707; cv=none; b=laev+kAlohwuyvchBJWUwyj/zzhgK3Yd2nEOR5q9salOsEV5keK36ZJM2cQ4oLFsusMgz7obOqxo/LPYG/uPSTo9WnsFMo42m4GO1gspPlVet2W31iykL/OC1xSKRERq5S5q+8cSisoX9ilWl6qIeqnVLRiVoEzla7gGrbDd/Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466707; c=relaxed/simple;
	bh=AExx3cPZ2WpW51Q/Hvkq3qyUDlCmcz3A3Q0I4Thk5xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sr/hUR0n3zG1SKRDhXARmnfo+LpNrR8T2dJBrk31tv7w+dxPByXHcJ9Dm6bzj82eP6Kt0+C46y6rdxK3zWjkR62Shj7k7cEeaQzPhfvz+QoX3txRUexBVWxmSmZIuBqjEH0jzkRdNk+uXYrFADaSk4veaHOBAFpyW2KvPpuipxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOHJn4E9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b48ac2727so103760f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466704; x=1775071504; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/geNOpq5bJDWDnHOdsesADtU5deddp2dzAMegXiLC4=;
        b=bOHJn4E93OMhyKLIbLczV7ztmKgkJhmeM2k404O6Sb7pqMeXpy5Dg9Vv5sriGZaX1Z
         57m3fn5jcfB4kmOCYVqveZdUgULgl9H+u5pXGqoUbQx92Jp5GpzxoRtKOocawAGEKfOx
         7IThs1baSvEca87PjPnrCOv9Z+r9I2cspwgro2aqv8QFfJWaIMcz0MksU4aXlxzbjHbK
         spjF7j4H6DAYNVyoS//f07b6LI15XkkBu8ntJxQNfVozAntD8YW/sS5TYuUH8vpSjUs4
         cSK2WfQVfUpAXW7F74UxJGYuUNPfB2ZTwnZc3u6stLkvuIl7eTs3VuPmvKeEmQ93cLcn
         rV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466704; x=1775071504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H/geNOpq5bJDWDnHOdsesADtU5deddp2dzAMegXiLC4=;
        b=nY2r7fb+S42OgWoiWoB4XbILQv3I1DGWaHkGugasG7BdjYaL6V4S/kGfrx5qzpit+/
         HJYwIkHULw8TorkHWUJG8QXDjt1HOnVJrXwi1lw2FHEbwoASQ9E0XUzwUJI0jxxaIF38
         9yhcextRRfVFMGe4Kpa6nbgfP0clAGaxbxKTQXqRUQJ5eSKumcGBO421S+k/9Rxp1mKq
         mbpoMDTYjuG0tErZ2Zpf/TfPspAoit7BXuKC2CUuiIHD4xlLRkfRHGZ4UVTmHkf7ubLW
         pg/SHYt9X9AXTnE9P1HAgPYCd+MpF1mHMogHlY9Ge+Z67HJfzAjw2UQjpT3Pz9/5bddb
         2jyg==
X-Forwarded-Encrypted: i=1; AJvYcCUQbl6PeaQri2TUyiFIR67U7D4hioTmJA2DF3Ik6JA11zaqAFWLbFnfOYM8WpaomiZAbvbeOrxQtBueZNRXms5KXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzjhLlQNQeV5NRL/IvZ8uaR1yML1C2y68ZWlFv0FrMVgTWWnDvf
	zOWBpQ3FPuQpT0C7vqqNXq/nI+JP+FhO551/KeRneEHEZQtLZNBP20Hx
X-Gm-Gg: ATEYQzywo8En55hSaGcBFmQmnKoK5J/fCLld1wT9GRbg+/TmpiQnaan7fSpKOh2LcEY
	adTud8nxAZdY/8H4zF78A0iivB032eCVUpXHhjVwGvN1TNMVe3ou4R8Dz/z4pEBjnvvIFDZuc3Q
	4dz4sajv0W2SwpKQUZuPXL2dBep7HzvGGmmMQMkE989RgFdYfdHen2QJtLoeoFguVLuVeUS1jiY
	hpIYnZRUb8rp0OT9WasRs7PDlLrxvO/tff80OskOdUJpg3S5LuJ/QpiepVg6zEOY1xMgs33EPYh
	+Loq5ZytXmYUPnVRoDKGRgu6ttszTLk9Eg+gictaQtcuPfiHhz+1YQ4W+pfoX6469WPiEiK0Xw1
	/7VQFP9n5NA5QX+d87BwwS9h8vB1dMgQUGlj/ukwdQcN+6lc7rhYQlefVQedcmAae2YrvlrpDjx
	AXvE5aLDTLjuL8C8ftZ5g4M26NTlycdc3070R9UnQAtNX5RAfp
X-Received: by 2002:a05:6000:2584:b0:43b:4aba:8f35 with SMTP id ffacd0b85a97d-43b889af2f5mr7445862f8f.12.1774466703993;
        Wed, 25 Mar 2026 12:25:03 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:25:03 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 11/16] irqchip/renesas-rzg2l: Dynamically allocate fwspec array
Date: Wed, 25 Mar 2026 19:24:26 +0000
Message-ID: <20260325192451.172562-12-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
References: <20260325192451.172562-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30283-lists,linux-renesas-soc=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 1442532B3D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The total number of interrupts in RZ/G2L and RZ/G3L SoC are different. The
RZ/G3L has 16 external interrupts whereas RZ/G2L has only 8 external
interrupts. Dynamically allocate fwspec memory instead of static
allocation to support both SoCs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * No change.
v4->v5:
 * No change.
v3->v4:
 * Updated commit header
 * Replaced IRQs->interrupts in commit description
 * Fixed the typo Dynamicaly->Dynamically
v2->v3:
 * No change
v1->v2:
 * No change
---
 drivers/irqchip/irq-renesas-rzg2l.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 64cfd9955d8f..9fc90f894630 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -81,7 +81,7 @@ static struct rzg2l_irqc_priv {
 	void __iomem			*base;
 	const struct irq_chip		*irq_chip;
 	const struct irq_chip		*tint_chip;
-	struct irq_fwspec		fwspec[IRQC_NUM_IRQ];
+	struct irq_fwspec		*fwspec;
 	raw_spinlock_t			lock;
 	struct rzg2l_irqc_reg_cache	cache;
 } *rzg2l_irqc_data;
@@ -632,6 +632,11 @@ static int rzg2l_irqc_common_probe(struct platform_device *pdev, struct device_n
 	if (IS_ERR(rzg2l_irqc_data->base))
 		return PTR_ERR(rzg2l_irqc_data->base);
 
+	rzg2l_irqc_data->fwspec = devm_kcalloc(&pdev->dev, IRQC_NUM_IRQ,
+					       sizeof(*rzg2l_irqc_data->fwspec), GFP_KERNEL);
+	if (!rzg2l_irqc_data->fwspec)
+		return -ENOMEM;
+
 	ret = rzg2l_irqc_parse_interrupts(rzg2l_irqc_data, node);
 	if (ret)
 		return dev_err_probe(dev, ret, "cannot parse interrupts: %d\n", ret);
-- 
2.43.0


