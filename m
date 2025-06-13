Return-Path: <linux-renesas-soc+bounces-18297-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B8596AD912E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 17:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0AD947AA28D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 15:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724561E5701;
	Fri, 13 Jun 2025 15:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kbrq/SBC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6281E520E;
	Fri, 13 Jun 2025 15:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828158; cv=none; b=eLKz9sn0d5knA/2ODFWFGv9CZRMr8jTCVMPno4BlCMs4HRD25TByeN6dMK4LvTI+jqA4tU2WJl199NWHopuR8wq6J04QSuYZ6H/VzZvUVafiHaBjuc5KVOw3s+xbS5cqtrtnIVaSlYcSgUkM8Hh52N10YDOyTpV2FV1yWDGqk3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828158; c=relaxed/simple;
	bh=QuAMBeGQ2NthxFN3VNjQFu2CXw1Za2z7CNe8cfsjUvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oBR/nemC2Nh/dISPMu52ZJbFoCdNSP1pGSHSa1x4NoHJ/bdrFuwDfnae+n2JUJUkvzFQAitFgDvgFLu3M7UH1FwHkjIi84Xc8Lv5WLrVewCdfGhcOue9V+I/hoNQstpdgm9AV6QzBCfQY+yY/KXdTYx3wLRoy/HBZTlXZXCFph4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kbrq/SBC; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so1836396f8f.2;
        Fri, 13 Jun 2025 08:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749828155; x=1750432955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BcIHFVQTMDuqvLaLkwl39PNnrWe/Owh65ZfOe5jO1Qc=;
        b=Kbrq/SBCrkcsibJ3HkslGAXlCnU/wVuAJ1m1C2wpcABGKsFIbJB05KUeqfpNp8THu5
         15kfWSzhXkdA4eiudxAJMnPvk4cMHuTdPQDVXf6/zSNIJKAsSqL5lyQaFcA0ts+3OyOh
         UMGMv/GE3EmR6189dKgQkIdhgYOzmIMB23rbopsqviF0w40neHElKxOC/bM/1dkGA53g
         C2HT/3RO/IU3cg00krqFJU4zSqK8/oQY18MamGD9IFxcGkOIAmnGwv2l5rG0HALpJSey
         X/DvOtHEZCy0ClrASpHdRrA54bi43VxBUTacfBjhwEWJyIzf6W6kPkhg5+6pM9amGKkg
         ht0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749828155; x=1750432955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BcIHFVQTMDuqvLaLkwl39PNnrWe/Owh65ZfOe5jO1Qc=;
        b=JYDJEhyhgUC7a5iQwAt34VvOfcbyRJ758CbXThjcm2rabTeBnKNXZvMBjzfbI+vG+6
         dFyO41ivB8UaYhrD4gY2PFIO53vymMq3nY1CvEB+/H6ci4PBQkr47D+SPUxpbFmI5Gow
         VNjDFvjAX3GCHTUtR9QV3lkGV7Q7iCjGBmQKV9Qpw/Tfqa08ThA923UmohPXdlAAZG7i
         gbcE6FLBFAxdq6YfGxh7U2aREifCIQF4AF4Fl/eqNfFMsO6wZH2OegP37t8mtbaD9WW1
         149KTRQQ2TtABqBz0PILXBPWIiKSEFl/07yN5Tz/J0t0P1BmrHZNP991VhbMOz3QDJAC
         8PJw==
X-Forwarded-Encrypted: i=1; AJvYcCWTt/yBBjgkL5UlE23s4hywvYzOggM/Eaj7VANwn4JN/6rsQs3OGcs976UbnRmaLM6kTD8FV1b7b4kK@vger.kernel.org, AJvYcCX148Cg8jkPZ+sdYjYmPNDDlYGCAF4AvVM/EVbqpqNiSUlrAkboz0UYsKy6CXBtGI5HaYjIfZlQN+XGBAgQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyrXyMwIkm8pln4tblaYtieq1jN8eQAIKRNacgO5U7SdbWxUheq
	LXxB7PoxufveLPNZybqGk86A4Sl09X5BODDvDJVWjw/0TZB5Fam23CXn
X-Gm-Gg: ASbGncsbX3G+UrBFQzaeuPKpxHZEHDSyOdzmXrs9XyIYHGPHJeoKUU8tIS/LkSrF+Y7
	uQBdmiXsRQNGnxWUc5BetxOrmSy5Pw45nKbdMZHOYHRUmQjk7NZWHTxwWmm2ve61d0ChuuZkOVn
	geWgeE56QM00qF9LUFu3nzrQFXIo2EhEhW/z5Wb16etv+DfTjRUbJD+WBdUGNrVVCBbI/Kl7OpV
	ZTDlj2OcXjRS23TsxTiluS1ls4Ui/kW2s9wOd+I2+DROqWAk58t1pAmy/H8GkpgPYXk5Aq/f18D
	D0W1EJCfRdx6lePQogQIg4wXyf6Ygrv6iuzrX4ccfCUgpMhN5Erq+s6EWNnWjQJb3zcD/8tlI8j
	jafd6X57PFQ==
X-Google-Smtp-Source: AGHT+IFc+ABLMNEaR+GPS5r6PHlTX/oTAK2MOjfw4O4/Zu8HnZlrHIlZ/Aboh6kvd4TWyPc2p32l3g==
X-Received: by 2002:a5d:5c84:0:b0:3a4:f55a:4ae2 with SMTP id ffacd0b85a97d-3a572e92c50mr97547f8f.50.1749828154726;
        Fri, 13 Jun 2025 08:22:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2c2d:5496:6768:592])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b71c15sm2617409f8f.95.2025.06.13.08.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:22:34 -0700 (PDT)
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
Subject: [PATCH] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Drop `bias-pull-up` from OVC pins
Date: Fri, 13 Jun 2025 16:22:16 +0100
Message-ID: <20250613152216.201957-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The USB20/21_OVRCUR pins on the RZ/V2H EVK has an external pull-up resistor
on the board. Therefore, the internal pull-up configuration via the
`bias-pull-up` property is redundant and should be removed.

Fixes: 7548897ad4ae3 ("arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2.0 support")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 36e9f39cd4e4..9819f691c7d4 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -658,7 +658,6 @@ sd1_cd {
 	usb20_pins: usb20 {
 		ovc {
 			pinmux =  <RZV2H_PORT_PINMUX(9, 6, 14)>; /* OVC */
-			bias-pull-up;
 		};
 
 		vbus {
@@ -669,7 +668,6 @@ vbus {
 	usb21_pins: usb21 {
 		ovc {
 			pinmux = <RZV2H_PORT_PINMUX(6, 7, 14)>; /* OVC */
-			bias-pull-up;
 		};
 
 		vbus {
-- 
2.49.0


