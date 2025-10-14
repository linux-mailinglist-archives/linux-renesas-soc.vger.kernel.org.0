Return-Path: <linux-renesas-soc+bounces-23016-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF40EBDA53A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 17:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1A52586AE3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Oct 2025 15:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D1872FF66D;
	Tue, 14 Oct 2025 15:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQeBDQh6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1DDB2C17B2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 15:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760454822; cv=none; b=EBPe0u89rmJBVfsPo4TFYeIM8WvIUDd0DN/AmtWP07mbbiUgZR+FMuG+w07A88DBVyyv5bB53VBQhhOKsFUqwQ4mA2agx7HShWRrXdjAkAqH+ZNliPhvfLuhy0NZPpESfrCD4hdmPtLLW2LrH3ZL/afQ5R/9O6aAqVxC47pwvlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760454822; c=relaxed/simple;
	bh=bk+3Urmidyseaj7bEE31gjN1uAPuJrv5gmtVX98iJNU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=llTuVTHivXWsilgm2QELqev71MNnJ0PzUM0Z/oJ1M+2503RwABjIE23QKpT1HjkTuLQGmyFvSsGxtiuhluBGGfJrPl5hHXtCbDagdZiPQbwTR0Ae63oq2yn6ArLc+iXtuSaoBQ4OwIqzbWSwq09BQblT4RMP5cDZLAX98EESRpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQeBDQh6; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-273a0aeed57so80095055ad.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Oct 2025 08:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454820; x=1761059620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8tOeziCnN4Ni2u4fQrMrmy+/9+u3hrm4KNQAT/jop8=;
        b=jQeBDQh6F2n3iiE33uKlcu8I+oKZ37aqghF0Q0wgZe4n5l2YvBMdJGBmNuHo/4hi5M
         T7L4Rb0ieRlzoKIfV7fsnoxUBGh+RPRTLbySZI96GQcBUXFbrHZO6z59ZLqQxnEDoiRC
         89GG49h5B2c9NCNY3zAb3dU/XVle7Bk/Gkkgunwue4quuDTshY/daTDRL/QzUK8l6WWs
         e95Li5yKPG6i6YUXi5PhhpMIpo2UOigy/kHf8iTmcOERM5hf8ANcE3wvfvVNLKaBnUqm
         PDBvntNwqxEwtRJ3tpSIZ6V/C4TOQhJAiAQCr0kFwOM2ftr55HyPMAtc3fX+eJN8ffRH
         UPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454820; x=1761059620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8tOeziCnN4Ni2u4fQrMrmy+/9+u3hrm4KNQAT/jop8=;
        b=Y6p0u2L47wNoFll26M0bPwr9WKjO8JCbcfruVUum+fHwQ72mUhpF+kYOUPD4j+Gbvx
         lLX1qKB+Hx9z7eG0o22+DzUwR3GTkXma8MiIU4wrBYBAx8BRCkC3CbOpXBtpZS/ap35B
         RKLB/d7jSppRDiO9AwtvaD7oWXdZ/JhzaW+OKLFGotWRHNqfL9tjzTgePyY3dyTEItq5
         PmX+eAkShjlDehhnafj3TpUwOaqH3pyz4ryHrk7YIf6n1kMBIEOAiVokyZl1O5W6B1xt
         ZeKIN5Er3VmhUIKZkAkMIjMllHGaYhgKmVbd7nB0/FNBY2r44GatosW6JyJXOQPfAR9u
         /XnA==
X-Gm-Message-State: AOJu0YzbijTMTEYcpco6xtXojU3j7Eidqnjgil6eM9lv19KVWZy9im4s
	GcY5QCHZSxeGeHuzJ4RwbX+/eM0O6Fl2z6xLxSg9k9ocH0pFG+Lv1wiy
X-Gm-Gg: ASbGncv/MYQqX+mE3/QGmtb8ojj5fESS27TCcoYIlEnwawfRygOSgpwpnTKq9P9U/5O
	4O9IpNvC18Dk+Hd+tliN5riwOmLmXp0Dp/HRJeTfIh/OjEGpNRejaYmnsQ13yaLrUVCO2GDuTMH
	p9CnpfTXmK49OmQ/Dzj5hx1N71feIcr9rz1i1GYVxbLO9gggsdYVEj81g4Z6eEAoLX1uhfnU1Fr
	XobodIef7d+Nkt3duBXiltTZAiq0NUXlGO3ULpice+RqUdeyGnOXXiM0o0AusaZifc6qqGYvZA/
	JzLsPY2Lzc4lnshE5YdAi4jXCTo9o2LbYA/rwqqTpUeM1czIlaFpTqq1B9vooW8vQl1E9TzpwrC
	q339Hd+qGC8cIlwiRLCfCoaWRWbIxnOCFeipGLtFDReJRSyNMkEZAEi+p7luOHcOB8yrK60BVWA
	==
X-Google-Smtp-Source: AGHT+IEZNraDrsdlmzWt45LeJsdeKrIjLC4h1zu7z+ngdEnkAeoGnJKGbBlO93KLbkvtdV0gORV/tA==
X-Received: by 2002:a17:902:f641:b0:269:8ace:cd63 with SMTP id d9443c01a7336-29027f43af0mr311264675ad.30.1760454819718;
        Tue, 14 Oct 2025 08:13:39 -0700 (PDT)
Received: from iku.. ([2401:4900:1c07:6d70:c338:e681:47e3:e797])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f8f9bbsm167171125ad.121.2025.10.14.08.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:13:39 -0700 (PDT)
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
Subject: [PATCH 0/2] Add XSPI core and module clocks to Renesas R9A09G077/87 SoCs
Date: Tue, 14 Oct 2025 16:13:23 +0100
Message-ID: <20251014151325.160062-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch set adds support for the core and module clocks used by the
xSPI (Expanded SPI) IP on the R9A09G077 and R9A09G087 SoCs.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: clock: renesas,r9a09g077/87: Add XSPI0/1 IDs
  clk: renesas: r9a09g077: Add xSPI core and module clocks

 drivers/clk/renesas/r9a09g077-cpg.c           | 35 ++++++++++++++++++-
 .../clock/renesas,r9a09g077-cpg-mssr.h        |  2 ++
 .../clock/renesas,r9a09g087-cpg-mssr.h        |  2 ++
 3 files changed, 38 insertions(+), 1 deletion(-)

-- 
2.43.0


