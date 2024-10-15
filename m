Return-Path: <linux-renesas-soc+bounces-9783-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AF299F7CC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 22:04:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B1FF1C231EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2024 20:04:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F98E1FF034;
	Tue, 15 Oct 2024 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaBs2570"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37711F5859;
	Tue, 15 Oct 2024 20:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729022560; cv=none; b=PoeI4OoKN1gJks9z/hoWepC5S2L0mQ+IGmzZHOKB/uq7gzscqF7fgjj1I6qmxWH7kqVGxnqzH1LxFFXuHMsUuftpm3NG4DNURTIYo1AL09aLuIj93fGxd8jYzRDqpFPd75gg7RzH7FvgDNwqvqB21Hffh9/eTtOs7BUOuWfl4mU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729022560; c=relaxed/simple;
	bh=1cY2g8wmG1oo6pAhaNxYqbKxrPxrt5V9OGrm5OzdG8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SC2kGa1Kp3tZR+qYvFEJe/9PrDMHk+S1lrcrQ+mNhr18YLIRXuGE4KRmgVgGbRnlx8m5jCxM+eKssrwyX4zMcWppeBILBPS9XcH1+wRYLDA68lt1WD75q9g4vWFUpPUIzs8tpXp+rz/+TqMuX4v9eHYz0LAPCnuBwWFQdUnk/Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaBs2570; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71e483c83dbso3809674b3a.3;
        Tue, 15 Oct 2024 13:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729022558; x=1729627358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xg/AWmjc7rpXKjOckhX6UccKQoP1O8ZQP4gdZCQ8byU=;
        b=jaBs25704FedjHpT2wv5scFIbTLyxihsN0lghzy4R7oEZ3cTd540zhVoqXVDKClFQM
         aM/g2ZNcTE1nysf57merQCJF/KsLNxFrfmkFbB8rRf8h0PAvKdAWVRQLp4LuPbhDEEMF
         GuteCNMThiIclNU9Npd8n83nHpOsELi0MDQgg2LLMjbBI/YfFOKFYBDj+DCz+If5xaGj
         oToU8VbqvyKUBRh7Lpfq9LTpHAXnXfdHFeBxvuemeEF2WTNvhMdk2mQJcIP/Kr04TMxe
         AefKNqsWsN4SJk3h7roDJh9YkC+0/5RaEAMN8mabYjE0XQvk+XE1N+jngI18bL1zXqAw
         s0TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729022558; x=1729627358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xg/AWmjc7rpXKjOckhX6UccKQoP1O8ZQP4gdZCQ8byU=;
        b=qlwnf2u7gbzk1eDlXM8nz0hcLFFQW+ECldSYV3KZFy1zK10FvxlZjZGWUfTuVUOeRw
         Imlj9AEwIxqA+6yR8XewjLU0umIRoBSEMJvWp7gJxN3ZWFBbxp6U15LcO8VBVuzO+L6v
         FqavWP840qifA5+FK4J1NXDh/ieaCpBVlIcQa8HZrJSbgZjXbqIfvBKyRoMx6oGKYDjk
         ctwvuhWNaxAqon+J70UEO0HRcOAWImq/S0369pjkhK0YtzyCbpBlw0Zkw7c52sNlg9I+
         dfk2DEQ0EZiRAabQZTkAsfO/FDQdUxagWUMdQJ+BcRN62WQmtDNEE4Ol0YOUbNy2198b
         quXA==
X-Forwarded-Encrypted: i=1; AJvYcCVCZNYPCgLS2+rO1Y4sjCDV4GIdN8ZQpjNenOO6uUf/r7i+/Gb90cwI7CPwlv7IAx+N2ce7wqPwfAv6WbUEEsKz840=@vger.kernel.org, AJvYcCXxwDsF4M+yo+8S4ZcdQ59jcyVLu7Udpc1nG6X4KwWFBc65A+xQSuXPWLHral15h2vu1MhA1CLhqaQLhF4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgSYJcMWtUW/SOzzaj0omQPNWXjaw7hRlEMnCCkz+4Rofw5Uun
	toi00vmXRGfMnnRQZd5c6u4meUKRGmUK09ElQK6+lsxYLSDp+xH+UWTgYf6s
X-Google-Smtp-Source: AGHT+IHNDj6pz4SyLoJL5Rvt1Brm/2XJh5cX6NKapT51Fcpng6PQCjYAl6SfOsMq5VKgB7QOvN5R7w==
X-Received: by 2002:a05:6a20:d818:b0:1cf:2a35:6d21 with SMTP id adf61e73a8af0-1d905f69115mr1898016637.45.1729022557723;
        Tue, 15 Oct 2024 13:02:37 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77518a1csm1690163b3a.187.2024.10.15.13.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 13:02:37 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com (maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER),
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	George McCollister <george.mccollister@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Breno Leitao <leitao@debian.org>,
	linux-kernel@vger.kernel.org (open list),
	linux-renesas-soc@vger.kernel.org (open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER)
Subject: [PATCHv7 net-next 5/6] net: ibm: emac: use devm for mutex_init
Date: Tue, 15 Oct 2024 13:02:20 -0700
Message-ID: <20241015200222.12452-7-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241015200222.12452-1-rosenp@gmail.com>
References: <20241015200222.12452-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It seems since inception that mutex_destroy was never called for these
in _remove. Instead of handling this manually, just use devm for
simplicity.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/ibm/emac/core.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index f8478f0026af..3bea10624291 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -3021,8 +3021,14 @@ static int emac_probe(struct platform_device *ofdev)
 	SET_NETDEV_DEV(ndev, &ofdev->dev);
 
 	/* Initialize some embedded data structures */
-	mutex_init(&dev->mdio_lock);
-	mutex_init(&dev->link_lock);
+	err = devm_mutex_init(&ofdev->dev, &dev->mdio_lock);
+	if (err)
+		goto err_gone;
+
+	err = devm_mutex_init(&ofdev->dev, &dev->link_lock);
+	if (err)
+		goto err_gone;
+
 	spin_lock_init(&dev->lock);
 	INIT_WORK(&dev->reset_work, emac_reset_work);
 
-- 
2.47.0


