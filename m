Return-Path: <linux-renesas-soc+bounces-30279-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iArZJeY2xGkAxQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30279-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:30 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5008732B326
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 20:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4B1330B1F6B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 19:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6BDF3E1CF0;
	Wed, 25 Mar 2026 19:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TpiqZXBZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F5E53CF045
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 19:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774466703; cv=none; b=CNB+3kh/fsTVZV8+th4OwtVs1jGPNkqmlLxzsf0AiNLwWfkKD89vJfA4A8x67Rf1Vb6q77ouQKij87Gl5CqJ6MDDkTD0UUwcK3TAk1KOV8C3Nl/vJppJ4lPWMbRtoa9lgztRtjc2jaFAUXGE70C2PMoIiZASJ7lWmyuqeVLq0+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774466703; c=relaxed/simple;
	bh=L9pPjTfCwS4VXxN4s2LgusYp6krYScu9ZQkXUDMkk1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e9bCkeUTDwygPe5J0+RuLSsBQl6wSgPiXPoRkWj9TPDxWPXN96RvtFTcU7jcpomcwkf1E/DisX0tSS2fZ12C+NLTlZoSvXHtwH1eWzObqnntlnswCI4PwFFyKBImyQOXoGwTly/zc/TMuKc71IdYSa6PXDj5phMhkz15pr+iSwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TpiqZXBZ; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-43b4f48c47cso141746f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 12:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774466700; x=1775071500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqVycoY+zBPXuLapcLYV9KCIArn7CTAnQNJ+GY59juM=;
        b=TpiqZXBZiTNe0QjgMiA79DOU1b3Cpxn7eLnne5hP0SvtJiQWDhv8lnsL1jikMC4sFQ
         P0+paLGnemVBUEzAWtd80gcyZ3zd2VBhoYP+p+zrpzdq+xScTNA2fJ1x0sLtvvzJesNa
         gOSXuxRbOrsZyO12acP0qVy72RmrhvyUQC8Ot3tp3Sj8Iu+SUjtjl1PmHX6Z+9cEWFPb
         E9fjZje2qy0NGa1xoq1ELnXlFBLirZEUiDsd0gXhY4vSnK80FE95T/uG+2/1d8X0Gqao
         wi0NMdUkn16r4FLje0J/drkVf/n6lbchnuWW7BV7N8vQv5UVPkmys0V7JM+JpxBFJZuq
         17jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774466700; x=1775071500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FqVycoY+zBPXuLapcLYV9KCIArn7CTAnQNJ+GY59juM=;
        b=U8E2Y45S6zEhXYiKpqie0slGJOLsKmkHIVVnCk/TCIPQK2KaP0gMN1dlB0+mkcwuNB
         +7h+5kUNNF0HEtygFEpuv6dsQkXj+tS+FmI2FIvXx/lkTKu/uDqFoR84SEbG44U+Z4zp
         /ux5yw1VweYy5J7v+JzSDUCIemwxT0imkjHB1j0OMyRjIc6bNFkJ8wajTnYrnNoGEhRy
         CgL0+qpwZHMGm9AgR7FTNo0j1itX02UqWH7TQcEApOjGElRabkP/+DWjVEredXY03hpl
         eOwvNedGQVVcwFS/V5oKbhKtjdmeBkyu2dQmZ/NTqPqiaX53daj4LezZXQZ63BYf+WQA
         P+Ig==
X-Forwarded-Encrypted: i=1; AJvYcCVmnSVMvpUHFyXeHlyzENBrg9b0Vn79NdfgsQjUcSKoZk8EGVKFkgYsnBqI86ifbu/08/Dt+7NVRLvnIgrf/F7Gfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+BtTBJfdW2U36qoOjjOZLdiaknB+EGgoUEDu9JIeusXR6TQnV
	RG/ry9dC+pBaoaA2HSOUUAAETMvyyLz0po27rYZBZXodyyJyLeSoNp1N
