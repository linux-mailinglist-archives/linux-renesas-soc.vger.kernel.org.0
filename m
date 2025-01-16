Return-Path: <linux-renesas-soc+bounces-12200-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1674AA13CAC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 15:49:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE3D61885E1F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 14:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47A522B8C2;
	Thu, 16 Jan 2025 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="HhnvW585"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613F122C9FB
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737038893; cv=none; b=t3luxByaMpxwxCse7CK+yiOXhCOejU/iCcWwvOa5zIbzeAAzo7l9DuPqBfLzPSVW7K1yAaq6Y1OJBSDYA/jE33inJYQKFYsOLirrInBzDXbi6ymo4KdPuMTAVuXzzk7mzCNc5Xg+wZwwPwi0J5ebCKyIwuy0pjmn2ZlP/VhoX7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737038893; c=relaxed/simple;
	bh=2V/2vL5eskvLAIfXr3uOV61IAv8EAdbHYwxwjxNWGAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dwq7Zg0gzJnCO3cdNSuqecQ5RQvnuWAeAHtfwJHWXThC3/SJ611zmrEGHI/Uk+Vq2ftcYN45xM0+zf5OO0OD1dsinOAohtOvgJgJAfLS0rmMoqdl/+2ZhMw4te+3TPPLfjR2I0EKw/k/H0lFTTnTnNSi5tjvVb9k182T05WcnwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=HhnvW585; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21661be2c2dso19474575ad.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 06:48:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1737038891; x=1737643691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jfvmvIc3wdlNlzNgWsfaYf0EaGZ3HDwdWr/M8gxTXS8=;
        b=HhnvW585e4sN81VhRjYHAIme51KeSYylkfyBqdAzsrDFvNwT0q4t6flkwcZHACIPdW
         WU5CsRowm+MVv1UH6NviSCfVKxlq/+vR94bCiVdty/h2p7GXAgl00aj/XLD3nqdG9Qv3
         YPD8MRbY9cVWJyNVjZizDmyy9xQAW7oOupeDRVqZVErzrNEt6ZGJJT3K4IwozQvy+jv2
         oXxZr/MiOknygwu2ozXIhj6hilQVr2+gz5Q4OMa/JoyARKkP7GxMHTIYoIFLnONEbuke
         B+dIXWJ3i1EteWuRN5SZh+/PCb/4LFqYBjsQHArWEc1OrfUIngwaT1RSwXt6CSsHjEw4
         8sFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737038891; x=1737643691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfvmvIc3wdlNlzNgWsfaYf0EaGZ3HDwdWr/M8gxTXS8=;
        b=jnvDvlnocN46LdxLjcy9HYVYklpeXacwV8uKx9MTFpc0t4052gct2eSwt1Cka/TYxZ
         cRBPbqwACvnc25QeMii2p7SKkfNlr72Zj3slW5SwpdMsfSUuER64qB6zrdO4ajp96XV3
         oRWWa0YNIqNhDHSLggDMM4E/L8bhzcBcnL9iiLBdSnxH/GAS/L5zClMjQ3cbuTjnM+Jw
         3a+NkSNFc7Tdy7sJI4lk7EJZyva+EeZ0gcCs7lkxoVUF2+B1KVg+YWA6xaQcP9whXFkL
         PMM4QfUYf5oRscMjVPlxREi3F323G6kuSMgbkwyVEypkuQSPMQqcMiur/keF9mlp9Q2j
         TolQ==
X-Gm-Message-State: AOJu0YybvVEIZY8EK1/v77GMOM+SboGiIz6GHnvGiGtZqbp4WihyPVIy
	YVH7FyPUyTDrbarjnuPodfvFl2XG+GpTlIoHOjmgBnqYSBMlZ7s3UBxdb2Q9
X-Gm-Gg: ASbGncsKUfHRlOel2ydNEb6GELwME4ebtmdIoBwhvzZnXhWcovt22E/qAmcRtvbeDV9
	TVjiiPdPCwW/4dtmvVskYFaiDzi7EEAi+9iM+dYbqT+arDyrUYGV1RU7JDqkf2YbonrGWP93xrI
	ENe8dL2Js6ckIBWqnBkfEH+2uQDJ0ZOUcXn3L/G1xMjTwUMyfPoWAOf3qTVG++gpprupAusejec
	6VYB7ctjFIrTMV29q9IdMrAYfYRQH+2Mbx3XvJbW2xmB0PFwwQJC9BeKA==
X-Google-Smtp-Source: AGHT+IGkkqPxMDUbKYY3jZs20w+p/BGT202Gdp19peW6r4iqp7ySzt7xIlLj/U2xdXKnFVKVz9EffQ==
X-Received: by 2002:a05:6a00:410d:b0:724:e80a:33a with SMTP id d2e1a72fcca58-72d21feb17amr50141064b3a.23.1737038891626;
        Thu, 16 Jan 2025 06:48:11 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:4323:933a:5975:d650])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dab7f06c3sm106055b3a.20.2025.01.16.06.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:48:11 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/4] dt-bindings: vendor-prefixes: Add Yuridenki-Shokai Co. Ltd.
Date: Thu, 16 Jan 2025 23:47:50 +0900
Message-ID: <20250116144752.1738574-3-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250116144752.1738574-1-iwamatsu@nigauri.org>
References: <20250116144752.1738574-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add entry for Yuridenki-Shokai Co. Ltd. (https://www.yuridenki.co.jp)

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---
v2: No update.

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index da01616802c768..5e26fe32a50e7b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1727,6 +1727,8 @@ patternProperties:
     description: Shenzhen Yashi Changhua Intelligent Technology Co., Ltd.
   "^ysoft,.*":
     description: Y Soft Corporation a.s.
+  "^yuridenki,.*":
+    description: Yuridenki-Shokai Co. Ltd.
   "^zarlink,.*":
     description: Zarlink Semiconductor
   "^zealz,.*":
-- 
2.47.1


