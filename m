Return-Path: <linux-renesas-soc+bounces-23120-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E475FBE0BA3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 22:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C80224F4AED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Oct 2025 20:59:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B044E2D8390;
	Wed, 15 Oct 2025 20:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="h4KSYI8e"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A633254A0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Oct 2025 20:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760561979; cv=none; b=qvL9dk2ou1LptMfIBRT5Oav0ZW4vqMhP5PvcRm+OHV+6RQzGQ470JpkQZqCdKIKQEPCBSdEEL+zho6mvSQj3tmcYo1Cl8HTQdsfQcbr3YaJLssBUEhDlYBKIgVFHUApcJkoP2Bgs1CkHYyJGbbjVCR9NoxYuz1C99fXqBNEqg1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760561979; c=relaxed/simple;
	bh=hHkJaslv9pTSLcWmR4NJ6/1Y+F2EdqwOR0WtkBGIEVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MMqRpwMMqICmAD83JRCy1xirgDilJDGpmOuVR+9xjGYorWCnZiX7/AQtwNfG/93eIlYYDpjCFbATH9WoKBzOCyi4WRBKbJreg3dniJsd+vO4A98am/jL8cjYCapoHhUg0N/0/4QoZtWH90m6GQHcGq2w8bZ6szY9Eg2t1JmhMEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=h4KSYI8e; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=qrOpAnaFk5u2q+ex2NLTTT5QD1yc7kE8oi/y+jafIAE=; b=h4KSYI
	8ev+93M6g7vq6J1HaNJZADJsTcu7SaBksA8eT+62i9d6K8+8fJK6I9QhvnDvRAe3
	gwyq6PTMFB6GzNgR90g4Vy8iKjWj7NczAgxBtxz7zyAqTSVpsZ5awyU4xphBMqwn
	W4z4/GaqYkTO1RA8fLgynkf/XDRCMPwjkmRfeN61JbTWlLx1qgmVsepYmxh8y1UP
	lh7GDw/BH0Wwd3TNM1xT+KKCrvVxXZdyM52p2m/eXDbdZTbr18VTQsgi0yBOW6Y/
	4ysxC5NHQFs62aF4bsjwmwZbaATA8TFc4nIKWS1qMRrHtszCRUjCalaygXpkhDC3
	5042f9n5rY2BojZg==
Received: (qmail 3545000 invoked from network); 15 Oct 2025 22:59:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Oct 2025 22:59:33 +0200
X-UD-Smtp-Session: l3s3148p1@yU8NxzhBbrMujnsG
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v2 2/2] reset: always include RESET_GPIO driver if possible
Date: Wed, 15 Oct 2025 22:59:22 +0200
Message-ID: <20251015205919.12678-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
References: <20251015205919.12678-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reset core uses the reset_gpio driver for a fallback mechanism. So,
include it always once its dependencies are met to enable the fallback
mechanism whenever possible. This avoids regressions when drivers remove
open coded solutions in favor of this fallback.

Reported-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Closes: https://lore.kernel.org/r/87a51um1y1.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since RFC v1:
* new patch

 drivers/reset/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 78b7078478d4..7319bcd251dc 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -5,6 +5,7 @@ config ARCH_HAS_RESET_CONTROLLER
 menuconfig RESET_CONTROLLER
 	bool "Reset Controller Support"
 	default y if ARCH_HAS_RESET_CONTROLLER
+	select RESET_GPIO if GPIOLIB
 	help
 	  Generic Reset Controller support.
 
-- 
2.47.2


