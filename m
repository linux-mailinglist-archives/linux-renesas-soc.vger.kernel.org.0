Return-Path: <linux-renesas-soc+bounces-24727-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C2EC6A039
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 15:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id A190A28B63
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 14:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7B62FF64A;
	Tue, 18 Nov 2025 14:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R9N/UfXq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D097E301486
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 14:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763476577; cv=none; b=r4DO4csM85O50LatiG7RJ/T694NJrZE9j2Id27vXae+vFvd7zmxQIofJgKkF3YR0Oe5gkQdlfYQqBKfO2QdkIJT0o6QS54cbBpQA0qxvzaDhUj91i7+3kZxAcyWIxXyRO4RMP3ESDiX6ZaLdBPlFIpPTIVhhEDdLAPPwtnOBLqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763476577; c=relaxed/simple;
	bh=XN28Ew3DpwYNjC4GngbIOlmoJ1onFK821lw997WbWFU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HwpFxP6LcfVvgAz3xG1SG5Jz7IeoNJSU8Zxv05aTpzOU3+k6pCCRKNtbAhnIWsLv/jgpw0gMiVgXL7C4yOYVZxxX8Xd47U8z0DhXiA9LdXQgqIDRt5OgBUsyArEpBW/IkEFe5JjIkmaOv0JH2Ya1t+y9zZlUJB1sPvBR4rOjADs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R9N/UfXq; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-591c98ebe90so6030962e87.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 06:36:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763476574; x=1764081374; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fTNlBrxG1reK6Iqv2BdVIFoWuExCnojLAXMCRWIF47U=;
        b=R9N/UfXqYBz/Df9G/zsawJ3NkocOWO1lOxQ+LUP8TWvxt1Bxx3yXFUHzk6eEY8tLF9
         TWD+XrCuM1hfpNUl1Q/U8SyQFhb9MBEXGQmBX59AYp/kGEwcpOce/J/qhTV/PBGjqX6T
         TTM21f+UGHYNOvM5U2AaNVxbhzrcNLQtSOtu0+RcBdb/PHOpUg5gul5A/eS6jRVuJHe5
         qS+pAXJWrQX9HTyaC4VvJi+czji7TjFgYSABw729XLknF3sL95bmTxrn88u8/qzIUgIV
         emXKC9KpjtW0yMumYiX7bub9QjwWnT5Iw9me+SaNp+dQtAH7cw24/SAU10nbaVOXk0Jc
         fyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763476574; x=1764081374;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fTNlBrxG1reK6Iqv2BdVIFoWuExCnojLAXMCRWIF47U=;
        b=RNxySoKeqUuMk68Brusr0R4rIJap/0iPPUznyNMO1zBuMyIhaBqQVeXMV9YWxVaxz7
         Iz+usnEFr16TRWx4ldQvf6+ADpSW8vQ2v4zVyO1oObKX1TFGu4aIjSpWUbJKr7EF945C
         kMk1Jk7mr8dUxlUMEVrBv0qica3lFaf99lK6iKlp7SwNr6q+3i3gelUNLk4E/sNs+oMi
         sUOM+0YLcetcYF261KAhcgDshiDik+WwGueaVRS6uUKJCNWspeS5RRp7pUa0zQvHW/hK
         SzGJ7Xpo4S/ibYwJ4Gbhz1r4rsytj86ONx6jC7770G8Bg2gGvNab79toqTSSegVL/Lxv
         CzMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJMUpRgcWsKcZ0npRepR29eEpqo941xbW6aPrz26Epidcfy8oplnxtxVKdBiWxsTgcmCe8y/V7I3QNI/3BWMd9rw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRLdiLRPbOULUJDgMCY1mroMJtNcxmK7FyZmDaZ7IFi3NfTrhO
	BaPA5PBexQHNknV62Z9UdRZVUUZx+VJQT0kRZtzERYkAKxdcio4eGcmbHOz/IwMFBgo=
X-Gm-Gg: ASbGncviJR+D/c6GGidtqlSFdSzezvkkscBTpbaQSg1m/ucv1tiXT9/7ZqgLeTR7Xeh
	eyxIaAnOpzuNQ/r4Mgan8jhkojskOhQt0GrGmX88yEAXqhpR9Ah3dA+TOk3JctmWUKenIBgaucp
	4iWmrrNMFBDaTw81LbP7bS6BU37poCP/CdWH7uoCLgK7letHHT8B/5OFU13ulGwB/Hlw79DMeS+
	UDUZvtK3P8i689MutvnsyEc7wqxGHyeKPTRkS0g71yMFf74gXN52pleNRs6skKCT0Z2aftoGPfm
	+OPtdijJ7Cj78vQeYMXPoHSb7Q6MC7dLEFeIeVJQ78e4wdNQL7cJynLCqHsEb8zLSOxubeuPxb5
	r05YXoF74dEv+Cj1WXntt/im60vBiiFp9Qj2PfIzg0uo7QLLa0U6BugIFQT+utC9CIXIOjqYhuV
	6e+mG2biyn7nTfv2egyhQxJwUo4b7tZnYUMb5Dh2/24Sr8+CbYnG4sqbM=
X-Google-Smtp-Source: AGHT+IHsV5sIm3zMMnJUvvx2rOPpIW9GCCJGnR8UVkAd8uKtGIyR3NkhPAK1Gvxj0emMFr7oIz9qMA==
X-Received: by 2002:a05:6512:2250:b0:594:2475:a160 with SMTP id 2adb3069b0e04-595841febc7mr4260322e87.26.1763476573888;
        Tue, 18 Nov 2025 06:36:13 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b80dcsm3955909e87.44.2025.11.18.06.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 06:36:05 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/3] drm/atomic-helper: Fix atomic modesetting
 regression
Date: Tue, 18 Nov 2025 15:36:02 +0100
Message-Id: <20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7RgLKVZX3sOwKHRaJpGWTA3RE
 O5u4QAu38//76+QSZgy3KsVhBbOnGKB+lTBMNoYCNkVhvpSa6WUwWlwhE4mFApCee9j0zjqr8b
 eWuOhLGchz5/D+uwKj5zfSb7HyaL29L9vUaiQnNamId+71jxeHK2kc5IA3bZtPwvtHu+3AAAA
X-Change-ID: 20251118-mcde-drm-regression-33deb78a968f
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
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3

This fixes a regression experienced in the R-Car and MCDE DRM
drivers after

commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks.

This series make it possible to selectively bring back the
old behaviour with explicit semantics.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Queue Marek's patch first in the series for coherency.
- Add a patch to also preserve the late CRTC disablement
  semantic.
- Rename helper function to reflect the new semantic.
- Update the MCDE patch to use the new callbacks.
- Link to v1: https://lore.kernel.org/r/20251118-mcde-drm-regression-v1-1-ed5583efbd68@linaro.org

---
Linus Walleij (2):
      drm/atomic-helper: Add disable CRTC late variant
      drm/atomic-helper: Add special quirk tail function

Marek Vasut (1):
      drm/atomic-helper: rcar-du: Enable CRTC early on R-Car DU

 drivers/gpu/drm/drm_atomic_helper.c           | 98 +++++++++++++++++++++++++--
 drivers/gpu/drm/mcde/mcde_drv.c               |  6 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
 include/drm/drm_atomic_helper.h               |  5 ++
 4 files changed, 103 insertions(+), 8 deletions(-)
---
base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
change-id: 20251118-mcde-drm-regression-33deb78a968f

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


