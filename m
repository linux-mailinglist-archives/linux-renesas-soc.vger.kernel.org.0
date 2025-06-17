Return-Path: <linux-renesas-soc+bounces-18473-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 70382ADDA83
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 19:23:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F74E165918
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 17:20:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953C7238D49;
	Tue, 17 Jun 2025 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxEJClBz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE41323815F;
	Tue, 17 Jun 2025 17:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750180802; cv=none; b=G53WRzfIGdxb7shxpmkTuYrNS6qiGIrEt7tulHQ/jfItI9x9DBhseoUAWTG1Jd6bTsRR1swyn+rEbuRtzQMxQBZ25Q958nVMpbaSmO5888oVPCp0EvFHdXd3qysfIdFh27ObFamGvhUSNg3FMFX36cdIwKrmNOUd/+O7qLdofxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750180802; c=relaxed/simple;
	bh=cKyV/mkD8jxvYKoynMzKj1qaBBdMAIab8NheaMVXBeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NICo5GhTrumBfVuzJfeO6aZ3u5qkC71edNqbWlGOJE/cjrpwXfQ/amm//5/h06Yx+snYykqadqwkV1q0XhZbifiiYV6sk06/7KForh+V0S+8imiSbuBDO8Cat5Cl0LMlpHMF97/ztoDKfsFXgcBGnM23S5Pn3gtY6RbQrvpYeoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxEJClBz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so10939705e9.1;
        Tue, 17 Jun 2025 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750180799; x=1750785599; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TDB6xMy7Iuc/iOQ4SrEQAS3H7+wQAGooH9bcJnPnMP0=;
        b=jxEJClBzIGBlD5Ci6SSsnJ2J0iFVXiCyghtYjvxYcXaAGbwAnVH07qsDBfV9qIhH1c
         DKJj6SkuI9Hq/eScanvJjADJHo/ME03ttFfpEGWCIzv6fUFp+rSEuoC3pW9RzX1qR0Lo
         VyjG+b178E5MDGb508Cml7Lv68mfUR4LSmvXzVkS1Ak1WEk3CI5e3LVIGpDxvUcjGr1P
         96Sd8ldJpEYH64+W8EFviUzmuLdRFYHiik0gYU7k+jUyAcdnDzTOPRgO9OqLr5v+qG36
         /GJTuxRBg8JcreJHooxRt0vGJMLKla/kdrJiIm/w2Q044uEvt4Ybf3+SJlTKZwvtqQuv
         RCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750180799; x=1750785599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TDB6xMy7Iuc/iOQ4SrEQAS3H7+wQAGooH9bcJnPnMP0=;
        b=OI7AkCHHGLDK1HjWL1NN6rkcNt6S3u8R01BkMzHk1gFkSA59iudDeAYiSdWToUoKVW
         MX4oFNOLhSfpT6FP0dRIno7rV3vZkbl4BFDTwigVtu0tjwAniSGdEWNFJx7bdqZANqL6
         x8B2oGlbX0Zh6Otl0SYWQ1D6+UZlxOIQlH/Dbecrh8QbTouZyiVCodL8wTFC+JmRWKNS
         mOmCp0aITclMKxk/YgOwK2Uc7SaqlJrX8Ba37oSnUUszrrkSONYbOevVlGKJB7WgTieO
         +VjaZXpIuwfWi7eJFAG9PgCmZt9w2KMnoyv/An83ASZ3JYdIvIhUlHnSmeGTuEHnoue3
         CRgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgoIbA5OfKGLJrpmSHN8Y2K6mN0Sik+jZr0fsb/KqCuf2xBlK67a/CrX2Dl5j1eylobG45vbbaxfHK@vger.kernel.org, AJvYcCWmooFolgMCOCwvwc+iP3pa0IfDdu/W+V+2AxaO04thSqLjXA069XpMF9cuuBAXxddcFBgSLullv6Oss/wN@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx/eeNDqtI4Vgtspo/HeAhdwtfkWTzmYjpb/gM1ZlNSmZKovpZ
	VmFeWPT2sfotz3rDvmPaXA+a48DGTKt9LRrdAT1a1jisKpjGpFqRp+ng
