Return-Path: <linux-renesas-soc+bounces-14915-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D85C6A731FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 13:08:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFBFF7A30B4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 12:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7091F2139AF;
	Thu, 27 Mar 2025 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkdaAKts"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51052135D5;
	Thu, 27 Mar 2025 12:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077275; cv=none; b=gEF69U+D3CBWShkE89uWtMJC576Ek3dqBGOPXrejVUNH7r6OKDyBUVOV6gkhljQE3+kr9ecNfsOxVpFt46R9X47cRMEER8d/Y5ktk/LgmB4DWPsU2nEaMMsYDyzqpkgjzOUXQW4OBnz0TWYD/MJGFwxL1GErAbTdWoRLPi6YnL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077275; c=relaxed/simple;
	bh=519U2OQ/+1rta3Dez4qIvxm1n885bLvavCe6L2uxsU0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EU5Y4znpBmDfs7QemhFmqO1QArIhZ7XgQa45BwtNAba/5AWgEHD4QR5WOicEYpuMY6oajwUTOM3RCO9kDGhxyOv9K1Ddy2Nxn0dTZMA/mVtG0mcozZKnEfaCTneoAwf5CN+AfaSL/3ubTPDPbuzSoaiE+RPhzmozvrLoA9cIeHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkdaAKts; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so5935425e9.0;
        Thu, 27 Mar 2025 05:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743077272; x=1743682072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYMicfXbcFjaRvlgGEEWj3AN7DRkydm+iBbtjMU7d70=;
        b=AkdaAKts4/TjwC360UQ8pS83hkrdY5xzjMOA3oUlHK8cjTUA8mU/OjLsGvPSIZTPed
         U/7FUrgv1kPv7/8YfxOZnDGOAXNjq32QZe5sgVwiwpFAqnCqu9MiDiMOF7ibAamuU13y
         DYUOm7KKOY6AxUvQs9cyNbb4jp9XzzQ3WXGxQ/BgqDC+qoGFekBxjHDKTPAW7UfTKud4
         ce5LCwDIbqjJY0msH27HwXXIXkhbgl6k1rnRJGQIGPd7G4Dezw/XC7NJkg8Pwu+p3d9o
         UQ6kxIGGOe9+WjILVmmdqz6eocaGN2pLNZEKdI59RTWPwJFEHGZXUF9FAOVj3bIJBnp4
         kyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743077272; x=1743682072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYMicfXbcFjaRvlgGEEWj3AN7DRkydm+iBbtjMU7d70=;
        b=bLa4GNa4EO6DJd47Fmqj3INwcvdrcn56EAyoXESiZX8f86cwfpROnwoWS3ThRkHNbb
         K0HWIjkdXCi+kStJPoQF9BMNXDI7HtgSmK6vBaf1hTHHcmv73OP2iUU2Ra+m+Tw9dn9n
         wKlYx/HeOL1g6ovWk8kZMEII/Jc1jVhEx9oEYL7w3Lhw74nKhRVhuDsqvvCnht6dd3ZH
         JQS/3mk+jHIL2g9Jpe3bvtwWhnrrdrIIF0i0h8HXcGs3bct5+TSVw8dsg59vI0GS06Lp
         oZmYF/wdvbChLHu0QKItLRyifeUHA2QS+C3LPjTU0g5YJASmncN+D5ZYDSyzkCKZVQXP
         vU5g==
X-Forwarded-Encrypted: i=1; AJvYcCWmNk803iMIvgocaxgLYw/qm7vdT93IZk4K8evnZ297HLappNlV4tXQp+GipOLs+0+wD02zUiEVxHhQZxs=@vger.kernel.org, AJvYcCXmDLolwzreI5fpP5EZGj8BuTTrjL7161+kSGY4btP1qW5QxakexECS/at7v3Fp+5nWyjYGV/wMBjOf@vger.kernel.org
X-Gm-Message-State: AOJu0YwDqWVLtcnerijNdN5wrhgZeUzaQwNCcZ5eM8XGsJaiBFa6z0R0
	05yPMw0YSp+a55szE6/hEKjNRcBamt9OoTafP5udjiSJ1mfENt5D
X-Gm-Gg: ASbGncveqaJRm9NyomHI7Pv7MxfgWe7jgHRvDlWgHdro+PbEUzgnkeHtZOsnqXNRHdp
	pvpd4hRLK5t/+BU6+PGH2FLbrwrwnmhds3YLn6qDWb6ZCBsCefyMb7mUmPIt/WeeaHRj8L8IfIG
	kYdBFdFoBhpaZmCI7SrS7VjLbHLFg1DCgFBEP+K0e5CP7PQxbwyJMX6dA/lBX1KWAIqhwwYatsS
	x0dBHciJcqbpq2gGxhyYmbuZlwwaU8Pu2tj9Rvnligi9Hwq28MIBR3ubZy9TgHOZZxIZWowVBFW
	bWG16VUxjhgWLXkoz9b0A34jaL9LRt783UKTs+sxAtwmSLAYS88KMs/JXSEHg6fg7iPw4g==
X-Google-Smtp-Source: AGHT+IGo/KrZHv6B3BMa3Gew6orDF/gZsSa7aFb0TXd+WFiObDDzY8c9Iud5MWCZJnNeGvpLg/iYUg==
X-Received: by 2002:a05:600c:1d0f:b0:43d:209:21fd with SMTP id 5b1f17b1804b1-43d85097759mr30175765e9.30.1743077271728;
        Thu, 27 Mar 2025 05:07:51 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c36b:2e01:9e11:8d7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82e6ac9bsm35109955e9.12.2025.03.27.05.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 05:07:51 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-usb@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/3] usb: renesas_usbhs: Reorder clock handling
Date: Thu, 27 Mar 2025 12:07:34 +0000
Message-ID: <20250327120737.230041-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Cheers,
Prabhakar

Lad Prabhakar (3):
  usb: renesas_usbhs: Correct function reference in comment
  usb: renesas_usbhs: Fix typo in comment
  usb: renesas_usbhs: Reorder clock handling and power management in
    probe

 drivers/usb/renesas_usbhs/common.c | 54 ++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 14 deletions(-)

-- 
2.49.0


