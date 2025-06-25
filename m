Return-Path: <linux-renesas-soc+bounces-18730-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F39AE85FA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 16:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 341E6189A365
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Jun 2025 14:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0124B16A956;
	Wed, 25 Jun 2025 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IEGBNrni"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CD93074B2;
	Wed, 25 Jun 2025 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861037; cv=none; b=r6lSausBl4XapX2MP3YAWpMWjsYX/r+8NWOmO5qlESoYO7VxystMpzfvczag+eGqSahG0NFvW2pRjSUafNKIgt94p8AwtYvGNwscL6c2EkkvMFgCiAj0zYiSyHMD0+8Vok4F+82QhYH0zv8U36cd0ni4Pjl/H9tn860JyPLhOWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861037; c=relaxed/simple;
	bh=GV9uWjbzpWJCJyDvrD6zIb1pM7E+jGJAWzF8bUumGbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QqUJouICw6GDzl2JXXpse5r1Ohs1xRegIlxCDtE4aE4BIWM6YiApMrQocqrT4ZvrgA+Icc9CfbzrQsjjN5oK99BZSFtuDV5xvhgmpZZv9xhgb/hlxQJccoQC+RJCes0PuRWrXtbt/gQxkE3mJVsBdZyPT8DY+Y5glLl7s8hIjUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IEGBNrni; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a6e2d85705so1025253f8f.0;
        Wed, 25 Jun 2025 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750861034; x=1751465834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hzWONQZPXuRc902CvudcvoWg6dHSIsx+hHKLfoZbGj8=;
        b=IEGBNrniat6ImG2pVTMEnT87hb0axifk/og1vZzOTyoNbOU5wqFB3rjV3z+aTfIPid
         4HviuSQp5EJB0vbafVV38+DJofKBPuQp/KScJq7RWQpBF3ewB+at7gK6ObQ82qTtMY3H
         lFt4MdBHr8fDPGoe+9t2S9zmSN1PyAFLIkgGhsjCnoJBkG9pj502az56K5lM9PcNc5M9
         zl3gqtVJ2ytOfV3cj2lcGSHnRqW/1P+XvS3GWn7YBZVgBbVxEqvgSD5n7T7l7t6Z2Hsh
         j7l3nk6MC8fNzMwPpYoiqvsI12BimtpyCYbmHK1CSVmtkXDxltiiU3NJjlFBnL0AjrG6
         LeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750861034; x=1751465834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzWONQZPXuRc902CvudcvoWg6dHSIsx+hHKLfoZbGj8=;
        b=ErVw3QZbdzt4YY2mxrgnzR9t1nAzd+By0JwyJd3CqpbkKRbKUB1rANP9kR5wqzSM5W
         dsEuYJWdrb9p4uK+SYlHaIuRk9zL587zb9MqhvZPGbfcKZ8NckieJQoCMZsAYwzfQWbn
         KjQ55tUCg8ah5CRjLhqIJJFz0Nqf4Nh6mw743Y4GmzkfspZsxU2D7G1aaVrSmsgqdgni
         V+TDPVFuKZPFDRBeXF6tQYJhic+FlCoXvQbiNrZJACvH8PdqtEhcloxzdfvJQ9ecDRQB
         tnWrbqYrADMBcIP1XD18ok7AbaXa6WsMFSQcHpIGySP7uZgEajlml9MgVbbOELP0z2Ri
         smIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgsHcUmW8ZF1WLX0DNBO50Z1lk13XuNxq6U3qSTKuBi73co5PlpS4uNw6o1tU80YXn9scSizURB9Fz@vger.kernel.org, AJvYcCUxMpEAQ6kizCebPpn/wykwnKx4uCpXg9YRCz9i2UlKDh7UySKA5FQjHbb9xm2JNfuCcZ3dr7y0QYaS@vger.kernel.org, AJvYcCWzuNdGjpk2DLvSMSnbqlQvOsLDgpw6Cj6P5SHU8BtrZ0lQwgWMsDOo1pvtYlb6cCguPV6n0GoZzu+Uv+SB@vger.kernel.org
X-Gm-Message-State: AOJu0YxZVaahzVP+94muQue3k68ys9/9ZXWZAPC9NKZxg+IKZKF+fNar
	f9xyPc0O998EkBs7HxS+EKcOlg1lH+z2FNmXa3VF4Ssws04DbN/j7kt8
X-Gm-Gg: ASbGncsAfQXTFBOIA7wtY275miBvq9zSsz0p3jnGAuEEJF3Cf91vs413vH2anuqCe+6
	rm/6MJI7s429WC5l13PIuOXacSlYJ1zbuTSAj6VE7MadLaE1jWvGJ/nLMzmMPeRk64PBDZaamMD
	CoGNmqxGZG08OlvUQkFQ3JmYm/Rq44EHqAksa/CkbUXDCZpon322DTzNMJ5Px+JQ7jAK521i97t
	qjtiP1EauUN1QgpST1o+IpWD2oLNjylBrPkJvsVEb2nHaKhiHWAZXA1AI4S/VTCKYLZKgUDJUWk
	xR6XkNoA+YKc5KqajaJaXRn9SsMXLxGCMwy17tPCb/FcOZqWaODsGXcBBafpFQreUHkcrV5FG6S
	7W1PyoLdRRBAafvY4Q7im
X-Google-Smtp-Source: AGHT+IFqL/Byj5Ij3RIfbtTO5X27JLBRaBJXXCIyMhsgGEwX+Qu3f/dQZ2M2hi2yjh6Qc/50fSxkBA==
X-Received: by 2002:a05:6000:2385:b0:3a3:67bb:8f3f with SMTP id ffacd0b85a97d-3a6ed66b1bbmr2725869f8f.53.1750861034025;
        Wed, 25 Jun 2025 07:17:14 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538235a85bsm21609425e9.23.2025.06.25.07.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 07:17:12 -0700 (PDT)
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
Subject: [PATCH 0/3] clk: renesas: Add SDHI and RIIC clock support for RZ/T2H and RZ/N2H
Date: Wed, 25 Jun 2025 15:17:02 +0100
Message-ID: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds clock support for SDHI and RIIC peripherals on
the Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. It introduces
the necessary clock ID definitions and updates the R9A09G077 clock driver
to support the relevant clock sources and module clocks.

Cheers,
Prabhakar

Lad Prabhakar (3):
  dt-bindings: clock: renesas,r9a09g077/87: Add SDHI_CLKHS clock ID
  clk: renesas: r9a09g077-cpg: Add PLL2 and SDHI clock support
  clk: renesas: r9a09g077-cpg: Add RIIC module clocks

 drivers/clk/renesas/r9a09g077-cpg.c               | 15 ++++++++++++++-
 .../clock/renesas,r9a09g077-cpg-mssr.h            |  1 +
 .../clock/renesas,r9a09g087-cpg-mssr.h            |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

-- 
2.49.0


