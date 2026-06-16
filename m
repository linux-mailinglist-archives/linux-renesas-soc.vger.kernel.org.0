Return-Path: <linux-renesas-soc+bounces-34065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eOD/AT4pMWq/cwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:45:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D218468E6A2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 12:45:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Nfhx4pw/";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34065-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4E7A2300B595
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Jun 2026 10:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0B34367B71;
	Tue, 16 Jun 2026 10:45:12 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A442B728
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 10:45:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781606712; cv=none; b=a61DWuKTwRH8tvVpz1CTcjIyocUUIO3/KoTS/E/yaHUd/SmmawixTWPsOY7DebxvTn/7Y2czR8vyxsUBViEzMgn0ZY0YX3X9xXNVsXrYJ0xqGddIrTRM1ZM/Utf5wPmAJHqEI0YztWyf6fQscOGC7KDHqKB1TFlKunUayH51si8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781606712; c=relaxed/simple;
	bh=ObB5pd9eVglVgEzRRRXVeD0FjPtj6fs5IOlEwsx8j/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csDzha8OoIP5kTn/4W7PozFUOkh/8iAsBchFmrNmexV6a1N9/f7RdXTAqpDFneigo4RNNzUp24vwTLWmBSOXKvj76zlYFf/JaXpso9QkU+q+tjy3vBnUxjjXtbMCnzDSQc4bs2cew+XTBeF0eAQHmQBOPAMzptqvaSJLSt5/DYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nfhx4pw/; arc=none smtp.client-ip=209.85.128.48
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b64c8311so43452965e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jun 2026 03:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781606708; x=1782211508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXd52OLhCO17yWN40JHTNc2w9aHcYcGnd5tHs9CRbXY=;
        b=Nfhx4pw/1T5Om+OS+VTjspw03YUWD+8SF0Q/weLxN0I5+VwjQTb1a8qCYgxeOvLaCV
         vTHy+qLgpPJOGhJE7hXLlMibe2kc9JEz2p32mgAT6Py3f2g5G8I2+INyaBbTHEvpWGVs
         7nmiWfeXC288x4N3WfPmW7Ccfdd6wE96imi5oSlcZu8VgKLh3e9S2ezG1Y5W2uosm6Lh
         /I4Nu6/t4UOwM2A31WAmRLcJ/TJ1mAP0DLXvTR+LPzxZDl3czudq7cbwYUg6U7QpKfPd
         l0sXEJbIIc6muvP9D4ps0lm9110aeBoHRgsJyT0g9pAtRmSQFBtpSsCaePw/82vuMXDN
         E8JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781606708; x=1782211508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MXd52OLhCO17yWN40JHTNc2w9aHcYcGnd5tHs9CRbXY=;
        b=Fb6F62Ac2buuHslXjE3C8+S3xLwEYkVL/InFg8+hnn8D/EJ+e8ziJfZpbJsS4KE9I/
         sjdZVrHVU01wUrlPz1RQ0ifBw7xfVCuf7nB5GYyyZRZRMOQQOpieVSl9xxUNRGEvJC7D
         rOUKQQcAnC5qMPd91um+7VGCriG/FOkSsR8jphG1Ymk44WjUPAssiD73YtXC5cCyZ60h
         KEhyo7t5sNgS+MZHmx50msffhapzxcV6jwpGz12k31hOAi68SOMDp5izLKHZfV7hmqql
         IuND7JKtwtJolFP/U1LVYcelL3GR25cArbAu4iLGhm2Yd0oO2PhZ+04YpT560fqIjWvi
         HNtA==
X-Forwarded-Encrypted: i=1; AFNElJ+RO1y/GX9j1AdKTiebvlPc1yFaCLMob3bQlY+n1p2iMQqm2gRuV2oEMPHSsmpFx5ww3/1y+Df7bhqQ7R3bEUMiOg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1mg1Xw502wOFzwJyNEHoIYCM/MrvA/Kv2jg8Jyxcwmd/uxDHi
	woP6K0Ur46lSRBepAjx9tVS1JeVjLtM9TdEmKiyWY27R++OYNdf3Mt1N
X-Gm-Gg: Acq92OH4kq1qQlrSYkBADtGjmzGZR6CS+D7n0lbUow9cFDPcAsjUW/N66jrOwOlwvtc
	gagqmCXWSP6PjqDI3v7/HZYZu1EG/bqab7kPhh7n/qZmMaAVD1YaJ/Ji+++7zD+a5AIzji+wdGY
	ftlkC+R2u/RbWv309b8qD5+PuOq8BN3nRfv83HGLKCWEB16k3EJrS69nb0R5+uDPjFVK2O7Gpde
	QPa6GHLT9gFBQ3C5IyalHWH7bDOzu9lxOwwWK0LC02FRbHnUUxzRB3GKuCr9UMsdH+MM9bIQI5I
	/9zh+41kV3vR71YGN/tZVoAtcNo87vd2BlKZkRTr3OwBfNLXZ+n5DlTfWa6/BqXhXyAX0XN7jwP
	JGSCbBJkzFQhMs8mlCEZu9pjs+eh4adI2XFngKwCI1m2x0PKnZvy9J+USVdLsGEYPXLCWz8CaEo
	SXZQovwC0zb05h1BFZvfCk3Kfrr2RAd7bOirYFsWya2wRYThklC0xRSvcPmHI=
X-Received: by 2002:a05:600c:628f:b0:490:bd66:e522 with SMTP id 5b1f17b1804b1-4922ffb7667mr44341925e9.29.1781606707496;
        Tue, 16 Jun 2026 03:45:07 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:7499:34c3:598b:e20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm82458485e9.5.2026.06.16.03.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 03:45:07 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 05/10] reset: rzg2l-usbphy-ctrl: Add RZ/G3L support
Date: Tue, 16 Jun 2026 11:44:47 +0100
Message-ID: <20260616104459.410743-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
References: <20260616104459.410743-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34065-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:p.zabel@pengutronix.de,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:biju.das.jz@bp.renesas.com,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[pengutronix.de,glider.be,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,renesas.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D218468E6A2

From: Biju Das <biju.das.jz@bp.renesas.com>

Add the renesas,r9a08g046-usbphy-ctrl compatible string to the OF match
table for the RZ/G3L (r9a08g046) SoC, using a dedicated rzg3l_info
struct with pwr_rdy set, similar to RZ/G3S. The RZ/G3L SoC has 2 OTG
controllers compared to one on RZ/G3S, so it uses a separate
rzg3l-usb-vbus-regulator driver to handle the additional VBUSEN control
for port 2.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 1c4c8aae0e80..734255258b69 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -120,9 +120,15 @@ static const struct rzg2l_usbphy_ctrl_info rzg3s_info = {
 	.pwrrdy = true,
 };
 
+static const struct rzg2l_usbphy_ctrl_info rzg3l_info = {
+	.regulator_driver_name = "rzg3l-usb-vbus-regulator",
+	.pwrrdy = true,
+};
+
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl", .data = &rzg2l_info },
 	{ .compatible = "renesas,r9a08g045-usbphy-ctrl", .data = &rzg3s_info },
+	{ .compatible = "renesas,r9a08g046-usbphy-ctrl", .data = &rzg3l_info },
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
-- 
2.43.0


