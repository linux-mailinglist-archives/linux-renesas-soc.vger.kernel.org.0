Return-Path: <linux-renesas-soc+bounces-30857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF/yINXMz2m50gYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30857-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 16:21:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D28395249
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 03 Apr 2026 16:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40FE7308BD3A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Apr 2026 14:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2DD13C456A;
	Fri,  3 Apr 2026 14:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="mhL6XUSw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6171B3C278C
	for <linux-renesas-soc@vger.kernel.org>; Fri,  3 Apr 2026 14:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225631; cv=none; b=qkqfB2pICmVOyLq9AeW19HntvBQjsnF9ZfXhD+zxLd1TBexOaz40yQraLKvyPJuNdeWgJ8Sntswl6/1rrKqnqJQ9F5l7lcmXr8izw6M5DBcAxyNiGvaG4NBN5EYvYE62nXUx2/eEwkg92idTAJYvYnB24+KvHqYW/8V43cMg/ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225631; c=relaxed/simple;
	bh=LRYHaFI43ObJkd/Zzw3N6eZWze7aaP3Y5tTqNwQloOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jje0BpRQinRkG+wzjIa8/NdRY8HneluWx6Y9H78zQ+YlBzVPgjn7HIScMnMln//TWGNxpYyT6MId/G4sGxpwI4tiTGr8qaAZgsSYonZSSBKnSbyGvoSDsPPndrThvWUQPsUklWABYcw9KIAZWtq8BejvFyJWq6fAbWwM85V/Bo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=mhL6XUSw; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43cf5fbacc9so1057683f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 03 Apr 2026 07:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1775225629; x=1775830429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rk2pkIuPg8i/R38yPh0wUY0Mos69qO/yiVjTw/CLc1Q=;
        b=mhL6XUSwiq7wabEerScHheQzxq9dOXW+BeOG626f57jfZ31Sk9Rwsx5n0lxmvBwwCl
         CEW8FkQAChljwdTGjNGzHb/GDeh5Xvwx5ANwp5ZoJDWvF2rQLBNZevxAA9bM0RG+tjWj
         dbtWDekhVMP5fzchexajB8WNUxSgWNXjzclHJu5P2EWUYnX9CFHk0WlE1Cz3mP7klIwz
         vu5T5AFwnKGAlaGRQ6oB8oZv4+7aYU6O+lIG7fCdG6uZ5Wv34cy4kaaaheZ5ESfsV7MS
         /NaDeVU2ck/xTydLO7FUk4TU07aJZupKssGLZ9wnOKzL/h/S6hcr3MpqpBTAvALht2q3
         mKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775225629; x=1775830429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rk2pkIuPg8i/R38yPh0wUY0Mos69qO/yiVjTw/CLc1Q=;
        b=nTpTz5FFuja2BpdQ08Q1rhb96HSFpn+7DIsEcjI45A4lU7JNDkJF3kcHbZZrQkDWMO
         uU+26mBAjN1x8zuG/O3NwPLMHzlm5i4nEVBwbGhBuOhp4zS+RJpSeSIOLFqlvcnV8qMI
         tCdnv0e1M2qwUM8UrhWQAHmlS8kAbo24THWyczMrt+FIXsTzUCu9JBgmR3yKdH5TVcXu
         jwd1exc5150D7y4oExHRO7Dbjt9Ci5tob2cAeDjUpVwDkaqq4kWIv8V3UdNMU2vsh2ef
         xqTVY+8jvaLw3bWjPbYK6UJ69S7RyXR2hAkPXULoytC/W0X5aUa0wfY1LKCw5L++H9DM
         ERcA==
X-Forwarded-Encrypted: i=1; AJvYcCUgO8k4oK9r4Fo5b88JjJRHxDzT3+6GfEWrA0iZqvYHJ7mbShXQt0dpGlj51+p58LCyeb19hFI3ezNDr0ltAI4iuw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLrcSZEPVCrsoBrgQ5p9uQnlAfbv1vwWYOseuldhcy8JjySPIM
	W+uxmhJvpBd7iOWkgZTLMHlFfcdhvsOTMpl67AGNce3Fn3azQDWbj8glU5DIIScX47RLSoysAn8
	n6d9k
