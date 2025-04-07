Return-Path: <linux-renesas-soc+bounces-15434-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6C9A7DB77
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 12:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6AC13AEE98
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Apr 2025 10:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E7462376E4;
	Mon,  7 Apr 2025 10:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evw3nTUd"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53687226CF9;
	Mon,  7 Apr 2025 10:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744023011; cv=none; b=SobsQxFB07y5SLx/ONxBOwj4aHvTRv95+XHCBR8ZEzUwCFspKRVTzNzNfPUv0X6H0pk78iosKM9Cn7HVrEBmQ87s4KNl4e6tOMSVxP1ivTGgi3OVmVkrr0T68rqqeP2pF084q1e0iu0V1Auxvnd2VVC0WfswF/3FUrIrYZwAYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744023011; c=relaxed/simple;
	bh=2K+ojj/dTy8iYta+v0Ht3jSmIqVS3EZThaOey/6kQZw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hVxxts932lZW0r/3diegGATuMnZsz7cpQM6Dhcj1FVYB5cWnOrw48mkBXM8EMCzLL7fB6QXHuVyA4rp9/0CUHWq4a2xKz9TURHJUdgBTwn8BoxzavU7LEAkTkIxmS1Le5gqBxGRBP8agNLkTpks/nl+xw7YouH/TWH3FBo6CVJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evw3nTUd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso45875025e9.0;
        Mon, 07 Apr 2025 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744023007; x=1744627807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nvtwFiVMXU1NVodemtu0TmKLvx/KKZHGp4n6IgRaf24=;
        b=evw3nTUddhLt2h2MKRVycXG5JuMKgAIl0ESdjF8IFh3r8sRF3avvAa5e3NUTzqrbOB
         X1ynBea1kJyyqzKJyrDyoVArF+bcR7ZKa/A4qgnKP7nflSUAy6G+PIsD84u9U8J8M0aL
         lKWFKTQ5TU5unKZ/VvFTArnrJjeLfJGlfW+b+KNi9xRQrMEa6Ev9hvLkov4E7+TcgCmR
         0p55/feR/L4hiKjQz5npNthLmHQA576eMR8WuU96wUsuKKWa26dp5qpfRvcwpCT9PTwX
         JA+J1wrRGgHqzvnKecDO6zSzBcPKvrk0IOx5jOWhl5YvWgP0kWo/4siO5XBTW5pZOxAz
         A3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744023007; x=1744627807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvtwFiVMXU1NVodemtu0TmKLvx/KKZHGp4n6IgRaf24=;
        b=V0lgz2v7YRMYwRtwAFXTQX1fDNNypf1FablwFKywhoh6JTzdvIkawdONvAHNMCyCgS
         2yLXxN3JD15KYAuQ+rUxOPIRw4Da7kqnhZtdceaO+cWnFzjg99tYHZUHhbhtUDxe0CCS
         oLO4xZ3x+WyyNfuyk09HqJnXh4Z06Oi3HOv+/Bui4Dy2VhdE6pcgfsljnx091bJQqyuL
         o3f/bQ8xl44i7KZZrKitHPY8GydAQatIHCu1pgfsh7k2oWqH6LXnuQf4IGEqBj4qH6IY
         qMj9A1Grrm0e4iEfoRfMovxvFfWl/3cNuksrewG6O8OhjoTu17FPLMUS/nMDXFWfmUy8
         PckQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHh7gfKj+RJxEepN7+gw+whgNeTl3dgoe6lo8s4o3YTf7N4ltWBwYWYOzaUYa1vGVufIwskJyS2+h0oYoy3O+bkpk=@vger.kernel.org, AJvYcCXnX6Br7MOhAUuqzIUXaoK8UExMJ1qA1/AO+eTj/Y0DNb8M7CBUgErUpQIMm9DazurUDHe41vNVZZ175cw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7kRJVRYWvtrcF3eklwJccmrnmLJXZCjaYxdU9a8ObnH47t3tn
	o4hircOlkp1gCKsGByhteX9SyTql1xS9kFlw/CzpVjl0ZIVu+ZIW
X-Gm-Gg: ASbGncvdc8iVFTd5jBkgx/SKi5Ks1kee0nB1/V/UMZ3oz1Tmd75RRzNwGYDbrawTADN
	QfG0lppcG2PmVgRIdUFbc94ysCQ7oOj3Ed4Y/nestqO19OyliDh9b01mxRsXk74uCI11fz979KS
	hYhdfkTULCZBwYHEgWMoGGyS6Cam1mfsXBWC7t7ZGwmArFrex0J8EKq+di+2SkfWLvM2o9ohHxC
	w2FPc6TxWbKMqry6v+Fa9dfWE+2tNNRWzqgWP6nuZ1ZG+CQa7e15n/yHgMRs61htVTMwQvkx8bo
	uVkZZ4ae2pqbSR2KO23L8Y9KqTWWtaZEoGR+oBWhw/ukwaLGweQn1dvQ2s1XaEBpp5pCng==
X-Google-Smtp-Source: AGHT+IG92l9theLmnaelvJH3RrHjt9E8o/s4RKU+auU99dibPzn2htg75+nY9AVXz/Fjbyy/puZtMg==
X-Received: by 2002:a05:600c:4688:b0:43c:fee3:2bce with SMTP id 5b1f17b1804b1-43ed0d6abc4mr99719445e9.26.1744023007269;
        Mon, 07 Apr 2025 03:50:07 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:78b9:80c2:5373:1b49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm129975765e9.0.2025.04.07.03.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 03:50:06 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] usb: renesas_usbhs: Reorder clock handling
Date: Mon,  7 Apr 2025 11:49:59 +0100
Message-ID: <20250407105002.107181-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series reorders clock handling in probe path and fixes
trivial typo's.

v1->v2
- Rebased on v6.15-rc1
- Updated commit message for patch 1/3 and fixed review comments
  from Morimoto-san.
- Included ack from Morimoto-san for patch 2/3.

Cheers,
Prabhakar

Lad Prabhakar (3):
  usb: renesas_usbhs: Correct function references in comment
  usb: renesas_usbhs: Fix typo in comment
  usb: renesas_usbhs: Reorder clock handling and power management in
    probe

 drivers/usb/renesas_usbhs/common.c | 54 ++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 14 deletions(-)

-- 
2.49.0


