Return-Path: <linux-renesas-soc+bounces-12198-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFC9A13CA8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 15:49:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71AAF18812B7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Jan 2025 14:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A00222C9F5;
	Thu, 16 Jan 2025 14:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="mdiSkPm8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DB522B8AA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 14:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737038891; cv=none; b=UWJfYE4/vdn3recHE8oQa/CFq99eqRgpAgatrBCupr+HjSw6RqDSsNVJbVfooyVqq27qVOTU4WPRTXvvzc42dd4xFcfYN/T4vmhcCUb4g+1b0khYHCoCMvro+hzXiydKtmZrGMV62Fx46eawWhtzAmH883Zj0Nuky/T+10yqTtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737038891; c=relaxed/simple;
	bh=lZuH5XuzvhtMW6S5Loq2CfVs2XMtSzvngAT5jOK5ZxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KyYNQOC+53YdqDPz7a/74D5+UfdPX0+E9kCX4HHceKDHJFhisWu5rvnhgBlGYAL8lmciWtBnPEkEAeO4im7yiV5amwlMfCwkkc3aSWr6mJo3DvyJpxt5SCck2m9UztoMGxS1ohzG2fou4NoU3S90F8cSgcjxM12JBLiErSN2S/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=mdiSkPm8; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2163bd70069so19513275ad.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 16 Jan 2025 06:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1737038889; x=1737643689; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9wAvkOrunuNgdOQ0ytQ443cZQu2DUu/TS+lIUMni9JQ=;
        b=mdiSkPm8uD0KHRuoqc3iBxUJGg9l2/+s5Us3eWAhacrvsEWmfGRtj9rV5l19m+11SX
         WQ3tIxOQC6nLVhkfVbeQhhepjzTS8yQ0efl+2PIYlx8eul0m8KKOIo4+Xqn8RHQP2rRd
         uczdLUSTGXpe9IpysJ9HehbzALHRFiNdnReSFoeUcyuFiGIrJJUMaAuWji9y3bwLx3AN
         dPXA9ausGpHJGprdHExpPt7m/FMjPwpTZ6kVjxBg5OISPFzS2y+j3M7LkFK/hqIQZUo5
         MvVypNykD/4t6YUoC3sZ8WEpnNdjHYbqivbljMvqMxFuwZWTgVu9O7K9zfamvFwav7kn
         LagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737038889; x=1737643689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wAvkOrunuNgdOQ0ytQ443cZQu2DUu/TS+lIUMni9JQ=;
        b=OCY7d0l6YFqZ2tFBn/7vrlcME+9xHzKHl1nfGS1Hb3wXccUKej9+aMZHmxExJXnMJm
         zI16qUCfISrF/m5B1jsFr3HUiK6OQrCkN+23sceX4f+08TjBUJiyTyTxxz7mU86Qr1PU
         9C8IXOpdo2YE4O0V99v4smFta+RWkeY1N9I1HnLXEOakoyZXXD3yX2Xjh1dfHES+ocT9
         hDkvuCYwffDuWFshj0VU8Z1vZVvhY7AQYLOU5tk9GeWUYsG7oNvqxCh82qWu01U2xqQV
         Ip2z1HBeoS1WoJmBGgHh1QlLBPMl5qPdcTgclOGevS1ldOcfpkR7jIwZmKJ9aPwQPhkx
         FQhg==
X-Gm-Message-State: AOJu0Yw96iz9BHzeNRxXhg1T02cEsU9N6fstepruwoQc0K6o4CEPT7HF
	I6EVttcgz+FDoRUcH8Z9zauDzS8Y/dQD34BtSobAPSaZWueJ+Ec3Y4vGI7yP
X-Gm-Gg: ASbGncvozsYgTJEvykkKMTYUMbXaGtalLM+vbZppf6rhuC7E06ziGhFRXLIeNOjq08x
	I6rB0x2fur8N/5osuUiim/3YtUuKrOeN132bKnVngGxsM5HPXb6JnwoMBu9YudZvxf36GMJHYwV
	3quS7iC24M/as5WQOom93uAFJrlZUWB81hJ8GlIakSmeLC85A0NTDsvRKyIxMP+wx7seECkapVq
	mUwBzU5Xd4A8YaQ7Mp2HRqLKq+pJRZRx0UdWWANWnTO9GkgpMBek/ub7A==
X-Google-Smtp-Source: AGHT+IG4dJZ9nXSR75sT4oubBrf6Xb+ut8YWDZmGSLZSGE1QYKnGyA+RwcHj01eCQDMDr1yD1dA4SA==
X-Received: by 2002:a05:6a00:f04:b0:724:59e0:5d22 with SMTP id d2e1a72fcca58-72d22014b2dmr52524064b3a.20.1737038884977;
        Thu, 16 Jan 2025 06:48:04 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:4323:933a:5975:d650])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72daba48951sm75785b3a.121.2025.01.16.06.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 06:48:04 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH v2 0/4] Add support Yuridenki-Shokai Kakip board
Date: Thu, 16 Jan 2025 23:47:48 +0900
Message-ID: <20250116144752.1738574-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This patch series add basic support for Yuridenki-Shokai[0] Kakip board[1] based
on R9A09G057H48.
And this series supports the following:

  - Memory
  - Input clocks
  - Pin Control
  - SCIF
  - OSTM0 - OSTM7
  - SDHI0

v2:
  - Fix the rule of binding for boards.
    kakip board uses r9a09g057h48 only.
  - Drop bootargs from chosen.
  - Fix binding name for regulators.
  - Fix the name style of the regulator.
  - Use DTS coding style.

Best regatrds,
  Nobuhiro

[0]: https://www.yuridenki.co.jp/
[1]: https://www.kakip.ai/

Nobuhiro Iwamatsu (4):
  dt-bindings: soc: renesas: Document Renesas RZ/V2H SoC variants
  dt-bindings: vendor-prefixes: Add Yuridenki-Shokai Co. Ltd.
  dt-bindings: soc: renesas: Document Yuridenki-Shokai Kakip board
  arm64: dts: renesas: Add initial device tree for Yuridenki-Shokai
    Kakip board

 .../bindings/soc/renesas/renesas.yaml         |   9 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/renesas/Makefile          |   1 +
 .../boot/dts/renesas/r9a09g057h48-kakip.dts   | 136 ++++++++++++++++++
 4 files changed, 148 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts

-- 
2.47.1

