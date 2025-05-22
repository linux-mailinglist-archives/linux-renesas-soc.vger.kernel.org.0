Return-Path: <linux-renesas-soc+bounces-17377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4EFAC0D80
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 16:03:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9BBCA7A1697
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 14:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247E923AE96;
	Thu, 22 May 2025 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b="pLhhpuHs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68C912E7E;
	Thu, 22 May 2025 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.120.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922621; cv=none; b=eKShDWHtX8w7ei4iu67A1h7RUV6HhjVVPDFCeRV6OcvaklK2lE/ILs+6+q1nXIpON3pqB2gUqQRiDInhBaPAjcFRJPPjGWe9Kg2J7S1FhXvBBQn4LIjQA0UvYsy43MSQzU2iddeR0FQtjvk/DJh40WeNYN8G4JLW0DjIveOcUA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922621; c=relaxed/simple;
	bh=F10iyfKFrEJZy08mPbO3oeYhVGn/yzdNssD7jvfQhvY=;
	h=From:To:Cc:Date:Message-Id:MIME-Version:Subject; b=ubKxAklepEea3fILzWKaRVrinMttGs1R7Y+s5hHB8VtKOyym7oh+ZhbVSPO4BSk7CL55z6tAP/SqzLHDPiUC0K4W8zZJyjQ9sa+A8vGsxdY2JBC2Mj5LrARF7DG8Fg8W2rcGNK/B8PWLZQ7q0uZWQUTOFew5ZcQ7bHbUsKz+XGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com; spf=pass smtp.mailfrom=hugovil.com; dkim=pass (1024-bit key) header.d=hugovil.com header.i=@hugovil.com header.b=pLhhpuHs; arc=none smtp.client-ip=162.243.120.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hugovil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hugovil.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=H12sI1rmNNOKWHKGVulEJOamj5YYRT/qF2xDiIqMIWg=; b=pLhhpuHsoKduipSh7gYy4Q9zh3
	pEjxmBWhZUuY+8yUTVbjEjuLBL+sWWMGfbML7ptDVDCufDaL79wchBjkeBTGJlVkdR7gh6Ry7wQGt
	tlAFNXA9V+L0o357mKhtLfotpoYmb0jIj5WcOO40Sw/Kg2QjB2gSt7CCOTuUxCDg5HWE=;
Received: from [70.80.174.168] (port=34044 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1uI6W7-0005ma-NB; Thu, 22 May 2025 10:03:28 -0400
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
Date: Thu, 22 May 2025 10:03:20 -0400
Message-Id: <20250522140322.64667-1-hugo@hugovil.com>
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
Subject: [PATCH v2 0/2] drm: rcar-du: rzg2l_mipi_dsi: add MIPI DSI command support
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


