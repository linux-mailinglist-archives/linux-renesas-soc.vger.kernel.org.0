Return-Path: <linux-renesas-soc+bounces-24897-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B550DC768E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 23:55:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 627F04E04B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 20 Nov 2025 22:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346F1283C8E;
	Thu, 20 Nov 2025 22:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tqoQyDts"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF87239E81
	for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 22:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763679343; cv=none; b=OVZW9rrUd7lO6pBg6yZUdyCu3ENSDq+K2PLS7ORVjSV5BwnsrqOxeF8zRFh2z2cSIpdepahyjYGrFSe8DzvmMCzsnJtJnjXRrsh7q2Ipk9Nw/+xqBZFK4wNrzKve1mMbOaNQ0vs2vOKHw+DkT6M3p+jxlNusipxQPtWQ5e7uXqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763679343; c=relaxed/simple;
	bh=RsGT6B88Z6GQwb/EufW1fkIqxwsLbbM2TNaFeYG1jIA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wi17ahAfPcWVSoccFRQyVDnlG0S+N54x783BTL83F9+0POEW7FmrsRhXmL/oQKzPcFXGcnj5FRnd8OrMQyqMfgi7/lT9GsfERp3ONYkmgR2HswZrhDByVoqbQagJ36C3j0nek+rnSSDFOMLBxyRqIBC9QOW/cUTB01BhBrJGjqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tqoQyDts; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5969c5af23bso1406962e87.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 20 Nov 2025 14:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763679338; x=1764284138; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g0jynR1GhgSehXxo6CUevrfdzDryZKs3WqkhN5eRj/c=;
        b=tqoQyDtsc7QjdtLZRDVB29APZzYaFNTzG4dfMWpadMegqY4t0J2TCwDGfeFKaWPnCv
         Z74rC1335vlm0354OfwoMrkePzZmhlUmCqV99fe1t7zyTL5a5xatyoIjjE6oThEvRgCT
         sZv6YRZEOQl3/uR0B7fIhFB8OMOmdPAqtaNofVawdU25RJ0W8x0jJjYaIg0wvub3/Hqb
         joxw4yJr+Xmfv/J+7KbKeAxV+M87I6TrHjlDb4xwPyKCAH3TSM5/xITFtKMT/A5stc1j
         eS+AJh+I47B1cMk+iXaIKyVJ/XiSM977VJd0COT2PmFeq0ITZE+w1s1L1LFoWiCZzJMS
         jHzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763679338; x=1764284138;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0jynR1GhgSehXxo6CUevrfdzDryZKs3WqkhN5eRj/c=;
        b=nWd6xHX3ZHQ3rzRZL9bl8B66I0DAP/fMlErNtlUnf/Y3285NFXu2TCcjp05/QoFJ4d
         Yl72ysFsyiVTHZ4kBh62zh+iCsksF0IcVsL0OIjdoStOeW5cXT/vZ40Prhv5Dbz7/tS3
         XEGwTKLqrgoalTwccyTedPkQms45oqHvlxyRGcQfYpr54Vx3TPy4TZJaAFk+/8BD0nVG
         k8t7lSnH4Oz7+8azrjXLCSXRqfLfGop9QZP8BtB7mbR+sMw4r0rDQtsplGvELIzXibRc
         T25vXyGy5sq94BmSnAUfezqeQWBPwybLeseY12WCM8giRrTgqkFQncQFngvSTwo1QBgt
         JaEg==
X-Forwarded-Encrypted: i=1; AJvYcCWVdPPAtgFEt1nqPCfjWceRlZBhFvX/gzfkk9SxPk7iDXbwzac7EuO+5OuJ0Hff0bbBz+Oif9nlNf9dLneQLYJYFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIQim2nNUGMzaWvMSYr5ZuiOHiG+pOaSW5e2XIIQv5UC533WhT
	vKNeweEn4OrvMdUl7pu9fr7cgJQqLumf9FZB3Ea+565bUWKXZxhTjVCQ3dvEu6ybzNOH1my4Evj
	GmY7+sRTxaA==
X-Gm-Gg: ASbGnctgtynr1XQSNrHnWc64Op3h4kYRT8d69Ly1vdaKzE+BOMf/qg0lbyivGMhMJru
	x0OzWE+t+GROTSzny6nYCwbrUfQpi9jCWFCT+enVmIggNTCbcBH5JQx7h8bGbM13G0PjnJ22VHP
	1O/4PugLNLl1YREn9uKpGLoI0tnq47xmfHMKENJZEmLZkItNG6LJmoySPDWKsGRjMxqTt7l482+
	wDjBZGq4vqeZLBpt6zB0Q2iMRFbOegtAH/k/MnedUYRRJ/KzwmUdotBPDgLurboU9I2kxkSPvhc
	dIh8kO1OQkdZw+8L3U8SoNmEt24XtFRCZiw+GpCWjxeXzSIRm6VzrnADRezeQvavTlGCJfFz+FU
	s/cz1BdhKEqp9AeUrJ8/E+BM1IaYi5r/1KIDoXtuTAXPHPg1EJk3uYAZ1dJtJgjY1aGpt9dT+ll
	i+rBgdVVThHxpFrlpMGv6PC82+og46LHiqin7UC8J5unxD8MyVs3Hme2s=
X-Google-Smtp-Source: AGHT+IH8hoRXfeg1Ob+1mb5sV1mPrvjyeqaOtQq+MyHyGiLcaWDYW5x/5+TOPHeF93s776SkRBKdiQ==
X-Received: by 2002:a05:6512:138c:b0:594:493a:a27f with SMTP id 2adb3069b0e04-5969e30d852mr1714824e87.36.1763679338495;
        Thu, 20 Nov 2025 14:55:38 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5969db75705sm1066877e87.15.2025.11.20.14.55.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 14:55:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
Date: Thu, 20 Nov 2025 23:55:31 +0100
Message-Id: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MuwqAMAwAf0UyG2gjDvor4mDbVDP4IBURpP9ud
 bzjuAcSq3CCvnpA+ZIk+1agqSvwy7TNjBIKAxlqrSWDqw+MQVdUnpXT1+O5iIYoN1pnJhddS2Q
 6KItDueh/P4w5v9dTERluAAAA
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
 Linus Walleij <linus.walleij@linaro.org>
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
      RFT: drm/rcar-du: Modify custom commit tail

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


