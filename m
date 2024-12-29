Return-Path: <linux-renesas-soc+bounces-11742-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC079FDE86
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 11:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 112057A0F66
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 29 Dec 2024 10:13:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD8B215697B;
	Sun, 29 Dec 2024 10:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="enQzPRR3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3DE137932
	for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Dec 2024 10:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735467170; cv=none; b=bsIz62RwNeB2hfBz8srbX5pfKSxlww1ESWNu4KA7efF/lZZYhDIZQY0PpfvcrmmxXBtpwafOuhco0d+HTeR5rwoS+1XRBl6nyo39hUymHsovtXGmun3FJ8UocrSUT5t9Uvv/3hHOW8STvHiWPiTtpXu9b09zBQA/mrlbhwGgDkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735467170; c=relaxed/simple;
	bh=Y3Cc22NIQeBiPQ/ptXbRKHRxI+NhYF4Z9JcoAKhf2NA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S1hm3c/Ql27UNdd2G/fsVJu1uxYdvs6Wotqugt/uHCbEW5iB1ZAm/sMgchBcBA7LFftd8b4wKzoAzGEo98cSP43T6Gjd5aKiv/wa/PWsyzU36Tr1Z5f574SrQ+oqYkT2q6gY0zgFVtITZ7ydo3Sp49ZeqJDKSdFJku63wv/Finc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=enQzPRR3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=3dWsyI2fhnNRuJtDWw143uSamr17n+7uryQ9yHPh310=; b=enQzPR
	R3ZWxa4oEBsfz1GK0QIsytd1MqCogF1CFBGcGfKaZSfeAcBj6GjkryWe8fJyXyAs
	kpkxlj7qPNIwuXeaYKNCpQjkhmn+arykPWPRIzpz7Gw8kQRo3Vlib9WUmndFvflT
	FTodw9v3HaSxfvuwzwI6e1Kr2B827k/vxUak5iuBW6UwsIqa3kEzDyCYoR50OYsB
	oNQZZWY2b8jGp0ak13g4VqGIobTudlOLH9KKKFcmEtRCM+9LTVcGApqb//yn7v/r
	vgkcNpWVOMj/RekqjCPGyxPDnYiEwCki/qS1or0fdfDQqwSfqiZd+CFC/DecenSG
	mmBijsEU8fxWDVhg==
Received: (qmail 3656752 invoked from network); 29 Dec 2024 11:12:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Dec 2024 11:12:38 +0100
X-UD-Smtp-Session: l3s3148p1@ilN772UqqLEujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i3c@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH RFT v2 4/5] i3c: mipi-i3c-hci: use get_parity8 helper instead of open coding it
Date: Sun, 29 Dec 2024 11:12:32 +0100
Message-Id: <20241229101234.2896-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
References: <20241229101234.2896-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel has now a generic helper for getting parity with easier to
understand semantics. Make use of it.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v1:

* renamed from 'get_parity8' to 'parity8'
* rebased to 6.13-rc4

 drivers/i3c/master/mipi-i3c-hci/dat_v1.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
index 47b9b4d4ed3f..85c4916972e4 100644
--- a/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
+++ b/drivers/i3c/master/mipi-i3c-hci/dat_v1.c
@@ -40,15 +40,6 @@
 #define dat_w0_write(i, v)	writel(v, hci->DAT_regs + (i) * 8)
 #define dat_w1_write(i, v)	writel(v, hci->DAT_regs + (i) * 8 + 4)
 
-static inline bool dynaddr_parity(unsigned int addr)
-{
-	addr |= 1 << 7;
-	addr += addr >> 4;
-	addr += addr >> 2;
-	addr += addr >> 1;
-	return (addr & 1);
-}
-
 static int hci_dat_v1_init(struct i3c_hci *hci)
 {
 	unsigned int dat_idx;
@@ -123,7 +114,7 @@ static void hci_dat_v1_set_dynamic_addr(struct i3c_hci *hci,
 	dat_w0 = dat_w0_read(dat_idx);
 	dat_w0 &= ~(DAT_0_DYNAMIC_ADDRESS | DAT_0_DYNADDR_PARITY);
 	dat_w0 |= FIELD_PREP(DAT_0_DYNAMIC_ADDRESS, address) |
-		  (dynaddr_parity(address) ? DAT_0_DYNADDR_PARITY : 0);
+		  (parity8(address) ? 0 : DAT_0_DYNADDR_PARITY);
 	dat_w0_write(dat_idx, dat_w0);
 }
 
-- 
2.39.2


