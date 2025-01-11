Return-Path: <linux-renesas-soc+bounces-12056-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF923A0A1EC
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jan 2025 09:10:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41E0C16A843
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jan 2025 08:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE11B18E023;
	Sat, 11 Jan 2025 08:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="a4hBhPfe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E1318BC19
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Jan 2025 08:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736582975; cv=none; b=PwXBKYBHaSuSjl3z9OB0MMVUlUxL6g/9puTVfX12+Uv5/aDJuY3WQ5hWhGtE8/f0D1fgcxj80Hlxwaw+gLgk+EM2jowbt30kOenihKb6k+KtsxQIHC2jGQJfQqCqxdIwCuBJdWmsB62BFQvJCv2vf5zZePplveZrmT31F8ceLkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736582975; c=relaxed/simple;
	bh=F0rO7GwPFgCntxyY1X7jcmwB9CP2/KhEzeRrAmViSio=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uKyUBZNzT5UWhsl61LEo8V9n3vNpNJZjyUW4z1F2hn67N4nLyK4pjNAg22sNnjItyFxXFctY7tpbEloNfqLgv+voREdawcZ7naaQ+GlHcsAAJUS5/TicZT+VLf14/r/TC3PFbWrf4/OT1Kr9Ar17HrmsS1cMpcat9EUVahVfe7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=a4hBhPfe; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2eec9b3a1bbso3819535a91.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Jan 2025 00:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1736582974; x=1737187774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cJyTaiY5yPtcoRWlc3FY2KSATmJJUKLyen9MIhS791E=;
        b=a4hBhPfePpTcU2JBDFgBTZ187wwLTHg4ZbJKHp9MTPTvyN9uQP6GIe70ZWxOEyWhrF
         8e8vj7l2f+r8cZZnUfnxHrDCEQMqFtM06JsGpKhHe++NYaXARy4DsWTYJF8ru/zgx2bP
         gq5qbYZHRnbfM2fqs/YVVB9IxP8WoG1KN8gpV1SMTo1mNH5e7RjXn/TI0kfMESbfadPP
         yPuYXyFKt9lDqfeFNlkn703Wcc24CEQFt8XRy90zqIJ8JPEGMMSeT+h9qFJSwNSJcyMN
         qkN330yoHfwf2IF+M7bwAfeq3zjXUKLwlNzkk5KG9IFwnU85ZtDV1IRmEj2y/QXjpmgK
         VcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736582974; x=1737187774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cJyTaiY5yPtcoRWlc3FY2KSATmJJUKLyen9MIhS791E=;
        b=uEfcLnhzYguhxX8OB1BLT2ghGrvACj3OuwqJBmDSP5yLvJR265SlDj9sx5Pt7GVshI
         juII5CcYxJVXaGcRXnpgzU1sPi1StL5NLltNGy+Wxfraz9dDJIrONkMXK0hpAzUOaosQ
         +YhejL5d46zyqquVKVW/2DXSjrtxwAuG2r9bNeqy06Wzhc8N4azqwMgSEcA5c7PkxXnX
         0ScGiksuuQ86Y4fkea4nL6OOzmk4hLp44e+pgQO2jrimqsZEYTPgMJFi/6TnKbcTL7aL
         yx5ap9L1/xfZc5rbmok6612W7/UDDTgGowatj9bVzaNSwM3rXDYpG0Di2JI05snZ7PgA
         4dbA==
X-Gm-Message-State: AOJu0Yy9PUlqqd5rLACilM9WVgf0CZPuHmnQdaSzG90Al70QGs8f40k4
	todVTa3xf8LO559CMqwpbcyioXqqHkyhCkc7LScQ5+qXOQ4K3jb68e21rMxV
X-Gm-Gg: ASbGnctArfIIDxZFwc8WCycFsFlnsdc4V9McPvUEPqG8rfITODAlesctTvBnsm2MEKN
	u8roDG8sDE7gvnWa2F/VON4nRcogzzc9yi+xA6h8Av7MN5+G9HWj7jxJcyMOBHUYzuBmcYnK5RN
	aWtRQFaLep0pmiGG+C6uIgI4oQ4iJPFayjJmKf/GWGjhv+270T9VVCI8begln2qYFdEYruSzzbI
	1w21khZkPin9CRjzcj0zBOuOJgim9eTh49Ur2U5mRzgqILdCn7sAIzAYA==
X-Google-Smtp-Source: AGHT+IF+bZKCKcfLHldyX72tIsAR7fkbo+/YIv2jnNBkzrTu4tO7/zKc2r24g6W/gKjkD/1onhfM/g==
X-Received: by 2002:a17:90b:2e41:b0:2ee:96a5:721e with SMTP id 98e67ed59e1d1-2f548eb25cfmr24097314a91.12.1736582973897;
        Sat, 11 Jan 2025 00:09:33 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:aeaa:a1da:95e3:2274])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f55942eed5sm4415937a91.27.2025.01.11.00.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 00:09:33 -0800 (PST)
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
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 3/4] dt-bindings: soc: renesas: Document Yuridenki-Shokai Kakip board
Date: Sat, 11 Jan 2025 17:09:02 +0900
Message-ID: <20250111080903.3566296-4-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250111080903.3566296-1-iwamatsu@nigauri.org>
References: <20250111080903.3566296-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add "yuridenki,kakip" which targets the Yuridenki-Shokai Kakip board.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 4f2645e8140c5c..294ac7c7ae8a5d 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -548,6 +548,7 @@ properties:
         items:
           - enum:
               - renesas,rzv2h-evk # RZ/V2H EVK
+              - yuridenki,kakip # Yuridenki-Shokai RZ/V2H Kakip board
           - enum:
               - renesas,r9a09g057h41 # RZ/V2H
               - renesas,r9a09g057h42 # RZ/V2H with Mali-G31 support
-- 
2.45.2


