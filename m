Return-Path: <linux-renesas-soc+bounces-21361-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16469B443C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 18:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2951C86558
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 16:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C87A92DD60E;
	Thu,  4 Sep 2025 16:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dga4DLc0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009D7212576;
	Thu,  4 Sep 2025 16:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757005155; cv=none; b=GU8tt1211yRDtDj6X7gCVSNBGawm8mJKrYHdnr64ERPjxi5qUf0W0kLptwtVBFLH1IJKuleeNLiTMTho8mFNXK4ni7isekbnGX8ASGPuXKLaQ/yqHmXEBeBAYRqWULHceloTi/bowqoqAA1W0qTHkdrJ3euNMXlnQzakFORwK0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757005155; c=relaxed/simple;
	bh=kHQTIB9PpQjtEaFO8B7Lx9rKPfE2yIvxKj21x7/oTu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EyWnT9DJa5VXl1LonTN1D7opNl9AsurGaOXtIWbKI4D5dYYA/EjXrzusNDWeV0sbudaMMIAvKBQyQTlHGSTQXdsacJm0RoeUHqAvrAVGm9yvSQnJ/DqijCfTDMC0rGMD6AtvYvHEcTaO2MBcg+epYYzYSlGRugsff6x9c8ERv3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dga4DLc0; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so967709f8f.3;
        Thu, 04 Sep 2025 09:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757005152; x=1757609952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FWZVGCMARJlCDcII5CNhWEQ7D8U03ixO3C2d6Md+0Pw=;
        b=Dga4DLc0wJp47erOwyFVX+MzCAEvMRsw/Y+rWhV6ISRL8dYCen6ghCJhwocxwqITk3
         SXFm9yIp6Q0dIqZ9/HsQ5BYb4R7h8BBxT2ipa6jdAdyVt90ym71j84b0AvwGrCkQoRxS
         p6e5U+/mHP/RBN9zihKyPQBL11BkiZzS+qrEwmRYcjOcSa7qMpD23msMBV7z1MLTcjsF
         WBp+w9veUKkR/4mkSXifcZCpOS7DERbtiO1r4CQh3K7XpjD9v0wFlqIlDUc+q7HOU6li
         C2ottmWcB0rxXeUmnc3gh91YlJH9lEoaT7wzMZ7f9wDIdPA/dAOGsKipNyRrXU3eoZ5m
         jGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757005152; x=1757609952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWZVGCMARJlCDcII5CNhWEQ7D8U03ixO3C2d6Md+0Pw=;
        b=a8+Qcvkib8GbBw7gemE9J85RjA1xWLaKVCFI6QNcYnCTfg2YWWzqOIh4WmbYbRQM7P
         YAxjCCMm1Dt/1OFPwnQYf8aCdvcrFJmTEQxS6xtyIL5fhQj1jgTpP1Np7UF3jSJcjDf9
         63KJEYHxC3JqPL1PuuIcFW/8WxYbDRBP0RvRgzLQHyyRuC31Bpw5QG4r6LxTAqsdsHIE
         ZXbqC4whMt8kPqBw25IWzZdOge3WqZc7NodcduN2BbDSMdKH9zK5nWr8P04PrTZKHU8T
         QXn9RacFGt3SBzLDfrExmq9hyi+FqeJAyOp/jSRFbTahW4JhVdM9wxPYPJD+aFX57C8F
         OAIg==
X-Forwarded-Encrypted: i=1; AJvYcCWoGw67b1eEE1eEqO+AQZzwiW0R/7iu453iZIknRhJpupJM90iuzCrVglylCc2rKiZwH8IUInOsHgJ8@vger.kernel.org, AJvYcCXtSEVQqu+2ThqDV4/6TWrGX4uyWTl+CbJ1ySgSSpBdlsbwhWMMGkV9KvFoaG10/cW95hUmIfWn9ZUL7e9G@vger.kernel.org
X-Gm-Message-State: AOJu0YwnLOBiJwgECTmIbt4fpJBTpwGbbcOETO4MHyAKXtIXf2DnWILD
	uPbrlWS2ABJV7OTnTbnoLvGktzT1Sjy8GfQrkRHV6YN4QH2rkvFFx6iN
X-Gm-Gg: ASbGncv+didxU6QpPfOc9JlxBchObST1YqwWkY+hu61UmDNMkCD8sH5dl2I1bQO45mG
	pyCLkiTRAJ9SXsY0RmRyuOjhRt9l75OugloYXu7D12Y/ArmNuAJ30iivSyJwU58FxX7iAhvh/w0
	+Z3/ZEAlbfOiLVAf+oT49/teqdNeHgvDFfUR6i8JLkKwLonL6q2cGY0UZTKyquebkN+e8psRdhh
	1VoFZOHwnecNHIJxsrsOe7gg0ye5wb5gQ66rpLHuzQz+HTFxEA60tlA8Hf8R6WzNdwaOcnIVEai
	MKHFSJitPT0leg/AFIo/9QETlcrLeDNqn5N/WEDjgNfUMHnEwmUbzvSKbr8QAQjgGx99swGcFFS
	Y6AoaLXpIHetmYDxjTDQD+c+W2075AyNrR4SJtBR2gh3iukmMfO7SMTm7bg==
