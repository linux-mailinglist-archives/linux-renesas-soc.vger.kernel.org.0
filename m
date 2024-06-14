Return-Path: <linux-renesas-soc+bounces-6193-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEC1908483
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:22:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66856287380
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 07:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEC5A18735C;
	Fri, 14 Jun 2024 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TB/KjOpZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED575186E43
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 07:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718349615; cv=none; b=B/pmaoInV6A/nXI6cb+9YgeQGcVY9VHkYCaiARMDLhoB6fJkRo/xjKbRK0eo2N7oPuRyMYx11uw0DTcvh2ossFY5ogL/jeqnfqtgSHT9Ys2WKiLv6lGdTkJ77b1I9I+1Bic7e4v2c/v/JJWpr84Q80AgBVape45a5BLO0Z+A7U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718349615; c=relaxed/simple;
	bh=/VzQHPWFQ6z0YVKxyGZOEjwis7QAZSkuy7aN28HmdSc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qCPbDGV2xmCqbngBJ94XRVxlHXnbEfw8xN4rNlytq6KAjixw5EnzoMmK7uuFyjbDGr7BWFDSgd5Zvewz0rncMxwcdA1cvxPIbtaejoMyJSIQA1qoTnqgiSMoKiwTHjH71mGOxZ1cwTdUe+5nlUUY/BsfSkf4VUps4BCFB933+K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TB/KjOpZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4230366ad7bso13288335e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 00:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1718349612; x=1718954412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3KEj0xEDN1Ax2G/RC5gQRFWvCzGHgOqwoRcyc6hKKA=;
        b=TB/KjOpZ9pMLLyo1ysl+oLWhF3QlW6E6HpsQZvnEVvrLWWzzhIJhLjgWG8EbT71EyW
         vLiFY3Ka0htxadYWru4xvNrs5QkC1nbv7NVpjdfCIWZdU7kYKmHwnreOebYA5U24zEIE
         2LZm+S8yKX8FgDnzW1lrTWCIXD9nzbbHrQ9D993LBYTMrQYO9n3fCkTLVc0ZN78Mb6yP
         o1h/tZbphCYPpyHBg6YTumV0Y/8mu+R/d0u6SDS4U/giHraT8URSCOpMfGJ7KW+fOb+r
         /H6QSCcO6IquY74HxM2MnYTjOWPm+pOeq5w36JSRyQVdCcc5Y39r1jZdI2qI2QXoKOBs
         hSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718349612; x=1718954412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z3KEj0xEDN1Ax2G/RC5gQRFWvCzGHgOqwoRcyc6hKKA=;
        b=s4ULNBheD2GFyr1uX3UIfYE6EIScNADBUPpZqDQCyfbh5Y49+87PfqsqQQHg8IagWC
         khv/bPQapQO9C0BJYZhyT4C99P1VnKEIVZH8jqpSsRdfyHag2iCAb6qiigMYXxYfS0RB
         uByc2iJEwGpJPfQyEflxPMCOVweW3UrleUI0QdCe0u+l0BcCamyVMcpZTi4BB789aHZ7
         hjll+Kl5S+HN9VspLsDx/72+fXGPlFxAriGxydfIEubk86OiKPHT1FcRJSIdLltzgk5m
         59nAqowU53lNuqDSSfWSh+KNAcrvEg5/oCdsUfusDcPydfe8rpALPLcbm+JK6E1+hVGg
         lMDA==
X-Gm-Message-State: AOJu0YyhHo/aVl9UGejC9a/aaM2KcJiCqg1GwAT+gvgkQx96tTccZKYG
	BJaVf0k9BfuHx1lVNJriBwXoU0IetggbFMhDrd09HcTy0uD0lUrCoH328tySRTo=
X-Google-Smtp-Source: AGHT+IERYkDmu/GQZcsA7JnGF3XH8j0KFhCh57EyDaAQ7G6QLfCcYTHe4SjtRlsH0Gxh6NSndlHjKA==
X-Received: by 2002:a05:600c:a44:b0:421:7f07:92cf with SMTP id 5b1f17b1804b1-4230484c563mr21714755e9.36.1718349612467;
        Fri, 14 Jun 2024 00:20:12 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.189])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286eef9eesm87272555e9.9.2024.06.14.00.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 00:20:11 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	alexandre.belloni@bootlin.com,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 10/12] arm64: dts: renesas: rzg3s-smarc-som: Enable RTC
Date: Fri, 14 Jun 2024 10:19:30 +0300
Message-Id: <20240614071932.1014067-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240614071932.1014067-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Enable RTC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 517ce275916a..82a80fd8e7ec 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -341,6 +341,10 @@ mux {
 	};
 };
 
+&rtc {
+	status = "okay";
+};
+
 &vbattb_xtal {
 	clock-frequency = <32768>;
 };
-- 
2.39.2


