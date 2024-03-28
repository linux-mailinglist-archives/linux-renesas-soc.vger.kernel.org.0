Return-Path: <linux-renesas-soc+bounces-3538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33600874CE4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 12:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 575751C21408
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Mar 2024 11:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899B8127B7B;
	Thu,  7 Mar 2024 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="NwUozMVF"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC311272D9
	for <linux-renesas-soc@vger.kernel.org>; Thu,  7 Mar 2024 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709809387; cv=none; b=evpO01N6DFVtW4y4gnbYTNOkmSAP1Lj51plT4/AxOzhMP7dFmHwLXZT1K86W7XZwA9D96YJWDwg5Q8GPMd75mnugsh7UeIuPjWxjFK8ALSbW5nztGqhUlbyH7dxePpUTAs5i9CLkaWSv0yrXfsfaOJxHgeiqezFmvGUZdZ5NJQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709809387; c=relaxed/simple;
	bh=wuVAQkrLR8WwB1ntCRV9PteVaa8a8b1wpKEOHe7+grY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lWcvpJzCb/OoMmYv3fKQmGQZXIeNX8t1IUQOCQ5EIUq4dvi7EKmK/RIcYljjCB4okPVK9CMDKmMW5AnjH6tV99aOWSxehl9e5y5BMBQsBzzLkEBEFWTAMumZFWLsc8f+ug2UZun0WEsx5yeuzishZHg4G8ygSBebRm5DJfHSJvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=NwUozMVF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso340525266b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Mar 2024 03:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709809384; x=1710414184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3MwrZ3jZhmQ0oF7iS8SNgaGD8uh9mtxvPbhJwIK5FQ=;
        b=NwUozMVFMGJFxnsFAoeVpNNgvv3Yp05dh8ET6vOvVknYD8pbmtNUhGCVUDMCusOsA1
         9Ihseb88VojQJWyW/MTqE/X/gbl9Rt1YiHwM9NiPVbIxemfbGTGyJ+qERFSrsLAbjExN
         AfkVHHrX7r9KZyFGz63NRPim2EAuBcqaaqLIeu83j1TG7OkO+UiGtizTjysSHKsYwSVc
         3qGcv3TPESmc6iIxsdb4vUfbr9illSNwhDaua+pLGChn4DiBnwoMTe/ZMXnA8FWfGoMP
         6X51Gj4YbMb+WXjHtZ10cIspV8a5azRk1tgO8sdeCkh/WoIlDjsilVQP8SxHK0PGAgE9
         Pggg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709809384; x=1710414184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C3MwrZ3jZhmQ0oF7iS8SNgaGD8uh9mtxvPbhJwIK5FQ=;
        b=gRxXJZIQWI2wjTa9JMSqbykWKH3g6eYU8hJrwSrV1mp61rbIiMABbCLroj6Qjy6aio
         mTJlOszE4qDKlGCz+dcWUYU7ksNlheKjiUiTlG78Ty8rQZQGmV7tX+GSmUhr8UbT1XZ0
         ZeIKkqERtnsGkMOqMED6VRUVe4hLIrA7dk8LSGzmzPEE5L4Bd0/1K5AQBVzXGkLqcjyF
         vnRBGKMcJj6KFOCuGujzKVbyKmlTcKtjZxPCXfeSzHa9mtqe+110z0t+JontxmCIZQbI
         MAi4nJHrmuDRvC59DQgQ8Avrd2CI8yDujFEavFIUJt11YPs+R5US0iJYzBLDIDCwix0X
         EdFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyvCNL0CiARM1TsAimwPiIsoM51c+BI/1BmjKtzEGGYq2IqlvP+KWn8Nz0K7oi5zLbq/8ls4NP9IeA9lFVGpymBg1KOhQ7AaUR3kGhItGuTWw=
X-Gm-Message-State: AOJu0Yy7DJ3T9i1MAydprR2usFVITV+ICN0cWzwz1KI21RkvrMnhgBat
	yqBysyS/Jn2gPSOT3zDNsBQ+Dn+VnC/tyUSLrgGehUde+38jVZWnHWkUV5RgB/M=
X-Google-Smtp-Source: AGHT+IFfojwhvVEXp2EIIU5NdxDWDHNiECP3W6mNvL3OVF8tOJQuLAqHjTO5q/OvaWjhGOLlzMKBow==
X-Received: by 2002:a17:906:f6d1:b0:a3e:feee:3a5b with SMTP id jo17-20020a170906f6d100b00a3efeee3a5bmr1063657ejb.3.1709809384315;
        Thu, 07 Mar 2024 03:03:04 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id md20-20020a170906ae9400b00a45c3a3390esm1167188ejb.200.2024.03.07.03.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 03:03:03 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 3/3] thermal: rcar_gen3: Increase granularity of readings
Date: Thu,  7 Mar 2024 12:02:16 +0100
Message-ID: <20240307110216.2962918-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240307110216.2962918-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240307110216.2962918-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Later versions of the datasheet (Gen3 rev 2.30) have examples of
temperature approximations with one decimal. Increase the granularity
when reporting temperatures to match this.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 drivers/thermal/rcar_gen3_thermal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/rcar_gen3_thermal.c b/drivers/thermal/rcar_gen3_thermal.c
index 56fba675b986..fa4c6da8e460 100644
--- a/drivers/thermal/rcar_gen3_thermal.c
+++ b/drivers/thermal/rcar_gen3_thermal.c
@@ -135,7 +135,7 @@ static inline void rcar_gen3_thermal_write(struct rcar_gen3_thermal_tsc *tsc,
  * of values. The values for each model is stored in the device match data.
  */
 
-#define RCAR3_THERMAL_GRAN 500 /* mili Celsius */
+#define RCAR3_THERMAL_GRAN 100 /* millidegree Celsius */
 
 static void rcar_gen3_thermal_calc_coefs(struct rcar_gen3_thermal_priv *priv,
 					 struct rcar_gen3_thermal_tsc *tsc)
-- 
2.44.0


