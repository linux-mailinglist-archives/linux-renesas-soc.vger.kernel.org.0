Return-Path: <linux-renesas-soc+bounces-16993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD39AB434B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 20:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 048D61B62B48
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 18:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC4A92980B7;
	Mon, 12 May 2025 18:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMFbfL8K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA84297B8D;
	Mon, 12 May 2025 18:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747074233; cv=none; b=R6zPuDn7V20wkPWFOoeotbu0Dd/YMeNrCIw3AI1vEBcRwjorbl2jkopsrwxSViWDPbD3ME+cbiRiLA9iSr+Ks7B+EUCG1lGWliD8woE6ENA4mykAoNH+YX0AgEVG2YCkbbb4NUzsfqfkPUyO3e4rMT5oYMxz7YmvhMWDkCGr2g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747074233; c=relaxed/simple;
	bh=pHPauBxQnAojIRrZWEtRT1gDEL9LUj6g/Tm/gpzaYkA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KvFEB9Rwsd2iD7CRpRbe4jj+hQyQMlfiLPIYg//WEmusPmJtrRbts+g+6gH59VCPvlBP+1Z3WoVyjiqk9kaRuc1qVcXiGIcFQV+nUOYcSQL0+gBdWpdhH0BLREXLuGFh0Jr7gxG13KqbdqQZMo2NZozjYpXKZv6Pgsm0/OqSmDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMFbfL8K; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a0ebf39427so3842072f8f.3;
        Mon, 12 May 2025 11:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747074230; x=1747679030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qc/zHSGJE4dxm+T84W7te8HR6LYi6zQ10iTIeKBgme4=;
        b=gMFbfL8KZW4vDnITttApQiiIq8qYk/UnKKjddnYDGHDoyRJDF7CXXa8dAI7b8M80y4
         oIfJ1tpRqAMbMjgLAoFz5GdPr+VN+ZpnTBGN5b/g5kiFlg83APahbIg3M2e9SejGuwoY
         Ge6+GXtnRpcPK+GAnE5dZwSWsNSHmnMg3CyVCr3yp3lrbVa+V+rOQkkkr/HZmRMAqbGz
         KfnQFnGd831X4XnFDR5a8SqeSEv8iblTRmVExlUQJC8BcY8/lw5vywFL+jfqHPjqfbu7
         VcyHW5Sl3CGew4LW6l77tfjEgov+3kzCPlD3tadvebdQT9bTs709k4fjyTpBSU4adEml
         vshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074230; x=1747679030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qc/zHSGJE4dxm+T84W7te8HR6LYi6zQ10iTIeKBgme4=;
        b=AcZEmNr4SVuQdG++cUQEcsNHGNHlCynNh4/8/lXk7cYCanU9MMdlP90mmQZJx+VMHY
         APCQhXAsViZCOZQ7VOV+h/p4eNGu55SK9GEv1+7XqdwDyTvr078ljOpcWHyXYdHAehox
         /WLnr9tb+WYDNLqM6BZM16GlMYxVwdxgdGGiar9Sez5J0k0gMSa2tlQYDY8O7KOvUMLY
         VSEY1X1RMkVafDUg/JNzEKEFvURESntKbbmyfbLVcgOz2AJ9q5V2PZJA7+irASSqLRwI
         kkgYU31K6Qq41q2gym5JtVYM65UJko2W8N9Mq0seBhGwkQEZEQVmKDrpsj2JEa0EAY1m
         eu4A==
X-Forwarded-Encrypted: i=1; AJvYcCV8mejkzfYeQnu2tCqwAgUj61MAy1E32vZ2Tp/eWa3SnW5kiMbHvrXJf8gtnV0/lcmGQBRxglxqNop7g5BG@vger.kernel.org, AJvYcCVnUx66vm4qQsQCT9VmtbKu3lHLw9+IVy1dToayTo4RYTzYvZYKAqc6iSMxC4pXpOyLnN3a11l3I7w6@vger.kernel.org
X-Gm-Message-State: AOJu0Yxblmhk0y7fspzOGh+PYwJlGidm3SREbUNzfpcD0yjJ/8A48j4d
	LXFHbXmpMgmPAfgGY7au63Ssg2z5eZnOws4E9JcFkCzVW6XTVdPn
X-Gm-Gg: ASbGnctDaDeRiP4XqWGQ5xPpsa/2m7kmO4wWE4zie23Al3iGmi/3qymZZJHts6FQHIh
	VcSasZJw4cLWf6wn1Kbkz/VhT9loN4a6tvROQ+BCUuSUvzzg4pTBQD2YqFNNW3ym7V6nP8Wkub+
	vmK/VNJgP5xxDxtozbmJKBnnAOT2W5c+Apc6f9eD6THL9Ee6JB84zFpir6G4muCVlWGb/8oyLZ9
	8JAPncwmKL4fngquMxG4x6Jfnabyzu77Ow2O6o+7zR0h8OBT6ds+Bx8Pq6KZz1z5US9t8kUfQa1
	IWHla/h/8JQX0E2OCHdr2PV4ekjEBoG6kcedFTY9s2F1qcXZQ14DJrZzus3XZUoUZJ9ArlSKkwC
	f
X-Google-Smtp-Source: AGHT+IG0wNhaFScOnTE2O7DJ1UMVp22WCeqi+y/RfOJwQDZA04x0nhBhTL9fNbvwQnjPFKdjl+AWAg==
X-Received: by 2002:a05:6000:420f:b0:39e:e438:8e4b with SMTP id ffacd0b85a97d-3a1f64ae792mr11060763f8f.50.1747074230172;
        Mon, 12 May 2025 11:23:50 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:581b:951a:bc46:a124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5f6sm13175497f8f.86.2025.05.12.11.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:23:49 -0700 (PDT)
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
Subject: [PATCH v5 03/12] drm: renesas: rz-du: mipi_dsi: Add min check for VCLK range
Date: Mon, 12 May 2025 19:23:21 +0100
Message-ID: <20250512182330.238259-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The VCLK range for Renesas RZ/G2L SoC is 148.5 MHz to 5.803 MHz. Add a
minimum clock check in the mode_valid callback to ensure that the clock
value does not fall below the valid range.

Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
- No changes

v3->v4:
- No changes

v2->v3:
- No changes

v1->v2:
- Added reviewed tag from Biju 
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 4550c6d84796..ec8baecb9ba5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -584,6 +584,9 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (mode->clock > 148500)
 		return MODE_CLOCK_HIGH;
 
+	if (mode->clock < 5803)
+		return MODE_CLOCK_LOW;
+
 	return MODE_OK;
 }
 
-- 
2.49.0


