Return-Path: <linux-renesas-soc+bounces-23235-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F94BE8745
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 13:51:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBF93408186
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Oct 2025 11:51:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFBA02676DE;
	Fri, 17 Oct 2025 11:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="jHvFOOyW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E11D22D7A5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 Oct 2025 11:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760701906; cv=none; b=dtjh/ZEmA0lP6gfZaEgMddPwVFMBzkzVSdiD2FuQNsHoyiPVeFzHymM2sHGJOGb83N90m6SfsDoAgR36JUETlxLUtZ+ghifKoxzML8BAco50e4sxZxooacMoll5UtbmKGARGnwyvuOjscMaXN2DH0rbjXupMnCF4XSFawY3tFDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760701906; c=relaxed/simple;
	bh=BuBLsf7HKrPMO6TDqjOygFjIMQrypaxScr3nn1khTmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bn2DtYHWbnZiBnBVBKCK5TPVCGyR90x8pDwe6mNchegl9+2Ylw00XGzjv+vBxuazpRclwRwfSVmYEEfFizqQB7c7JSbKzcaM+LnB+bt9CVDLgIco0tDqotUhB5APnjORiwyyi9RQxuP/QSBq/FK306MCDce5c8H5lpaz/fFxUUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=jHvFOOyW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Q2AGX8dnNvvzvw
	hpP7d+pi03iieJsU41slbnOSPvwOE=; b=jHvFOOyWZOJ8Q4l9pxtCge3L8R1/6x
	6Qfhyvi6/38c6cAGY+ZgUS1J3x5/MN5nPB6RFBMvgoT5IbgqEMBPBok+jbY63n8s
	M8Uel3BuAXh9NSi2uqq7pBK6govFS7yBaJUihEQFSk5y++UPAZWe8h10UuPM9Wx+
	QiT9ICoYSOE2rb5Dbxl3f1hJkLHnpwbA4VS2nHd5FvbyMa/Y3qxlSkVgsapANAt9
	3FyEZ3uk8uC0rBcKwLUQrMRad7OoZ8EZaVAl9JAxPdeSZMU+YHurne/J8dAddxy5
	rBNJ4i6ozEaVZC9kfz0ehtIe3K/uSNtSypAS72WXPwEaYqqFt/UUJM3g==
Received: (qmail 17832 invoked from network); 17 Oct 2025 13:51:35 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Oct 2025 13:51:35 +0200
X-UD-Smtp-Session: l3s3148p1@ndr0WllB2OYgAwDPXwQHAL/S9V79e5yL
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: sparrow-hawk: don't reserve SWDT
Date: Fri, 17 Oct 2025 13:51:11 +0200
Message-ID: <20251017115123.3438-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

SparrowHawk may run without ATF but with U-Boot SPL which does not
reserve the SWDT. Remove the default "reserved" marking.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested it by using the SWDT on my board.

 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
index 161c083241f9..1da8e476b219 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
@@ -942,8 +942,3 @@ &sensor_thermal_cr52 {
 &sensor_thermal_ddr1 {
 	critical-action = "shutdown";
 };
-
-/* Firmware should reserve it but sadly doesn't */
-&swdt {
-	status = "reserved";
-};
-- 
2.47.2


