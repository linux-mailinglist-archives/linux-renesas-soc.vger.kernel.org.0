Return-Path: <linux-renesas-soc+bounces-19806-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A3FB17184
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 14:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04CDEA809DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 31 Jul 2025 12:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D42825B30D;
	Thu, 31 Jul 2025 12:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7fmbn7N"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD521E50E;
	Thu, 31 Jul 2025 12:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753966276; cv=none; b=A6uYSZX4mwY11mT1ntsOlXS9NZ38EQwp7RmC4dBCwOTCfMAL0izyulAQGCdZmMbLykUeJ2k2gQt68sto52IzW0psWBvDCNCF6iI8jEl/tMxKJcbXdYmDzL5iDMMdtaFXKimUEYdKIAsxdADjCX3kyW7KGMCszH0Op9Z6JxhCYqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753966276; c=relaxed/simple;
	bh=ZdzKQk8Cjgf3dwmmkTI777cKzfN7wzkNA2dlg6Ar404=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nD5KNU1hOIrua7SYX0C5m7H1aOR9QY5xhT++UewUJiYTOyHW/s6GR2IChZas8PGGh34fGOVnCn+ISR8LxNS9lBfmeDuZqMvDp6tyTiz0K9cet55ISkEtudn7C+Em/YAn2R7s0wxNJqA7KyyZKsLGJptUGN+vZtaaOWrHuYk5vDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7fmbn7N; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45600581226so9287925e9.1;
        Thu, 31 Jul 2025 05:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753966273; x=1754571073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sAusd1csE+JqzNXmIGkHQyt3KnqkABSFxq19868TVlE=;
        b=b7fmbn7N/GFaQ+l804bs0RLzjhkSh/qiakTF58Zker6Lj3SYDhy9VPL1bGbiRyDv7x
         h0VW7Ck6eAn6oHCoKHN2LVfuXPEGMB1e6fZdnyL2XC6YlTn/R/rl6lE5x9oF69drfA1L
         3MP4RWVXqk+m8eBO/vi6gkCVkxAEBEeTPtoNZxGvdqdiBta9b8dUx0a1jTaE/RyFy/Vv
         FliALcekGuMCxZz6LsAL3H1Y8PhE0W8URhmIZMp/t3SuNCoKGQh6q6GWH3bAcmoXH39E
         BZlKqYkoPUUsVQam6vuyF5IetUmSQBGeVm0qV8VoscCoKeCssTQmbCh0WAho4E13XhCN
         JgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753966273; x=1754571073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sAusd1csE+JqzNXmIGkHQyt3KnqkABSFxq19868TVlE=;
        b=XpfBCD//kMuQuJFouh1yHnX2zWwyXRzRiSp/T9nCDB9u/ii8LRR7WHU9ta8MXHbRAy
         QtC8nk5KI/wE1FZJgMPy3KyYzzhD+0ofrVO5mfzCz7+O0NnyN43AkS1YVB0fEEXtsf0F
         8LWjetKvaexfSWq99HVmvyFLB2b8zGF+aV+dB73w00uZTp6BifWBzHaiucefajSNgOIK
         2jFDBE/AE77UoqPw6B6s292gVksUpls9q6hpsxa8kL/IvdZ3aUPKNvMTjFkjLNaVek5G
         1Ejy8BT0OilHJcdmSfLvmjumhnhCLM1aIy2yc6ET2YHMl8mTzyk/LP0aqKKYHMzkx7bM
         2TOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6gYztK6h7xY7E0tYg8wo4WaaXeC3xsDHj0UhyQ9hpOB4b0Aq9uDUkGua66UaPqTXs2Ns8ZrvD+IODyPjOjGvqmBo=@vger.kernel.org, AJvYcCWDZMHkceogniPSxuYNhoR/V/7psK0Sf8w4OmTKsjA0DiLWyNI58r3uFczHIj5/Eiqz8QYfqRGpL9EGadrj@vger.kernel.org, AJvYcCWVEQPxWrhyy1Zup+KEAzx+JerJxGapY3DlWBJeM0ZcgIUvPU3lVjnO5aNVHK+Qf6s5ke+KFbF5d8L5@vger.kernel.org
X-Gm-Message-State: AOJu0YzYEOckrBFdlh6QGukqkNEYzuYk8IlEp4bbilFevm6mkl85gxz2
	YYigdHdBkV5x08pmT+QznbTdVjFdv6YwmCTwOwngmzjaoPXwEagwe2X09gUVe5nL9JI=
X-Gm-Gg: ASbGncsk3PPSuB0zbJaNEiyM+QWqRuHgE5lktUx+nZAvRHMv1+2p/ZetBsbUV1yzv+4
	Y1PLbMtJVGvBneH2Zz8XtLnaAaCc4hOkbqn9r7kpf6Z5h4daR0Un21OfBWKkmwli6mtjL+52INn
	e0v9p+BYFupKVj30aTI4uAUuf+W3SXCn1BR2y/+CGFrFnA9JcrwqR5Av96jHb9DNbtDl/PfcEsn
	2wfWj8gItKp5rmzLjI/gZOkyHllrxzldZdA+L37XeOuwa4LamYdP0gEihhSs+ZovgoIDV2RlVLj
	2EnO9uk907qth/AYmsbfFZkt5CEdyriFGrAqV8IhS3yaXmrexD5NrbQRu29qHlMWjskd6C++ESH
	80oZbJjo5cYWf26maTfgIJN1Wg7SrLhhgwqXRW5FfrnOe5Vm7akdCpYlbXnkmgtam9P+PsLD/rg
	==
X-Google-Smtp-Source: AGHT+IHcdqw0v9ZH1z1fU73BJc7m7fJ4V11JJS73y3UghDSWJasPPE4d4uv5/+ckuMXOQEwrQZe3+Q==
X-Received: by 2002:a05:600c:6299:b0:456:1442:854 with SMTP id 5b1f17b1804b1-4589c5e20aemr45592005e9.24.1753966272750;
        Thu, 31 Jul 2025 05:51:12 -0700 (PDT)
Received: from biju.lan (host31-53-6-191.range31-53.btcentralplus.com. [31.53.6.191])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589536acc9sm66977645e9.6.2025.07.31.05.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 05:51:12 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] arm64: dts: renesas: rzg2lc-smarc: Fix typo for deleting node
Date: Thu, 31 Jul 2025 13:51:06 +0100
Message-ID: <20250731125109.147422-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Fix typo for deleting node 'channel@0'->'channel0'.

Fixes: 46da632734a5 ("arm64: dts: renesas: rzg2lc-smarc: Enable CANFD channel 1")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index 345b779e4f60..382f6271cb29 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -48,7 +48,7 @@ sound_card {
 #if (SW_SCIF_CAN || SW_RSPI_CAN)
 &canfd {
 	pinctrl-0 = <&can1_pins>;
-	/delete-node/ channel@0;
+	/delete-node/ channel0;
 };
 #else
 &canfd {
-- 
2.43.0


