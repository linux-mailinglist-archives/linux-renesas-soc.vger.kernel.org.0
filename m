Return-Path: <linux-renesas-soc+bounces-27077-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03381D3B7C6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 20:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3FC9330F2920
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 19:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12EA8283C89;
	Mon, 19 Jan 2026 19:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fkfCX2Dx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68B32DEA6B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 19:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768852405; cv=none; b=aAdkOBDCQlIN9c8bKS12FUSC3uRL2l6DvqPlsaCsgsnjWq/XLRBZ1skO/AD58qKBTqf3HHO7UDq4dLaXLuIfJFFygQQzxNc6RztoknWkaeyJpKpR3NSsmSrTRnOCEtNRIIqZBhHtE1Nid4roo9jf8rQC9uWi4u/oQntw0SMzc8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768852405; c=relaxed/simple;
	bh=D5OBraIFCsLuejYqBqDttMwf9aqGROn5pKOyd9GF2nA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mZa5IiRwbSNV4xquJYPCmqYwWlc3OObPlu6xlW61OATc92dC9LbxRpIWvLpWuZbMFcMsCTQUpGQqo92hyyqWsDddr0WprCh0swd1gvV9LUOp0hwPGx8cgJNZGbnU71r87v0iZBpcachOjXUHc4YnnZ4qUbTLGrhgslhJ9f9SX4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fkfCX2Dx; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so1081562866b.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 11:53:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768852395; x=1769457195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++CdGQfY/XSJr/yxMZl870sJmmACkpKJfiaVemZXNhU=;
        b=fkfCX2DxBO+2Hhqhk7bw5xypIyE3uuww5TIhRI1ehYwNLoov6OZQwnKdwCQXWv4bW2
         wBBX06QvNbgtqVIyXpBcqWqJ4f7FoTbNq2SY5ujLo2hb+abGqjDD6gF9vHBfZsyWni0Z
         S7/FNd/feD99V1ufdAmacylNxmebCRweJjrAgFp3a62/IL2Do5fZzzctcfAzdnj+CkfE
         8jZMzwsjM0ruc0fkpDVk64dsRREsIVscIqOjR/wGB7X1Fzh3EXu+vHF5QBrQAnu98Ar8
         TI1tJSI43KQXUPST5AEvS1m+utPan+q7faienrBunh+omfg5DMRunc0dPHQKFJViQSYw
         eGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768852395; x=1769457195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++CdGQfY/XSJr/yxMZl870sJmmACkpKJfiaVemZXNhU=;
        b=dXl4dFEXhaOigIC63U2DBmn+RsARBsfpmCLebk5zKKGCvFA5jsQ8Z1fndzuB4UFVu4
         JQDeWUk9cfqVp8AV/Zu2LPU3jQQiwUglQta4k9J0Dq8gErst0UU7ltIDnydjC6KCI/O6
         eHftGwSFggH2Mc1gIHCt0NHSv27u+U78B7MVR7DSmW7bs//JjV5jcgyAHD3aVRvu3t6G
         2FhD+Vavpsp97ztWcywdpOWmP/Yjp1QrVYs2MhnzwSiCGui4++CSxNQmRggZeZhZdSkY
         XjlJZuDDyhHahzhdo6mMIIojbZxtsxQ/B98/Xmxe83VXI0IK1mcp78tN2IZh/2kvUZYU
         f0Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUkkhbkPtldUQeqOLxrq5lz0lqiXpPalCtPnMFF66+73FZPjeoyaNM3CYnuHAx/XOeqTbBy46FdeqlJ+Ct3vjrTwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxiNFeorevohWr6E+Qb5OvkpwwVJ1fGmTvclCoB+HlIycxAYDU
	fH80Fpb0OiMbYiE0Omie5YIsllkHSTZILAb1/bCr3f6lpbNWNnLR2/pPPFXFIPpXgio=
X-Gm-Gg: AY/fxX5700UQ4aaBJWKh+r7g7q8Bs+4cw+zSb4DrWsNOfvu0RivylC35I9YTKfNjIIH
	tRGgo83ediClS8VR2IS3I8ptA1OdUdFWiKBqipnyMrJrAC94lGJ9B+VT18yiNSGPSc/B2TbV7Gr
	hwYbohTliQwPe30yZwNxMCJTiSrIqibkwTyabv/YtIlyiD2K9xNuuW3l50k8cJzrYzeQzWoVpF0
	yCep63oP8BumvfjTwsXXSAEDEAsJeKxHc0pEnRVOEF0t+L7JV6ZlBY25D81BxD1dqRCfrf5WO71
	xEllZaqp/ctnYl6HYgkfPfRXVs+lQHDqeJsg470e3aa7ufkmW5bw4+CkIqG4yB9ZuTD4YmxpWtp
	vTna8IEZsUNnmFw8WTP+S6b22T12EKUCJEgmHKOgVCSPkUIXJnsl1pmuZNMlKrDAcbCfC6rTicW
	8xoG/SUxNdbYx5eFxAg6vM+3+qIYJiO9OWZVp0I6o=
X-Received: by 2002:a17:907:a41:b0:b7a:1be1:823 with SMTP id a640c23a62f3a-b879327fff5mr1099044466b.64.1768852395271;
        Mon, 19 Jan 2026 11:53:15 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbb38sm1167248266b.52.2026.01.19.11.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 11:53:14 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: claudiu.beznea@tuxon.dev,
	linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 4/4] ASoC: renesas: rz-ssi: Drop goto label
Date: Mon, 19 Jan 2026 21:52:52 +0200
Message-ID: <20260119195252.3362486-5-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
References: <20260119195252.3362486-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

There is no need to jump to a label just to return. Return directly
instead.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 76e7f0fe9df9..39aa865bdca3 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -881,7 +881,7 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		for (i = 0; i < num_transfer; i++) {
 			ret = strm->transfer(ssi, strm);
 			if (ret)
-				goto done;
+				return ret;
 		}
 
 		ret = rz_ssi_start(ssi, strm);
@@ -897,7 +897,6 @@ static int rz_ssi_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		break;
 	}
 
-done:
 	return ret;
 }
 
-- 
2.43.0


