Return-Path: <linux-renesas-soc+bounces-13040-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2FAA30930
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 11:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4B95164D48
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2025 10:56:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBED21F428C;
	Tue, 11 Feb 2025 10:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nz9uXY7U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2E11F193C;
	Tue, 11 Feb 2025 10:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739271374; cv=none; b=qY+/g29KDyMtyB9bw4o08oSfvRZpk/jfsQTMDOcqpowA99VI48oSuPjb5VuqZUR3j3snAjePVNmKHxTjATfv5VP/qWLY1G1y/OtCWH131a+5DY1SRNmLSalDl24rYH8CInqZsp996jXKN68yRjbEVlmDsHC8fvw+71ZO9OMDPJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739271374; c=relaxed/simple;
	bh=MVyYYd2aTgxVNuj8kiTBd1CgugjGUI9c7IeyRwPv6BU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KbF7GXJ5zgwk19vXa1AOHDeYzexGOFEaOsOAufhpt0eI6y0wdZoJAqFMxQb6Go2JQ0ruCGkcKqfUQ6PWkwDlgHLEvudSqmLW1j5wou1o9ZiEQeKZC2Lk/TVb82t1LQ8LhMorSQtKKvaHee6Fs49Gd6pkx75xLyuUvpJsBLKNTb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nz9uXY7U; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4395561ab71so3305585e9.2;
        Tue, 11 Feb 2025 02:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739271371; x=1739876171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l/1bfAPeKOcp27yVkDAZMo9Kn4FK6xHpWbCvzgxDm2k=;
        b=Nz9uXY7UMMrZLNVOdgxgnDbb4yfLv2/OkpsRrP1Uh7V99HuSugw38UoAetSi528DNJ
         nVhRH2b3+y1DSqp6+gfUhSO+laYabZP7a+ZXxydne855lQO/d9X3G1L284iJYeH7bUAD
         oFP7cWoXVVGqiN/nIQjOQ2mFLHgBoMiCboqz2JygZHHmEBWar/K9Fp/pgKjFRgbww/7e
         df+JRY/JfdWQ5mKoD032743Wh32VORZC3gJoZ168mLl3oOsD8ehDlWlJRtePoYgJFqV+
         KPkpYnl0wH0ouDe30dNwaChMOGRxajGonA5Mg+FZ6Xj2CmEpEk/UDNJ2kQDtPgxGBsni
         X6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739271371; x=1739876171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/1bfAPeKOcp27yVkDAZMo9Kn4FK6xHpWbCvzgxDm2k=;
        b=YRaaDdjeWQxZxoQEmXYURSnUZkvqsJr3n8xtXao5ZPNrdd32oZ6tlXJ64+YagzMiOx
         JDz7ExdbNdBf5IapwD/cd+qF+5VKX7qLFpLbozKPcmQIthje5/OE3LTyonOV1egD8IPn
         Sg5y+0TPYTRuuM15O4NOUpD+sn1Hdp2Lg5rkzJBVaZ7sDZw55OrjWWtJduBL6Dk9S2+d
         ZoaYYkG2mfc6N0nydzkBeD30f2gFz6AcNOKTBf3AftWwc5eTAvuZF143PPPAOm/meiJt
         Salw6d6558TWEcdcd+eEL77F9Ty2e4TVHl8JKVWe6TMn0SJ46fUHcAxxan3sTrtW+aqB
         3i3w==
X-Forwarded-Encrypted: i=1; AJvYcCUDeNfJwYqXks9n9xNqEvV29QuF5gw+eKUl94k6lhhSPFzX8phrhfAZyDuyhPsVhafvDSiqI5BEpKJkhZFg@vger.kernel.org, AJvYcCXf9HhAfppXln9WssL5+TfReiwFmFSWITKaXel7aBfg2YHcjTlGQJtNviON4/jW4XzLgY/eLKOa9YQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0YXzZaXjFsnEYrM3Fz/B7G+ErtHAlsVJ9BOmUEcA3tPgQPYaq
	W9uTPWzfvcES4rmV/rkRj643wQyTKDMAzYYxquwyEmqbI6iEo2cVGCHSGwP5
X-Gm-Gg: ASbGncuxRjuuiLqC8NMPh521FAWzZBEfXZXnl3oFT6o4sc+Ee/4OBRCgpJ2rNkRRyGB
	WyGgLP9cq7qoiyk790lLlsUu3uvLQW2moN/+LxjUsbds8UfmaLBz6iITY/n9h/HT61TVvaBsHi7
	wDCRTiLiUJjLnSH1MoGOJYO/Qcw8kqJyfnYhzzvj5vzjWYD3/coMqVE876CapOatkhZHsX6HE2O
	OoguB+r6RDF3k3sH/VVO1jWOgpJdoFesEncElS/ueJUw1nLxJyPApOqHTuZlNg03biLUNmT/8NF
	3fDlH4Y8P1C/fqgWC3Mu8BB/Df39dVygh8H8u583wOyc
X-Google-Smtp-Source: AGHT+IFZ4C9CNLj+h0P8uNwyUbeYIlOH1x64SjPkn8g/qz4Eo2W2Zbio9QsW+rsV6iHY4EBOfh8Mow==
X-Received: by 2002:a5d:6d83:0:b0:38d:e1ab:d785 with SMTP id ffacd0b85a97d-38de1abda3fmr5599086f8f.14.1739271371036;
        Tue, 11 Feb 2025 02:56:11 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:cfdc:8258:1d0b:42be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm64088655e9.40.2025.02.11.02.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 02:56:10 -0800 (PST)
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
Subject: [PATCH] clk: renesas: rzg2l-cpg: Update error message
Date: Tue, 11 Feb 2025 10:56:02 +0000
Message-ID: <20250211105603.195905-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Update the error message in `rzg2l_mod_clock_endisable()` to provide
clearer debugging information. Instead of printing only the register
address, include both the `CLK_ON_R(reg)` offset and the corresponding
`clk` name (`%pC`). This enhances readability and aids in debugging
clock enable failures.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 91928db411dc..a6b87cc66cbb 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1239,8 +1239,8 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 	error = readl_poll_timeout_atomic(priv->base + CLK_MON_R(reg), value,
 					  value & bitmask, 0, 10);
 	if (error)
-		dev_err(dev, "Failed to enable CLK_ON %p\n",
-			priv->base + CLK_ON_R(reg));
+		dev_err(dev, "Failed to enable CLK_ON 0x%x/%pC\n",
+			CLK_ON_R(reg), hw->clk);
 
 	return error;
 }
-- 
2.43.0


