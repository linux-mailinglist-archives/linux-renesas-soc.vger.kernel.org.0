Return-Path: <linux-renesas-soc+bounces-16429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C09D5A9FADA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 22:55:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E07907AE9FE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 20:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6728C1FCFEF;
	Mon, 28 Apr 2025 20:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnCerkLt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77181F872D;
	Mon, 28 Apr 2025 20:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873724; cv=none; b=SJIUuTor1aSlrEEJ8Urrc9Y3AcEJViyr9F6+LcBFpwhlgTlg0FgRImNbxr6d4RWTJN/mOKKGCHB97A8QSi+GneK/BaaYe3O9nqtB5v9EguxF+SVIpXANCTHl8get0HCvISnSYcHqNhpOK6grPpH0ejjkDP3DHTpTCEwcjScpTmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873724; c=relaxed/simple;
	bh=ltL3SC6vgqvw+mTFy6XzH606wThpLgVF1QkPua9Q05g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YYwaUW3XJ5ZUjEfcuzBZjBIV1vbBrz9glPOF8f5NCWT00Ub6lIIzkoAIhQS6ff90yz+s3tT75Ohen690mnAYuAX413+oLkjsar/+TAxWMPBVYJshxV1aL9vPLAksUGQ6ONWjYUakWjFAmMvpCNp0ZX4ALPFBCULMloCZ/jCTZSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnCerkLt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0618746bso38187315e9.2;
        Mon, 28 Apr 2025 13:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873721; x=1746478521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6fy2puMqHyoR2LexAIS0r+i6b4fHCMlaARoqaMiOYs=;
        b=gnCerkLtIAkI8T0pfCtsUvgggg1R44szMABY7h8F6yASYgB11jKYhkeqVMJ31es85N
         ZfAsBJrCZoMgX/XeBqqjUVIb3OLI7+ek2DS9aa20hB1wEyxfu6mQTSCIjT084aTyFaLE
         3TxkN7YoIawpboXVJz3LYiNTm0z6Se9VrOYlBEZTGYqx95IXbj0ewKy9siJA6kFsrBYh
         ruBm8iMf8Ryf61YhlP5bjX7rcDCtFVo1AsR5bklnp2RUvCk2GNmkjDD16Nz5oIRZemlB
         PodhM8DGtvgvCKFt1SLjYwwOUVZLXq+XiFje+PHoAFvN+msxyuSvMRMccxZI0QHF0Mz9
         Hh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873721; x=1746478521;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a6fy2puMqHyoR2LexAIS0r+i6b4fHCMlaARoqaMiOYs=;
        b=g1u7Tpk2kcMKPShh3xaubqZWBBM+iIGG1rwv1PpJtH7GVFKQyTd/OpQTjuvSrH+L2B
         vr5TOlvwrV92rLappy6Gj8u86y6layNIF/t8dTYKV3QTu8V014SWlMFD/+U1wflkcrCi
         UHQuzzlKCDP0yzGMZRIyYI9K6kczD2SWdi7m9CqV6m92MkoQxwtG4uMhaWCW2hJFmznv
         VcB6JvxRe+MuT+yAU711lYyzyUP8olcJBS15UG5pwAP0Z1vwEaHnq5XU83ugixYsCE7x
         MAwaqCVgG+DCjo3zFGByLbUOYwBzTKbs/kK8nQ6dn+pwtZ9Z++Gqe+jK7ghgrqU1cL/S
         CMDg==
X-Forwarded-Encrypted: i=1; AJvYcCUPzdjeNweoqfR3VtlcmG3v/6rzv2ojfh/7WLjiih200dahl+SIe2ahxZuuLzFZj4O9lQUmsYx2Fz5beD1U@vger.kernel.org, AJvYcCUlCM4QtLFh7/ZZSY4BP62QQAhoBcRrkVzAPKH6n25kKIUmlGlFXVwP3SzpxV6Ok+mUA3sPanCTb3Lm@vger.kernel.org
X-Gm-Message-State: AOJu0Yzkas/odYKIf2d9ZCkIMKIQUcgA1RQV0pYhqjQ65MbUBvecHJoz
	z1CVNiNySgkcaM3uXUUn9RPwYfd0PZNLoR0aGX+0TGqUkTEtzFsa
X-Gm-Gg: ASbGncuUQFfntYnxBdehoUtozZe8oK18PKq9FQHEKrzERdFcOebaTIdqWGLgEgWBUnK
	WMIpXvrI6Xoi4a+velqOVl0KOkGu8o3oekdlZSO5ELFchY4bolay/+99pw9edRPLVU6ZRTFqgxC
	XSWiK6m04J226MRDRSkelbABfgUNQnFdcfDzRNc+9Q+dbvakpRLS6KXLI6m6dkwqbjsAQkmWaW+
	ZKeueNgu8Uo/P8a5IJr0Ruwuv/SOzAmRdec5N5ZqWaAXgAtercTEuhicvFXbBywdRGtLPN+Xm2a
	4PHIskvOxEJcXtgp+WbS3W9aD3T9KT2/wTdnJbmgBS5Jeabwp8b9BVzfBH53+lIFftR8tUB7mMl
	viOa7Rk7O
X-Google-Smtp-Source: AGHT+IFHuGQl+j5YvF+ujgm9jlwrfc7iOfKhcltpvYOoKk9pNyl+RdoSKQ3LwBJ1m4F+uwR1+1NhlA==
X-Received: by 2002:a05:600c:4688:b0:43c:f61e:6ea8 with SMTP id 5b1f17b1804b1-440ab780bfcmr94821645e9.2.1745873720683;
        Mon, 28 Apr 2025 13:55:20 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:593b:8313:b361:2f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2ac0sm167845705e9.15.2025.04.28.13.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:55:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2]  arm64: dts: renesas: Add GBETH support to R9A09G057 SoC
Date: Mon, 28 Apr 2025 21:55:16 +0100
Message-ID: <20250428205518.454960-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the GBETH (Gigabit Ethernet) IP block
to the R9A09G057 SoC. The first patch adds the GBETH nodes to the
device tree source file for the R9A09G057 SoC, while the second patch
enables the GBETH nodes on the RZ/V2H Evaluation Kit.

Note,
- The GBETH driver is already merged into net-next
- This patch series is dependent on the following patch series:
  https://lore.kernel.org/lkml/20250428184152.428908-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057: Add GBETH nodes
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable GBETH

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 194 ++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  74 +++++++
 2 files changed, 268 insertions(+)

-- 
2.49.0


