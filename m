Return-Path: <linux-renesas-soc+bounces-10153-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B91319B0749
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 17:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 79331282B96
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Oct 2024 15:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A41421747D;
	Fri, 25 Oct 2024 15:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h9moAI9K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82C321744A;
	Fri, 25 Oct 2024 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729868728; cv=none; b=i1honp7hXp9i9CyKPljN/vY+wTpB+1rbTSOQ7YIWV9JltEh+dn70PxAYwPnQVu1wt2BWuKnPhg7+s25xqI1aWBVqV31xDzsJ28UjyppmR0NFcwJ/tsBDY2oVG8kYDYH4XrHPVUr86FX3CxekE9qO7uK4YqXuWp+Z0V7jvciYS/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729868728; c=relaxed/simple;
	bh=h2PtjdyVc0APcMj4i+2AhMEKxO6brgOfBMw/xiPJNVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwvWqLcnDoHSc3qPVGU1SQMBcGZycnXwy9gVc84w/nCBbvrRwewXXCqAqV5jOhxVi2uTKSiN4S/j2qclhICwjz01joXRFoTCryPpvhc3dPnVOI6srfTvz0k4suuvpwcN1B6ytoJjF+3DXVvsglmV3U4Oy8+16VsI2bjozgpPv5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h9moAI9K; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d47eff9acso1491413f8f.3;
        Fri, 25 Oct 2024 08:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868724; x=1730473524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9QEtbyZ81mpOibPhAgUPCS7X6wQ0GbLWDO4LTKU54pE=;
        b=h9moAI9KR8O6ciFfTkVxmsoGKDA8934s1k1PzjNKCDmSKc/j/vOvdvNoCXyggdPZWX
         b4NT8K5u08gNPOwSylLi93qn+3YYEZzEYZRcIsVLMO06rlyDrDATxCds3KDZP8D2fSfV
         Gxpb8Yvz8zKmhkQxI9spPfZJL+283KqMb7iP4F0XAZkD7SIkH19xrQKZ/KSkk5R1JoR4
         PwU+PxVmA29oQ882wy/fdjTF0un9hsRU7ygkGuNauqURfDLc5L6KdL3rpGTJbRGU8H8X
         wVAkmN6ZWDhnuFwtANBiHYkYBiEuN1KkuBcD1jNo/MyNOrGzewqpxSmbcWIfHptH/Mz6
         lSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868724; x=1730473524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9QEtbyZ81mpOibPhAgUPCS7X6wQ0GbLWDO4LTKU54pE=;
        b=a2tCmK/pdHxSEXZOlxm4xewRoOv2bAnfU+Una/K0k3De67q18QW8FHE2nxx5JvQM5d
         9FnZyHYeMLdDXQc2NoY/230dALM+ENPMqr3WFjAPerRgsX/XUzy6VGb1m/Cvwhe92Vez
         nfNS7xQ0E1EZO8R4JwxBfT0Yc5gMYs+LOsQ6wYaZMjaDIhGU0b0i1JZnGmdUR3j9JS6L
         Do88mRd7v41HVym2b9sXFcHzfua60xOOU8I10LC2A7hvdCSCJbeu4TY3KHpSUeHYd9x3
         OvXVcBadxtQzSqfP49H6R14BJ4luXsWV0/wBzbzLlOOw/u7psQLzsb3MLrTGaZ6LZ8FM
         QF2Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/g35e/huKcWfG5F3FyEECA7kfUOU4YjoL4YungG6qJtycp4oVqW4XvrDAtItA0K0hTAhPM/U1IfX35+lR/Nvn/6o=@vger.kernel.org, AJvYcCV9tI40nIbYkGvhumGT2pf/C+4RJGEJpmcLPik2EkvFvMfc8ks9uxHX9jsIQPhl9xf9fIjM7HvocDp3mkI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0XnkAXXsuWFJtN/cJdoH3PN62nnK3tMr4BhOJ8sRBOTGN18VC
	LOGVQKUtLOXkgAk7bPdx4KMcY4elCUbupDvduq/jc1HoOjvhH2oY
X-Google-Smtp-Source: AGHT+IH0M/swK37NmH9WCFuR3qdcvB1ZL8Zwba9NKjj1e8ACYfqkkpQHjyN9EfuQ3sHUP5vQ5TrT5w==
X-Received: by 2002:a5d:65c3:0:b0:37c:cee9:4684 with SMTP id ffacd0b85a97d-37efcf05d7cmr6778714f8f.14.1729868722501;
        Fri, 25 Oct 2024 08:05:22 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:1044:9cc9:b89d:54cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3b57bsm1764349f8f.26.2024.10.25.08.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:22 -0700 (PDT)
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
Subject: [PATCH v3 3/5] ASoC: audio-graph-card2: Update comment with renamed file path
Date: Fri, 25 Oct 2024 16:05:09 +0100
Message-ID: <20241025150511.722040-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241025150511.722040-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The "sound/soc/sh" directory has been renamed to "sound/soc/renesas".
Update the comment in audio-graph-card2.c to reflect the new file path
for better accuracy.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 3605a6b2c782..dc44d86f5ca0 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -50,7 +50,7 @@
 	snd_soc_runtime_get_dai_fmt()
 
 	sample driver
-		linux/sound/soc/sh/rcar/core.c
+		linux/sound/soc/renesas/rcar/core.c
 		linux/sound/soc/codecs/ak4613.c
 		linux/sound/soc/codecs/pcm3168a.c
 		linux/sound/soc/soc-utils.c
-- 
2.43.0


