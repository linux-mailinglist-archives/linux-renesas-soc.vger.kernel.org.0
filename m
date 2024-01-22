Return-Path: <linux-renesas-soc+bounces-1641-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E2983649E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 14:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8274B238C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jan 2024 13:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9648C3CF74;
	Mon, 22 Jan 2024 13:43:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738293CF7C
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jan 2024 13:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705931030; cv=none; b=rlkjOFnNdiI37eI/7W0tCQCc13ApDimLNPzdX6GhBXXKEA8NkgO40XzdUYQubmk3W0S1Diq8lgkYNuFWYO2UtIEh+3vSmmjLRH7655epnQnZhjC9MuVvQyKC4AOG+RmlCBBMIPUmmuuVDrug7mYz/1Fw/i2aWguSVWwUx7ePN9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705931030; c=relaxed/simple;
	bh=qZCpKYRn/rMmDIaM/pktkAZ1VLB0JuYM+7dXHmKtgpw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XKjEk4d/Y28eGkhhOyDq88lBGM5g2dGihqF07PavWNrNqbiHuhQeXcnXclql1qjF4cKmYh9P2cUPyebsREtl2vqYnTcY28tAs5/bKIRKHzydbfAP+C7+xRaPRAhuauAn91p/IqBN2aqNnXmlQjZWD6G27rZ8+PaSThZniE//3Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:955e:bba5:7ff4:cfb6])
	by laurent.telenet-ops.be with bizsmtp
	id dpjg2B0050ZxL6o01pjgNo; Mon, 22 Jan 2024 14:43:40 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRuZf-00GGv6-2y;
	Mon, 22 Jan 2024 14:43:40 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rRuaS-00CDsf-2i;
	Mon, 22 Jan 2024 14:43:40 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: checker: Limit cfg reg enum checks to provided IDs
Date: Mon, 22 Jan 2024 14:43:38 +0100
Message-Id: <c7385f44f2faebb8856bcbb4e908d846fc1531fb.1705930809.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the number of provided enum IDs in a variable width config register
description does not match the expected number, the checker uses the
expected number for validating the individual enum IDs.

However, this may cause out-of-bounds accesses on the array holding the
enum IDs, leading to bogus enum_id conflict warnings.  Worse, if the bug
is an incorrect bit field description (e.g. accidentally using "12"
instead of "-12" for a reserved field), thousands of warnings may be
printed, overflowing the kernel log buffer.

Fix this by limiting the enum ID check to the number of provided enum
IDs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-pinctrl for v6.9.

 drivers/pinctrl/renesas/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/core.c b/drivers/pinctrl/renesas/core.c
index 93e51abbf519aa8e..8f6d7cc25b599149 100644
--- a/drivers/pinctrl/renesas/core.c
+++ b/drivers/pinctrl/renesas/core.c
@@ -907,9 +907,11 @@ static void __init sh_pfc_check_cfg_reg(const char *drvname,
 		sh_pfc_err("reg 0x%x: var_field_width declares %u instead of %u bits\n",
 			   cfg_reg->reg, rw, cfg_reg->reg_width);
 
-	if (n != cfg_reg->nr_enum_ids)
+	if (n != cfg_reg->nr_enum_ids) {
 		sh_pfc_err("reg 0x%x: enum_ids[] has %u instead of %u values\n",
 			   cfg_reg->reg, cfg_reg->nr_enum_ids, n);
+		n = cfg_reg->nr_enum_ids;
+	}
 
 check_enum_ids:
 	sh_pfc_check_reg_enums(drvname, cfg_reg->reg, cfg_reg->enum_ids, n);
-- 
2.34.1


