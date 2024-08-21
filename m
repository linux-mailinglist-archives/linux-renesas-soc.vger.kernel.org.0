Return-Path: <linux-renesas-soc+bounces-7967-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FD6959823
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 12:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E432C1C21A51
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 10:46:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40B5199950;
	Wed, 21 Aug 2024 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjPT9COB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAE41891D4;
	Wed, 21 Aug 2024 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230614; cv=none; b=b0ukYjpqYmYKXIuqEJpuK0H2im2NC6qsMTJG+HngiV1DqFnYOk/svCtpvEFyycqSq7dHRnXqNZvOdvyW0Wh4UftGy1hAqH9Hc4Kchabrv59VNXDNTtk658uN3xedrP3Xq4c0GIJoFmBbciDiSh2aOMETjSYb74gg/mac5FozFik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230614; c=relaxed/simple;
	bh=+qrmyz3t6t39/MGqtFC+n593EEO1T85UU2U5Re2/8aI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FiKL2cusUCtdOvVamAXkj6/yy3KbHG962d/VB/36S9XFsLHmYC9qbhrTIZi0pHXsKKbbuTIPODS50OzE1mMCDe0E7J7R2moYA7fyGTLvfmtCSix/mUxzrXkaSS8Z2gUOkwFhdz6Lz9Jn4jICEOYghxXq31JnYdvrFZPH12oDkWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjPT9COB; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8666734767so88849866b.1;
        Wed, 21 Aug 2024 01:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724230611; x=1724835411; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yEM7RP/Hk9n+gJ0v6cjOtsyp9pdbZJSVIsErHGj/bZE=;
        b=QjPT9COBWP8lwQfTAFa8j4PdvoofSKOZ0SIBSM1ebQkw724INd09t3OohDRA8XyGC/
         dnT1O4mNxydty7bLL5niwCZoDx5CDLTrhabgRS1f+sxv0h3Rz4HIO9GL39w4uabgjjJj
         a2lyHKfdQ37cL9a+M3o8TBonwNQ6yTU94jsaO4k17nuYi19XlygxD0FtMpt1v11epGXX
         iRhPVAXcjTv03jEN2kTrItIxqsJHYRyym1u+a2xGEywGVn5DdNKt0+GxhzMVclZEM/f7
         PA9Ps1gPJUjmEkxarpmzV5/3gKrqmKw5XerK7w/Oa3xKk6akqJo74kluZ5He+qx7Qy74
         ZJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230611; x=1724835411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yEM7RP/Hk9n+gJ0v6cjOtsyp9pdbZJSVIsErHGj/bZE=;
        b=oW869z+PmBPAX3OPRn1UV3qWl296S4DY3naUx3sEnTKCuwoKIdNzPpXZVGV0oGNvw1
         70W0eyFM2zipGH3wcmVNosav/eKZ5NyTE7xsg7lEnKM28tQfU7v/ySUEgpk1EZRxknTm
         /jFZze3gp6fIlLm6M+FUzIa32Wa7I2YA9LXh3pjRLqvkac5t2FzuZdVLf2VMXjLltM9R
         h3enI8CWrCGKZMjf4XbqQWkoNAHob+wRrWE36v1slb5pDTaXdsz8SfZaYihlXmOA7v0L
         p5L3EryerldbSMDxJkOVmDDp4l4Axv5P74tsakLIi1IyaNpCB/aKExab27tcmhXonWEB
         WnAg==
X-Forwarded-Encrypted: i=1; AJvYcCVf0VTI1bd3YWp01ibQQf8abgB/if1NAans8eCP1LmphMWEUEvl3FC5qjIHlG1GoKKpJaWNoDklGPhtGIup@vger.kernel.org, AJvYcCXPygy9Et/b0DZNAtOs2bM6XzZUzF9Cl4naR/bEFde2+jJV0zNR4n0R1yCOIlAZpVTZdJqPwB4cs210@vger.kernel.org
X-Gm-Message-State: AOJu0YyMx+UC/r0aWlhloFmqc4ttX75NUJFtgriruW24Pqu5xAYEzGVW
	fzNqq9+lQxKQi+g0xXz2czrMagpFG2ADSS7t1FycWKzHbxE+OlZqZSQ8P1Sd
X-Google-Smtp-Source: AGHT+IH75dxt4PnPyytfG53n1lowuk4MamTjj2Zjdi15Y+w6wcm1fupkJA8CSoO23IRcvbe6yFZ4cg==
X-Received: by 2002:a17:907:da7:b0:a77:deb2:8b01 with SMTP id a640c23a62f3a-a866f10cc8fmr112251166b.1.1724230610685;
        Wed, 21 Aug 2024 01:56:50 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:b9a9:40a4:353f:6481])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cf183sm873416266b.56.2024.08.21.01.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:56:50 -0700 (PDT)
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
Subject: [PATCH v3 0/8] Add support for Renesas RZ/V2H(P) SoC and GP-EVK platform
Date: Wed, 21 Aug 2024 09:56:36 +0100
Message-Id: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add initial support for Renesas RZ/V2H(P) SoC
and GP-EVK platform. Support for below peripherals is enabled on
RZ/V2H GP-EVK platform:
- RIIC
- OSTM
- SDHI
- WDT

patch #1 and #2 depends on
1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240724094707.569596-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

patch #3, #4, #5 and #7 depends on
1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240805193846.52416-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

patch #6 and #8 depends on
1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240805193846.52416-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
2] https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240806210623.183842-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (8):
  arm64: dts: renesas: Add initial SoC DTSI for RZ/V2H(P) SoC
  arm64: dts: renesas: Add initial DTS for RZ/V2H GP-EVK board
  arm64: dts: renesas: r9a09g057: Add OSTM0-OSTM7 nodes
  arm64: dts: renesas: r9a09g057: Add RIIC0-RIIC8 nodes
  arm64: dts: renesas: r9a09g057: Add SDHI0-SDHI2 nodes
  arm64: dts: renesas: r9a09g057: Add WDT0-WDT3 nodes
  arm64: dts: renesas: r9a09g057h44-gp-evk: Enable OSTM, I2C, and SDHI
  arm64: dts: renesas: r9a09g057h44-gp-evk: Enable watchdog

 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 523 ++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-gp-evk.dts  | 249 +++++++++
 3 files changed, 774 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts

-- 
2.34.1


