Return-Path: <linux-renesas-soc+bounces-11516-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E059F5F79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 08:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E5C0188186F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 07:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B1C5165F16;
	Wed, 18 Dec 2024 07:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bTbL8ysj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AE5158A1F
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Dec 2024 07:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734507713; cv=none; b=E8z9MbOHLg/D40iVoYOa7cZI0yABdUaiY6C02keoAD+pHtv1wcM9JdsajvtM6la/RRQIvwSdw3w9iYNbwgLaRaVvMXvu7GZMSp240ankIdjk5AL1LyLBxirsJJFXd6uLamNalxt1U6H6wYbYRaCwd7lg5qLCKAL8PpK1P1ndh6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734507713; c=relaxed/simple;
	bh=rFk3OhYbTOdiWgha4HWjJodfVOhpNMHrJ85zonqt76I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWw7TQWEMkcJuxSIfH73Nfo6WHXGkfO93Gm3Tln3hD0suNPcNeh6C/IotfhlfXGCSmk4pVueaL7r2we1/Xo5uVI0UT+bIK1bDT7nCYyhYposFDQIgEwh0kRcCpbCWUaSkemQF1CG5oJCBU2h+WuprQ7V5dCLZDQ8kO9SPvalay8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bTbL8ysj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=CA4QQLhX5JgwiU2FFQmxGsPl7AlRiNj9yNanvNh2mUM=; b=bTbL8y
	sjaU1vRwYbvCww4wMMd0O9memEwCJyriAJS3/qAUZutn7drnKbcXK+S5BB4aKbYB
	WYav1Tbdxrhgtu6YROcFKcR3IyyfMCnjZufzXQimwztCIaSzbm0DHOhf5ZUC4D9y
	2iQ3W2xaS4caEuUGvI7ZMhvjk5caG02LG9u28giD1w1RRsNzyYXUE2xXhw7Ehgr6
	gVd0jNdry7zPNbXqvG23jUxAZRR3qQvJAzenCfxf+cVljBE7XnH6acFMgT4HsClF
	DynYW3M1z4wDJ+/nZR+LeqOC9S8Ol6yAB35xPo/adU+Vo3mv1KlMslbup7BcUA3f
	WkN//Bqy5S28C6nA==
Received: (qmail 204891 invoked from network); 18 Dec 2024 08:41:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Dec 2024 08:41:49 +0100
X-UD-Smtp-Session: l3s3148p1@EYvYi4YpVpwujnsY
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 3/3] hwmon: (lm75) Fix LM75B document link
Date: Wed, 18 Dec 2024 08:41:34 +0100
Message-ID: <20241218074131.4351-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241218074131.4351-5-wsa+renesas@sang-engineering.com>
References: <20241218074131.4351-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NXP reorganized their website. Update the link for the LM75B datasheet.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v1: new patch

 Documentation/hwmon/lm75.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
index 9877ddbbf7c8..c6a54bbca3c5 100644
--- a/Documentation/hwmon/lm75.rst
+++ b/Documentation/hwmon/lm75.rst
@@ -129,7 +129,7 @@ Supported chips:
 
     Datasheet: Publicly available at the NXP website
 
-	       https://www.nxp.com/documents/data_sheet/LM75B.pdf
+               https://www.nxp.com/docs/en/data-sheet/LM75B.pdf
 
                https://www.nxp.com/docs/en/data-sheet/P3T1755.pdf
 
-- 
2.45.2


