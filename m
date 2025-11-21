Return-Path: <linux-renesas-soc+bounces-24944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C7BC7A207
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 15:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 75ACC2C6FD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 14:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 085DF29B78F;
	Fri, 21 Nov 2025 14:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="piwGlJHF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B92258ECB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763734134; cv=none; b=hwU4+gMXEZSMxg8/whpDnQjG8F2aais/C8ZYzXKhvN3qEVa29sxMJvcBvlY7T3lGvYPCCaWHwI2x0bi5XiZ71np1yInTfxMHC+6rIvq0Pmnq3m8KmG52Pz0WpKW+mVITEgZELotm+PrQvqAH5zm0tzbUN6c37/QCebjsqjV8Z4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763734134; c=relaxed/simple;
	bh=5NEdO4LUiHdLeYCL8qFPjuXwFVOSTNWemFMM6NpWZ2Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=L85SwfcwJbE1vFYRrJt8qa+1EKeV1gEixvkvjcTisympTcjOfPd+fQPBEFUpYp5aErjR8/YK9PfGeeWYYM2F49QtURqNoUItjdjLChGnFhos8Y43tc2dqnYl3JQRfbk8jtQ6o0R7xQS5kh6hmzFA1awzX6BWz47mCZmqg2dqlko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=piwGlJHF; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-594330147efso2230584e87.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 06:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763734131; x=1764338931; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m+ZjUWJm6P1oGOGSuKn7/ISLOSqUPpPqyf4Rr3+u0z0=;
        b=piwGlJHFLv7Fg6i04b5NK5yoQBP6dHAW/LafgRT1x0kYbGLar78otNKrUE0O+NbWuJ
         tvCnsok6dNO86whIIbR4C+DwCsRsKSTXE3i1PBGbomwzFk1a79e2PVUKoGCyjbrVK7H4
         4WD/3tu/7B0StT0sx+6utBfPPj/Wlg7WjrtDxO048XU+RUjyQGbjPWRiJDe2tWYwY5X2
         6205xwtHe93lAsN54InJihk5+Y4dLdpYraCsDSy75uy9pa+5/K4XRJPxvUuJxz5KnwbF
         jmJ970HnXHt2ci6KRPAqgbPTDAUVKFUTEoe9viSeVP6DBy37L7T1qPd+RGemm3HRETCd
         FMPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763734131; x=1764338931;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+ZjUWJm6P1oGOGSuKn7/ISLOSqUPpPqyf4Rr3+u0z0=;
        b=gjRcyee0Q7yvm3CW4nYjz/PsYYUjFrKMzFl1gMYQW+knL+09YHP4rsQBPoBzzy7O0k
         1PqIsC6T/4+O53zHUALpmM86afayPMUeahcPPpjfMdrSVtaT6Z2G+VFVSDb+trRIZie9
         VvAxD9tOVOskrRBvR8BJTc32rZ2xrzLL3BbaWW5w9K60T6J50/S5zlcSChsI5r7E9+52
         n1QndzzQHIi6abvYr1XSFvWLWdc3hNwz/RIb4v2SkdojKYLl9sUBI/ZqPZEk6hEvZhux
         CJZdDG9iVTIQRKk0shbHxo8Ye+07wA1PY06vAQtjTb+Q8+iOCfBhpNFoWfh6YtrCHxUf
         R0kA==
X-Forwarded-Encrypted: i=1; AJvYcCWztx0W34jLCesEqlhj9nkn6QmchZUyO3EPfoatX+8MJFtUru9QxMqXwczs/vFAQ7yn1lWHQu0zFEis2KH6vumZFg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuNfkjJcRFwJWkPrqNrl6GYwX3l0jzhNMXM7t5F5SXADfBuXrB
	NYX83Y1iVq8RZ4RjZXj6on9YJjz6HqJFojIUjAAVkOI5Ink1o2LyvQpggvVJJ6D6JJI=
X-Gm-Gg: ASbGncu08uX+LsQlAYGA/Dx5XPuNCT1pj9xugj5s4pYhUYDg1b3qXBXuCiM/m1sfedd
	+uSvYOTpFQboskGa5OoDSNrwYv9b106V+hghcdxWxWOemotLR0Id6nLSFC879d9G0YNTFO2eD7v
	216AlNN64jDeFapJ4+/rW+/fxp0vhg0onMDK+z4H3fGhWG2/MYnusYBAoI9I8wkMHDCX8B9gjk/
	QHKDgNNWAxbWa5+obVO92QMdCXjMLttVYcX9kc+0iRitD8UcvZTZ8IrnD0OHflhDTuqPKa+lQJX
	ygwyeUbb0SBO3vxGFa/Oa8Y+S9bg1IROKE3Lb8Z1A339Ct1jyWNjB7nkepA929mPd+yE/6C2gX7
	envSj9z1mCXaD/qCEa987BD1rZmEExucZm1c6s3DRpXFzJ899MyGCYzVfS2heUAm3Oi/wwRjiIn
	LgunBimGbI98/Am/ZQJ6ZmP5ngC/Fzb/O7kieGOsouqukMvn26Xcb7ixk=
X-Google-Smtp-Source: AGHT+IHTiD2eeWptx+78bN/r1/j0tHK/N89W2MgpMAdrnSKRFy5gp7i+RvTRr0KQyLU/9Z9FAUDwlg==
X-Received: by 2002:a05:6512:15a6:b0:591:eab5:d8dc with SMTP id 2adb3069b0e04-596a3ee2f7dmr951571e87.35.1763734130181;
        Fri, 21 Nov 2025 06:08:50 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db8718csm1668421e87.30.2025.11.21.06.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 06:08:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
Date: Fri, 21 Nov 2025 15:08:30 +0100
Message-Id: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQqDMBBFryKz7pQkatGueo/iwphJHKimTERax
 Ls3eoIu3+Pz/gaJhCnBvdhAaOXEcc5QXQoYxn4OhOwyg1Gm1toonAZH6GRCoSCUjj0uI4vz/EF
 tVW+9rY1RLeTEWyjrM//sMo+clijf820tD/tneC1RoamsprZpbtb6x4vnXuI1SoBu3/cf8teJS
 skAAAA=
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
 Linus Walleij <linus.walleij@linaro.org>, 
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

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
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

 drivers/gpu/drm/drm_atomic_helper.c           | 54 +++++++++++++++------------
 drivers/gpu/drm/mcde/mcde_drv.c               | 37 +++++++++++++++++-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 25 +++++++++++--
 include/drm/drm_atomic_helper.h               | 19 ++++++++++
 4 files changed, 108 insertions(+), 27 deletions(-)
---
base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
change-id: 20251120-mcde-drm-regression-thirdfix-1b0abfb52209

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


