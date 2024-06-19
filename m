Return-Path: <linux-renesas-soc+bounces-6484-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B0590E842
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 12:22:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 33011284303
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2024 10:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5430780026;
	Wed, 19 Jun 2024 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="apuU+xC6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08EF12EBE8
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2024 10:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718792563; cv=none; b=GKppf3sQ8T6bDKWEmC2KcTG+bK5P6phUNYetDKBLQUV4laaNQ/YOEcYv8/LqLkFw9jOA4FUIdu9tSU9TCH+sLLTo33qqvRHcVRFFdziWsEw4NXHcy85TT+X2YguZYCHTb5LBb4V+ZoOjPtS9xWHRh5zqFYwKHXAQgbW+JmmtTYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718792563; c=relaxed/simple;
	bh=kWppy7kzX76ZP+Kpg/QDqihgHRN9nqTNMekCt0x6Qoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G9ZfubU5beutRFBMZWOacEP1LHVixN5djsRFfF2EQhOAKnR6kFaDb4uWGIjq0vAvqhs9Re0wS6QgjwyOz8qUPyANP++7PU71gev2lsUMsnoooKTLlnD5kDquyO5gU133CipVfpNYIR8qNQGi7T7Wh9b3LrPUMxS3rswRZWDVUtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=apuU+xC6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from localhost.localdomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 401FF541;
	Wed, 19 Jun 2024 12:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718792540;
	bh=kWppy7kzX76ZP+Kpg/QDqihgHRN9nqTNMekCt0x6Qoc=;
	h=From:To:Cc:Subject:Date:From;
	b=apuU+xC623Yzch46x/LoqJVld3VZqht11mIPwt5GBZFBH9OK5Yp0/JG1U/71plxZo
	 /zER3ayrwrHGTmjZ5Gig3bcb0RiRTgjlP47noeMhP5M9AFIZQZfUjbYDREnvCiSbDB
	 lJtuX3+Ei5XwrbLfoU9jvTzUuUCXVqiu/9olJq4s=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR RENESAS R-CAR),
	linux-renesas-soc@vger.kernel.org (open list:DRM DRIVERS FOR RENESAS R-CAR)
Subject: [PATCH 0/4] drm: rcar-du: Add support for R8A779H0
Date: Wed, 19 Jun 2024 12:22:14 +0200
Message-ID: <20240619102219.138927-1-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series upports from Renesas BSP at revision rcar-5.2.0.rc18 the initial
display support for the V4M SoC (R8A779H0).

The series includes two small bugfixes and then adds support for the
V4M SoC to the R-Car DU module and R-Car DSI encoder.

Compile-tested only as I don't have a Gray Hawk board available yet.
Once the board will be available, DTS integration will follow.

Jacopo Mondi (2):
  drm: rcar-mipi-dsi: Add support for R8A779H0
  drm: rcar-du: Add support for R8A779H0

Phong Hoang (1):
  drm: ti-sn65dsi86: Check bridge connection failure

Takeshi Kihara (1):
  drm: rcar-mipi-dsi: Fix CLOCKSET1_LOCK definition

 .../display/bridge/renesas,dsi-csi2-tx.yaml    |  1 +
 .../bindings/display/renesas,du.yaml           |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c          |  6 +++++-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c  | 18 ++++++++++++++++++
 .../gpu/drm/renesas/rcar-du/rcar_du_group.c    | 17 ++++++++++++-----
 .../gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c    |  1 +
 .../drm/renesas/rcar-du/rcar_mipi_dsi_regs.h   |  3 +--
 7 files changed, 39 insertions(+), 8 deletions(-)

--
2.45.2


