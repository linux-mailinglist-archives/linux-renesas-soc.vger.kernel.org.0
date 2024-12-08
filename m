Return-Path: <linux-renesas-soc+bounces-11060-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 499909E860B
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 16:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 813DF164874
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  8 Dec 2024 15:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A72E15B12A;
	Sun,  8 Dec 2024 15:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b="d1Iv4bpY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B97F1586CF
	for <linux-renesas-soc@vger.kernel.org>; Sun,  8 Dec 2024 15:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733673167; cv=none; b=agIPTz4Utgqr1uYlc92leOduMklnwP9i3vEJOTLTJXLcsAZLC0tPta5XZkZhdEjYIKW92sXBWIFEPx7wgCERNQ9Qw6cpRyWUimjhtjymuBECUdQm8wa7TsuzKVYu/HUnsPbvtwqzuGGCu80AEkWdpipkdUbOj06zeFDdzQA51jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733673167; c=relaxed/simple;
	bh=pR239TJH6DkmyjLOOWJrEa9qa6lKwq6zBqCCU7HNb+o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IsDKfh7+R70+Uwf0zl7D9QXqkNbTwjYgxzSK6vEkPhY9tINtmuHF5owkSFnX/SYV1RDzazH8Y3OC+VZ2OAscOeUK4dOIZmxfHu3FjGYMc8s4WnI2lEUO8+eukJ3YIwXPOkb2SoTgEQ5wcxfJdikkstxokFKLEcsvGyp1PxKF+kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com; spf=pass smtp.mailfrom=cogentembedded.com; dkim=pass (2048-bit key) header.d=cogentembedded-com.20230601.gappssmtp.com header.i=@cogentembedded-com.20230601.gappssmtp.com header.b=d1Iv4bpY; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cogentembedded.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3011c7b39c7so7207341fa.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 08 Dec 2024 07:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cogentembedded-com.20230601.gappssmtp.com; s=20230601; t=1733673164; x=1734277964; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YM5DZdXZqiBry1GF0hiPMUU57y91Is3FbX9t5e3p81c=;
        b=d1Iv4bpYYgxKt8zGwpriFDplZs2LllAYlDDcdMvk+YGdmkeyc24NiIve5F85xmWY2B
         gGDjXGCL3uYJfGwbLxJvapUleLflyrW/AhZ35GbdiAIrPxJXzyUCjPFdVJWlx8FieEvP
         4NPSLDNFX1fnlRk7HNOJhzmYVsv6RjPubGHwSuYGaKegtEr8JkVhl6JVK+DoWZ3/Yd++
         uVoi76ppkhQv0h8fRHZNtom3fodCbWRadyntxgr82uEpM3LYsguzBnMzq1wb6b7Z6QJO
         dtxQsRvWVI9gPeytZS8XnbGY18/mOsj9FajuOOeYUDRjKF1PWm51HG3ACBPDTyQgXPAf
         qxkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733673164; x=1734277964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YM5DZdXZqiBry1GF0hiPMUU57y91Is3FbX9t5e3p81c=;
        b=r4ZGh3T9u59R51Au/bnbfdNk0NRHGOICKRSBLlIBmicp+Q0Eon2o0PqYCzEagHOTHf
         LDzVVRMjt7yTZS2De3PwrysUrgugRx6grVKZArJc9+Fb8R23NzXRPgs+zEsKHc13NErD
         9T6UyWBbU2JzuoH6GbrfYjX5bruRVpGitYA/Hpi7t/RB7rzsSUkMYpQjZc+L8BLO7bmR
         dO8TG0g1t0rxv/3gPUX93PN8bdiIx+48Vi65xogcY0bWVhdR4VQjc7cSL3g0MWIsX3Xq
         umuK/9ier4d9oTXRR5rBcrTJnszlECNX9ipy6XHQx9CM6WT2AHZqGmu9JpHZpli429K8
         TM2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSKa9HivJo2lRCHavSGOOWyA/AjlZps5ZWU7SqVwJuBr5Jl0MT6XuJWIytp6hSwrNZ/Iyr57bVRx3ZPA0doLprKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwitkHWnZBC4wx/q2QmOEVY+Q2rSDgPsYu5H8FnfFEybnfZzWH/
	wBxQ8nukuZCwLM/rLkduKCRQx9qusBe80IKvh7hq/YwjmKKbdvkEbkW46uHFV+o=
X-Gm-Gg: ASbGncvFS4nqORvHkztJPu+jUPwfbn7KDARo8ewcMAKdmVxnRJKq2rT+YMIh6Zmvgz3
	k7xHgaByZQwnqRHlDTxe7wLWUlq2RYX7uJgUyIqfaBLlC8DXh5ixyrvGdfrUu+cHidUaKrSpg/O
	0nxL9xZgMczTl0uQjQ08MmXztak27KBJE0zzmhZXUkWBzctgx3dg8AGJLhwS0VzXifLuZQuGIpS
	VhTXjcxWBdDWexy2zXm8yikW0Q0cp2O0Xtg+RfeuJa5c5Lk8rdBcPRuDP+qtHWY
X-Google-Smtp-Source: AGHT+IH0mhFJkzgTaRltbt/3f/uOZ0/C8ZdKxaDXSeoLslSVJ6jaMefU1FWkl1ufVYiQ/d2eGcmVPQ==
X-Received: by 2002:a05:6512:2823:b0:53f:232e:31ea with SMTP id 2adb3069b0e04-53f232e3741mr1250833e87.54.1733673163671;
        Sun, 08 Dec 2024 07:52:43 -0800 (PST)
Received: from cobook.home ([91.198.101.25])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3a1ce70bsm580882e87.66.2024.12.08.07.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:52:43 -0800 (PST)
From: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
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
Subject: [PATCH net-next 1/4] net: renesas: rswitch: do not write to MPSM register at init time
Date: Sun,  8 Dec 2024 20:52:33 +0500
Message-Id: <20241208155236.108582-2-nikita.yoush@cogentembedded.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241208155236.108582-1-nikita.yoush@cogentembedded.com>
References: <20241208155236.108582-1-nikita.yoush@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MPSM register is used to execute mdio bus transactions.
There is no need to initialize it early.

Signed-off-by: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
---
 drivers/net/ethernet/renesas/rswitch.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 8ac6ef532c6a..57d0f992f9a5 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -1139,7 +1139,6 @@ static void rswitch_etha_enable_mii(struct rswitch_etha *etha)
 {
 	rswitch_modify(etha->addr, MPIC, MPIC_PSMCS_MASK | MPIC_PSMHT_MASK,
 		       MPIC_PSMCS(etha->psmcs) | MPIC_PSMHT(0x06));
-	rswitch_modify(etha->addr, MPSM, 0, MPSM_MFF_C45);
 }
 
 static int rswitch_etha_hw_init(struct rswitch_etha *etha, const u8 *mac)
-- 
2.39.5


