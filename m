Return-Path: <linux-renesas-soc+bounces-12336-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0E5A191E1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 13:56:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1C6E3A1961
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 12:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38700212FA8;
	Wed, 22 Jan 2025 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="o/wA/y/Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500F6212F8E;
	Wed, 22 Jan 2025 12:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737550573; cv=none; b=DDqq2XLctfyZhSSnrV8nLZhQM1ogWEIygF4EbKbcE2EZn1GtAUOFL35awfs4ifWfIfDg5aWyUOgfnf2Z27KL6KF65Unxq+O5N7iO2+bBfAMoC7UDNFBwx5tqYZ5h4kcEzgdrCZhK2rEigeJ1mvd8jrJ43QB+QsDf/2RBS4VfdNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737550573; c=relaxed/simple;
	bh=oIjF0JRuVMRmVpMypyEG9GikqFqBAdf9tULmhK+MthY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HbhMhEryfezLIxJm68LCv+ZC8NH+Q7yw4STCu1ILyi+N7Qci+vYQePsaW9lcsdYPz1ioAa0CGlZLaUsJ3v1h8WRWv71Ybs9YxaX3IAJBYZys1ZklhMBgHfPIGA50uVHrwL1ENeCpz4zwSbZrSBd5lhSh+8r23VIKLuM4nnStlXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=o/wA/y/Q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737550569;
	bh=oIjF0JRuVMRmVpMypyEG9GikqFqBAdf9tULmhK+MthY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=o/wA/y/Qpr6/bHlfuTho5KvlJsWkfp7vQp8pmvwFAJ8smu4pX3JSGf3yfaCWZBeba
	 efdl207k5bTRHjXBLN+ZNPOYrkU/yN/ezs2ST5yrS2r7X2CzD7lnyy/y1U5ftVP3uh
	 vGr+F7XYb0/+gwb30ZYMNlt66Be6ojC+eDXUYOGKJHatSkPNJTpnXB5UXI1tBESqN1
	 +QdBRVIcx5/YlZkN9/sAD7EuBKwP8NhJ7EVqA+g4ZeAIBCUg5TmU6jIZZJANrs0x6S
	 dvmZ/eWa+xO5rB2WSNs0GZ7I2UFf0pEKAddFKVGiXnAmAiCnIz81bJeSmIlt3Bu7c/
	 W94tyq3L8R2mg==
Received: from apertis-1.home (2a01cb088CCA73006086F5f072c6A07A.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DA4617E0EA6;
	Wed, 22 Jan 2025 13:56:09 +0100 (CET)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 22 Jan 2025 13:56:05 +0100
Subject: [PATCH 1/2] dt-bindings: soc: renesas: Document MyIR Remi Pi board
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-myir-remi-pi-v1-1-0e44e1cb8a90@collabora.com>
References: <20250122-myir-remi-pi-v1-0-0e44e1cb8a90@collabora.com>
In-Reply-To: <20250122-myir-remi-pi-v1-0-0e44e1cb8a90@collabora.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

Document the MyIR Remi Pi" which is based on the Renesas
RZ/G2L ("R9A07G044L2") SoC.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index b7acb65bdecd2a3828f5757735eb473c39f27b57..3e02bc2e17483cf53679a130eaaa5943d2f9a2a7 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -491,6 +491,13 @@ properties:
               - renesas,r9a07g044l2 # Dual Cortex-A55 RZ/G2L
           - const: renesas,r9a07g044
 
+      - items:
+          - enum:
+              # MYIR Remi Pi SBC (MYB-YG2LX-REMI)
+              - myir,remi-pi
+          - const: renesas,r9a07g044l2
+          - const: renesas,r9a07g044
+
       - description: RZ/V2L (R9A07G054)
         items:
           - enum:

-- 
2.47.1


