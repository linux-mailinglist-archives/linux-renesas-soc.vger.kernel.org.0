Return-Path: <linux-renesas-soc+bounces-32852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NziBpWADWosyAUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:36:21 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB4658AE03
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 11:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FCEF30E4B24
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 09:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC003B9DB3;
	Wed, 20 May 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITdwCMLW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7000F3AF64B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 09:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779268279; cv=none; b=W60kSaEh7xM9VzCmXBhAECWaSPIi16xwUM8u1dDrHoGOtUuHI/uLCnd6wnf+fvjnb/3huAcfb1bdq0kCNOBJPfHleIFrqI2cbmuU3gc24xVeGhxa10H7amvXCnTLk9AEtfAxEKt25O8dGhz1F0dcMhlPyUjBd1GHoRXdE05qssk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779268279; c=relaxed/simple;
	bh=1/7IxJyjpTfBJFV/yq5BJwTYOwEn7vDhfSJH6+kbVC8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RlW4Ppagr+JyC8g0q53+oTTWv0NCUMI9QHBmxYyU8/pQrr5rrOsHlk+JZ825U/0RcwZBeHzW75ypaRyApSfJEUmW0NdJJ0/kjlDG9yP5bJUCKpqH+ij37Alc2VkFkCPyLkQxykuuHZlvVUQ8dNbqzEe9Cs8E2BuDZT6pJsPlFhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITdwCMLW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so35348035e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 02:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779268277; x=1779873077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YqPCtrbA/dvAY78m4Gz/YYvnD1nvK6Kz3sBWRMCrN/k=;
        b=ITdwCMLWGBUGMGfpv2S5nAajROlK4eM6CKTqDiJUtiIS1cB0jk7cd+jzaIKPKhVUXt
         QmWP119hLUhOxvNTgh1M0zCGITDb+VnzwlmaNs0OwWbKqrrycaRDI2JuPuyw6fwNweCp
         NEAaK32+trQXhu5PofgLLmmncIs3sl0tOCXEv+vg6EdzmMXAZsVzFtOnjIG5zQ5N1V/D
         kjm0Jea5/Xh2H4yurtJqlq6Gjpa8lstxQPQcM2zYWhX3NBWeEEZ/88ISFBO7rmhrk2EG
         oRuxyPM/cV4jHqEGT3zZ5t1L651RBlCTHKZ1w3Ptx1JgOe/hNseTHA7tT0/1rKTwtq72
         sZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779268277; x=1779873077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqPCtrbA/dvAY78m4Gz/YYvnD1nvK6Kz3sBWRMCrN/k=;
        b=pRcjDZ50NVtUiPCrS1fEZ8UJH72/k9veHCKKldev5fH0dFGA6uue73JvWwY/IRsB6p
         ii7EoJqIt8wUuTaV7cM8vFD6ckazT9I4tepOjtVelYt3fkAJpnO0Q3XwLckJ392qP01g
         EIj9COD+WWk3qbhbrZRc7o8SFhW9bUDIFMFMVV7WQhfn4MMvCYYRtuzjHOyM9l3zExuH
         NjQeoebZ/JWjvYyNoSAeutzSAzbELbewTQ3OuJTS6nTjDNyNlcqQUHZ+uZ1SxJhwHVl4
         S0+/mQ+GjZ0a2jqleIb+P4Da/EiFTXLrmnd95FOkMaQqsL5HNvV4YXDGPSBC0OrNVOpc
         Mj7g==
X-Forwarded-Encrypted: i=1; AFNElJ/KRaLUhr8ewgbwhpNvXFPvi9NpNS493tjUo24bat4h8s1JXEURm+HrCmN4/QYyDWUTypwDu92xkmhGuxjXEWy2ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIrs4GDhjiBdFVS8RYE1BKBFtlbGMytnoVLZgkrNGk2UxDbbQP
	BCOr83MlqzC80XjB2ySkPv2XkwPRoE7LrzyQOCGcX9qla3ZHn+eutEKJ
X-Gm-Gg: Acq92OEHTK58q+OYDnz8X4qIDLzctarqTHsHt8DxnKSXRP2KXknl0kyLlPy69A8Q2z6
	+oKfUa2WcJFu84ycSuePFW28/Up9h6/XhghLRFACY6Ch+X/SOE5yGwuxfGN46MEcJDxCIRxDD2H
	wxPOajAMh1iAWB7y2sfjpijbNdQRZc/rBzZG4XpSnjbJ7ElHDSlDJcCL8pQJGuxAaipNXNGlz3i
	FdjuuWYAi5vNFqvrDBwSDo/YOJIBiVCzxyozqD3vas/rIeRHHi6kTbwwywn/0ParXYSGaxFhq6x
	Ftpd+3Lgf46qM2oG4m2DRcGuxs9PCnZ/N2sznbSdvo92B+K5dM24m2iOMMnSj9dmXx3SW7XFeWC
	5j7WwkMLhHRuubk8bcs+wU1/8zSv8YC2eW22fVAHqKL2q2GSBOsivHtqL1I+g2L288ynKCKxrFq
	VvxPAwF5pvWg6UuvueaGqXRTU9a7LDtLdGxhGyhjcB6fCnTRTX3qdjWyV3RGhbbpEkOb2tSn1TD
	ocMOIDWgPJ7UHhflZQOmCb3Gt7vplQr2zZOjQ==
X-Received: by 2002:a05:600c:34d4:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-48fe6626a58mr368205225e9.32.1779268276515;
        Wed, 20 May 2026 02:11:16 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:dcb8:81c1:dc9e:cd68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490225bf8d6sm76409715e9.13.2026.05.20.02.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 02:11:15 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pci@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] PCI: rcar-host: Remove unused LIST_HEAD(res)
Date: Wed, 20 May 2026 10:11:11 +0100
Message-ID: <20260520091111.67666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32852-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[mailbox.org,renesas.com,kernel.org,google.com,glider.be,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,bp.renesas.com,renesas.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 6EB4658AE03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the unused LIST_HEAD(res) declaration from
rcar_pcie_hw_enable().

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pci/controller/pcie-rcar-host.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rcar-host.c b/drivers/pci/controller/pcie-rcar-host.c
index 213028052aa5..cd9171eebc28 100644
--- a/drivers/pci/controller/pcie-rcar-host.c
+++ b/drivers/pci/controller/pcie-rcar-host.c
@@ -346,7 +346,6 @@ static void rcar_pcie_hw_enable(struct rcar_pcie_host *host)
 	struct rcar_pcie *pcie = &host->pcie;
 	struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
 	struct resource_entry *win;
-	LIST_HEAD(res);
 	int i = 0;
 
 	/* Try setting 5 GT/s link speed */
-- 
2.54.0


