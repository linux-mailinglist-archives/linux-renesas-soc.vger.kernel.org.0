Return-Path: <linux-renesas-soc+bounces-16774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1F1AAE7EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 19:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 269351C27D33
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  7 May 2025 17:36:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2705C28CF4C;
	Wed,  7 May 2025 17:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGyn7Gyg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E32828CF44;
	Wed,  7 May 2025 17:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746639361; cv=none; b=MDvz5Vh38k2+UmUuIC390GjNr8bAFaxYvje4rYCvqfrjbvg/FC+mTg+aUDA4QnXD836Xz8e4TSKnDz0R1iTgtpuL4RfGekR6x6X7GHoDHMzzREecRlOMk+QH7NXxEsMEkusmCksOAvCr9GBW2zUKzjfzIzFA+kgXYRcLmaedSEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746639361; c=relaxed/simple;
	bh=c2ITjaoi4y/32y406ufleR0jKcFxlSQQI9/5RMCUp54=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ILzIgeCm3l8VpYSj+cJI/DuqwE9EfSAXpPxsvQviMzkYVE14LdiUOzUm/ZNcTiigre4L7s3fOA22s/VDWk97V9SYE1ME6AV+Y7tMuVUT6Zx1vmB6btFZ+7/llAOg17ZFg5tS/x92aesBNJBmKOtvw6LhGXrmNTk473X8enxj78k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGyn7Gyg; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so105958f8f.0;
        Wed, 07 May 2025 10:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746639357; x=1747244157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8fzoKFRxHrnQE/JG/vAropqBJ0/DVLBuAo0naIFD4s=;
        b=mGyn7GygYqCWS3SCxcSLDfdeZDpOSL3lDx8qJqQ1bmgRCilKahTG8IAJw7VS32KCAR
         8o88BF4tEBBgA3hMfUSNhUMG50gqifi+y2qwGspRZ+gc+UX9EVw4CdZURCfMIWdfEIlf
         GpL+/PDnnq3NCaNwdJh92nPbwEDi9hE++IrOrRxk9TwjFrfIK7HYcyigQdjNJoHbNPSJ
         2ZLKXtOnl6AfWQygriA/WktqowAlfgW14BaS8rbbSgW9FE64l9SZnbXcifPqqYmnbrhr
         POfSghHNUs6GCbvwc4keUZwBW1VLRrRn+MyvxKUxO+C9R66437K1Yn3KXLjvtcJtW5E6
         Kasw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746639357; x=1747244157;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B8fzoKFRxHrnQE/JG/vAropqBJ0/DVLBuAo0naIFD4s=;
        b=fu75qra58uDDH5llVJ/EJ/rNK7x+QmOw6HosMdrit0drnyBZz7Pe9sc8kI6hB6oh3u
         KOOTO9RN33BphFVv1XvwVcsqLVA1uhb3HU7PpeA2Niffdr8CzPzEDW+r5cVBG1J6b/Nz
         cawOG8Q5DVCQc9ScSyqnDxy2vkkp89e0p3wuK9dUrhhhkRmYb+P8uA7YlwI6FG+fTZNl
         pCU0dCcGiC8LrH9TG+2h+cMqAElXofXEpFgatdT3hlHIpjgsZ7TmVB8rYeM2hSJq3+Nm
         LotnFdw1y/8OvaqEwHdRBTxac1OXSUqTDMiQduydvIGMjl8Luu4wGcMMqjGBBbgMI56J
         pPag==
X-Forwarded-Encrypted: i=1; AJvYcCUyoNwgCYLFYMO6jSMDNPR2ZH+T67sJqYH65ANDx83yaBkeW0zi8ydmuwBZ9vSHr/ijUzz84QXgplIu65zo@vger.kernel.org, AJvYcCX6YG5N/RcLLskirkNVRdE5RuRC/UXoBfLah2FxCM3N1s0P9hssnliNhzKr9jCsjincME70gj+U/IL0@vger.kernel.org, AJvYcCXbiLEtkSOUh0BiZrdp/HTlIhI45KTOoe+k1U44El7zOq4A23lg/eJlmEkexb7HJI5SvJcgi+UWG4b8y3QnZkO8wOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLaqSR3UfVW27I619/BBh7UHravBTGLvu5xkiuVAbx9qoYy+M2
	62//7fQ6TlGXdaYVe5/KJCoPknlwSLtPhwaFIZW1qD8IcmnBTKak
X-Gm-Gg: ASbGncsg1cGyBldAs/0OnvjnHpLNaoPHrfFkqNf31fBMq/OVtcDUhwNjAclTuyC2XY9
	5IT8C0V1QrEM4hMChA/LAv7WEEtBYrXSIq98AN3+qgnqh2daOAUB6I7lFh+CTn4s5O5OZ6jpi4X
	eSod2/sNaLvPBuQmeCzXdC5DF3ji/CRrIPBqjY8FteBqtBxikEnUjW7qn4Y+b89qkRY9zgJE/vq
	vgw6g8y+UUgcrZUvdFkGq3VJPk30RFldDqkOQr3lhsfHOeiA9CzR6cXHBnxTSElo2J2Hp/mV78t
	evChs/oafQY2z7llV1x/JqgtqEX+dcz4059uEqzaURJpdLUTaJ9qsIM7VoqokRNeozK54XaPzA=
	=
X-Google-Smtp-Source: AGHT+IHJVgnGCHmje37RoGJbHVlOZy0cJJZ5JHLe9pV9lbIp7XqZR/JsVQTP913wHvAw6Cy3+JwSPQ==
X-Received: by 2002:a5d:64ac:0:b0:3a0:ad15:440f with SMTP id ffacd0b85a97d-3a0b4a03705mr3258354f8f.8.1746639357307;
        Wed, 07 May 2025 10:35:57 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:2b0e:e807:48d:720a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b7e44397sm1140401f8f.49.2025.05.07.10.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 10:35:56 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next] dt-bindings: net: renesas-gbeth: Add support for RZ/V2N (R9A09G056) SoC
Date: Wed,  7 May 2025 18:35:50 +0100
Message-ID: <20250507173551.100280-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document support for the GBETH IP found on the Renesas RZ/V2N (R9A09G056)
SoC. The GBETH controller on the RZ/V2N SoC is functionally identical to
the one found on the RZ/V2H(P) (R9A09G057) SoC, so `renesas,rzv2h-gbeth`
will be used as a fallback compatible.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
index 02a6793c26f5..c498a9999289 100644
--- a/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,r9a09g057-gbeth.yaml
@@ -14,6 +14,7 @@ select:
     compatible:
       contains:
         enum:
+          - renesas,r9a09g056-gbeth
           - renesas,r9a09g057-gbeth
           - renesas,rzv2h-gbeth
   required:
@@ -23,6 +24,7 @@ properties:
   compatible:
     items:
       - enum:
+          - renesas,r9a09g056-gbeth # RZ/V2N
           - renesas,r9a09g057-gbeth # RZ/V2H(P)
       - const: renesas,rzv2h-gbeth
       - const: snps,dwmac-5.20
-- 
2.49.0


