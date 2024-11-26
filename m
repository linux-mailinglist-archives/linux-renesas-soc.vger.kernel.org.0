Return-Path: <linux-renesas-soc+bounces-10693-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D739D941B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 10:21:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 586F3283BE8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Nov 2024 09:21:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 069641C4616;
	Tue, 26 Nov 2024 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FxVeUVkd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AEA1BCA11
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 09:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732612873; cv=none; b=L8Gm5WUUPEvohg3RdZFCeRHPY+hK6p3UV7HZQLGIdf6JBSAjcAYftgf71Wu2mPVD47ykb0S6UtEeg8OBepEnaMoSIrqM+tufXlNo1U/cCTPGmc6j8CqbjTLHjw1CuYmd8fWAJkbzmCPyLi/RMeXUcgC83hXF7MKf7fDx/ppgG4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732612873; c=relaxed/simple;
	bh=L3W0t3Ndk3P8WFZClVN2UXeegBaVgcbm+UbE0rvxIiE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cKhbVRdhC4s4Cwoa7g4iw0yv/KUUWAebVyq1oocqled9ZBbY1hDbXUGRl/xPy4JOHNWHNQeakftvC6i0ADhZyV+4vC3h1SC3TIYFUnPE9dHvvZLzndn0oDSi7BjR9zKiD2ofnRFT+TL7PJbPy0Jz2UUEGCOxNKtEkz7M09LeLdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FxVeUVkd; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-382378f359dso3876955f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Nov 2024 01:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1732612871; x=1733217671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHg/UpXu0kAmh5cmR42CQBOhisgGmi+P1vH8bY184Vc=;
        b=FxVeUVkdWtHtY+sPUI6sqE21pehNBnfcBSO5Fe1XNeyDBtjrbLY3RCNlA9/TolWQID
         Li6rQ/qS3Qh6mPiK7z9ApvT8z9JjymMMtd+NjW2aisnUHkJu/OsDe2JbsoL+qrGxcDyk
         CucYUv9Ww06tLU/VIw/gNdOyMI5aYZoAGSBuhu8/SF4RZynySUvU4YTf7CrqB/iyiGdt
         m2DnCMY/tP4KoUn3LROhr7lKQerMxxcN/EVyGCfBSGZUa1bGP329cqKM9Ijwy9eIK3Fy
         eP2rPHYrwecpEiSyGDpz6s7hEvgSOjXqhNKs51pqZBZSG+PIxckU5X50yuAjDBkpJuVm
         ue2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732612871; x=1733217671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHg/UpXu0kAmh5cmR42CQBOhisgGmi+P1vH8bY184Vc=;
        b=eaAIgA/ngZdzuhPcekv94lf/x2PV2uOmlEUIb7MJEcEZ3eySZAk17wC1If0WGHuZv+
         lcnvws96ny4nYg0uBTntFLfyNLh+1rkjrDayD18iOpgttKKM8yOUC1hcaoPvX/YaqAWJ
         o43jYgiDMI4F040eLnLc8l1qGNAplLPdKNoybGUC4rz6pg3FbXZGIw0F4CkCzYtjV0FL
         tOZSSQsrJ3/QsTYFs7WOAj71c3CPqLfoIlk5CazyNnpe4zxXUUkEARTIykuQNphsPtl9
         JTpabRD1+r09Beo9Hu0hhbancf9Avkr2eEE5vNMM8fX6hO7A9EPQyIZ+yJiJeYFCQTVI
         rcMA==
X-Forwarded-Encrypted: i=1; AJvYcCW4pEzWViB1HYuf8apOafm+NlH9ucU5bKl+cVFQdD06CE7AkrLqnUfd55VFaXgWNnz2FojbRrOp8OLBM1u7P6jiRg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJZULXQLHWUmnCnxNaEey/Ke06HFJOC/CEPYukmp6fBtcEPfKz
	UGwZjiqgVXjlt9DgYt9D2ZTX2gt0dNkyr4l5QcHsFL4eGal4o+IuL3OnzFZ+a4Q=
X-Gm-Gg: ASbGncsfvE+uJSG9Fr535PFKXXo8A85CKGNeRb2Ltig9Qg2ytwFUBCxoqtIHM/mTeuB
	CjJd25yXU3ybn+T25axgSqkT8rY01YlqmAwF+8dnerWDs/+1oWHdBUiqOnFwKzKZ+ycHTph9EQn
	IpRkAjWR9EsXkHRuv/ZOqmwNfXXoFJKzIawKdGQq5ECCG9whPAQB2TtWaL+vPGvdppdSzdH7/fD
	NwsOhJ9lrGev10DTTPpgGeuqUMDy8B2gRlaOV6czwZp2eqbxJIaDj7ZTOAHAhXxWe1obag3hpBB
	sB0=
X-Google-Smtp-Source: AGHT+IHWio7klIaUm9lWwgg66sT0uRqFvChifk0YrFUVIwja8OlGoGemJIscbif1ZB71H5mZ9kHl7w==
X-Received: by 2002:a5d:5849:0:b0:382:4ce5:f8a4 with SMTP id ffacd0b85a97d-38260be54f9mr11141729f8f.53.1732612870798;
        Tue, 26 Nov 2024 01:21:10 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3a47sm13027694f8f.73.2024.11.26.01.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:21:10 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	gregkh@linuxfoundation.org,
	yoshihiro.shimoda.uh@renesas.com,
	christophe.jaillet@wanadoo.fr
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-usb@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 03/15] soc: renesas: rz-sysc: Enable SYSC driver for RZ/G3S
Date: Tue, 26 Nov 2024 11:20:38 +0200
Message-Id: <20241126092050.1825607-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
References: <20241126092050.1825607-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable SYSC driver for RZ/G3S. This is necessary for USB support.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none; this patch is new

 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 0686c3ad9e27..c8065f25ee53 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -334,6 +334,7 @@ config ARCH_R9A07G054
 config ARCH_R9A08G045
 	bool "ARM64 Platform support for RZ/G3S"
 	select ARCH_RZG2L
+	select SYSC_R9A08G045
 	help
 	  This enables support for the Renesas RZ/G3S SoC variants.
 
-- 
2.39.2


