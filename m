Return-Path: <linux-renesas-soc+bounces-16906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 454E2AB19D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 18:08:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 22A621C46F47
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 16:04:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43ECB2356CD;
	Fri,  9 May 2025 16:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ox0SSMxZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FF52356A9;
	Fri,  9 May 2025 16:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806490; cv=none; b=byix/pEGL5ocOxsNajctXg90/BmfZhgYqVD8+Tsm6l6fZt1WliBbKugkeH59xqMDzWPNmBeAW03tgpWA9cH9lamxRR8k1R9q/adpRHV33UX3C2WkQOuZM4UajdtCvhPdUDEGOtlgaAq5xlgSQpvgazNwxIWhTDolKHh6dC/gfS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806490; c=relaxed/simple;
	bh=YHPEHf4Ewd3otSREHNlXXV0RuQx2Lc662eO3FGh4N6s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CcgTBzI1tuVAM90Jq8aqk0UBErBaurO6tNLZpki/+1CE9kpnClulUo3uJiA5qmlWoKhinvO0wS7X6tcrWrx/ZHdFvUkUa5kt9ZqokcfNcjmKxztJgt8gIe0VLtA9IjxxAS7xebT63U1AfZJS2CSqTsoCK2A+AMDV1qMa1xJH2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ox0SSMxZ; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a0ba0b6b76so1518649f8f.1;
        Fri, 09 May 2025 09:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746806487; x=1747411287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=frcEfbMY4BdMql1eowkE8Wi1rZhjSO9bVL61rj/4Pl8=;
        b=Ox0SSMxZRKDG8BNJbFtQFVve2DyTlQ5fZuXp5E7ToIsYjF3qmGhRTOERYHlEBtp5El
         SmI64LVlgza+Ao126k/okV+6Grg/yL+DvBnrKedzZhQTJQE6O8MlXjCil3l3RoKMy5Oi
         IMFt0oC7TkG8Ljz/Q+Qd15F6QH1DGYnB8s6Ir0KN5xyldII4UyEXWNulCyRQ6tT0GE9R
         iThg+IwXiOdSnRBRYSi9+X9HwpQ8MhtUzVX3K+YgexyrnUuXIovYWFs7hn3VPCLyyJBJ
         3R5/QmEgbcJx3DClWLeemBS5fQpvBCWxr6YVhzqBqszhL6+CYw2mK6cZLYP07zBpqa5M
         wiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746806487; x=1747411287;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frcEfbMY4BdMql1eowkE8Wi1rZhjSO9bVL61rj/4Pl8=;
        b=JPKq4eOAwPqpGOOqubKEXRg6i6bUcL6a5KF++Wr43pUREmA6TRojBUwilVYVRIZZU9
         W4atcm1xDH5swmj0VRGoKGYm2YR/91JTvqjiXeGHD4HWnC7OXc034dSWZGQoBWOhpdC+
         S46apHAK1Hfp4d5PFD1e+fTvc/pmSakbCBueolHp4jj2K5u6+UOXkbQrJes/1b/H/rxP
         szbGjM0UDTra7pz5z07R6xAamoh2JiL4f/3sK9iHNxS7W7YZCheB71q7iQec0nmTy/Gm
         wZiPUq/AyZK73KWpzdzDa7GyjaPw2IItzPZfSrHYunE19eg59kfju5cK9LtokYsl+Cwc
         Dt+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUI4I5jcWQ50pAlLVzEfCETAdnAfKZbshE9/TgtZZgcoLY4YNGNAxDI1DnKHvZrI+fghyhLtvukzNA=@vger.kernel.org, AJvYcCXA+l6cOtsNzBp+Sn2PUqn3Af3IVNVdhIXapzRol8V6C+qy7wWu8729GUp1e6oQ97waXykhGD6gHXnJL7Ze@vger.kernel.org
X-Gm-Message-State: AOJu0YxlKSeDpZLSF3qu/E+wHPcA83ch0etvcZTWoBXTb5JOTShiOOtS
	XXM7r+1S/JxHxYqfPtSWCIO9g0NXbxMBOTxH9haQB+fNIYyhxO50
X-Gm-Gg: ASbGncsUZIBO5383d0kpkRgVcuoCmq0WLKbUvEnMTSTzDWhs7yuePjPtgbUDJexB9j4
	JdvP/AxHiLD6HZ1UOs5PGgtciVPErFYj5E6h/Uw1e6FfyubPZt6ji6QArMqHQeIkfCaKIYIb/9F
	WeoX+xPy6U7Bcy89ALUvqxBOjJhrUJFh0nWQtyeU0R1bxqsoXIevyZJlKWNcrGR1zDJLXCHI1Ju
	m3Jd3Bb4mmFLBXkjCA6fTbT/jI/MPhdt4yAirl4wl8ch7XeGUEl61kdhXX3UxzNGuu6Pmft+2CS
	CfbeO26khKbWoEuvsz7BYJa5ESjwWFkog94kmyZf2GGg/t7cFy4AW4FKD0E86b001w==
X-Google-Smtp-Source: AGHT+IGhKZnmq3lKNuL0nXFnI1rAKu/wKaaoXbifMAwe9X5wjy0sI6TyhYEmEunc/27WgmIH/iMXRQ==
X-Received: by 2002:adf:f44c:0:b0:3a1:f701:ea15 with SMTP id ffacd0b85a97d-3a1f701ea9bmr2842790f8f.55.1746806486644;
        Fri, 09 May 2025 09:01:26 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:40e3:34f3:a241:140c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ac8csm33244475e9.33.2025.05.09.09.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 09:01:26 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 0/2] clk: renesas: Skip monitor checks for external clocks and add clocks for GBETH
Date: Fri,  9 May 2025 17:01:19 +0100
Message-ID: <20250509160121.331073-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

These patches are part of the series [0], out which all the patches
except these two have been merged. These two patches add clock and reset
entries for GBETH0/1. The first patch skips monitor checks for external
clocks in the RZV2H CPG driver. The second patch adds clock and reset
entries for GBETH0/1 in the R9A09G057 CPG driver.

[0] https://lore.kernel.org/all/20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: rzv2h-cpg: Skip monitor checks for external clocks
  clk: renesas: r9a09g057: Add clock and reset entries for GBETH0/1

 drivers/clk/renesas/r9a09g057-cpg.c | 64 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 29 ++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h     | 26 ++++++++++--
 3 files changed, 114 insertions(+), 5 deletions(-)

-- 
2.49.0


