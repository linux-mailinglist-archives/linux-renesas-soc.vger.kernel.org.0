Return-Path: <linux-renesas-soc+bounces-32838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNm4EZC/DGqJlgUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 21:52:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CE3584595
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 21:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3F0FC3022FF1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2026 19:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 374463AE18C;
	Tue, 19 May 2026 19:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fvLphWla";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="eVPIpxu3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612813ACA42;
	Tue, 19 May 2026 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779220363; cv=none; b=DDsUMcECS42F0ZOdV/FqMUu+viWbZ/VX9Xhknxt5lwGA3xWiJToObgqRqCHbhSHBDB/T9f7P7z6NXCcqopkk+u7exOk8C4Y+sIKXvhUPItm/Gk2yJxCGMCFWBEYd+yp7LPdkNLumJ20kj8mMOZHzmkPazh45/IcbhgWY2da0vio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779220363; c=relaxed/simple;
	bh=SdXZVxKDS/E22tM60k2sCFv0iWcUBjCeDq8WfJ9NFwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=a1PI63ocFT1+kdTI6XKFgCgw0TXVPIighqAFYGS1QI86TX23HjdE9cDiIrYM2xmPfuq5acWdjXh2UtRAJVO1A5xLjAsTxgjxHa3I7CltDv+kQEBdjQy4h8L2uwKO/AJ4xPBxGzkt1kG/JeKGDCc5jZ6XomG+TBU8PwXHDHQhWEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fvLphWla; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=eVPIpxu3; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gKlgz6NX9z9vZM;
	Tue, 19 May 2026 21:52:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779220351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6+gHbvvlhDemo3w9adfFUwk9pQ6tK8KAjIOj3e4wzKM=;
	b=fvLphWlagDBdTtnoDJj5sKKo2BifUn7BFweLnIiyBTxOTaGwI5+qWtbdwfxE/104skmNVm
	2DN60Y7/JmFf6WscglwJIE/ZgdgPvK7gfbwsHYOdRBr0tJwHz/PjBcKtZNAwdKuyHs2It6
	ZbMsdEh/R+Sb+ru/u6TjORd70vO/eWRl48zEhGCZhuJiviA/qPfXKQCAs+BlmGEQUcZ7sH
	5VOSeTzYk9hacOY0ZSW83F50q9iM/gmmwj7idoXwa45oMY8y2wJARfIytwbEy5hrhFh7ok
	9zEXe4dl67NNS8IU+oF1mEGFcJ5KDfLiZYN/hCO7tx3t2wbQkFL5VGZsZSc90g==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=eVPIpxu3;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779220349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6+gHbvvlhDemo3w9adfFUwk9pQ6tK8KAjIOj3e4wzKM=;
	b=eVPIpxu3La2lPp//8dopxrDiUtv4WgrACZaJuLWaNLSMUPhfdsQhSuYUY4GJFp/aFENPM6
	VsGmDO5d9ifKWWF4zo2NhKdPtjaz3x7Ey4mK920TaQ1kpyZtSEleBhmbureYBqgzau8ikm
	ua8Zj2OlwV4ivoH+oaj3uC5SO6SV9j+tfyb3OMj0OeEHFKOa4MeiuD/smt6Wpy6K8YL9Oa
	GdN5BFkn4w690+49UtxUyuu2CCEpmy2j1XTNEvlfQbF+SWNdhJav/YYQ1gSaXPNzzwDvay
	84vYCMiZyH4Eed/bOV8M9aIbXbutelb95ZmCRvi9kWFpULVLX9HQP197i2MRoQ==
