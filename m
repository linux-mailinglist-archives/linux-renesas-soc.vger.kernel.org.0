Return-Path: <linux-renesas-soc+bounces-12496-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 24392A1C35B
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 13:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B03C73A6053
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 25 Jan 2025 12:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92B26207679;
	Sat, 25 Jan 2025 12:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Z7PbnzCJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E25C1E505
	for <linux-renesas-soc@vger.kernel.org>; Sat, 25 Jan 2025 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737809615; cv=none; b=aKP8Pssw+XxOjKc07OSDZyCVmoGrnyj3zqhaXLhgI5BNX6dJSESJgC4eElaljkQRRi2oJ2ond0zKf/1iYpACq44ga2ryZKuTADg7hqbaUEuTC4CPLMyGg8ERfsSi/hWsAt6/dEzNUZwMvDrnMnqL360+F//Rr3vPAKJjf1SULMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737809615; c=relaxed/simple;
	bh=X1ldVZ5OCh7gxNKgVTT0hS8sHeyDf5xyGSd/51c2HlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fW9X+4V0HPVhINpp3OWYu3/CZs+CLba/tKFoIC8toR1PC+imDjAtxg0bzxesezymntH9uUhN61TcTCU51/aN7OkC/+mR7vxSx22iiMMKJyQbdlmmd9jreTtd340AQ3aiJFA1CuwGNx+fYRGMwBb3LWWioPVBi/VYIo+b/BcyGoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Z7PbnzCJ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=HWjjmeHvBqbc+F
	1yzEyVbS+f2/QIx04bCBQew3BP4yI=; b=Z7PbnzCJow12cntYXjE/pJnXkacbe4
	3UbCcVHGSGgkP9NVSsSr/+vYtsn0rzZn0adiLp6L4bSDMSsJimNV7yNq/m6iE1KP
	9US/EYumlsCzD/vallmQ4Pzoy9AXp/CuqXE2My4kNqh0Smg9dZbhjo/oL0Ygu4Z8
	gzhOARfJVPSKE4VZzAG0VFEMS/9PFweUstVZCvYlBL4oiC7lRjsJpU9DpzRGQAQw
	I4aGSOABiSW3pvfiHU/iQjn2MSWjReyQSXBAc3e2VffZiIs39gayF+LAimvJfzcY
	0Ju4cPaYZ1SStSMOAGTojQSpX1fqE6xv0b8trP+MHVPEWv5C6jKoX8Bg==
Received: (qmail 3873897 invoked from network); 25 Jan 2025 13:53:31 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Jan 2025 13:53:31 +0100
X-UD-Smtp-Session: l3s3148p1@Vy+NVIcshsYujnvm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Douglas Anderson <dianders@chromium.org>,
	dri-devel@lists.freedesktop.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH RFT 0/2] drm/bridge: Use per-client debugfs entry
Date: Sat, 25 Jan 2025 13:53:20 +0100
Message-ID: <20250125125320.37285-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The I2C core now offers a debugfs-directory per client. Use it and
remove the custom handling in drm bridge drivers. I don't have the
hardware, so I hope I can find people willing to test here. Build bots
are happy. And for it6505, it even fixes a problem. See the patch
description there.

Looking forward to comments.

Wolfram Sang (2):
  drm/bridge: it6505: Use per-client debugfs entry
  drm/bridge: ti-sn65dsi86: Use per-client debugfs entry

 drivers/gpu/drm/bridge/ite-it6505.c   | 28 +++-----------------------
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 29 +--------------------------
 2 files changed, 4 insertions(+), 53 deletions(-)

-- 
2.45.2


