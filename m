Return-Path: <linux-renesas-soc+bounces-25131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D18C87390
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 22:26:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6CA194E129B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 21:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C34592FB0BC;
	Tue, 25 Nov 2025 21:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hh8ERUM8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656312FAC0A
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 21:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764105993; cv=none; b=HnAfOEx+4PrzI/tN/rhGrk6VzAZq+RSrySLG3Jhw8vu9tEJcqnFnXhxQdcQsVOH7UrGNUhBLikPtWYivxQHnhDJWGIDfmSkrc6pDtfQ2yf4GIVDafiszEKZPVUv+pt+HAWFQWA2r0i0m8zNLlMK4jpyPAn1FglwdFIkdzSZQ0RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764105993; c=relaxed/simple;
	bh=77ztk+4qh7ZS6QbAc7V6wDs6rYUaAyd++plIusTMp3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GGyoY5Swb0TdWgq+DGLCT/dlJR8SfafUkfs6H3qi2+I+VSqipabZ/m3eFOWo0ZLeKSDrlADXgSyrGGYZ5sMQly7Q2PWva9atyb2IBnG1obzSgVL4w67yCJ37nn3rOb072Tj6C0aAL0/nLUprbRW+YafaHPi1/sNukAkQnHOAhZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hh8ERUM8; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso64299135e9.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 13:26:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764105990; x=1764710790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUIpmmh3zCHBkUgTRjkb7/r8Rtv5eeq4uS5BejYx488=;
        b=hh8ERUM8r0OCNqsJ/O+7OUEBfK0GqSAglDTT6wVTf2mW6O9jBO2PzRsFbJXQyrd4cY
         yyiiJTQlChwrcDici7LX7vk3z9Lg8lvduLIBwKVIp9vshOtERrSRd4q4IivuGl6E9RJB
         TCkiT6xQZ3vV2wPZbtCoZSmT/+pjp2u1A9ic4mwQIKzZspklrKgRVNM2XRXlU3hhp+F9
         I2+zoE2NNBujmar3w2rrllXN5cV8zeqEwUOfV5nSzRRhERWS+obZjIKodhbPaT9b9xdo
         RKZfI6LnqW4NTn6mqTNWIVEkOe0RBLJ1p6jfOogZBZ8TwzeWKWxAoj280n/xKOPHEezJ
         ZZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764105990; x=1764710790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aUIpmmh3zCHBkUgTRjkb7/r8Rtv5eeq4uS5BejYx488=;
        b=SjEte6I0OFR99381fUNcNjuCYD4KfzKV9lilFkwBLetyI+k5TCz6/8E4Jt7PVFMohm
         PZVvvdcTzOmIFsUTJJqrycOXfJ7HYWRXZWidcH+4yt/PAfHrkJZ6YwY6r+P4XGfTtmAI
         ptjybUUvF1GODjAoPhyWteZyVCFbdNyi0EdMw3+YccPk7Yl5PspG76c8v6mZmqVfPruk
         TzPMIVWFjhQapv/QnxNiJP87Qj+0Nga31pudikG/TfJ47ezf40yFeu3RzR/3y5DLilRb
         NZ/h2B/LqwHk66XNza3P16r/vONAbLuCaTJZDTg7Cnn9J0SIbsaLSP0eUHNuWXJ6lAbs
         E+OA==
X-Forwarded-Encrypted: i=1; AJvYcCVknLsUHVupMURNQWsvAlugBHGvN8I0ON3od2tx0c2NwhtU5K+xmadG55eP6gzWIBTcCfeXq8yLSB3vmPH4BMdSMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB5ULYLVHQxh3LZHHCNJ+AdXPY63MYL8jFkcvIM6UJ4oUW9f9R
	8Kp+NYMUy5Y5sJ9DFVwmgyBD3oc5x1kkCeeToaTVYCJzeXQZytwWDb4S
X-Gm-Gg: ASbGncu+onNi/qFR4StUcYWBWChkHlGYudoPdz3VKky8RnZMOkJvY9Vqy+tU77DbrJP
	jwzhTkbj1ltAgfdNkbfgUvXEiIbUiRFT5hgLGTJbintitWWY26Z3zsaJ+WB2GykxjuMu1BARgKm
	S8SeeUu7geOMLgViWYTfDZGk1S0JqsTZNZcmLH4d3tSdW9t0RRVfYhA9zuC8q62WaaU2njtPDdT
	xrTYzFY3XLLqpFh/PvZ2fQZBtdBtK1Gehn2UwsLLE+NIaYtb2Lr+TzgqI1/eMwnjhbQtO3Jjcjq
	yneFV6O72zx2PnziSdD4o+iMSZZwu7wSgSjnJcuifGYtA2/4pflUvoYmmmKtPJsrg+Pl1HIE+LI
	k4Tnd7zC9W4plFWleO2mPx/l5mPCC0Nh9Uv1z8O8i97A6kKNZDuKZSO/Wok0wnDS82WWsYKjEdk
	051VHjPPtyieTkZDCzUxIObOZZm9jnqAvnWQ==
X-Google-Smtp-Source: AGHT+IGINTwYKB3f6O0/4a/8uVo/WBSVTCjYyj22/LVPwO2J94ZGb1EjOdonlWG2c/DD+UhzBLngQA==
X-Received: by 2002:a05:600c:474a:b0:477:b0b9:3137 with SMTP id 5b1f17b1804b1-477c10c8886mr182927205e9.1.1764105989434;
        Tue, 25 Nov 2025 13:26:29 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc6220sm9606055e9.2.2025.11.25.13.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 13:26:28 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] dt-bindings: dma: rz-dmac: Document RZ/V2N SoC support
Date: Tue, 25 Nov 2025 21:26:21 +0000
Message-ID: <20251125212621.267397-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the DMA controller on the Renesas RZ/V2N SoC, which is
architecturally identical to the DMAC found on the RZ/V2H(P) SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
index f891cfcc48c7..d137b9cbaee9 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/renesas,rz-dmac.yaml
@@ -24,6 +24,7 @@ properties:
       - items:
           - enum:
               - renesas,r9a09g047-dmac # RZ/G3E
+              - renesas,r9a09g056-dmac # RZ/V2N
           - const: renesas,r9a09g057-dmac
 
       - const: renesas,r9a09g057-dmac # RZ/V2H(P)
-- 
2.52.0


