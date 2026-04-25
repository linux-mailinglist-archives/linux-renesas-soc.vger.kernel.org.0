Return-Path: <linux-renesas-soc+bounces-31659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPD8HphQ7Wn5hwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31659-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Apr 2026 01:39:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 80766468584
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 26 Apr 2026 01:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 692B03001A57
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Apr 2026 23:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17ED6396579;
	Sat, 25 Apr 2026 23:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="AurzOrSo";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="g6eecBUm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F20288AD;
	Sat, 25 Apr 2026 23:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777160337; cv=none; b=ejTvLH95CYprpIQovRt8Wmq8v5S7rb9eHJxQSWt2KmS6tGN79xp8Wv2SLgY5oYoxNRMQZUmWYXJFDst/lKsJGbPIA3W9GLaanYUlGe2dpFH7OSVtW6jo6Zsp7LTKPtLkvc17UU3tYO/PNkpZ1VWUhOSIIJtsFYXluYmUXXpZOCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777160337; c=relaxed/simple;
	bh=kfOjTCZ/WD/9yCW5AWc3k+LiKZnkPI4OkmQxEMM0K5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sPgn3zlPt7RHuF6U6Hn9N3CL5CMYrUtdPjCgIiQGPV/Wo6KQ6eYZZBMwwbtVDd4ej957/CC/38EqlHhzvV3bwCYz5Z1aY7I0BpaFZVMl2wYzBJ1h+20LPhDpG/J7KMxojeM6orz4wHBwdQchY9Jefr/S/OaqwyKEjFJS5v7saBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=AurzOrSo; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=g6eecBUm; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4g35rD3DHSz9tf7;
	Sun, 26 Apr 2026 01:38:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777160332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sAz7g1dUi5hi0b+215Mn7DEKA29E+hd6TPfNhohZZAY=;
	b=AurzOrSojFAvdt1g48mMPvzZRwJFPN3kNgApXaR80getd4hrWqwvXxyDdvG16Q9a0sAK1Z
	bqL2MH2bHvdKrz4zaBbcXy9/OdrYIXLL3fJ4Eg0v2IWxpGc+zt1ZY4K2Fsi2Y0dbaT0ILT
	HV8ceUr3xQO11jO8im3cwZ/ZrErA3IAGzjjOOJqWV3DY8xQrTPDWrkNyv9/KjUiweFEuDS
	M280Ce6Q42MFvPjhkVuNPYoBzdXsRZgc5pXTVPNf/ISVgceWMR2OMXXJAB2+pbtFrANylE
	MkNkd9dfwaYCxVHDUmBpDMeg3eRP9GQNofcm6C4e9hHBXrDiS0SviLJQb1K9pQ==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1777160331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sAz7g1dUi5hi0b+215Mn7DEKA29E+hd6TPfNhohZZAY=;
	b=g6eecBUmvcWtI59d4IpWU1TpbMNTB5i+jzsa0jQE+2d6U9w8EmjsR+UdJRkTGA6quZgmOn
	oRYXLTiYA0Wo5/1tQkoOTfnYX48hN1/bcrk1FhFJxnFHYBbU2wkrCIDvHfCTne02qw4Vrl
	1XP4qfWugCp1YNBdBpxSCJEYp3VXmN3nytWSiYPhO+fawEJZlTlIqhV7zqAphqUEXmBHxx
	SqGSW1weZXcTcCPU6jNBHRhKFivMNjJDXppqyBXE4xfEYBQN8NjA7P7fgIG21wV86z7tBc
	p0gHhGhpmRSAjOVcxM/4oUJ/h421aZM1QFV2CsTT6dKRyUIKFf3j1v9j22TCGw==
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
Subject: [PATCH] PCI: rcar-gen4: Limit Max_Read_Request_Size and Max_Payload_Size to 256 Bytes
Date: Sun, 26 Apr 2026 01:38:28 +0200
Message-ID: <20260425233845.459175-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 457bd6f4a564d15300f
X-MBO-RS-META: r11zh8f91w5eo8fpxks54nrjtcmwxayk
X-Rspamd-Queue-Id: 80766468584
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-31659-lists,linux-renesas-soc=lfdr.de,renesas];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mailbox.org:email,mailbox.org:dkim,mailbox.org:mid,renesas.com:email,valinux.co.jp:email,glider.be:email]

