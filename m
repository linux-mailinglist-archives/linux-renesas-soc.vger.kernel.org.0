Return-Path: <linux-renesas-soc+bounces-12778-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA77A23BBC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 10:58:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CE23916430C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 Jan 2025 09:58:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C38D7195FE8;
	Fri, 31 Jan 2025 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="VSwbDH9M"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD382158875;
	Fri, 31 Jan 2025 09:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738317486; cv=none; b=Y6eiIu9qDXYedw2FzK9d59/UNIThSPcqSP05XObcjcWVQg7d0OEh0JjlwTK7gxZTHxYaCGlZN5dZYAdvINW3Z7S5SlIZvcEWnJKKssw7o9eZPtracp3XtT8n7n/mi/RfPHL+uIPlpZCDvaweM9XiTE2Fgcyo/AizHEa0juIWy2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738317486; c=relaxed/simple;
	bh=/T9gtw9NlYmosYncUfToBkjbHu4CZfqvnznaVEIlP6w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YT7hkGI/MjlTmtSPCX9W5KuoRWpIvVedsehTyb9hgvovN80PGVzG0QvpmeWKuX4w41+gSWS0b02hbM3AUlhhH/LCVzLJVNEv8DllfEHFgVDBqIjV/47DAvaVPyXdcnHnmoks/1tndsgpUfkS9P0Iumj/e31jZMzYRAuFmYOw9JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=VSwbDH9M; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1738317482;
	bh=/T9gtw9NlYmosYncUfToBkjbHu4CZfqvnznaVEIlP6w=;
	h=From:Subject:Date:To:Cc:From;
	b=VSwbDH9Mv9WCDLnqt770xu+bh4y19cwpj+iUisr9xSm8VPnKgYghmZsUQ4+o+l4nK
	 oSHzSxuGYmosJ6OBGgUT9S3LX0KHecf0E/r+Te7J5IIxwfJzLGpSlcZWAyexy55gA8
	 tJsS5jpFN8rarXBcxFEML7uTNuD06eJcqeNpFoYWigD8o99ELj8mvUXtF842X4W9ey
	 xjOxiLrRWlVWl064OrzhK9XN7DpgKOaY1dlJZWH4ItH6CthJDu0c8XJlir1/gyn6s/
	 noezWAKAMl0s46da0y1PB5GzVlDtTqmnv/m4bBbip640d2dvA5MZmm7LuZfVPNQeQl
	 3qozCRd28A4ew==
Received: from apertis-1.home (2a01cb088cca73006086f5F072C6A07a.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 59AF417E0FC3;
	Fri, 31 Jan 2025 10:58:02 +0100 (CET)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v3 0/2] Add basic support for MYIR Remi Pi
Date: Fri, 31 Jan 2025 10:57:58 +0100
Message-Id: <20250131-myir-remi-pi-v3-0-2dda53e79291@collabora.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKaenGcC/3XMQQqDMBCF4atI1k1JRmO0q96jdBHjWAfUSFJCR
 bx7o6sidPk/eN/KAnrCwG7ZyjxGCuSmFPklY7Y30ws5takZCFBCAvBxIc89jsRn4nXRlkKpTlW
 6Zukye+zoc3CPZ+qewtv55dCj3Nc/UJRccIFFgdI2lanF3bphMI3z5mrdyHYswi+gTwAkQDdtb
 qQtQSs4A9u2fQEMZU087QAAAA==
X-Change-ID: 20250122-myir-remi-pi-94d6055f5879
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com
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
Changes in v3:
- Use 'MYIR' spelling consistently
- Removed: scif1, and scif2 nodes, and enable scif4
- Changed regulator-1p8v vin-supply to reg_5p0v
- Added 'reset-gpios' for boh ethernet phys
- Dropped unused 'spi0' pinctrl
- Removed 'sdhi0_pins_uhs' duplicated pinctrl
- Removed 'usb1_pins' they are not mentionned in the schematics
- Sort all the references to nodes alphabetically
- Link to v2: https://lore.kernel.org/r/20250127-myir-remi-pi-v2-0-7bd3a1c62752@collabora.com

Changes in v2:
- Reorder Makefile entry to be sorted
- Remove underscore from DT nodes names
- Fix compatible for ethernet nodes and remove uneeded properties
- Remove uneeded x1-clock
- Link to v1: https://lore.kernel.org/r/20250122-myir-remi-pi-v1-0-0e44e1cb8a90@collabora.com

---
Julien Massot (2):
      dt-bindings: soc: renesas: Document MYIR Remi Pi board
      arm64: renesas: add initial support for MYIR Remi Pi

 .../devicetree/bindings/soc/renesas/renesas.yaml   |   7 +
 arch/arm64/boot/dts/renesas/Makefile               |   1 +
 .../arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts | 351 +++++++++++++++++++++
 3 files changed, 359 insertions(+)
---
base-commit: c4b9570cfb63501638db720f3bee9f6dfd044b82
change-id: 20250122-myir-remi-pi-94d6055f5879

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


