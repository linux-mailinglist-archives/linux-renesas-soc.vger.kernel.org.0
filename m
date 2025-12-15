Return-Path: <linux-renesas-soc+bounces-25740-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 83512CBC4BE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 04:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D4B87300956A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Dec 2025 03:14:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336D931813A;
	Mon, 15 Dec 2025 03:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="AmN2dhxQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A0A317706
	for <linux-renesas-soc@vger.kernel.org>; Mon, 15 Dec 2025 03:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765768459; cv=none; b=DLBHNlwyrSWlKICv5N8AryXxFeI1B6EjucAaiBkAahINsMSg4nkhdUxP/L5xo9/PdtfSqZiNdNgNqlzQ1IMGjAKCjfccEVuL7k7zUQTfr/gMDY4arjB9GXlFZLgWrAbHcPkhZO7bgDXt8YO6qUUqOiKecJ0cIcs9HyDp1X1uHGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765768459; c=relaxed/simple;
	bh=MDeh+89oomByt6cjWN1m0BISXbKaC9dsHoDuE5U3mDc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mVCHqDOl9OdqweeHTBOl6skwpxR/za+t2MW27uLWDgxysnGVMX7yU1La0v1WA8k7GDcJkmnxinEKaUcOe5Rx/Jy3xyqvhPdFHn2gwn1wXhn+QJ5g775dv4ce5vt5Yh/Ru08hJCywJ2nj3UWZz+ohfk3rXCR2cBZ/v5fifM48W7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=AmN2dhxQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=4jUs/VaFHgXOaG
	O+VOybNnvqkhLy8H3erULqAQkwEqA=; b=AmN2dhxQFC8zXVNPKut480dzqk3LZ8
	Wls9WuiPLZFBQVdVFiZFK4BOYsmBivg4sP7Y9zxGfh4++wWb8V15GFmy2C86e7tL
	n4lIRKk7alkqbVaV4eUv3OCSZsDshIUlAn18/jJmAUKc6gSKzYVIY5wC14A+S0DW
	jBcnAh/XUIwViqiO/3DJKUyqtXbAyfELzE3ZpyzY2kIqoFkIW1n/rdhLprxzODXh
	kQeq0rbenZx8Rn5i75PiXZwsh5U134NcrzrLW9S6yDMaDveZIH4R/KavGGt/MZ8E
	9LH8i48+zQaDRYbN6AO1KA7YJy0+NzT+8Le4wA2iltpiMq+EHRJ45oXg==
Received: (qmail 801534 invoked from network); 15 Dec 2025 04:13:59 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Dec 2025 04:13:59 +0100
X-UD-Smtp-Session: l3s3148p1@WeTh//RFQo/N3IHs
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH 0/2] arm64: dts: renesas: v3h: add SWDT node
Date: Mon, 15 Dec 2025 12:13:17 +0900
Message-ID: <20251215031318.2219-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binding update which describes the V3H exception for the SWDT (no
resets) is now upstream. This series adds the DT support for it. Tested
with a Renesas Condor-I board. 

Wolfram Sang (2):
  arm64: dts: renesas: r8a77980: add SWDT node
  arm64: dts: renesas: v3h: mark SWDT as reserved

 arch/arm64/boot/dts/renesas/condor-common.dtsi | 5 +++++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts | 5 +++++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi      | 9 +++++++++
 3 files changed, 19 insertions(+)

-- 
2.47.3


