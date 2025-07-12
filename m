Return-Path: <linux-renesas-soc+bounces-19523-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFE4B02AF9
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 15:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85005A42E1D
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Jul 2025 13:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48811275B17;
	Sat, 12 Jul 2025 13:39:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CA71D432D;
	Sat, 12 Jul 2025 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752327574; cv=none; b=A4nCRaZY7ILZ6jrZw1JyvB0Ua9nSIqqytKRt3/oE7KMYD5bHkqfaL0R8A8GjtZlrT8nclnqrXEb2U5KBObzfJAp9DetMJNoSWTr/+wwnhkmk2ndEqZs3lQkdz2mxZi08UmlG9N98nBqM375guMX1WWm6BhZfuMtRKGkyE7/zytg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752327574; c=relaxed/simple;
	bh=G9YnvV9UCYZWcFNNlEsWjUejTH45E1Q1Yn17u/sOY6g=;
	h=From:To:Cc:Date:Message-Id:In-Reply-To:References:Subject; b=kI0IP/31sa8tp4j02bdQEljKHjdzZrrSeHC8X7PS0eeVBqIc8KDP2tOPbq3xGon7HNiuVpOTlMjvmLgNLhOFTyNZSFApAAiGWOasNN4omYBQYgqXpPZs5vhX896FJMtQqeEpjwy4h6pqG7Vh97s9gZbr/vBIZI+cr7Db6qc7dPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a6f0bcdf45so36204801cf.0;
        Sat, 12 Jul 2025 06:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752327571; x=1752932371;
        h=subject:references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3NAKLinAY3+a9DIGV5R0HTE+56mloatsXhlwyCORtWk=;
        b=T9//52+KGTRBoLaNRlt6kBhQFyZEPhrqxj6oiz2aJyKOuGqpXI6lfGKkwIWVIuOS0x
         YbdTFyt3XjzCjmuBFWTaP4iXOTj6SJSrJEjrbx7lIXKY7SM9vmXAga8qeM7uUNxwstj2
         bxegRh9VNqWL9mhMer5vFdBOZkmFZCYrlmj4QFZJlob3lXP62gHKdZY2GlmSTu4vYsxw
         /p05bx7LGMQOJFrDZp16fYZ6Gqpnd5ysKTk4OzlTK/yGlp92KNFeWtgrO2rRd015zjU7
         IvCnp3bBh3dQ2b/EPsaIcIX6yZPmDIxXvmF+qlw1R9lXpbeB4AUt7QqdKrdLf0C8I9CW
         M2qg==
X-Forwarded-Encrypted: i=1; AJvYcCUFCesGCu5/eruowRjhXrFtxSYQs/282JGuWPO801BnCPVuXbsWwols2Y2UU3z94e5CjxlQmpWkGxBu@vger.kernel.org, AJvYcCVnlEDQJD1R/r/pZUIzzE5Sz86mlC1fKx0x+x580UMf0Dd2rAfGeo4jvMDKlO8YrYkXXu0o6mYzZ+lhFjJZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyeeSCtEJwJATKJXs/Dx0wqecQsps0kaywwQbvxWE/FLIowcjCp
	18Gq2zptYXbWtG8I+u7kX1L/cesCUnGLCwa+PTNhNJ+bM0/lBvC7Pq4NoRv+JrLj
X-Gm-Gg: ASbGncuykmj1d+2G+pqtGjea/xh8EUj4gARghRAFheqDf3OfUTCMSOqSaVdH3a1YX6t
	hEOG1ZvHQY6ksNVXcbebB9E/sxMqhVuI08gUva3tLiBLNsWRpPR3QDxHp8y+MuNwwHcD4nsP2l4
	Xki/zpnK/ho9LQEgCIpW0+z6Q+RUOKRJ5QsJXVek6agOwr2ZFr9zhsWpbIY4IDBstjRHwEial2H
	+RVJufabW1YabO3Mkbc2DmYN1SM87olENvFUKxfPxmd7CcHz4IZujYk0rb9ci9XVllWYfdbDXEd
	fJhApyAFoiOv4BNKC50LBov4ctmXJUH8NrXDaQD2pKdd+7/5iZpxwj1+bAGjvXbIMR7FjpaEGJb
	RfVme3Ovp7HUrF44heEc512AvYyDp4dv3s3v2HG4rbyo=
X-Google-Smtp-Source: AGHT+IHAE3skXCRItLR4JIrZWw3cn0RTfToJluDkCVYVVAWq1Yq3MLWw5zYUnVySUU7Dp2OhppG8GQ==
X-Received: by 2002:a05:622a:d19:b0:4a3:398d:825c with SMTP id d75a77b69052e-4a9fbb86195mr81169601cf.48.1752327571382;
        Sat, 12 Jul 2025 06:39:31 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ab5d41249bsm1433481cf.30.2025.07.12.06.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 06:39:31 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org,Magnus Damm <damm@opensource.se>,geert+renesas@glider.be,devicetree@vger.kernel.org,conor+dt@kernel.org,krzk@kernel.org,linux-kernel@vger.kernel.org,wsa+renesas@sang-engineering.com,sergei.shtylyov@gmail.com,p.zabel@pengutronix.de
Date: Sat, 12 Jul 2025 15:39:27 +0200
Message-Id: <175232756792.19062.3922882730162396395.sendpatchset@1.0.0.127.in-addr.arpa>
In-Reply-To: <175232755943.19062.8739774784256290646.sendpatchset@1.0.0.127.in-addr.arpa>
References: <175232755943.19062.8739774784256290646.sendpatchset@1.0.0.127.in-addr.arpa>
Subject: [PATCH v2 1/4] dt-bindings: memory-controllers: renesas,rpc-if: Add RZ/A1 and RZ/A2 compat strings
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Add RZ/A1 and RZ/A2 compat strings for the renesas rpc-if device.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Changes since v1:
 - Moved RZ/A to top of RZ

 Applies to next-20250710

 Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml |    5 +++++
 1 file changed, 5 insertions(+)

--- 0001/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml
+++ work/Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml	2025-07-11 04:50:41.505855241 +0900
@@ -50,6 +50,11 @@ properties:
 
       - items:
           - enum:
+	      - renesas,r7s72100-rpc-if       # RZ/A1H
+	      - renesas,r7s9210-rpc-if        # RZ/A2M
+
+      - items:
+          - enum:
               - renesas,r9a07g043-rpc-if      # RZ/G2UL
               - renesas,r9a07g044-rpc-if      # RZ/G2{L,LC}
               - renesas,r9a07g054-rpc-if      # RZ/V2L

