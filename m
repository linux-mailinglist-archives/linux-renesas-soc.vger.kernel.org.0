Return-Path: <linux-renesas-soc+bounces-25402-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D59C94F39
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 13:11:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC4E43A3D35
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 30 Nov 2025 12:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B20AC2765D4;
	Sun, 30 Nov 2025 12:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QstWaQil"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8354036D510
	for <linux-renesas-soc@vger.kernel.org>; Sun, 30 Nov 2025 12:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764504690; cv=none; b=YNo7xUbxXwxfVZyxmma/7OYPyC9g32Eh0XSj8eETDn7qlLuHIKG7lYYFHfiWr830RXldVL8/AOkzP8B7GC/RvYA861qAZYlcOv+MRPYggxeqwRChlIED6QkSTjYZSQjmbO1QGf8GDi0XK8d7H48RjPW1kwxaRBkfuGj0SJygMls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764504690; c=relaxed/simple;
	bh=pD+3UK8qUgnsBWqr+U+WVaR977MABOrEMHiqQn4DhpE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Iu1Fk2cFYmPhAQAVUdsLcVfggBfgbkgWkPnZiDWPfkPLNy3+K7lYeEPMz+fscwjIWHHmpriWOjM9KQbvq8x+sPCIufPMBAoH0RN+mPluWrQ6+RQuUajuF23V2B5sGz1jWe2TR9SbbWrdK9zts5+Z+uM0UXaSOQ2DFAu5iAeXL/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QstWaQil; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47ACFC4CEF8;
	Sun, 30 Nov 2025 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764504690;
	bh=pD+3UK8qUgnsBWqr+U+WVaR977MABOrEMHiqQn4DhpE=;
	h=From:Subject:Date:To:Cc:From;
	b=QstWaQilX///3ucVZau189nWyajX3mxV8OjUPVXFnHfO2jGJ6SjudP5lKYawrk5Z2
	 xdxLneLIKYI5y3yWvJ6AsRz+FwKdSykyMT/qKpXoAp6qx6WPL++H7t2GhmiRYqv7bG
	 2ecA+GBdr6ltda2tZz2SgPy1F52VSNGxmgds/19Vl5XafYeoWiScp94MT5KG6GAqNf
	 9wEm/7N8pehet6G+/u1aIGKwMPO/gXUBH3+M5X2QFa8xcC70k6w7c6fa008C9C0/5C
	 7KRo+HST0ocB2fFVQMmrmHQeolIhZkaqp2JaaCZdU6dDYjGujJQ+OXjiEeyjOFluSm
	 hE4a7RkI1D8YA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
Date: Sun, 30 Nov 2025 13:11:16 +0100
Message-Id: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQ6CMBCF4auYrh3TFtDiynsYF5ROYRKhZkoaD
 eHuFla60uX/MvlmFhGZMIrzbhaMiSKFMUe134m2b8YOgVxuoaWulNIShtYhOB6AsWOM6z1MPbH
 z9ARlZWO9rbSWtcjEgzHPG3+95e4pToFf27dUrOufcCpAgi6twtqYo7X+cqex4XAI3IlVTuWnp
 n5oZdacqa03rTp5U31py7K8AQZ/O0QXAQAA
X-Change-ID: 20251120-mcde-drm-regression-thirdfix-1b0abfb52209
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
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
Linus Walleij (3):
      drm/atomic-helper: Export and namespace some functions
      drm/mcde: Create custom commit tail
      drm/rcar-du: Modify custom commit tail

 drivers/gpu/drm/drm_atomic_helper.c           | 122 +++++++++++++++++++++-----
 drivers/gpu/drm/mcde/mcde_drv.c               |  45 +++++++++-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  33 ++++++-
 include/drm/drm_atomic_helper.h               |  22 +++++
 4 files changed, 195 insertions(+), 27 deletions(-)
---
base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
change-id: 20251120-mcde-drm-regression-thirdfix-1b0abfb52209

Best regards,
-- 
Linus Walleij <linusw@kernel.org>


