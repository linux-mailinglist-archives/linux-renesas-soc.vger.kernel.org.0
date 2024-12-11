Return-Path: <linux-renesas-soc+bounces-11208-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AB89EC454
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 06:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05A7F188994F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2024 05:30:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF8FF1BD9E1;
	Wed, 11 Dec 2024 05:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="tv93OZCW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5BA55672
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Dec 2024 05:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733895022; cv=none; b=YzbQ9YpAvTov5x6//e0pys9dsf7WjKrNIErrHzpjow95BypGhylkh92JmmExf3J2S+DQq729eNTFRpEIhoK0IYAS55v9PoVquSo59WW7acDbBxb219Xh83qtO+5EUYBREFEH01n+BvB5NTn80HQe5d727Bqm8LMNMKzjiLdss8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733895022; c=relaxed/simple;
	bh=WjStt6KCmPyjA0UUxxptllAJ1zIxzLzoXkXCuU8sFB4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s1V0uLAigyZbtWCloBYxUXWO7Hz6UQ5tA1RCUJyoYa2I1OGpC97KWDv+i3QKvTsGGaTbveCQS/RLJg52bwFoCymloEnnjxs3WImdgijViWEBFP78W2TDcnWyAFyq2wlHvXd0G5F6M7CJNWuhwB7mgPKPl8/7Ox5LN2/GrOXe7zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=tv93OZCW; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5401bd6cdb4so3332823e87.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Dec 2024 21:30:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733895019; x=1734499819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JohBzc6SIbwiwfBt8MJ3uGvt7oRvwtZBP0CDs+EpYnY=;
        b=tv93OZCW/YwbXOQaLqYjTWAqH1mAdjeVIzAhBA18FekKyURnyFtWKbXZJ29k1ipS0x
         0GOqutadFyUj1avm8kPLEGn0FEWtQk62rw0F+VqWK/mP6nMERZehmXRvSwRLloCJ6fL1
         D4a4p5mdl/tJfPA7sXLYNgzFwheEE/v1XcmOLb0ciaevN4nVWDWaAErXkPpyY1zfPPHP
         468jZpqLQ/orCS4BHjBuYmbvXf32l9/Rce/ASEYlSN5AlccQ+UWZbYXW+qIy+vAPr5xJ
         PWpHH+Md5D8pLqGSQuSAuPzkr0r1NsnprvcdiYcUIXPj51Ci9eqtCM91JMg1+UMRpTS8
         GfHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733895019; x=1734499819;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JohBzc6SIbwiwfBt8MJ3uGvt7oRvwtZBP0CDs+EpYnY=;
        b=bJW24gnLgIjfwojH4vbdtc74IZer/bYZjURnmJJUhvvAYHZActvV7XX8JF20lQRBQd
         lE3M7uU/xZDIK6eiCv8pDJue+ReA8p7m5SbHMx4TrUNMBgnBEQgIoAh3BrUMkiKoM5cA
         Gn3pW7lsTMrfyqLC1a4rTjxMeS6MFsZi5/AVJWKiWprGsvnarVXJotKnQTGEbZdHp50F
         6WNOhzzmC8SY6qi54xJsUZRubhqN9rJRR93YCDwEdxN7ZgQavZ71Otx1n5TaFkEIlMkb
         CaNQLnIphJm1qrOLYCjgHfxDEHY0HpQdtt9uMB0piWvMcepV0RjR8UtImQTGeV3vLQTi
         oLQw==
X-Forwarded-Encrypted: i=1; AJvYcCWiHkDudT4Jjp6TCYNc637w7TAQzVK+fqQrD9ZPVyWCgUGz8jlgOIp2UJQA2iVrkq83jd6AzXu1pBRlfXYa4sYeNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz37k1ZBDihNNz2QaModZtDTnrMi8Y0SpbuTNhgKo5F8GOeM0Z
	sYE04OjXkuHW+DMo8zD+o/MuhmGzMOagWEUzxrWUPWMtOtsVBxKckEA6Cohz6zs=
X-Gm-Gg: ASbGnctbBFVjMAs5J1PL/oCywTQKpfCg8OHTiaeBaoaR1Af82a66w9LGTtiDYqeLw/q
	Ykg1pe527uJ97dPhpZYXu+mqWS+YdJ2x26SpoLBqwzI9qMUYScvy40G2EfYiatQF2v9Uuxmv8DH
	uDx8OsHDbqttR5gFffFtpj7jSkDn0PjTBZxmeekVG3MCDcLsz7aHAtgPt9LF1fiuam3SC+ceLCJ
	7/5DRD2ZnWt3hNoJqyj0hi8HC/q2DToI6xIMFBHlw8Y2DEbbiAgcsoHuvjfvIpsCKA6
