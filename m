Return-Path: <linux-renesas-soc+bounces-10183-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F77C9B3CAA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 22:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D071DB21EC0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Oct 2024 21:29:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653D71E2301;
	Mon, 28 Oct 2024 21:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HRuY81L4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21CC01E1325;
	Mon, 28 Oct 2024 21:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730150963; cv=none; b=Q7UI2qFBf1hbE/4cDLCgY//qRNn9TVCte+hiop91SwwFpUXfjmhKibLih5OYGO5bjJTk06Xq2ceiqpL1e0obL75fcb+KBPvL0ElnUytbjYo13/BLNFsDdNN1gZ+BOcjVsJBVfDnYKh5mPU62LdTB2SLTwhO2wL+vtvSNmo/Nuhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730150963; c=relaxed/simple;
	bh=KezIDZ9i66O1meSze2SMz72nMUYzJDcX1903Z6S3nNE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pyZunsk7/aoHKkzQjbrMJYYxONCw0DndUT15OPqBYfhQ7YkkitBwbjfKJvp5JmzowagP+L4ZJLh88yUTXTlTHAypqk14m5FrEolm14+pEpUKFOZvz99/g0PUTMwRjsrE+vR//X0LQ5bUyDgv5ruvnvQ0jQPx0TykwYNQnOXH+mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HRuY81L4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d4b0943c7so3237562f8f.1;
        Mon, 28 Oct 2024 14:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730150959; x=1730755759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+22KUD/WDhl94ZsUNKpRglL2tk6jvU5AyElWfNP5+f8=;
        b=HRuY81L4lw4Zi9ZZNmvzAEjpEQc6O8nZhz72NXK6ehZEgzsOuU9f3KAkPyB3mE53fz
         1ftb7UFtXowDs23gTU/YODGYs44Y2yey5A/rtFNLSBm6SSUkv2cC3U6viQlwatziy+Mo
         D5AA7Psmg53EgD6MRXKbPhNFuFu3WXZ1Zs+lLBCETQHcsmzs2I8FH5mWtneXt4uaWjf4
         EmK+Buyd9ioNXBwbqOFqQJsdrBMvUbePI6ND8jlGxjsrC4mWKw4e5OgpHbj6CMpI7exo
         lVw28I6zNTcINpU1lBtyZdNDgTFy0OPcMSV0bRHPgxCDwfJacIrDDbWP0qMOmtxu3sZF
         ESOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730150959; x=1730755759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+22KUD/WDhl94ZsUNKpRglL2tk6jvU5AyElWfNP5+f8=;
        b=Ak+urfKtPDc23WMEWynf84pXjt3uW12myaWa1OPBLrN/Gt7ziBq6sdQzN+J/kAeYF0
         OBO2flhLjHmEPPoTYBUedoJhvUhptJCwuUDW2rjz45y+XkgFsE4Vwr370+zHNoL3ctrz
         QblgAdv6ilSm/jWefGTYlXuHYyW6xnUicK1/nOv859Uwnc6KYwrOm/KPCeN9+TLV8OVf
         4QI+QTs1LV+VPOKO5escbTsEkXTe2yJK2KtbMjX5F4LOsQhrjGT53EccaqXZdmOM2hpS
         aVvOoXwaBlob27MBxXRnO7TJYUwdz5NGmnrrFej35bw14qJcXXyMKOVYcLDyAlzIowPE
         a5bA==
X-Forwarded-Encrypted: i=1; AJvYcCUA+HYOpz0qqIwoKgmrdiENpT1I3iC4D4QOJz6OA6c3Hi2C3tsZdzi0Gh4hfr313tf0vVy3NEd5D8k=@vger.kernel.org, AJvYcCX4FjCKLs8Tg7TIRv7kitNMMzdDy0F6hwmu0gOXITnR8WSLiclTbJ7nWYukm4DRLI/3ddEZhoyUpy5J2zNT@vger.kernel.org
X-Gm-Message-State: AOJu0YzCgnqlsJW+db3uBHY9Ri6KBl8Xt/7mY8IqzhV5BxZr0YfoKJkO
	XC3PWi31NjQh50iZjlhAJAGnPxwzmoHRh+ytFKU2CnHLe7QQ05eu
X-Google-Smtp-Source: AGHT+IFp4WngF6IoigUjlDv+USPVsSl4O1Zt8HaMsq65XejiEmJpUgKxtw6k18mPFR+QNrJabzVxPw==
X-Received: by 2002:a5d:52c1:0:b0:37d:529f:ac1e with SMTP id ffacd0b85a97d-3806120087bmr7289244f8f.53.1730150959143;
        Mon, 28 Oct 2024 14:29:19 -0700 (PDT)
Received: from prasmi.Home ([2a06:5906:61b:2d00:495c:4d71:e99d:a7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935a3edasm124360725e9.22.2024.10.28.14.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 14:29:18 -0700 (PDT)
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
Subject: [PATCH 0/2] clk: renesas: rzv2h-cpg: Add CRU and CSI clocks
Date: Mon, 28 Oct 2024 21:29:12 +0000
Message-ID: <20241028212914.1057715-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to add CRU/CSI clock and reset entries to the
RZ/V2H(P) clock driver.

1] patch#1:
 Allows exclusion of specific RZ/V2H(P) clocks, such as those in the CRU
 block, from Runtime PM using a new no_pm flag and helper function.
2] patch#2
  Extends the r9a09g057 driver to include PLLVDO, its related CRU clocks
  (CRU0-CRU3), and corresponding reset entries.

Cheers,
Prabhakar

Lad Prabhakar (2):
  clk: renesas: rzv2h-cpg: Add support for clocks without PM
  clk: renesas: r9a09g057-cpg: Add support for PLLVDO, CRU clocks, and
    resets

 drivers/clk/renesas/r9a09g057-cpg.c | 45 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 37 ++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     | 18 ++++++++++--
 3 files changed, 97 insertions(+), 3 deletions(-)

-- 
2.43.0


