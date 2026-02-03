Return-Path: <linux-renesas-soc+bounces-27854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPLiJIomgmnPPgMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27854-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 17:47:06 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB04DC36C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 17:47:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E18563042ACB
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 16:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168053B8D5F;
	Tue,  3 Feb 2026 16:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QnV0Uxno"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C1E395D99
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Feb 2026 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770137193; cv=none; b=Y8FnlMLbVBl8SNEMtPnsghGqLa5yTbpYgtzSY2YrAmkSTJ82roGeUSQFt05FYN3XCGwCjjBNALzyxyJuFVVfDqdO6MccDjH6lxAhq8pGTPdmh5EUwZ1i1nLhdYwtKE2GyJjva3k2P77YXzdY+yHr2JbunbLxyn0qqYv/cviDaEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770137193; c=relaxed/simple;
	bh=Gi1htnYpLsbfBZ4uIWrPR1buObmElY1r/sNxGV1Nc04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=h4vmdPPEJ2hq9JVlYubAhYoi8WDZRNnfgMa9cV9IXlWWt5IRhwd4cgq2xcKOIhgvERD82PkLBitZYfA7s5mPUlxDhVEhjV2GIxzTipGgQwwh74Ro3otApLUjFqXPG2+rpjqD53XTfoqlsSrSUUA55ioGYxotYRRJ39IfwnVHZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QnV0Uxno; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-352e2c59264so3794137a91.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 03 Feb 2026 08:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770137191; x=1770741991; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=49b0/xPdvxtHrk0c1rp4r1O+40H+pdifaRAqxA1I5XM=;
        b=QnV0UxnoWMicq7tyxI6fcbcy+3g86q779zFaRY9scFsiksuQBsZi/XcYM67Fo7NH+t
         BEjX0UCE4gha0yVzTIZErhVIsikH0ieb534TDt4bjO3qel0fjyVsML3lUOoDzlOpQn2l
         YAL7nrwigVeYa0i5ubxPUFXm/joaOSnc8xEYAJ5/ozBFItL7sGPpc+P+vprXqYs42HsX
         MEcdjt7qKe49+7blDZog+YRCNOlPr8gi0qxOg1ytQLsmfiNjKhHK+hvy+rbsOAkB+Rcr
         D0uQ5Ej62hf8cScGe4qBx3pyEQAe7Ra5TZILITlKB/XZNXab9qtu1kbh0HhBLGizGNa+
         k6gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770137191; x=1770741991;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49b0/xPdvxtHrk0c1rp4r1O+40H+pdifaRAqxA1I5XM=;
        b=AzlJiy3FdmgFA1OJSsO3IexjiIH4fuCuP189tAus4j3vBHnPnJFeDcDnT+mRsaghk2
         2FUTRlAZLZ1vjZqT8u6EnuGbIag+xVD1Se4bQBBZBoumzabgrBeW0g3pMTX+jucgu+Bj
         IVdnNjxWtTNdnAsNaedEPFpAV2qzweqUAZbeltVT7MoSE8tVc4M5SdjRNgiweZbRuecu
         4N4B5b8XQW7C/seOpCjfziWqJmXfqU4PUrR7LzQFgOy4mcthFzfja0j+aBVb8WyRGwSW
         7ViYTHA54dQ+CejFKtX1nizhXH57efzVo1SMsBTsc7tej/6jzyf4Jh2XAcsP+WXk36Ad
         EIqw==
X-Forwarded-Encrypted: i=1; AJvYcCVqjivmNn+Nkk5/Fm9vVh12Jnn0V+ZnrMwJQBY9jkwfzPyrvTQrSlVNzeMEt5P2VN+tq6NhOeRkcylijH1yKVXPPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYDGpkvQOtSHs4+qd2NoOluw+FBHu5xBDK66smStXYhDi6OJue
	tRpKUMdbMKmmQOMjJu1P+oTK6X7lNIfz7KrmZ6eLvDJUr04nHzuk7kfP
