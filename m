Return-Path: <linux-renesas-soc+bounces-24113-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B34DEC34223
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 05 Nov 2025 08:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43DE4189F4AA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Nov 2025 07:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948342C324F;
	Wed,  5 Nov 2025 07:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="N2WinqET"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EF41A23B9
	for <linux-renesas-soc@vger.kernel.org>; Wed,  5 Nov 2025 07:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762326333; cv=none; b=nJWdf2L3O97iM31oB0kOea21dDFBUTL/w326XfRCDEt5CV/nPNf0ZmUktkra8SNDmUPIjtxzlEpFPiShTZgbaXaBFXLJnz6odafjyHZcuPL9/RC2Eiv0MQjd9LIIGIFLqLwru4kywA6k8cUpQWba2lqo3mpEZQp457CY/2FV5kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762326333; c=relaxed/simple;
	bh=VgW6wsvMJbO2Jr7vF/WiFeIjviPMUTU56vcFLD7TFzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hPwpvYfyF0+ZtzwDK9IZEdJLTvwJ4NKcq5BE4Y3IDtBHRpRHf/oeWyi/6ULbmg0J5v55J+ucTHI7+HqNfTXEPeZjlkcsozDTSNRNsSP8Co3BK2FxewX9/AIcuc9Igdx6VLRemlGaCPa793AXWXnoGQTc8FmI0Q11KOTcuw+H1EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=N2WinqET; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775ae77516so9076105e9.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 04 Nov 2025 23:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762326329; x=1762931129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kPFfOU42a9LX/ACTIOGykRbnsbucNZCI8/DjNyniCCo=;
        b=N2WinqET03KavT3Uj58D+bDnE9Db6x/bZ10Np30y/b6zcA6ceDeJ24riFjvDRlZzLQ
         vsqoo4/ZMYU3fAJPwK050S8i5xiQEC2iB5QfEaNuFMHhZc7dtJKkBCjxK24ITiBuv6+6
         9wTZm0zh7vnngPstc2QDGABcJLUVB8ElHtow5dw2E+SzJl+qbCfiW1OzshCJMsFgPodk
         MqgziFN98Egd93uvSxiao1lLsi4v1afUPoDDCHN6dfJ+7BcZCUQ4q+JKhfKADa6FYVa0
         GIjhcJDi5RkQmQHT1XPk+xkfFbiillMb3sfNA16pB1GyCoFOwHKlaeIyMOhhCMEBAbmK
         N94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762326329; x=1762931129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kPFfOU42a9LX/ACTIOGykRbnsbucNZCI8/DjNyniCCo=;
        b=iKFE8o7HWqzJUBzL9Zo0+nUxXXxdouIhI8OmbjvbIwo8FJE4Yvr04iSNcI7mubiJGK
         f/fg6csyraIM1yUzVMjSWSzixmU6ychGKTtnUuvcvEoSEK9Co+LVczh4KCSl3LEUPMxN
         3R4pghw0IVyVBwswENhRWxuGTEDO/IvY+AXbqFZwzFl/Ps+DmdZg21lzrUatN0AMdpO1
         oTnjZjZBsgpUfLTLjtrOD72XkGOUidxocRDXSzaHZyPFYsUwDHTR8PLM5Y95nfzTy0AK
         QNpC2EtqMtz/NstNnTaxy+bB7rQXcPtOx8Jr2C3bBHQmXd72Z6zty5zZbWuiCp9zt+ZL
         qBUA==
X-Forwarded-Encrypted: i=1; AJvYcCVlkl9e95p5eV6oDPFBm4TdjQqhJVUbbs/dzW1V2oeF9LEPUiJIAP2XdDbLf9OzZp0ypB6/5SpAqA0xBtXLJSR+lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiilBbHHx9mHoEGduKViS7CpZsncX4FiMJRQtL7D8vNXMXBEE1
	TAyKZbm1eeFTopyGToE2BNnV9nxxlgG1hDao4rvlN43S7swKzQn4Zy6FrvXC/za3PEw=
X-Gm-Gg: ASbGnctm2Tm9QXHnGK8mf/aCnN/MwfsiuM1k6N1L260B4RvBsTkwD6cvoHUTE+z7oH1
	auj5WiEDfQSTw6X/5hrybvq2NaXXeIY+i4ETmzKr+r6Lq0T0pzfOT1athDFgeRCJSQ1qfMk2+4g
	+Z9gfNgJQOC8dHWN/wof3+PzX1omHUTxrhmd1D9dZFaweI/NIDKOCMj6gntCcMtSQ1pAdOAQMmK
	SBDDM79idTpgxtbcKWjJBa6vw8AoJJ8fi6pdYLwoNUpPQvYbmenVf9RKN9fX8zqcAXDsnji8BpZ
	8U0vNsw6u8rUoEvhpND2a+C34kCdwSfG0zgbiZRGXLeRDbVCqaJHta6GhvwJWLvAVY+pRFzv71I
	vH0U3QU+4/Ywapg0VVhUZ9TyjCaTI152xewh28hjF2TWZlkEui7CBzE7/OelW6xtUEhyNMeZn7l
	Tgy7C9bhN8MC4xGhQXsuIi8cpY2MPG0g==
X-Google-Smtp-Source: AGHT+IHSvh8+ekwxCLTZO76vzeOnZlgCUz2t3qfXI0Rb14HHoHI2UG2ksJtjK9Mg8ULpEdrsjSfU4A==
X-Received: by 2002:a05:600c:3153:b0:46f:b42e:e3a0 with SMTP id 5b1f17b1804b1-4775ce2bf06mr14162675e9.41.1762326329397;
        Tue, 04 Nov 2025 23:05:29 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdc96edsm30520685e9.6.2025.11.04.23.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 23:05:28 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	magnus.damm@gmail.com,
	john.madieu.xa@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 0/2] soc: renesas: rz-sysc: Fixes
Date: Wed,  5 Nov 2025 09:05:24 +0200
Message-ID: <20251105070526.264445-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Hi,

Series adds 2 fixes patches for RZ-SYSC driver.

Thank you,
Claudiu

Changes in v2:
- added patch "soc: renesas: r9a09g056-sys: Populate max_register"
- use all possible registers in patch "soc: renesas: rz-sysc: Populate
  readable_reg/writeable_reg in regmap config"

Claudiu Beznea (2):
  soc: renesas: r9a09g056-sys: Populate max_register
  soc: renesas: rz-sysc: Populate readable_reg/writeable_reg in regmap
    config

 drivers/soc/renesas/r9a08g045-sysc.c |  69 ++++++++++++++++++
 drivers/soc/renesas/r9a09g047-sys.c  |  79 +++++++++++++++++++++
 drivers/soc/renesas/r9a09g056-sys.c  |  69 ++++++++++++++++++
 drivers/soc/renesas/r9a09g057-sys.c  | 101 +++++++++++++++++++++++++++
 drivers/soc/renesas/rz-sysc.c        |   2 +
 drivers/soc/renesas/rz-sysc.h        |   4 ++
 6 files changed, 324 insertions(+)

-- 
2.43.0


