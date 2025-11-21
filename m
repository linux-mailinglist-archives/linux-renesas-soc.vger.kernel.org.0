Return-Path: <linux-renesas-soc+bounces-24931-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B539C78DD1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:40:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2451E4EDB0D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:36:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3566434BA56;
	Fri, 21 Nov 2025 11:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hPauthpu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FEA34AAE9
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 11:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763724970; cv=none; b=uik3BYdRw+DdlSbNMqxA4Grr5Jw+EF8NUQvYS1Akcl/Xje2fBEMMproBafZtRNDsdKjau8CGjn3xDHpjH/b7EBj9danAag5aPSxD7zJjooXdq8WtjvbRNGFnyy9WtIJTqg3kASUWFOyLQNsEJk6wa54BiUauN3pgUMIBKcYc3PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763724970; c=relaxed/simple;
	bh=ZuNR+n37++XWeuZmswx8Jk/VFwASvL7IpG6/C6NgGj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LloBi2tIm9svU3enUgYe+4PfFIpqtvIzFWpwWhl/PEMWJVR3/LOJxanWOODqjk5stI+cg/+uY8Diy6tIbdh0GOECuK6P/fEAV0SZUczvhnmuReNKYknWyxSvHizWbwBEycO64ZbSNNzUQPwnkhbBXpKkPekj79DjSVveKGQ023o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hPauthpu; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so13404465e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Nov 2025 03:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763724965; x=1764329765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVGvRm888PHJPhrnHWR5oOq8+UrzZ+D6x/y+ufMZnjU=;
        b=hPauthpuV/avzJKlAqyXmBaXDSZUdBBAIzf6jN4MfIL2U4s9yk8ijzLBxUT3XkPw/4
         Nz1pA7YiKLH/IqqqkDIV26U9H43YMSbSaP8T3Nnt10Gr0modGsUGr9nxVE9KlKWUjrIH
         tzjRkJcoVRkn9/OpA8etXggrJB6rUP5DNmzXKNE9HSstTZABk4kkFwJvwFFGKJH5Cvyb
         BgfLSM+8yIh9gSd9BYplU9kdXwlVJKQMqqUOQ4aeKx2M9hwIsGYAny70SB303OKRDSZl
         jInjWnmCtGvyONc58e/QuenApo8xPV5s08H/P51awyMB0CMbA4b9MDdkTzGavJAzDV5b
         Lbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763724965; x=1764329765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aVGvRm888PHJPhrnHWR5oOq8+UrzZ+D6x/y+ufMZnjU=;
        b=W5qfTzTGvsUD2r56PE/odSwwERTNoHmF5VyMaAKFXAoLMCEf3cWItT0KSXlmvv/C+p
         m+O8xZMJqKBfp14Wil5YIqBEQfgfHcvBO1zsyz5sIl3B/J33RMjoONw2s8Lg4BlRq19t
         9UpEh0jGzFOSRuS5ePCETK5zMXjjapg7/ejw4fyQkw3FxOeW6DJw1gOBytMegCKAKvLS
         30JSwI5iobthlxN9z41bPYtlzahZhcvX6Tcsp12TN3HaQx4pSJz4Y2MLdbYY5lcdeu+n
         j/e5qM0cagrxwKoH0B99qyvIn3oacAhifZU4MSYa7MywcoUfsGyqmRMk8lXxUqP3KD7H
         HGWA==
X-Gm-Message-State: AOJu0Ywcpz+lHkC01i9zOCKdaatbMZokeV0d5fSG3MMddM/F56LadHeg
	9JiqGu6dAz9JSXgTvELWFKcpGdP1w9fnNpEFX9HP53yqGAwg3TFE3eiN
X-Gm-Gg: ASbGnct8/gDxH53t0cNrmHAgHxnfv7a04V727RnMFcR3rw+DVNeShRmz4+6RERRNGIo
	M6w/YDMgQF78QAa8KROSDSByT6Ybtl34d8b///Gz5h8fnihnIO3oduou9rC4Gf33flOuKMUAq4s
	mSk7hi0Y2krjHmF7tqEIStAwI3gOzvGB++H5oFivMEmLoEDG4ffG3AJ20nn8ax1A3UYrzN9nssU
	j7TeHXYXSya5pTWu6e2mmntlcbz1SHyYZoW5hcbDO6RRy9qvzbbico5/LACO4WP34aUhMB+0T16
	0ixKYiuKY+PA0fjzF8c88NVQTwaYYzN5o8Oa+6KfaMMkEt4hrIiEaPZdib56OVjospQtRMvSZqJ
	TE/XyJ5i7Qf0facBJtR+nddu0IUYskvw9um6K6RyVhIF8U4Z7jhc2uK5Abx72lW9A7pAe+t5qVq
	LZx1z6r1GF3LUzMEYFZuc5uP9oJ9TrD5K7G9g=
X-Google-Smtp-Source: AGHT+IGP6qqVCFXHN+cAZp1IvVwnJnp7t5C04e1RX3baXyzOnx75Ofa1ghx3/gF3/D/CgYSw36Gteg==
X-Received: by 2002:a05:600c:4f82:b0:477:952d:fc11 with SMTP id 5b1f17b1804b1-477c11175a9mr22994005e9.16.1763724964758;
        Fri, 21 Nov 2025 03:36:04 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:9cce:8ab9:bc72:76cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3558d5sm38732465e9.1.2025.11.21.03.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:36:04 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next 01/11] net: dsa: tag_rzn1_a5psw: Drop redundant ETH_P_DSA_A5PSW definition
Date: Fri, 21 Nov 2025 11:35:27 +0000
Message-ID: <20251121113553.2955854-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251121113553.2955854-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Remove the locally defined ETH_P_DSA_A5PSW protocol value from
tag_rzn1_a5psw.c. The macro is already provided by <linux/if_ether.h>,
which is included by this file, making the local definition redundant.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 net/dsa/tag_rzn1_a5psw.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/dsa/tag_rzn1_a5psw.c b/net/dsa/tag_rzn1_a5psw.c
index 69d51221b1e5..201782b4f8dc 100644
--- a/net/dsa/tag_rzn1_a5psw.c
+++ b/net/dsa/tag_rzn1_a5psw.c
@@ -24,7 +24,6 @@
 
 #define A5PSW_NAME			"a5psw"
 
-#define ETH_P_DSA_A5PSW			0xE001
 #define A5PSW_TAG_LEN			8
 #define A5PSW_CTRL_DATA_FORCE_FORWARD	BIT(0)
 /* This is both used for xmit tag and rcv tagging */
-- 
2.52.0