R-Car Gen4 PCIe controller has a hardware limitation of 256 Bytes
maximum payload size. The PCIe DMA generates requests of size up
to minimum(Max_Read_Request_Size, Max_Payload_Size). Force limit
both Max_Read_Request_Size and Max_Payload_Size to 256 Bytes and
propagate this limit to all downstream devices.

This limitation can be triggered for example by using an NVMe SSD
which does not use host memory buffer, Samsung 980 PRO is such an
SSD. Affected SSD reports 'hmpre' field as 0:
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
 drivers/pci/controller/dwc/pcie-rcar-gen4.c | 56 +++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 8b03c42f8c84c..82f0a074a71da 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -576,6 +576,7 @@ static int r8a779f0_pcie_ltssm_control(struct rcar_gen4_pcie *rcar, bool enable)
 static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
 {
 	struct dw_pcie *dw = &rcar->dw;
+	u16 offset = dw_pcie_find_capability(dw, PCI_CAP_ID_EXP);
 	u32 val;
 
 	val = dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW);
@@ -584,11 +585,66 @@ static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
 		val |= BIT(6);
 	dw_pcie_writel_dbi(dw, PCIE_PORT_LANE_SKEW, val);
 
+	val = dw_pcie_readl_dbi(dw, offset + PCI_EXP_DEVCTL);
+	val &= ~(PCI_EXP_DEVCTL_PAYLOAD | PCI_EXP_DEVCTL_READRQ);
+	val |= PCI_EXP_DEVCTL_PAYLOAD_256B | PCI_EXP_DEVCTL_READRQ_256B;
+	dw_pcie_writel_dbi(dw, offset + PCI_EXP_DEVCTL, val);
+
 	val = readl(rcar->base + PCIEPWRMNGCTRL);
 	val |= APP_CLK_REQ_N | APP_CLK_PM_EN;
 	writel(val, rcar->base + PCIEPWRMNGCTRL);
 }
 
+static void rcar_gen4_rc_pcie_quirk(struct pci_dev *dev)
+{
+	static const struct pci_device_id rcar_gen4_pcie_rc_devid = {
+		PCI_DEVICE(PCI_VENDOR_ID_RENESAS, 0x0030),
+		.class = PCI_CLASS_BRIDGE_PCI_NORMAL, .class_mask = ~0
+	};
+	struct pci_bus *bus = dev->bus;
+	struct pci_dev *bridge;
+
+	if (pci_is_root_bus(bus))
+		bridge = dev;
+
+	/* Look for the host bridge */
+	while (!pci_is_root_bus(bus)) {
+		bridge = bus->self;
+		bus = bus->parent;
+	}
+
+	if (!bridge)
+		return;
+
+	if (!pci_match_one_device(&rcar_gen4_pcie_rc_devid, bridge))
+		return;
+
+	/*
+	 * R-Car Gen4 PCIe controller has a hardware limitation of 256 Bytes
+	 * maximum payload size. The PCIe DMA generates requests of size up
+	 * to minimum(Max_Read_Request_Size, Max_Payload_Size). Force limit
+	 * both Max_Read_Request_Size and Max_Payload_Size to 256 Bytes and
+	 * propagate this limit to all downstream devices.
+	 *
+	 * For details, refer to:
+	 * R-Car S4 R19UH0161EJ0130 Rev.1.30 Jun. 16, 2025 or
+	 * R-Car V4H R19UH0186EJ0130 Rev.1.30 Apr. 21, 2025 or
+	 * R-Car V4M R19UH0217EJ0100 Rev.1.00 Dec. 12, 2025,
+	 * chapters 104.1.1 Features and 104.3.9 DMA Transfer
+	 * section DMA Read Transfer.
+	 */
+	if (pcie_get_readrq(dev) > 256) {
+		dev_info(&dev->dev, "Limiting MRRS to 256 bytes\n");
+		pcie_set_readrq(dev, 256);
+	}
+
+	if (pcie_get_mps(dev) > 256) {
+		dev_info(&dev->dev, "Limiting MPS to 256 bytes\n");
+		pcie_set_mps(dev, 256);
+	}
+}
+DECLARE_PCI_FIXUP_ENABLE(PCI_ANY_ID, PCI_ANY_ID, rcar_gen4_rc_pcie_quirk);
+
 static void rcar_gen4_pcie_phy_reg_update_bits(struct rcar_gen4_pcie *rcar,
 					       u32 offset, u32 mask, u32 val)
 {
-- 
2.53.0


