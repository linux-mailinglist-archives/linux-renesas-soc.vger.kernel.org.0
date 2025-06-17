Return-Path: <linux-renesas-soc+bounces-18468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8147BADD76F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 18:44:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B32E53B2165
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 16:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A323285057;
	Tue, 17 Jun 2025 16:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W1ELNsYP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA962F94A0;
	Tue, 17 Jun 2025 16:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750177695; cv=none; b=l7oYUWoNXiq5XC/6U+lz/cb5Uo/GE4KGe8WqUYAxqBkDg+Xf8GbaS857d7r2VQYdHy+xueYgb9mWEaR1rkr0WymCT3m1rcmKnhj/OeE/1mrIuPpLIp9QWKITVAyM8lw9JfQi86u36Qp7R4Ydo73C4ZcpeFFv7IaL/az80Zec1m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750177695; c=relaxed/simple;
	bh=WPq3JWpj4T0LLXcgwGZDa4XJ695aFvFYkWFLEZeOlQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f1J5GQ8uiWOxpEKkyTwyLcos6032iFkh9FoXcT1s0SgP2kABJB5Fnq8l1O/OkXBH+0Ypk7GSE8qZtp4r+nY3yBo/Oxlbry0Ryr8RyeAL3XaVY0gToFs05Hi0190pjqlSHbwjggvrGzU691eHduJ8pFdknhGxbtJ6pQLSp5BbgW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W1ELNsYP; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso27948125e9.0;
        Tue, 17 Jun 2025 09:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750177692; x=1750782492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CeAjYWHmPLh9Hw9EMkec3T/WAZXs6LJVpGmHJAJzDVk=;
        b=W1ELNsYPiyC2pWVurfkOOPDURMXwsZP6n0iNF9ylGfZtw4Ez9kwGI1BUr02Pr4Dgzy
         YgTFXMe6rNShYx2WbZK2PZ79ghQRtlwWboBzru3MrZ76iDf/U5oNEudKgOI+At0MwiSm
         Zs72uZYPCfGzwUuMbeysYqx5FFOqLEMQ/HeqMGUPFqSTV0Hey7OoseWTgNlcT2gJoAsj
         HCw9z+xBimrZE7FwSX4eBPIFwCP1/Xt4meqiXVjP4/P/7wxuSm9tUQphlv3MEIy7Y4du
         h7YtZFKpvXGJqp6oIP+I0Qw7JuCvAvSe5eL0U2JlZIN8Pm1GKFeDQGFfH6StMoeQCHfj
         zHwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750177692; x=1750782492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CeAjYWHmPLh9Hw9EMkec3T/WAZXs6LJVpGmHJAJzDVk=;
        b=WDAH0IIZtRs3MzCxO5PHDtNNZ7qFMoUlbOVfXlFEtaUc20RFLKDDsrNaRDOEOC+n71
         Ln+CELvLE+QfRVsMsebVFrupDGKOiZPwqvRZqbNkpvdtHE3YKnFvwzoSEoTxU3Q3L71p
         gKYFFA/m6SoXHTvDLyYRVVgqsxPuni0u5HsWymhSTQaZ9AFQLmTrnwLHjNglKYhFLUEk
         Rip759kkL1FoSYNpF1Tk562B6p8S9tDo6rhj/O6cMGJ3Ffcs6gHaK+CMMs+yYAKEsv0e
         WhueQhDKa+a+GFaZPPAJV95Mi8kh+H7A8y8v8NlUvkkt2rYA145XhY7FMoQbtJw91ciV
         zyZw==
X-Forwarded-Encrypted: i=1; AJvYcCVEGRE2d30YzBXmKoJoJ4qxwjB/+oY18rlHMMerkgPWtT28ITSmiifCAm2n5oNECmAdLJCZ8f2YTCkg226K8BPX39U=@vger.kernel.org, AJvYcCXvfe7TGxDvvq0MPuwqHoqI2Y6cBise6dyeEbiSDes/UP32HhHTkFxz1aImYnsCi8CLGVLobSIsYVvZ69M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6OKyAAOqeymfsUL0WcfwyuUQXkP963Zej0DnAWAdMx5WBfIdg
	StB+DJoihZ0ttEK3qCGpu/vveS/TSWv6MwLAVvVbFJSGKUIOAWjyG5md
X-Gm-Gg: ASbGncvmhChqKti94z6QYsxqg66pZinPmzZfTy1boN9sGb1HYFwZSYwuiPV1rjeivfa
	4wRT3LcH92H0bwEtsqa8qd0HEpi4Th41tnX/k+05fjnegvpRHEE1yXAhbIsv+Vyb5zL5VVXZQXZ
	0H4M7jQrHhPCNICy+8PERBCcF3RI+z96em64G3ti7vKOlIXe15BCEbhUjTWniEl9Jtjd1YBLdXk
	3GSrpFljCM1GmiIC+FS2Uu9s5c8vOul/193Ca3+hks5mQX54BNveqz0WpRPVUYnt7dKqGm4cMqY
	FYMs5xfVSi0GHsMXINTc99OOAJoTtv4TWvms0kuqJP0MsD7zJd3fo3MDgNsM2cNWqhb8UdjQ3YM
	D8gaAP0Dtmik=
X-Google-Smtp-Source: AGHT+IEmAZ4PHSs+Aq2RaFoqRSFIEGnoqReAjXOKg6nCw21gqFpnBoUSMqnAU4kIsFlf12e1mD7R0Q==
X-Received: by 2002:a05:600c:4e46:b0:450:d4a6:799d with SMTP id 5b1f17b1804b1-45350ba126dmr48631495e9.7.1750177691713;
        Tue, 17 Jun 2025 09:28:11 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a68b0esm14220831f8f.29.2025.06.17.09.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 09:28:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 0/2] Add initial support for Renesas RZ/T2H SoC and eval board
Date: Tue, 17 Jun 2025 17:28:08 +0100
Message-ID: <20250617162810.154332-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds initial support for the Renesas RZ/T2H SoC
and the RZ/T2H evaluation board.

Note: This patch series is split up from the original series [1] to make it
  easier to review.
[1] https://lore.kernel.org/all/20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com/

v10 -> v11:
- Rebased on latest linux-next.
- Updated model string in the RZ/T2H eval board dts file.
- Dropped GIC_CPU_MASK_SIMPLE from timer node
- Added hypervisor timer in timer node and added the missing interrupt-names
- Reordered the `extal_clk` node
- Reordered the `l3_ca55` node and renamed it to `L3_CA55` for consistency

Cheers,
Prabhakar

Thierry Bultel (2):
  arm64: dts: renesas: Add initial support for renesas RZ/T2H SoC
  arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board

 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi    | 124 ++++++++++++++++++
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  31 +++++
 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi |  13 ++
 4 files changed, 170 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi

-- 
2.49.0


