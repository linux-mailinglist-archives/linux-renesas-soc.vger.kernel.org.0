Return-Path: <linux-renesas-soc+bounces-13249-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E7A39B40
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 12:44:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5767B3B43C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 11:44:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 206A323ED6A;
	Tue, 18 Feb 2025 11:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f4yB7CRB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F2E23C8DC;
	Tue, 18 Feb 2025 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879051; cv=none; b=DlHJc3TyPCFaCtr58vmwJ4v1hl2mgcS3dn3q9xCVnT9zEiTeZRtKhrnSRzrbt/odcYkzg7OHZdNlMzQTSBreSqbRNFhkdfeH/T1o+EwzkODB56brDK4Sw9m+CHnYKzuxoEUVsQ0qYln94lSqhdnhuIlBeEWzX1Er5q8tVsB2Lgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879051; c=relaxed/simple;
	bh=2DZpm3wvlIZq4M7HsL1Dbvw959jdbMFXNCuoqidgKR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C36s6UvMme5jMrXp2ifVi69ki1KGb2anzwrlO94oKDt8YLxceLRhToMv9JtiEtYjaP+T5X4iGPKl5F45JGy9Zk5H74eB95AaagHtuRaMCGK0QEOKQpZJnHtzaOO0Ka9U6ZayxLDVNg5eHa/Y8ldJvnJhU3fh+hgbHRZ6qmb3dN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f4yB7CRB; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f1e8efef5so2891686f8f.1;
        Tue, 18 Feb 2025 03:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739879048; x=1740483848; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5z4o6dJvChSN0ZR/gj1rodySH65CjV+rNjcrj/DiSyM=;
        b=f4yB7CRBoiNPOEiQ+ghWqwzL60Yl9IerE6ygfJJflp+tclG09VU1G8Jgy6YD0Arvd7
         aJCrcSkQKcAQQ4K8It+avjmMKQqZtomI7cwWDLk4RA80By8Mkp2Rem88GyjOFUFNZR7T
         6tP2PRNnl/yGxo6WRAnTt/3bA1Sqh37rOaj88UYaIDDnKVN8beLq6nGk2jyJdCnWSGQ8
         lzH3jC4EddLzes/u2rexhtZMlenE1oQezJ1FCbfGXyrtUxzpS+5vzkNidbdhvveAuZ14
         GyxYStBi9Tvdb0m+pbwgHdVyWAc+4UhJfeu3HQV3AG0XwmyPoLlT9T/as6ubdVT+62w4
         kkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739879048; x=1740483848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5z4o6dJvChSN0ZR/gj1rodySH65CjV+rNjcrj/DiSyM=;
        b=iksitsmE8ocIsryUfjLukgtG7a3FM9OsdhZC0395JIkmQaAFpAT2dlVDTd0/vhQakH
         C6qbQX0l+a/jig0mdPjgHEwKismm5xvC6RMVCMAsPXHxX6iUEnXtZCUAeqswapeEj2Hy
         BmgW8NRx+v3gKzDsgrWpII6fxD64mfPPKNZerpanGVKUOaXUTSuhwASPuQ8qv8WV5kvX
         kN0latQM5iCH9tnt2Q/Edxma36SQu3iomdnHBoJkQ4lxxjv9gDHIcu8L9iVOAoxArY66
         0UdknW19p7E+v8z/V6dWmT0RG6GzkS3r+uiT6iUY3CG5Bn1fyVqYWzDy6xw0v8U2yYNv
         uLkA==
X-Forwarded-Encrypted: i=1; AJvYcCUaYF8X5AkLq9Ead2fMwck5xUUnghVWQbpIvgw2t1oYROiSvnSKMRPhp6mq3TjSqKdOjGQoyjjf4AA=@vger.kernel.org, AJvYcCWhR8x785ByAtMdMCgR7pyOcEQc5xMGJ97GCSE/oM8uX5Dqnex/3zjmgXCmttEG53PwMQYdFsewyBF1m1Of@vger.kernel.org
X-Gm-Message-State: AOJu0YzJFsWhjMIlL5K4tCVbSV/u28AxCxcxE9340FBXyfDcX9OHD+S8
	FglXKSeM7IDoX5M5CTeBmD7DICwNIdldz7spx8eAzdtL8Y6MpX9E
X-Gm-Gg: ASbGncuU5XiijfZ2MpslC9+fCsq43+fds88U475gBzoC3S1H2LSJwTA2gJbya4FgQXv
	v4Ess23QjyXuck9DAIboUOKQsBH9qtjJwEywRl73kICLzBxhv2BvUNNvhEk4Kwhnndc+NFqPpDY
	CYaU6u86Kzto5IjZtYISIDLH0x3MPC3YCBDXuEXEQQEYUEEYzcY+F5V4F17A8/ze9bD8+kzcV/8
	p1pr8JawTjIBN1pjFQ3mtOU+6YYHvbGgg2/WNhxJ3O4vbMBO9S4jRGIIArMgtsecVOZDlVt0aXE
	vKk+6mGWPTyDNHtT55QzppLTwsTeGqpkO8XClREU8Ys6
X-Google-Smtp-Source: AGHT+IFBaYoyAJwhj6xhRHBQf2tT8Kmb4yusInS3ieVwpgG58bltnNEM1wZUgdH7vwwIz8asSNAm/g==
X-Received: by 2002:a05:6000:402a:b0:38d:e48b:1766 with SMTP id ffacd0b85a97d-38f33f118c8mr11288666f8f.6.1739879047310;
        Tue, 18 Feb 2025 03:44:07 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:6940:cc67:5b00:b151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915146sm14997029f8f.56.2025.02.18.03.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:44:06 -0800 (PST)
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
Subject: [PATCH 0/3] Add support for enabling PLLs and add GE3D clock/reset entries
Date: Tue, 18 Feb 2025 11:43:50 +0000
Message-ID: <20250218114353.406684-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series introduces support for enabling PLL clocks in the
RZ/V2H(P) CPG family driver and adds clock and reset entries for the
GE3D module.

Lad Prabhakar (3):
  clk: renesas: rzv2h-cpg: Move PLL access macros to source file
  clk: renesas: rzv2h-cpg: Add support for enabling PLLs
  clk: renesas: r9a09g057: Add clock and reset entries for GE3D

 drivers/clk/renesas/r9a09g057-cpg.c | 14 +++++++
 drivers/clk/renesas/rzv2h-cpg.c     | 61 +++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  4 +-
 3 files changed, 76 insertions(+), 3 deletions(-)

-- 
2.43.0


