Return-Path: <linux-renesas-soc+bounces-32771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wO2sCYI4C2qWEwUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32771-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 18:04:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 301ED5708DC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 18:04:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9A621306891C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 May 2026 15:54:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6128048C3F1;
	Mon, 18 May 2026 15:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3WvuLxM"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0288480DD2
	for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 15:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779119632; cv=none; b=P0Sd2DTnSKzDpGzeeFtOluHQI4oqNKfVswhQ3wXnKFiM5hN8QkXzE1t/9Trz6X52CFjRFSpQPQ6joQYcMg3bFOdG1Cq7tTQFsgQkzk5/Uu4H3s1zOexMskEEq0jUs0AhZyGqsUgiqk5HoEnlC0xpARibUOIe0Dp0n8MClbKw/X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779119632; c=relaxed/simple;
	bh=BDBX1xjAJ0LRJ669WLtKgmM/iN83kf6G8Zqu5Nhk7tY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGDOtBlWjD/YOG8aKNOPIKELi3AnnV4ziIgYZxjb8fOjiwKzP6IJLPEoGA1bkU5D46vM9OROXuDug0NhGXIwUpiYhA6Aw79DwQr6sbSmyyZqzcQLZeZzqWjQStP9cCvscvj+fewUnyGf6OsmvmzVWGkDf4x5VA0GWL8fpGLiTDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3WvuLxM; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-488b150559bso19364715e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 May 2026 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779119614; x=1779724414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uJv70dl9pxlSstZxADnST4TafBrOMHuR9XAmS5GRB8=;
        b=s3WvuLxMILjGpxqPsyRzJJCKHk5YO06+QBENgSlg/1Q3LN3C1x74AY3G+hDh37LauM
         mm4KyZEr75ILS1pFCg8y8ATZ4ITyzv3RpPbjb+k7H0B4gKN2n1XRgBoAicICrd78trJj
         K3JK5zXZ/DIF5ySFUnIsAhXjCdecWOUhza9krnBh+yHNe5zHRqsmpxjFx1vAs8EGW5Jj
         DGm57LeXs13qwifSwwAeZhxJE2Gy3Dn4fBpxxdxCckLMyzuLch6WmpFRm6+oWdrla0As
         tzT93l1LNgj+g1Z0153IYuDl/2r5vRZIKarwwVereKH3l+LLRw8vMRrrXhpkn3Cc4YJu
         RBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779119614; x=1779724414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+uJv70dl9pxlSstZxADnST4TafBrOMHuR9XAmS5GRB8=;
        b=lnYNNMNP0SUCNPI/JU9E5GfYSBzmNrIFr3trqTKTh545lW0S21EabjCYsovzjKMIa+
         0VEBtYH6dcJWq5Mmmyrgv6FTjTIC/DekalHZ9cHUHWCGO2bgg7GxTlsko/hs79H05+QA
         uYUDTPeKQGMcHJ5FNU4alrWMwrvuZ90z4MhrkCrqIAfKeCeDM6nQfodu7qKVYBF587zs
         UItLyC/9ab4o6AUW1t7eYZGtsD9tARwJUEQFOPv2IHnvExx7BSscRnoGmOLRIIJ2tUEs
         A3tWZs/HxR/11er2Wzor8xYclNMvykXle+nWskfeyed8Rag8VOfeB/Tj/TtIC7A+VuRI
         N1Tg==
X-Forwarded-Encrypted: i=1; AFNElJ9Vaxx7hy/zMZZyIfJmuq58mdGveEJ3U5Pk8Jh1kS+dvO1ICfvWqEbQvk0l0twrTgp+oUcgTQa3o1uQDGHL/W0Fcw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuYrvra1PmcQiO81GDQdy+PlGW5eSXK37k6LEmGdqBfVGsJ1Jr
	/pQW4p7qUulLaR8YV/83GPtOS5llu10sFy4v3aIdttA5Lh+uIBt4W2vlCBfHhwvb4hQ=
X-Gm-Gg: Acq92OEJQEuoOHFJUmExV1KB7+rc3MPduHtQ8xg1qhcqtTEZyz4lzu1HZ23tSxCpK6X
	FWZBU3MJnUlNrYnMbrv8eVVgMqs5tKH/sfAMK1hzIv2B3NSsEa7rahDX7bF3x1/7KCr6uRw7cnY
	gKg0LGyYmXloygUUSs0V0RKM/OBnD/fmmD5obTJt79Vp+a3U1c3PFuDg44Z4yvHwXoOxdsXm69H
	jeJsIPlyusrxtfGHR7ZjWd268ZC5sHPW5ODDvjUpf7v80sCFLkr9Vbu3SF4p8gZ7jm8GNlfqfi5
	d/M430RbbLtDIhvkDYWgAsR8C0+WFxApJFZCVzvk0C9EsHpqUfITA+8YQ2OSjcNvREK2EDBW0Jd
	B9E0pGt0m25X6eg/o6V8MIXoflEdtUbQ3BeRZ2HeYBu/sqVWhKv5DMCDvh4pRCS8sHOhZzWmq2u
	ecgft5q3P+RJK/O++I8vK2XXgjdfbtvN0vP48a80Mm7BvLUwizRVEtrp/isnVbY4neprdq0vAo4
	VhfeLtFO1uA4FroAfcJEIeYPb9EAoIJDP1hWOUi3zruEf7C
X-Received: by 2002:a05:600c:698d:b0:48f:e230:2a1c with SMTP id 5b1f17b1804b1-48fe6631158mr251523225e9.31.1779119613752;
        Mon, 18 May 2026 08:53:33 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2409:d26f:6d8b:b2cc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8344asm450054575e9.1.2026.05.18.08.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 08:53:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Rob Herring <robh@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/4] PCI: rzg3s-host: Use shared reset controls for power domain resets
Date: Mon, 18 May 2026 16:53:22 +0100
Message-ID: <20260518155324.168948-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32771-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,google.com,bp.renesas.com,pengutronix.de,glider.be,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 301ED5708DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Switch to shared reset controls for PCIe power resets to prepare for
RZ/V2H(P) support. On this platform, multiple PCIe controllers share
the same reset line, requiring shared ownership of the reset control.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Updated commit message.
---
 drivers/pci/controller/pcie-rzg3s-host.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index d86e7516dcc2..a5192e4b58df 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1276,9 +1276,9 @@ static int rzg3s_pcie_resets_prepare_and_get(struct rzg3s_pcie_host *host)
 	for (i = 0; i < data->num_cfg_resets; i++)
 		host->cfg_resets[i].id = data->cfg_resets[i];
 
-	ret = devm_reset_control_bulk_get_exclusive(host->dev,
-						    data->num_power_resets,
-						    host->power_resets);
+	ret = devm_reset_control_bulk_get_shared(host->dev,
+						 data->num_power_resets,
+						 host->power_resets);
 	if (ret)
 		return ret;
 
-- 
2.54.0


