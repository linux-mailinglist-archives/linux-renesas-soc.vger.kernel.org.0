Return-Path: <linux-renesas-soc+bounces-21806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B573DB54A44
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 12:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C8EB1D609C9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Sep 2025 10:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B2BF2FF144;
	Fri, 12 Sep 2025 10:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kadm2p5q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B54F2FE073
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 10:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757674063; cv=none; b=jsplskG9vxrKybdiGyNvscjQQviXa8JCaUVssmsYw4Y2qaAGXcP4aPO6SXcM5GfzBcv0zctMJfLLMRQXcgnNkVZ8ciy60u/PbshcQJdAsQ8jPkJidrD3xVOgJwptKiShrfGcnWxdUYZs6MT8lVmVVU88a/w11KPm7V8Eb+ar7WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757674063; c=relaxed/simple;
	bh=OlTOFvKJfT0A22fcOpYTqFab8+1TW6hkZGEds47Z0Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X0z8SV4knIflV00QNtR+j2YD+k5930lAp/Du3wfvL4kDUAHQFtoxBO72MuaJTOIqvbn/nHQi3Bt2Sm9gtxkq1m0/76DPNPPoI39eDFZjL6Zv35/3CfG1HTbsLJlEYWkM8auY7mvLmLOaHP9IIma2A5OZGUP8HpjM9um4N8jkTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kadm2p5q; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3e751508f21so1255787f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Sep 2025 03:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757674058; x=1758278858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdCzNJXdDljgG/kIDC0Ddrqtrlk8v9FUTdWx7KN6R8Q=;
        b=Kadm2p5qfS0acoZk72bNm8J+JOBxE0R7+Bcvs9FG+tbZ016dTIwAQbeZsQiS8xyFgV
         h1Q/jxI+fttRzVRwEwfKHST94fTXOVO8W98tq8ib57K4uuQ8NQLrggbskG3VtHJOON7O
         vK6hCJdRK686mqtvISA7x4c7lEUtYUBcThvGT/W8QZS45iTTqXjx9QHrdIMnWAuMDu/z
         VQgToeWaKvG7w+e6x3JzklivpTYbuXDzvfMS/uoMyskOt4FJ+PncHV3U1GTmbtGOU0s0
         6pgRDh7MCDqnzUoMQU/yNrxKrplGHf0KMxAq+pEB9XvUK5y/115gNItum0561XPT1VaQ
         xkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757674058; x=1758278858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdCzNJXdDljgG/kIDC0Ddrqtrlk8v9FUTdWx7KN6R8Q=;
        b=Y0oQkwpoGteSKhMFkrz68qcQLkq+nSf/vykyLrYTxVXTzDo+fCpCr6K04KfvljjXiv
         iVwBQCB/+XaHHMWYmcFfPDZ65GQSLw7ea8SNEt5uHxM9MfWcmCfEQbg0TTFOVhOD0bwB
         Eni8ToyoEHWv56MMIqEBzmS6cHKFlze5Ijsbe91YnqRF1+MEJbN4uv+IPHUuooGZ22it
         vPym2JzM0x+urtg6NVzMoJrNS7R+d/Kw0B4VlnKmAFSbWSOGEX6H7sQFTM9LmkWzQAmU
         R/41hpyE/+P8Ycf1p9MyomwB51Dnqm5mripZNYT8V49XHvoI4I625jJO+WlvcBGVWNRa
         0okQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6Sy+YER33uLdZ2wdHWUC2WY0Bixcx/PsPaj+xwlFe3kEuqyumzpB1SH2RK0QZL5g8fqcb58huABTH2odTCl+93g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYPsWXq3dZ6E/mr+AxWEqH9rLOHVfNOADzD2LPHH3qCcBvwO5+
	aqBGBi/Nenwi26yLIar5/pO87g0ZVmW3V2BqP0Ro9TpcEXMu2DizJQJ1
X-Gm-Gg: ASbGncvi52MP9SKr4Fb2rP50XJoS5aRRNnLj70zQO9kXHir9ZFryY3dmrm7b1VBZfEj
	VBFxzaetUcRC8IuRKxVxGVLpsyUPpvMVJfVskmKCf7vrGRAzJAHq5nNvunwq9JcLShmpJbKRVGk
	bwssNoMvxs32w9TgU68mup4eMtE8zp6hi+UqH/4sWH16igoOeqS5y6LL3PhjmA034fyA67b2Nk+
	qbPVOAeiqvhnQzQqGzn41hEPKZE+Sk8WttkNtZl/9A9OsrLGwJNNXG7ggy6zkXZ9Tji1P9bBrIZ
	Yhy8Z6IbYeNwmLNjHtXZQHTpyYmvKbvgLWbyeyRVqbu0nanBJlZWOn3djplCunY8sr6tl+P+ipe
	NKqs1Ro0VLHgYtvejzfMb0fA2tIhnG0wpmDvWijx62jWvXOpSch6CpOnDdojj+S3B6kUnxK0EHm
	GjxA==
X-Google-Smtp-Source: AGHT+IFX7SP3Nc3fAURuh1zzId9OJYmZNsTdzvaZuLmsYmsYDvGx6+heBUvwIB58UK6jq1AeT+W/1g==
X-Received: by 2002:a05:6000:1a8c:b0:3df:4fd3:6e95 with SMTP id ffacd0b85a97d-3e765a051b7mr1893543f8f.34.1757674058280;
        Fri, 12 Sep 2025 03:47:38 -0700 (PDT)
Received: from biju.lan (host86-139-30-37.range86-139.btcentralplus.com. [86.139.30.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607cd329sm6197316f8f.31.2025.09.12.03.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:47:38 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-can@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 5/7] can: rcar_canfd: Invert CAN clock and close_candev() order
Date: Fri, 12 Sep 2025 11:47:23 +0100
Message-ID: <20250912104733.173281-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250912104733.173281-1-biju.das.jz@bp.renesas.com>
References: <20250912104733.173281-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geert Uytterhoeven <geert+renesas@glider.be>

The CAN clock is enabled before calling open_candev(), and disabled
before calling close_candev().  Invert the order of the latter, to
restore symmetry.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag
---
 drivers/net/can/rcar/rcar_canfd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index c26a605659eb..f0dfab177b98 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -1569,8 +1569,8 @@ static int rcar_canfd_close(struct net_device *ndev)
 	netif_stop_queue(ndev);
 	rcar_canfd_stop(ndev);
 	napi_disable(&priv->napi);
-	clk_disable_unprepare(gpriv->can_clk);
 	close_candev(ndev);
+	clk_disable_unprepare(gpriv->can_clk);
 	phy_power_off(priv->transceiver);
 	return 0;
 }
-- 
2.43.0


