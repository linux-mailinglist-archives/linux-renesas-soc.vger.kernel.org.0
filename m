Return-Path: <linux-renesas-soc+bounces-11353-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 142549F2ACB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 08:20:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBCB8188899D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 07:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E99121B85D7;
	Mon, 16 Dec 2024 07:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="lulfp9QZ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD931B6CE0
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Dec 2024 07:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734333607; cv=none; b=rgqVvAMEgE1JQP4X1j4xFwV4X3oWtI/CwAzckLi2Wvb0ZeOdmVb1DNTxMTqq03TqUizFt/C33cFZmXjwPTGnPfc2xuh9bbT5UmALelGb9x3x6Y/loDwFw4WXaEh3XUJSJ/2nOxSZ14plVVRCNzSlooIaaaXp0ZRtOU4NyKuuVEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734333607; c=relaxed/simple;
	bh=M0m6mS0qvuOgK4pqKWi4YcPmsudiy3imB1/B4ess3Lg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OSGqhlDjH7MyO3lftJGzCJJn6GDPucEuneOMRC8avGVAMPsCY5UHlSjvMELcFIWtc6RmWtX7NzkihQQ3ffakm238kiT6SqOFaTqe5MONOeEXa5XTfcxOxqZdpbChw/cdDbXz9/oFXzAl159ZNspdmwlWGoBgQRfWs0Anjkj8fDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=lulfp9QZ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-540215984f0so4336823e87.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 15 Dec 2024 23:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1734333604; x=1734938404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=saNfM3LJ/gXWUseFK7OkXZwpRXxJnebLh8Q4+xjWzoU=;
        b=lulfp9QZ5gsZQUCFTbmmzaAmRD0jU5ABrhB82MXxf7GSwH9w3XUeC5ZaP1zpWeA2h0
         34zmDPb7totrsm1Skihz4Mtjs2UMebq+xJn15xi+mIKJ9os5fVHccj/mFr/zzLtgdgkE
         NC6J1Acs6mAxHmXBAER7EgjO/Xb/aZQDy7vr/OtyVQYUC8zZZgpjPnZkl52ywgwQbhzB
         qLAhNW2Fs6PKXQb/zbnB0je4cvAs4FfdEq6T56kQH22sYw5zFsEcxaEtMXOyfSIeZuIC
         RP7zC1Gw4x79L5fOMubSXptnyCEGbGYZy5ObturcY7FckfrIJOzs9g5nFyZIxkM3tpS+
         BVhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734333604; x=1734938404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=saNfM3LJ/gXWUseFK7OkXZwpRXxJnebLh8Q4+xjWzoU=;
        b=gPcOyq9+WRe3w/LEqEmAXWrvh8alZkrVu9AcsJqKNelHZdLcuf/1gEAmApbyJ7Un4t
         n1wZFtQvUzNzEI+kVuTudBIGP/mtLOgLzjNy3Q1d8Vd+VdTnKJhiNykRj/7/SxAIH/gI
         0ForsA/m+XA0o92xuD3NRZgxfb8SNWrwANWc6GP3Tt2anf/oCE3t4drRTu9P+Son1Aqz
         84Pu/4dUgUKkbrff3BoEIXzy+9KH0lECJgUHXLD4PwfkABfUj7HeYQoZMCM+W/cphXmU
         Uf7ycEhxFWH/TGIMV86VBAjyk/OwsKC7G9+f4ZusU9VXnF+Qt/SpG2z4s4KQu+vBjVr2
         QnVw==
X-Forwarded-Encrypted: i=1; AJvYcCUjdAfgWDKsUXGSxp3QPDD8W5p+GO5+F94E/Wub27Be1flB6rDkMZ+ipKDrcnqopJQZbn42YOOXAV5z00LLO5oCJw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs7Z1RRqa49igpNO792d8sYnCYP4g2BQLV/D4GJUpfeh10ChVk
	zZyGWY6WQ1uUVAUPIsGU13inAq2NytD1Qr2J5dFzZr5GmujnonGMIxBfbKydx24=
X-Gm-Gg: ASbGncuXMTvf09rRuqtvhuU9w9wTwNB4Vdm57IjARHfDz3OGwNjwcMIvv8DjFsqh7Du
	bsMmCw12RNuypxawbwX3Jv/uPnbCTotzEDmcBdtTUm9Z7syzowzoZgwXcel414XIZE7bCGoPnjn
	58mKYsSMN8gR0odqdSq0y/zKXtoqLRVnN7BB+oEU7F3fVFVyO9x3m60m3480YdYsG0sbLsWGHE2
	elef4D8RstcTp7HER9ZhIh8rAZ9JH6/D29QB3TU8hHZsqT3Wa1Hr6+mpZRW60pDhYK+11U=
X-Google-Smtp-Source: AGHT+IGDnuBu4pD61786Xbqg5/sZ4XzdhAFZbPTySRoKaH33YM2xTlfYrZazJwFQUY+JIVDFd/RY+Q==
X-Received: by 2002:a05:6512:238b:b0:53e:350a:7294 with SMTP id 2adb3069b0e04-54090595736mr4004062e87.37.1734333603800;
        Sun, 15 Dec 2024 23:20:03 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120ba9b2bsm748930e87.94.2024.12.15.23.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Dec 2024 23:20:03 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Dege <michael.dege@renesas.com>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: [PATCH net-next v2 0/5] mdio support updates
Date: Mon, 16 Dec 2024 12:19:52 +0500
Message-Id: <20241216071957.2587354-1-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up rswitch mdio support, and adds C22 operations.

Nikita Yushchenko (5):
  net: renesas: rswitch: do not write to MPSM register at init time
  net: renesas: rswitch: use FIELD_PREP for remaining MPIC register
    fields
  net: renesas: rswitch: align mdio C45 operations with datasheet
  net: renesas: rswitch: use generic MPSM operation for mdio C45
  net: renesas: rswitch: add mdio C22 support
---
v1: https://lore.kernel.org/netdev/20241208155236.108582-1-nikita.yoush@cogentembedded.com/

changes since v1:
- rebase against net-next/main as of commit 92c932b9946c ("Merge branch
  'mptcp-pm-userspace-misc-cleanups'"),
- remove no longer used definitions for MMIS1 register bits,
- add patch to use FIELD_PREP for MPIC register fields, to keep the same
  style as in already merged patch.
---
 drivers/net/ethernet/renesas/rswitch.c | 84 ++++++++++++++++----------
 drivers/net/ethernet/renesas/rswitch.h | 33 ++++------
 2 files changed, 65 insertions(+), 52 deletions(-)

-- 
2.39.5