X-Google-Smtp-Source: AGHT+IE8mMn/NCxpS1bwhijGABS03g0L3l2i5YZVczGbTm8O3BWF4lE1LTO78C2EWmUKp3WlEKLNYg==
X-Received: by 2002:a05:6000:65b:b0:3d4:a64:6754 with SMTP id ffacd0b85a97d-3d40a646bc2mr13687995f8f.62.1757005152109;
        Thu, 04 Sep 2025 09:59:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf34493b8csm27633141f8f.59.2025.09.04.09.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 09:59:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
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
Subject: [PATCH 0/2] Add I3C support to RZ/V2N and RZ/V2H(P) SoCs
Date: Thu,  4 Sep 2025 17:59:07 +0100
Message-ID: <20250904165909.281131-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This series adds I3C node to RZ/V2N and RZ/V2H(P) SoC DTSI files.

I3C was tested on RZ/V2H(P) and RZ/V2N EVKs using P3T1085UK Arduino
Shield Evaluation Board [0].

Disable I2C2 on PMOD connector CN6 and enable I3C.

Connect EVK TO P3T1085UK Arduino Shield Evaluation Board
P3T1085UK <-> EVK PMOD CN6
- J13[1] to CN6[3] (I3C_SCL)
- J13[2] to CN6[4] (I3C_SDA)
- J13[4] to CN6[5] (GND)
- J9[7]  to CN6[11] (GND)
- J9[9]  to CN6[6] (3.3V)

On P3T1085UK,
- JP2 pin1 to pin2 (I3C_SDA)
- JP3 pin1 to pin2 (I3C_SCL)
- JP1 pin2 to pin3 (VDD 3V3)


[0] https://www.nxp.com/design/design-center/development-boards-and-designs/analog-toolbox/arduino-shields-solutions/p3t1085uk-arduino-shield-evaluation-board:P3T1085UK-ARD

Test Logs:
--- RZ/V2H(P) ---
root@rzv2h-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep i3c
          i3c_0_pclk     1       2        0   100000000   0   0     50000      Y    12400000.i3c     pclk
          i3c_0_pclkrw   1       2        0   100000000   0   0     50000      Y    12400000.i3c     pclkrw
          i3c_0_tclk     1       2        0   200000000   0   0     50000      Y    12400000.i3c     tclk
root@rzv2h-evk:~#
root@rzv2h-evk:~# cat /sys/class/hwmon/*/temp1_input
26687
26812
root@rzv2h-evk:~# cat /proc/interrupts | grep i3c
150:         38          0          0          0    GICv3 709 Edge      i3c-resp
151:          2          0          0          0    GICv3 712 Edge      i3c-rx
152:          0          0          0          0    GICv3 713 Edge      i3c-tx
153:          0          0          0          0    GICv3 721 Level     i3c-start
154:          0          0          0          0    GICv3 722 Level     i3c-stop
155:          0          0          0          0    GICv3 724 Level     i3c-tend
156:          0          0          0          0    GICv3 725 Level     i3c-nack
root@rzv2h-evk:~# cat /sys/class/hwmon/*/temp1_input
26687
26812
root@rzv2h-evk:~# cat /proc/interrupts | grep i3c
150:         42          0          0          0    GICv3 709 Edge      i3c-resp
151:          2          0          0          0    GICv3 712 Edge      i3c-rx
152:          0          0          0          0    GICv3 713 Edge      i3c-tx
153:          0          0          0          0    GICv3 721 Level     i3c-start
154:          0          0          0          0    GICv3 722 Level     i3c-stop
155:          0          0          0          0    GICv3 724 Level     i3c-tend
156:          0          0          0          0    GICv3 725 Level     i3c-nack
root@rzv2h-evk:~#

--- RZ/V2N ---
root@rzv2n-evk:~# cat /sys/kernel/debug/clk/clk_summary | grep i3c
          i3c_0_pclk     1       2        0   100000000   0    0     50000      Y   12400000.i3c     pclk
          i3c_0_pclkrw   1       2        0   100000000   0    0     50000      Y   12400000.i3c     pclkrw
          i3c_0_tclk     1       2        0   200000000   0    0     50000      Y   12400000.i3c     tclk
root@rzv2n-evk:~# cat /proc/interrupts | grep i3c
 65:         22          0          0          0    GICv3 709 Edge      i3c-resp
 66:          2          0          0          0    GICv3 712 Edge      i3c-rx
 67:          0          0          0          0    GICv3 713 Edge      i3c-tx
 68:          0          0          0          0    GICv3 721 Level     i3c-start
 69:          0          0          0          0    GICv3 722 Level     i3c-stop
 70:          0          0          0          0    GICv3 724 Level     i3c-tend
 71:          0          0          0          0    GICv3 725 Level     i3c-nack
root@rzv2n-evk:~# cat /sys/class/hwmon/*/temp1_input
27000
27125
root@rzv2n-evk:~# cat /proc/interrupts | grep i3c
 65:         26          0          0          0    GICv3 709 Edge      i3c-resp
 66:          2          0          0          0    GICv3 712 Edge      i3c-rx
 67:          0          0          0          0    GICv3 713 Edge      i3c-tx
 68:          0          0          0          0    GICv3 721 Level     i3c-start
 69:          0          0          0          0    GICv3 722 Level     i3c-stop
 70:          0          0          0          0    GICv3 724 Level     i3c-tend
 71:          0          0          0          0    GICv3 725 Level     i3c-nack
root@rzv2n-evk:~#

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g057: Add I3C node
  arm64: dts: renesas: r9a09g056: Add I3C node

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 33 ++++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 33 ++++++++++++++++++++++
 2 files changed, 66 insertions(+)

-- 
2.51.0


