Return-Path: <linux-renesas-soc+bounces-9963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D919A9C55
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 10:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4285B1C2353C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2024 08:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2011A16BE1C;
	Tue, 22 Oct 2024 08:24:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0ABB161310
	for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Oct 2024 08:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729585492; cv=none; b=GPRQCt523HPcUhM+6iHXtpVWFtl50Rj/511MlyzFKjX2ee0WFiuGOc0NCWcSU0RUviWct0TALWQsvirg7Awv7+zEOImLt1l2JxaH8TR0BFjaE3Bj8f+XKddPjBP0vohBaGH5YwL5J88pmrOGzE/9eNdI6rygI5oaLViPehUkMD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729585492; c=relaxed/simple;
	bh=uH8Z9LYOHW09CTfJnZa+MW4QjnC0bl1ZQOuEVypjb74=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CgPPjwWrL5HvBsS3Xl0PGJRpmc0s6SLYxJbhHGeNkpe7obnKye4az87369gU45/w6w1Qm2KkCvW2pOvylf8zG9n5xXrsZawuK5ycxnOIhe2GM+tZj+p/LEor2IHkhoCcpLBHqHBtLBYhZm7/1Dt0VqypjiCGWHHnchXZbpCm39c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.11,222,1725289200"; 
   d="scan'208";a="222639816"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 22 Oct 2024 17:24:42 +0900
Received: from localhost.localdomain (unknown [10.226.92.236])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7BF9140078A5;
	Tue, 22 Oct 2024 17:24:36 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Improvements/fixes on the DPI interface
Date: Tue, 22 Oct 2024 09:24:22 +0100
Message-ID: <20241022082433.32513-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to add fixes/improvements based on the latest
RZ/G2UL hardware manual

As per Table 33.4 Clock List, the maximum dot clock for the DPI interface
is 83.5 MHz. so, reject modes higher than 83.5 MHz.

Also drop DPI_OE macro as the bit definition is removed from the latest
RZ/G2UL and RZ/G2L hardware manual.

Changes in v2:
 * Added as a patch series as the patches fix the same driver
 * Added Fixes tag for patch#1
 * Moved .mode_valid from crtc to encoder as the new state is not
   available in crtc and instead, we could check renc->output for
   .mode_valid() function of drm_encoder.
 * Dropped rzg2l_du_crtc_atomic_check().

Biju Das (2):
  drm: renesas: rz-du: Drop DU_MCR0_DPI_OE macro
  drm: renesas: rz-du: rzg2l_du_encoder: Fix max dot clock for DPI

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c  |  8 +-------
 .../gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 7 deletions(-)

-- 
2.43.0


