Return-Path: <linux-renesas-soc+bounces-11781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 522E29FFDD1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 19:19:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 283EE161E2F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jan 2025 18:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35891B4F04;
	Thu,  2 Jan 2025 18:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d4Z0lrPe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3598C1B4242;
	Thu,  2 Jan 2025 18:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735841937; cv=none; b=pvt03nYy/7YWBEc1XyqTHKgx/I9dIrCiFAskrCvNtYE5owls5huM6soZAoe+/ZgDfU7Tk3Fw/qvGdwBK0D/RvNxKAiZoU5O7K26vSsuNuWWPpCuRsYaICNUGHWzozDFKv0xDFrEojl8J+dTNbncWcTe9Ax868CY/iDPN0njtUwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735841937; c=relaxed/simple;
	bh=YWBalBfbLw05CwNO1Yu3YVQXfFIypEpMG6x9yovyN9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m+NfMbYDWgVH0VvtihzhZNSDO/cj3cm0JQi88k/ZWVEviy4ybuhiAF0wyCozaHUItQdzq4mRLF1qapTEzjGpo+r+0ET+wzvJXMntwjuzjh/lcNWmycGVXdzPUIcnED1B/mqdh7hdRFLpIoD5zRr5am9L0xCkCI4OmzLU8unsk80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d4Z0lrPe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4363ae65100so120662625e9.0;
        Thu, 02 Jan 2025 10:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735841934; x=1736446734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TML8pafkEldphvG9BXvPyEHI6XceyFa9xZsDrKzfCdc=;
        b=d4Z0lrPeR/iaqfPRCn//qL3P30WAZFCrRHCI0Vj/hQBBN015W3EpSPFDF3MBlif7ss
         h8/kkAXq+vOpXM2SXbnpk9wMvWLXR2zRSeQ5JjrEalzlt30KvoVmnL82AdIoFNGH8THl
         vkTYea5uJ9twmz5M/6hwO+yaqDzAo+6iANYQ8QhWZz2RPcdk1FiC+vMLVzKr87nGiKWx
         3Jhfge+wxD4RZCISbNYo1yWr+nJjcAZNZbBnKCRsmmtqUprmpDVUoimMumxlyAjvOe0/
         8eToAc+OdgJ4RIhz5VKXK6Nj1PfuzVLPxUi/kWFe83Xz6gZA+q+fVHeJGDkAPWsN9VOP
         zdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735841934; x=1736446734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TML8pafkEldphvG9BXvPyEHI6XceyFa9xZsDrKzfCdc=;
        b=d63YL+loR74YYNDT2BS2xMEUA5Ntk/s7FQsCm/QAyGJwAxFn+g3bQDv1E73c2Zkw+v
         59I07zX5W6lusunXsXWcuNqE1AtZSSTdxy8yDHrM2dxD51UZXI+7PQfIpjvZdLYJ7hoV
         YDfmLb1NRrEOON3ORQ2ys4oE97q0mwx60ja6RvZAhmx7ktGGVSkbGqITrVcOxjoKiKbB
         Rwyqr84wjNEvIMOmZVujniXdkobScEb7ECcUVBgowaFZYwkFHOcoC3F7TVaz3eMpkFH+
         dzE4Wbz1bM03O2csUCUMmKPP+HW139FAI6odzZ56AmAy/BRKRgqTJPKvhsO4DPshQleL
         bepA==
X-Forwarded-Encrypted: i=1; AJvYcCWc5XTIvQ34vnyafHk5nK+YkOtPBKTfhaKohD0TN8K3okkcY+qGq9+y/gxHnwg2w5XE37m4q/CVOOdoQSMy@vger.kernel.org, AJvYcCWoGsvByDd337ftNFMRNUA3c/Qm1esaJtG0Zvae+uY5wupSSUGeOVR9x/tkivHJQakGeQKnk8IT12U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2HBgcALgGFt+xJ2CEkGQZsS08GhmEdh8C4fq7nQW+PBrDnoR0
	1AIbyyEM0aGYzp8y5v83O7mTgPwCX5l7PkllPDkVGoon18i+QoDn
X-Gm-Gg: ASbGncta2+m+E0zzcHrQocQ9ulcHjumAcUIo3OwbUuhTNVQ/xNKTqRpfdQBd3u2HMth
	ymmtMmgXglybCbpo5f+78jPmjlVjCPXr+/JjuUoMuKhFNmR9FBPrsZX8aqZ1FigmxAzlSCTSCpm
	Px7A+wwfiAOSsIeKmBCHE9f2OR8RUt17xnz1EVrCY4GhQnn8MALLG1RiBMvr5jApNCGPCIsCmcL
	IQjcXfD9bFXJcqtWa93hZzjBUqddnj0F8j7eEZ9/Wr2AZOwiuXR1BEOAeqxx3WHxB1n+jYON953
	bH7ueyyrig==
X-Google-Smtp-Source: AGHT+IHYPHGwvX2Cyf3fV8kygAWfC0zV+G6bMCi/dII6Oj6ZIRRLxZzNO0VpytKFwEuYYYaFGlvJqg==
X-Received: by 2002:a05:600c:198c:b0:431:542d:2599 with SMTP id 5b1f17b1804b1-43668a3a3cfmr385115105e9.22.1735841932906;
        Thu, 02 Jan 2025 10:18:52 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:84e9:7adb:b646:c9c0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656af6cbbsm493291925e9.3.2025.01.02.10.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 10:18:52 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 5/6] clk: renesas: r9a09g057: Add reset entry for SYS
Date: Thu,  2 Jan 2025 18:18:38 +0000
Message-ID: <20250102181839.352599-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250102181839.352599-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add the missing reset entry for the `SYS` module in the clock driver. The
corresponding core clock entry for `SYS` is already present.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
- Included RB tag from Geert

v1->v2
- None
---
 drivers/clk/renesas/r9a09g057-cpg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
index a45b4020996b..7ef681dfcba5 100644
--- a/drivers/clk/renesas/r9a09g057-cpg.c
+++ b/drivers/clk/renesas/r9a09g057-cpg.c
@@ -220,6 +220,7 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
 };
 
 static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
+	DEF_RST(3, 0, 1, 1),		/* SYS_0_PRESETN */
 	DEF_RST(3, 6, 1, 7),		/* ICU_0_PRESETN_I */
 	DEF_RST(6, 13, 2, 30),		/* GTM_0_PRESETZ */
 	DEF_RST(6, 14, 2, 31),		/* GTM_1_PRESETZ */
-- 
2.43.0


