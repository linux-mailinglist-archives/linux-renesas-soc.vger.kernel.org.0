Return-Path: <linux-renesas-soc+bounces-25759-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1F1CBE1BC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 14:42:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56200300E7AC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 13:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7508331A6F;
	Mon, 15 Dec 2025 13:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dsrgwEID"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB453314D9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 13:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765805944; cv=none; b=CmoduokUk1qnvZKjwquFakwIhSZbIMlc//GBBIwXkTGq9c1vE6pvw6l//XmCqc4TBjgIheHhFmQLVgLZvtP8nMpQx5TjOBxEjg6E1SdhuNWZ4w2CB1NVFtbcAphyrQwYbW6sf9DEqvMQjQ7Ztj2cqIbjdXaaJGgi42exQlLB0Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765805944; c=relaxed/simple;
	bh=DoKMy9ar27bLbOh2CtTDqp0KRKqhMiqKTwRqiPF3528=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ofTa2a/0XErEnwiF7MZ06iZNWWpbXJLegRqgFKvMvXskB5lIsEW8kmwJiIe21vsRC4i5vhnJWYBu+Ny6qTThf4cD+U8l93xRBPHzfd4k2CCNztSJPB6wE5d+AFCYoRgQBNBVR3LrRSiThYu2xnbMfWUcEIZE+y9IF1T9kzz2AZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dsrgwEID; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=7JazWsIS/CHK3V
	4xzXhVpv09y6AAYC/e+eQsL6395/k=; b=dsrgwEIDLBPHpP7tJxwg3HRBc3S+J3
	EYQrWfPJrWIOqDSOSr3aLRxEG1UBYPzQpN6lrtMfYW5EdHzWMpN+O5R5YG3/QDc2
	a6LxvqTLye8ql83wDBy52MaP+BLOCOiEYpa+YlTwpY6ft1l0pJ2kqcIdfkZa44Pp
	38j/NlyR6hK7ZR8Ah2QOgyZxGA8RlLFwZCOnBuK37hm68Qr4mwNI2ubbLm1t6i42
	7ChpO63zAojZNtly6mdxQDtIFdOmaRR+jfan/SCUwdTBM8fTmRJHavImzJHI1hb7
	2xgRUqv8PBzPjdEVK5bSnMtHnRYa8Ro1LOnhc2EGTQ008Z3u1Xmnq0lg==
Received: (qmail 1003689 invoked from network); 15 Dec 2025 14:38:55 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Dec 2025 14:38:55 +0100
X-UD-Smtp-Session: l3s3148p1@E5cVu/1FhdXN3IHv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: gpu: img,powervr-rogue: Add Renesas R-Car V3U
Date: Mon, 15 Dec 2025 22:36:35 +0900
Message-ID: <20251215133839.15133-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R-Car V3U has the same unit as M3N and its GPU was already added to the
DT. Add the binding description now, too.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Fixes:

arch/arm64/boot/dts/renesas/r8a779a0-falcon.dtb: gpu@fd000000 (renesas,r8a779a0-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
        ['renesas,r8a779a0-gpu', 'img,img-ge7800', 'img,img-rogue'] is too short
        ['renesas,r8a779a0-gpu', 'img,img-ge7800', 'img,img-rogue'] is too long
...

 Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index 225a6e1b7fcd..86ef68985317 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -20,7 +20,9 @@ properties:
           - const: img,img-gx6250
           - const: img,img-rogue
       - items:
-          - const: renesas,r8a77965-gpu
+          - enum:
+              - renesas,r8a77965-gpu
+              - renesas,r8a779a0-gpu
           - const: img,img-ge7800
           - const: img,img-rogue
       - items:
-- 
2.47.3


