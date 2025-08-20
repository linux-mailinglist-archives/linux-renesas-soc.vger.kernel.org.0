Return-Path: <linux-renesas-soc+bounces-20760-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 055BDB2DA52
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 12:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3FBC1766D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 10:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051892DEA9E;
	Wed, 20 Aug 2025 10:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="edcLM9Vh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E33C1C3F0C;
	Wed, 20 Aug 2025 10:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755686893; cv=none; b=eth/tLAV6webGbX649ZrZD/undCbokf5BC71dJkz7xCCRHTFJZdLdEGN9eNNo5hIdVB9cMlDSUhXGp0qJM7acKv6XBFfZIzIrPUrgu0HCvLVJ1d6677BlE1zCa2Vnx126sPcuvVKOXUxoMpcxmknKOidc6Hb/S2dQO0InV5pFf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755686893; c=relaxed/simple;
	bh=06I8wOWj8pTVQaz3NYobbvkRZcil7PTfs2i4Ioc5Ylw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oSfNye4dcg/B2HXjSrBmFPRlq+j/jQK0GBnUEys0wA8gZGaJufMxEGb+CGNEiaseDtAmK7NiydIYuoxtCD1iKVTMyXf1Wa/x8gk1TBmckkiLay/fuaDJZxSHKNSmvxEI/k0UWgFScIiJuBjVEE0VJGtxhu+XEqnErl2gEm2n4iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=edcLM9Vh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3b9e415a68fso5323706f8f.2;
        Wed, 20 Aug 2025 03:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755686891; x=1756291691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ugw0ULulvqBLjZz++Jmmr98N3KajcLtn1e5l/Fm8a8A=;
        b=edcLM9VhAMVm4EDMXyfHKQ9yyjYlcJ14E4AlAs3a/drbSl20dxtruhg7lHgSgyxqCH
         8f9ke3jATCyH8gRCkL9mShWyAZyYkkupBZs8cjQT7102Df4ZzhRbR4oDORO5uly4837k
         kUO+JxLBsgcyHgu01A7jQ0lXGC7dFbD6YZZc/kuPo4A7GLht8eWcXyg6mWx/dHGVVg9D
         VuK+TgILl+eJ8qxZj96gmUj83M8JqmxyN4wUXGz9um39x4QDikU8zWnQ6dVdOSOmdH04
         PDs5nk+uMHipyI0AteqPemnf1IlTA1wSE7fZ3coMFr8P3/F1iLhUaIrgeC2XEPWPkn48
         EKKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755686891; x=1756291691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugw0ULulvqBLjZz++Jmmr98N3KajcLtn1e5l/Fm8a8A=;
        b=k0aXxox1BEAHzMU2EjbuZbQAyU0mfHfHQjGdpKDA1yjL3kVicUbH1f2Q347P1nsHnx
         YjaQ9iMTf067i0h5mIq49RUm6lm2Iq2bl7yzDWOEtduD+i/+sLnr3TXPxzgqaBczPbI7
         VU2Xfd7/1zo2mMrjMNfejC6vXrzX3od+R+IHeCsNGgDyOjbL4wipHtQfEIUp6AYZ10Rr
         XS5uUeNuXWS3eammSdgWE5BNOzkXQv/7xJngs5Ph6MDS15Xb3/zbcdCOg4CjMtDZb/KM
         s7yvWBVLmKPIGH4AqxaVQptmWcPFAszeHL8Zb8U2yc+o6fAvgOmtblcvh377hN3OEKPz
         12tA==
X-Forwarded-Encrypted: i=1; AJvYcCUG30F924qsXvC+ThmZcIS7vWG29KU3uAnFgU4+YqkXVCKcE57a7PJY97Gue7fHeBHHaRDihxKhlqjT@vger.kernel.org, AJvYcCWLpwufQIM9B3MyBUtAIl6LzufQGeR6sTWXSzbszL1kVb8hrMZouNd54/gC4yEyxrziMhBb+nALx0OObHJtcLr5yro=@vger.kernel.org, AJvYcCX4v4IG77Xg7N902HOVPh9xYiL7klShEykTOEyp55YvZCK0bL0EmjNzD1FarWZ9HwzbehkYMSqRCZuhMUw=@vger.kernel.org
X-Gm-Message-State: AOJu0YylF7rG1OPDKG5L1bPDUSzQpX25KsdCEz0UWJgTlDXuQtaqxeIq
	HfTl5WIvOcenIhR0qb1V4vLMaJr9ZuG8r2zEA8vJyA3PjVdsWheCMSiUVyqJ2w==
X-Gm-Gg: ASbGncuBWp0cp4d0stty0Bdwe8inf8K1KhkeAyjbRgxe1AsWMAQZ9xZSbzMfaRN8GzV
	ZpglDLrOLt+Oo8oZgQtFhNVJMqpBVEl8h9evK7aTmsIKAwhH0MQbB/9XpzpQK2A+fhbaGmjbHS1
	iG4vcsQcb+s2dv++mSjtDJeG0u8UopGF7LUlvHY6pgAvzLu6lOK2X2xudAVEAbqzmzjEQ7SN0TQ
	7HVNEIDJD6YWPXf+9t12L7BtE4IGU/VhpuGB9lSTse3LvwwIRA9VHhqgAVClnuRBN6DToz54VaY
	bKVttV/fGUNI8IBUKJ0pW3aIWO1Z+roBylviblVjoRXGwbWrqULJkw+7FavfgfjK0C/Pf4ObB7u
	pzJ8MkuQ2nF8uQuyHAW0gKXv2AR/9o6ljz83mmunVCgTGadrGw22P85/FZtVM6KgreGsTjkbyEA
	==
X-Google-Smtp-Source: AGHT+IGfGsZyk96binRgObBnTsy8mAeeaClDaows7q5RSfNe0Rh2yEOdGptLJk4ECILMrHl9VE6Pcg==
X-Received: by 2002:a05:6000:2011:b0:3b7:9c79:3293 with SMTP id ffacd0b85a97d-3c32eccde31mr1790353f8f.58.1755686890519;
        Wed, 20 Aug 2025 03:48:10 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b47c431c4sm26854275e9.11.2025.08.20.03.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 03:48:10 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] mmc: host: renesas_sdhi: Replace magic number '0xff' in renesas_sdhi_set_clock()
Date: Wed, 20 Aug 2025 11:48:01 +0100
Message-ID: <20250820104808.94562-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Replace the magic number '0xff' with CLK_CTL_DIV_MASK macro for finding
actual clock in renesas_sdhi_set_clock().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/mmc/host/renesas_sdhi_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index a41291a28e9b..f56fa2cd208d 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -223,7 +223,7 @@ static void renesas_sdhi_set_clock(struct tmio_mmc_host *host,
 	}
 
 	clock = clk & CLK_CTL_DIV_MASK;
-	if (clock != 0xff)
+	if (clock != CLK_CTL_DIV_MASK)
 		host->mmc->actual_clock /= (1 << (ffs(clock) + 1));
 
 	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, clock);
-- 
2.43.0


