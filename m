Return-Path: <linux-renesas-soc+bounces-12657-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E2A20A70
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 13:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A66917A3F74
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Jan 2025 12:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33B71A239F;
	Tue, 28 Jan 2025 12:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fAGJve4c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5171A23B6;
	Tue, 28 Jan 2025 12:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738066513; cv=none; b=Lfv2qMo2mq6zKMDeknwWCeNBc4FtL/E8C1XkqAtf5pWN3MYCyEt9GQVmIsoDTWFQfY24OXSJaZnXsVeeHmh3tG6hQzSUTR6XPg1wiCm0y7fYFlcmrLd2McrxttvF4o0c3NKmK3pe21Epdh4TlE6Z1UwbRsNV7ea0zxLcUg07dkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738066513; c=relaxed/simple;
	bh=Hop0izW+Kt9Tz4B7IQilI/1GVJfibdMMpYcYCjkEPqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=OUp+4nCp9fIuM66brKfBjHQhR+wHVEPrZf8smXi6rPim+MErYhudf34ME/lRetcQxDG14z7qwPK1wmzpqc8aUH1DZRPH33NCMBAETvcT6Et7/p54kImBnjxL/b696B0h48myKb0kN4L5J3WDt+3HcHF5i1OEdVQpNWZHIWKw7tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fAGJve4c; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6E4EC74A;
	Tue, 28 Jan 2025 13:13:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738066437;
	bh=Hop0izW+Kt9Tz4B7IQilI/1GVJfibdMMpYcYCjkEPqE=;
	h=From:Date:Subject:To:Cc:From;
	b=fAGJve4cC7aIC0Q4gC3MphJuprzDm8m3hm99U3tWnqzc+7dpSxQTjlWTWVN3V8AEM
	 pVP6rlxVAdmvfWd+JlaDvNkQqG9D9VjH874hKBOIpi6swJ9FuNur5CxR+uHN6BIS2C
	 jxsHrIMcJpT6hzJyD1S/8vLWTmekUgXOq/C70rLk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 28 Jan 2025 14:14:43 +0200
Subject: [PATCH v2] MAINTAINERS: Update drm/rcar-du maintainers
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-rcar-du-maintainers-v2-1-4a3860a3e1ef@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIADPKmGcC/32NQQ6CMBBFr2Jm7Rg6FgKuvIdhUdtBZkFrpkg0h
 LtbOYCLv3g/+e+vkFmFM1wOKygvkiXFAnQ8gB9dfDBKKAxUUV0ZalG9UwwvnJzEuYQ149kyN01
 n26GyUJZP5UHeu/XWFx4lz0k/+8lifu1/32LQoLfUeWfJ+JquEtjlFO/JaTj5NEG/bdsXeG9l8
 r0AAAA=
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Maxime Ripard <mripard@redhat.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2111;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Hop0izW+Kt9Tz4B7IQilI/1GVJfibdMMpYcYCjkEPqE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnmMpE9JxGTMokObP7/XhZHh6X8ff/WyteBRdiY
 cBFnlFWzSmJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ5jKRAAKCRD6PaqMvJYe
 9ZfRD/4o9G++212IA6sUrk7hhbF7mjvX6bHBKw6gVTE3ZiqI/yUKHD6v3YrYarb2EJjAQn0cdRS
 koknLgh5i1Bh3zMZzQL+DX+8+LiSJY7Z93s4fHEMgtq6ej0kGXDdWdVGpYXzpipEK+IcXVV60Am
 z2yRJ1LUMVY1Av3JNE4OS/TTOzzyQDw4P6bwB9JLZrbf2mse8RyYflgHRQHRL1m1TkGLr2pCU3K
 Se4vhIlEhOoN2hXEkff7Asy3zgkVGV6QD4/n3BKxj19qbUSH0y63lc7iIf5lmbP256TK6yHWpq3
 rN+SjBe205X5eHEcnsY4kuz9EChE3VPLmpPx9qfjNHW3FUNyY/PGrlKQMVKDulWRYpMLoxgUc+N
 TgNfuHsnxP6kA14J2dK9S4OtC/b6SmZZeL/twEWxAiq8vVzD3yA9DcE+Ecfr4qcC2smP8q4deq/
 f6FxrP1PXUNlHX0oOnWIR0LA6Fny/5C4kappJhfZ5YSgsWsirpxkrGUIp7AIl20BjNsNMdxLcz6
 sXb23bzho/offG44lqe2J+Fk/jFfYA2nKaEp+rQpqfHDyyzupYbkawF1VoJvDuCPtP9MMTQGY8E
 lNBNIb99b/cMLq4KZzA8PgsktxOm4urx1nUqqSdRkGuNYa3AGSFulFVDCAVVb9whZPzKJ0dkpEs
 OnCsC64RBfrEMYw==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Update drm/rcar-du maintainer entries:

* Add myself as drm/rcar-du maintainer.
* Update Laurent's email to include +renesas.
* Switch Kieran from a maintainer to reviewer.
* Change rcar-du to be under drm-misc umbrella.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Changes in v2:
- Switch to drm-misc umbrella
- Add +renesas to emails
- Link to v1: https://lore.kernel.org/r/20250128-rcar-du-maintainers-v1-1-c429ca421c52@ideasonboard.com
---
 MAINTAINERS | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ed86d884ee0d..b256bb4f6d3f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7604,7 +7604,6 @@ X:	drivers/gpu/drm/mediatek/
 X:	drivers/gpu/drm/msm/
 X:	drivers/gpu/drm/nouveau/
 X:	drivers/gpu/drm/radeon/
-X:	drivers/gpu/drm/renesas/rcar-du/
 X:	drivers/gpu/drm/tegra/
 
 DRM DRIVERS FOR ALLWINNER A10
@@ -7759,12 +7758,13 @@ F:	include/linux/host1x.h
 F:	include/uapi/drm/tegra_drm.h
 
 DRM DRIVERS FOR RENESAS R-CAR
-M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-M:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
+M:	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+M:	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
+R:	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
-T:	git git://linuxtv.org/pinchartl/media drm/du/next
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml

---
base-commit: e2a81c0cd7de6cb063058be304b18f200c64802b
change-id: 20250128-rcar-du-maintainers-34ee66948f04

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


