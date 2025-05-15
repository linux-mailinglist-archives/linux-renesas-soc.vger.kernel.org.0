Return-Path: <linux-renesas-soc+bounces-17148-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44185AB8F26
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 20:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B78D3A7BDB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 18:31:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FD05286410;
	Thu, 15 May 2025 18:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bmLDVnRQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A4528540F;
	Thu, 15 May 2025 18:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747333878; cv=none; b=Um8ZKmsRLuL2woFEABx595/OCppBT3axrUs4d5BWKg9suxYm+uioktDO9Ors7HCvTo5QGetbDmSKWLOQmvosj6KJvSzv1+ucpd7T4Yd47eWE8jnB3wPhQk81gOGFtJO5jYLjV/z19Y9z+n77ri2j/7GxVdCe1GLwR+dbzJ1T9FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747333878; c=relaxed/simple;
	bh=ijWd6Ng//qFQrFa7+MJ53Ncb5AIvYp4NmWE0i/aMyNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c8eGelYXYz8rNkdur0Puu32csb/Jnaad0ZeDNi6TncgoPgV2NDXZiVZdmGfX0/CwDVRDo0TUE+MD4e8KQJtYNQHnBq73doc3MwPd/cQRRpunxzTJu9jLa5c/NUrjGKnYImgD1hcaAFc54t1p0pLiGbtU/OvfPi5EWMQ2WwSE6fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bmLDVnRQ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a1b8e8b2b2so844963f8f.2;
        Thu, 15 May 2025 11:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747333875; x=1747938675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LR3LA4JPBUM6L45iQPdXfFH78cmZ1w4E7V1FUn5v1mo=;
        b=bmLDVnRQ3mmrsKHdteIg6NHuqiYMs6WXlhy71isVit6j2Mzuiky0mLoLjr2P3wkV0a
         EbOlHDwmnGySa5sprKb68KAVY6pJSEfOWMw8n+EySK1W9tUD0P/QvOVAf9HogRdW2INE
         gn0lqLWzreOOKA8wAo5jNgdVfJ5VXLC2mBMTXQbcBpA2I68YrPEbtlxA9SnteAXEdvfm
         SLyuGj6VrO6jioCGWshAAwLiZv4QPxPmQ3wWeXUxMWmIGOTyYy9k6OAs1D7y9wWZfCCG
         j3sDolmhnhEBok6AWujK2MLL+oJfUCzgT9TkiSic5v7opPWYlkgOqqpTMmgLMVDgNRs2
         askw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747333875; x=1747938675;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LR3LA4JPBUM6L45iQPdXfFH78cmZ1w4E7V1FUn5v1mo=;
        b=fgDAwccQ5TEXdU4qOooepbrbSBGd56tVlR+dhe0kx93Jw0PvaFOEdmdn46584eqmhK
         J1crDMS31BfGxqEuH34z0oK83XgLhUrDYKiirAm0jXNO23UcE+bbQbZLAgqbXLI1jkxg
         WAXwIHrZoBwiJRkARGN6J0x7sVLgdtDHnyG7ZbovUAg9keiv5IzC+G2NOy/lv5BLp9tU
         gDMQBoaJkIsO190Tn/I1GZ717Lf2SIhJU1/bPGPb1Flg4cfxH3IpCfRkzHC9C6QN6jdt
         VU0qc0vWk3RdKKVksaI/3T3nksT3cfRx8OO3N8LqaZG0ZX38MF636g+Ia2wiqM+eaW89
         ZVDA==
X-Forwarded-Encrypted: i=1; AJvYcCUyU505haW89ra3No2w4vBHuhcz6UoHSPe/ivelhs5L13wcgbLrfhZfHfYAkanXuHrNYBvKP5x64H7t@vger.kernel.org, AJvYcCVPDD7FauhCmjK5EYkC6be48deeF2Z8xBd63tv0QKBGUlOa2yGJucMfuONpDARrcaSW7PgAFZIThXO2dZ2Q@vger.kernel.org
X-Gm-Message-State: AOJu0YzOgbeevboFSnpIEpWVRKCaxLYTP/JAZdnKAAwKYgs0d1TTkXgo
	nC8p4mmTRR8EjXZfiOJt4qgpIzpWqvoszLWTHlTrY21yFBvz2lZXl7o5
X-Gm-Gg: ASbGncsUGs65T3vfWEqUXGQ4B7ZOrOsM4RL0Bjy9ztAx0puBEpIjRJ42Q+ICZsrn3uM
	1wsatD+Z6nuZWQfyeLe3Tw3bjWbMZOM/pwfoReBhbB1yCk2MIrHmo3fdemJEE0M5L1cjXraPQed
	M0d2bCF2gCqKpoHfKh1YuenmUIJ6LTw2KkbX6vtw6pdNbNyhDTA1PNJC58070A3Bva4H9CJ7oWe
	L4UESr6ZkthqMAqLZ33waAV8OkcMSHsLYesLMX5UUUus2wOvBSlCjBpvxdfyIgqv0n5y1L0sHVH
	1hyuB7wawH4P9Y7KvBXo5PVElp6snaMqWMbuA38NnDfeS0koKBIC0uLopq/ru9tBqJbsHV6Te4L
	VzWIPaIr3
X-Google-Smtp-Source: AGHT+IGvr63wbsoft19zXxsz+QChVFtVl4GoWkLaCeEiqo2Npzl231TJ6UXnb3FzGQ1hk+IBi6iysg==
X-Received: by 2002:a5d:5886:0:b0:3a0:b4fa:e594 with SMTP id ffacd0b85a97d-3a35c842a99mr751565f8f.33.1747333874604;
        Thu, 15 May 2025 11:31:14 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:7b5:b9aa:961b:d080])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d012sm262816f8f.94.2025.05.15.11.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:31:14 -0700 (PDT)
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
Subject: [PATCH 0/2] Add USB2.0 support for R9A09G057 SoC and RZ/V2H EVK
Date: Thu, 15 May 2025 19:31:02 +0100
Message-ID: <20250515183104.330964-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds USB2.0 support for the Renesas R9A09G057 SoC and
enables it on the RZ/V2H EVK board.
The first patch adds the USB2.0 support in the R9A09G057 SoC device tree
file, while the second patch enables the USB2.0 support in the RZ/V2H
EVK board device tree file.

Note, this patch series applies on top of the patch series [1] which adds
GBETH support for the R9A09G057 SoC and RZ/V2H EVK board.

[1] https://lore.kernel.org/all/20250513131412.253091-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057: Add USB2.0 support
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2.0 support

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 113 ++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  67 +++++++++++
 2 files changed, 180 insertions(+)

-- 
2.49.0