X-Gm-Gg: AeBDieuFhzbo6NqIZvlQOS6SUYB1kQLp83AyGStzUE4/EB6kEcJIkIQtXp1PHOpQ2yH
	7ZtOqKOkIUv8GJXlMOJUeZF3Im0nuvhmQp1Qjk+RmJx0hdZzWUHQ3M+dK//fMgSbYDgnJUHBftG
	Bs6kGAxukXBkfq5dNyNbeT0+i3HpmLVJ9GvS6sg3iVYRhO/Eb03/5cXGjAYggczYWEaS0HvQfRD
	JYH1Kyiu2BT5At4Xn+c3jVcxWBRywIDZ4oq3RJHsaviTDURXGqZr3MnDelBWtds3uH83wj+oCK1
	ye7VfvKZCzXps+jAmLO6HQQVuD5wC2qQKM1qfLWSG4efPWuXqkEQsjp0SdkNVI2EYkHiH3mG3F9
	IGEmtzgGvKPPO38hYQswm8FzGy3apZSxVo0enhTnz30zx2Yq+FIv26Wk/vr2hSfxWNgAhz+SUkA
	X2dFsAJQAAN4WkMUkbq69fh09YvAH8SlSTescRbpfrz0UXnNcklQKRwQ==
X-Received: by 2002:a5d:5f92:0:b0:43d:1de8:80b1 with SMTP id ffacd0b85a97d-43d290ec3ffmr5699526f8f.21.1775225628753;
        Fri, 03 Apr 2026 07:13:48 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f13sm16958970f8f.3.2026.04.03.07.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:13:48 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.reneasas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/5] soc: renesas: r9a08g046-sysc: Move common code to a helper
Date: Fri,  3 Apr 2026 17:13:38 +0300
Message-ID: <20260403141341.2851926-3-claudiu.beznea.uj@bp.reneasas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260403141341.2851926-1-claudiu.beznea.uj@bp.reneasas.com>
References: <20260403141341.2851926-1-claudiu.beznea.uj@bp.reneasas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[tuxon.dev:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30857-lists,linux-renesas-soc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[tuxon.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[glider.be,gmail.com];
	DKIM_TRACE(0.00)[tuxon.dev:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[claudiu.beznea@tuxon.dev,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tuxon.dev:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,bp.reneasas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 42D28395249
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Move common code from rzg3l_regmap_{readable,writeable}_reg() to a
helper and use it to avoid code duplication.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/soc/renesas/r9a08g046-sysc.c | 31 ++++++++++++----------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/soc/renesas/r9a08g046-sysc.c b/drivers/soc/renesas/r9a08g046-sysc.c
index fd98df196d0a..90db9d383539 100644
--- a/drivers/soc/renesas/r9a08g046-sysc.c
+++ b/drivers/soc/renesas/r9a08g046-sysc.c
@@ -28,17 +28,14 @@
 #define SYS_PWRRDY_N			0xd70
 #define SYS_IPCONT_SEL_CLONECH		0xe2c
 
-static bool rzg3l_regmap_readable_reg(struct device *dev, unsigned int reg)
+static bool rzg3l_regmap_readable_writeable_reg(unsigned int reg)
 {
 	switch (reg) {
 	case SYS_XSPI_MAP_STAADD_CS0:
 	case SYS_XSPI_MAP_ENDADD_CS0:
 	case SYS_XSPI_MAP_STAADD_CS1:
 	case SYS_XSPI_MAP_ENDADD_CS1:
-	case SYS_GETH0_CFG:
-	case SYS_GETH1_CFG:
 	case SYS_PCIE_CFG:
-	case SYS_PCIE_MON:
 	case SYS_PCIE_PHY:
 	case SYS_I2C0_CFG:
 	case SYS_I2C1_CFG:
@@ -53,28 +50,26 @@ static bool rzg3l_regmap_readable_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static bool rzg3l_regmap_writeable_reg(struct device *dev, unsigned int reg)
+static bool rzg3l_regmap_readable_reg(struct device *dev, unsigned int reg)
 {
+	if (rzg3l_regmap_readable_writeable_reg(reg))
+		return true;
+
 	switch (reg) {
-	case SYS_XSPI_MAP_STAADD_CS0:
-	case SYS_XSPI_MAP_ENDADD_CS0:
-	case SYS_XSPI_MAP_STAADD_CS1:
-	case SYS_XSPI_MAP_ENDADD_CS1:
-	case SYS_PCIE_CFG:
-	case SYS_PCIE_PHY:
-	case SYS_I2C0_CFG:
-	case SYS_I2C1_CFG:
-	case SYS_I2C2_CFG:
-	case SYS_I2C3_CFG:
-	case SYS_I3C_CFG:
-	case SYS_PWRRDY_N:
-	case SYS_IPCONT_SEL_CLONECH:
+	case SYS_GETH0_CFG:
+	case SYS_GETH1_CFG:
+	case SYS_PCIE_MON:
 		return true;
 	default:
 		return false;
 	}
 }
 
+static bool rzg3l_regmap_writeable_reg(struct device *dev, unsigned int reg)
+{
+	return rzg3l_regmap_readable_writeable_reg(reg);
+}
+
 static const struct rz_sysc_soc_id_init_data rzg3l_sysc_soc_id_init_data __initconst = {
 	.family = "RZ/G3L",
 	.id = 0x87d9447,
-- 
2.43.0


