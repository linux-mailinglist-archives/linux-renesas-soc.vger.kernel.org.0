Return-Path: <linux-renesas-soc+bounces-3642-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E09877208
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 16:55:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F01E2281985
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  9 Mar 2024 15:55:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CA6F45951;
	Sat,  9 Mar 2024 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="q2g6ZfcN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11754503B
	for <linux-renesas-soc@vger.kernel.org>; Sat,  9 Mar 2024 15:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709999703; cv=none; b=u3kL89Pjl3EK+I5wR7NFUnkYdtMApgj3LNb0aO77eEt6OLvqFXOV9ZYixrzNPwoz9r+dHwojWeMNnxwx6bh9fg+jViSa32HU5jApT5L5k4vJdmAoz6m8HPkTdt/mVC9uhctpbJbYG4cNTcbqRnCQZ83dyHyC3ZZm+WS/o3O2W20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709999703; c=relaxed/simple;
	bh=Yb7xqfxkqIWBKsuccsmy/XJ/urgpuY06bYi+GcfXOxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Iuk8uv/uHjLyAuEwQsP0/DsKos70jjjmIGDB9yvk8GMivQU9dWP9mQVv6bYxkYJcbBSDIuB2WV0L+US+K8oX3Q1rH6vyfdgvGjyqeHfe8XFLRrLVfAQusJ5J3/eivUINRcMxw1l2IEdMgtMZy3JogN4VqfXy2tFeiqWh+jbcpE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=q2g6ZfcN; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51340e89df1so3288416e87.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 09 Mar 2024 07:55:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709999700; x=1710604500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cHQfOk2RYffRyoIaOuuITCWN0JusXcRRtkVr9gcihOQ=;
        b=q2g6ZfcNk/A9EET57koxLJahfGpGPqnCbSFeQoZHq8Cr8VOIwAwSQB8EA6KCt0iGAS
         fPNk+q1bt7TdDiT3CFQhOjaXA4DR9pOL9uCjSKyzSzbPQDlW7olJfxXqxQbsO7v2UR7L
         U0zVBUrq72Axxpz4POwfifbIBQLSQEGh6uJoWJqo9MrgfYtOnrvlgYbMHvfACkGSAo6W
         QMY6/YiJ4d23lDFYTVLnnr3X1D5g/r0NWGuqpxu63QlX5PXhzMQLpvhnzcPOGQ1PoQ4x
         TRvEmB/WnUOvbxpY2iUJJ1EL/BZBJXipwcuOxQM4K+bZgamwbd9RFYM+MC5x+SaBn1Ks
         HZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709999700; x=1710604500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cHQfOk2RYffRyoIaOuuITCWN0JusXcRRtkVr9gcihOQ=;
        b=jJO3JtuS8y9RG2ChHLKINIBgUZB3cwlRD5WiqZCXG7IH9gYhprJNpmsuR+2cZFpBtM
         C6CgbOwevNXEFhubg6lz33gRqD+c9fvNIzFss9hySdhRagkHp7bQho4MAQzgX3oDi2jB
         UvOb4dv6h0ijYvR1vqybEztvm+L5Vzo4ssANfkJI1S0OH0d/NuUSZ0lWVXvafGepjS8t
         uTAyqMz93utsb3N+FEOTmXeGkDETUeTIscJv8LPK0FqKAvb0UjcdK2CCTh4rLT9FUrOX
         UeQMn5NIbCGoqBHzc3PLape6PM1HYbkOVe0WOjq4s9ypTm1cOpo2wt35ZaSIqwjdNIDR
         OUpA==
X-Gm-Message-State: AOJu0YxRYrxGDpEguPMEqmGyEYittPKKQfOLT1i26GTTSaFToZff6rOy
	iBHhavB3Jd67RFyn5J9Nh5pveqXD51mmBzIOStpLIhduZ2E3nlijMblqZX+Qo4Q=
X-Google-Smtp-Source: AGHT+IEGpwRFUsYP1yOBMH/siZGRb/1f1wruXZpRcTIQkJN98y3teQ0M8v2/iPX79mn198Vd/9PanQ==
X-Received: by 2002:a05:6512:3b8e:b0:513:9ae1:46f4 with SMTP id g14-20020a0565123b8e00b005139ae146f4mr1877134lfv.49.1709999699910;
        Sat, 09 Mar 2024 07:54:59 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id kq17-20020a170906abd100b00a40f7ed6cb9sm1005216ejb.4.2024.03.09.07.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Mar 2024 07:54:59 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sergey Shtylyov <s.shtylyov@omp.ru>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [net-next 1/2] dt-bindings: net: renesas,etheravb: Add optional MDIO bus node
Date: Sat,  9 Mar 2024 16:53:33 +0100
Message-ID: <20240309155334.1310262-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240309155334.1310262-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240309155334.1310262-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Renesas Ethernet AVB bindings do not allow the MDIO bus to be
described. This has not been needed as only a single PHY is
supported and no MDIO bus properties have been needed.

Add an optional mdio node to the binding which allows the MDIO bus to be
described and allow bus properties to be set.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 Documentation/devicetree/bindings/net/renesas,etheravb.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
index de7ba7f345a9..5345ad8e1be4 100644
--- a/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
+++ b/Documentation/devicetree/bindings/net/renesas,etheravb.yaml
@@ -93,6 +93,10 @@ properties:
     description: Number of size cells on the MDIO bus.
     const: 0
 
+  mdio:
+    $ref: /schemas/net/mdio.yaml#
+    unevaluatedProperties: false
+
   renesas,no-ether-link:
     type: boolean
     description:
-- 
2.44.0


