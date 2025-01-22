Return-Path: <linux-renesas-soc+bounces-12335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0332A191E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 13:56:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5A4816299A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Jan 2025 12:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04301212FA5;
	Wed, 22 Jan 2025 12:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gX48H0S2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0619C211A18;
	Wed, 22 Jan 2025 12:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737550572; cv=none; b=Km4R4PRfM1zrRZB8ko24L70JqV25xHVXNCsqslO89X0uwF9+SuFJPi7vF6f6sAa3p76A0KC8IjBQBeUdh0J9JJ4pJlsyi/Anlre8JaCn+Mo2n3hOU+GS9DsoOicPvI5oSKhmgmkHkIIQv511H/+D0VhhyHWCT8yTGYRbpAhwr+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737550572; c=relaxed/simple;
	bh=yzzK6P9T0Nfwzq/iLd4iwd8xLNSXjxWZeFmI+WtUmh4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fet/XPzoN+vi5oiHCQrz7IrPdtMvVOfDgFNpgtFwoIsUEAqXdoPaojKnmuUiypl18uSaKAFG31uAgFeFvjPzL+SpyfCgZN/D1qT+Cz0QDJVfnOMHAoGLUaNjHTchLVDrfQ37PdM+qHc4v1e59UJalaHwzKU4NOeEEGTu3JzCoBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gX48H0S2; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737550568;
	bh=yzzK6P9T0Nfwzq/iLd4iwd8xLNSXjxWZeFmI+WtUmh4=;
	h=From:Subject:Date:To:Cc:From;
	b=gX48H0S2m91azCdKK3+FpneakAhfQ3y5G2zJQBGRIurx4MZqfrFXXY7uXY/h/1yXk
	 FhaxmX8rDCP6E4AsP6a2zB8YmUhezjb9Tir5ShLmHO7rykeufrO4NSZ7Ubj1sYe2qF
	 naeS113U5GQA79JTQzZQ0xXjXk2w27QS330K4HD2wgZzx0cRvB2Q594h2TQy2QPs5R
	 go6p8tLd/FKZGfFtPH10LUicQ1Ridp8qey/Brj16jmZ9/yW8b5erCwFBf4ACbcKlKC
	 OoSbqrB0vB+OpnwPRrihYBojBbtjN9RwPT2CuKjKCv9VIdcd1S4VSO7Ubp/HHOJIVl
	 7ZNCpe/HAZAdg==
Received: from apertis-1.home (2a01cb088CCA73006086F5f072c6A07A.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 681A517E0D03;
	Wed, 22 Jan 2025 13:56:08 +0100 (CET)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/2] Add basic support for MyIR Remi Pi
Date: Wed, 22 Jan 2025 13:56:04 +0100
Message-Id: <20250122-myir-remi-pi-v1-0-0e44e1cb8a90@collabora.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOTqkGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQyMj3dzKzCLdotTcTN2CTF1LkxQzA1PTNFMLc0sloJaCotS0zAqwcdG
 xtbUA+DbnbV4AAAA=
X-Change-ID: 20250122-myir-remi-pi-94d6055f5879
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
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
Julien Massot (2):
      dt-bindings: soc: renesas: Document MyIR Remi Pi board
      arm64: renesas: add initial support for MYIR Remi Pi

 .../devicetree/bindings/soc/renesas/renesas.yaml   |   7 +
 arch/arm64/boot/dts/renesas/Makefile               |   1 +
 .../arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dts | 420 +++++++++++++++++++++
 3 files changed, 428 insertions(+)
---
base-commit: c4b9570cfb63501638db720f3bee9f6dfd044b82
change-id: 20250122-myir-remi-pi-94d6055f5879

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


