Return-Path: <linux-renesas-soc+bounces-9952-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D0D9A90B8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 22:14:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 478521C20FF4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Oct 2024 20:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31CEE1FCF53;
	Mon, 21 Oct 2024 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TuuVQFtz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9451C1FBF56;
	Mon, 21 Oct 2024 20:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729541643; cv=none; b=uBq+LpgyeQOydB5e4cNZ4JUG//9bKfSWTnUlG3vkyXvzgRYC1G9g6uOupfrkeF2xDrt5sNM1pzVB6cj89Cd7Gwd78FuR8PMnCyZt54jbr/ob86h7+Zk4KqDQy7gGQP+2vZmesvJW5svKZmDWQI2xBLBZAXah5ADE2V/JroZ6TsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729541643; c=relaxed/simple;
	bh=IyonAmKq0ZXAULmY3+PDBoQYB4H6I4G7D5Vm5kNOI5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fi8Ooj2AZQdXigfi1ovLuSSVLex/+SMWywEvGl68tpMTxBqkg1HeY7Qxq5efkys3gvtpYqlCshQWNcHKJQwLELvPLFPfR+9CMjB/GllK0xPta6N4S94+8N5XIkGQSGEdoSB3o/QnZtgaubz3nm4k5myuYElFD1FeV+p6+38u7Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TuuVQFtz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-431616c23b5so23419185e9.0;
        Mon, 21 Oct 2024 13:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729541640; x=1730146440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8PgFaYSXbYxlUGQOc4NTq+xSY/C2TaX6+49YKSFz30=;
        b=TuuVQFtzua5+oNW8W0pFO1l1D59Tqm7GsOV2rn1koUteGJFRzSZvktiWXdwEcjciE6
         co9eAIdDoJj/ZmQ/87p2VwIomxTZuMyRSX7r4uz9hIXrUOdnPlvfu/ek5baHkIYYIhEZ
         NT8Hdsh22LQvNbRblYYcnHjR+9BXX+tzr/+iOQJJeGI26NiBxmXywz35Ntaa3yiBd8ni
         4p1AQcPqUm6GG2YqQ9aKvFgbcmUzQ4dSVGUorjfMa4vAZScYUOsBwXU/OFaeOXx5nKLC
         cVuCLTTUBc89zmjdKsLbKDZ5Yhw0UmCp8PMBEwYN3yWKurTNH5UG+OTl/vfP2gbT6uGY
         CImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729541640; x=1730146440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8PgFaYSXbYxlUGQOc4NTq+xSY/C2TaX6+49YKSFz30=;
        b=JyUgmlsAqgZT+Q6csJCf6UkgiIPPV2RJlpE4LYg13Wq2+X/rIyTiRgZRTygjjl7LFw
         zjk+afyH0cQAvWCN+N51elJS/jIkbiyE+LLWnq5VZIuW3NrYFONLCVZSbDMWScq3ifTk
         0cjk/RCgcWUxuGoNVwGLcBV2/dxv0V5md1l42Mww/zQWenUaax4R+5hR7uPuS9yzG1jL
         jJIqh3L/3ZtObpcf/jFedlc8MQoTT8uXQYFhivmf4seDl80gIhSht1rvK7GkmiNqmGSx
         LtbotBapveQYoit6+BDgrpncHXTMHX/o9UH/BvBcVKjuGQxI7BvOJdvrfjOH0nP7W0V/
         FePg==
X-Forwarded-Encrypted: i=1; AJvYcCUfjleJ5rXfeOKXZ6K2gb92iWuiS4pS4d6olHzhBZ8eIxoGiG0F4sGVKA44SS5o7qWokg6+tLY+Z5+E12atTysGSyA=@vger.kernel.org, AJvYcCWMbCiMoUNnNoH6/KE2tp5pzXW0f79kdmizoED9hvAZba/c3DXi2Foewf/VZRdy3cXC5vDI9ZpH+RVY/Ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YygQ7qEu34WDTSY1TD/9EayOkndKCXR7U4t+pP2S1ECfr/gA5lC
	XqK6VK09ri+nek2JwduqdrVCJbclXJYOdy5MGaWsv9sP3IagXWaK
X-Google-Smtp-Source: AGHT+IEEIcDbKBxUfV9NSsvc6jISUFjEo1LsQCHWUFkc5KyzZylqCpv8FKTgzoBLTqeo4f8Vb4NPIA==
X-Received: by 2002:a05:600c:3504:b0:42c:b54c:a6d7 with SMTP id 5b1f17b1804b1-4317be9c063mr5223265e9.14.1729541639721;
        Mon, 21 Oct 2024 13:13:59 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:8a20:67a1:e60f:941e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a584f7sm5042935f8f.53.2024.10.21.13.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:13:59 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/4] ASoC: renesas, rsnd: Update file path
Date: Mon, 21 Oct 2024 21:13:47 +0100
Message-ID: <20241021201349.395022-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241021201349.395022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The "sound/soc/sh" directory has been renamed to "sound/soc/renesas".
Update the reference in renesas,rsnd.txt to reflect the new file path
for consistency.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
index dfd768b1ad7d..3f07b072d995 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
@@ -109,7 +109,7 @@ For more detail information, see below
 	  - Register Description
 	   - CTUn Scale Value exx Register (CTUn_SVxxR)
 
-	${LINUX}/sound/soc/sh/rcar/ctu.c
+	${LINUX}/sound/soc/renesas/rcar/ctu.c
 	 - comment of header
 
 You need to use "simple-scu-audio-card" or "audio-graph-scu-card" for it.
-- 
2.43.0


