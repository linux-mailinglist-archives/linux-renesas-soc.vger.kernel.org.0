Return-Path: <linux-renesas-soc+bounces-18289-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3B3AD8EC3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 16:10:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 753A41E4F5E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 14:04:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967EA2E7F20;
	Fri, 13 Jun 2025 13:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VdnTOY6J"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFF41A5BBA;
	Fri, 13 Jun 2025 13:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749823003; cv=none; b=RjNUYyHvnCQHRDpyoW2+wSl67TZ4T4atJtvcodeoV+vSOsUOB7QrWNSw2mnLpZ8rxElcV2o9IWcNwRvpCMQGFyl6srzc2TnQy2XEVt2kDHMdZnAAegMhF1vAYVYcuWwdfmdRLZ21zniPrRAJNHD1dgHkc0MMOp5ynU/IGdME/ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749823003; c=relaxed/simple;
	bh=bmKPAY3xBqMSQfP/RokGKIX77nKuyQyx11a3JwjWjGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OSNJy80WIfBsVKWzI4ZmV5kEh74QCQJIxuyEAlLfIN/22DTxZBX0Wa1JYA/5XJml9aULWCLu6VM0khDXr378riesyPDadRU1sAWDvKh6app0quZZ/NA+WPthoscPTDVxaxJifySyRXJApAjLWhfne1N0QgaeuW9kB3rcAT9yQII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VdnTOY6J; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so14786395e9.2;
        Fri, 13 Jun 2025 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749823000; x=1750427800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OXCZc/yWThmnH6VFvuFKdVEIlsl4KhNUt5hL6JeQTXU=;
        b=VdnTOY6JmvhnXXgxl7a4MGSZwtgX/SazteUgP6YSuBpinmHDh5joFjQRDfJctDxhtj
         DgIvRIBn+pWez0TpADVeoqAv9ejYsayKMnrv4XkEGrfigTLat6OgvIvDmgtxNgmfmODH
         Ge7o2ZQM3vPDjMl4bH69AnhD8ZT3wt1caqUatFMGnklPmmfPWJY+3ZlGnND4DpBDFwKW
         7w025tqusX5zHxWV/WuUOzt3vpkIzZXkHN0Gv9znD08B9T+Nv8eoCrPmS44KUWsxpdKv
         CsUzrYdcPnHuZbeRuLTKGDgB3T8fQfGw8I7+NrwFZdKCKX1QvffaOp+oTQlnkxJDiuKg
         Cf3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749823000; x=1750427800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OXCZc/yWThmnH6VFvuFKdVEIlsl4KhNUt5hL6JeQTXU=;
        b=InpRjY1v/S5Vupfjp3R+YJvXzyK7HENlrQDeN5/ptW1mVuM5ogNpq2Yin7fghJoX+g
         wq+txtXQlA2Q8KEWF7LS7ickzv64IE/TwDqYgfJFgb7xvwKctQBErwBOoROruWLi7OIe
         b6Q6WSitRLh2GG33Uf+8nfPcMNnYN/YJYnCp22i3Sqmwf8+FETqHWjdhz4kdBwgWLdOU
         y2dra4d/drZS1kye7zoYV5U6vOviRQExQwE7IQRdgSwcaBGZ7RXRY/8JD320l+4ew00j
         qoUNM4XbBZH6iJy4VWzVqPiYdd6weFPhbdl30aWHYk+e5WvnE0M2NtzMqqHjs03aG7bg
         EY9w==
X-Forwarded-Encrypted: i=1; AJvYcCUyS7XCgMoV7R5Ke2HrFFzvyQk/VhWVBzPAD6T2VXLoss4uVKi9mvViAsU5dDq3O53CZu1HlHqMS6aUBTqJ@vger.kernel.org, AJvYcCX/91wxSfk9ecgJPJ5uqt1vS9Xfa2Oqsc364A1B5LLTdEbV9YXf+zQwKY75X/t3p4h7OaW0rWDyfpDO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9RAIgk0dMkRwmLWnnC4WErTvKiTTAdDcPmUNPeSuk3S5HFT2F
	olwE4JTELZIRYQQPKh0C49xYYXmUaKR0LHywri3pIWPyqpyGxj5V8F0f
X-Gm-Gg: ASbGncuZ337D+Y1T+W9ZY4k+6Yd23dlw5I7J7qo4lxvHbgI26OAK20CGySN+z2ou/3/
	MWMpHKMFR1d+DZsJ8GIcmPR6EYd5Bs2qBZBTlAblF5NEyWZ5WQmV5A4mcuw/+q14ToZr0l2q/cc
	QVi6unS/2MOn7RzrCg/Mnlwwkwb6uY2CC283TODYEe/7D+glKaZh563xlLcXVrZrelzYRXGgfFF
	UwTyJboeC6GvgCvoic/ebNvoizrv3IFjqQ0M0CuQgwnYelJci7tnquOphhjBzeta2j7ilvvwEVC
	aH4TVimNjOc5HU/jVXlQSIsrHNFGW2uWFNL11lT6+QyeJX3j0q9BTL8CGwnC752QEnYq/7E6M6S
	IIi1b+NwIql6729ZhHBHv
X-Google-Smtp-Source: AGHT+IG0Fc7oTY+hHoETbWwBJIx2noOWVzh0hM0T0VEKFCLOboJeWGGybrpWWfCokw9RgfnXY7+SCQ==
X-Received: by 2002:a05:6000:2c13:b0:3a4:f744:e00c with SMTP id ffacd0b85a97d-3a56875d840mr2901129f8f.29.1749822999672;
        Fri, 13 Jun 2025 06:56:39 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:2c2d:5496:6768:592])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b089a7sm2404489f8f.49.2025.06.13.06.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:56:39 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] arm64: dts: renesas: r9a09g077: Fixup RZ/T2H SoC DTSI
Date: Fri, 13 Jun 2025 14:56:11 +0100
Message-ID: <20250613135614.154100-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series addresses a few issues in the RZ/T2H SoC Device Tree,
patches apply on top of v10 series [1] which is yet to be merged.

@Geert, feel free to squash them in the original series [1] if you prefer.

[1] https://lore.kernel.org/all/20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: r9a09g077: Remove GIC_CPU_MASK_SIMPLE() from
    timer node
  arm64: dts: renesas: r9a09g077: Add missing hypervisor virtual timer
    IRQ
  arm64: dts: renesas: r9a09g077: Sort extal_clk node by name

 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 24 ++++++++++++----------
 1 file changed, 13 insertions(+), 11 deletions(-)

-- 
2.49.0


