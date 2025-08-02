Return-Path: <linux-renesas-soc+bounces-19947-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E18A1B1905E
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  3 Aug 2025 00:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CF5A3BD7FD
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Aug 2025 22:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D14020F087;
	Sat,  2 Aug 2025 22:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="T88hOOiW";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Xw9HYj9k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4847E1CD0C;
	Sat,  2 Aug 2025 22:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754175351; cv=none; b=ZJPWwCGsVpHbE270eUueyFQUT5E3W62TpVxfAI3jhSjanelq/BG1kAXYdaT9opL7y4S9kKGj2nqEN7pQqAhHl6u4PRDviu4SlKAhwkl6lyJKU5byTWg2GWXukxpAd7UMpzEjNCSk5WDY6SLOd3nHlkASGGstT6XoCbnJ657ovS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754175351; c=relaxed/simple;
	bh=mcoIeUhDbvv3rRGcTLHi9T32RBnZncjOp7HbE6nEJds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IpI4ZlBduznkI2bsMqLpPqc6WB29YtoUsNLQrCQA0gqbpSU5ES46+y1990CWa18FbnWxjBqkwgDzezlIuGam0xuq/OrtpvdJRYm3rfRWyw3hpG/Px8MqcvTRg8PZCBzxoh7sCLBaB5+/KUmOYprLHqE75xDtUqiS5ds9lhePLfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=T88hOOiW; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Xw9HYj9k; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4bvdTH39p8z9sNw;
	Sun,  3 Aug 2025 00:55:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754175347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2B/OQg3iHvjm61qBBm/qDHwD74+4PFBfEeYUWA+yqmw=;
	b=T88hOOiWcUhMfWgmrwZ2G0s/qIfvr4rWc9uY3NuNy5NYNaBxKcRJ2OfCREICTL/Gn6xV4L
	XJffPItBEgy5TduXobppqtouc/AogN3g6E4LFenJoEjYvFZnr1P54I/ocgk9UraN6bAIk6
	EJJMQRXmt9jduWg3SK0S3/8m9StwEvs9kDtemz25Ocd06ai0TaGBPPLbgBiyKnvG213jhb
	2x+Pp++/Y2L69mAyS2kO/y5axjUObUybvlHUvyCpSGtKhrGj9l64JbzhePJJE7q3NDX0jl
	pX4CuH5DUSfhwB5FE6l5gLtgLgI+aYm/jZbjSaNuANBvEcfqgD9DxgT8zA72cA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1754175345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2B/OQg3iHvjm61qBBm/qDHwD74+4PFBfEeYUWA+yqmw=;
	b=Xw9HYj9kmhEWcmumOuBUXlhPeZHsPsev23vPJwdBfdvVAY4qIfy/6BCC/8CnnoUxNoOWOm
	BRfw3KDJg39JR3x99RK76KuL5oUZI/T5z3kfZxpgmnWbXdLcBCkXQc7gTSIXgXYdZcMZxi
	o9WN4Xxpa0Km/NvcQPnj+M9M1c1UJewdNS7JJ84Z9Hm0pW32Kclxf/Jq+vQlrfSc0VyAow
	f4s9A05CZ2pp0m0VX6y4iP4XhNMVeE2s468TmtmKG3B7kfwSoMV9Tqzq20X6sgctJSeV+H
	C3/6jjXLrBj6dWIzffxhC553JVb1e8lxkCFmyPcVwTVmLveE/KxxdpeZzKZwrA==
To: linux-usb@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	stable@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Vinod Koul <vkoul@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] usb: renesas-xhci: Fix External ROM access timeouts
Date: Sun,  3 Aug 2025 00:55:20 +0200
Message-ID: <20250802225526.25431-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bd15e82ba860b769c05
X-MBO-RS-META: keskpoiuodqs9u55jk6iutuoijzn9ihr

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
Cc: <stable@vger.kernel.org>
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mathias Nyman <mathias.nyman@intel.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
Cc: linux-usb@vger.kernel.org
---
V2: Move Cc: stable above ---
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


