Return-Path: <linux-renesas-soc+bounces-12054-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FA9A0A1E6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jan 2025 09:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FAF5169F06
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 11 Jan 2025 08:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63699185B48;
	Sat, 11 Jan 2025 08:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b="d8R1mWZN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED96817B506
	for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Jan 2025 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736582968; cv=none; b=VEPV5qlhKgRfQUMOtIo9ym6XVNzCC7HzuRQwjgTtxfN+co81Gqf1NHKKdytG4QNP0v5dHtRq7crIqxkuV3AjNjeU6itDV5kBkfOd/VlwTUf1AgWYLc2viHIl4EoI5Mkv6Xk4lLUFarSbPe+K87ls10dkrxLFt0MggcUdqOLjK94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736582968; c=relaxed/simple;
	bh=jdyYfF5clN7X0hC3CyfCKkViUyJTBevokrPReOg6Dk8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TY8o/SYRmoPMtXcPpoITpdleoXFQ27LMPV1tvFbMvTwYQH94xbBe2C5DIj1OAq173AlDkF+6p8Qz7jOT2eGKFEHSjEJS+RBk4bN2fjzITHQZvvAZw3w1rSkbBoS+IVUpVOH/vrLuB7wHurEZSTsPFPdQz8wl+EoxvTtCpe3qX0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org; spf=none smtp.mailfrom=nigauri.org; dkim=pass (2048-bit key) header.d=nigauri-org.20230601.gappssmtp.com header.i=@nigauri-org.20230601.gappssmtp.com header.b=d8R1mWZN; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nigauri.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nigauri.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21a1e6fd923so62575725ad.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 11 Jan 2025 00:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20230601.gappssmtp.com; s=20230601; t=1736582966; x=1737187766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eg6ioz6JoFltA8Zjh/jzTfcJqOKdn3GUjdx5b5ttjXg=;
        b=d8R1mWZN7/2QFxLuTO5ymZf4kf+/FBDRFOPiPecGYonSsI9y6BELpzQRFSUDhXle/6
         3f8dkarNWfxNfCvGc+D6MHi9ViTkSUWFBE5fh8srz+CfQRNh9Cp61JBUIMRbarHFjzcR
         RNeWZ7hLQo6dnealpykvZvIk06tN7nYY31iC2yXK3vgpFPBRnD/J2a2cqCmNNf2QZ/an
         dFoNfc9lCsjkQBaOYeTcPaMDaX2kLz4mI0enIjenymOhOw475yKQ5GoR0eRRvUk5xEMj
         0pkDRPsiGA5hqlp4Bo5s5dec1eEIlrDF8I6nVEwzi3OzHocVdOWtoFnre1gZouyQdcb8
         wZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736582966; x=1737187766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eg6ioz6JoFltA8Zjh/jzTfcJqOKdn3GUjdx5b5ttjXg=;
        b=YW16MJK8oL34TIxNqENDhS4KeoH2Ah9KYP9DWZ3qHCdf5viQAasIRcMxdF3bES0XHu
         FjbEA/reuB8CGkXvRzitvEx8q+7SG9UBVxTO7OsX43mMN3sPF9LBMUgXRbcz6z0lqNqG
         7A6C9NISwo2TAA2cr41IFRUIakXsjnATE5WaGfwNF8L//hOZn/8kV3e2YFo7h7qxKsAZ
         rMDIcmbOAlWpU0GEZIttuRH+WsdA2AM5O26n5L/Tr7VMgu4EMo9YJCYPWrhkmo1gk/G0
         mRgyv5BozymPEJ7SbEsKRwVITqNwbpageoHjQ7T/traIWUJTi14x1/VTyjJX0Dz3118n
         koGw==
X-Gm-Message-State: AOJu0Yzwq2MX3UFsCyUvO3Syru2gAg3Pv3QVqvQ+gHQUHCm9lvU4/Dli
	ks/ACf1b1OKnsKVxfiXbM6btIFZRFIxMffV7+1iWewKGzlORIWuCQWl7vuOS
X-Gm-Gg: ASbGnctsaE/dzXYm0p0CtKD4cufS9mHsZObmbXjvMGQcDChWbWDsUrgeJQLWj1FrGCs
	+Pu1oSWUZ1aDG9AghewSoALjp2l3nnRsxbonjmJnOhcrog6vcQKxJGJlIckHmejt6DlKRMpfmxS
	XLAL4Z9NQVCg+dKLq4V5hYG4NVb5qExDcsIYRjESYo19rejVY9ChU1v4mPebSYQvFzeKMV9ZmCN
	jZqZqDbMzROO9sgBHm+pmrlVLr0diFyd5J+62HyQeAEEPbYWjuwRLS/fw==
X-Google-Smtp-Source: AGHT+IHmh2z58BmWM8Y3KdeDIj1EvGQgFU3W3NnG36qp9Hu71RV7jY88f23TWuiw6XMrfRbRIxZe8g==
X-Received: by 2002:a17:903:234f:b0:216:1cfa:2bda with SMTP id d9443c01a7336-21a83fc3891mr236338815ad.43.1736582966273;
        Sat, 11 Jan 2025 00:09:26 -0800 (PST)
Received: from localhost ([2405:6581:5360:1800:aeaa:a1da:95e3:2274])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f1386efsm23204265ad.75.2025.01.11.00.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jan 2025 00:09:25 -0800 (PST)
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Masato Kiuchi <kiuchi_masato@yuridenki.co.jp>,
	Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH 1/4] dt-bindings: soc: renesas: Document Renesas RZ/V2H SoC variants
Date: Sat, 11 Jan 2025 17:09:00 +0900
Message-ID: <20250111080903.3566296-2-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250111080903.3566296-1-iwamatsu@nigauri.org>
References: <20250111080903.3566296-1-iwamatsu@nigauri.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC documentation for Renesas RZ/V2H(P) (r9a09g057h4[568]) SoC.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 Documentation/devicetree/bindings/soc/renesas/renesas.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
index 225c0f07ae94c8..4f2645e8140c5c 100644
--- a/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
+++ b/Documentation/devicetree/bindings/soc/renesas/renesas.yaml
@@ -552,6 +552,9 @@ properties:
               - renesas,r9a09g057h41 # RZ/V2H
               - renesas,r9a09g057h42 # RZ/V2H with Mali-G31 support
               - renesas,r9a09g057h44 # RZ/V2HP with Mali-G31 + Mali-C55 support
+              - renesas,r9a09g057h45 # RZ/V2H with cryptographic extension support
+              - renesas,r9a09g057h46 # RZ/V2H with Mali-G31 + cryptographic extension support
+              - renesas,r9a09g057h48 # RZ/V2HP with Mali-G31 + Mali-C55 + cryptographic extension support
           - const: renesas,r9a09g057
 
 additionalProperties: true
-- 
2.45.2


