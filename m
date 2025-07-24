Return-Path: <linux-renesas-soc+bounces-19654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C63B106D5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jul 2025 11:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA5DFAE64CA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jul 2025 09:41:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B5AD23BF80;
	Thu, 24 Jul 2025 09:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="c6bg7IhS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCF0238C12
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jul 2025 09:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350114; cv=none; b=E2jU5GzUuIdQ9Cg23l1/FWvwaZDYNOuGN5Xv1YcZBI3HGe/kioGkvupia1WFN30tpKKX0AUgL8yAz0Ff7mhOKEK46Fa8RSqx4FnQxF7Nodbh2doCzwRsF1aGqe0lM0dURt4i3yO16bvGdqqxVxaOVX/fJcnNLOskomCly9HmJVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350114; c=relaxed/simple;
	bh=Ok2gYWkBpSE3kYGPDMLj/xexqbDVMtnu0crufGbrSG4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X0z4aFSrTyfRv+gkSsZ42grdTNSkSv5TFvMQJl5/Qn5r6rWxFnWGAFSv7ow+vZ0JRBn5wEwZG5Ufm11IbXEMeJjN0EULBh85Rp6MWErj3NnIiVnd0c0k0ig7/e1dAgkMUbEV1RvUVDcuAyHfNhldhGPNHfeyLxviWCIwF8V5IfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=c6bg7IhS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=rvzJXaZHG5qa4ogKCyj9JXcr92SrEjaJj6v6MAWAt4s=; b=c6bg7I
	hSXQOIu8lg/UT9c3Nk7bb1NqJ/RMZwQ0teH4Wu5dPnWa3h8L31Utq//rUIqDYYhl
	LT/B/w/JSc4Fa/tF+OL76gBz15bczT8L2vRxJDsMZvnKyfW0iSW3SGWzUSjFkS0r
	bNYrKqfbzFRnGCd5/Vt+zQD2hph0Txy0nJYfidVoMLVAEpMgf3SSn3fNvXpdIRDi
	1K/voSLeVu3eKbkgM7pprKurZ8LzUE66boeEBsgjp/eDej1SEJrN0RmwFxJWdQFz
	BPiJHM8tclAuj+5yNP3GYhAETz9nSNhtjQtcxbfHpJh+jY6DozF8/ERKSdeQOViN
	4KOB0KoCfCEWyHOg==
Received: (qmail 2016561 invoked from network); 24 Jul 2025 11:41:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2025 11:41:49 +0200
X-UD-Smtp-Session: l3s3148p1@UHdroqk6AJkgAwDPXyBWAATEinPyanBm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org
Subject: [PATCH v5 2/4] i3c: Add more parameters for controllers to the header
Date: Thu, 24 Jul 2025 11:41:41 +0200
Message-ID: <20250724094146.6443-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
References: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add standard timing value definition from specification.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---

Changes since v4:
* fixed a spelling error in the commit message
* dropped the subsystem wide default timeout value as per:
  https://lore.kernel.org/r/aIH1zUb8tyIlyC3S@shikoro
* added tag, thanks Tommaso!

 include/linux/i3c/master.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 7dfcbe530515..043f5c7ff398 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -254,6 +254,10 @@ struct i3c_device {
 #define I3C_BUS_I2C_FM_SCL_MAX_RATE		400000
 #define I3C_BUS_I3C_SCL_MAX_RATE	12900000
 #define I3C_BUS_I3C_SCL_TYP_RATE	12500000
+#define I3C_BUS_TAVAL_MIN_NS		1000
+#define I3C_BUS_TBUF_MIXED_FM_MIN_NS	1300
+#define I3C_BUS_THIGH_MIXED_MAX_NS	41
+#define I3C_BUS_TIDLE_MIN_NS		200000
 #define I3C_BUS_TLOW_OD_MIN_NS		200
 
 /**
-- 
2.47.2


