Return-Path: <linux-renesas-soc+bounces-18396-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2C8ADBC04
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 23:39:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B7543B5C01
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 21:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE6B220F47;
	Mon, 16 Jun 2025 21:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AeNvM9VI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5AA218E8B;
	Mon, 16 Jun 2025 21:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750109975; cv=none; b=H5hYUfPbzkn47RejZF+mvYnjZHJNLRS+KFqxh3yocc7uuRYVfSwjgmiq/q/R/AIBQZJFtW9SZ/IbFcLKJag/ZbnZzP4cX49DTbQILJ8gjzJSPNhkSSannkPbaNPaiZq8rnrYMd3LSqZUAftq+WqacqmiSNQXhsL9qlSkOEB3qp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750109975; c=relaxed/simple;
	bh=F8bDeQM33H4/19OSwrLz3s2GRaMzqliqp3ripUuulWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ijr4N83mPRwVPyU8QmRtE5tdhZnYM/4OVhOyCgFjF9cezJlQO0GejJfdH9XtcQVgoWK2ewscGT6DDMjQJL3+iK946SeAjYNtK5taerYDO345bpb4qEkQbaTtKp5DqqV3HQGjDsvhCZVgNq/R0RIU3DwcWzypPzWrmG5gp2wwxjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AeNvM9VI; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450dd065828so40382225e9.2;
        Mon, 16 Jun 2025 14:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750109972; x=1750714772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJ9mYm3uEpO0WgdIsA6kK3T1i34wbLkgzRCFaB/5bkE=;
        b=AeNvM9VIYBz+pkOQV9FWCXe/AjZbNJaVfJ2Dp4puEaE+ysVNvovRuUOlPPitsrotBy
         Jurme9QVFlKuwLa9Z9qh0CULLpGuOu+4mYhBADCcTVMbG4yY9O8lo6pMadPdXtvWyMHm
         6+wK2d0RnoiM/4oo7lzgrW+HVEP5p5ELkWg57b6by+jnzakCyKE/cfBLYUpzYjbYmO8o
         0CcmyWzs+veRkz6gJeHZ07TSZzFiSmyaFmXfR4sd/3u+6oqTu0uxeXRkFGIFb1VFW11B
         puUm8M0LhbWl65if7wEb1p5/7dc8znKKfU8ElNXNaO6wPHeFojFGbtzxSXBUbSLTMj7v
         hFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750109972; x=1750714772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oJ9mYm3uEpO0WgdIsA6kK3T1i34wbLkgzRCFaB/5bkE=;
        b=FfrDBFdc8q33Rhqy4ietFKzVsKn+iRrhG9OQZnfAffwG1UI4aV9EDWADiQoWUwaZDO
         zWx8ofB2fiCZpEPJB5Wt2lRKj6sffK0lqmNU4OtSJhjsGy9PIlcoN5GH5h3DupZJodeo
         PsulqrOOt7coJigNKL8hWm/yhxOqfcBG8tCvS2usIEh9s2JKP3EhjI0xqiMKbPOvHUQ9
         StP5TDnMTLdDRL1nWJAyGnpMR9TBKaXMmmevwglW2/gTFmqWJzhdo1OdATDMnzJo1s84
         xH/UW1YxGC4t4hMheqiVz14Va+mT1/lpO+NRfRICmlCvkCx4cOO3ydMd8qI9XCfgVqYG
         hOrg==
X-Forwarded-Encrypted: i=1; AJvYcCUQApkYQ54C268u4rQCb9/oF1Iz2DGy9OxrBYcQEx309TxubkvyOSXkD4ZAn85slPR/v3TmxY/vRkBUWpbC@vger.kernel.org, AJvYcCV8zu74shDypA+2iUW2squaPqIyQx9OzXk6NXrw6hRl00ShSEGhDwIsIglp4679s6GCqDe1+M7N6Gryd4+Lh5bCqIM=@vger.kernel.org, AJvYcCVjA/Tse52cQsrzLoGwCLUIKR1BBssa9iSqwvVh3/utVb46TatIniFDP+VxLp7UUMqP2O+Rb7y1F8KF@vger.kernel.org
X-Gm-Message-State: AOJu0YzjaaYfEvKXJmqDaz9jnwMluJoUFLz6vEwCmyaHVHR/ec5QtmAZ
	6qk2VhzMnTpJ2sbmIrVqaEHdBnLzVxNK+sbMlddH810Dg5FJ7NYuXfIQ
X-Gm-Gg: ASbGnct0jfhTJBsUMaTXcdexYI+uz/83k1q8DazjsbsqfqgeOtKgxnB53RKV55jPFgq
	iULN64zhzOC40zGDEt7HbV0+Rq0yc8PodbFDy/Io+E3cRJT5nMuy0UaVZ0bPAOXJn3JftqFe3Na
	wfptI9AyA7JN0SPCjgQQPc8AZhyziUeaHj/YgmomuQOSWmN6bUngO6IM7fSgN7rTbaIB8cmtXrQ
	WSYoTs0u8d7XJfvZcK2dJjok/ZpqvFfh3RRd4lZjbuHo6CnXFczErVffy4In1H+vXrMxeH2RqZI
	yw0vwst5ri36qbEgsdnTKZ5sJciyR0nO9aDzizHImSrt8INyTjELGwW/JDjXhkW7ZkgoXz3cBMd
	zuAB6pzUjy6goY5JIfeGw
X-Google-Smtp-Source: AGHT+IHwbDo8RWZZk4i2nU1EcW6If69hlLlG4tadXAfNI+lFCl3gM7qMIH1LDl4AoI30prhHb3D9xA==
X-Received: by 2002:a05:600c:3543:b0:43d:ea:51d2 with SMTP id 5b1f17b1804b1-4533ca91fbfmr109237585e9.14.1750109971570;
        Mon, 16 Jun 2025 14:39:31 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:4135:3769:337c:8a0c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2354fbsm153211625e9.15.2025.06.16.14.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:39:30 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v11 2/5] dt-bindings: serial: rsci: Update maintainer entry
Date: Mon, 16 Jun 2025 22:39:24 +0100
Message-ID: <20250616213927.475921-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616213927.475921-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250616213927.475921-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add myself as the maintainer for the Renesas RSCI device tree binding,
as Thierry Bultel no longer works for Renesas.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/serial/renesas,rsci.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
index 1bf255407df0..548225e509e5 100644
--- a/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,rsci.yaml
@@ -8,7 +8,7 @@ title: Renesas RSCI Serial Communication Interface
 
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
-  - Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
 allOf:
   - $ref: serial.yaml#
-- 
2.49.0


