Return-Path: <linux-renesas-soc+bounces-26237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E320CED554
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 21:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 257AA300091B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 20:40:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 516EC22B5A5;
	Thu,  1 Jan 2026 20:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="PcDnNQIL";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="FgqD7rBF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAEA1427A;
	Thu,  1 Jan 2026 20:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767300005; cv=none; b=jzWZhTKQOdk9PJzkcqraR5Dm+YqkM3Luq31ZsZU/DL0nkS//3BoXjfKRbtTdI63zvdeD1/a0cbKGymDtMXBT0KO6S3yFpHK66/vw06LXQtyRWbxdVgJ24dG946IP16NFnkKfJCIw59wVW2GuoaEcGog1fm8tQ+e8OfTuSrMhzpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767300005; c=relaxed/simple;
	bh=GDgAd4Afc3aR37uVHWDzMjAfFeLJ6wp6nvDmGtXu9YY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqgBG/N8I9cWAOzc5fDp58KBfxOPbdB4kqM9iXmCmZYJEnA3zH1DfwHGNOctKQ6msfDRoJZzezoWSbBwuPF4MdtiewwEbi3LJKyzhK+ULQq0zRSe4NW2ir6UYyUH8F493QW7FPTlPXuEyNp6yM7UiYv2r4uBkaRO3lNifhuKluU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=PcDnNQIL; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=FgqD7rBF; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dhzGM60DVz9tGX;
	Thu,  1 Jan 2026 21:39:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767299995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IagLaPLeBzt460P4exNwADqzXUuvMCHLnSttbj4CQn8=;
	b=PcDnNQILSwCyE3ywemdSAbLOmVN/154gK68mTlkjZt1cUH3SaG47nXXk/BsLgsbP68kYSY
	pZ5owx3L4rDmMVXez8bdl2tSxDydXD7llczIJr2q1ykzSivaDLwyU2VoIog+t85/SKKbpR
	6JVyNAvszQTRmCTWOzwSZW3D3I6XD35G2JU5JFiDIO2k5WD3BIYzxKxvJCddIegqvclVBh
	ZcZY1utu4WoL8z4oI8ILvbmD8jEOOTqyWLustj8j5tY2kx525FQ+xmnSP2gl2cEX+UYnik
	6F/qj7HzmNX7Zldu8hunAYRy1Q9w39n0Nmnawa8HrD2c5WCv+NjWayAiY9QT2g==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767299993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IagLaPLeBzt460P4exNwADqzXUuvMCHLnSttbj4CQn8=;
	b=FgqD7rBFA+ggX0a/BwbtNZXYyFTfI2PakBQa2s5IXjiazNx/IGNBulIsSMx0B7LWyzgw6I
	iDXWoJ5PYxtE73xBL7AOtaOMsld6WVTlyACpawU701HHVs03PVR7EBijUBvASBmqEv5Q7S
	LL5W4Ig7IHbq41Y+b4I94okK8qdtXsCuS7kNoPC228XN67vc/vOt/rDhndQ6xKeIwfDZvM
	+i7tvgHzG8JwY5dRWpDhPZaC9TiN1hfCJ4Vs/6Uka4KtadoPxjRcBpm+cMHpvEyz+2jPXa
	ZhZM5laFshhLzJguYw1rkMP9Qdz/bR3kZavY0nvC9hXpwnP84cWcNcpBUiNbuQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 01/11] dt-bindings: phy: renesas: usb3-phy: add r8a77990 support
Date: Thu,  1 Jan 2026 21:35:48 +0100
Message-ID: <20260101203938.159161-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
References: <20260101203938.159161-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: hue1acap4etf344631etqcxx9ajb47hd
X-MBO-RS-ID: 46479d7265cfd5fed62

This patch adds support for r8a77990 (R-Car E3).

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: devicetree@vger.kernel.org
Cc: linux-phy@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
index fe57c5373d18a..d0dd2d19b1ddb 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb3-phy.yaml
@@ -20,6 +20,7 @@ properties:
           - renesas,r8a7796-usb3-phy  # R-Car M3-W
           - renesas,r8a77961-usb3-phy # R-Car M3-W+
           - renesas,r8a77965-usb3-phy # R-Car M3-N
+          - renesas,r8a77990-usb3-phy # R-Car E3
       - const: renesas,rcar-gen3-usb3-phy
 
   reg:
-- 
2.51.0


