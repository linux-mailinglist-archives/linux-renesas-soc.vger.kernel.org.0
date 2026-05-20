Return-Path: <linux-renesas-soc+bounces-32883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEEFGpERDmrw5wUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32883-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 21:54:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD47598E2A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 21:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29E273397775
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 16:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534C53B27D8;
	Wed, 20 May 2026 16:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVk8b0L+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD3236605E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 16:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295757; cv=none; b=R9e+nIpeJZP3xAcjMfgoRPvcagUxDm67nwx843iNUg7/10UMWiHMCGN5KuxaHYjw6fFhSTmkrS1rATRE4N8ZNqlj8K4ce3lir+4GGgE7Zbio8JJVscpBwecS8VpMhor8IbFE0CnF5n8uQpjAoG+KZCXWu4axbNrbL6lwLWzCUR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295757; c=relaxed/simple;
	bh=KHCNdg8WDuW8IcELyLOslLxssl5wbWlUe6xFPFofttA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ha4veNG3wo64PSPLJ95+geol48GoHpb9hEDNznMFhgcVeeRwfJbGqnM/kpf17ebQHKXbYZg8A5EbCJ05jRkRDR7hr5RdaAGVuoB4tC11HbIu/S/8IH3KmWeAfJKTzgL730gWbLvskbnwDkS0bX/M4HDSUcg7ArKYNurD9x+KfOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVk8b0L+; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so34238175e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 09:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779295753; x=1779900553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRMlPPpvWg0+TEQtNgaYgNZz3rw+h40bKIEhdoGDsxg=;
        b=YVk8b0L+rlmt6P9fuWhXkVZ7LDvpGLj3gturB7s9lnZyek0mTr+WEBQnK7AmXtmtT3
         ie0UzU5iUKazHnLpjfcFuS7/gM66R801sqqkKfqs/tGyQeDJqMCfN3d+wMVA4K4LRvuh
         4F1knett9Iw/BcbZZRsc1JfFpIhlUCvL12wS2ArEDh9kOCzkTFDV6hAj0XxKFNVVlKt9
         BjmU4AJEdVja1gNhwEf4+SkT54/6+/fuRiQLY1GCGBPZtlXN5+B3zMPSDpQOIguRK8At
         4tcjqIoKB8asUzhUkrMq9tDx8mzc0zBtzTfAVwwzHQzuMmDuyaGsZLQX5ZhZTRen7aiO
         tphQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779295753; x=1779900553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uRMlPPpvWg0+TEQtNgaYgNZz3rw+h40bKIEhdoGDsxg=;
        b=UibwXTi4pASHqvLP85mRpCHSRccKxiVFQOL4iOsiCmhjGul94fJc0W0kFeWP49AUSJ
         9FkzZbA3KnAu0CN2/mwtgeMNn/qlCUrZvVWZSla1VIwu8cC7XqbdWYZ2Z17j7vXruMIN
         4Ao5ysQfju4ooqgqBOxXnKVqFm3QM2mPKTnPymcq2fmXdmfXUZuWLXiMfPV7duLtvmGq
         +sPfam6GfwTfXHJxdjDe5AzwQPG8X+pR5E+E7gB1cflHxTAPRt3gSgT3D1LMfwEp3SPH
         yOWSLoxAbrtxd5ilZKS9+hOwchVl2EyWzbEmUvwWrXOAob4pScxz+dzxUaXPzavCT2M2
         zesw==
X-Forwarded-Encrypted: i=1; AFNElJ/VhuGP4RHBsBoeprMdydRgCS9xXaCkelwXjjiNmiH34QZ5q+w1HHEYtgveBhlIE2G9kctURE28ZBaWodXBv7FuHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzicoE2n/S/Th+fqsT0yReJCTD5D4FYtMVqn6XGCahtWVX3l6+Q
	zxoXe2Ni9g23mYiU/YUKVxiX53AVxojosQhWL+yNU+ex2XX+GW7uTX1H
X-Gm-Gg: Acq92OEVxm90jgVyjA2anUcNFUaN6MHBMKHrPWc/Z3r7o1kCLiWgJLyhXzr4rfNBELd
	97rq/zSNxIf82CaWPiotT3/22gryr1s9owbFNDmqKgxtUNQK5bjs62UFrCyb1l3GoBNJDUJEbaq
	M6o2cLvRRrFxzL+AxnINMg/et3xQN28s2yV9F1gb4BbGg0VmDsY0a2aEV4yxqrpBmwPUK8arAiP
	J/9hDg6b+td46zWBnqHIVxS7KnUHcCmMUHicW7W1f054r3tOv3r9p4kGudCIcdiolnQA6ASDtFp
	VKcIAZ+DmfhUnKwoSo85X8e50cS3DOlL+IG081SPp0rTWejLuwVZV/erKjMk4qUsj4iN+rZ9BAL
	uByj9MufbZDnoBkAYZZ6gPSac5V6jxUjhlMvWobS7ADNmzQb3GrS3+emCvzkCrx9q7YJQ2aYP0E
	qPW/+k/QUmzWP7Y/AGB05a9Y8CzyLnmYtjH53GVZAUOr64WNfP1h7G1sBeKb1IqOF+qIqoUJ/tk
	o+f4/uGCJoCh8Q2eqVg1egvV+3ontL1ZzFpgPRVd5WVDDQ3Xmc7BaK1yA==
X-Received: by 2002:a05:600c:4692:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-48fe63253e0mr403611915e9.20.1779295752770;
        Wed, 20 May 2026 09:49:12 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:dcb8:81c1:dc9e:cd68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033d8e71dsm3110285e9.9.2026.05.20.09.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 09:49:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v3 2/4] PCI: rzg3s-host: Use shared reset controls for power domain resets
Date: Wed, 20 May 2026 17:48:21 +0100
Message-ID: <20260520164823.436992-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20260520164823.436992-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32883-lists,linux-renesas-soc=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,bp.renesas.com,google.com,pengutronix.de,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: EAD47598E2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Switch to shared reset controls for PCIe power resets to prepare for
RZ/V2H(P) support. On this platform, multiple PCIe controllers share
the same reset line, requiring shared ownership of the reset control.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- No change.

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


