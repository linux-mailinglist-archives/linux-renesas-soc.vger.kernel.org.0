Return-Path: <linux-renesas-soc+bounces-22852-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87093BCA97B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 20:39:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4645B42825D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 18:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B48257422;
	Thu,  9 Oct 2025 18:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DWu2wiyN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D967C24E4C3
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 18:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760035122; cv=none; b=YyAdvHfK+raoi0tWsdIXaxSvYJNCO8vByxAPjk4sBgebcDj6p4QJQFo0NuvRQx2Nj9qUXR0u4Smm1brAXBfFNfUZxdwCHtMrXhbtSEdjTvkudp4GAja8Bb3OImOZmhInrlMGl+2OsP1J/VqPLsm1l9q/N01cJROdxeKCvg6CWcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760035122; c=relaxed/simple;
	bh=QKGvWaeDJkJxuusZziJoVd5/CEJsgeWfRZb6SmpD1Ug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O5ldS4cdciMXNN4Ofjjpc3Ncbc3VqlKZQmdkS2Hhgfh5mV989o5MXw9Tq6U5ATSgTBOrLQdzzNuiwLgV3zvShgPoYM+OLidIuBTdEdR0SHtnPvKI1bRxdpwwYvgyv3jxY/dgsyx4xIpfsA8EF+YX9msZExgz0ypaAcb0MEf5X4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DWu2wiyN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=WLoRyTdOAzdrgD
	Qu6Y9H3IPEVEhQZSzdy1Zv7I7aZiQ=; b=DWu2wiyNjhwAWbbOJBef4xB/CnSshK
	zMoP+yRSokij6/qzgL72FYMtsV3S7W8uQnH/GN2s9iOnj+jXwX5wNQi1/AkA7zhK
	S5zopw7SMn5p9xia4w2aj/d/1+4VjIpPEEDfiXMZL4Xqg4cLqBcPnqiR+mxvs6nT
	z1k280dSnqPwUtH00Oo5QnW0ltETgaAnX1Q3/bg9xLdTytTLzixQaMWjBRFUmUof
	dxA71hZORo4qFRpRe+eFntYtnlx+cPm5/+Jtjpg9hwBFRQD1LYxW10crIHU5YTsR
	Gyj1pOvLy04iBSFUrmLlg8C8Pq865jUs097buDMWpTVhlJ0xLw2OTkWw==
Received: (qmail 1186477 invoked from network); 9 Oct 2025 20:38:38 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 20:38:38 +0200
X-UD-Smtp-Session: l3s3148p1@iiAIHL5ATJ4ujnv2
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2] dt-bindings: bus: allwinner,sun50i-a64-de2: don't check node names
Date: Thu,  9 Oct 2025 20:37:43 +0200
Message-ID: <20251009183835.5533-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Node names are already and properly checked by the core schema. No need
to do it again.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v1:
* dropped superfluous '^.*' from the regex

 .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
index 9845a187bdf6..ff8dbc684bbc 100644
--- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
+++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
@@ -44,7 +44,7 @@ properties:
 
 patternProperties:
   # All other properties should be child nodes with unit-address and 'reg'
-  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
+  "@[0-9a-fA-F]+$":
     type: object
     additionalProperties: true
     properties:
-- 
2.47.2


