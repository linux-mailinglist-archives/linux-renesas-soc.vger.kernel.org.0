Return-Path: <linux-renesas-soc+bounces-22745-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 85867BC154B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 14:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 744F14ED40B
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 12:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0C62DC764;
	Tue,  7 Oct 2025 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MGPmPdSd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BB435972
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Oct 2025 12:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759839336; cv=none; b=ZB0lYD3zbW4kSwqceR87g68r3p5VMpyhByJV3ZLWngHxRQqfm7G+XfAggJXMF8FLMUKt71ew3/WeSTsKXuLV+OCR+BzwpnyLgCXGYPmu2gSeXf0r4vLA0E+4einV8Mm5wC4WI6KpZIG74X8EFQ6F9Mhb4+chR3SfB1BKxF3yCYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759839336; c=relaxed/simple;
	bh=l8UYQaWjfRBhhGAhvqyoqXfPdBtbjNgkCwload90jNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NC4So4iDbz//uIrIGijIsL6fswt85h3qcf41AE9HR3fWin1omsW2YOk4Yxp1UXsEetCaBkHqldvpio+YM5Pd1mE5+HdlDKt3OW+o2cP+aUyllOi0+lhCBo6AJV8CZsyLq7eNU8qG1cjuKf5AeUqVNpZZfYICHpaAv/Ys2y3jbGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGPmPdSd; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee64bc6b90so3633101f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Oct 2025 05:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759839333; x=1760444133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKLr6oH8VAoG0UH+GQLCxeeRNxwcwp527osNwdWjiOI=;
        b=MGPmPdSd1Mk5NpNseKJ+MHfCLam5MSH+Vx7eHeYkZe77mduZaqmwaty13xGCSaOPxi
         DBif2ELYCfL14QVhM/dBFMMEX3BtfRICC3eYmIUu9bpzKoaMEatESUnzvXn9beXTk8tw
         GfSEAp9VtnSlY+4DFj5pIHKsqTPsHtGiPrx4YCnekx96A92TBaPdY1NdjD/0QN2pJd7W
         XYpOkYULStn/EDi1ipdFnHfb/iO7kd6P2yWgWUvPJmzcA9U71ZWa7IQAqDWnNzmcY8zC
         JZfquTLjkUcSc6xuzzgIS0McQXp7zJyHyavPlscMhvAsbi4p2OUKgXDBqsrMI+JCalMG
         pUZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759839333; x=1760444133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKLr6oH8VAoG0UH+GQLCxeeRNxwcwp527osNwdWjiOI=;
        b=SxGFL15YhSuVcDFrBru1x0EvwYyd8QZD4g6dTo9iCP7eCgXl5HBRokqF/wV0Pm5RG0
         wVLb1a4/BaltvJ7D6n8XdZu+9Po/lRbLvrintuUR8FSthH/gOe/YF3WzXOqaBzw4nF9c
         N3ya5KBDU1Ek5YS3LZN9pNyW54sD0RhzzgKLCkeBOMuJWmtYFIU/Ssdlm1fwPaM+JHR2
         J5wS3HPUR2F05uYLfH9hewTbHZVTVfANYGa2/wnBuuxPXtWMpDxnsWGi+pj1QVgCbMgO
         16Q5JDn7U1Wi/HJDfbwdc3qBpf7OF84BTHrTU0KTf2voNAC6pWsXQAd5UgcdOLCgHEJe
         1pPQ==
X-Gm-Message-State: AOJu0Yz6Qjtum/f9KifNbBcjmM7Ylp1mjGVKllAkgiGGvXhmSzvx6JbT
	4yrFHnGPrfYFke05qmbuD0g0gV0SZuv2SkLDoJ4xmGs10oEh6UkEaKps
X-Gm-Gg: ASbGnctjINg9V2Ekey9ILX69qN7DI2sZZWYsP+7gYkeFp+g2EHWeTBc1i9fIAoDKeg3
	NJC8nXE8KBGl8eoNpPHxiQ5MKMUCzroKXQR/X7mL+ZNUJsHmQr3m0sDEBbwQ0PlkoEgqtQL/tqS
	hzMSr67cArTuWnU9Voz0Wo6z0e4m1nOs8/CKvYBzLqPNF2JYopz02QFt52VG1FvVRJNXcUZ9uhd
	sOLKuxCxOjXjhMqMyPiw+hNKIF+l7BDlWu9DQs5Aj5+8WDgzKThDjIPgpku8jJkkN7w6T2zC0/e
	/s6ySz2pLeXH4yvEDJgJEW0eHZXLtTNBkMmtuZfODnMXFF5kVLLm8+DwuSh0PiqQDlrvYdGihGf
	jniB/BNEAgAqQqLgzNSif+7vEHFIBuwFXgN3VCtbgfyZ/kfpOUJejmUy5UaGMoDBgJObOZ92vZo
	zRZDjh
X-Google-Smtp-Source: AGHT+IFRZpCqbCKQWGG716LTQ5+C/G/AGcTxtPzPME1CZHim7uQVhN+zKqy+NF88Qi5nOvvJB7ONJA==
X-Received: by 2002:a05:6000:610:b0:3e7:5e19:5ec3 with SMTP id ffacd0b85a97d-425671a9067mr9556480f8f.41.1759839332887;
        Tue, 07 Oct 2025 05:15:32 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:9667:4f0f:586a:20c3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8a6e1bsm25590167f8f.8.2025.10.07.05.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:15:32 -0700 (PDT)
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
Subject: [PATCH 0/4] arm64: dts: renesas: Add Cortex-A55 PMU nodes for RZ/{N2H, V2H(P), V2N, T2H} SoCs
Date: Tue,  7 Oct 2025 13:15:04 +0100
Message-ID: <20251007121508.1595889-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds the PMU nodes for the Cortex-A55 cores on the
RZ/N2H (R9A09G087), RZ/T2H (R9A09G077), RZ/V2H(P) (R9A09G057) and RZ/V2N
(R9A09G056) SoCs.

Cheers,
Prabhakar

Lad Prabhakar (4):
  arm64: dts: renesas: r9a09g057: Add Cortex-A55 PMU node
  arm64: dts: renesas: r9a09g056: Add Cortex-A55 PMU node
  arm64: dts: renesas: r9a09g077: Add Cortex-A55 PMU node
  arm64: dts: renesas: r9a09g087: Add Cortex-A55 PMU node

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 5 +++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 5 +++++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 5 +++++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 5 +++++
 4 files changed, 20 insertions(+)

-- 
2.51.0


