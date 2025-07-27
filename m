Return-Path: <linux-renesas-soc+bounces-19702-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 716CAB13022
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Jul 2025 17:45:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E51393B9F15
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 27 Jul 2025 15:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDED17C21C;
	Sun, 27 Jul 2025 15:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="MoHXuN75";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JC0O72Yy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C7A4A33;
	Sun, 27 Jul 2025 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753631147; cv=none; b=ExTIvk/7w0uzIVYPDSgJEdvhnYJwOhE+FFzMf9YJG6npqHdlF4Ev4xhIuGPlymVwHn4Yw9Jgge6D8JZWNdYSidOIiIhIB+MXRc8xQG9ay8AqgoIGayo/Cn+neQ2o7EZyoEkaqCummeyvvnYW6ACKU3ngm2hCg54LxS4cub2+8X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753631147; c=relaxed/simple;
	bh=eGupCzC0Z81NPRfOxoSdBWbt2iy/t6ricoXA7JqAlOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hX7+4Kxn07JE6RfvvKLUpkRL+b8YnsAsHxrLcRny7UJRecC+vjHzfNRkqdgpLNcCU6OlnecXVHWd/6Nb3gNpDyynA/8++35iJebPMiqVs6eypacamxz4pLVejAO0NU6NRbTDtNHIgAP4XP0w3p2X2CpYjz09BrtfRJUb/sdD7RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MoHXuN75; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JC0O72Yy; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bqmCk1dKYz9tfd;
	Sun, 27 Jul 2025 17:45:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753631138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TUdhz81hr8XpiYjVdhBKXJ2/hht1dS20C+AYLiPBVIk=;
	b=MoHXuN756S3nfupdcgZzU3fMD8/wjVEP2TXP6fo2Pi9NhjP1YczHipgo0/P21peT9D6aCi
	XdyXfqVdhmmVeAaVd4cGJDt2wvsR46rqL2CoyvVLrH7yKBIJokUN/wUuyqcU8O5bnMtN7i
	OuKec2YG3DPJ0PCi4zCcVz4f1YZHg+TVgYAdEmQS/xpMCWyQULtJzGE9q0S97zt/kcmLVH
	6djfGFY0JYwTQ9mGgr2nHy3tvQ/tkNCYJUbADSqaa2hHQfOR4cmS1qWIiTrrLb3/a02n9W
	uq3zHP7mL9ripQeeySnuaDzOvMK8yCZCnHSPf1MIgXTIuz+4HTXpps9bfhnIkg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=JC0O72Yy;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1753631136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TUdhz81hr8XpiYjVdhBKXJ2/hht1dS20C+AYLiPBVIk=;
	b=JC0O72YyV5u4sE8M5fxUTnBNzGf7ZXzkBjEHYLbLFI9NVbEgWCI+JF25rNqD4Fl1inFqSi
	gxTbdDWaRD4NdO4TNpA6Wg2r2UAbL3ngVWkEMPamKLPDpo8CtyGTnVAQ7M0vwONC37Vwqb
	TZpeosfWRqWNwH1N092UwfRDRZWl0+L8NsBhZ7ZiyhFZEK6+xt+JNndfh65Egq0fvnbp1K
	dMYKbd2EgfLWTKfarL0aUygzLHSrCMuwcA5o0BLP1uZuKi3W2s4mpkZ7Lx8I1Ehau3OrLQ
	bkROw9DzREUseXW4j2dLFc1goKIRrxazczfxrkbKaCRecchfhu9CPYhOY5QHdQ==
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	stable@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] usb: renesas-xhci: Fix External ROM access timeouts
Date: Sun, 27 Jul 2025 17:44:16 +0200
Message-ID: <20250727154516.11599-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: cfb3c23f6a7d8be295e
X-MBO-RS-META: 6cwqts3awaz4ptwyab1c3zepgaxp1yce
X-Rspamd-Queue-Id: 4bqmCk1dKYz9tfd

Increase the External ROM access timeouts to prevent failures during
programming of External SPI EEPROM chips. The current timeouts are
too short for some SPI EEPROMs used with uPD720201 controllers.

The current timeout for Chip Erase in renesas_rom_erase() is 100 ms ,
the current timeout for Sector Erase issued by the controller before
Page Program in renesas_fw_download_image() is also 100 ms. Neither
timeout is sufficient for e.g. the Macronix MX25L5121E or MX25V5126F.

MX25L5121E reference manual [1] page 35 section "ERASE AND PROGRAMMING
PERFORMANCE" and page 23 section "Table 8. AC CHARACTERISTICS (Temperature
= 0°C to 70°C for Commercial grade, VCC = 2.7V ~ 3.6V)" row "tCE" indicate
that the maximum time required for Chip Erase opcode to complete is 2 s,
and for Sector Erase it is 300 ms .

MX25V5126F reference manual [2] page 47 section "13. ERASE AND PROGRAMMING
PERFORMANCE (2.3V - 3.6V)" and page 42 section "Table 8. AC CHARACTERISTICS
(Temperature = -40°C to 85°C for Industrial grade, VCC = 2.3V - 3.6V)" row
"tCE" indicate that the maximum time required for Chip Erase opcode to
complete is 3.2 s, and for Sector Erase it is 400 ms .

Update the timeouts such, that Chip Erase timeout is set to 5 seconds,
and Sector Erase timeout is set to 500 ms. Such lengthy timeouts ought
to be sufficient for majority of SPI EEPROM chips.

[1] https://www.macronix.com/Lists/Datasheet/Attachments/8634/MX25L5121E,%203V,%20512Kb,%20v1.3.pdf
[2] https://www.macronix.com/Lists/Datasheet/Attachments/8750/MX25V5126F,%202.5V,%20512Kb,%20v1.1.pdf

Fixes: 2478be82de44 ("usb: renesas-xhci: Add ROM loader for uPD720201")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: <stable@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
---
 drivers/usb/host/xhci-pci-renesas.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/host/xhci-pci-renesas.c b/drivers/usb/host/xhci-pci-renesas.c
index 620f8f0febb8..86df80399c9f 100644
--- a/drivers/usb/host/xhci-pci-renesas.c
+++ b/drivers/usb/host/xhci-pci-renesas.c
@@ -47,8 +47,9 @@
 #define RENESAS_ROM_ERASE_MAGIC				0x5A65726F
 #define RENESAS_ROM_WRITE_MAGIC				0x53524F4D
 
-#define RENESAS_RETRY	10000
-#define RENESAS_DELAY	10
+#define RENESAS_RETRY			50000	/* 50000 * RENESAS_DELAY ~= 500ms */
+#define RENESAS_CHIP_ERASE_RETRY	500000	/* 500000 * RENESAS_DELAY ~= 5s */
+#define RENESAS_DELAY			10
 
 #define RENESAS_FW_NAME	"renesas_usb_fw.mem"
 
@@ -407,7 +408,7 @@ static void renesas_rom_erase(struct pci_dev *pdev)
 	/* sleep a bit while ROM is erased */
 	msleep(20);
 
-	for (i = 0; i < RENESAS_RETRY; i++) {
+	for (i = 0; i < RENESAS_CHIP_ERASE_RETRY; i++) {
 		retval = pci_read_config_byte(pdev, RENESAS_ROM_STATUS,
 					      &status);
 		status &= RENESAS_ROM_STATUS_ERASE;
-- 
2.47.2


