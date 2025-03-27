Return-Path: <linux-renesas-soc+bounces-14937-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D58A73E9B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 20:33:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 358F43B87E1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Mar 2025 19:33:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFDBD1990CD;
	Thu, 27 Mar 2025 19:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzgdw5Ze"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5C516DEB1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 19:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743104015; cv=none; b=GVdYiVfoppvwPnmO9KWxymqwbuS5QpC5hTyUS4XkPXB2q8jn/dolojskZ221lM2TXTnzyXz37g2kRSj2u/+Ds8uHgxdetYxwLnLp/v+NIx8aDJvNWDssjBMmcc4b9g8ZLPtls0RhWVTQEi9JVdPDpLuNvx7qTEXBjxK4O3Ioyt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743104015; c=relaxed/simple;
	bh=wHFrbRomDwg442t01I7TzY2wO1NDxVO0/5vTsBW7W50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f85adL6jmZDBmySNJZ575gYdbWWR1yDyKxKZ+KlJIPZlbfjoPIrsKkt2VYUchH7OcQO/brv6CqQOZvJcgBxbxCy10SwBO7T77Zna1pWz72+IdYNldfHE3AKIS9RTPlmUB6UGzkXyukzxwbqOinKEx75edwEmw1IUYevQzU23q28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzgdw5Ze; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0782d787so10292105e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Mar 2025 12:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743104012; x=1743708812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NmwOl2F1UghG/K+v7uMEtMTkZyhH5DkKwzbxkTATaQ=;
        b=lzgdw5ZemqfyRqLbC9bO4XgVqSYxB0ktGVbz8aVkWKXTH0xJEF08xN2ibakN3rv2oP
         vnIXTIDPC/K9pc2fnH9R2OXqxybWW8gX2+ld4zfqQboFyUP1uAfjCSoJonZo+FYXuAXU
         D/xOgfj3mNoew3Dsu/m5KaTJMOJTvehIHpViwUGgrCSjRoVZzMM7Idx2ZMd/n5Z4lGK5
         vmjTR83Q1KZYvMze+GJoRYlq+jAsChAOU4YNGXiSLUqBicG8zwQ44abMbIS4rzemQDlj
         9iCojvGEbiFQuyR5/VuuqIbsTxLdC6AAdsmMrLAQohCg5+D+euSmmOc5dGJZAqaNzjMo
         eVpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104012; x=1743708812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9NmwOl2F1UghG/K+v7uMEtMTkZyhH5DkKwzbxkTATaQ=;
        b=ppa9RdfRqByOt3ACuRlaekBw0D2t1/1BMVUogeTulcfF9cLMP5njfkPZX3/JshzAis
         OQuMLB68M2Uug9wGTI5Xo4EnPxhtgXaq/3PrH+g2JiYJGNv6Yu/SzEfq6WdPcUxTR3Cd
         qxO4DaQIFaLr0/q9Gfcp7sy5bPGGdhFps6VaxpYSdyf6gUsJYxUSo5o1aAd9QKC56o9k
         6hw0F/VdiaxGqNkMs5bkCZGcVZUSXp90Y3NUTJ41jcxuxwwYp2irX22Tt1R4h9Um1vqB
         mmRgt5XjikYomZx7Z/zPKktQmWROGBNnl6H0GOuuqu6LysckpaQIuBNCGvGZ1/eixQFM
         MwCg==
X-Gm-Message-State: AOJu0YyhXqFpZvwS6dgx3XE6suR7xK5OrZ4llwvMinJPAzgBK2qWal2Y
	dnVEjIyl9oL9V5KiKcxlM/J9nvyZlXxRaV9zTQkzQCihl/WpV/Q4abuZRWXj
X-Gm-Gg: ASbGncvSUN/C+DIPK7parbycVCKVtsOSkUCH4YYR6P3lQ1qdjwXB33xjjHs3Oyr3MdU
	kRe2ZEadTjBue3MjLtZwvoctfyBODyGyy7O1Xy4EtWAEndtamtOwZr+yecXilhzBk2Hc2hsSZsV
	tFNPAGWMVb/KUUDKIBPF8spV7kum4sSlg4wXKm7qKoMTyrXkb2xNz233SC+yIQpIYUcIRpHvJ1i
	onUz0kW+fsz94V4rsahxoqc2UB4I61TFuX6YaFenE1Ce8xm9BpCPvhZ3BIr4hrI9XYbrdePdChg
	W7jb1007ek2E9G31WbCU52cSCmL6PwL5hQEjMZei/qsX5U0NZQnNO3FTbZ0Z7H85/LQSOw==
X-Google-Smtp-Source: AGHT+IG/Q1N8I6WcEBuNWuuJ47Db4w9RUb81ZZJP9j9renhI6qdO890YsvzMM/2/cA5Dwtpnf39RkA==
X-Received: by 2002:a05:600c:3516:b0:43d:83a:417d with SMTP id 5b1f17b1804b1-43d84f992cfmr55920875e9.12.1743104011813;
        Thu, 27 Mar 2025 12:33:31 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:c36b:2e01:9e11:8d7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d90001531sm4039265e9.40.2025.03.27.12.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:33:31 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC INTERNAL v2 2/4] arm64: defconfig: Remove individual Renesas SoC entries
Date: Thu, 27 Mar 2025 19:33:16 +0000
Message-ID: <20250327193318.344444-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250327193318.344444-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove explicit entries for individual Renesas SoCs from the defconfig
file.  Since all Renesas SoCs are enabled by default when ARCH_RENESAS
is selected, and ARCH_RENESAS is already enabled in the defconfig,
listing them separately is redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/configs/defconfig | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..5494b8a2380a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1474,29 +1474,6 @@ CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_QCOM_APR=m
 CONFIG_QCOM_ICC_BWMON=m
 CONFIG_QCOM_PBS=m
-CONFIG_ARCH_R8A77995=y
-CONFIG_ARCH_R8A77990=y
-CONFIG_ARCH_R8A77951=y
-CONFIG_ARCH_R8A77965=y
-CONFIG_ARCH_R8A77960=y
-CONFIG_ARCH_R8A77961=y
-CONFIG_ARCH_R8A779F0=y
-CONFIG_ARCH_R8A77980=y
-CONFIG_ARCH_R8A77970=y
-CONFIG_ARCH_R8A779A0=y
-CONFIG_ARCH_R8A779G0=y
-CONFIG_ARCH_R8A779H0=y
-CONFIG_ARCH_R8A774C0=y
-CONFIG_ARCH_R8A774E1=y
-CONFIG_ARCH_R8A774A1=y
-CONFIG_ARCH_R8A774B1=y
-CONFIG_ARCH_R9A07G043=y
-CONFIG_ARCH_R9A07G044=y
-CONFIG_ARCH_R9A07G054=y
-CONFIG_ARCH_R9A08G045=y
-CONFIG_ARCH_R9A09G011=y
-CONFIG_ARCH_R9A09G047=y
-CONFIG_ARCH_R9A09G057=y
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_ARCH_TEGRA_132_SOC=y
 CONFIG_ARCH_TEGRA_210_SOC=y
-- 
2.49.0


