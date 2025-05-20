Return-Path: <linux-renesas-soc+bounces-17271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACE3ABE0DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 18:40:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27C80164EFD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 16:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0FA267F5C;
	Tue, 20 May 2025 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="lQgFj9Ud"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E464C1C8603;
	Tue, 20 May 2025 16:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759246; cv=none; b=IvcS/Sw1B3mBTB8SK4LU7oScH1DZ+b0bX8mHROkO48arfjk6a3WXFsEovxsNNrS3XKM2JcwdkbRvl6e99TVjV3rkO905DffN7T1rs+6NXZsZrTQtoijJ6F2Ukln6vYDuZFG71pEJJHRwgb86h62IwbDnAGuDcEmflfM4GflnLl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759246; c=relaxed/simple;
	bh=Tl8lzKHXNXn/Zu/o9Z3avkPg6ghJNWjZjo1V6t1gsiM=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=gma5izvqMLJ1UqE4I9+W66VWc0NUqovyI83EtZdBG4c8b1Kd4NmVM55TaL2UFNEvjnQbQ/u5W9FrS94VOaLrL3nCIsvH3sjmnRmPra1qeMF1B5pBktGIztXHsUVeeLZ4/gW2pVr44MVKn94mU51iNQJRUW4xERKczl7MYKlEUvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=lQgFj9Ud; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=sP2rVu5jnwxUO72jmL6eSd4CMirYzTBwpx/d+gSHvDY=; b=lQgFj9Ud336mdN2YdkQiAbXomX
	j+UkugqROqKTXD7steKhTMXk1RF7D1wS+bRH6yJq9FGOvkVnWh0eKPsqE9PFgnn3X7okq3Hvu8yBF
	jja3KVKMU2NTjeA3iTmcFmQvUK66ffJYB6Ve6tNe/ylsqkALYq1yQEMTtpy1HbKjBaB4=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:50854 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uHQ16-0006BF-8o; Tue, 20 May 2025 12:40:36 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: biju.das.jz@bp.renesas.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hugo@hugovil.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Tue, 20 May 2025 12:40:32 -0400
Message-Id: <20250520164034.3453315-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI command support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Hello,
this patch series add support for sending MIPI DSI command packets to the
Renesas RZ/G2L MIPI DSI driver.

Tested on a custom board with a SolidRun RZ/G2L SOM, with two different LCD
panels using the jd9365da and st7703 drivers.

Tested short and long writes.

Tested read of 1 byte, 2 bytes and long reads.

Thank you.

Hugo Villeneuve (2):
  drm: rcar-du: rzg2l_mipi_dsi: Implement host transfers
  drm: rcar-du: rzg2l_mipi_dsi: Set DCS maximum return packet size

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 184 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  60 ++++++
 2 files changed, 244 insertions(+)


base-commit: 7c1a9408ce5f34ded5a85db81cf80e0975901685
-- 
2.39.5


