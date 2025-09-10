Return-Path: <linux-renesas-soc+bounces-21734-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC85B51F83
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 19:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7354954461D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Sep 2025 17:55:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFC4F33CE8A;
	Wed, 10 Sep 2025 17:55:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37F7338F55;
	Wed, 10 Sep 2025 17:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757526915; cv=none; b=Kq1i220gSy37DlkTSdpQrYgOSDP6vpbO6tDQ/J29riDAaH4WBUwY111YXctzZgHaW2trJq6s6FGLgf7t+kv7jbfCW5ON00twLx/5gV6E9MwQSMhVrL+bNhneqkfyC4Q5nmvI7ocIAEZBstpD/KN7EEZlQZsi5RZJAYUZlGbVFkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757526915; c=relaxed/simple;
	bh=dVwe7SromTzyP65UkhWR26EDfDV0kLIswXvkxFF2EbU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LyONKtDnDzc1Vxtu8QcpXFWQgRpUBkIFMPY031rHQeqPBD2pbRlfQmZKtjuWobU+SGvKOFIP9OPKwpONWdjhMy/FX7GnZJ3GbODUutnr3FMwIbHx87bMfuO/oWskGSocLL6zq8C4VtmDjFSrCZaeogbDzKg88F5D3NDFofQ/V8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: mUYlKe/lSN2oZjXhq1e96g==
X-CSE-MsgGUID: TGJeayQDTBCAbO+oh4PObQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Sep 2025 02:55:05 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.32])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id B282E4031317;
	Thu, 11 Sep 2025 02:55:02 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: 
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH] nvmem: rcar-efuse: add missing MODULE_DEVICE_TABLE
Date: Wed, 10 Sep 2025 20:54:13 +0300
Message-ID: <20250910175415.8698-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nvmem-rcar-efuse driver can be compiled as a module. Add missing
MODULE_DEVICE_TABLE so it can be matched by modalias and automatically
loaded by udev.

Fixes: 1530b923a514 ("nvmem: Add R-Car E-FUSE driver")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 drivers/nvmem/rcar-efuse.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/rcar-efuse.c b/drivers/nvmem/rcar-efuse.c
index f24bdb9cb5a7..d9a96a1d59c8 100644
--- a/drivers/nvmem/rcar-efuse.c
+++ b/drivers/nvmem/rcar-efuse.c
@@ -127,6 +127,7 @@ static const struct of_device_id rcar_fuse_match[] = {
 	{ .compatible = "renesas,r8a779h0-otp", .data = &rcar_fuse_v4m },
 	{ /* sentinel */ }
 };
+MODULE_DEVICE_TABLE(of, rcar_fuse_match);
 
 static struct platform_driver rcar_fuse_driver = {
 	.probe = rcar_fuse_probe,
-- 
2.51.0


