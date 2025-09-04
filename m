Return-Path: <linux-renesas-soc+bounces-21355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEE2B4412D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 17:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 793725A1185
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 15:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F25280A5A;
	Thu,  4 Sep 2025 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0yN8meB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B53228000A;
	Thu,  4 Sep 2025 15:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757001323; cv=none; b=YebhQs8mKkZHvNMn7zzs5fFUTqCEIJbr+ww54dnJdgGOBD9VkkHdbZ5LqiltZ9hNLLQWRQUYfkZxjC0+a0PRKOZ5NRLuepXUM30x6oik6psLw+GKj56inDOIQNiC6Jku1csNqk1veMgCTUCTo1JbZxcZcEioOqaO1e0P/Ew6EKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757001323; c=relaxed/simple;
	bh=Z678fjKK4VWaA2uMlRfmBw7E9XBvRw/oO5FpM8ToQO0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kMYnE7nncd6z5cnfGR3FOQGJ/G7nUxEzB+4xmUr+OGpkZOwejb7/k1FSrBi655PWhSbU8cmHAxwxY1TnpcMCG+a0hT8HC9p9qU4Sqy/gYB4PJysKyVQbyxDZyo5x1eXAzsRXgkRHQBwIb64XcsnL5SHp1KmZoRA9gfia0CBOwww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0yN8meB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b7d497ab9so11916065e9.0;
        Thu, 04 Sep 2025 08:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757001320; x=1757606120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rf1Scvos3Dba5lTJGl62nzF3B1253LeYb5OlO1+e3U=;
        b=a0yN8meBGPbcyw4Dc8yWqUnW3NKdVbeE//LdClJF6SNcybn8T/7/RTfj56LpU5G8d2
         fp/PLPDs12vgFreJ7Xf6GIpAfSgh4tqykkz9ljEZRsaIm+l81oGGXhtp0YrZwP+6xY0Y
         GxhIuX8D1ro7q8PKEd2WzzqU3W18W+dHZQbJrK6uwVVkxk2jGtYNdMnBCbKdC1PgfWR4
         mkjHyVrXiMTUOQIIxR3QEjOF/y6cOV/gpGiJhNP8Jql8RYOOGbt49lY6yJQ7cCVQZRvd
         HwcYMjgJpIbi7f5tUu1kX3+DOJqzJTzyDpDpWZIozt4Ki55Dz/5uzR6uqUSL5BuKC+hd
         J1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757001320; x=1757606120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rf1Scvos3Dba5lTJGl62nzF3B1253LeYb5OlO1+e3U=;
        b=XBHb7+Hqw3b2p3QnO4jUuAh+jp1cPAQe8fTrc08TwxCDmXGPWs0H4fJSY6Oa9n+kaP
         oTtJj4MaH5BVo75StaWweNhBJGcLObSine+2bhkX8iLfeEvojDuMmzAcM1Uf3TKS0AKw
         Gwt++6F/IkcG5KzICHl3+bpVfcwJO5sZIK6g9W9K6tMY9dFRX2jE/1TAZVlaNVmJtmu5
         LhTctJvuvZousEK6giW3qUHX8k5KGiQQcN4oWpMNi9kLlRAH1N3iruQ+QQa/0SwjyNh7
         aYAY5leCljxHcrUQscDw/3dLf39v5mj69USscW+gPaTmbA6IwY0soIWmtWKzfC2nrPhq
         HmEw==
X-Forwarded-Encrypted: i=1; AJvYcCWLb7OI96ly7+ebBJ1a55iun/7Afay2N3ITeGNq2jfbzvG2y33imS6k2X/yccGHy87Q6aiPks6LtlU=@vger.kernel.org, AJvYcCWxSvcoR4VTT0PFW8ag75mW5OtKAZZ6J91npW+oXdEZTheJKmcG0uFtvMZanTmBW7JcCK3afQG28qKMupDr@vger.kernel.org
X-Gm-Message-State: AOJu0YzlRp6uZGLDTHhWDxrTuHPuos5CsIesagLkcAR5UE5kOrNSfR2L
	K71e3hKMgpDrG2/mPYEKdLFcark3CeoN26bwZG/6NMXDL+Bj+3RodDiZ
X-Gm-Gg: ASbGncsetLCv0dzIFuv2PtuFuKJQEp3T/ujiKRzlmWosR5cfBdh5UTwGB09afPLsALi
	bymda0NByzJNYHqx2jnJORvOw2AhPZ8YEYkBxHeR3m7GXFqn85ziB4uBvQfg1HVH+93EKx8hVBG
	C+CZC6MUFhZUG4EFf4+Y+JbQnnCZfUiCcNnsCQp4J1vhe1UcI9MMhKAWgWO3c8z6iCM9kJF02m3
	/coor/V937IwzcmW8hRFfclBo83CM4BrTgt+HyI/SdzVQ5H1P5I1kqlUkkOV4kQrZuha+o4nQyp
	FJxoUdijvVNflkUJCXRsIycD8l370wZwXmwvnCa39UD4v72DrAarosGdrqVOffAgfh0Ps9yueJ3
	RKDmr38ga8UJUVKl7C1FaSAIg6XD5bFGPa+qesP4FA3L+Z/gL+TU0HQTs3hqTmFF9atKR
X-Google-Smtp-Source: AGHT+IH1EXMCnSJ/53KbcGo/+eISbXMVwL4GUz5fs5AGr+Ynn8Zb37j/2I5RMYbU/ru846aWxuXR4Q==
X-Received: by 2002:a05:600c:a43:b0:459:d3ce:2cbd with SMTP id 5b1f17b1804b1-45b8556a7acmr162809045e9.13.1757001319631;
        Thu, 04 Sep 2025 08:55:19 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:904e:70c8:edf3:59a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd064003dsm19485215e9.6.2025.09.04.08.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 08:55:19 -0700 (PDT)
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
Subject: [PATCH 0/2] Add clock and reset entries for I3C on RZ/V2H(P) and RZ/V2N(P) SoCs
Date: Thu,  4 Sep 2025 16:55:05 +0100
Message-ID: <20250904155507.245744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds clock and reset entries for the I3C controller
on the RZ/V2H(P) (R9A09G057) and RZ/V2N(P) (R9A09G056) SoCs.

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: r9a09g057: Add clock and reset entries for I3C
  clk: renesas: r9a09g056: Add clock and reset entries for I3C

 drivers/clk/renesas/r9a09g056-cpg.c | 8 ++++++++
 drivers/clk/renesas/r9a09g057-cpg.c | 8 ++++++++
 2 files changed, 16 insertions(+)

-- 
2.51.0


