Return-Path: <linux-renesas-soc+bounces-10233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D4D9B7070
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Oct 2024 00:26:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B42C7B214E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 23:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DAC2178ED;
	Wed, 30 Oct 2024 23:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RP+yqwF/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04C921745E;
	Wed, 30 Oct 2024 23:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730330768; cv=none; b=hiDZ7jrVyHiDK3NPfdwVDuGlojJG+F3R76K7/VN1UUNk2fPG540l2NRYwge18pD8bzZket49n2vGGpc3dLJneCq7dp408dI76VsWJseZYema5Dnaf8z+UODz9eoczavdQFXK9mCnVuT+xIpxsHIw/0aiTCqVCt9XkcXJ1YCy9yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730330768; c=relaxed/simple;
	bh=qG6IB3tD6+yPM/lumoXSZZ9FRa0pFVxRt2KJfcdlqPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LZwgXjaOOv3e1t2isZOrQ5kxDzehFK5pTjm/1UMYO8colBDTZLMBbS/73wlgqY1cjFKrgei7UmBoWnU1tH9dIOYrqQsmXHmKKN0rtb7Iafpied7Up/7DmycKA91HrB2Cxf9vA/1LC81a2yIKAG+aSgPkfOlcq6rfdllqm6G2n0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RP+yqwF/; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4315eac969aso2069495e9.1;
        Wed, 30 Oct 2024 16:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730330764; x=1730935564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etFHZ0EqGWLVKcZ/IRxxgETEj6o4J8B9iZYvV9e7Iv8=;
        b=RP+yqwF/4kICNBlmxSDI31PsnAN/TNgg7iPaVRLoA6TlMDh1SYwE2MWvny7P3IpqEj
         OOR9s4B3ztEPXRlpsxRE4KztJtPnCsk+ZYwFQQpoBe+LgKwCfZw8A89LpsN43DZIjpYs
         lR55LI527jzRs4ebd7pqDbM3PTC5EFaFxgXE6B+ZljPOrS7rgcYK+QZTiQRzMscRTKLL
         zMnZwU/m/tc5ZL1pGyjgwiknVpE3tGsVd98Df+wZAfXRHO8xLMuuUADz10QkEA/Q3xFu
         4+Evn/uin7cNPGcfHOGdKjpWVt7ZscOmEi0Qvbsgj8aMBNf3VdkSLToeEYtrQ88O/SC5
         T/yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730330764; x=1730935564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etFHZ0EqGWLVKcZ/IRxxgETEj6o4J8B9iZYvV9e7Iv8=;
        b=TJf+ivEzdf6mHndiqM8v75Khfwf6KsTOHBy8Bh/lAd+x8WFb2Xsz1CKjctapsBQqBI
         fcm5qpGRwwTCPFGJV1IjYpGpBpeLU/ekQM2azoeFPV5Nnv9qxTElO72848gTJkWiTsFN
         lyhNGEWj4ZZfiHDug5UL2uxbggjio5aqw/IGof+y3cncgUlxQkIz/Q1HMnGdKnVoZhSJ
         yMh5J79oqhnRMWbgHacAPd+mIQDcahC1V6I0iMO96NqgEknk7ynJ5fC71Os8s6xAD6Vd
         ELXIbU2n0DsoP83F8UiSBdMLdRFWyInj2uXnGhhovw8RZmATa//2Gxb9htgC6cTh10ID
         lZFw==
X-Forwarded-Encrypted: i=1; AJvYcCUg9yYlPxGWRNj9U8tEYpQUIQfm299rS8dBrbaxilF21n6gA75B+TJuIhyxD2o+gzn2QakICSenuGQ=@vger.kernel.org, AJvYcCXvDWBscI/umiId/GOhjNSHXj1MfaTY/sOrJnQc35/DNBHetBFZw5oabSpN5YPWpMAGuT0g6ZI7sSUZJYjm@vger.kernel.org
X-Gm-Message-State: AOJu0YwUPPXlTt2evNCpXQHvLAHJiDhXU00IkMvqgR6aJCnrTQOqb/b0
	duAzo6N76CM45MompVq7raYZfvbx9Ry62hXQYsE7kKEmR1uOecmB/h1oehiX
X-Google-Smtp-Source: AGHT+IHkWyosrXnzVUyRsA+eYkVHkUHdz/o5cdlWAuNhG2zBqgplMrWgOLtyxRKXBztlD+ybaW8eOQ==
X-Received: by 2002:a05:600c:45cf:b0:42c:b54c:a6d7 with SMTP id 5b1f17b1804b1-4327dbcb535mr2530365e9.14.1730330764290;
        Wed, 30 Oct 2024 16:26:04 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-fbf3-0656-23c1-5ba1.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:fbf3:656:23c1:5ba1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947b2bsm35338395e9.25.2024.10.30.16.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 16:26:03 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 31 Oct 2024 00:25:57 +0100
Subject: [PATCH 2/2] clk: renesas: cpg-mssr: automate 'soc' node release in
 cpg_mssr_reserved_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-clk-renesas-cpg-mssr-cleanup-v1-2-628274ecbfcb@gmail.com>
References: <20241031-clk-renesas-cpg-mssr-cleanup-v1-0-628274ecbfcb@gmail.com>
In-Reply-To: <20241031-clk-renesas-cpg-mssr-cleanup-v1-0-628274ecbfcb@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730330758; l=1461;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=qG6IB3tD6+yPM/lumoXSZZ9FRa0pFVxRt2KJfcdlqPM=;
 b=iiREKCHRI7wAcjIwWXi2Ozabkvpi9cjg2JuT0ONzaOGUI3UjRxWWL2+aAvmaJ6YSzts7+ZrsX
 Mz1KQA67g81BWG0ZJoYYaiZxncbA/NgZ4UsOn5OVkwgz4MHVr4ntqOv
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Switch to a more robust approach by means of the cleanup attribute,
which automates the calls to of_node_put() when 'soc' goes out of scope.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5dc89b1009fe..bf85501709f0 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -979,7 +979,7 @@ static void __init cpg_mssr_reserved_exit(struct cpg_mssr_priv *priv)
 static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
 					 const struct cpg_mssr_info *info)
 {
-	struct device_node *soc = of_find_node_by_path("/soc");
+	struct device_node *soc __free(device_node) = of_find_node_by_path("/soc");
 	struct device_node *node;
 	uint32_t args[MAX_PHANDLE_ARGS];
 	unsigned int *ids = NULL;
@@ -1022,7 +1022,6 @@ static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
 
 			ids = krealloc_array(ids, (num + 1), sizeof(*ids), GFP_KERNEL);
 			if (!ids) {
-				of_node_put(soc);
 				of_node_put(it.node);
 				return -ENOMEM;
 			}
@@ -1037,7 +1036,6 @@ static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
 			num++;
 		}
 	}
-	of_node_put(soc);
 
 	priv->num_reserved_ids	= num;
 	priv->reserved_ids	= ids;

-- 
2.43.0


