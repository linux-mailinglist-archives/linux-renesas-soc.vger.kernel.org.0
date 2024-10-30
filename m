Return-Path: <linux-renesas-soc+bounces-10232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5839B706B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Oct 2024 00:26:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD84A1F21DBE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2024 23:26:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40ACC217647;
	Wed, 30 Oct 2024 23:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uwmhe9H7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBD71E3DDD;
	Wed, 30 Oct 2024 23:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730330767; cv=none; b=SbHQFOP0j4xyWh91AvoljNQdiY5JWFBrA7HN+FRlmYI8I16dbjkLj4DqCXkzGeQcbwRPB/5FXiqlvf0o22pV8xRf3c5Q1R+Ph8nEQxJqJrTBRwx8HESfTxE6shYIUnkq80v3KcydNBw2YdC3u81FvgoNYBOq3FtQD19VkasXwwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730330767; c=relaxed/simple;
	bh=MCSmuEk4fzdFG0/fr1cFdVYK9Z+TAFWrcnZ1tpPDXpk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pC8707TFtlUuQH4NpwwfcR2RbH5H7VYPlQqd3DgOBzLyp7uLpUP7MHQ6w/QgqOssoU8AUjMDVfaFdSxS49uswf9vfae6oJUAv3+ctLgZhEbXbB/EFDHcv/jBwWznUyM5OBXCizXAEB7fRz1fn9GuGfzp1zZ5Tl6NCjEVb9q8la0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uwmhe9H7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4316e9f4a40so2833895e9.2;
        Wed, 30 Oct 2024 16:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730330763; x=1730935563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YXareB8gROQQMlffCs1rrGjwMItPDqgeuEz/CInJUko=;
        b=Uwmhe9H75wcbjFTBguKdJI4+m1/n2j8YiuehDANeY2euDGSOlgfEfuWFfUXqCW8SuM
         Zo6Rfvh8VzDjOEBaRKUxEAf939CN9SV6pP64sNO223rGDjLimHFBBA2tJSP9Q3T2/PRF
         BD9T8xKulgxH5hoS0zpGwpPg1YuHYY3gAufhzEc6i9/fUTxu+sFTO6+AsfHboEITvryK
         Zq/vG/F/C+R5RekeMgqZmIxzOo8ubY5qOPJ/V0KqXJG5EeWlwYy9PdXCCrOVjWQOg+cm
         MGGsoaX9o9GYG/egNyZkm8t0jCDSw1KkYEAmGZ9mdetwg6CfFZT3gQLkvQA19HqhOp4B
         rRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730330763; x=1730935563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YXareB8gROQQMlffCs1rrGjwMItPDqgeuEz/CInJUko=;
        b=xKnkUTqVhvPbHMxFRegSL2c5/FuZTka5yrtckWc3gkKlwcuvTyM+i1NQFwha4OYQ0o
         TEAGyNdKUYy0aKZHrR0FojioEwh/sIGVQeSohbIa1UEbiaNwWURxH0NgzBZfPEnYiQp+
         WqaRp0M4vjPgiZsJnZdP18/cg6aZ2ioLIqmzV6SXWEFxvT8h8zUPBcYwC7uRIwVZBBjy
         LUgOaROwunamqFJcaYg0G8EQT1VunBPoo0JJtRZxVk1dorULblKGsmvEQfcThat/ZFRi
         4bAk8JhvGu4phxLXs2T+cE+Pk+k7sEzKZ0hbOEOkl4CBYagw1uJV2M9QATnq+V0B1yEM
         XsRg==
X-Forwarded-Encrypted: i=1; AJvYcCUBo7vcmCd0b8flzei7vxzUSlHoegSAEqjcke4bbhQ2hZNVc7r1faMR/uaVosbkLuWJ9euWwS1wzG4=@vger.kernel.org, AJvYcCVBFIg07YPQDaQ46SXYow2GBVG//6ZvZOwpXY+TVniwv9Bk7gAusZyEBlsPwHw7Uze+bPaouOjH5DdUsy46@vger.kernel.org, AJvYcCWSaSPxkThcVVIyii1sETNjoqgzOzhwgKyz1hTKwXyis46ZCAvj67uPOzv4ASXjjP2yZSFVu1Mb@vger.kernel.org
X-Gm-Message-State: AOJu0YwQnynutvPZMD2L3CSyoIR5ZA03QVvh80HaOJZHMzqpz2bdVcFU
	WbxpKd1K5+BUffyUj2HGMMIMfOrOLiUzjHAgWPB8BfWMLz/Lk/5UoLco7BuZ
X-Google-Smtp-Source: AGHT+IErYXwmvTXC4B/LlkFNOwelPHOAQu/z3+IlX6nrzedWsMDSREVMl7lNnuvijDNJL8RQ7rVv0A==
X-Received: by 2002:a05:600c:4e8b:b0:431:40ca:ce44 with SMTP id 5b1f17b1804b1-4319ad34a44mr140228715e9.30.1730330762889;
        Wed, 30 Oct 2024 16:26:02 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-fbf3-0656-23c1-5ba1.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:fbf3:656:23c1:5ba1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd947b2bsm35338395e9.25.2024.10.30.16.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 16:26:02 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 31 Oct 2024 00:25:56 +0100
Subject: [PATCH 1/2] clk: renesas: cpg-mssr: fix 'soc' node handling in
 cpg_mssr_reserved_init()
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241031-clk-renesas-cpg-mssr-cleanup-v1-1-628274ecbfcb@gmail.com>
References: <20241031-clk-renesas-cpg-mssr-cleanup-v1-0-628274ecbfcb@gmail.com>
In-Reply-To: <20241031-clk-renesas-cpg-mssr-cleanup-v1-0-628274ecbfcb@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730330758; l=1293;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=MCSmuEk4fzdFG0/fr1cFdVYK9Z+TAFWrcnZ1tpPDXpk=;
 b=dYQclrbQ6H4UBFuyauAWPvlbRxHC+/vw4xnNoQv4B1MEy3O5vAlEqNTAplUFFEYly85NckWtr
 eAkb1l8Zh8wDijCzGYKPBD99mT0KK+N/emSelbK/2tW9oNsrwhbd2wZ
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

A device_node reference obtained via of_find_node_by_path() requires
explicit calls to of_node_put() after it is no longer required to avoid
leaking the resource.

Add the missing calls to of_node_put(soc) in all execution paths when
'soc' is no longer required (one error path, and the success path).

Cc: stable@vger.kernel.org
Fixes: 6aa175476490 ("clk: renesas: cpg-mssr: Ignore all clocks assigned to non-Linux system")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 79e7a90c3b1b..5dc89b1009fe 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -1022,6 +1022,7 @@ static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
 
 			ids = krealloc_array(ids, (num + 1), sizeof(*ids), GFP_KERNEL);
 			if (!ids) {
+				of_node_put(soc);
 				of_node_put(it.node);
 				return -ENOMEM;
 			}
@@ -1036,6 +1037,7 @@ static int __init cpg_mssr_reserved_init(struct cpg_mssr_priv *priv,
 			num++;
 		}
 	}
+	of_node_put(soc);
 
 	priv->num_reserved_ids	= num;
 	priv->reserved_ids	= ids;

-- 
2.43.0


