Return-Path: <linux-renesas-soc+bounces-17074-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59457AB66DA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 11:05:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B2F4171809
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 09:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFA7225784;
	Wed, 14 May 2025 09:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Iz2+4r4E"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7240A225390
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 09:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747213469; cv=none; b=G9gyNQlw1dtx71aYqbsk1FepCWg+ARKzMBBJ9jeuwrs5lKQnISsy6KwntP8fyJq6So0Kv6XSYpI0vjSMCIGjM7A4qABheyDE4Kln/RTY7wl680aIm//n67uR+a9HXf+xnT4s3jEm//0H29OxqdEHeKUfGVlbu8nYTYrMoU//waM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747213469; c=relaxed/simple;
	bh=z+fJpQEL5tFLNSD56mZ7hzkqnnnTts2E8ZIBSo41csY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7ecC6b+DdBnu6Dc+jg9C/ohDL3PnTlDtH4UIrmhUhnpcUB9X/hR+skYAABQR36PoMgmFrZBz4ImdmJXGZNWoKrGFUGEk0BBwQSBbm65ltYq590/q3v7w1+cfv0qO/hFb5BiVbWg+PoiEwyTpcccbD5Borpf19xur2IVlvfqojk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Iz2+4r4E; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a1fb17bb8cso4231165f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 May 2025 02:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747213465; x=1747818265; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0z4P+OmufwJtvHe7VRG9Qw6SM4vHtxH+ac7R9RSX0Wc=;
        b=Iz2+4r4Eu5V/lFqPnHj4frmkf/324unyRDZJJaUygSEgSf2AOhtmGF0WsEkriLFWqk
         kJMDOMO1beyR4oZOMhDHdH30r6GRzJcdnXlvfy5pGSsXOMPXM172ThBUg6wnNlw78EgC
         7UqvrCoJ+aTwAgkh65S0xVH2pSH8DftaiCnJmKeu41pSd1y970jDd6bTh34hHmB/sHoa
         2EKTzeA57MfSqFwH9rk2UOkFPlAhBadcGYk2vBSyuT9c6LJ+us1VjybBI2oPa89EfMhh
         3kbN9CRQPvMrLuMjG/+D+VVnIfMMe7r4hR9D4AvmbGYyBXjzNqf9oVJ9rrcr7AFyBVE8
         9uFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747213465; x=1747818265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0z4P+OmufwJtvHe7VRG9Qw6SM4vHtxH+ac7R9RSX0Wc=;
        b=B7WMI70abcqGH+Qh6TrRomNZ0FT4pLRRVnmyHOh0kyBviMYZDPD1+uBvHhHhNbD+eB
         CsMWYsmfyllsCtn8d3jSYlAMoT8BeX3tzUI1XfRIQHmuG6cZ+A2KeQ40LwgU726mnHo0
         9aX3q45ZPf/px9J2LkDfiL4M0w9v7RLeNFaBTeC+QgUAj1dqhIVA8O+W+auhMXpImAgT
         k/ZOX5CFE4CiEGJ1umKN8KK7d6wtEusfXD09c1DnxBFLfsEhCT8Jx0xQzuGB+Vwrw/Xj
         qiSv385aiIlmQFkOtWBz5wsn6Av0jTbZc7wdaeg51BE15Xy1FhtPv7H470xn331ReEFi
         Ml6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVQiHD3czJezYDyiezXBGkO2VgukQ7muQ7OTQJvg83VNbUneDT3idif5NcxPPiDcMWsRiMt7/EAnDl6oRHXWDETZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMORgh5UCY06gSJZfod7yByEtk4tqCdbHO9PJdDp0HPGza55i0
	+cpINLCuAA7VeWXq9YfoCRSzHqJ0S3R6r0WBR9q4M9qVcLDfxdJaIPgFTdYzomw=
X-Gm-Gg: ASbGncv+4Z9KV2H1bGy2yyRlJPD5xjuEIuG2M4RL9+BffPGif9ctdDFBtBdQ05TAgMN
	dRt01Am91cO3es2lr566Rt7Ievmk3Jqx86e5AMIdv+u9vxxr7TcLThE3O20tIr5ZIZPJzIaV2z0
	Gslo0DsrP4e4Sxx2O/zng9vWNkBdirFPsn+ylNYkrsmYoXSHqLhQyxzfvAOP8W3hF6MDH280XwE
	4ak1ybgX361yduxgXAeMQIMsW+1Dh5V6IqGJqokdZkxcEIu9SsOD+4z+/dlPtmOPTcpjnGQtVlt
	6gcv2TMpQDDblJzREsQElE5EbQ/gTXHL49OtFgVmBOntzFpo9Ex2FnqAjeSlvcwZTuRvqizG60Q
	9AKwK
X-Google-Smtp-Source: AGHT+IH/xnJf8OhD2UyddPs9fn8NZYZRYKnhkQGnPGNMx5KbE3arsLz1J4F7/4sXv5p5DqIDl26u5w==
X-Received: by 2002:a05:6000:381:b0:3a2:229:2a4d with SMTP id ffacd0b85a97d-3a3496a49fdmr1851225f8f.22.1747213464674;
        Wed, 14 May 2025 02:04:24 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfbesm19286561f8f.10.2025.05.14.02.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 02:04:24 -0700 (PDT)
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
Subject: [PATCH v2 2/8] clk: renesas: rzg2l-cpg: Move pointers after hw member
Date: Wed, 14 May 2025 12:04:09 +0300
Message-ID: <20250514090415.4098534-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250514090415.4098534-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Reorder the pointer members in struct mstp_clock so they appear immediately
after the hw member. This helps avoid potential padding and eliminates the
need for any calculations in the to_mod_clock() macro. As struct clk_hw
currently contains only pointers, placing it first also avoids padding.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- moved pointers after hw member
- updated the patch title and description to reflect the new approach
- collected tags

 drivers/clk/renesas/rzg2l-cpg.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index c87ad5a972b7..767da288b0f7 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1185,19 +1185,19 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
  * struct mstp_clock - MSTP gating clock
  *
  * @hw: handle between common and hardware-specific interfaces
+ * @priv: CPG/MSTP private data
+ * @sibling: pointer to the other coupled clock
  * @off: register offset
  * @bit: ON/MON bit
  * @enabled: soft state of the clock, if it is coupled with another clock
- * @priv: CPG/MSTP private data
- * @sibling: pointer to the other coupled clock
  */
 struct mstp_clock {
 	struct clk_hw hw;
+	struct rzg2l_cpg_priv *priv;
+	struct mstp_clock *sibling;
 	u16 off;
 	u8 bit;
 	bool enabled;
-	struct rzg2l_cpg_priv *priv;
-	struct mstp_clock *sibling;
 };
 
 #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
-- 
2.43.0


