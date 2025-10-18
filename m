Return-Path: <linux-renesas-soc+bounces-23271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA40BECFFA
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Oct 2025 15:02:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1054119A3C8C
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Oct 2025 13:02:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE75155757;
	Sat, 18 Oct 2025 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="lZgOdq7q";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="EsOBp9hT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB0C26F44D;
	Sat, 18 Oct 2025 13:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760792535; cv=none; b=EaSdsl4wYh8zh7ZJcq6dZDwH+ddGkYVqsY26HsMYZ0ogo8Q/8Gh5Nc1Hu0aM8aB/9d32I2drvpoHR36mz76s8osY3WZahZrUMrZXTqqFrBktXpX0qryYQDTX+8tGLHkcdmMgK1Nfr9aLd7AX9UWHMJpvk/7IMt1BwtAgil/Yw1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760792535; c=relaxed/simple;
	bh=OJHWw3lwjP+XvNFLX/8nxspBtXkVk0iv+LYYEFYs6Go=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WALmP1oeP2mj1ZgXOFA0ajRMTLUJ3fSXa4xg12uoHC5h0O28U4kVlnSG9cXACSVRisnGTIMqmknfmZGXSCGb7p09LvRGkOQBqi/1FHf2WjhyYtWc6dYvs0j22xAzG20Ucv6MxZJCAlCPIKa84gNJ/GqzTMwX/PIKvntHj9Mrk0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=lZgOdq7q; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=EsOBp9hT; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cphfp5wVgz9tBD;
	Sat, 18 Oct 2025 15:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760792530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GQ0yHalzrBek2P6lSI1ROigxcsxBptLn83AyCQzMWkg=;
	b=lZgOdq7qBFl79GAupPAzeVF0yIAF9m0LE4eQ18dGnZRAqJEfOE/7/DVeyXxOCMMqXw+lEn
	88HTHkcqTxXMBQCCw0aylcL8PprCMn85RnGSI7QVIGMR18Oo9KezQIMz+Vh3fXbnmwClvQ
	ljpRVdLjHCeToZ8qrsdOy6wprbJRJENMZsXLb/P7KLE8Z88ToH0l2JWAqiz3mu8T/k7Dqi
	atcefTH3QBSym7h98I3P0VXyvPtt2ZFemOMpdoDGuPUnzu2Y+AcV6l1G7Pc/BEsoplmzqb
	D26D87JuHPM9NorOY0z+MG8jqTaoO+4hGsTsCRojGcrmcMwD7UPVXOWk2m+7WQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=EsOBp9hT;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760792528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GQ0yHalzrBek2P6lSI1ROigxcsxBptLn83AyCQzMWkg=;
	b=EsOBp9hTgy8bP848oTczxHUj64D47YypanF/t/DQJE1O7jqUv8ktAZa+34PRAw8u/rSGlX
	LegfVw8qHrlppeLZ6DMqjKwTlVdwCvGvcdTBGFsdquySTUqS+thoYkEqYvhaFWCerWg593
	lBIlh0PiyVYaHEwvb+Z9l+xgTF3BoOrsVsiSdEoLxao3sjSJYNkIpCjpLLHE6kGiFnpI+u
	fCEHM+dPQjPQA6AgoPQJlpsO/maPwVcNEjkHqW/Tlfolx/8Ol3s3fkbeAvxgSdg1CQtqP7
	ZwxbH3c2Pwq70jrHNftSmklWM8/a5gjhmW3eikanLVEdI4svYyrV0ire/b4Gxw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Drop useless power domains items
Date: Sat, 18 Oct 2025 15:00:58 +0200
Message-ID: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f3442694eee9bbceb66
X-MBO-RS-META: 6p44y3cu71pc5fzdrqigyaacqqrgqqoc
X-Rspamd-Queue-Id: 4cphfp5wVgz9tBD

The power-domains items: list is not very informative, replace it
with plain minItems/maxItems instead.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml         | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index c87d7bece0ecd..bee4ab1a1f805 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -90,8 +90,7 @@ allOf:
     then:
       properties:
         power-domains:
-          items:
-            - description: Power domain A
+          maxItems: 1
         power-domain-names:
           maxItems: 1
       required:
@@ -125,9 +124,7 @@ allOf:
     then:
       properties:
         power-domains:
-          items:
-            - description: Power domain A
-            - description: Power domain B
+          minItems: 2
         power-domain-names:
           minItems: 2
       required:
-- 
2.51.0


