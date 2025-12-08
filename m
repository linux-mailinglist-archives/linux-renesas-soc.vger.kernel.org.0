Return-Path: <linux-renesas-soc+bounces-25667-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F456CADAA1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 08 Dec 2025 16:53:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F14A30562C7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Dec 2025 15:51:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316FA2E62DC;
	Mon,  8 Dec 2025 15:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JlYi4Std"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E820D2D837B
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Dec 2025 15:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765209033; cv=none; b=gZLcxvepNjDi1pMen2BqaPPYEsh/vLT5rZDbTvpBy45ym4RENheLVXXQ26sAfhxrGw0AdVhQfY6zdi89owM0pWiqCS9UpcxI6Wclz7FJC1/MC2cnbQq38sZNI7vlnGWLsI3qpa3OzTnV87vlb12ZTMgeiGGRSzDD27aMjjjAlMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765209033; c=relaxed/simple;
	bh=lfdWmhaZJTMON4teAatnLxOF0XN73G5Ei5TmlUHmFeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EaJhfhgCy5CEDMwYRmbqwI5UBzze7njMkdhxIExgihR0oXf3XkAwgv4AHR8z1bi8KPp7WvfIgG+8PM9gBK9ljhXy4VMZHAZ4ZG/SCbWvqdXPlvKrqcsxjnPKFMMgLFk1nsTj4XO5QdM3ob+wkl8pjDX6y29sXqQKkZICA34xKFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JlYi4Std; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47798ded6fcso34816155e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Dec 2025 07:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765209028; x=1765813828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E9vxAtmbsc9sfd8WNWIA8+tguwKaRWIk3O57bGcLZew=;
        b=JlYi4StdoX+cEhgdpGBWC5noHgn8GD9pKgTZ+wIoiG4SZ8MVL58J+TMRdh//HRaTrz
         V7FOCWLPxXwRs0bEe3C7KCQYvD4ScXzN/fwY9ShVPmGddGTT98nbZFWlOhM43uHqM3kT
         UhdJ6zoqHi9k67F8nOcubu3Xdvxs0IOiLoT9ReQrtuq6CnmGJEOMrwiIbvkEVOEzlHxk
         MANh+Nq2TFdyB+EpNCyXCbJPHZ5X6SYyX9OJtyRh1dU9WrCnaa0GY8Mq01Bj1D77X1VH
         Ux9QjXpAJx/ANC81dvGvU9pCV9TcngY68397sAw57jdAXTrIZPZjk/RkJy4ZjT9LQ8uq
         cVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765209028; x=1765813828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E9vxAtmbsc9sfd8WNWIA8+tguwKaRWIk3O57bGcLZew=;
        b=JaZ6+300CeBrgB1xnePdSFroyJJVgVnTv/z7X5rs6YUWSMHeiHnhemOjrhkCzjyakC
         j11ycZ1McYRAXlZ7bnbN25IYvNg3gREDNKaDFkgfP9gK1isGZB9Krb/XMran44SHxotV
         4KOlUwV95YN8uU5AyMlL86mP1gMjbP5fDlqeUOPDX5Dvby3PBPCthmcTpQu+wwqIH0KI
         uky72v3hKdtuedINrFfiYM3Fr83oQ8+x985HvLziYkwYVRLvPn6M613stWBXUxjTQCjx
         3tG1GOqvy68RYI505hC3H3svuPNkBuQOliKSgMw35ESHKWuNDwpg9LKv/LiQjAb+RHNq
         b6bA==
X-Forwarded-Encrypted: i=1; AJvYcCVq4WOE4eDg6C+BtzioRZ71UmnjHrt3Zq0ddvHFZ5ji1aFBhUi7VgVcvkJdhvSfNVE8xAf1JdG6o3sq1UzYpeU3UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuVNfw+EIlB0hIJRzlYfGoYDQ8ql7N9/ZpffYhwUuLEPTxOgE+
	nlCRo0UF0vix7Y9wzvYBpGkxq6VgGKIodThFp7LKCdqDdZLyW8mG8ShL
X-Gm-Gg: ASbGncsWy0sqLVvqYdPT3CAZKPpMjm6NQf2CF/0AAny+i8sWsr6jLZadj+XXSX/9wSv
	EBc2x8PcGn6AtX4L1eSK+AyARyXVezdY9ws3P91CzFIKLnbPxhb5lQIsJO0iBtR0vD1vDPAeT7B
	D1x2yfgNvdrWcksbBkcY4B46nv7ES3oqhVGfVoa1TihsPyCGeFwVGZm+/GUFR8Se8kOO/Bkcqws
	cS0OhJ0U4RR+1U/SkADZxaLRMCS4r1Mkp8yLmlHt+7mrZZHVY0x3uldQQMjjDL4aKhlz0JC5Es0
	fkT5EfiddYdVwVQ8sJsHWbeA+XNBGAKIE+p64X3RajD8CQF7NEzjM7DUhx1WgCDdw2IDduH6wMD
	lDy24BLlhRs+X5UZfZsDhu3tFWCPxQKbc3uO2pUz8He9rfoswJAIwEjNOZ0mqZgp9FezbN8lg/A
	xZ0qP+4lrlBl4Hc9m7ZmStwC9tW+Fcn1gzWg==
X-Google-Smtp-Source: AGHT+IFljt5YHUzlULBDoRx85WjVasSaNXrLqrRgyJpEfzkXWUGKm/KRhMnTMpRbYvSGWx2zxHRZAw==
X-Received: by 2002:a05:600c:c3cb:20b0:47a:7aa0:175a with SMTP id 5b1f17b1804b1-47a7aa0175emr11840195e9.26.1765209028120;
        Mon, 08 Dec 2025 07:50:28 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:9aa6:8a23:82c5:2b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b150878sm147717845e9.3.2025.12.08.07.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 07:50:27 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aswath Govindraju <a-govindraju@ti.com>
Cc: linux-can@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: phy: ti,tcan104x-can: Document TI TCAN1046
Date: Mon,  8 Dec 2025 15:50:18 +0000
Message-ID: <20251208155019.136076-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208155019.136076-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251208155019.136076-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document the TI TCAN1046 automotive CAN transceiver. The TCAN1046
provides dual high-speed CAN channels and includes STB1/2 control
lines.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
index c686d06f5f56..c53c4f703102 100644
--- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
@@ -23,6 +23,7 @@ properties:
       - enum:
           - ti,tcan1042
           - ti,tcan1043
+          - ti,tcan1046
           - nxp,tja1048
           - nxp,tja1051
           - nxp,tja1057
@@ -84,7 +85,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: nxp,tja1048
+            enum:
+              - ti,tcan1046
+              - nxp,tja1048
     then:
       properties:
         '#phy-cells':
-- 
2.52.0


