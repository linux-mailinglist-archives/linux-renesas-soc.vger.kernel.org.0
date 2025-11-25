Return-Path: <linux-renesas-soc+bounces-25134-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C99C874B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 23:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1164F3B4A18
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 22:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8672033B6C9;
	Tue, 25 Nov 2025 22:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jKbkQmUl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC2C3385AC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 22:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764108874; cv=none; b=B/Pfy1RDb3dBqLVGTE66WGhZxFMEXV7VqTXYqGwXo0q2BLKIPldmyj2AaNKbjgAsObb6/wsmKBFmRhO1IMssuPGw+eBlQo3cCdE6HHxW3iMTdYKBtCiRxvYALwlaY4mpnS6YpArPThN1JuWeQOOj4omkkc0GXHNDPEoIY1znqMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764108874; c=relaxed/simple;
	bh=7B/N8bYheZgEcqaN3WzGWxcHN31o1dyEHVMnE2HR5dk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZdOfad5mnwOKioDdd1+PDDN3XkATM0HQLOq7lTUezuoerQ8n/5ZNzZTGYUEZ8zBuJlCAeLefMBaC4MGqSNlhxep/JBQkEc+iK42+sMYjCqal96SNNL/mnETDuip11DRk3Fgdps14dZAJ+wYd1nkinWBETUhlJSt3Bv6hhWOc6VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jKbkQmUl; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42b31c610fcso5180145f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 14:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764108871; x=1764713671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vuLDx1Ef/SmnelhDw8gm89IOy6br0fzUT6W8Zs9bgCc=;
        b=jKbkQmUl2DAK/hT8OOiaAQuKWrZukJoamYT9jUvuJBt0PKghnoKvw6PkLe+KogbJT+
         XbsvJfjZ1XkNK5QVn49QvdqD3euWsAOgamJpAz2gmNUZOe8ZzYdMP8lPFI6jA0kahTTe
         XnVXQBRj2OvvRKF+8V9+l2zJzmDNRhBHo7RO2SpE0KLajuJQEna5SPBXJQhuEMODL7fi
         tFkaO06xnznAAfzqL4ax15dMYnQvFzmzBabzLtowiJAuJcGbu80S/gsqsnDWlfuaAG5W
         tecS1oXwbd31cvkUwbzrs4T8PZPavRZkhWO/iArkldmYJgC24jT8fVZelGan+8rE20Rh
         s0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764108871; x=1764713671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuLDx1Ef/SmnelhDw8gm89IOy6br0fzUT6W8Zs9bgCc=;
        b=XgPEFptjXEZM7Wi4gy9T/ehu/WbUPLIIYeDWEBY8Qt0hkyAbhRBMTJxE4lx72ayGvU
         klwawyPLPRaxYv4s+KKizu5/BZaEN60Uo8+br5sC6sqQZWNhxYbEA86vYkPMRJl8slm4
         B2ZGu1YnP/9EnZd+s7LlKPMynMvrmqMTkXYfg38exRk4PUgRe1Dq5hJU5y6N/SaoLP5k
         RM+PkYcQJkky9cnfrapXdUrCJsFbJ86UtLOrqcYY+526Njo+1DCjXnH2gSYsPtAgW7rf
         kRER4iz5x4haK0Lmmcev6Sn0EyHlcImtM3jnvf2m7DF/QxQwpCojx5tc0Itaq5hEQu0a
         wbcg==
X-Gm-Message-State: AOJu0Yxls0tsgMlARuIJ8btqXFgtXR4guSbaa6aQB48n+sBKXmzbpT24
	Se+EjY8//vU6rUAkuuQkTMTc4KBz37Vy7ZcIPf5WC7qweRUFPtItwq0Y
X-Gm-Gg: ASbGncsG79OCbbMzPtVmeG7eAOWF0Uz8qcrIGq8tG6nO8Gbl2Vcz65wwMu6uTQjHIlK
	oygRY8gJWrIcez1NjLYC9XtHXqhJFQ7qPOxuDXMfdUHexWcPpZp8czvEWX7FQ4/K4PC1Bg2UDLD
	8gum+wWSat6S/SG0NFdtciAvl7cJ83Y7onb7luh37xhWZCFRU+xF0GfdgKdoSGorHXwftwtovTB
	6WISBhRIF4qWvTPifEyYGZoWVt5vp6qMSzLZq77WDYK3f+rBNOqEqhugNyJu+G9hMg8b5DerY53
	rp1VsU8gUOj7ESAfsS/TVg93ojNyWH+/HGAdxHkAdqtiHgDrdsfz0O+aM63Jr2oCnodwzxPR7yl
	+vVAARmgZ/UZoj7MD/tczOxMEtEbeL8GtEIajE8SMwhGmbgybOHLz5M7sd9KWn64keV+I+Qn9Gg
	WwHytnkBcuJSuhSIXuT6AgFuUgXugKIvbgGw==
X-Google-Smtp-Source: AGHT+IEIb48nV7hEk8FbIF05Ym5OcIu5+err3J+K604V2E7LX577SRyHTwpd/29eVhfrTZO412DHoQ==
X-Received: by 2002:a05:6000:2f85:b0:42b:300f:7d8d with SMTP id ffacd0b85a97d-42e0f34a13cmr4464007f8f.34.1764108870940;
        Tue, 25 Nov 2025 14:14:30 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm37462121f8f.11.2025.11.25.14.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:14:30 -0800 (PST)
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
Subject: [PATCH 0/3] clk: renesas: r9a09g056: Add clock and reset entries for DMACs, ICU and RSPIs
Date: Tue, 25 Nov 2025 22:14:17 +0000
Message-ID: <20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This series of three patches adds clock and reset entries for the DMACs,
ICU and RSPIs IP blocks for the Renesas RZ/V2N SoC.

Cheers,
Prabhakar

Lad Prabhakar (3):
  clk: renesas: r9a09g056: Add entries for the DMACs
  clk: renesas: r9a09g056: Add entries for ICU
  clk: renesas: r9a09g056: Add entries for the RSPIs

 drivers/clk/renesas/r9a09g056-cpg.c | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

-- 
2.52.0