To: linux-pci@vger.kernel.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	stable@vger.kernel.org,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Koichiro Den <den@valinux.co.jp>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] PCI: rcar-gen4: Limit Max_Read_Request_Size and Max_Payload_Size to 256 Bytes
Date: Tue, 19 May 2026 21:51:13 +0200
Message-ID: <20260519195219.189323-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f04e75fb567f9f9b0a0
X-MBO-RS-META: wus7jgw9quh84oma7m16itugiwa3uu39
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32838-lists,linux-renesas-soc=lfdr.de,renesas];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[mailbox.org,vger.kernel.org,kernel.org,google.com,glider.be,valinux.co.jp,gmail.com,renesas.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marek.vasut@mailbox.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[mailbox.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim,valinux.co.jp:email]
X-Rspamd-Queue-Id: 44CE3584595
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

R-Car Gen4 PCIe controller has a hardware limitation of 256 Bytes
Max_Payload_Size (MPS). PCIe specification indicates that the MPS
must not exceed minimum MPS of any element along the packet path.
Force limit Max_Payload_Size to at most 256 Bytes for each device
connected to this PCIe controller.

R-Car Gen4 Reference Manual, chapter 104.4.8 Usage notes for
MRRS (Max Read Request Size) states:
  Please set "Max Read Request Size" to 128 bytes or 256 bytes.
  If "Max Read Request Size" is set to anything other than the
  above, the transferred data will not match the expected value.
This limitation also seems the apply to devices issuing MRd TLP.
This limitation can be triggered by using non-HMB NVMe SSD with
Max_Read_Request_Size 512 Bytes, for example Crucial P5 Plus.
Any write into the SSD (MRd TLP issued by the SSD) longer than
256 Bytes wraps around at 256 Byte boundary, and the same data
are written into the SSD starting at offset 0 and at 256 Bytes.
Force limit Max_Read_Request_Size to at most 256 Bytes for each
device connected to this PCIe controller to avoid this behavior.

An non-HMB (Host Memory Buffer) NVMe SSD can be identified using
the following command. Affected SSD reports 'hmpre' field as 0:
"
$ nvme id-ctrl /dev/nvme0 | grep hmpre
hmpre     : 0
"

The symptom is a read from the SSD which wraps around at 256 Byte
boundary. The test for this symptom can be implemented by writing
512 Byte of random data into the SSD and reading the data back. If
the read back data repeat after 256 Bytes, the device is affected.
"
$ dd if=/dev/urandom of=/tmp/data.bin bs=256 count=2 \
  dd if=/tmp/data.bin of=/dev/nvme0n1 bs=256 count=2 \
  dd if=/dev/nvme0n1 bs=256 count=2 of=/tmp/readback.bin
"

Expected data:
"
$ hexdump -vC /tmp/data.bin
00000000  97 81 b7 3b 0e 38 2b 4d  a7 d3 e0 47 ff c2 4b ca
00000010  c1 85 98 f0 4a ac 03 a0  3b ab f3 19 44 dd 06 8b
...
00000100  7a ce 3c b2 e1 d5 d9 11  88 63 10 59 76 3c dc 32 <-- random
00000110  72 32 2a 7d a3 e1 aa 13  7c da 58 a1 7b 21 11 50 <-- data
"

Faulty readback, collected without this change in place:
"
$ hexdump -vC /tmp/readback.bin
00000000  97 81 b7 3b 0e 38 2b 4d  a7 d3 e0 47 ff c2 4b ca <---.
00000010  c1 85 98 f0 4a ac 03 a0  3b ab f3 19 44 dd 06 8b <-. |
...                                                          | |
00000100  97 81 b7 3b 0e 38 2b 4d  a7 d3 e0 47 ff c2 4b ca <-:-+- repeated
00000110  c1 85 98 f0 4a ac 03 a0  3b ab f3 19 44 dd 06 8b <-+--- data
     ^^^
      |
      '--- Repeat starts at offset 0x100 = 256 Bytes
"

Fixes: 0d0c551011df ("PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode")
Cc: stable@vger.kernel.org
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Koichiro Den <den@valinux.co.jp>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-pci@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
NOTE: - Possible EP mode limit of 128 Bytes is currently pending
        documentation team input
V2: - Dispose of the reprogramming of MPS/MRRS altogether
    - Dispose of the entire fixup quirk
    - Replace both with bridge enable_device hook
    - Limit MPS/MRRS along the entire packet path to follow
      MRRS limitation requirement
---
 drivers/pci/controller/dwc/pcie-rcar-gen4.c | 51 +++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 8b03c42f8c84c..9fe34ca7ce532 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -305,6 +305,54 @@ static struct rcar_gen4_pcie *rcar_gen4_pcie_alloc(struct platform_device *pdev)
 	return rcar;
 }
 
+static int rcar_gen4_pcie_enable_device(struct pci_host_bridge *bridge,
+					struct pci_dev *dev)
+{
+	/*
+	 * R-Car Gen4 PCIe controller has a hardware limitation of 256 Bytes
+	 * Max_Payload_Size (MPS). PCIe specification indicates that the MPS
+	 * must not exceed minimum MPS of any element along the packet path.
+	 * Force limit Max_Payload_Size to at most 256 Bytes for each device
+	 * connected to this PCIe controller.
+	 *
+	 * For details, refer to chapter "104.1.1 Features" in either of:
+	 * R-Car S4 R19UH0161EJ0130 Rev.1.30 Jun. 16, 2025 or
+	 * R-Car V4H R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 or
+	 * R-Car V4M R19UH0217EJ0100 Rev.1.00 Dec. 12, 2025.
+	 */
+	if (pcie_get_mps(dev) > 256) {
+		pci_info(dev, "Limiting MPS to 256 bytes\n");
+		pcie_set_mps(dev, 256);
+	}
+
+	/*
+	 * R-Car Gen4 Reference Manual, chapter 104.4.8 Usage notes for
+	 * MRRS (Max Read Request Size) states:
+	 *   Please set "Max Read Request Size" to 128 bytes or 256 bytes.
+	 *   If "Max Read Request Size" is set to anything other than the
+	 *   above, the transferred data will not match the expected value.
+	 * This limitation also seems the apply to devices issuing MRd TLP.
+	 * This limitation can be triggered by using non-HMB NVMe SSD with
+	 * Max_Read_Request_Size 512 Bytes, for example Crucial P5 Plus.
+	 * Any write into the SSD (MRd TLP issued by the SSD) longer than
+	 * 256 Bytes wraps around at 256 Byte boundary, and the same data
+	 * are written into the SSD starting at offset 0 and at 256 Bytes.
+	 * Force limit Max_Read_Request_Size to at most 256 Bytes for each
+	 * device connected to this PCIe controller to avoid this behavior.
+	 *
+	 * For details, refer to aforementioned chapter in either of:
+	 * R-Car S4 R19UH0161EJ0130 Rev.1.30 Jun. 16, 2025 or
+	 * R-Car V4H R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 or
+	 * R-Car V4M R19UH0217EJ0100 Rev.1.00 Dec. 12, 2025,
+	 */
+	if (pcie_get_readrq(dev) > 256) {
+		pci_info(dev, "Limiting MRRS to 256 bytes\n");
+		pcie_set_readrq(dev, 256);
+	}
+
+	return 0;
+}
+
 /* Host mode */
 static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
 {
@@ -313,6 +361,9 @@ static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
 	int ret;
 	u32 val;
 
+	if (pp->bridge)
+		pp->bridge->enable_device = rcar_gen4_pcie_enable_device;
+
 	gpiod_set_value_cansleep(dw->pe_rst, 1);
 
 	ret = rcar_gen4_pcie_common_init(rcar);
-- 
2.53.0


