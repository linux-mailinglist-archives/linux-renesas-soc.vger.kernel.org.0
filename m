Return-Path: <linux-renesas-soc+bounces-17842-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17096ACE0CA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 16:55:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D568F16BF5D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Jun 2025 14:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6984928F950;
	Wed,  4 Jun 2025 14:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="pwmdBUqr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9125628FFCB;
	Wed,  4 Jun 2025 14:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749048919; cv=none; b=hOd3TfyLWip36pgCPFZgATP+K00lqaMRebJ2h+wVy8EsZT6aSbv6ikJ4uIh7EnZJLp88W8zoq3AaUmLOmvSimFe4aVtThx3MHxwS3I8w62MB5wg8HvXCTo9VjEc6Zj+Mzdp5pTcipk/dB2x8UjQHIu28jhTY4aT5Bpk0xco617w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749048919; c=relaxed/simple;
	bh=U1XJE14dmK7zk8SqMJr1ydY/J2fqolOgpBQJC2LkLhs=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=bDJGxgO+UW1kNt9TzAd8uTGITikylYYFwzjMPtITpb5uXnqvVs61qWiDEjqwd6dp+HgZAQyGHE+qRMvsoTemfdS4YOfHkbQ9Wl0t/ksv89ycj4kL9vkqpJOnCOAZBi/CthWoUA4Td1ZKEe/cFt4Nh3FuLljpjPk6hyD+ox4Gzys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=pwmdBUqr; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=L5Uci1aNRqDvpavMZwVGQCSAcmTvjFdTlpswIPgwNFM=; b=pwmdBUqrSi/2JKlNzyeLA+or1f
	d5iYtvyEaGKbHR4oF9weAoUlLJTFx0XX023Gns/VQdo0aSAZ6SdmfDB6K+rWh7WX1Lx3+w4cTsvm5
	yShd1SYN2tGTlMBpt0FsldkDMFFAJhs8B6AtPhzOzKDQk/Pwbl22Oq2awsfI8/I2kk7g=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:60436 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uMpWG-0000LY-Ud; Wed, 04 Jun 2025 10:55:09 -0400
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
	chris.brandt@renesas.com,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Date: Wed,  4 Jun 2025 10:53:05 -0400
Message-Id: <20250604145306.1170676-1-hugo@hugovil.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Level: 
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Subject: [PATCH v4 0/1] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI command support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Hello,
this patch series add support for sending MIPI DSI command packets to the
Renesas RZ/G2L MIPI DSI driver.

Tested on a custom board with a SolidRun RZ/G2L SOM, with two different LCD
panels using the jd9365da and st7703 drivers.

Tested short and long writes.

Tested read of 1 byte, 2 bytes and long reads. Note that to test long reads,
most LCD panels need to be sent a DCS configuration command to increase the
maximum packet size, which is set to 1 byte by default (at least on the two
panels that I tested).

Thank you.

Link: [v1] https://lore.kernel.org/all/20250520164034.3453315-1-hugo@hugovil.com
Link: [v3] https://lore.kernel.org/all/20250522143911.138077-1-hugo@hugovil.com
Link: [dep1] https://lore.kernel.org/all/20250521210335.3149065-1-chris.brandt@renesas.com/raw

Changes for V4:
- Rebased on drm-misc-next, since this series depends on [dep1]
- Move init of DCS maximum return packet size to rzg2l_mipi_dsi_startup()
- Reworded comment for DCS maximum return packet size
- Merged patches 1 and 2

Changes for V3:
- No code change, resending after fixing mail server config resulting in
  only cover letter being sent

Changes for V2:
- Change commit message prefix to "drm: renesas: rz-du: "
- Reorder variables in rzg2l_mipi_dsi_read_response()
- Remove unused macros
- Add missing bitfield include (kernel test robot)

Hugo Villeneuve (1):
  drm: renesas: rz-du: Implement MIPI DSI host transfers

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 186 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  54 +++++
 2 files changed, 240 insertions(+)


base-commit: 685c407f168cb49a12cc703230d1e2d62767bfd2
-- 
2.39.5