X-Gm-Gg: AZuq6aLr0CLmhKq2D2lR1/UThuzQHE6YFIO6yBb2FV4lkE4SILmxrzyytGulD0S0N4z
	AT/axawGwXXIf/Hu5aXYVrropP6ANFA9Ovyq5Xo73GXOCIzYfMxIi9Z8fgEJXmuZFe0S6JrUsvQ
	XJl6jnMgXrPHgsMtlBNnvAFvHJy0/qyQJIU+pq9ZGNTmdgyxA5q1gzzLhBYsP595jNa7gcQS9/t
	GVWQyeoko+hN2pcAsGVQ3NPLpgD9rwbIlRPp3ZOE8AMXokRUDZUz7RS6mYl0R1DsLSoLcNkwm9j
	vm5/+ygmQ+FOkEyMfjjQk+HGEs+Bfh5o/FhtquCjZlSQY5WNpDMxZLwIl2y/T9DvBgeeiracJ2Z
	3TqGa64oa6XiYhS5EtG0m1anM4kjubfMwMjy7UOiz3n6m9CVoyJi/yYaWf1oE4RDDg9hdlfX38x
	d1TcxUEBmbnnwgFwAEXcrYooBljg==
X-Received: by 2002:a17:90b:4a07:b0:353:3934:1449 with SMTP id 98e67ed59e1d1-3543b2fa68amr14816121a91.12.1770137190912;
        Tue, 03 Feb 2026 08:46:30 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9008:ba52:f091:7dff:927e:f788])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3548630df97sm106070a91.13.2026.02.03.08.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 08:46:30 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 04 Feb 2026 00:46:24 +0800
Subject: [PATCH] PCI: rzg3s-host: Fix device node reference leak in
 rzg3s_pcie_host_parse_port()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260204-rzg3s-v1-1-142bc81c3312@gmail.com>
X-B4-Tracking: v=1; b=H4sIAF8mgmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIwMT3aKqdONi3aRk82Qj82QLg0QLSyWg2oKi1LTMCrA50bG1tQA4zyJ
 XVwAAAA==
X-Change-ID: 20260204-rzg3s-bc7c27c80a89
To: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770137186; l=1372;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=Gi1htnYpLsbfBZ4uIWrPR1buObmElY1r/sNxGV1Nc04=;
 b=QpftaQ90i7I2mrQt51hu+ZGKUrMhiL5YyUKtGGs6kgS9XmS+vYOGSatMhKV8YPfb6BW2t3g05
 4gTTZVgcPN2B12jL9lxZqbOXsACPvnu4BJu5BJkivg2ydwezA9D89i2
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-27854-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FREEMAIL_FROM(0.00)[gmail.com]
X-Rspamd-Queue-Id: 3EB04DC36C
X-Rspamd-Action: no action

In rzg3s_pcie_host_parse_port(), of_get_next_child() returns a device
node with an incremented reference count that must be released with
of_node_put(). The current code fails to call of_node_put() which
causes a reference leak.

Use the __free(device_node) attribute to ensure automatic cleanup when
the variable goes out of scope.

Fixes: 7ef502fb35b2 ("PCI: Add Renesas RZ/G3S host controller driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pci/controller/pcie-rzg3s-host.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
index 5aa58638903f..2809112e6317 100644
--- a/drivers/pci/controller/pcie-rzg3s-host.c
+++ b/drivers/pci/controller/pcie-rzg3s-host.c
@@ -1142,7 +1142,8 @@ static int rzg3s_pcie_resets_prepare_and_get(struct rzg3s_pcie_host *host)
 
 static int rzg3s_pcie_host_parse_port(struct rzg3s_pcie_host *host)
 {
-	struct device_node *of_port = of_get_next_child(host->dev->of_node, NULL);
+	struct device_node *of_port __free(device_node) =
+		of_get_next_child(host->dev->of_node, NULL);
 	struct rzg3s_pcie_port *port = &host->port;
 	int ret;
 

---
base-commit: 193579fe01389bc21aff0051d13f24e8ea95b47d
change-id: 20260204-rzg3s-bc7c27c80a89

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


