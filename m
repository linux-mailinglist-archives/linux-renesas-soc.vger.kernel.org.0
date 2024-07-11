Return-Path: <linux-renesas-soc+bounces-7266-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F32EA92E79D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 13:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9716A1F21855
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Jul 2024 11:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3DD416B38D;
	Thu, 11 Jul 2024 11:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OoxcBqpO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589DD16A934
	for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 11:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720698761; cv=none; b=vEbuXsrAaIOg4F6aIvDUVue0Vyc5BYi0/ZcBPCu1T9lwbZLyDXqk2BI0zpA1YLzr21KaDKBPrjrXh+9Bzqz5RuKVUeCkTeBf40xRyBQTUev2BlAZ3twBc9EiXUUe8/CCl4LQTn9C1PV+6nqHE+sOSdj/AoZx/qQs67hF1XNdF44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720698761; c=relaxed/simple;
	bh=95locSstQZk+WQ96XV1jBWvUwnxbuUngt/qXjiWkMOs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s5S6o/5XvIiwGTBm2I4mF3reaXHCXEG6atTJSVfxS9ybpk7WfBs/6TDfbFOC+S5wiT6pJBcOl4vvzfwcjNtW0JT3CZQRSMlxY44szJo9F0jqrMwYlg9Od+uCKzspFQ55s5jnPND7tgDfUrD2KHYQEKXx5PcDGXXi1yNz0jJjSP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OoxcBqpO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-36796d2e5a9so464758f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Jul 2024 04:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720698759; x=1721303559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3pGGFACRfgSIVGH5tKVs4BFUSzbWenTGaIvHE0eHnI=;
        b=OoxcBqpO3XAG5tZvVnxya3uppNd7TVdxPkmIoKG6U4z6X9YZOxiEpecckzXtWp+wiC
         1H1mZuGGnOykWRMPDmKU1PbSbMB2u69CwL7wr/HXtIJO3zQ5ntHZCDYZLgbHVOksaqUC
         MgD3LUePkEh9V28OPDIERrCHRalXtPLDA3AWufs3EHxIoI4OLrJ7Cn/QshDSfObgv+9y
         wCf0HdGAGrEHtktxhb19l9qYi6ktRtrY4LfIpwt/3vg5nkFzGjwd73JmgEsT5GbcIn/l
         UShN46xI6/kLbdcEXXTR9axG+aPiQfsfJ3oR/hh3G0AM1UfqDkdf6zPYW4ldSaSbIRPq
         9eyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720698759; x=1721303559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3pGGFACRfgSIVGH5tKVs4BFUSzbWenTGaIvHE0eHnI=;
        b=bHFzqfx4GSiywfWN9Vj9PlyZLFMYttBGXvAxtuwEFFfQTK32dnij1xTwz7hMdiSkhU
         lr6e/g1E6g4SoLqKicVSnqiBS1mF2+6q5jMknrgV+nmTiglfQlI7VCMyueByVOwUnH7S
         F86Cen5AJvsQFnNjmWfK004Qu1Gyc/oyc/TEcHwyOTLyqAHhJE7dS0bIJCxEwLsv0wpb
         bnE+c0q267BCvtjcm+nmplwulp1iWO9YcAwGgjGWHygaNIht+iJYIA4sNINH82xVIccf
         ZsR+4Zi4b0ozBfL60V/5UPwMc8IcHEP+6Vs3MSIH2FeqPiT1tE1XoUKy8Sf5sHyG5gBG
         PeTg==
X-Gm-Message-State: AOJu0YwqDHrPdsSJ9XHGblZQk18JM0HRNrY9trEtiF1f3eVtWwKIkXsI
	rl8O6sEycJJhmqJKLN0BfhCFhgNloHl/79iCQueVcumyzntKXCSaFtKx5ngxtqE=
X-Google-Smtp-Source: AGHT+IEPdVFkMH+rbfa2Od7mb4j3MtN3RJb5+lTw90ysggtVHZ6xUjmLWMzoFfuJ/73Bd+5oZEDmug==
X-Received: by 2002:a05:6000:1814:b0:364:d2b6:4520 with SMTP id ffacd0b85a97d-367ce5df304mr5840712f8f.0.1720698758857;
        Thu, 11 Jul 2024 04:52:38 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde891cesm7615728f8f.62.2024.07.11.04.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 04:52:38 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: chris.brandt@renesas.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	p.zabel@pengutronix.de,
	wsa+renesas@sang-engineering.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 10/11] arm64: dts: renesas: rzg3s-smarc: Enable i2c0 node
Date: Thu, 11 Jul 2024 14:52:06 +0300
Message-Id: <20240711115207.2843133-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable i2c0 node.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none

Changes in v2:
- none

 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
index deb2ad37bb2e..7945d44e6ee1 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi
@@ -11,6 +11,7 @@
 
 / {
 	aliases {
+		i2c0 = &i2c0;
 		serial0 = &scif0;
 		mmc1 = &sdhi1;
 	};
@@ -66,6 +67,12 @@ vccq_sdhi1: regulator-vccq-sdhi1 {
 	};
 };
 
+&i2c0 {
+	status = "okay";
+
+	clock-frequency = <1000000>;
+};
+
 &pinctrl {
 	key-1-gpio-hog {
 		gpio-hog;
-- 
2.39.2


