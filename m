Return-Path: <linux-renesas-soc+bounces-14935-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D243A73E9A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 20:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34968189E647
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 19:33:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2456D17A5BD;
	Thu, 27 Mar 2025 19:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHGIh9Q4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CDDA55
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 19:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104014; cv=none; b=Hu7XDS2aRXpwWMkCrkJRx+KqqL09uHkIpKoyYpWefaBEQPwzYrBJxd9+6X9lkTwI9tNN3soTalU751F2lN7T12wuglShX/8Iz/8ApIOe8wTa3Q/zjjdAJ5lFHMhnYOC16a1+OVjA8L/fDcEB4bXnfYmTi0q7dkexOcDoNn8PdJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104014; c=relaxed/simple;
	bh=+e0AnIPIxSpjT+PtDQYyHX/RDZnB+X6dHsKUsrzXwYM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DF1abJ1ffknl53w0p74+pfr6UmuAGJH+oSFgx4pZSAe4dL+GOgfK6GoqOZ65s2yIs4rlaTXHPY20DvneRbgr1pd7tOwi93yudFQBpV9uPaN92ElmzryeRINSHclWg1wLn+0UvgvFKjk7uhLrBPVORcsY9Z8OizIuBc1iqufcJXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHGIh9Q4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso10693135e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 12:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743104010; x=1743708810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fW82N5Y2aFjPV9Ky2VX4JjmqivwbT5R1w60ctovY94k=;
        b=aHGIh9Q40WoqQGjyx5RANJAwyMIwetrpOpadVsYfNBSYsvfx+En+WbTXmE/LL8gwAB
         29oMEPOarL8RuONTx/huFYYy/0UlYKBL+Wchyl6uoGostoILKHriaIdzXZqtsMAZYC7c
         g2Wk7zFoSE3PAU3iZWg2O6dLwQrcCGlDzwzyv7ng2oehpHQEKKXCbx0zZSJ+kQsP9iY9
         HmupXvVM9gVPda6wzjkjV8LnVattEUIZUnsKdRevYZ5JYxkdfHtCCosAbAJyHtgywR1Z
         gLweRofMeA3ZlrgVzznjmW/t2nOpZQdduPwOxmAJ/0B+D77XK5tbQaeGsnjlTgTMVBkB
         hULA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104010; x=1743708810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fW82N5Y2aFjPV9Ky2VX4JjmqivwbT5R1w60ctovY94k=;
        b=rAzRSWRe1rRL0KxDRbW6jY7d8PquikBGOf4yRqjYWAmJiTRzE4gTQqD7Do5TWD58zC
         5/+RmH8l/jdls0oW470KWF59Yrkoz9n2UhNT/cP1PR05wKLhq2ClZy5IbnanWmV8Dy9V
         2zbCAvGYGlflZZBPi3npVUMkwr2hmpPVc6QBMXfolCXVN/JkTaZhUoQ4+YkT5XJrwIjg
         al6PHOdfvLW6u+7qIlY+kb4Gq+C+/HsUFAjPLq5Z3d51+eeGyFIE1GLRFN/mg2l4jf0m
         eq+On3bKdB2UUHutAadngS8wzXueAw7iucs7vAQHoKG7lSe96lviHtYnwFMK1LrxE0Fj
         /A+A==
X-Gm-Message-State: AOJu0Yyu6r4iyXHz2DxkRUkJunWwlfceM8BjAoxH71lIs/wJb68QuunI
	IzWcZ/+/XHJAr9NYcfR5MATWjz0I8GNyGjdOPJ2cPcPyuIX31fPt
X-Gm-Gg: ASbGncu5mh0s8jeQj4ONm7HfwSmvj5QYwo6UoCM/cPTq1dIDCXDVXvY+x8jb/q371gH
	lKPpS/Edv/jcNJbKgUL5Sas4wxBRzY3WOqRVZBHWg/LZFnf7XgN6cm5KZ8zdhOYW7p6k659sgjp
	IfY22RqoJ/p1OSdiFHWbPYUPZYhjJPcIrZnUX5NubAlMQ/dLRbp4hLS+qELmXHLeR4JBRLFlQBP
	7mg6Pu46PqresN576PyHrmUUYtrgG3nx3aTL1opMQDdeDDe3Ba1zOGrb4lfEluZVNbeM0dYZUPB
	DqunN3o5DVXaSHmvxHI6XOpQl3S/ctXLP4CBAXZ/9g+QTSFqq0LrRoiNdNJ6tT+BTdT0gA==
X-Google-Smtp-Source: AGHT+IHhWhCoDxNvmi94hJSO0sekJqfcR7b2A4Gp2XuYxR8Y7r86Ivbr2dD/yEDMoKHuh4/3mAh8NQ==
X-Received: by 2002:a05:600c:1c86:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-43d8a2f4f04mr40720035e9.0.1743104010120;
        Thu, 27 Mar 2025 12:33:30 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c36b:2e01:9e11:8d7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d90001531sm4039265e9.40.2025.03.27.12.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:33:29 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC INTERNAL v2 0/4] Simplify Renesas SoC Configuration
Date: Thu, 27 Mar 2025 19:33:14 +0000
Message-ID: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series simplifies the configuration of Renesas SoCs by enabling
all Renesas SoCs by default when ARCH_RENESAS is set. Since ARCH_RENESAS is
already  enabled in defconfig files, explicitly listing individual SoCs is
redundant. By removing these entries, we streamline the configuration, reduce
maintenance effort, and ensure consistency across different defconfig files.

Cheers,
Prabhakar

Lad Prabhakar (4):
  soc: renesas: Kconfig: Enable SoCs by default when ARCH_RENESAS is set
  arm64: defconfig: Remove individual Renesas SoC entries
  arm: shmobile_defconfig: Drop individual Renesas SoC entries
  arm: multi_v7_defconfig: Drop individual Renesas SoC entries

 arch/arm/configs/multi_v7_defconfig | 19 -------------
 arch/arm/configs/shmobile_defconfig | 19 -------------
 arch/arm64/configs/defconfig        | 23 ----------------
 drivers/soc/renesas/Kconfig         | 42 +++++++++++++++++++++++++++++
 4 files changed, 42 insertions(+), 61 deletions(-)

-- 
2.49.0


