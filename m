Return-Path: <linux-renesas-soc+bounces-24996-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 27017C7AC33
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 17:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4EE3A4E8FCF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 16:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74CF6352F9D;
	Fri, 21 Nov 2025 16:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AYpu23TB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D5733A6E9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 16:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763741344; cv=none; b=VK/oBf8gx6Hi6pF4NgynXhKddeseJX8x0tBnX0nMOORp+s4k889fzFZShBan0ULTKEN1W91nWCOTsDWcFTKxTJZZkzgqiBuei6LgdEfwDCBvZ3LFX1bu4Sn+g/mLkCMnuZuUwdFBLbdmwfV6mL3Tcgu2ypyi6m0511TB/cnuFHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763741344; c=relaxed/simple;
	bh=A0Ss2FjsUCOJF7j5tDObMG5r/Eb7H5jpKMO+13IpeQk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AjSags1vwMmIHi5meM0rg7xXwtFQ0kpuN0MQkwA5tcNFCVcj4q1yn+y3hGYURPoShbCIF02aAihr2W7Y5RqdsEeXkeet2GGGxKzPEYt+9iQLQM+L+cHYmE/rewxjJhcKTy0diKgnmD5G54n+sswhQ1zGCFuMrAjRC2pqKMzKdlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AYpu23TB; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so21137865e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 08:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763741335; x=1764346135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+pSoQWtQTSE8J9RasiAG9yE97LqZssvT14IYVKYS4U=;
        b=AYpu23TBKaPJd29lbkS1a9JJuK5I8bnYNrXI2ApB/yny1Xs0V2qVEY8V/SM44oJ587
         WC/ckuwblsPR5bKbDZff1Q6c275DDF8BhjQ2+K2VN3vjYgfMLF4fs9+2MG0ZxzwKy05C
         6x5AEZTjqd15bGCSWtgTF5BJZ9PsBP0Csy+YW3KpivzZdDzKGBPfrH8uxQ9/bv+et66E
         av4sRdft1bO35ERXs5AUd8GSxRQr3Si2Gf+N09NfdHwbfDB6brLZE9AicKpN8djJWxwN
         RaI8Vce5afxrU/tdKjb3XoOkwpYu5beKiDX7cltcmvvzD7X9g4fvyjzUXzPz/2dJCWV7
         LbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763741335; x=1764346135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m+pSoQWtQTSE8J9RasiAG9yE97LqZssvT14IYVKYS4U=;
        b=dur5XeTxBd2dKPYEWbeAiplZAU9ZnyJTWaPOi+lARITUqTUvPmfkm1tFKcr3K2wjDZ
         gzHA2BEZwYWT4Nb+y1KgoK4C1Z8TwzMqnCtcwapBB0GietaFi7uoC0Z2D5EfjjlCZqRF
         218Jhf/tQeVE9pAPPEpvQRQ7GEe7iRgBNaKfq72j726i/dolDKR6Tw58I5kg5veJdReR
         ZxaC4IoncdDsZW49QzxyH3qiCecRxgjkpg1Fu0mq8wkZnveRbpI98HDT2JpUPFQoelJG
         WE734jCLP1kw1+/lTRBXRvxHQJFMNZ9peKz8cG8aFPjsGqAYseNIT9as7K7I2qcrabql
         Cflw==
X-Forwarded-Encrypted: i=1; AJvYcCXUvcZZfxw0n0Z/La0WT6zeGikmiGxYSx7O/KSM2DsBx5BYqaVI8nTBQsBeXMpMCl2sAEL3ktTHTkXUZPzXNrAGxg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzC4qUmjWK3OrDrL0yulLp9tiIQlFcrKWnSnXtIUvV2HqBKSHUd
	sTJd/TODFHNu0QFirQTbpJvlo/5zHorAhw+z23jkCp3n88xqYnnzEQ4/
X-Gm-Gg: ASbGncuUh2jiUPAMlWG9hE5V5vKs6nSwFCEnz9yeOKmkT3QRlwTt0r+jXlUyzHGV8LD
	aCAq41jEM1z8Ro2FkdBveRchIZlk7QAwHF0qkNW9J9bFVhv5hVKy/KL9ibqWg3GMX1DplG0H1vv
	nGoCzsv3P5tWrRpqrdC8JkOFco3/LbylNWJwltah1T4SDI+15+h0877V4IO8/P1sqdoqt26bPnd
	mQ0UdVjwG38/CPd3fhDvKqCxe3htSN4QIpCdlQO5oy+l9kYe2EuGgBAA2XDaLDRcet/LyukYZTV
	TbWlpy93rSHJt4PGJJYffDEAD0SIm43Jmyp3Fwm1SQ743V0I2Tlh+n9IZ+zZB9UsN8zoJFsb/nZ
	fAG/W3FTCQmuJqR1Ir4B8sFoQ4Lgypiae3xElSGsRGra+WzWHN492pGHb1gV5MPu1qZV9sk4ZOi
	1OPIUz43tSxxy5+/gxUwohoolWDv4asgYe1ZbZOQg6a6ZjTIPfOcGmHN7TSkYWYcGI+KWejkc=
