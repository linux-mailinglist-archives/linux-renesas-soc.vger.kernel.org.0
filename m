Return-Path: <linux-renesas-soc+bounces-7518-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0573D93C325
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 15:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E6E01C21136
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2024 13:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21B4619B3C1;
	Thu, 25 Jul 2024 13:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iUMFbeIa"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683B5199386;
	Thu, 25 Jul 2024 13:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721914878; cv=none; b=qMxNm1d0VnTZN/tsN4Wz3Y3P2x87jaU5TPlmB3O+5AvGJFlrOAOGZndlc45Q7obfQz4f5oIHPRyBiyGxzgVyHr6Cj8HZbg2I/HDYayhaqiVxyN7YSccnluVDeYEmg+/qco0pSYdqm1oDcIMzioTEHqVkmy3gpTne4f/04HCPqcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721914878; c=relaxed/simple;
	bh=jr8RkuofIrv2GpVTzr7VAquVKcbs6xxM9KiSEKIaXo0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bZTYGUdJVZfMC7w+X9Iy51mH6n8/V3K81q02p6JPVzM0pB0/p7DvcTbSZ5kmf0kdSg7qu/Ppmu6UzdV2dWA3ccgyZjxleBGGOVmVpob18yb2msjWmfEA6sFh8dDv4LCyAbnjoUnGqFYUOFUee81gvQhnVsjala2SzvqulEs6gOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iUMFbeIa; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2ef2c56d9dcso1754081fa.2;
        Thu, 25 Jul 2024 06:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721914874; x=1722519674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=de5NYmDZaWferNnERIlXiRqvJzYda1gY/qbCbtYlfX4=;
        b=iUMFbeIaz4Yn29UWis8K7yWqp0kzPyC6EH1ijC9sMEPFUGmnbB8UR5jfGIiMrwb355
         CdMWVbPgWC8rpt3w0k6m06vw4hYcFEe7lbrIx3uMmb+Uks3mVKHVwyuWm6j6Lj9PPjbb
         QTiGNYYQHC9UevJ/I9frAQq/LUQvGQqGFhAtoJu2lnn5dNoxHFzFuPOYJl7FSZzhlBYk
         w3lhhpYyGWfctVQ8v5vyYZBjfzQiYfSMWQhk+wuLNio6KzLHyHvqFyJNCrlL4DuRSWIC
         OZdmW37Jvt7wqt9/Lbnf7i+YvmL8nR9US7VS00HYkd7wXQpEa5t+3H1Ti2dLg+9XVWPJ
         k1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721914874; x=1722519674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=de5NYmDZaWferNnERIlXiRqvJzYda1gY/qbCbtYlfX4=;
        b=nJeKqNjW/jHmUTjKKGkQk+IkLE9M6Vay0TTZcMTSEaJHnxwC7rFAKuK+WZXXQtA477
         uWGaOop6HD8EAZLSyHiKYpw1E5a+Nj7cSTZsdakq+NAHlUKzEsVpX5rRFLDhph2uoRHg
         jBtxW1/5iftX2eN1LdXDpezmMYDfW9KrU/szXz1FWET6lejINAAUHQVGdD6WFSWAN/vK
         gDEOMm4KCPYSi601L4jSCO+FmjJFBRczmCgNiHxiGZNg3Py3vlSwFAI2eUE2VmIZhJEt
         6k1FYIPSEYqk0s1bECB6Y3Yp6wsQmih3CKRPZvwKBwi/HHS9bOw+0k+IZ4uww5sqAP0v
         3PSA==
X-Forwarded-Encrypted: i=1; AJvYcCWgdjy0+4vENsSz3388xsoEbmtgZQgJbdF8P8raT8bDAwAJjhjExodFXL0kxUuHF+1W8TTw7Y8s9SzLXz7kGkZ/2qNDatRikCbESsoyYJhBEEY2vP3C58e89g041PS1gcbc+8g/CNwN+w==
X-Gm-Message-State: AOJu0Yxi8/y4iZb1KbE296YVHznLOB1K+3wL+5Pb9HhuEa8rv6K14uZt
	so84tY2++rlQA5tJM+hRoNdT62xF/J0x15bguPNqJxd8GdILlUNY
X-Google-Smtp-Source: AGHT+IGsyr/fXTdxKDnOG3EpC6gEevKuJdCtQEbDGL8qpcFw5SHc+FK/ZI3El6lhwZG7ghaQ2swY7Q==
X-Received: by 2002:a2e:b55a:0:b0:2ef:2e8f:73e7 with SMTP id 38308e7fff4ca-2f03dbf2761mr13558691fa.47.1721914874118;
        Thu, 25 Jul 2024 06:41:14 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93e605esm80447085e9.34.2024.07.25.06.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jul 2024 06:41:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Zyngier <maz@kernel.org>,
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
Subject: [PATCH 0/5] arm64: dts: renesas: Correct GICD and GICR sizes
Date: Thu, 25 Jul 2024 14:39:27 +0100
Message-Id: <20240725133932.739936-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series aims to correct GICD and GICR sizes on RZ/G2L(LC),
RZ/G2UL, RZ/V2L and RZ/G3S SoCs. These SoCs are equipped with GIC-600.

Cheers,
Prabhakar

Lad Prabhakar (5):
  arm64: dts: renesas: r9a08g045: Correct GICD and GICR sizes
  arm64: dts: renesas: r9a07g043u: Correct GICD and GICR sizes
  arm64: dts: renesas: r9a07g054(l1): Correct GICD and GICR sizes
  arm64: dts: renesas: r9a07g044(l1): Correct GICD and GICR sizes
  arm64: dts: renesas: r9a07g044c1: Correct GICD and GICR sizes

 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi  | 4 ++--
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi   | 4 ++--
 arch/arm64/boot/dts/renesas/r9a07g044c1.dtsi | 5 +++++
 arch/arm64/boot/dts/renesas/r9a07g044l1.dtsi | 5 +++++
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi   | 4 ++--
 arch/arm64/boot/dts/renesas/r9a07g054l1.dtsi | 5 +++++
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi   | 4 ++--
 7 files changed, 23 insertions(+), 8 deletions(-)

-- 
2.34.1


