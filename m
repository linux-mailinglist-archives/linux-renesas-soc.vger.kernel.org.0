Return-Path: <linux-renesas-soc+bounces-21311-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF74CB4339B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 09:20:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4AAB7162F53
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 07:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B0829AB00;
	Thu,  4 Sep 2025 07:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQ0rVSan"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FDE15B0EC;
	Thu,  4 Sep 2025 07:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756970401; cv=none; b=mNrkOvJAM40v7/V34+wkUJR1DtvmmYlyBZUcToCemI5I2ZUgcGzFqKlZp5GyY+nlDyfxcUkJ0BsachajXSrqTWJO/xicgO1G9csiLiEeleltsFRJ/BgGWFT0QJ7aFCGWYDCtyNjKFxFOJQ3EPdWQld7tRm3vKIEYLapkdSeEerk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756970401; c=relaxed/simple;
	bh=N1hEroYahXcvZDybLVB1PH5/l+zfKXkvjB/MsAIA4Ls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RIkZLSObpu3l2WOfEtwE/L9YHMna4qiMlL5LD8Za+dqpvmTPTI8v9IkZgAEcLxejOHVccb0VIrNh4XbTekIqU/JrW1ovphJOfyEQ4EWb5A75YDHgLA4p0JdcbUQn/WFGlwmyJYid0wVrpUSr1PjxPqo2zG1lXwgfMMNlF5sp2PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQ0rVSan; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso4835685e9.2;
        Thu, 04 Sep 2025 00:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756970398; x=1757575198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l6YJ3FZXGdOIX37/2j48sam3mgIUZWYgwwUWPeyUVSo=;
        b=aQ0rVSanhMbep0PYqaySEyNp/RHd5wcDOP7uNosyE1PtDsaNMlObO9JecDmhpouxgw
         MT9Z7LRX/tove1PSc0YcAidF4x7P3rlKOB1vAi8HrOM6Z7Uo7Yd9rUIDmFwcnm1aRDL9
         xj2DSr0mcW4aYBeSGOO7Jf1k/OEMdKtIXMr8DnobqgEuhwWkAcEY1p1zPU8AuZeqs1ji
         mQlYGDcWthI6NsJn3vL02FNgbYkSylnQ/A+gvIQedSyUmWRYN8b0S89nuo9EFZwB/yIo
         Hv7usW31daKCNhY/t50Cgn5cU0bmzqErmf7LbHiMnc/Zl36XuaUUhm1J7pNTRYN4K2ZY
         NbNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756970398; x=1757575198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l6YJ3FZXGdOIX37/2j48sam3mgIUZWYgwwUWPeyUVSo=;
        b=iWvYIumifRBpeCtE9lx0Uw2/GdUWEKCJ8RmyWImaU5KgXeMrlNxeMqK9tTbypDDQkK
         5cA3DguhMl9b1itYTlUDJIcejAe7341OzlqWPTVDYtj0n//gVgGI/iVCd7/ivJAHdKWz
         cItLPmNztSlzKPdfJjTopID604QjwkC1B/D7NrVIcvLpbFZwUqkPyusT8e7jCwhptftN
         bTGqRLZzbCek9PkScNJYDy4YBVk6rpoN+5PmPIrWx8SrpJGuP9UpYPxpsGkEA6wzxgPF
         6AZdY+Js9N1DUNhnQCbk59jyIKzCkUY1ihJTW3fToWngs0i0YGzY/fOzfXwVvm7WLxBf
         aKxg==
X-Forwarded-Encrypted: i=1; AJvYcCU/fOKiNPkPPXGw1fXNjiaqoG/uJYNE8XEGGo/lKgp2nqmJ1gWmJ0Fj+yh4/2Z+3448TjcgVf2a41QF@vger.kernel.org, AJvYcCU6jU3fwUyx7e4e1k91eSO8SA01qxP+DTdkaRi8j0tc+wlHNT0dC+prP7SwsBHpbE72r76Z7Hgvriex@vger.kernel.org, AJvYcCV+Xi7wlaD7n8HLq6KaR8zrt4PGOARrgOH/RvIuOz9yoaTRy5OvtQt8XVCnxQZGA2JYlR1sETf0i0TEMLPt@vger.kernel.org
X-Gm-Message-State: AOJu0YzC83ICCA09Q9UUkNoNHShMf3BZv2bT6KWPnuWFwV05wrGfVxMd
	9NzZ9ePeQXhqVgKE5ON69Rnw9o1EI3RdQzp9CK5mOK3et/gsGmYoFDMH
X-Gm-Gg: ASbGncv0tJ+vdmPkG5paNOgWN8UpO72LuOnwoljuDJuX5exlQZkUVbRST/iPTusi+Hz
	C3MuCuDdr9F4zJetjez2ogF+u5m95wLd4Br7MxpxTzb0obYbBts32nCYCSljOmzhySh5romcvWJ
	aCVeefWzW+cwbtkLd5bG7NnijP3iB+UENqfrMH+UFUIwUvlGUfmDCEnlvbfX79zfSZguUy73tYP
	9E8VuZlu3YMB1rhs7zsa1+kkLhxvVJA8426eXCLlcN1w6PRtYMERFbw9ra4fSFRsftYV5/H36zq
	u6tGunylp2ad7Qymwb5Yoef1Ko+58XTDunNvjQb76Rdyh3nn1qTttoiwi/qWj6kdh2mtIhICKvc
	0KeXOZo2ykKj8xDeCjKXlLHmM5xC+sN62A7KyN7E8AWWGEF/TSAYC1/Lhcg==
X-Google-Smtp-Source: AGHT+IFwJxHUVnTIpgXcMVc59o+XXZunTSVa3QsIFCUK5s7cJ40vKv4LIASwhuomREu/d5Y1eFiBmw==
X-Received: by 2002:a05:600c:4694:b0:453:66f:b96e with SMTP id 5b1f17b1804b1-45c8e6d4cd9mr51497995e9.11.1756970397761;
        Thu, 04 Sep 2025 00:19:57 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e8ab832sm270962835e9.23.2025.09.04.00.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 00:19:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/2] Add Ethernet and GMAC clocks for Renesas RZ/{T2H, N2H} SoCs
Date: Thu,  4 Sep 2025 08:19:52 +0100
Message-ID: <20250904071954.3176806-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series aims to add Ethernet and GMAC clocks for Renesas
RZ/{T2H, N2H} SoCs. The first patch adds the core clock definitions
and the second patch adds the entries to modules and core clocks.

v2->v3:
- Dropped R9A09G077_GMAC* clock definitions.
- Updated commit message for patch 1/2 to reflect changes.
- Dropped adding GMAC core clocks.

v1->v2:
- Added Acked-by tag from Conor
- Dropped an unnecessary extra line in core clocks
- Sorted the module clocks in ascending order of their IDs

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: clock: renesas,r9a09g077/87: Add Ethernet clocks
  clk: renesas: r9a09g077: Add Ethernet Subsystem core and module clocks

 drivers/clk/renesas/r9a09g077-cpg.c                | 14 +++++++++++++-
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |  5 +++++
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |  5 +++++
 3 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.51.0


