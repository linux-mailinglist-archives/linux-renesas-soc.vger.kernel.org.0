Return-Path: <linux-renesas-soc+bounces-15753-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C3FA845BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 16:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D9AB69C248E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Apr 2025 14:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D66A828C5DD;
	Thu, 10 Apr 2025 14:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="dyL5Zl5Y"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E70E28A41E
	for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 14:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744294004; cv=none; b=vCjHez3nBzCJx+tyuuysWVYm/h24EqgaVc51H1X/9IQPrdDRKfO5/rJdNANDALXA/z+AqDJOsImmQeDykMhjbuvo96PVC8oeuz2u7eFoEK7wiQ4st/1XyDCJARhmqBJcckh4dyb11VqweQTypUpiw54lmGZ0tC3wxbwLKUDVdTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744294004; c=relaxed/simple;
	bh=U9q+8HraNg4JM2K3asvu+3Dz70/97utwVQBUEVgctoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uXTfvg2tZjhSAmgrV99+bORDpdqpsIPdiNjA0cd/S3y+E3O69kgAMjVVSvM4JOUK/1llZB6JHnpyWlrS1NfqKjBPpLsf+Ab/bzD3HXcCDKjPJb4qJwaycVPJ0icXrdkCaC9aFjeu51U3ADp3t848pd4m8pJ/ZN1uklFI8KWmWb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=dyL5Zl5Y; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so9529145e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 10 Apr 2025 07:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1744294001; x=1744898801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzlWKmbplGkiGN2v7k/ekxq5IRTgVEaVq/S0RNAob/w=;
        b=dyL5Zl5YBj98FycXMpHoB4OXqWU1c5FJ5xlm4qw5zIwaUBkJ4g4XdNRi8bszuyNBdV
         z9GDAClWWZ1Y+Z6ZpnMBfY6cYpgK/zCKjDCZzglP7zcF/DAt+URkrAlR91pfqC5omLkA
         ARYnHE9WRaAI7B6w4F1J+hk3inoaCsAaXchYezctYzvKCtaAooBKsbz/zie5mSkwkF9b
         nSi3b/TKZRVeCDjO6V+aDY6SSvRhRNhMAkRQ+Mt5wNaqpXpkH7tSa/6UyzbnWcYqB33K
         /zmGhAbIjCdlNrcmdyrR/kHISfiaEfhQ6clICftG1wmfp+T4Y6lET0gKw3i0HKNa9nAD
         YV/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744294001; x=1744898801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzlWKmbplGkiGN2v7k/ekxq5IRTgVEaVq/S0RNAob/w=;
        b=loFVYeJvxlMeXvGq84qCujPG3dRafvQOprdECMz9iaRQD7EfIQEeHNMvakRrlO6CX6
         hNUHKib/lezOHLbRCGPpa8IeNzdcNiAj6+i073bVovoBtOVmMqClpsx0ul+gj4dSV/RY
         MQlQMpiON2CpUkXZrP3SvhKhd+TsQaTXmM4Jdia4wta5g2lketFcrQ57i+DS128nIaTV
         CwxohFYg04GlULeo2eQiwtVwE2UHZB4gxakexEzEl7zYEhD5j4t4kQUP06XIwpotpD0N
         YhKztSrm/2y2U6sd45FgPjo7vyWXr/Ua1AXytL5xM1kmsi+LpzS0xtlDdJBjGB35+bDA
         5C6g==
X-Forwarded-Encrypted: i=1; AJvYcCWN6RDdklwpPKE6GnI8Y5AyhG9iQFDTiGJfM+4UDP+Pu+MAaAWX3avb6Ft08kEVvsuUJ7s7IFMSz4x7ZwelENSXAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfpTwe11exMP6WsEfF5QCuiPN7ELIBkMUFHL7T8jiQ5tfd5MeH
	ZbaltvGaCoy7j6V5YQg/bcTQ+3C/8UKSrLTqmDVtJFQFc4spHV1gPOi+WJ9QBBY=
X-Gm-Gg: ASbGncu0EQu3Ecsxo08D0uY4CWfASlRWl50okCoiji4OLUIRxm6V7gCy8SWrgvUT3ws
	4Gq0eDWz87kxL3621ajCKasrw9ky/JPZ4O3VM8i1c5hrfClS1mCaroQrv1/AlLDNAjLxjqqHb4Y
	P0G06EJGHbdbhbvAvwS3guYNrU3R4BP7porja6j5UlFTWRotjwUwRkqwQDv28MHDJYgBCM59L2d
	xfhdpm35Lqx1/Qql2P+x1Wiv4ztAsxPMf32cj//hLM39vq/g3B5vskNGIl9seZt3w9YsSlKhTYG
	DGKoSJxrZblWxb1cX7jbuwfa662kG5HjRZCH0+OXGSgGF51A+pro/AsMKRyiNNA1lLA3fQ==
X-Google-Smtp-Source: AGHT+IHFIdqfR8VnAOPw2AK4/J46cf2SZb245hEBDTyrPiE7X84if8Bb9XtXir3NzJADmlsiOCSEgw==
X-Received: by 2002:a05:600c:258:b0:43d:fa59:bced with SMTP id 5b1f17b1804b1-43f3611175fmr5250945e9.32.1744294001198;
        Thu, 10 Apr 2025 07:06:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8937f0d8sm4806913f8f.40.2025.04.10.07.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 07:06:40 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 2/7] clk: renesas: rzg2l-cpg: Move pointers at the beginning of struct
Date: Thu, 10 Apr 2025 17:06:23 +0300
Message-ID: <20250410140628.4124896-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Move pointers at the beginning of structure definition to avoid padding,
if any.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 2ae36d94fbfa..bf2453900f36 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1183,20 +1183,20 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
 /**
  * struct mstp_clock - MSTP gating clock
  *
+ * @priv: CPG/MSTP private data
+ * @sibling: pointer to the other coupled clock
  * @hw: handle between common and hardware-specific interfaces
  * @off: register offset
  * @bit: ON/MON bit
  * @enabled: soft state of the clock, if it is coupled with another clock
- * @priv: CPG/MSTP private data
- * @sibling: pointer to the other coupled clock
  */
 struct mstp_clock {
+	struct rzg2l_cpg_priv *priv;
+	struct mstp_clock *sibling;
 	struct clk_hw hw;
 	u16 off;
 	u8 bit;
 	bool enabled;
-	struct rzg2l_cpg_priv *priv;
-	struct mstp_clock *sibling;
 };
 
 #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
-- 
2.43.0


