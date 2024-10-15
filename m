Return-Path: <linux-renesas-soc+bounces-9745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1F499E619
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 13:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D28532866C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 11:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A4561E7666;
	Tue, 15 Oct 2024 11:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIOOJmNE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691A01E765B;
	Tue, 15 Oct 2024 11:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728992297; cv=none; b=f2lOa1d3ZSk2Po/qswJrJ2WKM6ehYnxX394Cu617BN9GsexvGLf0NhrlOc4xfeFxeSpCI4eiY4mZ1qARq8ibcH9wnqftoiuvLVRI3EXTJ1dFWajeYVl9v7I4kMlPHMRSSbkotn0rdv/JC5kXRpDbw7WZa5nSMSUePms2GzOl+Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728992297; c=relaxed/simple;
	bh=z7tsqGjREmetBgDprb0Ka8yrJczZi4qPdoouN5e+UYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zx69jfzclZ7KXEt7eciESX8XU+Y4drVTrqyo+GTYhScVvupW6FsZ554pBJobfv/dJTbWTj/v4DctDdcZ+oNsBgyKxVQ8fcwCqrhZMWBmnUbifLSpfilz0sRliKETRJ6UiQJPEvs1F0WDbWb+QR7Cgj7sVZ6ebscARxcWmKpDF50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIOOJmNE; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d58377339so4095710f8f.1;
        Tue, 15 Oct 2024 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728992293; x=1729597093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylFBUhW9xZtxG2+R0X54iA6zcqHI2dwyazGZ3RzP3lI=;
        b=kIOOJmNEIR4xFeJVqPKIlKSzvhIVHQpZBusFgsW2HWQE3/zLbRo6G0U+DWqJZD8cK+
         eoeDCLsMieKCjR02k093Z5nZnKYxtV2Lpv7+7ui5+62mrT6P9cijkk8ILhReLieRYva6
         NiKxWDPQ0Bfb4sTT+bWuL57ctcX3P8lFTOSEQ4IMq2y7d6oc9DgtjdGiuw8LrLCFTmr3
         Jnl6F6wSGxnSiTbc0phNGdwxOAmvuMvl7TOn6Zqac7/tHTS18wyfGFfkG11BMgBFC7DX
         YBAFiFd7dmbqyPX1e8ZFmOWnmfN9yBT/vZSz3RSZIWRR/FRYueAerwadA5+F4dwfUVrl
         yRlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728992294; x=1729597094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylFBUhW9xZtxG2+R0X54iA6zcqHI2dwyazGZ3RzP3lI=;
        b=nDe33WaGP72JMHv9AuyUzkWTkA5xncxLf4lWvotGdgdgZniacop/1nboxlGnSs3J39
         TJpTw3Ql58GjjGPGamDvYKxwEtMXKnGkqQVL92VYnFh9/0P8jb7MQrjIkLOxsX1kZP6O
         YPS9prQxPwyMrktg4DaIZ9w53UTsNApmSsZU99fgUAySNtS3iyaNkLnjiB6GxZ0e9xkr
         f7J65tPqlDgYkPa1oNzKV2q3M7gJTwJZ8+S5AV6t2JZNucn39IyyYV5t1aqyBdqLYsI5
         ZYjLme2J65m6xcMK6XezTtpWbmx12Kx33Xj3Yq/HKu+e5bXq/5BLEbkCXZAB5E2sePnJ
         ZnCg==
X-Forwarded-Encrypted: i=1; AJvYcCVosU3f2mL8VNxLYa6svuqXjEE7WLNLYNe8HIEy1veix01HD7Au5UFndrSZixwytokbzkPm/e9AkUW6UB15Kbrv+jg=@vger.kernel.org, AJvYcCWXRsmv2O6eTCpzSHs+CuvaGJv3VLRh2zxTQqnKk2nmIWMPx0od0GkGJW4ZWaOdhSuwbcWxH2jHZQKeHfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YymHH97gl2O0dd7J9b2OJ6A4qypiVMkkd8AuqET6Ry2thsznhSr
	NvuDbMmFEcgRL9g3Dgr/2G0qsN5tsgBKHn6lrEdu1L9y/QoYLGem
X-Google-Smtp-Source: AGHT+IGtBr3W5bN/TF+pVmsJjdOtTmvpA7GmoCd0QOOx/iyK+QpTwVadJrOfiSUiRAqDds5IpORBDg==
X-Received: by 2002:a5d:68c8:0:b0:37d:5296:4b37 with SMTP id ffacd0b85a97d-37d5ff8d261mr10464488f8f.24.1728992293473;
        Tue, 15 Oct 2024 04:38:13 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:ab23:85df:144b:6ce6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a256sm1363943f8f.14.2024.10.15.04.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 04:38:12 -0700 (PDT)
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
Subject: [PATCH 2/3] ASoC: renesas, rsnd: Update file path
Date: Tue, 15 Oct 2024 12:37:56 +0100
Message-ID: <20241015113757.152548-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241015113757.152548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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


