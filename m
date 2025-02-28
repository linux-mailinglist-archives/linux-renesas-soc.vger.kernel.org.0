Return-Path: <linux-renesas-soc+bounces-13825-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A3A4A443
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 21:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 112333A6E1C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 20:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 053AD23F36E;
	Fri, 28 Feb 2025 20:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtPYAo6O"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE1823F360;
	Fri, 28 Feb 2025 20:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740774429; cv=none; b=RUDHbcCXC3aW3356gE6yp+ZM3fCDzSVepPXkonBJNe0eci7+vq7hLMSLtZTKcHUekngIDd+sOwYv1sQWta4pvTgLqLDr2aOy9WYbolPD5eg1jtkgsD+JVcqUA3KtOsfUyKp8yAIXXVDEeXsQwUQG5uTP//Wr88NE7jvgims3I/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740774429; c=relaxed/simple;
	bh=3pt0DzWQtD8LQi6KmqI70GXufsElPyfbInq4gY3UjRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q4QDGnPAx9gSy94AlYhwNMm5idQ1/FYGJQn1uJB9pfn6HtY+mOjz/MbL9bE5yK5o8I7iMQWIEFMgt4dY5D8xi3u+86FsviRJNzT0MqlnjmviIubNUc64cJVi/3lwmkoWIaWbc8gIrWeNFmn1wUPDX+MTymv/DgWSl4XSeadCgJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtPYAo6O; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4398ec2abc2so22949015e9.1;
        Fri, 28 Feb 2025 12:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740774426; x=1741379226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NT5YPA+X5zJDEvfsoRWn3yj9795EuydHTRbDpdgzFV4=;
        b=WtPYAo6OnoQPZOF2WsSMp1HobqkthlBrpEbzMuMLKwDVSXpMaq85jKhTqbceJWMBT3
         O4aoSMpRYWnlf1ZzoTarZ80Qxq9JyW1zMq7qCzihZHkYrhox9yGU57NxLRWprmUlMSSj
         oDw+6iOIXnll8ZyMcOdS5AegmFgxzCYuZjfV/H40Do4267/l5Pupx8kORhS0gLpPdRXN
         PFUaD3X48RroQf0wMCDvv/ItYqZS39vZ6MqwN/wAZMTxrkxP0fWJa/uH9JIAbwSN9n7A
         6+BtGrh+ZBhM5PHT8nzuDLXdXB6h/caJF1hNV4NK/9GdHa205MShqpZ8/3cTSFmrPyHZ
         LBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740774426; x=1741379226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NT5YPA+X5zJDEvfsoRWn3yj9795EuydHTRbDpdgzFV4=;
        b=G4TafAYdxMo/x/FXROjHylUioNLPsh51s3m+sL9ueW3Zw5jIC6mkBWHa+Z1D+GQYmt
         gPsJ9xZ2k+i8mukt6dB73CYcRIQXJN7nFOYm2BahQsNBG38yumYbay2COVB9xL3JcU6r
         7MQgbG+kdugqulncaWs/tSahtN4skbwgAEiaxM45P58Y36WRtJJARJvr0PVUmnhSAxjl
         secPVR9z7c7Qi1gfEPY1lNBRL+7VJrobhoXhmpQufb9qz5Kxv6H59bALF8PZQdo0DfQK
         AqVGWggdw5UusfHM3EspVwmBTZIBgr8B7+1uraN91/1zFosjccXJXLYJtxqCG7/DGegZ
         UxlA==
X-Forwarded-Encrypted: i=1; AJvYcCXOtSEJl9F1N0UHcmSXJ/BdKwS3/V0t3SAP3mrDf2PSnGoU7O1uCc9vj7xVh+9ywNO2+KeatynadYo=@vger.kernel.org, AJvYcCXmqRWsBAwXPcJ3eH2lNRmuFUi43+Py4wQJN1vhHVg2JiS0g8dzRmroT7I+Niss0rtNUpCwyG8vRm/FwSQd@vger.kernel.org
X-Gm-Message-State: AOJu0YyDdd3YdEOZJyPbQezAebtSu+xVoMsX4IY5/9ekbnDwPp1szLyn
	mGQOfKB4AByuFeUO8ngM/VyEzOQAeniyVW5yk9V0cAleR+PDonZX
X-Gm-Gg: ASbGncte3bAPxYEwks0ozr8+0VC2+c1JrJ/boBOafX/+gOyPiBweeFCagZ66fAmQVIv
	BuamdZ8wGyvNwonFT9JE6Zb1pZ6s8IAqNPLyoK9ET+MphFIVGi1SHw+B6f4+UhP2uL5HfRuFZRk
	36j560pEPAV77ua+AhhLMv9MhGWIfte0gSfnAgXGzBdPrBWfDaMGLuk9xjhesP1OWX72XqmHV3n
	/F46BqYwyL3MZCD51YTvTmRt8pomOttTXL7etf743sAT5ioXIm1fNbT24acpGIfzLEUShdy4Hbi
	5arPna7QfUZrNr87MueUGQ3LRSZ2ObqhLzZUkjj2NI/HrYgFtrcRuqXZJ/tnxWmtWunR+eGY
X-Google-Smtp-Source: AGHT+IG3G0f8Pt/DMQw7zFMgXlXA6ZfkNcIbt2ipqj/PWPtS7jhujXNmHpIz4Z4bVqynTpNIZQikVw==
X-Received: by 2002:a5d:47c3:0:b0:38d:e584:81ea with SMTP id ffacd0b85a97d-390eca803edmr3924520f8f.45.1740774426172;
        Fri, 28 Feb 2025 12:27:06 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:459a:3857:be17:b16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e47a6739sm6152099f8f.22.2025.02.28.12.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 12:27:05 -0800 (PST)
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
Subject: [PATCH 0/2] clk: renesas: rzv2h-cpg: Add support for static mux clocks and static dividers
Date: Fri, 28 Feb 2025 20:26:53 +0000
Message-ID: <20250228202655.491035-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for static mux clocks and static dividers
on the Renesas RZ/V2H(P) SoC. This series is in preparation for adding
support for GBETH/XSPI clocks. This series applies on top of [0].

[0] https://lore.kernel.org/all/20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: rzv2h-cpg: Add support for static mux clocks
  clk: renesas: rzv2h-cpg: Add macro for defining static dividers

 drivers/clk/renesas/rzv2h-cpg.c | 24 +++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h | 42 +++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

-- 
2.43.0


