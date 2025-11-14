Return-Path: <linux-renesas-soc+bounces-24664-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB49C5DE71
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 16:35:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 46A2350356C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Nov 2025 15:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDF632C958;
	Fri, 14 Nov 2025 14:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjdxNwwy"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9EB32C954
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 14:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763132173; cv=none; b=qZjXOx7JcIz6lHfIKqpIfUG6M+3Lh54wcnXEpq99kyLp1dlCLMh+ryn2JTryN3oL3yfVzxukXhmGoPz9Gjp7/vU5i+qNmSB5N9/qlbfSY/wR7wCaC37QxPqpJ55fairQVVI3/JkJ7hKaO9EbnahPO2IYDtBcGz3cHVzCQRhqJiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763132173; c=relaxed/simple;
	bh=nhXoDjA1PWTMn6uiehqF3ffeV5CNc4kbk1M8EgQv+DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kSCm+lC+eyKxgUpaqjIuFf6rlNtJZK2gNwZ6+7aLGo+0Feb8z9HFcX76SBBlXJxb8o+Ao0ArLRcdKLvafSSKxapFwbZjlxJisW8FG+R0lG8+j/g9cBrYPBwB05u4uy/+ekHdZb7YAttNAOZmSn2YR+DpHuSASS73CiISuTymopo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fjdxNwwy; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47118259fd8so16041125e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Nov 2025 06:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763132170; x=1763736970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WiVLm9glz9q/D2Y2GvnPtcV9YqAxrkU1bdmECATlQW4=;
        b=fjdxNwwy5XkzQ4nDATT1xxVdJWrOJWuLJUT5g2lx5qwLHHb02DdejrtfS7QJacKGRl
         T+HGwCakMQHCYnpLx6DhVxYkz3EwrsV95+YbAYat0ucJfDBFLIXX2FIGxsMtyNUoFCCu
         DjDZ/RoHvwKn006fWE6Jqhrs5DU6sboF8Z+f1uSOxs6tLtho8vCZ1DfEd1An1DZ9s7GY
         iMD6LT57JYKstTmZfINDdqZ9xxxol/MBVMF+IDkrxB6OkovouD7fooeFBQqgMonVyekt
         B4jXR3CdoQaZ18YWWmeGCqHtY5pCOLoAo6F/qJSXXfWh/EpPfFuYrnl2P8iwdNeWUrHT
         Fj8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763132170; x=1763736970;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiVLm9glz9q/D2Y2GvnPtcV9YqAxrkU1bdmECATlQW4=;
        b=kn3oA6diinf/LxyPAuEeNMXcyoLtM/hDYKFSeFtugT7mBD3dj86mAZQx4Eh+CFrMhD
         UCHDXzjfO1mAgczmZgAAtjbkGP1o4ncbVRnNS+3Fbxe+kFychKk3oWzAT2dDH51Wc6ES
         YTaW689w7/YG7bJoRp0D3yqtzOF3QlTJHzKlsTuH2/kWc7NpEA7vZnStDYapI15mQlPX
         o2AFpzeZbl2MRCwYBeeA3DJ1ebnT+rxXxiiRMgtu1gKx8lU2QzIM1A05n97NUwk8Yzxs
         meSkeXhFAf1kObuCKGnuluqbWh0+YfGLurceg5/kef/oqu2S9f8f5DIwWsm/9nQwDOAW
         izPg==
X-Forwarded-Encrypted: i=1; AJvYcCXytW7xSy2AOUu6uB1sf6czuf7AYwj6nG/z05zSd2XyvHD5GA2jyQ7+pup6G35IXRec0jvimBiOhA1aOpteGffc9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq8Ow6EdjjVdF/mmWb3jDTWJU6ewnfwnmDh8bc3GuKtw0gSTc2
	l6C3+GULexk5MWVP5c0efSr5aCHevLriZScplIE/MxtHfznGptSlyMSh