X-Google-Smtp-Source: AGHT+IF/6paNyWnK5s7sNDNe+xdCVS9id0CRa3T10BRNgQZGzD3tcn5rO5sJvrkylZtSPBA99NeIFw==
X-Received: by 2002:a05:6512:1049:b0:540:2188:763c with SMTP id 2adb3069b0e04-5402a602133mr321217e87.37.1733895018632;
        Tue, 10 Dec 2024 21:30:18 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5401bd77e6asm1022025e87.283.2024.12.10.21.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:30:18 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH net v2] net: renesas: rswitch: fix initial MPIC register setting
Date: Wed, 11 Dec 2024 10:30:12 +0500
Message-Id: <20241211053012.368914-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MPIC.PIS must be set per phy interface type.
MPIC.LSC must be set per speed.

Do that strictly per datasheet, instead of hardcoding MPIC.PIS to GMII.

Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet Switch"")
Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
v1: https://lore.kernel.org/netdev/20241209075951.163924-1-nikita.yoush@cogentembedded.com/
changes: regenerate against top of net tree (commit 3dd002f20098 "net:
         renesas: rswitch: handle stop vs interrupt race") to ensure it
         applies cleanly
---
 drivers/net/ethernet/renesas/rswitch.c | 27 ++++++++++++++++++++------
 drivers/net/ethernet/renesas/rswitch.h | 14 ++++++-------
 2 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 6ec714789573..dbbbf024e7ab 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1116,25 +1116,40 @@ static int rswitch_etha_wait_link_verification(struct rswitch_etha *etha)
 
 static void rswitch_rmac_setting(struct rswitch_etha *etha, const u8 *mac)
 {
-	u32 val;
+	u32 pis, lsc;
 
 	rswitch_etha_write_mac_address(etha, mac);
 
+	switch (etha->phy_interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+		pis = MPIC_PIS_GMII;
+		break;
+	case PHY_INTERFACE_MODE_USXGMII:
+	case PHY_INTERFACE_MODE_5GBASER:
+		pis = MPIC_PIS_XGMII;
+		break;
+	default:
+		pis = FIELD_GET(MPIC_PIS, ioread32(etha->addr + MPIC));
+		break;
+	}
+
 	switch (etha->speed) {
 	case 100:
-		val = MPIC_LSC_100M;
+		lsc = MPIC_LSC_100M;
 		break;
 	case 1000:
-		val = MPIC_LSC_1G;
+		lsc = MPIC_LSC_1G;
 		break;
 	case 2500:
-		val = MPIC_LSC_2_5G;
+		lsc = MPIC_LSC_2_5G;
 		break;
 	default:
-		return;
+		lsc = FIELD_GET(MPIC_LSC, ioread32(etha->addr + MPIC));
+		break;
 	}
 
-	iowrite32(MPIC_PIS_GMII | val, etha->addr + MPIC);
+	rswitch_modify(etha->addr, MPIC, MPIC_PIS | MPIC_LSC,
+		       FIELD_PREP(MPIC_PIS, pis) | FIELD_PREP(MPIC_LSC, lsc));
 }
 
 static void rswitch_etha_enable_mii(struct rswitch_etha *etha)
diff --git a/drivers/net/ethernet/renesas/rswitch.h b/drivers/net/ethernet/renesas/rswitch.h
index 72e3ff596d31..e020800dcc57 100644
--- a/drivers/net/ethernet/renesas/rswitch.h
+++ b/drivers/net/ethernet/renesas/rswitch.h
@@ -724,13 +724,13 @@ enum rswitch_etha_mode {
 
 #define EAVCC_VEM_SC_TAG	(0x3 << 16)
 
-#define MPIC_PIS_MII		0x00
-#define MPIC_PIS_GMII		0x02
-#define MPIC_PIS_XGMII		0x04
-#define MPIC_LSC_SHIFT		3
-#define MPIC_LSC_100M		(1 << MPIC_LSC_SHIFT)
-#define MPIC_LSC_1G		(2 << MPIC_LSC_SHIFT)
-#define MPIC_LSC_2_5G		(3 << MPIC_LSC_SHIFT)
+#define MPIC_PIS		GENMASK(2, 0)
+#define MPIC_PIS_GMII		2
+#define MPIC_PIS_XGMII		4
+#define MPIC_LSC		GENMASK(5, 3)
+#define MPIC_LSC_100M		1
+#define MPIC_LSC_1G		2
+#define MPIC_LSC_2_5G		3
 
 #define MDIO_READ_C45		0x03
 #define MDIO_WRITE_C45		0x01
-- 
2.39.5