X-Google-Smtp-Source: AGHT+IF2b7f+ZBHK25E9+K489GOtqsYf7pKr0K3jFgK2oZkdroqRS+XqRE/MrqLwRM3wLWl2YED7xA==
X-Received: by 2002:a05:600c:4746:b0:477:9eb8:97d2 with SMTP id 5b1f17b1804b1-477c017d7e8mr26152805e9.8.1763741335414;
        Fri, 21 Nov 2025 08:08:55 -0800 (PST)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm89496195e9.8.2025.11.21.08.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 08:08:55 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [DO NOT APPLY PATCH v8 15/15] tools: poeg: Add support for handling GPT output request disable
Date: Fri, 21 Nov 2025 16:08:22 +0000
Message-ID: <20251121160842.371922-16-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
References: <20251121160842.371922-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add support for handling GPT output request disable. When GPT
detects output disable condition, it request POEG and POEG
triggers an interrupt after disabling the output. the clearing
of interrupt happens in GPT. Add support for handling this in
userspace, when POEG triggers interrupt, it sends an event to
user space and user space send clear command to clear the gpt
request for output disable.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 tools/poeg/poeg_app.c | 57 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 47 insertions(+), 10 deletions(-)

diff --git a/tools/poeg/poeg_app.c b/tools/poeg/poeg_app.c
index 4ff8e5c007dc..71f130d5aad2 100644
--- a/tools/poeg/poeg_app.c
+++ b/tools/poeg/poeg_app.c
@@ -20,9 +20,11 @@
 
 int main(int argc, char *argv[])
 {
+	struct poeg_event event_data;
 	struct poeg_cmd cmd;
 	unsigned int val;
 	long cmd_val;
+	int ret, fd;
 	char *p;
 	int i;
 
@@ -36,17 +38,52 @@ int main(int argc, char *argv[])
 	else
 		printf("[POEG]open\n");
 
-	cmd.val = cmd_val;
-	cmd.channel = 4;
-	if (cmd.val == RZG2L_POEG_OUTPUT_DISABLE_USR_ENABLE_CMD)
-		printf("[POEG] user control pin output disable enabled\n");
-	else
-		printf("[POEG] user control pin output disable disabled\n");
+	if (cmd_val == RZG2L_POEG_OUTPUT_DISABLE_USR_ENABLE_CMD ||
+	    cmd_val == RZG2L_POEG_OUTPUT_DISABLE_USR_DISABLE_CMD) {
+		if (cmd_val == RZG2L_POEG_OUTPUT_DISABLE_USR_ENABLE_CMD)
+			printf("[POEG] user control pin output disable enabled\n");
+		else
+			printf("[POEG] user control pin output disable disabled\n");
+
+		cmd.val = cmd_val;
+		cmd.channel = 4;
+		ret = write(fd, &cmd, sizeof(cmd));
+		if (ret == -1) {
+			perror("Failed to write cmd data");
+			return 1;
+		}
+	} else {
+		printf("[POEG] GPT control configure IRQ\n");
+		cmd.val = RZG2L_POEG_GPT_CFG_IRQ_CMD;
+		cmd.channel = 4;
+		ret = write(fd, &cmd, sizeof(cmd));
+		if (ret == -1) {
+			perror("Failed to write cmd data");
+			return 1;
+		}
+
+		for (;;) {
+			ret = read(fd, &event_data, sizeof(event_data));
+			if (ret == -1) {
+				perror("Failed to read event data");
+				return 1;
+			}
 
-	ret = write(fd, &cmd, sizeof(cmd));
-	if (ret == -1) {
-		perror("Failed to write cmd data");
-		return 1;
+			val = event_data.gpt_disable_irq_status;
+			if (val) {
+				/* emulate fault clearing condition by adding delay */
+				sleep(2);
+				for (i = 0; i < 8; i++) {
+					if (val & 7) {
+						printf("gpt ch:%u, irq=%x\n", i, val & 7);
+						cmd.val = RZG2L_POEG_GPT_FAULT_CLR_CMD;
+						cmd.channel = 4;
+						ret = write(fd, &cmd, sizeof(cmd));
+					}
+					val >>= 3;
+				}
+			}
+		}
 	}
 
 	if (close(fd) != 0)
-- 
2.43.0


