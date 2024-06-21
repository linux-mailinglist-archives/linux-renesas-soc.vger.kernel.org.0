Return-Path: <linux-renesas-soc+bounces-6618-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2776912378
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 13:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5FE628860F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 11:27:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C2617B4FA;
	Fri, 21 Jun 2024 11:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="e8GGMkk+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4344417B43E
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 11:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969024; cv=none; b=uh+KO35v3RrjdeI4FbLIKGYfBQDO/9TriFxAurwN3MyhM3wbcte+5wYIwYVPCC25BDDe/zph4oVDWJutT92WVTl/7HAZZFjBa2lLs3DL9D1fpSS1eV4RcXYEhnCe8v78KmkOYknfID2gJtrsHwMw6A4HD32fxs6zMf6dVAZpQXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969024; c=relaxed/simple;
	bh=n02VnI1z3Lo/vCVvdYX3gNJ/na1w3LKQu6cqOd+GMII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cxMqy4NeIH81GQZUu5Vz6YgiaibWDztA5S4tUgkuoZD4BDdaGvL9cOg4P9nwKYspe+3UtEqkE4ikpwdqUUurke31V4cNbHXJ+Cyp745VV8mRrmOO4JLKWgRQh0M+PWbg/cuOORjB87f658YA0uUJ4q6orzzBbP0My02nRHWGUE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=e8GGMkk+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6f04afcce1so221866066b.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 04:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718969021; x=1719573821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veIrjSKIW0msyP1BPKwCOv7rRYyO3ebgm2ScapHwacw=;
        b=e8GGMkk+MEXMMx8ecWdrmUcnfitLVwhwuDlqjvGYpUyGhaWvRXyN5hdsYkLxR7tuV1
         IuxOuTN7n8C/W6q8+nERUdyT7V/jcGADm4gRzAneS+IkzEAxyJSSciw2rwOxAi3LmpzY
         ajVubbLI+apSF3iG7ocIzwYsbcVXO9EB1er0xxTY/3JmfhNZQYeGC5yEUZGQJffmVGI4
         3Ymvez3WGcJ1juZQ0TVoJI/ywBLAmc508wv2kQE0naQuF1ni/bTnnCRYx+NcpnGHaHj6
         AlqSrHwEmsKSxrXxk+caxlBNtZAO8qJPJgJL5mKPq9kypOiiK7xqbY2H5MVCSy43L9NN
         cOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969021; x=1719573821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=veIrjSKIW0msyP1BPKwCOv7rRYyO3ebgm2ScapHwacw=;
        b=OZLKb3qbJFGu0Do9722s2BXRnrcY+PkDXSRX4HPS6QiAsbjDD/ywTI0ACGmgKm+cPX
         5ldhTgroF0qroiRbLSWe63DrEkuAv6XEj3r2r4phuhm5b8lyZtWfGdQO8mfZ2qB/G4sO
         7NIGPYaiwBDf3pKjXa0EqhHmgpw/8u/Pbj0YpXdfWuJceez2koBMry8HNiP7mu0UUWzL
         hVmccE/Q3srSTn4w1V86kfudOmTf4PHnYNovFF9UzPt2AxDfT/xHw534/JHidE2Lc0Um
         JLYwrIT4VFFHEKauEibJnE4gpVsYtLa2FbGnAAfbPqwk3C3pPk9K9sjRcBoOCQzdLxxj
         Fm3g==
X-Gm-Message-State: AOJu0YxcGvs/LXNAn1m1jIR9/3/u9xb38pFjEYuXiO/4GLXQmla4YOxK
	YJpuAW2J4VaAjbIH9OaMH4tVVW8wdyFu6lDDDUBoVacVtdGJg2jqewkctCZPbNQ=
X-Google-Smtp-Source: AGHT+IEEH1uXQ9SWBQpZ3LT5PHwfn4wvDC947Dj2o3fom2F9AP5MXqF9KQPaa6c5ngH5rqOd6vpGow==
X-Received: by 2002:a17:907:ca1b:b0:a63:49d3:e1c5 with SMTP id a640c23a62f3a-a6fab7d6a8emr476914666b.64.1718969021696;
        Fri, 21 Jun 2024 04:23:41 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fd0838345sm64498466b.99.2024.06.21.04.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:23:41 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 12/12] arm64: dts: renesas: rzg3s-smarc-som: Enable i2c1 node
Date: Fri, 21 Jun 2024 14:23:03 +0300
Message-Id: <20240621112303.1607621-13-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable i2c1 node.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 8a3d302f1535..21bfa4e03972 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -32,6 +32,7 @@ / {
 	compatible = "renesas,rzg3s-smarcm", "renesas,r9a08g045s33", "renesas,r9a08g045";
 
 	aliases {
+		i2c1 = &i2c1;
 		mmc0 = &sdhi0;
 #if SW_CONFIG3 == SW_OFF
 		mmc2 = &sdhi2;
@@ -150,6 +151,10 @@ &extal_clk {
 	clock-frequency = <24000000>;
 };
 
+&i2c1 {
+	status = "okay";
+};
+
 #if SW_CONFIG2 == SW_ON
 /* SD0 slot */
 &sdhi0 {
-- 
2.39.2


