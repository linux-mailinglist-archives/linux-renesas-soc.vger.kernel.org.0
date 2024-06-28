Return-Path: <linux-renesas-soc+bounces-6886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D6791BF47
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 15:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E971284651
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Jun 2024 13:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AE431BE25D;
	Fri, 28 Jun 2024 13:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZMwytdi6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B98F1B3F35;
	Fri, 28 Jun 2024 13:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719580268; cv=none; b=uFcuA1J/22Zi7sYZaU74H1+YZZvLkxeACyzHBPhHfAY40Wu1zB/SFgUt3RwsH4gnDSVovxmm9AA4Ltj1yjUnZOPkUNbfU+ajn7YRqsPdldih3v0O6/6aOjJU1itj4LU7LrknfMPivN8rtL0DAhZHrRhWLj3P5+hvUW94cMO6mzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719580268; c=relaxed/simple;
	bh=19WnyASSmiP5dYuGxNF7hCPbTXMLEYdxQkDx//2s+H4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L3YnY5lGsinPT62JIwq0Mcd6d7t2JFgIdGDXj0lLwc4WS4c0aXNKAr/LxTLraXMVkpiGNxb3nolMU5zIgP9kLh+HOrlPmXe4vmSRv/BB5vBi8SPj1ZzTm81HFJ+St6yqff4OKpzW6vgWJVPr9yTP9EE+8FNUdvrQXmzPfKaL84I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZMwytdi6; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42565670e20so10636695e9.0;
        Fri, 28 Jun 2024 06:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719580265; x=1720185065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KQPA87gtEd7oeMcvbLhf363eOnwxMNw4POXQ9E9cysY=;
        b=ZMwytdi6yYKkGKscTV8aQivkvAczCTuZb6aGV30ijhrJXAKnxS7kbF0XNUkkI9WjnG
         WlM7zsLcT8ALqM0o6Rll1wTt7zkhfI+goCDXEB/DjKqfLXLTDv8XcoGHFLTn6poQKA1s
         3QjyL8btsk5tZPdu9Qfnz4S9stAomvZQS/l/6Q0vpq38dMRmUxcXFYIVy/2UjJsPRunF
         SveLmO+yBpdgUTJpsB2f8J2SarTFjhCYen6H5nrcc9tWCPwLv1oDJl8tgNe+HhiIGDcp
         9YfVA/QkEx+jSw3lZJC1sJ+S4Zuq2ZT/tFTDndAyCsfPCT/x6o47OrkOW/OgEKtFiOz/
         DKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719580265; x=1720185065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KQPA87gtEd7oeMcvbLhf363eOnwxMNw4POXQ9E9cysY=;
        b=jrK4GjNcaLMWeoKiBK9a2+MW5FuIw07EUzYHGx7au5Ly4oQiggc0gS6IpjGFExOKiH
         8QiV1ARWHwv5xl3RA0Na6M/KJ24wZno9QWrbeJuU6cOs4GQl7Hk6+ZD2KBKnzsqh/frn
         MTKlf0O27EQQ29dQyxevjHybzME20fUvCUEZ52HRv55mS3V+4WpS5S2FFUIflTCYsFng
         wXF7sERY4zn8CF3RDVQEXS9NST934JkXvZ7a9G1AjW4Qnc7jeH6yiTKgLlaWh9L4D6jK
         xrWQG2LeTf+sgK2RoLM3VQWn7h2DLdN94XyM4bp5ZaH3rA5oh5us0lzSoV8zftTZJILE
         iFTA==
X-Forwarded-Encrypted: i=1; AJvYcCXRNigi//3HXg3Jwom89zYx1Y1XmRQ9nBJzimnvKCn3Pmr3b8L4QjGrV3jXuree2JCYH6tg6+924jTaCNoG253rtgMMCd1sv/jB30ovkKSJ5tSBY0kmobiYU8XxvDdiHlbOQ8AjxE3jwqQrZNw=
X-Gm-Message-State: AOJu0Yyuq5kb1c6hSg2UtvGbXqwD/LwYIfWK/zHLBnP3Ld3KiZhbLKge
	JC5GEKsr2BosKFWw8Rfif86IHxMzG5k7PkMM3J1eD0wOjKiGFVSm
X-Google-Smtp-Source: AGHT+IHDUiazcUJzZPnTtqvwGO6vAY8G5/mAYR+XV4svmvxVJdgzZ6C80NjeFCYlEasEvTYzobO0LQ==
X-Received: by 2002:a05:600c:3b9e:b0:424:8acb:7d53 with SMTP id 5b1f17b1804b1-4256d4c3f58mr18765335e9.1.1719580264582;
        Fri, 28 Jun 2024 06:11:04 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af557fesm35298865e9.11.2024.06.28.06.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 06:11:04 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] clk: renesas: rzg2l-cpg: Refactor and simplify clock registration
Date: Fri, 28 Jun 2024 14:10:17 +0100
Message-Id: <20240628131021.177866-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi,

This patch series aims to refactor and simplify the clock registration
code in the Renesas RZ/G2L CPG (Clock Pulse Generator) driver. The
changes enhance consistency, simplify function signatures, and remove
redundant parameters, thereby improving maintainability and reducing
potential for errors.

Cheers,
Prabhakar

Lad Prabhakar (4):
  clk: renesas: rzg2l-cpg: Use devres API to register clocks
  clk: renesas: rzg2l-cpg: Simplify rzg3s_cpg_div_clk_register function
  clk: renesas: rzg2l-cpg: Remove unused base pointer from
    rzg2l_cpg_sd_mux_clk_register
  clk: renesas: rzg2l-cpg: Refactor to use priv for clks and base in
    clock register functions

 drivers/clk/renesas/rzg2l-cpg.c | 53 +++++++++++++++++----------------
 1 file changed, 27 insertions(+), 26 deletions(-)

-- 
2.34.1


