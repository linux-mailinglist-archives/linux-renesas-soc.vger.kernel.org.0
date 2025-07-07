Return-Path: <linux-renesas-soc+bounces-19288-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 29121AFA89F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 02:39:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8030F164160
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 00:39:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CD614A0BC;
	Mon,  7 Jul 2025 00:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8jrbYZ0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BF81487D1;
	Mon,  7 Jul 2025 00:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751848764; cv=none; b=GbhnppEEnNTJy3f8rJEDl0kL1nyPKZNNi1YQTZ1fKhybiQPz3IfSQazeTpVY6ZueDRi14ANqXX+B2VSIm87iXsHKwiQqCExi/tvuh/F3cpAznix7KXcSS/OV7M4hvVJGn/B0RVNS/RC7okyq8d7UdCWDd/UOEEDZ+zZk4vrwipc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751848764; c=relaxed/simple;
	bh=hUlGAMos01Z1bRSKPkaBbJvcQU9JNXBPNs5QDP/hUNk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Koov1ic0gZYoBhfx5CqvN1mc9GrWCfxi5/T0CLqX6H0UZn7jfKFwHkRHZ+VxHly4Tkrr0dSb1xqnCDx7ww0BIG1TqOrJmyMfM6QEUGff/B2PTD5+S/Q9w0GZDzL4D3ZKF9JuE/QsiZhpo2c2a++i1xCLPkr7Ksj3nAXar5/gwgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8jrbYZ0; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-234bfe37cccso27024825ad.0;
        Sun, 06 Jul 2025 17:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751848762; x=1752453562; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j00iWczHMP+VIwldTToHwbzFAy61a8TadUl5QKJDgHg=;
        b=S8jrbYZ0L+O2LbPZNv6elFcYFWX+hKosBLtGyIyqBPFeNbj/0Y2fgAjYyf1+KvvwN5
         5T+WRkrueOrIXIFMGPG1LzFWHZr6Yycm+FVuFw+F/d0+w5EnZmaFnSIde3pwdOr+ubrY
         EOp/Ye1aIHd53HpJm1oYlkDxOLP4/kV+7eya8dnD6Q0sNn3bJ8RdmsQjufBdLi9USZtZ
         pgvpiDSDvfAKsb4QWfIDkImu67GwHZYCWU+NfVPXu7egD1wgvt9GEn+uOn2Fv1WYYklP
         QB4qQac/qQmcfrwIi9Z++Kj+YdtfsIMDeNw2k9IocdlImDFmN2a+N05z31A+um8htlTB
         T0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751848762; x=1752453562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j00iWczHMP+VIwldTToHwbzFAy61a8TadUl5QKJDgHg=;
        b=JgXKPvMMPsCcDWH+Bnizst/ekDH2h1j4EFr9zON9si4Sr3JU3obs4UtZd7//CbICNX
         HYW2BhV2I3f/dgzVH6da+fuqr7Tp+bJ813ScdU4do+yn01atTNtB0prr1IVGlHpLGybF
         p8iCOAS55rMjeR4xMn0v0m8tuP22JzaxiFZ7auv2acmA6f8MoHYEnWukAVDp+TH8T2Rs
         Clt3nEf7MmjgKwfxsji17j4vF5fQ7FW4W5Kfah8J+BnqPcHCShYkVIrYsgiMINyrdpTF
         XQF7QxU+21iFuBrS4Mia+53CmgnSHJhlp4wivxoGqe/EJuOl5HIZf5taOJaR07oqdgod
         ZbZA==
X-Forwarded-Encrypted: i=1; AJvYcCWMUGNzWf/Z+1o9F62cW9wVA4fuHI8H0HHKHGiRrtDP4UYOLFBew7LsYsj8vxKkVaHH0LqWdyAbInFWeYo9IbQVcb8=@vger.kernel.org, AJvYcCXzNIcWPOnaiAfF4sQDFo++Qm1HzJYlFNO13Wbvx2J3DQ8P+VDV3IujT2dJGUxy7Vfa00yP/N4Kkh1Lot4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmVaIxn+5CMLj4SvxkA8zsbiJQx3FpHVJISY9Ga1qlWCiECcwO
	RxeZ1nY355AfgAxhJMBnGaF/VU0eKmUyNb1MelAOD0OTDAEpJeXoTQT7A9hLMcqG6so=
X-Gm-Gg: ASbGncsZyA8Cs+l17RVKmozDXoMgeMhrvqxD6hAFh83Tu6TWN8TfHFJqwwa4L6YQIq2
	LF4sgxsrMzLdN552mcou7TvXjuMLyaX/NzeNws7j+ybVZ/shpgdOLNHGWQ4kuYbyZRsAuEFLK16
	v7MYHb+q5GAnf+nPxwVaYv0g9vuqYQ3LLPvpkB0N7Wdh/wEKP/rR/+1quOWEGt1w1dWR83J2kVa
	BOohNlyxymjvqiAj8QIN/XvoQTg+8ojLthALIJekyI0mvrvtv3Z+t1qM831w2Ba9KrSf5IRZM2X
	0vK7hKUMX1rJum8TZRneDSAVhqpu04joX4Il3dwIUeQ=
X-Google-Smtp-Source: AGHT+IGyM/ZLXthN/LSmg3V0+sA5KrUhCjnQDSFHkXoWIFobc4LpGyxHlqAPeAxc+vfqdae3GbsHIA==
X-Received: by 2002:a17:902:d2cf:b0:235:f3df:bbff with SMTP id d9443c01a7336-23c90f3771cmr126516325ad.4.1751848762331;
        Sun, 06 Jul 2025 17:39:22 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431e2a4sm70308085ad.19.2025.07.06.17.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 17:39:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER)
Subject: [PATCH 0/2] net: dsa: rzn1_a5psw: add COMPILE_TEST
Date: Sun,  6 Jul 2025 17:39:16 -0700
Message-ID: <20250707003918.21607-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows the various bots to test compilation. Also threw in a small devm
conversion for enabling clocks.

Rosen Penev (2):
  net: dsa: rzn1_a5psw: add COMPILE_TEST
  net: dsa: rzn1_a5psw: use devm to enable clocks

 drivers/net/dsa/Kconfig      |  2 +-
 drivers/net/dsa/rzn1_a5psw.c | 22 ++++------------------
 2 files changed, 5 insertions(+), 19 deletions(-)

-- 
2.50.0


