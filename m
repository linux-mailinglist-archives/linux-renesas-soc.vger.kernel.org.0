Return-Path: <linux-renesas-soc+bounces-16992-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B98BAB4385
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BD2F8C4A3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97CE3297B99;
	Mon, 12 May 2025 18:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJIraNoR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC53296FB8;
	Mon, 12 May 2025 18:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074232; cv=none; b=WaS+rVZ3xKm3+mwQLRqakQJcYtGjDBF5Jv0cHibNj8gl4L3hwNi8DBXR1hHMyqL1+8arSbEHu/1MHRqcV+H3q2bGv/AAZz7yEB339WxoT96PAtXoW3JPq70mqcSFkjWHgX2bgf9FYfkB+eLv5yldeLOzGRDk80RgXL+cBtqEoCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074232; c=relaxed/simple;
	bh=7EvT+m50T6prXTqvyg4sAaRO25FOJglf4BD0Ak8sc6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RdF6KPN9u3DmePwXSvkwcqFY7SXSpX/nOE0IcKThK/FdPINHYu3X3wH6PHXaF1EqfIS3DxMh4CS9iM1VvRfsGgVqsrHTkrb92hF0vbFCGXkjkEFcT55+Y3d8hYjjVePFZwc8zzZZZKRoQFzPxCTt3a2rOr970Dw+stAZAy3jma8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJIraNoR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so49674375e9.1;
        Mon, 12 May 2025 11:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747074229; x=1747679029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwBb1g27iDzzf3BiBc6CzURemWUN7mfIH2kOtBADY/I=;
        b=UJIraNoRSRN01e6EjicgcL2cjXwG4cLbOGX4bg1joTo6MCukwQ7sNqBx+40AA0FdF7
         02cEGI1YpIiJe0d0P2Vmg8jhU3EWJQRRBh0vsIHYh44ANBcXaDd0ajFQnHqqlCwHq9D1
         /gYo36WFgkPta21gbsFVCTTspyFzsSjWpEITFghQwWqMloakqm3trJUcSyVVWPMrJ49G
         QKEs/yZFT91XruWI+2anHaoa7Z20ehKpp+N5mSzJVHl73Q5/fO0g22XCioljXZ18r9BY
         Sbow9Z9rOix5f5ayAV+aibVSpxUSJDJmTqTc0PQYW65s5XbqcCdu8LjhxGIaXuWj2tL6
         lkrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074229; x=1747679029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MwBb1g27iDzzf3BiBc6CzURemWUN7mfIH2kOtBADY/I=;
        b=nFxvzn3suG0oczFnFM9t1SUq6uT5JQl9wm+uGqlrUhsYia+4I3HKRaaZkvHCtYK3S4
         GAwCqZ5hDIygDO0nyfFE4mwME5Mt8Hgl/UA7IbRo5jp8OMIcX9ywGbUg4F6brfB2h+Uv
         jn/oEsq6Skd6pxqLu05vPkwZR3SGt++f9d/DFgLrq1pVMWbQZ1+zJSYIpqR7wsYMF1qP
         dLEolxbfzt2UxiHwMsJU1fg33pFcznkQIrdnRlLifvDnB/XQWUO985e6KdGoFEnuVbvk
         hdZLLpAW3FHdZSwuUJqWe7aat8NYodmQy4ZEANlVgqD9RH9CmO0hXxQzDcIIc9L/PTrF
         FEpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMPs4vLpjTM++DcdDfPkCYxhEigCNYAQItmnVVomGXmwazCrBiZo9RDr5NJbw8NfUOcRtmfmRVYyhTMMCI@vger.kernel.org, AJvYcCXuKAN4Ecf+catEuPzDRFdWGKgB4uR+VNCZZu0pMsj5o0/Cqk3CgYC2GWfpQ6Ifj5q6UvyIZNCVO93k@vger.kernel.org
X-Gm-Message-State: AOJu0YxRXUptJKsowwyC4p6oLZVVCimMJajhqJJCPL0EZ/65/UBjEdn7
	baHMA/K512ZrpFb9oznoEVVs4cfbxn8GAPyWfOxNHzsfGBft2/Xg
X-Gm-Gg: ASbGncu2+poY4MENHaXdl7WpSlMkf7P2vlXBugfmMwDBX/p/XJw1T2S3YiRd50oQUGM
	PS9JQze4/8Oa3NrZxOXd0zP/C4MHXZQ1lLe3S10jO+92Spt6gUOLhEiweTznWVgxYXp/rFhmGV6
	dzWterU50vS/SRHw7UX+t9xxGaNPIy71QAIxV7cpk9n1kOXFlbDEbrqgcNA8C1bdkf7KeQi02eB
	d0a6DEv4OwMtUgLTwyqzl5/KqeTQl4tmlyzRSMhNqQ/WOLudm0GhESHTlawgo5NnguHqgX9R/pr
	cU3v1NdVyO3n9qZB/gqOfrMtRgZWJcMSZF3IJsUYgUKu6hRxzVObZhK5+F53aZLkF5W064wI2NA
	q
X-Google-Smtp-Source: AGHT+IGlBcrs5+02hvmTpqDOCRIZFGOKwN+DxplEoFv/iZPTIPFZx7s33XvxvzzbOI3QLuMJaWvyGA==
X-Received: by 2002:a5d:59a7:0:b0:3a0:8325:8090 with SMTP id ffacd0b85a97d-3a1f64374d6mr12391535f8f.18.1747074228663;
        Mon, 12 May 2025 11:23:48 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:23:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 02/12] drm: renesas: rz-du: Add support for RZ/V2H(P) SoC
Date: Mon, 12 May 2025 19:23:20 +0100
Message-ID: <20250512182330.238259-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The LCD controller (LCDC) on the RZ/V2H(P) SoC is composed of Frame
Compression Processor (FCPVD), Video Signal Processor (VSPD), and
Display Unit (DU).

There is one LCDC unit available on the RZ/V2H(P) SoC which is connected
to the DSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- Added reviewed tag from Biju

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- No changes
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 5e40f0c1e7b0..e1aa6a719529 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -50,9 +50,20 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+	},
+};
+
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
 
-- 
2.49.0


