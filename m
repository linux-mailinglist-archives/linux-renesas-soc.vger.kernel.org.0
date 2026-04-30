Return-Path: <linux-renesas-soc+bounces-31773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBAwOFAL82mSwwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 09:57:04 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD6749EF5B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 09:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06FEF300CE54
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 Apr 2026 07:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4A434A773;
	Thu, 30 Apr 2026 07:57:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9443D9443
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Apr 2026 07:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535822; cv=none; b=nHyIMC7ntJj+0cGnEB1uolA/Us2vaS3YSPn43BklOMwBC85WCcf31eV9CfqBRAim7X1VLo7ZcUks+LApKTfeBVCy6BU2IgMtpsoyNuFbqd0J1X3zx6NEOxcI6tfFKLxa7ZpuRnItzyGeDzsS79abZaKyIk/SvgZ0EzlEfZB9mLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535822; c=relaxed/simple;
	bh=S0ihjKkcBn3xomo0TkGvY2pk9aiL3v1pV3jfmooNhR4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZqaIV8i7pGujx83VdwyIynh6KY5z68y7L+32qjC6PhY0kW/+y9NLvXPTxENx5IbRNlohDKuTk8FYh2St50WSAByk28d93YcKMSn5m3+NFzXTbjkQ59K8/kuftUAAIdvnQBsHaeYl3q4usbPx7Dy2yVREEvNLK5IaK4XgovKajGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88578C2BCB3;
	Thu, 30 Apr 2026 07:57:01 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v7.1-rc1
Date: Thu, 30 Apr 2026 09:56:54 +0200
Message-ID: <33e5562de46405d41ea55cee0ae781c02a75cdc6.1777535762.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 5AD6749EF5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[glider.be];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31773-lists,linux-renesas-soc=lfdr.de,renesas];
	FROM_NEQ_ENVFROM(0.00)[geert@glider.be,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.118];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:mid,glider.be:email]

Refresh the defconfig for Renesas ARM64 systems:
  - Replace CONFIG_PCI_PWRCTRL_SLOT=y by CONFIG_PCI_PWRCTRL_GENERIC=y
    (cfr. commit ff124bbbca1d3a07 ("PCI/pwrctrl: generic: Rename
    pci-pwrctrl-slot as generic")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 792d5ebb1553ef30..8341dab1cf1c023a 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -119,7 +119,7 @@ CONFIG_PCIE_RCAR_GEN4_EP=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=y
-CONFIG_PCI_PWRCTRL_SLOT=y
+CONFIG_PCI_PWRCTRL_GENERIC=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_DMIID is not set
-- 
2.43.0