X-Gm-Gg: ASbGncuVfWgit9jlFF9wleW73i4zbAS3ORJNDsrzEnCztiyvLl2CgbuY9XJjYPzg64o
	i+BT7IpCmP+cY7EmPKLENpA9aHFazrD7MEJW/1NBTocB1VGKP4i2KPqn1GNmR1iNdnGqTyDY4I6
	NZRkMuKpKFQOzZWtmo0ORp7gyiGgKnyxSQCndpAoPE77itloMAlxYaV7oL8UvLYulhURVoQJ1aY
	ZxKOUhF66szvS2WEmnhTbBBm1qbYxA2wqRD01yt7j2z6bdi/S5JD8TwY1BuN0sVjlsJMkdmx4iV
	LJ1e0VAqwrQ/rucJnMlfL9KWq5amigqFtih2v+UZzQBymm4TRONSYXgUbh/TIuGoFqm010u8Y50
	2GCP6hiCWHMU=
X-Google-Smtp-Source: AGHT+IFtamchSoe+JsYZSVBoJ45sCIZrvI5qvxWHfGnUbY2XkMJPXkbLJvCegUnbM4ABtdh40jk+UQ==
X-Received: by 2002:a05:600c:5797:b0:453:9b3:5b58 with SMTP id 5b1f17b1804b1-4533b241110mr102705925e9.4.1750180798604;
        Tue, 17 Jun 2025 10:19:58 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25f207sm180875415e9.35.2025.06.17.10.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 10:19:58 -0700 (PDT)
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
Subject: [PATCH v2 0/4] Add initial support for RZ/N2H SoC and EVK
Date: Tue, 17 Jun 2025 18:19:53 +0100
Message-ID: <20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds initial support for the Renesas RZ/N2H SoC and
the RZ/N2H Evaluation Board (EVK). The series includes:
1. An initial SoC DTSI for the RZ/N2H SoC, which includes the basic
   configuration of the SoC blocks such as EXT CLKs, 4X CA55, SCIF,
   CPG, GIC, and ARMv8 Timer.
2. A new DTSI for the R9A09G087M44 variant of the RZ/N2H SoC, which
   features a 4-core configuration.
3. Refactoring of the RZ/T2H EVK device tree to extract common entries
   into a new file, `rzt2h-n2h-evk-common.dtsi`, to reduce
   duplication between the RZ/T2H and RZ/N2H EVK device trees.
4. An initial device tree for the RZ/N2H EVK, which includes
   the common entries from the previous step and sets up the board
   model and compatible strings.

Note,
- I've split up this patch from original series [1] to make it easier
  to review and apply.
- This patch series applied on top of the series [2].

[1] https://lore.kernel.org/all/20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
[2] https://lore.kernel.org/all/20250617162810.154332-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

v1->v2:
- Reordered the `l3_ca55` node and renamed it to `L3_CA55` for consistency
- Renamed the file to `rzt2h-n2h-evk-common.dtsi` to better reflect its
  purpose.
- Updated model string to "Renesas RZ/N2H EVK Board based on r9a09g087m44"
- Added reviewed-by tag from Geert

Cheers,
Prabhakar

Lad Prabhakar (1):
  arm64: dts: renesas: Add initial SoC DTSI for RZ/N2H SoC

Paul Barker (3):
  arm64: dts: renesas: Refactor RZ/T2H EVK device tree
  arm64: dts: renesas: Add DTSI for R9A09G087M44 variant of RZ/N2H SoC
  arm64: dts: renesas: Add initial support for RZ/N2H EVK

 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  17 +--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi    | 124 ++++++++++++++++++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  16 +++
 arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi |  13 ++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     |  24 ++++
 6 files changed, 180 insertions(+), 16 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi

-- 
2.49.0


