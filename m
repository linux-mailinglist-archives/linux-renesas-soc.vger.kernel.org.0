Return-Path: <linux-renesas-soc+bounces-7480-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0EF93AF4E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 11:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 258851F21738
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 09:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9151514F0;
	Wed, 24 Jul 2024 09:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7qnnJPp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3027C0B7;
	Wed, 24 Jul 2024 09:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721814524; cv=none; b=n+HlA3YxKDTNi9pQ32E0I154ym1aEvAXDSO+Fe+lcpsPRvlElz2eSkkS5gSP02m8+mojXTH+R9EDE2Ap9ji0PVgd0+6wxOQgZ7yS1ZmeJFJ8DpK+b8W03GRr6ClkvEl0bbZ0r1h73wKigljLj5Wi8N+n6ipNHOi2/Qo9zQsfam0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721814524; c=relaxed/simple;
	bh=J9HtY9yF6ULPz/iestdBl6mcDE3Ywt2Lo2u6mqcrKYw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XXx5FQSRH0Pgkh5HMuOQUxlQIh18RwdGLS4s0s1u6ZXo9FPp791ylNQWYE+I+vfBH75fDuQmBTQkH1gmktuPS9OgTDZ79U9XlXFTxtenoz6QQVyhfLnTWYiOcAvHJdRl9uEjBec/HP0GWVuVdfjs1Ajwf4zIVYRxke6jl7Zs3pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7qnnJPp; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-426717a2d12so4139405e9.0;
        Wed, 24 Jul 2024 02:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721814521; x=1722419321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nnFrzHwHBK5j7pjSfQ0n+bo5P6ALk+ASypSkioOykjg=;
        b=D7qnnJPpR16Xw34K+FuwrMO0BLl6YBpGWrnLoj3uu8qtMQbRt/lp0fj9ldyViQmMdW
         TMS4dIW8uikWYItfAHCVujdHc/ex1TYYTlY1d0bBMw2aW9cKlEBLMYMSpIbCL/rrTqfj
         +7v2j0CMQiOXCxsjzFbYGE5mtDAWdxNYTBvg2Jzc2z13ThbGZl/BNe1zKqC+ZwOe+RSU
         WGquYfVqO4+4GjizJCXpCpCll8Db7n0gsQzwJhQb1qrHt46Yr+byYx0ISF/S4XXsok4H
         nV3j3ZAYOsBG9Jw3QEhg96KNDK7vv4qPscLHmOsFQRWEhMgCKkn+lIXQ9jV5oXfo2frZ
         tMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721814521; x=1722419321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nnFrzHwHBK5j7pjSfQ0n+bo5P6ALk+ASypSkioOykjg=;
        b=dASqaoZsY2fTz3VuxdS4xKZIv3vnXJ0Jnn4XZqlSKvTgP3W5FY/1FobL6Wpe40r/K3
         Aiw+4k10BLIBMgyxWYDYjC6d1E+M/df6pcztw9i+9iWzG/suVSb8oxoLlNUN33IB2B+S
         AJwhli/0ywb5qFvFF5Ua+uqvm0oMZUOgCx9kEOv3QNVoq9QR7v92oPgX7Ff8McVund+L
         xKNAkk4XRfgK6iitgffysdElrelpZ14Mirrp/NspvQ3dkfoJ2ofEo2sIFKZdrhsLxf64
         5BNDmC/2Anq16rqCWINUWpTAqfbkBEqv49X3rWRfPT7dbQ6JObdmvfQ2CKuxHykzv/Rp
         NmFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq17VNBF4bn3oU4tMIvvViB1G8BzBzdvHe2jYebEuCbZFh1SGBq31rapfaae/NhNURQg4j9lwJJ52uynErNC9MUNSwBOOGO7wH2hi2/UEBaZnmbpa2XRlKFGwBblnJXNO+rxNjY4pOAg==
X-Gm-Message-State: AOJu0Yx9dgGfAgKlKchlvo8TR8cONytKSTy6M+fnuPW59jiu3ZGimPlh
	BaskG/0k7WC0lMxjeYN4EEkwkZVQOxgCLlRuJQZDlDh4ufo6dNWgOPM/yxKD+sA=
X-Google-Smtp-Source: AGHT+IE94xXsi9hvu8990UqjfxnLeCvajkZco84z/DoN3sf4QuTQQc2Tst7JMtNnfofOVT42eMtgVw==
X-Received: by 2002:a7b:c303:0:b0:426:5cc7:82f with SMTP id 5b1f17b1804b1-427f9a13d02mr10320485e9.13.1721814520825;
        Wed, 24 Jul 2024 02:48:40 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f93aae47sm21328195e9.35.2024.07.24.02.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 02:48:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/2] dt-bindings: Document RZ/V2H GP-EVK board
Date: Wed, 24 Jul 2024 10:47:05 +0100
Message-Id: <20240724094707.569596-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series documents Renesas RZ/V2H ("R9A09G057") GP-EVK board.

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: soc: renesas: Document RZ/V2H GP-EVK board
  dt-bindings: soc: renesas: renesas-soc: Add pattern for GP-EVK

 Documentation/devicetree/bindings/soc/renesas/renesas-soc.yaml | 2 +-
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml     | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.34.1


