Return-Path: <linux-renesas-soc+bounces-25505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88594C9CFE6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Dec 2025 22:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4559B3A8CE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Dec 2025 21:02:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBF0B2E6CBC;
	Tue,  2 Dec 2025 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMGPHKyo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9722D2882C5
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Dec 2025 21:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764709368; cv=none; b=IBWe1xg+JMdd1L+8QzGB0telJ0Thtx6ORB2+/dhcR9i2JYdzYZAQ+3NGjj+1GO3QkpOptxsgS33MsM86JPiqIF+Y8cbs69E59C11JeTY5RmDTYABkHNnrc0pIpXqSl/snOE0QOO2IIedNx9TGn8DnQ6DT+OGzkijYnhacObpt5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764709368; c=relaxed/simple;
	bh=+NfOB79/o1jXB8edhjztknXizC2rmKHoxYfSHOGDDqs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KMyW6cEawqyvrDoOOTIegV5h0fay/W6xSGMIZTsbvZ55eG5949t0pz1hELekL/TL4qb5vzmTPsxEqUrVWm3owx4KYFskQCcVwvR8fe1d1pVbttbYJ4vw7uyNBu74kFSxdPQ+QO6NBycWGx8CbbVnljIdSDQAp/FbCITWo/QmV/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMGPHKyo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CED8C16AAE;
	Tue,  2 Dec 2025 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764709368;
	bh=+NfOB79/o1jXB8edhjztknXizC2rmKHoxYfSHOGDDqs=;
	h=From:Subject:Date:To:Cc:From;
	b=nMGPHKyo2KbjnEW5ciedGnBqtSQXBdQA9itsILcXPhwZdGORjZPg/nLIUXx3/fzgi
	 yaQLufUm1bMw9xqM+Y8kZlLTGb9PoRSFiWlsJqaTY/EFfRLXjUbnf/MM1pbVozT0S+
	 HJI4dovti6l4sTq9dHm295v02EFNkBMzPUfngiOXa+LqiREUSuYUy7oI2+3me1RAu2
	 4UrYLoOYyGkYaYSd/cYxqIw0/Eb6JAt4WUch1WxIw4J/xRZd1PPuPGh2M4OG8u/dhV
	 OmMn57uk2a27vHMglXnFbrwCh0NVEWTG6CipyfIzna0MbD9oA1y4i6Z3d7h8Wx0dEO
	 TGpSgCsexVT9A==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v6 0/4] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
Date: Tue, 02 Dec 2025 22:02:39 +0100
Message-Id: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OTQ6DIBAF4Ks0rEsDKIpdeY+mC5BBSf1pBmPaG
 O9etBuTLuzyvUy+NzMJgB4CuZ5mgjD54Ic+hux8IlWj+xqotzETwYTkXDDaVRaoxY4i1Ahhvad
 j49E6/6LcMG2ckUKwgkTiiRDrjb/dY258GAd8b2tTsrZ/wlNCGRWp4VAolRnjytb3GofLgDVZ5
 Snda/xAS6NmVWGcqnjulPzR5E5Ljn6TUdNgc64TUShuywdgD+1XW5blA/JCci1lAQAA
X-Change-ID: 20251120-mcde-drm-regression-thirdfix-1b0abfb52209
To: Vicente Bergas <vicencb@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, Linus Walleij <linusw@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
X-Mailer: b4 0.14.3

This fixes two regressions experienced in the MCDE and
R-Car DU DRM drivers after
commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks.

This series make it possible to selectively bring back the
old behaviour with explicit semantics and implements
the old behaviour as modified commit tails in MCDE and
R-Car DU.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v6:
- As this problem has (probably) also appeared in the Rockchip
  driver, append an RFT patch for the Rockchip DRI driver at the
  end of the series.
- Ask Rockchip people if this solves their issue too.
- I was about to apply this with all the ACKs it had gotten,
  but let's decide what to do based on the Rockchip situation that
  appeared right now.
- Link to v5: https://lore.kernel.org/r/20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org

Changes in v5:
- Prefix all exported atomic commit helpers with drm_atomic_helper_commit_*
- Add kerneldoc to all new exported atmomic commit helpers.
- Add comments into the MCDE and Rcar DU quirks explaining what is
  altered as compared to the standard helper functions.
- Link to v4: https://lore.kernel.org/r/20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org

Changes in v4:
- Fix a copypaste-bug in the Renesas Rcar-DU driver.
- Actually compile this using the shmobile defconfig and make
  sure it works.
- Collect Geert's Tested-by.
- Link to v3: https://lore.kernel.org/r/20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org

Changes in v3:
- Switch to a new approach: export helper functions and create the
  special helper directly in the driver instead.
- Drop Marek's patch and write a new RFT patch with the same
  semantic content as the MCDE patch.
- Link to v2: https://lore.kernel.org/r/20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org

Changes in v2:
- Queue Marek's patch first in the series for coherency.
- Add a patch to also preserve the late CRTC disablement
  semantic.
- Rename helper function to reflect the new semantic.
- Update the MCDE patch to use the new callbacks.
- Link to v1: https://lore.kernel.org/r/20251118-mcde-drm-regression-v1-1-ed5583efbd68@linaro.org

---
Linus Walleij (4):
      drm/atomic-helper: Export and namespace some functions
      drm/mcde: Create custom commit tail
      drm/rcar-du: Modify custom commit tail
      RFT: drm/rockchip: Create custom commit tail

 drivers/gpu/drm/drm_atomic_helper.c           | 122 +++++++++++++++++++++-----
 drivers/gpu/drm/mcde/mcde_drv.c               |  45 +++++++++-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  33 ++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |  50 ++++++++++-
 include/drm/drm_atomic_helper.h               |  22 +++++
 5 files changed, 244 insertions(+), 28 deletions(-)
---
base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
change-id: 20251120-mcde-drm-regression-thirdfix-1b0abfb52209

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


