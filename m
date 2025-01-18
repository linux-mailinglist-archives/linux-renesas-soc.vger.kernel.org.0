Return-Path: <linux-renesas-soc+bounces-12231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5044AA15C7E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jan 2025 12:23:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94B5A1889509
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 18 Jan 2025 11:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77211891A8;
	Sat, 18 Jan 2025 11:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="WXq69I56";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="R95BPdnS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0566D487BF;
	Sat, 18 Jan 2025 11:23:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737199392; cv=none; b=OmL3RmepMahXQQub8F+Rro6xv9QXRRh8C2DfQ0qHSHG40uUqdD5O1toC/7GrOapR80kGjUhGbcNJgIng5NqsOgGcGLybvIioUe8V3eEfzpIYDbbQvVXN7cK+lF6PqRy4S61hlsfAKblBnB0IGTHWbjPTt0/fi0XGzhF/e25AB2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737199392; c=relaxed/simple;
	bh=vkpRB5t/PEEGCgN5pU+oFSW/qrbsgGB32AkpUP/wrJU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFtS+xknfnPBNSXmW8z2H7OvF3CeUobVDk/9WlJoDcdYBNW25ZCdEV60eryOdGyQXLoCIoACFYYgeq+IAYBsvYvBf8T0utU1D7drtMEYZzEtszADmEtbrKpkj6bysGwCTgFSqp08cxjkLGmkj/sXbWkYlJKrSAhKOFBKNdsEEUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=WXq69I56; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=R95BPdnS; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4YZvBL1CXJz9sn9;
	Sat, 18 Jan 2025 12:14:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eu8ULTNQf6vReHQonx+XmcXAdagv6ur9LyVq1l1Nr9A=;
	b=WXq69I56TtPOVHwVlMVNkzSrXAmlxZQw+cnib3TSYv4E+W+pgyxbhj0KzbULwi+cXLcQii
	iMZLnBBQtwbK6oB02vm+oAEUck5HZJoY68ic8dW0f7sY5hEu0JXcJa6SXF+Y6r6rZhBhhF
	Mjlh+VmXHW2biGWSipgERs/lZcqTrkrjCuYZa1j7iwYblxMJ70duT1dGk5HIjs2R9Tj6MZ
	ToAXfhP8e7Mflh8P9LMfl2tZmP50wnD4qInQMMMCH5lccjrDULWP70mzLC5bYZyPYm6omm
	pJQhRGTZZBg4jYc10YK2EG8C+1FT8UE8iB6qMCzd8reCypF3TRUWabnSY5yw2A==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1737198856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Eu8ULTNQf6vReHQonx+XmcXAdagv6ur9LyVq1l1Nr9A=;
	b=R95BPdnST0g3Q47vJix6hYztsLpN65YbPVQyhgqlZaiGpeBbR/x90BmeIV0ISiiUFJXulQ
	SA6pnMWD3HxGVtnbO/ivKDPx5fdahAwj2kO2/dZt2RRQw0VHCo89okK96wcVz55z4qoog/
	J05vRVC57dDebOGeCtOuvCiUfGKqXBGaRd1QCWCSJ6/QXk7UCGKz+lvAcDJzaoJTfHazXE
	tVHJ1P+TfrlSp6vrjcbkO8l3oTOjIIUPf894G6Yu+LtdrdVD3NhNhDXeIVWh9BCYFdlUPs
	kK2Viohu0xvDRRQJNXzWEVqYOJYPPNZBFSZAJy3U/6WVFIhPjGfA4OPatcIEjg==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: renesas: s4sk: Fix ethernet0 alias for rswitch
Date: Sat, 18 Jan 2025 12:13:12 +0100
Message-ID: <20250118111344.361617-5-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
References: <20250118111344.361617-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: xhjmjm31tqrszmahhujpwwp7xfygckr1
X-MBO-RS-ID: a579b2b49b15999622a
X-Rspamd-Queue-Id: 4YZvBL1CXJz9sn9

Each rswitch port TSNn has a dedicated MAC address assigned to it,
so does AVB MAC. The MAC addresses for each rswitch port and AVB,
four in total, are stored in the FPGA populated on the board and
can be read out via I2C from bus i2c@e66e0000 address 0x70 offsets
0x58 for AVB and 0x60, 0x68, 0x70 for TSNn .

There is no single MAC address assigned to the rswitch itself, there
are three of them, one for each rswitch port. Instead of ethernet0
alias for rswitch itself, describe alias ethernet0, ethernet1 for
each enabled rswitch port. This allows U-Boot to insert MAC addresses
from its environment variables ethaddr/eth1addr/eth2addr into each
rswitch port nodes, so Linux can read and use one unique MAC address
for each rswitch port.

Note that it is unlikely this would break existing rswitch driver
operation in the Linux kernel, because as of right now, the rswitch
driver already calls of_get_ethdev_address() for each port to read
out the MAC address out of each rswitch port DT node, and if that is
missing, it falls back to MAC address settings read from the hardware
itself, and if that also fails, it uses random MAC address.

Fixes: 412f2224b3b6 ("arm64: dts: renesas: s4sk: Fix ethernet0 alias")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
index 4bf526535ee05..86a1945127529 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779f4-s4sk.dts
@@ -22,7 +22,8 @@ aliases {
 		i2c5 = &i2c5;
 		serial0 = &hscif0;
 		serial1 = &hscif1;
-		ethernet0 = &rswitch;
+		ethernet0 = &rswitchport0;
+		ethernet1 = &rswitchport1;
 	};
 
 	chosen {
-- 
2.45.2


