Return-Path: <linux-renesas-soc+bounces-15033-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93613A7511F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 21:01:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55F287A7B4D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Mar 2025 20:00:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489271EB5E6;
	Fri, 28 Mar 2025 20:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DdwOutjC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812201E5B8A;
	Fri, 28 Mar 2025 20:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192089; cv=none; b=J9HWfkjWATNiAOvKsJ8Q6iAh+TD3axX10fDpYC3XmMpr+XapfBywTT6lfwe9cuYF+0xu5WagAj0Y7uMCcXZrriZ0Z87xO3Y3IFeNdWnqyTMk9oJkkwvM8Bvzp7r0LgLOYa3+DLhdsOVWpC585sipak6HP0TrzXLQcxpP7Ef0/8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192089; c=relaxed/simple;
	bh=EOt9wuuZK6W8vqCix7SORy9aWHy2qg1evhD52MrTK+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dI6Qk4/UCAEpmPoDDYX3XosSw2hDUZR16NT5aUyrLiup8JrXdRFqSsziLOeDOl+M19LYz3AMer3Yy4JBAoCZ1PWRvP3uPLST0iGKXkFt/B9TBkVLSwnm1oGs665O0guhgHNJebdHPosh8o6xFaWnnSfLVT6lDZ/co7K97vBpG58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DdwOutjC; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso26228625e9.0;
        Fri, 28 Mar 2025 13:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743192086; x=1743796886; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=83yLDflhQJMa0Il0PHNLhFSDSzsmuN8I1PiBktowvoY=;
        b=DdwOutjCNiAaW/SK62m/kODyO+2onuXPr7Yxr7+TwWUV2IlGEVGTTUgtLYID6AfufS
         HqVFSaeYvEFeWdHQgeDMKiHAqsiSbmtIvh8pBYML9FWccpZsC2zgyArbSLWxYyuuWdol
         C2NWkHuNgz/wBtyQ7Za8ealOooLGJyS83sH4dC3kRD52Oscq15K7rMEjDYQALejQrKIk
         6NIq0sYFwfNTTYDVPLtAfKjO/Zb5BJbpMsXkAMIfxl1zc04LX5+BKxjePztTCKYBboTI
         /lFAPM3lajfuuEIngsxVJbmCCqaGtpAD3yh+hYWkQTMZGWMSPwhk02o3ozKfS292HavR
         JKmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743192086; x=1743796886;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=83yLDflhQJMa0Il0PHNLhFSDSzsmuN8I1PiBktowvoY=;
        b=M0rc6lUuDB3+V+dsQII7UuaoABFOMpkQZbtO6JGVK4jJfwAdRaGIsEcGE0QSnDYpbs
         KfIvdYf2eL3x/8nBumRsZlqxVXhkJvb8llGh6T7PUhzwfW7gjtQurJWembYbSPYK19LR
         pRemjwuVO0R0y9JZH2X0ObEBRlRTqlLGk7g+Y76aTLazX8DL0+c6t5f93Fah9JnIVGi4
         NlafhACzvqPdS5DYjIhYQrcs9OqxaK/XtIcBDGza0o39ezoEL9NqgwptN1XHEPRE9BQ7
         y2kyOBLNTOyuyK2L0FKDlBpN2s6rK3sm3Qs2enL626qbZyrdWuvIj3NRFjHLgqrcHTVf
         2f9g==
X-Forwarded-Encrypted: i=1; AJvYcCV6SSJvAYUZ/QfEbOo49nf8KFWi3HGD7H5IlvZNsuHydA3kk37xY8ZrFG2ijBPJaDhzQ5eORDxccBHhGeaT@vger.kernel.org, AJvYcCVjb9gv8VhAOq9fF+ovNcJiVHxgtZjZcBlTNX9itEZiKEqH5qKBre49qUAKvp7chTKmtBPSA1TsUNwR@vger.kernel.org, AJvYcCVuOm8G61I6RZ9QnyzpWs5SMCGm5GBInMj7sFOY/uJpHnmquaJ2Ovoye47RXkS9jwDXgpQjoGmSDHAs@vger.kernel.org
X-Gm-Message-State: AOJu0YyhFs+HED5evMgfnvtyvQJtvZNcTEK8HLHIlauToB097gAbZM5b
	aERz931yy6skpooQUMbbq9Y1jv+0YaSXLyfylDXF1fdha8M7Pwcs
X-Gm-Gg: ASbGncvENBbCYdgjiJs2MgxXGuGwBNlyd+XylLwq0RXDRG7gtwbT0NzfvMJlq6V4dW3
	/6DK/AdepEQOU/L1Hj33QZpcxD8w5r1IrmSflPRY3HI79/WqaUBndXuGx6jXB6qoIlVh3+pCmea
	G9me+SdINxXmL+PjCxQGnKKeMEU/4rLWpkOS+9/vNXXj94UwdiX+lhQ6onj/MhfYum0OI3UuBDR
	jFCh8aSItENEhnObKWFUBqT9a8OXnd8qTxS0kEvhCJ7ni5V5bmYRa8xmb2HBA7m6hUOXIS+Tooc
	+vk3zVec1zwKsA+MTzk7kJ6m+kqgg37+Fd2HWq+eFCYQFOuamJnSRqIsJU3T6QvObs4=
X-Google-Smtp-Source: AGHT+IGdvWPjGRRZkpllB0l9l5LllyjpxfzuTntQJdvxYuJ6vO1cowSkPSZcoIxKQkmtIviomxCRYA==
X-Received: by 2002:a05:600c:3b9d:b0:43c:ebc4:36a5 with SMTP id 5b1f17b1804b1-43db6222078mr7385835e9.7.1743192085314;
        Fri, 28 Mar 2025 13:01:25 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:b400:d08:873:badd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d8fcceaaasm37930955e9.18.2025.03.28.13.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 13:01:24 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 2/6] clk: renesas: rzv2h-cpg: Use both CLK_ON and CLK_MON bits for clock state validation
Date: Fri, 28 Mar 2025 20:01:01 +0000
Message-ID: <20250328200105.176129-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250328200105.176129-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the clock enable/disable logic to follow the latest hardware
manual's guidelines, ensuring that both CLK_ON and CLK_MON bits are used to
confirm the clock state.

According to the manual, enabling a clock requires setting the CPG_CLK_ON
bit and verifying the clock has started using the CPG_CLK_MON bit.
Similarly, disabling a clock requires clearing the CPG_CLK_ON bit and
confirming the clock has stopped via the CPG_CLK_MON bit.

Modify `rzv2h_mod_clock_is_enabled()` to check CLK_MON first and then
validate CLK_ON for a more accurate clock status evaluation.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzv2h-cpg.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index 817a39a8b852..dec97f731e3a 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -576,11 +576,14 @@ static int rzv2h_mod_clock_is_enabled(struct clk_hw *hw)
 	if (clock->mon_index >= 0) {
 		offset = GET_CLK_MON_OFFSET(clock->mon_index);
 		bitmask = BIT(clock->mon_bit);
-	} else {
-		offset = GET_CLK_ON_OFFSET(clock->on_index);
-		bitmask = BIT(clock->on_bit);
+
+		if (!(readl(priv->base + offset) & bitmask))
+			return 0;
 	}
 
+	offset = GET_CLK_ON_OFFSET(clock->on_index);
+	bitmask = BIT(clock->on_bit);
+
 	return readl(priv->base + offset) & bitmask;
 }
 
-- 
2.49.0