X-Gm-Gg: ATEYQzxzsEUhH62Kw7Kr5o28B2XRa89d636LDdAUfdHQw0J9f0vAELzLn914KR3ORoC
	/i+tIJq+7L1ZJUTESJbXhvAbEClp6KlyxbMqLhNzfvQGO3sKlmvJZoRvEnEfRtnrNmzkKiI5MUe
	SffsB+K4IUVHlY+IV9sFVEkJitJx/8QHxTUATqnbx4HgLhPab2xGrFOOlaeR1bA8VUQlCRFgLcO
	3htCH3esgi+3Pv2Z2Cl1wnHIlN9TPQQHHfyRHkOJARVE4KTwgi5ABuy1/G3Soytpdiun/DTNZAb
	UGVXRMiZjbkFzYbhFVaul7sIxdmwvYTsyhZ4mEoCfVolgoqR/Tlv3Pd/zmDvi7/zrfruNhuhfV0
	fP3BwGJgetccls8N+KkWMLZRghU2lbgDqRZPxTz4Pi1GW/idxhtHcCrqsoGuj/AShpncgc48Z9W
	N7vvi1PlcX+qZbcS76ebgxbr5FxLlhDCyNWno8Zkb1rn0z1IcY
X-Received: by 2002:a05:600c:458e:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-48715fe28f4mr62122185e9.13.1774466700512;
        Wed, 25 Mar 2026 12:25:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a758:8a01:8138:17e4:88b1:468c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b9192e533sm2464485f8f.2.2026.03.25.12.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 12:25:00 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v7 07/16] irqchip/renesas-rzg2l: Split set_type handler into separate IRQ and TINT functions
Date: Wed, 25 Mar 2026 19:24:22 +0000
Message-ID: <20260325192451.172562-8-biju.das.jz@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30279-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 5008732B326
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Biju Das <biju.das.jz@bp.renesas.com>

The single rzg2l_irqc_set_type() handler used hw_irq range checks to
dispatch to either rzg2l_irq_set_type() or rzg2l_tint_set_edge(). Split
this into two dedicated handlers, rzg2l_irqc_irq_set_type() and
rzg2l_irqc_tint_set_type(), each calling only their respective type
configuration function without runtime conditionals.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v6->v7:
 * No change.
v5->v6:
 * No change.
v5:
 * New patch.
---
 drivers/irqchip/irq-renesas-rzg2l.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
index 664599acbeb6..b3457a419bab 100644
--- a/drivers/irqchip/irq-renesas-rzg2l.c
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -393,15 +393,22 @@ static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
 	return 0;
 }
 
-static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
+static int rzg2l_irqc_irq_set_type(struct irq_data *d, unsigned int type)
 {
-	unsigned int hw_irq = irqd_to_hwirq(d);
-	int ret = -EINVAL;
+	int ret;
+
+	ret = rzg2l_irq_set_type(d, type);
+	if (ret)
+		return ret;
+
+	return irq_chip_set_type_parent(d, IRQ_TYPE_LEVEL_HIGH);
+}
+
+static int rzg2l_irqc_tint_set_type(struct irq_data *d, unsigned int type)
+{
+	int ret;
 
-	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
-		ret = rzg2l_irq_set_type(d, type);
-	else if (hw_irq >= IRQC_TINT_START && hw_irq < IRQC_NUM_IRQ)
-		ret = rzg2l_tint_set_edge(d, type);
+	ret = rzg2l_tint_set_edge(d, type);
 	if (ret)
 		return ret;
 
@@ -454,7 +461,7 @@ static const struct irq_chip rzg2l_irqc_irq_chip = {
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-	.irq_set_type		= rzg2l_irqc_set_type,
+	.irq_set_type		= rzg2l_irqc_irq_set_type,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
 				  IRQCHIP_SET_TYPE_MASKED |
@@ -471,7 +478,7 @@ static const struct irq_chip rzg2l_irqc_tint_chip = {
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-	.irq_set_type		= rzg2l_irqc_set_type,
+	.irq_set_type		= rzg2l_irqc_tint_set_type,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
 				  IRQCHIP_SET_TYPE_MASKED |
@@ -488,7 +495,7 @@ static const struct irq_chip rzfive_irqc_irq_chip = {
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-	.irq_set_type		= rzg2l_irqc_set_type,
+	.irq_set_type		= rzg2l_irqc_irq_set_type,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
 				  IRQCHIP_SET_TYPE_MASKED |
@@ -505,7 +512,7 @@ static const struct irq_chip rzfive_irqc_tint_chip = {
 	.irq_get_irqchip_state	= irq_chip_get_parent_state,
 	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
-	.irq_set_type		= rzg2l_irqc_set_type,
+	.irq_set_type		= rzg2l_irqc_tint_set_type,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
 				  IRQCHIP_SET_TYPE_MASKED |
-- 
2.43.0


