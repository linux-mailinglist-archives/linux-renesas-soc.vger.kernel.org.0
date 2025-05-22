Return-Path: <linux-renesas-soc+bounces-17382-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BC4AC0E6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 16:39:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB49D163A37
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E222D28C025;
	Thu, 22 May 2025 14:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="d3qY8WZe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384EF28B516;
	Thu, 22 May 2025 14:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747924773; cv=none; b=gsJ9lxwA5RwDG1dRwVmCNRpv7n8VHh6A3nCZOM+z3CqwUlUsJx8Iz30nNEGovsozvH45xS8GrHoqbD2u36ta8ypCGODBUKNjXrlBxLZNpAW4TU8Sk/Rd7CPq6u407dggjfBz1TdV6aTBzpJy+1NHp9Ps5KQluz2hHON7+vGDgHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747924773; c=relaxed/simple;
	bh=sbyAge5U4foeKsqllkLAo8KKTwnOU7ExbN4Loqqzses=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=qA2VR4XMXyoELyx6L6104CBgAX/mTblVFLaOMcMTCIeW1R2HEv1D/zVp59eOKNjmb/1Pf6+CgS9av3MYV6465b6yPZbGt3/i+fQnt9skp3mzDa2dHvXN9Y4JB+B8iRVt+lVBpKz1ANcymKWEEyBMosHTIfI7iti94+O6e82Zn1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=d3qY8WZe; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=FF9IpQdWG8nc3FhKy97DlFjtzXLzErfu2+RAKD3oQFY=; b=d3qY8WZe2NYyr9lNVW9VaozsPN
	1dKxB0PGwgWatvrbGMj7qOjzPrza+te+8JzYu8+Hc4pl0bGPJgWlztQQ3NDKjlewsfPeNACBoSE3O
	c9POes4hcj7goRTb0x1Z1ngb9I4dKPQZs6iBh4IwtamD55EZ0Ic20IHiw1XAZH8s5dqM=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:33178 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uI74v-0006Gk-1w; Thu, 22 May 2025 10:39:25 -0400
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
Date: Thu, 22 May 2025 10:39:09 -0400
Message-Id: <20250522143911.138077-1-hugo@hugovil.com>
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
Subject: [PATCH v3 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI command support
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

Link: [v1] https://lore.kernel.org/all/20250520164034.3453315-1-hugo@hugovil.com

Changes for V3:
- No code change, resending after fixing mail server config resulting in
  only cover letter being sent

Changes for V2:
- Change commit message prefix to "drm: renesas: rz-du: "
- Reorder variables in rzg2l_mipi_dsi_read_response()
- Remove unused macros
- Add missing bitfield include (kernel test robot)

Hugo Villeneuve (2):
  drm: renesas: rz-du: Implement MIPI DSI host transfers
  drm: renesas: rz-du: Set DCS maximum return packet size

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 186 ++++++++++++++++++
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  54 +++++
 2 files changed, 240 insertions(+)


base-commit: c4f8ac095fc91084108ec21117eb9c1fff64725d
-- 
2.39.5


