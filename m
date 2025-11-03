Return-Path: <linux-renesas-soc+bounces-24045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 39745C2DEF6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 03 Nov 2025 20:46:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59E0B3AA1A7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Nov 2025 19:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289CC299A85;
	Mon,  3 Nov 2025 19:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JA4Fxuhs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D77128DB49
	for <linux-renesas-soc@vger.kernel.org>; Mon,  3 Nov 2025 19:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762199175; cv=none; b=RmjgPXQ/fI1hqj3qzDTlLIRP4NO37p+Dz9RykQcUiQXhjBVEwtBCAodSBQo7n/L9aE4LwPFEstbroPwF4Y9Qsw4fga8CHCmnMm030ZbIbwyRY9C0B9bW9DnVQ5kl9AuXSxJAnTu2Rd8msfWlvpsxpQ2E1MAzOljM2QwjVyImiFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762199175; c=relaxed/simple;
	bh=MRXE7DT9OxccPI5TsXsQ7xdXXyvKUg7JkhqyAg18Mhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ffBBFoBsPJk79/bOYY8oFrXPnWDEGv4xOZDOO9jHHpuos+r5yNBi41aZY0mgAGTY+piZFTHaSb7AVUnvGapyu55PNcIvqz9nAI3tEQsrOy70Dtcnn9ip9MHZdtmm2hqDniUj9Jc2XPRNj3IoZnDrf5D96g3XD2n5SLQd2145EOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JA4Fxuhs; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so4817024b3a.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 03 Nov 2025 11:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762199172; x=1762803972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMKjToI1cPGuPb6glfsZd8eb+wK7aS/JWYDCdguKThc=;
        b=JA4Fxuhsu6ZXDHA6opaJhTNwhG5h/qFlKv/l/LW6sX+a2Vj7u+GrHQmeAVpQ8k8Gdr
         uE9szcQCqIJAJ9g0CAz2Vkn5j4HRLDF9/0nlAhmlfPQVCF+Z7ZcKsvl2NkpL2Grlkrvu
         VqlPPkZiTWnhfxeM3R3Asibqk/TbJeDnsNdFCTSg3FIHDI4BcK5v8op4sAzSREHyDra7
         rGZGVbyh9Vmhu1aLohoXm2qrADG6TFthned2XSoEtgGa5QITAsBVsSMAm3n670aSb8Pq
         wjWe1r4+yCidXvyEKBKmH1pHUFwTNNN/DUU2t009KsWoVKidUckfJ53xLqSDWb58lfT3
         zBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762199172; x=1762803972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMKjToI1cPGuPb6glfsZd8eb+wK7aS/JWYDCdguKThc=;
        b=STWZpa4ekX0QuYBKkvoD0vJOv05zl5fW8GeulZmESkL9nx7r/MbjBPCGXD3QN38NH4
         qhJFX6hFNcUcBy7sZSOjr/BA8TFUHlY59gs8M8nMz6XBhk1FQiyo3lSCva17L+QGs6e0
         y05rC6NhnmDFRQdaEFAfRLBtnMwv9uzui5nWnDaQ29QFTUoQkAkq5Axq40TRZ0yEb/L9
         o0n3QTJ9FMloOe7xwPiyuOUV9KANcMCjfQN4Iuq+koJSnOh4pGJFqTPGW78C5mv11m05
         PA2RqLjEDz6o85FDraFNBx1PDYhbbUGzb3kNeNRfxqGrPGR2bI851YiyPdQeKSjgQQZC
         9glw==
X-Forwarded-Encrypted: i=1; AJvYcCWG1z1q0zGlcgpTeE4d4r9saMxq8tzxCzuaa1lc3kcGnDu/BmWYSYcLxVvpf0YLgVqTTKffQzCPaey2GH27abfIMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWoFClpl212Vpf0b6+Yw3RnnX+w/kjzm9Q9lgVheP3yq3BgSb+
	pf+/AdCSIqY6sxcz6fc7oUJBd0N85X4YLAMI3K2CX7OoEUH0KPTHUQUo
X-Gm-Gg: ASbGnctJ8AqAxep5avg2Vlq8zLH9t5wOTu+ekgqz4ztRR2MAH3X/a8va1aE7nMhSviD
	Nr5ZoCtARHclla+ufljN/qj0NhSSIHwhi99+8vrZNeVQaRyVK9GlKvqg6OkGRssjb7UHPMFy7Y6
	cxaLoFCOoTkEhmag4Ih5LvL25KWjOkXf+AEq54wliY/gmvtrbFPYgp6AKNZ0sxY1ziT2Qvuz9Gi
	6yyTOoIJTDWkASc/154AqO2RDJH1hUxDPKr4OwgQSxi/502fgTIB98zynuNHFJkXMz1eYEJcLpa
	Sg0j1ksjsfQKIthYTrTxbZXMxs1wlFJcWxuyIcq4R73iwfPm6wWfIopu/vbRaRevoVKkP5h6RNd
	au/m/+5MC3LvWmy0dHUmP3SWsGcRiAr8NomsZl3JaXSrkXmIjxI95Y2mCGRe0o9Me8oTmx9IosL
	qyuEbZaVyERMq4mbEzzuqYhSGFsKXGJi0=
X-Google-Smtp-Source: AGHT+IGs/phsqHMf7vgqUydH/kHUo9Pu6wt15y2CjfYpOAPnQUisNU2Uqoapi6ssdQv3N85Tdviw+A==
X-Received: by 2002:a05:6a00:c96:b0:781:1110:f175 with SMTP id d2e1a72fcca58-7acc1a2d907mr700653b3a.14.1762199171727;
        Mon, 03 Nov 2025 11:46:11 -0800 (PST)
Received: from iku.. ([2401:4900:1c06:600d:df45:8e1:7a61:1482])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd586bf62sm199588b3a.48.2025.11.03.11.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 11:46:10 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] media: dt-bindings: media: renesas,fcp: Allow three clocks for RZ/V2N SoC
Date: Mon,  3 Nov 2025 19:45:54 +0000
Message-ID: <20251103194554.54313-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the FCP DT schema to permit three clock inputs for the RZ/V2N SoC.
The FCP block on this SoC requires three separate clocks, unlike other
variants which use only one.

Fixes: f42eddf44fbf ("media: dt-bindings: media: renesas,fcp: Document RZ/V2N SoC")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, there are no current users of the RZ/V2N FCP compatible string in
the kernel tree.
---
 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index cf92dfe69637..b5eff6fec8a9 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -77,6 +77,7 @@ allOf:
               - renesas,r9a07g043u-fcpvd
               - renesas,r9a07g044-fcpvd
               - renesas,r9a07g054-fcpvd
+              - renesas,r9a09g056-fcpvd
               - renesas,r9a09g057-fcpvd
     then:
       properties:
-- 
2.43.0


