Return-Path: <linux-renesas-soc+bounces-17082-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFA7AB6883
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 12:15:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E614C1BA0765
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 10:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503F42701C5;
	Wed, 14 May 2025 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qo3ZZehc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801382581;
	Wed, 14 May 2025 10:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217737; cv=none; b=aTdjYrebEvC80doBjJgFG0SJjLU6Q7G+87v0qSDGn3dgaSgSzRDnuECR4oTma/+K2ZpqkSm48FI6pDFUCaaXfMDpPwE5p56OKnxKK2lzkqgojmuFIsMJvWJIc5OG1ywQvIah/+2Tz9uKlTGSskgGed1sZ+NEjWT6nbsIwTP3+vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217737; c=relaxed/simple;
	bh=ssO4ukeUbQgCkn9GJpQqPZ8WdzsgnN5XWWHPJpyoKkg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dF8z62DS/eqeoZvFtr0yXxVo0Dsx2PgV2vfo/4J4JvmVN1YojVRXVYl9IepktSyGihtSURgZjRlVSv42vVXdEG+R7yXJ6cZcDlOxWvMPDcjTSDT87z69/TAQyYQwUzGm7588owaieoRxF5Rise3g8PLAB/apuhxYUuaJYO/IPdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qo3ZZehc; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-442ec3ce724so12711325e9.0;
        Wed, 14 May 2025 03:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747217733; x=1747822533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kQOcHyhTA7FXjlUu3W5vkMRaWzYm7ctPhDbr+85eCas=;
        b=Qo3ZZehccz4qSAxEuf9vriU/+7mzFTURuZh5qBDEhWsblIUTWh6Aq7fMPsmNU3KVlH
         hhhJsdqQY24lb4UctWnn+3vEhSA2VR6URzW5dGERHG8nw25c/o9z42OytocHTYoeGnRw
         +zGt8u4w7zjgPHVUMI1iS6V820atdJWui2UbPZMdtFRFKFUCl7lrhAw2n2le0YuoOGS5
         MHqmG/5HchGLWqd+nQkvTkE7MAIEZ7LD3JX5ecidNIMH+2LvhmbuY3LaifF4SUYKwgo3
         YtI3bo/R09ZYf/MV5lBDT20wl6O5vQAGQR+f8lSqeBu98zfB/aysU67ykr4jIvPEO9rt
         FHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217733; x=1747822533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kQOcHyhTA7FXjlUu3W5vkMRaWzYm7ctPhDbr+85eCas=;
        b=uJ1dIu1Y6wlSOxo4raaZzDpqTtOAAHSZSMP2cWBaZntVV0SEnBln4DiVJMHFYAo8hj
         hXlEWZcl3Chnbyonf9gEKR13HxzAGKTiuPPWUSk5hGWdUND1grbeAerxihMFqDBm7vzM
         wtMgDvhQ/hDMedGJubCfeFggj6v7yy3hcfU8bKuWd1WOptN5O8d4SXj24v3YtBe0WcuI
         cr51j9AGwJLiPsQow6mbB78Ywl3jz+ek4hVYXBqfOIITray6i8/weXAJkjTxXH0q540z
         z/Xgoi9lriCjfO0QRNXuM2zRmPxYOKhlC0YoTA9VJoCpWif839DX7jmrD4zUxrESRfKo
         6IDw==
X-Forwarded-Encrypted: i=1; AJvYcCVoB1lOWyjxsqSEleMh1oUWBLxjKVa89oNpgx5K87DRLSFAGA3uvFhuGVhEM8BFDOJXBN5bNXkVoygpnONhP6Uyrjs=@vger.kernel.org, AJvYcCVpS48Yt4JWScURuBsYZ2C7Y8uEq4b8v9TczOl0/ELa9v6s/SxRwvroPTA1QbXLQtbEnZO4iJJGOjZWIMQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwVJDqTZrj+XdSHQBXq3n4OX4d9TPFOBdgtPBVA2E6Q9hSoBgw
	kSS3v0gcC9IIpg6NYmkDZSwjNHoL31mUh3ScXRkUJ7dLUGm4Q9uN
X-Gm-Gg: ASbGncsUm4cu8tx1FYstquGIS/EZ5DO96YwOi3Zb1NkcZllMKIF9fTUZD/fOmLNMRHT
	OCTPtEJoUHWNnyHK/wKArXNnHNFe/d056NEOBHj0gS04IBHM6mZsR3Gf/Mpv0hXrjkvRW8PqXIO
	bmsbN/CjtLZkkrtI8cd6ZQmw+x5p1vKkzhlG7edTn8kiB0lzObx5jWFIoKSMxmf4gcFWv5kabsm
	oNXVwe2/1psX7yrL7UXCN3EVZQuOQmW0BjKWyh6sEq9qRuU08s+zsbmAr2ONFgvx84qTyIBFjy6
	h02Z0b0nKvW475MryjfO0w1zAECWjYbQEpzwNxHopAjLM3CIPMokKn9cEVe2vvpTjh1/TM207DJ
	c
X-Google-Smtp-Source: AGHT+IFqTCbpndw7EMXL2jk2y68KQhmuPeUYs/oDgtjqa4fdHjjvn0HjjgU3YNNIWuDMohlT+kuuCQ==
X-Received: by 2002:a5d:5f8e:0:b0:3a1:f535:e9be with SMTP id ffacd0b85a97d-3a349694ac7mr2097950f8f.7.1747217733372;
        Wed, 14 May 2025 03:15:33 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6140:13af:687a:7a66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm19530249f8f.60.2025.05.14.03.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:15:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 00/10] Add GBETH, OSTM, RIIC, WDT, and GPU support for RZ/V2N SoC and EVK board
Date: Wed, 14 May 2025 11:15:18 +0100
Message-ID: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This patch series adds support for the following components on the
RZ/V2N SoC and RZ/V2N EVK board:
1. GBETH (Gigabit Ethernet)
2. OSTM (General TImer)
3. RIIC (I2C)
4. WDT (Watchdog Timer)
5. GE3D (Mali-G31 GPU)

Cheers
Prabhakar 

Lad Prabhakar (10):
  arm64: dts: renesas: r9a09g056: Add GBETH nodes
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable GBETH
  arm64: dts: renesas: r9a09g056: Add OSTM0-OSTM7 nodes
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable OSTM timers on
    RZ/V2N EVK
  arm64: dts: renesas: r9a09g056: Add RIIC controllers
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RIIC controllers
  arm64: dts: renesas: r9a09g056: Add WDT0-WDT3 nodes
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable WDT1
  arm64: dts: renesas: r9a09g056: Add Mali-G31 GPU node
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable Mali-G31 GPU

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 569 ++++++++++++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 211 +++++++
 2 files changed, 780 insertions(+)

-- 
2.49.0


