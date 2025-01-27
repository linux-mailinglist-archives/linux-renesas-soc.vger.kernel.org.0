Return-Path: <linux-renesas-soc+bounces-12547-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 824CAA1D39E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 10:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB6AB1881BB7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Jan 2025 09:39:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54FE11FDE08;
	Mon, 27 Jan 2025 09:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Eeyr4+lv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5618A1FC7E7;
	Mon, 27 Jan 2025 09:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737970752; cv=none; b=NAw8kpSklAzZBmTglM3xw8tsHgLIhQEjy17iXqQmeX4tCvFW2tU87cQ/hkWJ2lQJ80O45DxhCAJ8cl5R18nVXIoOaSZdWSqxDOuaVE2r8i4bb2y3HZqAx7eTtqeEX+XYW3eVUvVa1CoXoZ8Usr9Byumv+c5Z9NLTiTsjOX47DoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737970752; c=relaxed/simple;
	bh=/oF01OFEyDn9qTjpcxcGftFf5uENLZ1d5cGlslzgPcc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hwrIYSlU0Ma1abYLkk5YIgeSC8C0baS6S2CCukxTc/0P4JQcrbCLtS19AT8eSYOeplHV46NhiiCRXeuisJPoBy387MiaSkV5Kuf4Zg80VqySQIbjO7XfUhNNgCNQYX/BEE0IizOJI5NnChSHQW2CMFcguolnkt6zPhHT7g07L8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Eeyr4+lv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737970748;
	bh=/oF01OFEyDn9qTjpcxcGftFf5uENLZ1d5cGlslzgPcc=;
	h=From:Subject:Date:To:Cc:From;
	b=Eeyr4+lvrNIRr9FiGOniPZ/qyJmRJTuD7rAUYjNqmnSC8hkbXJgpMGckDA4Zu1FNK
	 zbPrXGgjaYMNW1nfZluWxVD7e07wnS6GUW9aGzLxa+xq6U6KVQXZudEh/+IwWJTK9k
	 XnVfViMXfy1h0DQC1sBHDfAAMR08rea1QwQjG1uKUt4IVZW9GW07X2O2AYd1AYD0Vu
	 kZrx7NdXo/gstS+BojtDWFDHVO7E7CfmwgKrt8H2m8ar8dfe9c6P+WjjXy5Z1Mg3AT
	 IJHoEdBXsNdg8h0sCKVd3Jxc2z2EAdHzJGYmFn1whryhWNaEPSdrQghc5x+VPMRrKp
	 AuNKHfisqz2XA==
Received: from apertis-1.home (2a01cb088CcA73006086F5f072C6a07A.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EAFAE17E0B25;
	Mon, 27 Jan 2025 10:39:07 +0100 (CET)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2 0/2] Add basic support for MyIR Remi Pi
Date: Mon, 27 Jan 2025 10:38:45 +0100
Message-Id: <20250127-myir-remi-pi-v2-0-7bd3a1c62752@collabora.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACVUl2cC/3XMQQqDMBCF4avIrDslCabVrrxHcRHjWAfUyKRIR
 XL3pu67/B+874BIwhThURwgtHHksOQwlwL86JYXIfe5wShjlTYG550FhWbGlbEu+5uydrDVvYZ
 8WYUG/pzcs809cnwH2U9907/1D7RpVKioLEn7rnK1anyYJtcFcVcfZmhTSl/zbJElrAAAAA==
X-Change-ID: 20250122-myir-remi-pi-94d6055f5879
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Julien Massot <julien.massot@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

The Remi Pi is a compact board based on the Renesas RZ/G2L SoC.

This initial patchset add support for basic functions:
     - UART
     - I2C
     - HDMI
     - Ethernet

More work is needed to support the remaining functions such as
USB Type C, SD card, Audio, Wi-Fi and Bluetooth.

Some schematics are available at https://down.myir-tech.com/RemiPi/

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Changes in v2:
- Reorder Makefile entry to be sorted
- Remove underscore from DT nodes names
- Fix compatible for ethernet nodes and remove uneeded properties
- Remove uneeded x1-clock
- Link to v1: https://lore.kernel.org/r/20250122-myir-remi-pi-v1-0-0e44e1cb8a90@collabora.com

---
Julien Massot (2):
      dt-bindings: soc: renesas: Document MyIR Remi Pi board
      arm64: renesas: add initial support for MYIR Remi Pi

 .../devicetree/bindings/soc/renesas/renesas.yaml   |   7 +
 arch/arm64/boot/dts/renesas/Makefile               |   1 +
 .../arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts | 388 +++++++++++++++++++++
 3 files changed, 396 insertions(+)
---
base-commit: c4b9570cfb63501638db720f3bee9f6dfd044b82
change-id: 20250122-myir-remi-pi-94d6055f5879

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


