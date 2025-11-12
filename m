Return-Path: <linux-renesas-soc+bounces-24503-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF0FC538C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 18:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7D0756103A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Nov 2025 15:42:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF442340290;
	Wed, 12 Nov 2025 15:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Omf+Fb1U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D091D33B6C7
	for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 15:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962091; cv=none; b=FRDPyaB2VUdMOMqDiWX/SxwBmrQ12AiRRoXTA6S+NtNphUlOlpR+Ii3S9CEQoOQF4UZJlqY6a8lCcOPfogtaRYMU//VBb3HPGuo0M2omKq8AIzBC94QdEpKXuNr+fDtaZ684X8iRXJv15+sgpYKgEYjzG11GLESRtXJXBRa39AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962091; c=relaxed/simple;
	bh=2VDdKEp8F1Kmk4EzLuKTTS/byzcL3Fzd3mUIgAOO9xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UicsQOjrDB3/clTsxDRsR7K7+tKcu/+iu6xN0dmq9K5HB2SxB2YjdxjVkLozSE5o4CFeyMjuaiXWKVxsMPZlJVXeZ9u09njGQL1o5F9JgcB+3aXPUHxpP0SajM/9skMPFlSeH+zApgPHLP/TzESCKKEe1rRdFw5VxgP9oYpUsjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Omf+Fb1U; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b72dc0c15abso186042766b.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 12 Nov 2025 07:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762962088; x=1763566888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2aZ3q8iXsguvzv8869dZeM/b50D/XalAVFAVL82xgI=;
        b=Omf+Fb1UYpnkNc1YTDoNIOjKKnvGTc2JAbiRumwX+l97e8rHW41VdZbmJd25uPggGt
         QFRDV6OMDe8nuKLjB7jnFkuwPU9bmna8fcE6g7mn7hLagRmbRxvq82D0WCtAEUBPWjrV
         ajBw/L2z43lq/hQRWjXwQPgTgLtBjnRuAHVDXJAlSUoLlIOlywe/s1uiAfKpGzDZso2H
         0ykr4KJ2OQobsQFMJZrqHzhj6q26A40SR1dWZS1NtrWC/0HlPBuxc6rK604T/Ws7Nf+8
         457ycK7XsNNK9Ki31LwvuRDcnoezheNcerEjXQ51F3KV963mjivby+0C6/sD8EpyuckT
         Ns9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762962088; x=1763566888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P2aZ3q8iXsguvzv8869dZeM/b50D/XalAVFAVL82xgI=;
        b=WyhzKxfPKgzYuifA4tKLLNX8oDlr43NBVJ5gNxfJNqtLAA0H1+NFZvXSUFUkYC5CSw
         hU3qKtyj6ccyxhm0G5jQvTfIWNIL1PXvDNLcQ7UZ7Ic6z5q8rU6uuy61sGHv9jQAhmxh
         KUT1eppc9o5YQYPxD/OLU+5icGJBTBDAPD50hfkPl73QH6lwwuIJncXrmvMiLLur/sov
         S/nIqVMDbA6Rupe43btVBctlK2Yuo0m2x0s+91Ux2Vn9JkdKte4I6u2CuXispJC5/yQQ
         chu2Vo2xIKruv4hDkst5wv7f+vwiFyqBmPFCeNNhd3+uo7/XH39ZI3vBnd8u+ZM+cmTE
         xwYw==
X-Forwarded-Encrypted: i=1; AJvYcCVlQLPp9na2cvzS21SUjfK1dERvY5HtI+S5bXfAacxFLHu3rXMPjCtu23zPWvYrkGM3pS7B0Xak1lE4/ldjssXjcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCQEtIQn9w0GL/tqBhv5VgeQFCy7tOUmpm+ZQC6wecBT3EzLgR
	1WQA732F2oVfG7BHLFXF/D2+pL5H5KvPB3nDGvB32OEjvKvw1PlI5XAC
X-Gm-Gg: ASbGnctKtxSug/+oXSAD0m+XIPs9Y0iEpHmTpr3UfLIFm/gtzMpIJ1GGQMmWMOnNNCL
	TtLce1HekbougZUx2SIpLdIuotqwNqjfeTBrroEdGyXvNh+4U8rrKWS8Yodf0ZeIHncsGNYi25F
	qRHrwJjwhlx6M9XNXBY3WO19lxhxfCVbmdkutIKWeTckXyYsPtLQMSO0EhcUQoQTN1d/6qyjuoU
	f/tIR1ehWw12hA3NorBEQQ3o9kO3TqTpVWvSZPaSw9UrW7uPBy70Qomeqj6QC8n1QRgxYce6Qm5
	rjpyokP8iHavlyxTnULrnnY/hVeA5TMGExmhk3lCRTemtPDERdLTjPu3o9vQLfL5b5KSUa2m6qI
	Kvt4072UMuTg1uURgztfwQXhqlUVy2lXyQO3JKBAulJhBbqPMe77xcrEikwFFTjWY6NCrTCtC1P
	pbi5ZCAjRx0/nYfC4BCuE7pWTtRCUOITHUqll0+7EQPrA71uy4qHvuIqOc8BCUvAEJsWTdiDUBA
	RxhbA==
X-Google-Smtp-Source: AGHT+IFugR4FUZvpldRleNYZZnPoxk2FrSRsDVPT6ppUn3fq+PC6KyK9eoozx/2VMx4e/g2GMOwGOQ==
X-Received: by 2002:a17:907:2d0d:b0:b73:21db:5fa4 with SMTP id a640c23a62f3a-b7331aec4a3mr387296866b.62.1762962087982;
        Wed, 12 Nov 2025 07:41:27 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf97d456sm1670023566b.39.2025.11.12.07.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:41:27 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 4/7] ASoC: renesas: rz-ssi: Remove trailing comma in the terminator entry
Date: Wed, 12 Nov 2025 15:41:05 +0000
Message-ID: <20251112154115.1048298-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
References: <20251112154115.1048298-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Remove trailing comma in the terminator entry for OF table. While at it,
add a space between the braces and comment block.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index c7d5576c8283..5dc510cf66e1 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -1248,7 +1248,7 @@ static void rz_ssi_remove(struct platform_device *pdev)
 
 static const struct of_device_id rz_ssi_of_match[] = {
 	{ .compatible = "renesas,rz-ssi", },
-	{/* Sentinel */},
+	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rz_ssi_of_match);
 
-- 
2.43.0


