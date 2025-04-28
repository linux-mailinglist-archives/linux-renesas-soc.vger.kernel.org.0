Return-Path: <linux-renesas-soc+bounces-16425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B68A9F8C5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 20:42:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28BA01886CD5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 18:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29B32820D0;
	Mon, 28 Apr 2025 18:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BixXGI/u"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EE51A072A;
	Mon, 28 Apr 2025 18:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745865726; cv=none; b=QkMTNeCvmhoO5oMWPRW17qv0hzcfUPJJVwgoLmGQdMpnPe7eDl+CGnUCUUzGC+07SzlAfV5WLKS2Ase+KqIawiag4nZqiu8xoIhsePe9PaFYsCIXvO2vWMHRjC5ANuv6igB4pJPRxKOoXOuZ9TmqJQPwbvmK7BOmjmvTNWCvRP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745865726; c=relaxed/simple;
	bh=pOyEFvIZaIP8kYVh73NGQPjfS/lkWuuhPEPBf6oCXfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rAJvmYzMPIYZdfHjOHwsXZ2GiT2ga7CQH8/T0J6ba2k8wH5KpmQdWAohJG4yTsmsJXXPcJlHlUl4qhpXT9cY7zKwIwR0hAhx+L1WFqoWMWGMrK6ctVIdakko50CSNAli7meRlfFjXoT2zkgpb66ACNKop/2x0gatTqTunSbj2WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BixXGI/u; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so53310945e9.2;
        Mon, 28 Apr 2025 11:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745865723; x=1746470523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F5bdrjYRXJvvLOdl4ohFfo3C8p3jTkRLefzC062+2jE=;
        b=BixXGI/u7UkyQebmirfnOarWkZbdJSBsACYe1xfYi7aCBo+KgzKsaS2tx25G823qhR
         NyCIm6rW65bG7BkN8bhoJ9vUJc+F8ZcRTZJzIWYf3TF5dMF3oiIaun4zSANoiISVdQgg
         F3E0cE9dPvY63iFloi0EiqZi+U3aK1w1S4cnd5sAcgkEqnpAQYJXBUgrSzVy5aHrBG5T
         ZnaRoe0WwgvLZ2Oeez+WqM+8QDGzksmY8l5EACiZCPWgLFtfBczCjyoHlBiu+xdGMj9h
         6H+YHvEoqtT2LngUsetDjid71n4ZF7uP/kTd1vysbioQ+yBtW0/Yddi45OqZiMVHrGOp
         rLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745865723; x=1746470523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F5bdrjYRXJvvLOdl4ohFfo3C8p3jTkRLefzC062+2jE=;
        b=UNaiyD+ha6AJJgSXUn1WPUBXXeXTj3/OtYaKb1Dk6G9kwxtmbE0kuuDyms5JY+1uY5
         T2SGD0DLB3pE2g7KvMWNELbGWktOWyygXU9lr2FS/QQ9pjWFXlABJrA27n/+T8XMC8AC
         2sUPAQxw8OZg3ZkJtv6lPlpoaW++S8DuV73XbACxzWqcg2w9g04rKbQg8X9SUatnwcwH
         w3YsV9R05K9CAwl9z7BqUk7xWWpQxxa7k62onYWor3nePAcWgNxmtbqoQSjY/qdN4QKM
         zxB0PmRq2gkX7X1zS8QQXCXUTBK/EF8fEGp2LFHFCCKzh+K5Jzqp/0M9hEjZFcTIvkaY
         N1Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUnUHvNwgexXzsVyGqo6F7NAHaLhlFnPdtShLs8nF+d9jOwYnEb1JMf1OAaeGpNc0lORJeZEt5crAA=@vger.kernel.org, AJvYcCXGioehIpSaQwZb5YiS1SSny3sODMzISigSV88x7SnWHSan+oO6zn9kpMnG9lsDhC00MZoWsWBLz92YXwoQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzWfHZKSkYgdGNOY8VeqGjMQRCg3RZ7JxQFgkB1DyzGbejEZco7
	l9tqbV/sCZAeeE3iCE3XcOv6eQyvSSympavFZhTz3XXy4+c9CMLU
X-Gm-Gg: ASbGncuifIgyJuvxsQ2tazv/KbvvtwFqS2QgyOHy34pjFsS4+STHzVBZSe97PlAIjRv
	UuMqgMNf14wsTOpyRt5L7ol+vU+TLazOjQv0WVfwrYkFLrk4oPloatuzVPkSM2OOcXvkE9r5twW
	Sirg1DlNcq/qtGcDSOgV1Xkl8IygXJwykXfHm/+ZcA09FxXXyk4zA93z/uoL5X2WRcw10LwJRvm
	4isoGDjWEpUqC5CnLo2WeYGLm/CRJs8O7Fj2Yb3YT+f7XqIiiFHMzTtaS1G7DALk9RMTa57wQGY
	sn8/v9/XYt9Aji/gdb1ttE2GwAkrudQbyurKtAqGjRljfY87DXUg79pwiMj7+C6/5V6o2S6FwA=
	=
X-Google-Smtp-Source: AGHT+IHtT9PBUXp9H3NZ4UG51UF8upP3hcH7fgVbnDh5uqCfXHgDjw1+7BdJtbh0wmz5zKDltiyKOg==
X-Received: by 2002:a05:600c:4e90:b0:43d:22d9:4b8e with SMTP id 5b1f17b1804b1-441ac856140mr4641225e9.10.1745865723282;
        Mon, 28 Apr 2025 11:42:03 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:593b:8313:b361:2f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a52f89b2sm137745995e9.8.2025.04.28.11.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 11:42:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 0/2] clk: renesas: Skip monitor checks for external clocks and add clocks for GBETH
Date: Mon, 28 Apr 2025 19:41:50 +0100
Message-ID: <20250428184152.428908-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 drivers/clk/renesas/rzv2h-cpg.c     | 31 +++++++++++++-
 drivers/clk/renesas/rzv2h-cpg.h     | 34 +++++++++++++--
 3 files changed, 124 insertions(+), 5 deletions(-)

-- 
2.49.0


