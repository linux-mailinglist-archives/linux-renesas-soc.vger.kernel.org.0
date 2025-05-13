Return-Path: <linux-renesas-soc+bounces-17053-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 06D15AB58F3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 17:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B2CC718883E1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58F7E28DF08;
	Tue, 13 May 2025 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPRleGCD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E2C1D555;
	Tue, 13 May 2025 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151204; cv=none; b=pOMZ+wEPdyRlIFtjP5DieBjxbcFZab0DLf+IeQ63s58F9O7hFFM6g3zkPjxr8NmeYTinRzHkxGm+fhIu/G5MR7dneDYzYih8zWp8CV3TL6BV9DuWi2ka5gFaG8vxXlIakrngdciXv4SUYXB28zKIwth6Rfn1KsL+IoMq8ZYGL3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151204; c=relaxed/simple;
	bh=F6pb04N9R1GhSRyEAp9wOUtgZ1wafEJ2xS1pPGhppS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q4TVTbUt98RcMzL8sdfmo5eMWOARaQjIDGLgLYBjTH2paRVeKiv28YO40Jcuhh4Nap1uZW4rFHZ4gLA9qT25Njfw7qpqz4fuSIradmE9TF4/fomC7M8CK8jcxz3d3n4LIznhexX7dfyjc1uzR7z6J5IBLW0HSVTNp+HGlg/kKxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPRleGCD; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf680d351so40268325e9.0;
        Tue, 13 May 2025 08:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747151201; x=1747756001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O7tRkhYP5Mnm9zFdTZqXveiDxUgwkFxx88NMrHSWtTo=;
        b=mPRleGCD9EwDTkWljzz0fh7uxMZFgxRJH850ZmsW7y6z5PHMEM95cB1J0Lcdhfr8hO
         SvllzXBm1cTzscpC8bwkXpKGssqYg/WGQXv/aVv/YRF01/OOcIdEZPWEFBQfS9K6VS1e
         a/xqM2ExDM0cWZCEtfje0OLmJP/k6BsWUPYIB9qXMJX7MLnG8CQOUhY9tk3edRmGYabc
         OGM69goNfLFn+tzdFhdcKcYPmdWvdfUzeZmA4j686gpz0faqxy+FHJsq/hrShjb+pb0m
         bCtEHLQObSnbf9zPLB/L3JlraTJObXr5P7RqQLsil6s0SkOutyYQxOaZsQjA5SuLZhZA
         Uenw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747151201; x=1747756001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O7tRkhYP5Mnm9zFdTZqXveiDxUgwkFxx88NMrHSWtTo=;
        b=wHc+3GMALFv1i0pPPQl56fetCXSj+yedmwEeMxxO5tSCLUjjeakfCghgmb895oBjip
         DoUyRYBq+8uGSYtS8zkyLdwErvgfNI9JSQMH+xcKkws4loxwn5DQclIR+trAtL53yX4B
         9nvGryNC5iGzT9QfwY0PHTSNgfMthh+v20/6cq5YQH8b0COOQoVr7farcTC5oLi/XIaI
         BzroiiMQUTcaxxl9K4acvJbnM7S8jCDjM2nZUHUdlrVQt5z1S0/8O/Zw4mIIiitHfBpc
         bVRUEyG7UAk88O531f4d26NWuzZJqDN8E5gcGf413r1pQyfSTA5RJiAV6u2Z/hnulSxe
         nHmw==
X-Forwarded-Encrypted: i=1; AJvYcCUxJbHaYDSYGKfx08zCe567cQHpnpL5NLotnBQowDJP/UQRa/wSx8swz7vryB4wUW7bcY0teRDHZ1sgS+PoAsQtJUA=@vger.kernel.org, AJvYcCXMQ6C3aGk2ZftVhnKoRYkJwTKlByPWpjE02NqeWuqYVsQ1+U+Zdf5ZgybZq0TwogctDLuNjDeWuFQGV6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWOsXDWC0+y28IDA9Bo0LDfOWsa9vTtaj0qF/OCDLSP1W/zEa6
	ga7hi4AmSxOOULIHraUqHx21uGcP6OBKd3sEHaYNDfjFUxCpFeIx
X-Gm-Gg: ASbGncsGDq6pU3BrxWY5hsL+ctheNb4sBY4pPKA2P/nPE5IpMxAo36GwTapuNFXuqXM
	HVjFK7WtTASNGRKvNoaS0+ZWSn1spPK1hK3NNcgJXJTAmUnRicW0F01DT5uLRTQYI4RITiO4g43
	hGb4SdtQKjU5bcF2nkPPRGAZdSgBx6op1lAJEHpzBC8JPjMf31lXXaEFAs0j95f+E1CZC200IZb
	QO4VXut/Ym3g7wrPT9INW/cdiTYm4RoEl/22kPuuoT5RT0hhwJDFgvjwU+CBC9m9fSitKIHnTn9
	ysb0qOZsSdo6IZ1dODcvz6VGoUHS9rvDzJDXBnVvBihqr7Yr8VAKsuYZPn8qapUU1tYjkdhF/4N
	Yuqf2twblCA==
X-Google-Smtp-Source: AGHT+IGokwGqiacd4IBuWGEwZx0KK6IzL6Q5hkG+VsJ43mIxRLFNMXnzama2zmqmDYZdvqAwvKfDSg==
X-Received: by 2002:a05:600c:1c10:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-442f1a22f93mr431265e9.4.1747151200624;
        Tue, 13 May 2025 08:46:40 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c996:6219:e8d3:1274])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d596a5e4sm183724645e9.31.2025.05.13.08.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:46:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/5] clk: renesas: r9a09g056: Add clock/reset entries for GBETH, OSTM, RIIC, WDT, and GPU
Date: Tue, 13 May 2025 16:46:30 +0100
Message-ID: <20250513154635.273664-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds clock and reset entries for the below modules
in RZ/V2N SoC:
1. GBETH0/1
2. OSTM0-7
3. RIIC0-8
4. WDT0-2
5. Mali-G31 GPU

Cheers,
Prabhakar

Lad Prabhakar (5):
  clk: renesas: r9a09g056-cpg: Add clock and reset entries for GBETH0/1
  clk: renesas: r9a09g056-cpg: Add clock and reset entries for OSTM
    instances
  clk: renesas: r9a09g056: Add clock and reset entries for RIIC
    controllers
  clk: renesas: r9a09g056: Add clock and reset entries for WDT
    controllers
  clk: renesas: r9a09g056: Add clocks and resets for Mali-G31 GPU

 drivers/clk/renesas/r9a09g056-cpg.c | 155 ++++++++++++++++++++++++++++
 1 file changed, 155 insertions(+)

-- 
2.49.0


