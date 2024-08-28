Return-Path: <linux-renesas-soc+bounces-8442-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C075E96276D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 14:42:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 777BD1F251DB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Aug 2024 12:42:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CBD0178368;
	Wed, 28 Aug 2024 12:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I2gmiUFH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D0B1684A8;
	Wed, 28 Aug 2024 12:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724848912; cv=none; b=q4B5gZ89AZEQByV4AxpLCis8Xy3T+Jjn6bbsg4TQ97XXCD+YpKSYZfQCB9WgwkgAQ8wQUi8sYI1p2ZVXc66JyWx0Kr4arIegn2PHjRQvOf+U9eP0RHJM9n4YonQnllzDKDCztS+FjN0anp3Z1FVUbUrrqMiSzaCR8yUmGEqctW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724848912; c=relaxed/simple;
	bh=BWNDHsO3rI89R1wLPpayCvv0VDwfRj9ozrCaFqXJN3M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t0gj5lju6to0zE+wbBvLxqG+ZB6T/62EJDKka1tlqRSZ+ZwYZ8NMGSVnkquWh5vyNV146zdZCuildjWdm+0XamC7fFSILO+zd0dTbyugioPtMZrv6q16rRrRREVWP9FKLY9Y11MU9Dd/50oRFqdE+Qwze6DZddlz2OyxrGTc3QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I2gmiUFH; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-371aa511609so3356014f8f.1;
        Wed, 28 Aug 2024 05:41:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724848909; x=1725453709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfyQDJmdcE856/VbtpDWOftGgnMV0r3wLRDKm98vimE=;
        b=I2gmiUFH6Hz/yG8zyKUDfYmCCx/wurgoPTbnFui1zc2ANhWGmCq4bD179sglO8UFjG
         +sa9Lq/22StKfnXkfhHJyReONre2j1g8mj9vY1cfxvcFw9nbzQ+v5YhL7PxS+WpK4z2j
         iy+Wf8pYQ19qh43i9AwXNIUWqhrysCQu7S/QN/+yHlf0kBPiREsiSmmT2MqH4tsWKlD1
         Do3KM568pVrM7aqnp4ZeecszUeIN8FQcPp6KFk7qdhvoWUWkodOy+gpSKQ2bw1yaVhkJ
         1P4ywgHwDjaDX5YSfH2wYobXT/TXBNHxP0fMllLmHFuPpFhv+HFYip9VXVggo4JgSuEu
         yjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724848909; x=1725453709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfyQDJmdcE856/VbtpDWOftGgnMV0r3wLRDKm98vimE=;
        b=Btxd4GcTYFHMKM/Il/pshvcx7xqcNzdU5VzTiklIhizRrE2F+FFpZ6w6b0of2OEdSq
         d9AIkVaKvqlRu3yXraisEsxgcadgIZXFICu9Kmj7k1PVHQOjzAXd0k52QlQByf1nOm5x
         5TPD1YC6ErD//vIl5fbbHtHVkEXpqxNSp3S3QNP6QBu2xdste2IaBqoEHg2E/CWRz1GL
         7WhWOGa/RgZNpeB7LudgYh98YQKS3+jCoXG94wi63pWRoRe/PO5F+ymXrhg5XeHn17zb
         NnV0Kah4KubYUo1jY7kFohTDIzwcH/TCy5ICXcK6syW916KTrA/U1eTbk6nzFWGYb2mc
         Miiw==
X-Forwarded-Encrypted: i=1; AJvYcCVpnWrXIzNKfd1xHJPw25/yzy94n58CBwm0vCypfqpm9kBMDQiZJFepuOmPQyH6SXeaEwicXnululKA@vger.kernel.org, AJvYcCXh+XuNRbDYK8bsNeEwxB8VSqa2exhhX4FR6YsKrbFW6LwBniHiIGZkND7AVcY2l+HZSLeAwQ2Nd0ohJEw1@vger.kernel.org
X-Gm-Message-State: AOJu0YxUniUMQrIUXbFP4ImhLaiv7c2iV3kZHARxHJULczcAuwvD8JGA
	yecBlWsi1MfaWnMr1uTvUUEl19Q4IQND07oCEUx/s/PY6o8pxJmP
X-Google-Smtp-Source: AGHT+IHoVDBmXPgKbuRK85r4MVKZdgSsV+UL8nNfKtiwIyvl1NIv67iq/30Gm4YNCyL6v9ZsoEFx8A==
X-Received: by 2002:a05:6000:b41:b0:371:9377:8cb5 with SMTP id ffacd0b85a97d-37496815926mr1227802f8f.14.1724848908938;
        Wed, 28 Aug 2024 05:41:48 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c5edsm15508226f8f.31.2024.08.28.05.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:41:48 -0700 (PDT)
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
Subject: [PATCH v4 1/9] dt-bindings: soc: renesas: Document RZ/V2H EVK board
Date: Wed, 28 Aug 2024 13:41:26 +0100
Message-Id: <20240828124134.188864-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240828124134.188864-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add "renesas,rzv2h-evk" which targets the Renesas RZ/V2H ("R9A09G057")
EVK board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
Hi Rob, I have restored your Ack with the below change, I hope that's OK.

Cheers, Prabhakar

v1->v4
- Updated 'renesas,gp-evk # GP-EVK' -> 'renesas,rzv2h-evk # RZ/V2H EVK'
- Updated commit message

v1: https://patchwork.kernel.org/project/linux-renesas-soc/patch/20240724094707.569596-2-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index d582992aaf0e..b7acb65bdecd 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -527,6 +527,8 @@ properties:
 
       - description: RZ/V2H(P) (R9A09G057)
         items:
+          - enum:
+              - renesas,rzv2h-evk # RZ/V2H EVK
           - enum:
               - renesas,r9a09g057h41 # RZ/V2H
               - renesas,r9a09g057h42 # RZ/V2H with Mali-G31 support
-- 
2.34.1


