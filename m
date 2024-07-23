Return-Path: <linux-renesas-soc+bounces-7438-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE3B939EE2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 12:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34F1A1C21E01
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2024 10:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3072614F13E;
	Tue, 23 Jul 2024 10:42:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57F1514F12C;
	Tue, 23 Jul 2024 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721731350; cv=none; b=WpvSxcV8W9B725ws+kxFNHNMrTQoIn54pLmOJ38xWDDy2IxGFRJIOtT+OSGFqunYMtyMJfg/NokP9XGRYbj37ZV7KUV6aQ/7v+8ZJJyA9Na3nouNOp4LBShYyNHcJZoVc2Qfl/oKbdI7N2WFqxBE3u1F6oxPBUvOu9VDzFgJLyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721731350; c=relaxed/simple;
	bh=wfjZvCyt/jbOaZl8vqyR3ctn5epmzbmJnxxIlLJQJZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qlJiOqF1JJS4OAFbNl0HQnAWhp6jLyABL/RnZVWjla6wBof0RfHK5JknQbt8FtfgxC4hRPCEzNZIUgRqTPQzVK4VNw2LlvDL3AeT4phAHiaUyYDzoA1RZZi4kaGMqX5imczz7XG1zmKzI1CGfRyr0IQpw2Fj7q9eTv8Y+gA/mZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.09,230,1716217200"; 
   d="scan'208";a="212369740"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jul 2024 19:37:21 +0900
Received: from localhost.localdomain (unknown [10.226.93.79])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6029640065AD;
	Tue, 23 Jul 2024 19:37:17 +0900 (JST)
From: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Oliver Rhodes <oliver.rhodes.aj@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Duy Nguyen <duy.nguyen.rh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: power: renesas: Document RZ/G2M v3.0 (r8a774a3) SYSC binding
Date: Tue, 23 Jul 2024 11:37:01 +0100
Message-Id: <20240723103705.9774-3-oliver.rhodes.aj@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240723103705.9774-1-oliver.rhodes.aj@renesas.com>
References: <20240723103705.9774-1-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document bindings for the Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SYSC block.

Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
---
 Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
index e76fb273490f..347571e2545a 100644
--- a/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
+++ b/Documentation/devicetree/bindings/power/renesas,rcar-sysc.yaml
@@ -25,6 +25,7 @@ properties:
       - renesas,r8a7745-sysc  # RZ/G1E
       - renesas,r8a77470-sysc # RZ/G1C
       - renesas,r8a774a1-sysc # RZ/G2M
+      - renesas,r8a774a3-sysc # RZ/G2M v3.0
       - renesas,r8a774b1-sysc # RZ/G2N
       - renesas,r8a774c0-sysc # RZ/G2E
       - renesas,r8a774e1-sysc # RZ/G2H
-- 
2.34.1