X-Gm-Gg: ASbGncsQ34kpwBfQn/nwaZkkG6DjeeJQgZv80EUmMWFbPFkmVe+M4VNeRSSb6vamfTM
	spUz5o+K89/+9/jspmsNq/jUE8csUimFay9/g+fhbVtSDvsXFxJ8swehr22iGuXHc1hvP200R8w
	VA3E1m2bXBWxvY2uKmf9/UAO8WMz7nYMMScKuDh6dMZzxcPiNmHiVu2dfmoni90XSQl9cvuRY2K
	2meMKWZkhzyfgp5mqQVGoaHoEkPsbxniuxuFV+Qdu270TnKY10Ro2+iMERftpmCX9q24vVsdBax
	WtnBZw1BImz3YMlG8cY5pFayunrFGaXyXpQxb/EGYuC7A4uIuN74ybhVs+oF8NiwiaP0aDlojNm
	S5/jUpntzyJET1gloN1ab2t60ZgOQVOm0kQ4f0s6o699ngD0jsSgMsyxHJVCH7THPnzCOLjNPCh
	2kHXkNcMrjMsqmTHTzAOWoK7LGkGalY9sQtMFrlsPMSf2nl620vkm4loLprWL+hgh3kb6Kn8/sC
	hi3tVnKfin3vNQu
X-Google-Smtp-Source: AGHT+IFzsL9fkHuLUlOZ0H7+bcguyZLzKvaRulLdHVAWsB/gVcOA7RfTg5kpkh6+zj/vIpjFoqRACQ==
X-Received: by 2002:a05:600c:1387:b0:477:7b30:a6fc with SMTP id 5b1f17b1804b1-4778feb13femr39245125e9.30.1763132169611;
        Fri, 14 Nov 2025 06:56:09 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778bd27e97sm47073115e9.7.2025.11.14.06.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:56:09 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	stable@kernel.org
Subject: [PATCH v4] pwm: rzg2l-gpt: Reinitialize the cache value in rzg2l_gpt_disable()
Date: Fri, 14 Nov 2025 14:56:01 +0000
Message-ID: <20251114145606.200948-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The rzg2l_gpt_config() test the rzg2l_gpt->period_tick variable. This
check is not valid, if enabling of a channel happens after disabling all
the channels as it test against the cached value. Therefore, reinitialize
the variable rzg2l_gpt->period_tick to 0 in rzg2l_gpt_disable(), when
all the logical channels of a hardware channel is disabled.

Cc: stable@kernel.org
Fixes: 061f087f5d0b ("pwm: Add support for RZ/G2L GPT")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Split the patch as separate from [1] for easy merging.
 * Updated commit description
 * Added comments about the fix in rzg2l_gpt_disable()
v3:
 * New patch

[1] https://lore.kernel.org/all/20250915163637.3572-1-biju.das.jz@bp.renesas.com/#t
---
 drivers/pwm/pwm-rzg2l-gpt.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-rzg2l-gpt.c b/drivers/pwm/pwm-rzg2l-gpt.c
index 360c8bf3b190..ab91bfd7da48 100644
--- a/drivers/pwm/pwm-rzg2l-gpt.c
+++ b/drivers/pwm/pwm-rzg2l-gpt.c
@@ -190,8 +190,17 @@ static void rzg2l_gpt_disable(struct rzg2l_gpt_chip *rzg2l_gpt,
 	/* Stop count, Output low on GTIOCx pin when counting stops */
 	rzg2l_gpt->channel_enable_count[ch]--;
 
-	if (!rzg2l_gpt->channel_enable_count[ch])
+	if (!rzg2l_gpt->channel_enable_count[ch]) {
 		rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTCR(ch), RZG2L_GTCR_CST, 0);
+		/*
+		 * The rzg2l_gpt_config() test the rzg2l_gpt->period_tick
+		 * variable. This check is not valid, if enabling of a channel
+		 * happens after disabling all the channels as it test against
+		 * the cached value. Therefore, reinitialize the variable
+		 * rzg2l_gpt->period_tick to 0.
+		 */
+		rzg2l_gpt->period_ticks[ch] = 0;
+	}
 
 	/* Disable pin output */
 	rzg2l_gpt_modify(rzg2l_gpt, RZG2L_GTIOR(ch), RZG2L_GTIOR_OxE(sub_ch), 0);
-- 
2.43.0


