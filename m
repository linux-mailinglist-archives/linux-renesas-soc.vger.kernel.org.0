Return-Path: <linux-renesas-soc+bounces-3460-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 111AF8719C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 10:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA917281A6E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Mar 2024 09:42:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774B3535BF;
	Tue,  5 Mar 2024 09:41:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406D5535C7
	for <linux-renesas-soc@vger.kernel.org>; Tue,  5 Mar 2024 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709631716; cv=none; b=Cob5BCtftpE5brXsUZC7B11NuVSsuG0+nSt3H9tSao/GZYO6L75iR7x5+KFcG9bC2ItZLAeSfyQO/6Bs4XG44jb+gfFLjQ2fhKySuEXNI6fMnPic9K7kronijOdr/7X4nagxLGkaJa/NGJvDLhfkbTevcf5WNys48Ch6gPV0Yvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709631716; c=relaxed/simple;
	bh=dMwgmbNGxOjzag43qzzaR5zBokKVeTOGOhp5Q6wizmE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bncmPtDV8if05r/lB8if3z5NlqN8mRM2+OcaiMtx8vafbAtmpov4ILM7b2TZfqZYwoR+iHpsh6HhnJi68RxeDiYJTTtGk0nW47rrMPm2MLwACbfJGgwmU7IOSDdmclD2aCnwZaNW9cBDOADhQHjuwyi6JkNwGJDWwpf7/0I1puo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([84.195.187.55])
	by laurent.telenet-ops.be with bizsmtp
	id uxhm2B00G1C8whw01xhmG6; Tue, 05 Mar 2024 10:41:51 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rhREV-002PPO-Tg;
	Tue, 05 Mar 2024 10:37:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rhREi-00BUN7-Ih;
	Tue, 05 Mar 2024 10:37:24 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thanh Quan <thanh.quan.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH net-next] dt-bindings: net: renesas,etheravb: Add support for R-Car V4M
Date: Tue,  5 Mar 2024 10:37:18 +0100
Message-Id: <0212b57ba1005bb9b5a922f8f25cc67a7bc15f30.1709631152.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thanh Quan <thanh.quan.xn@renesas.com>

Document support for the Renesas Ethernet AVB (EtherAVB-IF) block in the
Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/net/renesas,etheravb.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
index 890f7858d0dc4c79..de7ba7f345a93778 100644
--- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
@@ -46,6 +46,7 @@ properties:
           - enum:
               - renesas,etheravb-r8a779a0     # R-Car V3U
               - renesas,etheravb-r8a779g0     # R-Car V4H
+              - renesas,etheravb-r8a779h0     # R-Car V4M
           - const: renesas,etheravb-rcar-gen4 # R-Car Gen4
 
       - items:
-- 
2.34.1


