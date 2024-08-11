Return-Path: <linux-renesas-soc+bounces-7792-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3788794E302
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 22:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26CAEB213CC
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 20:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAFA01537DB;
	Sun, 11 Aug 2024 20:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVOsk2m3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DB215C120;
	Sun, 11 Aug 2024 20:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723409414; cv=none; b=vENRNSBRCO6c57ZyADGN1W4EstzulbpXmYiEwpnd2rpg0kn144Y5S1Rcoe98Ymi7s6MQdXVHsYRwqxledyUKYvrP/MNvOX21qQLXwV2qGIV6ymRAwVstEvNv0UFYrYV4gEsVKz+qSlYRGNuOHzuWks78qzeXKwXvfnQYg+aHAhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723409414; c=relaxed/simple;
	bh=Y3Rt1DKKmYYCdiPVzga7f2YbCKphkD8g6/ODiOuRNZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sKucvwoIoI/38q2juuA3CiBPLqSwI2P/XXhzP9QbwI8dOJ8cGseosAZetLNZf+t/vTPW+140SVJb461wi6ZheoZG4Bzm98UvRckimwa1xE0ivSoehnZJn+wOniZkisp/+Ycxddm70D05PrYxGrnFPCMXjqDaf+3Wv0pFftiU4Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MVOsk2m3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42803bbf842so36299535e9.1;
        Sun, 11 Aug 2024 13:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723409411; x=1724014211; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kcgSlJ61ZKboNOX2w3un+qbRoIWDm1KIjcx7iwfcVs=;
        b=MVOsk2m3UC+08mQe20r1ZP9UbrPqIIQEHEXJHJ5L9sflbKsG2Mp3bG3+IzgmkRtYie
         JQHNm34rwipFlTJsLwkZKCUwbylqgbmA6dQGXok4Bwb99CbVIFjz22ojsG2O8U9ucm/I
         FJItVwUsgW3+Gqql4bIggoRpCxol8DwSgDXebpofbEJF71DeYJqhyuXsZYC8LccneWzB
         9lc/Nt+ealTIHvsfDhsRgmwj+6BFIoA+hQM/OG1KsDbJrNZkH61R+G3+NDE24bSrrSxy
         jw2fuJLqaHxtUluReRCJTY4H1gQIxEqx46edpa0CffvxZK+WfjvCQLvW8MloqXM33CGT
         +TFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723409411; x=1724014211;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1kcgSlJ61ZKboNOX2w3un+qbRoIWDm1KIjcx7iwfcVs=;
        b=rBOAq6UqV8eRWSq+CN13Cnak/turpzes2Ch0qbqusL6q09CHBcwU9HsTwbCndiV+HA
         NUYJXO1PHuQe+EV1ayuFMRYAXvURw1SzZqVh6SeT61CabAFB5f6/Apj+VzMfooVlePtA
         JaKoGoilo22I/f1t+7ohfhbt4YWX46/4LFT4xk/fqv5zLqMz046hEYmhVqMeD9v4gKgy
         s5c1gY1sJJS9RTp0a1Yhsl1zyrbdq0pTHsCXMXu6nBi4TllPgldUd988xhNjpgi7cpFq
         reQTGc/90JzYwgVcRZhwZZ6SOpfJCOBohco9HNqOdhK++Pe4MlyVzS4NCd/bzuRcPdUw
         4Yxw==
X-Forwarded-Encrypted: i=1; AJvYcCUj/WTNwvGxUhL2i8AME3AEHXfHAENHOgJwbl+pixtfid32668M3F8OY7AZ0Mm7U5DdxUnNKzj6k23wwmljc57igbs0y5l42WOFrw9hJChA0zPbU6A5ZT4l1vLk6vfPgsfBsWBvJZjzqg==
X-Gm-Message-State: AOJu0YzzHYKhkZHfUSJZfP6TbSZMKmQGvge7OIke4GZIZ3chrSDSUs+u
	NKE+wqzYT8fs8HpZsNNjcAM66Xc2f5U/oR6acz1TZg4072s9mwc7
X-Google-Smtp-Source: AGHT+IFGv5E71YRzOcAenQDOCa9XQrFIZRKLqcVNJx6Q50j2aypZnVhKJdfhtZechgXVRab84mmMLQ==
X-Received: by 2002:a05:600c:3b83:b0:426:5520:b835 with SMTP id 5b1f17b1804b1-429c3a179f8mr70784025e9.5.1723409410943;
        Sun, 11 Aug 2024 13:50:10 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c750f0absm76421845e9.17.2024.08.11.13.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 13:50:10 -0700 (PDT)
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
Subject: [PATCH v2 0/8] Add support for Renesas RZ/V2H(P) SoC and GP-EVK platform
Date: Sun, 11 Aug 2024 21:49:47 +0100
Message-Id: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 532 ++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-gp-evk.dts  | 256 +++++++++
 3 files changed, 790 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts

-- 
2.34.1


