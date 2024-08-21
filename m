Return-Path: <linux-renesas-soc+bounces-7975-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBB595983F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 12:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EAA761F23378
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 10:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2151DFE64;
	Wed, 21 Aug 2024 08:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SOWOpKvI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6791E1DE65F;
	Wed, 21 Aug 2024 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230621; cv=none; b=HglH3nt+xXt3wodV9sC7oIIzGbJriRIFGynWTfUCh92DiIO/c83JZ6MkIPjaRwKP4YCEK07tAZJ0myxn99QeZVy/DEie43Uraooxgi7AnssvUP1eNJf9BXllhmO4WfcuhiZ4xHjvTSsEkPla/i/a2aM+F33pBpCSd6OY/jgzBJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230621; c=relaxed/simple;
	bh=zOKVK+HyR+Fr49+jHTWe2DJLMiF8aQkdMtIXo+9zDD0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ISTSkvgPfGh8qwrjodAG16khccDzvyh8N2B62uxfP2TLjteI0wFHNWFa4j3E6IIannISnZbDOMllUGVmhogBanpU7ognlYaOrR5hTMwfRLMuTL6cXn0xFuttXX+SgRAU2T2DjiHX+nQbKXnjDPrNP3Mo572eDKyu0K/H06cxvT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SOWOpKvI; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7aabb71bb2so703676366b.2;
        Wed, 21 Aug 2024 01:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724230618; x=1724835418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EtVMKpFtM6GEoFMyzcZpJi3raOhIzOMSZeM0Wfu1t1c=;
        b=SOWOpKvImz9J7NxGvUjE/pQsgyhm5sVpjEX39AETYxsdnj9Lmqwo3Z6onDV+gfOM/B
         O1Ovw5sIliTCEPz/TUOlXy1SXbjrvTwqbWmI6kGqyw41ICyG8MMHA89p/W3XcQCiqtZr
         s5rxYWSIx/luTWUBYzSoLi0wR3so+l53pdYFXMTkLoOWrn82A01neRAx5jiHh+i3LELo
         HjdigHU2G7W66UISNI8DXOsBAVA16NcsVy+hlcIJlb+ICtB68tdISLPLXs618TwMYtjc
         +xRP1Qdpqx/2ltKGDJIcNrdpG05HuLmAzKc03j8xhT7Fq2cA58kYWWMPsc8HZHlPKnt/
         BDtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230618; x=1724835418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EtVMKpFtM6GEoFMyzcZpJi3raOhIzOMSZeM0Wfu1t1c=;
        b=iGqKcektPQfkM0q/MQmGHCkwfp7HznHdVc4ePkdGdgDDNg4enQBzjMAD/AD89U4qtp
         RJHlg4zrZ6J2JqmVFibuRJS6TAeCIq3EAzyF9RE1NlWBNQVe34zT9Uq8gdQSJ6MxIRIs
         MbjwysszTjNDrbh1C38vXm5Nk0oe3uiU83qH3OP1uFO+ua6qVANoteA5KXm4BkqFA7Pt
         hy3V4c2bnyEvif4hA8A2muMND8q+ckKhf3w3bfDyg2r0zBVpGMn6C/RW5Cw3BnNbCC59
         u6ZVHfdkqVl/X4XXZIZLzxf7uH+YuLy3g+lqHMKW5CeIaLQazdZ0YxJu+6hgfrwUZNsN
         Kt5A==
X-Forwarded-Encrypted: i=1; AJvYcCV/4HLz3SMKEHJGAPIntsZJidkvpALMaFJypD0K/stTs+w7xBUwmzR51eClmjMVtOVDGByzGGK7ot1MKk20@vger.kernel.org, AJvYcCWhPKtxE2EmBBBNEktfZkT6ojHFS56+DTStM/aMi0XjlMdFfLKvojkbTnA/6/rLbTL5sQFh4vwSDya2@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Dnre8BWHBLZuRqpTKVbtfgqPlkVA0TByZ5yitwfLNuGOrbxx
	Tby1JM7XbDJ7oW4js7r9VIjQOwEWpQ9Nk/yxh3yMGvIqAP/UIePo
X-Google-Smtp-Source: AGHT+IGNy/rNvk8aJZrlNEMZqKTMbriYQQnOXvT2IcUuTVkWrU23uUk5qLhkP7yp4/k3NvllgZs3NA==
X-Received: by 2002:a17:907:7fa1:b0:a7a:c083:857b with SMTP id a640c23a62f3a-a866f8f380cmr112684466b.42.1724230617677;
        Wed, 21 Aug 2024 01:56:57 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:b9a9:40a4:353f:6481])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cf183sm873416266b.56.2024.08.21.01.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:56:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 8/8] arm64: dts: renesas: r9a09g057h44-gp-evk: Enable watchdog
Date: Wed, 21 Aug 2024 09:56:44 +0100
Message-Id: <20240821085644.240009-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable WDT1 watchdog on RZ/V2H GP-EVK platform.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3
- No change

v1->v2
- New patch
---
 arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
index 1c532810dad0..e89b66018f78 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-gp-evk.dts
@@ -243,3 +243,7 @@ &sdhi1 {
 	sd-uhs-sdr104;
 	status = "okay";
 };
+
+&wdt1 {
+	status = "okay";
+};
-- 
2.34.1


