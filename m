Return-Path: <linux-renesas-soc+bounces-21961-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A9FB7DCEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 14:34:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 77E851BC5AEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Sep 2025 07:48:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D072DEA76;
	Wed, 17 Sep 2025 07:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NW/AeDVS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E221329AB13
	for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 07:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758095299; cv=none; b=TlMrAU07PvULNkwcsMs2V4jjiBNw+qhKztwfyDti1+wGdwyhR2pHstwnfPbmS+BgcKGDj6owkR4VrsibM3rqubKH9PItq0nZ79d9dg6AQHx0aMhGTyQKaL8xdo7/JIOr97hYTkVO92T1rk//JZSkgTbG/VfYGrS/vwpG/Za9tno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758095299; c=relaxed/simple;
	bh=q1jedH7VW832Xucv18MzkJx7Ax885UvbYtoCbR01+Do=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=pt3TnH49wWVSrNPJBkmmpY0x10ltzNMUtMazQKpdlQoeJz5bQ35L88nmxNQkJM1ARmGyb0QuW72JiejZ6HciyxLnuy8rydRMli2A5w90Or6PnhfNNZh3D6JccJTJ4FZFx4WQVs8YmUs2xg7mBJPaKBSUNx+vzEpV7l/d+siJEvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NW/AeDVS; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-26685d63201so28606615ad.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Sep 2025 00:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758095297; x=1758700097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1JKGCDIkSDMV2O6Pn5OGiCTad+ltyhYyD3CS3WAtyS8=;
        b=NW/AeDVSvPMv6HOvIrK7/W7P7L3+jrO7sitY2UPXELXTOuLM2BboZNmd9Zkqcmi5xi
         bm8ouAhXRD+LaN1bLbX7oOomFGe/g/0P5nJyHHdmJ0uko7SBMU0YNKSiAqFDOAUe2PP5
         4I0Jd+yYR5UumGUP9h7LNqQoeJTrUxgm3lKGG2E8VkTqjFcfv7XuAqYrWmkmtsJgJeTC
         68vfCixdtXmW6TRqy2Ey3uy5xAmvV6T0BFZplB1n/hheBI+Bq7+DJnT7KFuVurTrgB4Q
         WespxxB9x5gbaEKVyWxHl0481qGFQJn09vVItHqQu6VzpL8E4F7au5qlah1sCDYpecPx
         09dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758095297; x=1758700097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1JKGCDIkSDMV2O6Pn5OGiCTad+ltyhYyD3CS3WAtyS8=;
        b=Nd5z4dSgOcS37Bo0kbNlKlM3nnMzQgJI1BJzs+I8PB234wk57uyixGw+p5jEoMKNPf
         fKX+PIwpgeDZjJPr/znpz8jLkbMRlRyI4/i2fhf8BGB9rHCNbkxrqE0K6SaijEwchIkp
         W8PSAqMmq8Oy69gxlH6JPyABva/+zY5Wi4gH6kFpqA3bjbPTkt9SA4CqUzEEl9dLWY/o
         uarCJAKU26sWcemDVZJAeOBoQLuQLK31l4ghnKQjtWo1iiG0jcpZs1E12+Kr6rO1eBX3
         uKGWOOrrB5yGgfaHbMdeb5WPeKxeryAStQXhfc19MZ2hSryyMP32FgaSCvZR3RCChFKY
         EsMA==
X-Forwarded-Encrypted: i=1; AJvYcCXISfn1cOeOe5lDlTDUPuzOyMaRvM4TmOZyGsR/ZpNYpeAxYLzEqHJFC7UMPmwrY9tqetYEAw1M60ASw6POcuy48A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxASgzjoPc6SNltrSW735xPqD0wquIlrFkmSbklp6XbN+grIXOH
	NItGeR2umHE1mUzynRbTO01FQpB1ooS96Kp9HifkDLH6CDcwaPl8gfbY
X-Gm-Gg: ASbGncvogLLwCo0IkXHusZJktoP8MNkmXzSYK+PnjSfojK+cZ0cT5Pg2pAHVnwK8n/X
	2OCCDlyVskA7tUNGEhAzFV4/Cx8CDUWCr7suQGenkdL6Ts7aQSgifFZ/JdNWhin+IQGB4s7gH51
	ZqcMjJw3LYhstBs7PI95rNSsivBAAU3MsXzABFaDaOfUz3a5TsnfWmsCVJLNDWV9IqahtCBlwiC
	FgqiRvsUtr8jMtwdqDAOt+9NNCyiWMOYTLA3yy7hVZ7g/Ct9VWGV9RbOk2KGVHlyfwsgdvKN5KN
	ER2gWi0ms9ZqdpwmpCuHlCWIPo1kjYU2A3wDBI19aPR64oZ4eQPKsOOzGcP7A01jxlxf+CBcSMP
	R2OQW+bQ5gURxz0lopNzWUcpbZTImYAZP5Q3q2bZhpsn/1l40MhgMNTdIsqE+Rk806hBNiiSi0I
	HGCWOOmxIa+Qu3LLdgLzvnrvk15THzJno7ek07tPwTnQ==
X-Google-Smtp-Source: AGHT+IF3iFCqidqJcvK/xXuEBMbUNqvYtrcapIiOCibgP1M/29Qz0m2dsrVVMS/TbfoPK18iCzQjMg==
X-Received: by 2002:a17:903:19d0:b0:25c:25f1:542d with SMTP id d9443c01a7336-268137f2336mr13981925ad.36.1758095297176;
        Wed, 17 Sep 2025 00:48:17 -0700 (PDT)
Received: from meta-device (2001-b400-e359-6d3b-3881-d7b4-5e6b-c23a.emome-ip6.hinet.net. [2001:b400:e359:6d3b:3881:d7b4:5e6b:c23a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267df817ef5sm34796585ad.0.2025.09.17.00.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 00:48:16 -0700 (PDT)
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v1 0/2] Add Meta (Facebook) Yosemite5 BMC (AST2600)
Date: Wed, 17 Sep 2025 15:48:08 +0800
Message-ID: <20250917074812.4042797-1-kevin.tung.openbmc@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Summary:
Add device tree for the Meta (Facebook) Yosemite5 compute node,
based on the AST2600 BMC.

The Yosemite5 platform provides monitoring of voltages, power,
temperatures, and other critical parameters across the motherboard,
CXL board, E1.S expansion board, and NIC components. The BMC also
logs relevant events and performs appropriate system actions in
response to abnormal conditions.

Kevin Tung (2):
  dt-bindings: arm: aspeed: add Meta Yosemite5 board
  ARM: dts: aspeed: yosemite5: Add Meta Yosemite5 BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 .../aspeed/aspeed-bmc-facebook-yosemite5.dts  | 1063 +++++++++++++++++
 2 files changed, 1064 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite5.dts

-- 
2.47.1


