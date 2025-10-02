Return-Path: <linux-renesas-soc+bounces-22582-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0DBBB3E6D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Oct 2025 14:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F0BB1C6340
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Oct 2025 12:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AD8C2C17A1;
	Thu,  2 Oct 2025 12:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTuYne41"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F77428641F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Oct 2025 12:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759408509; cv=none; b=OzSEqmzY46vevKzmJ1vYvIYENhgucmtO4G+AIW3bXbjSblIpSl5YrPdccMQSAyjj16Qx2gV2YXNaOehvc8AHLgzo927EfyL6kbGy99IVTOKniq/z/YLTtqeMScJYHsySxEPKYCwRgNstecRtq1YCKnPoizmOIicvOownfwn2ucs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759408509; c=relaxed/simple;
	bh=M1O0ZDHQgKrSNajdTRJmNysyvXY+2ntQWhwdWUINF2I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HMTVXDHW/CjxLh6tDkArR+LlO+7MT2twLhrVgdOc1t3Y5YI+5rDC6jeKfgLOgQLJBWha4lGe08ssasHsi2ygi7dOb0zMiKByiZmZ+DdoMmYd6rGIAFhZnh3hb2tB5oOm33NHuzpo0/9C5qSsgf9BJpr/u56zS/bkkHXL/Cn6lhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTuYne41; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-414f48bd5a7so733885f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Oct 2025 05:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759408506; x=1760013306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wiohunQzlxy1wJLX8ESOSQebIPrb5Yx3wUhdRqNbUmo=;
        b=LTuYne41+H9j6PbS9O7lUpIIJLCifMtcVlkN5LTakMFX+qqyDXr29F5EMsFGnE/cuB
         6UzWx51XdoRfXou23uHGmrq35pmKdISaKTACnIIaLsqLN98Duaqw7dN9x3wotQRFmXo5
         JfBMhryxs9YXYYTVRZdGmfcaywVoH4pW232UcNWJ/2s/7jqrMeNutt5QLQJnBrb4OudA
         zEliuQSnyw+C+vIwjortq9Esw1OJ9SQ4DNzTTbzFFjVMFkxcSgOdQMBt9nw+jaYHlsK5
         bWKxnhcE7ZlmLYnBwe+Au9Em5cf9gs3kCVccQB4+0DmmWnl2HzhrmIK1YS7vW44fuqno
         jbFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759408506; x=1760013306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wiohunQzlxy1wJLX8ESOSQebIPrb5Yx3wUhdRqNbUmo=;
        b=ZIcPxMO3eLXnjG3WGgsiif6rlJ5pzoND/U+al4sl7z6raPUPuZqIgq9eSKDXdw86Dn
         pZQZkkF4aCZMZEKrUZ/6ejZBzjA4Qg2xo6OfodpZrOVltPNX6xN/HqVSJ5Vs3WyyP6AQ
         GPT/VljyQz5vRvmsghOmTSAepvkqk4acNOkqBdZv/os8VfECxVZJoTq3Buvbm+CkjuFz
         WLSn5CpmtxYEF1/RnrrW+fiqlqKhZ8nF6Q840nSKLTEsqiarCc6Nn92PJVkpzMtEbJMb
         xGHL45gQmDSlmPUXtlBg4kjaqJd2BLmbnvYcxsyFcRxohwUGLrOoQm0Uynrh1BUKiVEX
         RjHw==
X-Forwarded-Encrypted: i=1; AJvYcCUGbecSIKhG0ZxlAv3WyGVxSwrnyvtxu3k7oxjL9M+pS5TENPsI2qWuugTUHXJ2Tv45gpU1id0AttoST6Xj2jg0HA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtwkeb444kxC2LUzLXnsfBR7iP+h448CkFJ9QCfO0OmIH/29yz
	6J+oR3TnX2cOsu2JDocamnWnb1eueTlRnkqB2Sfo1qGLI8e4lfe3JSF8rO+AInFz
X-Gm-Gg: ASbGncvk8KrBusEKuEhrHCyJyAqhFtbee+N52/nC3d6+MYbkwyKTWgotrOpZWOvWMe/
	1OIfCov9GvpPSGf/93I7udVq1/35SFmXwmnvg0GaZ33ecR0fRUnJfhzixsSZzdD5mo/WfaAEo1r
	bhbP/mb/gXQfr4tpciS5w50KF7HFAxaRbRiYslsf79eQKD/YGnZGFPvNwhIPX5zTPM56Jt1D1fz
	j9/c7+bqZ+1Ae+itc/xFbM6jG4YjLySy2krRjyaofbvvWfJnDwT3nhsediYINZB62CRK5FKfPkh
	1ye66VVoDumfcj3FRAiEvuO70KFgBH6VxD/FABz6YSNITOgK+TcwP/avZNktYy9m8M5ZsWZs943
	Di3JtmJX4sixbHObNgsJ4NFYlwQGjp0Ay+HryrQUQLpudo8ByUwjVQjMeZv4xQwqFVCFJymEsN4
	SMKRTm
X-Google-Smtp-Source: AGHT+IFz8zQ0y7qc4oeft0IMTcDcHyKWcXph7kOA6fb9S5FIHDbOTttgY0hxxnzNKQ04CBzWjJsubQ==
X-Received: by 2002:a05:6000:25c4:b0:3e2:c41c:bfe3 with SMTP id ffacd0b85a97d-4255780b8f6mr5803400f8f.38.1759408505571;
        Thu, 02 Oct 2025 05:35:05 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:607d:d8e6:591c:c858])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8abe9bsm3533304f8f.22.2025.10.02.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:35:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] drm: renesas: rz-du: Drop ARCH_RZG2L dependency
Date: Thu,  2 Oct 2025 13:34:52 +0100
Message-ID: <20251002123452.146610-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/G2L DU driver is now also used on other Renesas SoCs such as
RZ/V2H(P) and RZ/V2N. Restricting it to ARCH_RZG2L prevents enabling it
on these newer platforms.

Replace the ARCH_RZG2L dependency with ARCH_RENESAS to allow the driver
to be built on all relevant Renesas SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/gpu/drm/renesas/rz-du/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/Kconfig b/drivers/gpu/drm/renesas/rz-du/Kconfig
index 34d515eb798b..8bbcc66ca3f0 100644
--- a/drivers/gpu/drm/renesas/rz-du/Kconfig
+++ b/drivers/gpu/drm/renesas/rz-du/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 config DRM_RZG2L_DU
 	tristate "DRM Support for RZ/G2L Display Unit"
-	depends on ARCH_RZG2L || COMPILE_TEST
+	depends on ARCH_RENESAS || COMPILE_TEST
 	depends on DRM && OF
 	depends on VIDEO_RENESAS_VSP1
 	select DRM_CLIENT_SELECTION
-- 
2.51.0


