Return-Path: <linux-renesas-soc+bounces-19363-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04777AFC023
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 03:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABF821AA7384
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 01:42:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5B1B2040BF;
	Tue,  8 Jul 2025 01:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VN81oSiA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F051EFFB7;
	Tue,  8 Jul 2025 01:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751938910; cv=none; b=q/1hZYZCPCS/IhDV3N6ALmBnX+VRgsWxqgti/scoje/6KVSuq5tZujOmJYCvIdkSno+qwaC/O/e+pS63fN0WlcmeWoFm9TuazL5jDqa+Ta+2l1lcj5UFqmSBr4as/X2rPJN30w/0O0WeqGmc6csa0rtuBkKFhOHvxyTijxPtiwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751938910; c=relaxed/simple;
	bh=AZKgNNvTwt7Xw+xAUuarAFrwGMlkh2VJ7AbCs4Hr2tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uj0nVPtUhu0kWiS/LVj+3IbchKJ4VfCAGXNSRkiUKh25DXp6U6I2g4Wy3t5u6MN/ZAHbQ2tA2Ndn0bCEWDfxg9IC1iMsNNYXE2IeqRG1yg5IfakJOV4gSO3QD3HoMYIBHnnryBOhaRykGtcKC0nJ8CMKjdtYn7N5TyaeuUiJM3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VN81oSiA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-236470b2dceso32520235ad.0;
        Mon, 07 Jul 2025 18:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751938908; x=1752543708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZ6VlsEE9a5DvCtJjOojbs4UeMQt+94V6SRQW6HMJuU=;
        b=VN81oSiADX4u0O5gHQRM3NWKv5rj80L9F4wzynOjpqozkstRf329Ra4jXr97fVhkS7
         H9eVVKzTQTsc+CTidM/IWgbdR/fQ5RSX1wFnvXZqXxjMVpXc+c3AzPVvsK/zSKPIwxqo
         H5cVBkg2n3lgmbQ8de+Yti8UmgmweAsJ35ynf/fBzHO7nJm5phOXCI4kfHX+dy67RZth
         caQKEEXZFQ08kl9rhZkYLzRYc72Dou6aKfIW3lL50g8HqI68i/lIR003ZQPfhEp8Oj2I
         +FyxPHCSJw4PEojvyGCqkaSndQUSUvgwkWBYs8JTD75RGMixiwMeBtVUGPSfipU3+P6L
         hlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751938908; x=1752543708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZ6VlsEE9a5DvCtJjOojbs4UeMQt+94V6SRQW6HMJuU=;
        b=tsrgZmieEiHajgjxnWGldKle+N1YXOaL27bNfLEDu7UtPgRJfuBSZxdeWAxbGk2Oyc
         n52Z0WYGsPw8JcE0fMMlP9eRxZQGdvuZI4k/NKBXHnvuLYA8PT1uneEC49Ii0oNpb0S6
         Ygr9T52e10N3S6m+bTsTG2T5lKe8wTf6/Lcwp6DD+yXPK1j56+78EtOUvTwfln01F3d8
         dO1zRrDG1G0V+12O6UarHcqbuTFYG9S3dRJcZ9DNGSQTXuLkXDdrGhcWCrwhTORfpoBv
         fItNf2ZLv53zo8CgBYKAY8U3T/4VTmgVtF23pUWJX/EYGXPL2CQcrW37nG/9kMwi+RvU
         7zWA==
X-Forwarded-Encrypted: i=1; AJvYcCUIE3GZePwB/OgtB0bbClX6iQxLLgumQo1e6K/mTpMVXijPlMNKqijoY4PpHTkNoFOIZweG17Zs3S5SyOw=@vger.kernel.org, AJvYcCVbJG6F3EMd9vGRDOvuzETRnF5xTm9RY9ArKuaXLq1HInyKgeO/P/qC4Zl+fdCLR+XwXt09Gi4h0zuyTmv6lDjnNBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqa7+1JrU+rcHBJruI8Hh8WjqaWCCfHulRxCf/+ORwTShb1oPB
	5uxeOgp8ZmiynQnLAijLW+s96i4YpZJITLbLeWq3m8LVBmGj08j01VxZL/9kVWxN5J4=
X-Gm-Gg: ASbGncvB/u2pgxQOL0g6UZ2BHt0qYGfT6MEGNbROvV35w0EEMnukXv7YpVkvNZtCjxj
	AdAYIY/tFVDYDig3KpXWc0uLiuS/LogJuY2JrM3U5YaEMU8ayXYNuxs27DncYq4D216mOhA1aoE
	GF10ppEBkSBN0/Hq9Xar8L6B2fgjU4OSUFZRtzW677Xo988p+xExpq+OQWtVdzcRPGz0OPGd9eO
	0L6x+p9D4hwqYzDxVvP7aI3PbYQu9gvuvYbpf153nW+tcFBpCPKxuatILhdVmvVbklQPtE1QQCD
	hNN+7SuXGUrZUKCFqaLZ4lfypOiq/1YH5T/yM25Gn3E=
X-Google-Smtp-Source: AGHT+IEBcZNTKQVolmne4rUIbc6Y0d+4ghCrRIMT4V/dXSu6mzMNp9GBUAAKLqksgjLh+/PfagPNyQ==
X-Received: by 2002:a17:903:2c5:b0:235:efbb:9539 with SMTP id d9443c01a7336-23c87475fa5mr177348945ad.17.1751938908489;
        Mon, 07 Jul 2025 18:41:48 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845922b5sm95773395ad.199.2025.07.07.18.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 18:41:48 -0700 (PDT)
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
Subject: [PATCHv2 1/2] net: dsa: rzn1_a5psw: add COMPILE_TEST
Date: Mon,  7 Jul 2025 18:41:43 -0700
Message-ID: <20250708014144.2514-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708014144.2514-1-rosenp@gmail.com>
References: <20250708014144.2514-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's no architecture specific requirement for it to compile. Allows
the bots to test compilation properly.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/dsa/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index bb9812b3b0e8..ec759f8cb0e2 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -92,7 +92,7 @@ source "drivers/net/dsa/realtek/Kconfig"
 
 config NET_DSA_RZN1_A5PSW
 	tristate "Renesas RZ/N1 A5PSW Ethernet switch support"
-	depends on OF && ARCH_RZN1
+	depends on OF && (ARCH_RZN1 || COMPILE_TEST)
 	select NET_DSA_TAG_RZN1_A5PSW
 	select PCS_RZN1_MIIC
 	help
-- 
2.50.0


