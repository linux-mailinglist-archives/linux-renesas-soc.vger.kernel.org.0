Return-Path: <linux-renesas-soc+bounces-5650-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA28E8D3643
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 14:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48BD31F26796
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 12:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6A4118132A;
	Wed, 29 May 2024 12:22:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B013181309
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 12:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985335; cv=none; b=purNL7kz1gxg1edxeJd8GhvFROL+QHjvQTft1lBeZ5rMaMpWFIEXIoO8MiGVnr+3xQ5tEACpaDkvXi58FerWqYDxvYT2BeceUn8g4MxO3shaOS1y1bvAlIAA5DTyfXQcJrV3wKunHRCgdlQrgon8zfFlTL3d76eIV40XlhLJIq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985335; c=relaxed/simple;
	bh=mV1F6L5sqaDjww5uno/FDLOWmQlYZfaJQaMcLbUzZIk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TVjgiRvGlTaLBWuNlImZKGO7DDt0/28ILs2CN8/d/ho+1ZrK/xYpx1chLynO15Ct6mCyvfHp/6mt3cUFU+n6gp/Hd9SCnNO1Dm9r+vNpkbtHL9bim7PHlXUCvTl36RxNNJUMEv2rU/5bKlNSPzi1ABlOj2zPD5fMDzohPj94ZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:1b01:1838:131c:4de4])
	by albert.telenet-ops.be with bizsmtp
	id V0N82C00a3VPV9V060N8im; Wed, 29 May 2024 14:22:12 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCIIo-00GdK2-9Y;
	Wed, 29 May 2024 14:22:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sCIJk-009XUA-Md;
	Wed, 29 May 2024 14:22:08 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 3/3] dt-bindings: timer: renesas,tmu: Add R-Car Gen2 support
Date: Wed, 29 May 2024 14:22:06 +0200
Message-Id: <de215e00e180c266527b7bd7cff5f75df918da98.1716985096.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1716985096.git.geert+renesas@glider.be>
References: <cover.1716985096.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document support for the Timer Unit (TMU) on R-Car Gen2 SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2:
  - Add Acked-by, Reviewed-by.
---
 Documentation/devicetree/bindings/timer/renesas,tmu.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
index cc228ed28ee8a301..b6dd98d956f3e867 100644
--- a/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,tmu.yaml
@@ -34,6 +34,11 @@ properties:
           - renesas,tmu-r8a774e1 # RZ/G2H
           - renesas,tmu-r8a7778  # R-Car M1A
           - renesas,tmu-r8a7779  # R-Car H1
+          - renesas,tmu-r8a7790  # R-Car H2
+          - renesas,tmu-r8a7791  # R-Car M2-W
+          - renesas,tmu-r8a7792  # R-Car V2H
+          - renesas,tmu-r8a7793  # R-Car M2-N
+          - renesas,tmu-r8a7794  # R-Car E2
           - renesas,tmu-r8a7795  # R-Car H3
           - renesas,tmu-r8a7796  # R-Car M3-W
           - renesas,tmu-r8a77961 # R-Car M3-W+
-- 
2.34.1


