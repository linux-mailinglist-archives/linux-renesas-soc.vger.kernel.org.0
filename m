Return-Path: <linux-renesas-soc+bounces-21133-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 838E7B3EDD7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 20:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBA811A866D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 18:30:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FF5932A810;
	Mon,  1 Sep 2025 18:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BET4sJfp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7362232A801;
	Mon,  1 Sep 2025 18:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756751408; cv=none; b=IPQ5VjDj799K2LQhLPkGF6MffGufH79wnrzcO6uhYb4wGWAHBH3L1dGmIuT1NYprxJoXSaRCxVbcZ5CkY7jcl+HHX7vHagATqU9UulJO52dyqiSpRXGpkbx/JK49vayJ9geSfbVHCJhyfKsI6859PTb3lYIKOGHQYTvs9XklAd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756751408; c=relaxed/simple;
	bh=Xl2QMoIQ+bRuvfIfUvjhHRqCN/mJBd/OUO7MVaJce9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ILNo+4es2jajehPfB8JPUfbA3++mUxNm9Vw+nnFZKMNnmvpSIwoPVrancEraH0KJX7T6MqxeDpyOKwojdjL6j7f9uWsO8qfcz9H8MpTPlL6yy/hCLpGV7/XGcHmq0/RCQpD6mLpPpVM2Uk2hXiXBucDmI6WYwnkGwZ651TsS17c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BET4sJfp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b7d485173so29075015e9.0;
        Mon, 01 Sep 2025 11:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756751405; x=1757356205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZurGvL34r/ZVAAjOafSs+agMSK1+yB6I8lXnKo1OPR0=;
        b=BET4sJfp9qp1rzs1rM2f/VJLw900Fru8/SAILzbtbQkhRHgvfJZn58YOTcdY2z1oV7
         3PN86J4F+9OxJYrr8TKnMfkKz/Qd6LBO+tHEafL6wAP7e/B8zM1ddXFYjt5XrPF4RwKl
         Lczrl2EnHrsz0a5zUMckqDwmP5qaRDcei9253M/n5L4YHgTn/RzZCFskWw8Jxvcfgndm
         nI9iykNgO53OVCKwQxcaB8V7Nb+OaUn+dDED6QZq6Fk21m228U61fN6RzwcQPPhhbCtt
         SXwRNrmHl51Qrg3rmkrxtXFikc/uE4kug1Iz6TTMrA15K7oCjRsLkPrN/xlfbFgcYzD5
         od+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756751405; x=1757356205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZurGvL34r/ZVAAjOafSs+agMSK1+yB6I8lXnKo1OPR0=;
        b=bDUd9PE9x8tK5f8f+p7jmXQgm0ohYTGCipjRBIHK98/9Jf0kYNP+LxMY6g3u2VjH4Y
         3lpsOGTf01mIPM5y/l15Rp7o6SkHKKmUtPUtCVKtHgLqX3TVsbMXjHA6P73EG3KDzWYR
         /g6Lg6QQGF54UR+60HhrH++eUwVf1bDL3jkI7C3/nauPyfP1GHu0urR4tWH15Q2jcNXe
         gPLVtCOX5+mQBVRVEj57vmtjEL8QXHzFjtm2CXmkS9vG+aSLeSysMlxcuszIeUZj78kS
         lEX3uVxjumsm03s+ba+QF3H7QFT1kHj6c9gwfP18nm7qoObrcXnbIeUC6/llLJB418O+
         Rd1w==
X-Forwarded-Encrypted: i=1; AJvYcCV5Qq6iwIn12yvChu17ocfhZxKYu0zyU5zN/NzYbYM5/KZzHOfYEJzXqXO9udfhkaoO/gveTyMWzSbY@vger.kernel.org, AJvYcCV67LwF5BF9BJHTkgaShg+7f+U/rwkcI0FuXsyxQRlcpZzFFv6ibQ7H9TZQHCGFcm0/RCDgM5PEhDwvD07f@vger.kernel.org, AJvYcCXMe3PrUFiCz9ztpmFlusgYV74H3eBLXZh4Kh2EjxdSndNNyl7vJFE7eOj7nGa4aPiIYUpMkeY9CLLy@vger.kernel.org
X-Gm-Message-State: AOJu0YwVoBtI5UzlMNBGLtzaxLQt1LQmnQFrM8QhzLh0oqVrXD0OElkB
	Qw2ditzRhc5mXkX7gbsA0BvPuJrT80oPXMB9q5x3vqUza31SW9AZ2A4e
X-Gm-Gg: ASbGncs7+g7rxtdDboMtKwB/XHladWCLOEAqAY4h9jqC3EWfSat6DnKBIkcpVt8RfgD
	NHtvxZ0sKHDLUWprAA6s7ygc1ruJTDuZ1K6qawBgLVdEiXzb75gn0NQjI7Rg8ufafXFhTznXkN9
	cGiOIuE0HOWDYm4tkeHB+1VW5E6EJ8X/Sp6q/bxiD7uvY934jYVyW+YWigwdWDUsq5AsDMgwYEM
	FE6Ypw2qO9r8ixo3Slozplg1uOx5oAs9m5nYOiT3WdIlhvaydIr0bUqnwFNzuZDqD6jy8FcRgVY
	QWggESZdxUgXH6rQaoFD2/vR3dtpIML3t3xI+WboMJyI6/GhGRZi97HdI9amGaQvQZeQPLO0DPL
	tHlLORY7j65jJbodDmgoD4BQ0RlxRno2s1FIriydW4Q2fEptVr77iUmVC
X-Google-Smtp-Source: AGHT+IEet4JOs4uQpMVg873tdTWef9dM56/OAbjC16te7PkWD2lrRThYhovFlDi87xLSu2oWvehQGw==
X-Received: by 2002:a05:600c:8206:b0:45b:7e68:7492 with SMTP id 5b1f17b1804b1-45b8843c122mr62868255e9.1.1756751404547;
        Mon, 01 Sep 2025 11:30:04 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:ca6c:86b2:c8f:84d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7f53a947sm93602505e9.3.2025.09.01.11.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 11:30:03 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add Ethernet and GMAC clocks for Renesas RZ/{T2H, N2H} SoCs
Date: Mon,  1 Sep 2025 19:29:58 +0100
Message-ID: <20250901183000.1357758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

v1->v2:
- Added Acked-by tag from Conor
- Dropped an unnecessary extra line in core clocks
- Sorted the module clocks in ascending order of their IDs

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: clock: renesas,r9a09g077/87: Add Ethernet and GMAC clocks
  clk: renesas: r9a09g077: Add Ethernet Subsystem core and module clocks

 drivers/clk/renesas/r9a09g077-cpg.c             | 17 ++++++++++++++++-
 .../clock/renesas,r9a09g077-cpg-mssr.h          |  9 +++++++++
 .../clock/renesas,r9a09g087-cpg-mssr.h          |  9 +++++++++
 3 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.51.0


