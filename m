Return-Path: <linux-renesas-soc+bounces-23826-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECC5C19177
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 09:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 108DB561587
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 08:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9A2F314D27;
	Wed, 29 Oct 2025 08:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBaLoI6F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9E030FC2D
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761726067; cv=none; b=VWPK1skvlsthZ/J3Msy9mNON0S15UxLQvXlIaYReJxc5Vwpd/Xb6L1Yh/hOp+b4HzPfBblag1wf+F0BQ1AgvzKXoC6XePAgGoA1qAXpiAdLhoiDlOjx/odLRqoDxjvXrL5Br/16wrOKhx8i4W4g3JYfgrYXrb7HVBUVLrI8iO+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761726067; c=relaxed/simple;
	bh=qZoW7N0sN2JRmXRUOLhAa6wR0SjQGEcDLutTGWrtq4s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UPVMqloJpupcTSyDV1ku58BwNBcKxFbD8DJCY5puSH1IVBILl/on8k+/XX7qx+JJT2zXNs9OjhtMM1+9vWqyZMo+JOHtlUMEWSG59PDWB8tH7zIsrXprfHjyInTLvTCGjF6bDyFeon7kwyx32RQiIcEgjV9Qt3ziQ4nK3ke5ApE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBaLoI6F; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47719ad0c7dso16220485e9.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 01:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761726064; x=1762330864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6pJvu/AhBQH/Vqyc2G8OkoZZLbCOtPgyePdybPKTWJk=;
        b=XBaLoI6FmnZ4QW/331CUZpS4EexBHt/2D8+y6ePD0kETOZjf0893sAgjvBGcftQ8nb
         QJUSzCzC6VohBkDK8fZ6WOYyIDZQWiKX3SmZcwGh1rSxgtxCGu6+V1cCrUOh1WI1cw1i
         G/PEOzBmm+BRKbOH9uiagSmOVWmyBV499W1E5/nN/LrYZqvHUXP60ezCMVUXAghE2ZZp
         o2aSxku9CsOxA//EwggqEx4ZVsJuaR8wJUC+CNVcX7uXechBSHdh8RtEqRfOHCVqCLgT
         iyUHQHQvC1CKI92QBLW/fSHnTmB85rsKkfEntZrzqJ8gXiZv0yf6XNuXaA5VdHjBmxyo
         4WPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761726064; x=1762330864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6pJvu/AhBQH/Vqyc2G8OkoZZLbCOtPgyePdybPKTWJk=;
        b=o33SbiuhvGqxuOu9a13vXpTgsRTI/7ws9YbLIdCAoxWa4ErlU9ypkp4bAQH21rOczK
         seoQGDiJmP/ceKJ2/yGqNHlNjZb219h9A80d6vlBEqTz9Z5Id+gQzCzwTe3h73sl0WD2
         NxB/89883Y/95T2arq44WDiaEo89MJqaMDTmPk480zpRrDmalj8eW7MEo79zu2ae8A64
         Tzg14vlQN1RbvlJE5mwtNHgXlu3duNH1sO7CHxMZosPGHrvL+HWPzFFz/CIJlMMf4p2S
         4lcldzBMWVXUP6YNcBP9GuJL2q8uJliI0tYNoyTHlEZSRG5kz5154KqhNEaMNcAnP0Ao
         yvMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFHN69kMRUmCOf6/2B1NehqWQpOf2R8Ntr0/U011O/Ln/4/UBChBW0IigQzBwOFuqqN9jsZhAMUQtlqkjvQRonBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG6qabzgaOfRuqqnvDYCVlFw1GnNu4tXyKdPlXOx8CnHD4cvZl
	5bU2r5h5Icg1RAhRCU6RqFInGRWMsnvsJui+F4ztzhwFoLTay64KmT+F
X-Gm-Gg: ASbGncsuhnOOhGHE83Ky9yW8dRhvMqKhHCZLPTAIUw80NAGoanI/I/ZS7uB5B5azZcN
	3iMV2QqfsXt/z/mbexAHQloGJEckEohrHU73+3iypiFGCiPvrMGJLNpeAEzAJomq9vS14ZG5pcX
	qe8nYCODUvyyIxPUGOzPuLq9gIRhFI5VIbfLSmGmwYef7NIn02wpj0dTYPBKrnkO27yh6euY9z4
	jB1nv+hE97Vv4eWSyrQVG1nlN6uUm0s1PX2kRrQ2Z5LK7TWsaOr5f0JsDYz7SrnPLVqyIqdo5g2
	3opjMi2QufnqKZKQ6ZUob4oY4qjmNw3HBDCQHP3pve28XkfUMWY5fjWLR8lj0VKmWzqY9U3dztJ
	PJ1qFODWRT/qy508mDTj+Ps0sivVL6NKFCvWKjUKfo4vhqkx8G3fwvM++8ALbj0cZAorW5NbmtQ
	22HeHFLp1q75kgfvyPvfLGEXeZeespQGW0lLquFr6HudlPCrxXNwcSmI9NUzQL
X-Google-Smtp-Source: AGHT+IHuZVrK8iLdLDMqrJhiJBdDaaYTleDzT7XKu/JdrTppl/2IYxy2VXVcdkJYm65pKirVPO41JQ==
X-Received: by 2002:a05:600c:4511:b0:46d:cfc9:1d0f with SMTP id 5b1f17b1804b1-4771e1de278mr21430785e9.19.1761726063434;
        Wed, 29 Oct 2025 01:21:03 -0700 (PDT)
Received: from biju.lan (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e196a22sm35191915e9.5.2025.10.29.01.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:21:03 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Fix deadlock during RSCI FIFO overrun error
Date: Wed, 29 Oct 2025 08:20:55 +0000
Message-ID: <20251029082101.92156-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

This patch series aims to fix 2 issues
 1) Fix deadlock during RSCI FIFO overrun error, as wrong register used to
    clear the status.
 2) Hardware flow control is supported on all SoCs. Fix the binding.

v1->v2:
 * Split the fixes patches from original series [1]
 * Updated commit message to make it clear that hardware flow control
   supported on all SoC for patch#1
 * Added Ack from Conor for patch#1
 * Added fixes tag for patch#1

[1] https://lore.kernel.org/all/20251027154615.115759-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  dt-bindings: serial: rsci: Drop "uart-has-rtscts: false"
  serial: sh-sci: Fix deadlock during RSCI FIFO overrun error

 .../devicetree/bindings/serial/renesas,rsci.yaml          | 2 --
 drivers/tty/serial/rsci.c                                 | 1 +
 drivers/tty/serial/sh-sci-common.h                        | 1 +
 drivers/tty/serial/sh-sci.c                               | 8 ++++++--
 4 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.43.0


