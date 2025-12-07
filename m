Return-Path: <linux-renesas-soc+bounces-25632-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A2107CAB4DD
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 07 Dec 2025 13:49:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 480CA303E669
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Dec 2025 12:49:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923B62D8767;
	Sun,  7 Dec 2025 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gbu4CXgc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0A24A076
	for <linux-renesas-soc@vger.kernel.org>; Sun,  7 Dec 2025 12:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765111759; cv=none; b=hh9LtH1hH4kOxxDnb7K/NZa0M0ibuqTurNwgwzER6TZUHeBn2plWNU6yDP26aIwiHSgkkFMH1DNvUw/ng2JvzfeQ+70389XuDlYrRtE02vyzc21ohQRlgGnx3vgg08P+r3vaBPTDHFUgo//q9MD3RE5dI4xmqFcu4Ed9WT9TgKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765111759; c=relaxed/simple;
	bh=FX+8sBh0D0k7gtmDN0+MFagdL0M/PD/C6G2dNuAPiNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E/yunIuEdIX47GYU+494efPAPhTZpwXFq9OZsCkwjgEZUFrMWy8hvOOA6NoHHKwDoW1HCFAgB6+ordhjTv8CIPgqU2ybLJYMZb1XoGz0rqd/1iID3NUUZbrGopGQCOhPpOOygsE4ia3Amk8XL8ctrye0JZfC2yCHCiJJFFVnqqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gbu4CXgc; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b73875aa527so517500766b.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 07 Dec 2025 04:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765111756; x=1765716556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sgZ0eJYW8otbjQ3WIsasw8sc769o73QNisF0rtObE7A=;
        b=Gbu4CXgcobLbuAj9ck1oFBnQedc7+Bu1PlGolw2LrnP5j/g1qL0lm8Ro5GmL51A+Ax
         mI+bcwIDtXuwyNGAjjblpNM8i+MMRcdY/eip8V0vJQ4yVLOHOGoLz/vgi/p+tMmjS2MH
         CXfwEwFk16FU/pbYhkdnItRwUILjMyOzj3Qp2QY5wYeLmiTWh1SnmegIsPt76e2Bj5Gt
         RIr91OW/2MvKAO1gTWvwi4R9C4ygUBY0Bn/J7Rkg5qL/kc63fqq/FcznDbDZA/HDzPae
         C+9C+r5bsDHw57IAMrRiqaLSVZrbUwXcw9mNh0P0h48SAkrNkL2vqnMVqf3fEwzKgJ5A
         KXiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765111756; x=1765716556;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgZ0eJYW8otbjQ3WIsasw8sc769o73QNisF0rtObE7A=;
        b=kVrJJMPYark81L4YoH7IvAolLv1K1MDHZKXCtwO2t8XZt4a6I3HZxq59Veb+BeT+bO
         DvcLWGWS4Bwl9pi54w2nuzDvkYgHQm/GUuO4K18ND28/9T9pwSC/BwC5/YK8psYVyvQ0
         0jsL3gkf7ryIlgCzlCVFKsZ9KLkr+1V6uBg3UXhIb8CsQ/kF4OY8a8BZ7WBANDFG+nTM
         jwV2aSN2vOyYGLeI4sXD0ZIFnpG8OeBVUSvXnvRGDJZmypyHI8nWzXGHGRmycbMPfJ8d
         HVCZt19cqcVGkCt+J34BShOjDglBGmpkmVt/O/wnrAn2ld8uMybOeGoQPZoJcXWj+nNo
         KR7A==
X-Forwarded-Encrypted: i=1; AJvYcCXdvA8bRqHzsUeEZrPxPNSUqkJuf2RmqMP0cfBeW0bjCikwJ2wxboxi8HXKNGcRKY+ztm2ww7z5lPIIvvURXc2jvw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQdYOj4IN/P45oC8tlFL19WrtxnnYF6XcBFPwL2HBBNArceI5T
	tuYnLO23nq27EBkWkaOSDWyVFlP/O9QjMOXL0sDcK17tAZsY0fAj3Chs
X-Gm-Gg: ASbGncv+PR0dDaGl6RRIDMDQ77WoRPfhF8/QnQKyIgufpNYQx5Ca6HepqZA1oYgtu1i
	yaCcTEi1+v2s/c1BLZKW5NRuCfCoxQZoXnjrEy6TKy4Ew/9YOJVAu1XRBRSnCynpKivirXO7qGr
	tRByisvZ2Nzkd5IhTfKGe9Lqa9XthYmTUNJBH1/KUsXnjW4BzC3MyW8XFCR9mvocB8J350lo8tR
	tP7uU4CJlyM1gW0BaFHnQVUA5AESNje691eA4mEgM2qdmjgHwdJFHvAm11AUsg1ZyOM82wSuMD/
	//eJM4DIGS6y2M+rJ4tvlaQEfeIV0uehh2TYw+2CXy1VJLJHJt5c2lUv+WNM8mm6/aZnuQD7F5t
	GaBXPGSlSA3JdoSz75WglZIWvJGJ3or/bwx63YIdZD6aMxFiwH9f6Ziy8/rWUsuDLn4X1GgKHHu
	QUvkz0Z16i7vP+mb+b3gLjABqNqgzIvdOQvdr0sTMbsdSgbfTpaWqHDz2FeiNjLZ94vHY7D44LS
	muNHZOw2LpOSHMb
X-Google-Smtp-Source: AGHT+IHeMd1I7UftN9k36AnFkP3iiSo/Kt50+PZXp0E67sjZ/8vadRt+vTTWVoCd6F9E/0ysGllf/A==
X-Received: by 2002:a17:907:96a6:b0:b72:91bc:9b35 with SMTP id a640c23a62f3a-b7a244e42e4mr487088166b.39.1765111755733;
        Sun, 07 Dec 2025 04:49:15 -0800 (PST)
Received: from localhost.localdomain (host86-162-200-138.range86-162.btcentralplus.com. [86.162.200.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f445967fsm848078366b.10.2025.12.07.04.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 04:49:15 -0800 (PST)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Alan Stern <stern@rowland.harvard.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] usb: host: Drop resume calls on {e,o}hci_platform_suspend()
Date: Sun,  7 Dec 2025 12:47:25 +0000
Message-ID: <20251207124742.96526-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

As per the suspend_devices_and_enter() [1], if .suspend() fails, it invoke
the .resume() callback. This patch series drops redundant resume() from
{e,o}hci_platform_suspend()

[1]
https://elixir.bootlin.com/linux/v6.18-rc7/source/kernel/power/suspend.c#L519

Biju Das (2):
  usb: host: ehci-platform: Drop ehci_resume from
    ehci_platform_suspend()
  usb: host: ohci-platform: Drop ohci_resume from
    ohci_platform_suspend()

 drivers/usb/host/ehci-platform.c | 13 +------------
 drivers/usb/host/ohci-platform.c | 10 +---------
 2 files changed, 2 insertions(+), 21 deletions(-)

-- 
2.43.0


