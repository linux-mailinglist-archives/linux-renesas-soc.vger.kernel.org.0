Return-Path: <linux-renesas-soc+bounces-33485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uLAmJOnUH2qFqgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:16:57 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BA663517C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 03 Jun 2026 09:16:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Y88iuVVE;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F58331297C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jun 2026 06:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16CD3FF8A5;
	Wed,  3 Jun 2026 06:57:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662203FBEC4
	for <linux-renesas-soc@vger.kernel.org>; Wed,  3 Jun 2026 06:57:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469872; cv=none; b=LpKvSc0dotZV007a8hg7G/5q3T9+LTJoHYV8oRpgzF96bfKX8+vlkCUwK5FjAPhiotR8mu7zA/fx4NvSi53suquDxqVvuHDZfjcPAtThhwIJkLKT4+HwtwzCypG6MoMJuBE4FkVVL+z3N10riaKqWRibrBoFeRmyeg+6g0N8Nck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469872; c=relaxed/simple;
	bh=CQyKIL+Hk8L1r+uZcNTI0BvcATuWoaXUjyANufv/trc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CL19BR9uNtdMdXXwMCQv5btK2Wl4a8VetAdJkoyZEjmvLU6bsSeajhZ/mxeu5FpXToAEcznI+C2SacBS7QWWf5LlLcAoeAqJzU5rE4e6mrJqS5r9sS0B4T4I1eSq0irdxMIuubcNl/RX59hyXSr/+IWtEdgsfFtSMyKlTbOoxPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y88iuVVE; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490ac10e337so17329055e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 23:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780469868; x=1781074668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBWFx0Q8TXTvM2GGYsSte2yTUylNdi7118RrwX+m250=;
        b=Y88iuVVEoQZqRytcTM1Tix2STaRiKw+phwHGngikdwZ1wbEHNhZBjXCSr+v4Eoc8/5
         +ph0ogwoJ1KEs13TyY2NXVv6r/jPBTXCyAdb8MUwMSyChnIo74zJL0HWsx4Ny5R++qPU
         KOg/JGtFaFVNfS8wsagl57vYR3i80be2hTN5vlIc90NrJQkDS38T89FBw2crn9L8O6x1
         x9JcMt9PCHqYMJa2YlMbvVK7A1LMjcv2pouIxBF5x4osXEXXhqJEpeubum8+/zKRB+tj
         ryq6pot/hScKWe8y9667axW+PVQ59iAUw7nqkMHMPUjoLyeBrjmC5DnrmXTonywogKX5
         VvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780469868; x=1781074668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QBWFx0Q8TXTvM2GGYsSte2yTUylNdi7118RrwX+m250=;
        b=SJlE3kViop0cOT0qS2fxFT4n7WHP6xeCHwoqM1Z8USUa5qBKAWvrpsao1Z9Tz6aCPF
         5stiKp3wBTwe84BHUEH7rhh7Vhs92NXsnkWbes66W/YtXwAAZaZJcGiLFVpFlu1TpfOQ
         uUXiA8zROXJC+cz6x8vlxV7hHWezJtp3kKmHCk45y9C21vlCyc9aN3CjqsxqwimhOSQn
         xDIvOFjm1eiLp/L8G3QLw7+MvxWYW3++nPXAGZfKQMCkHbVPmuQPMy3j6PKChktV5++H
         CtCIayBm4cZBZcwCX2Sh/Zapt5TKTy6VPdEnbdkurd6MS/AeNhM73yub8G5onilpSro3
         fk5w==
X-Forwarded-Encrypted: i=1; AFNElJ84SZ+YQGvNHVVBOn3I0A9BHLQ6NsdiVM50bNeAH8yP0kSmMzd82PruoUBuwi8bwaGmS+gY5dpcqXM4bfPfcX7Xdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzyO1u2OBwilza4W1hCDyj39DVl/VUN0vLr1aTbDCTCumGnxgd
	lBskGcDS1eZ27F5Puzx2u/nElM8TCGq9KJGwUW96Vhj2ErUnK8K5LPHc
X-Gm-Gg: Acq92OF+vHcLGiVBfMCoWqqTZ2yzv6ymST9/4K8qthRnQ6plVg9+P1SR7zMNDTYc5Eo
	JMLeMhlkMkZ2lDbYQotXCkKMWA8tYxTKjRiLt5O9+BZYV5EaOcARol+NVk2UwEnqe4FCEfqosON
	buuXRQ2WFumfgsId+S+Yp9EJeRW65HI0QgwNgV3sekwVY7gZDp58x092PbHP19kdbxg9SklZIXY
	HQfsy2MaDJrrhsV5eULZVjtBTq9WdG24uDCcPn5uyRLu3HabC7s0gO/G8CZluJUcNtZKwtdcSeS
	hS1Ryp6sB6OZC7DgchOFUnkXeEyiZZHFQCVDu7kWtc+whlxKm4MyFKeYKD5SP+4FoIVGnOOzMja
	filNN1haHnEXxrczyI5UzwLvb2eW13RVm0hIn+YOqrbUZHU0BTp9hBuermlKD44sxMWMSr/RS55
	/wAp2quR59Y0wzBmi2/A2+M7TNfdmrqO/Zue/w9MwksdK4SepfLT5ycYGD2xQ=
X-Received: by 2002:a05:600c:871b:b0:490:b9ce:a73c with SMTP id 5b1f17b1804b1-490b9ceabdfmr8387875e9.31.1780469867598;
        Tue, 02 Jun 2026 23:57:47 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:179c:89ab:19f6:9ba4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b79d90bdsm9001855e9.0.2026.06.02.23.57.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 23:57:47 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v17 12/17] mmc: renesas_sdhi: Save and restore IOVS across suspend/resume
Date: Wed,  3 Jun 2026 07:57:12 +0100
Message-ID: <20260603065731.93243-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
References: <20260603065731.93243-1-biju.das.jz@bp.renesas.com>
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-33485-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:ulfh@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-mmc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:biju.das.au@gmail.com,m:wsa@sang-engineering.com,m:geert@glider.be,m:bijudasau@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,vger.kernel.org,glider.be,gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bijudasau@gmail.com,linux-renesas-soc@vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email,vger.kernel.org:from_smtp,bp.renesas.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 19BA663517C

From: Biju Das <biju.das.jz@bp.renesas.com>

The SD_STATUS register, specifically the IOVS (I/O Voltage Switch) bit, is
not automatically restored after a suspend/resume cycle, causing the
regulator to report an incorrect voltage on resume.

Fix this by caching the CTL_SD_STATUS register value in the renesas_sdhi
private struct at suspend time and writing it back during resume. The
save/restore is only performed when a regulator device (rdev) is present,
as the IOVS bit is only relevant in that context.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h      | 1 +
 drivers/mmc/host/renesas_sdhi_core.c | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 6c024e7f69e1..10f634349da9 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -117,6 +117,7 @@ struct renesas_sdhi {
 	struct regulator_dev *rdev;
 
 	unsigned int divider;
+	u32 cache_sd_status;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index ee1b1f70c9e3..974acdf110d3 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -1379,6 +1379,9 @@ int renesas_sdhi_suspend(struct device *dev)
 	};
 	int ret;
 
+	if (priv->rdev)
+		priv->cache_sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
@@ -1410,6 +1413,9 @@ int renesas_sdhi_resume(struct device *dev)
 	if (ret)
 		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 
+	if (priv->rdev)
+		sd_ctrl_write32(host, CTL_SD_STATUS, priv->cache_sd_status);
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(renesas_sdhi_resume);
-- 
2.43.0


