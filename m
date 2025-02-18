Return-Path: <linux-renesas-soc+bounces-13257-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 346A9A39B93
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 12:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C3EB43B658B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 11:59:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B2262417D8;
	Tue, 18 Feb 2025 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nlMcA9Hp"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B99E2405FE;
	Tue, 18 Feb 2025 11:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879977; cv=none; b=PnCiw6wnkb+9lz6frh4JPm5v6R+av7Gdnko2zuXG1JIAc2SXbsIYxPYRgRYeEB6z6L5qfSzb9NKnkpNcofuTX8E9gm9aPeyjqpixmvf5V/LmHgztzKYY2QL2uq1SnNyzX9EoxYP4OvP5liMiuT8qsAaPev/31C9o5oAIPXO9e9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879977; c=relaxed/simple;
	bh=P42zDYUCxcw6Vt6ijEMQcQhExY+zntS3qKwu+Q8ZUJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eMCFQX9kWG1Lc7WUzEcm/qz85McFrxfilU23rHUDixJJOp9h4H/wnFbxZVfamfQG3tAem9llcUO3lZXDVmnh748BEcyv/wbpJlOtOZw5g9QcNwfiZGTclUWs2ZRkB3yIQelaAVRjNl9+Fsi34NUhx5c6kE+OgyU5CCOO+j3NUaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nlMcA9Hp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4396424d173so53657685e9.0;
        Tue, 18 Feb 2025 03:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739879974; x=1740484774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=plNt14WfwZSI7Nln3sGs9yH+Yl4xRu49ch9ykH86mJ0=;
        b=nlMcA9HpGgHvgSa6cgLxL84+KUfG4Hp4q+OCbYAjDyfdH/FcS61obS8KLaYdxEvIqs
         Kd3DxR7N+URrjgahUVCjMY0BR/IW+RjmYmShnIASuw0CaN71yZNxH+93FR8CPXNzlRxy
         kIKUjUhlQ7+qnkfUIuCVvZOyHoT/q9bW3IqxJFOOKpFdEuMkEqKpFhyGH10BYEUOy179
         8Wnu8CzwhT9FU39IUXnX+pmdCon8qXAfQ2fC+kxhx1svZTYSsbAnmVGxPJAj1yI5MF36
         I2ArOAQ4BaWZy2AqO3Ia6UsWbOHnIRYgyNcHjPymXKnFM3B5v/+d3JnUNJZy7Td2jmB0
         ewnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739879974; x=1740484774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=plNt14WfwZSI7Nln3sGs9yH+Yl4xRu49ch9ykH86mJ0=;
        b=Dfo147tiprRGNMVm/5PGhzqeNmAqTx/N81h4Bd61r3MNEcvfXcJmzHbetYy9jIbGwp
         DbN3Vs+N24Zu8/leT0v23qI3amya8Hu+P4cJe09RzjE4l5KS8755M/qUDQbkWIyqSA9O
         gSwpTopz7uBxUdL3lIe4o6jXK1kmwjXPFUyIjOxgDQMce39sNOf8y2sAoCOuZLbX/KWK
         zJs5cBlCVjn8UrJENCNNnAjaVy/GT0JivdkjPJZDRgZIMSdOQte9zpsYY4tD08MGJfhK
         igsRVtpx77n9zk9FWFFIH9tzBnt0XVjmr/omaoWWfoQp5UwmPSAMEeRXrRMTaf72Ka6f
         CRGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW394F42MaB49O0CsTCynaAMGM4FVvyi7NNmdZtyk2WtkpNkPCpUsIcxqMqWCbDFg0jXHlUik3tL32nbvrnnvWiIM4=@vger.kernel.org, AJvYcCWvk8gNo36/6WgOo5K4g+9ovrAXkcuDPOQ7Bqtqts/DmzWSJa4DXR+keMdePNzOapjYitNYe42DXraA@vger.kernel.org, AJvYcCXllMoLmIu5YABiC/2dACvczo6ANCB82Z5BOzMyTrtacAW4JSMOzdSLz0kWpg5mOAArvxMcpDl8GGWk8W8J@vger.kernel.org
X-Gm-Message-State: AOJu0YwbDbsFlV4+xvhbgrxFBMzd8O10XkDcRBm1Q9shkU0BZa5Z6v0r
	Xhrgzd5osrUxxCJinoXZBxG3/XKGTaH8kw2YH2mMguCMd9A5IRFR
X-Gm-Gg: ASbGncvMRvHdKmtvf/bj4o73LmUCl+be60dxDvOL8dwCEQdBAGI1qIQ/rT5vCRlmQXf
	FgoMphBQ+WZepx831HjKqpFzrssWAueXupKPU1lKbV/T/QMqu/gF21cY7oengOQwBm+zlVUGWl/
	LIAwCGaIhhsEMjlGpFbFzVCKjcQHMeWIu1hqE/8BwOoKBJ0VpKmj0+kQHg/MSOFzsevksTCGizj
	baXh7E1eei2nBSeDqKsxNuKMDTgZtL6rEpwnDBIFsN9Yd1nZ6kxseo52lymHMB9ET8MfXYAui+J
	ssTcgOg0NYqFq5nPtUVNi76wml3hazx6YmfmSrv9IagF
X-Google-Smtp-Source: AGHT+IGqpvy3pV7tb5l4+0aGMl4HQcPTOYCeNXFe0yeVJw2TNYm0+gCfRUOjhvo8TM1/rvWytw9fOA==
X-Received: by 2002:a05:600c:3ba0:b0:439:93d2:72b4 with SMTP id 5b1f17b1804b1-43993d2742emr26482955e9.16.1739879973585;
        Tue, 18 Feb 2025 03:59:33 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:6940:cc67:5b00:b151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395cf084d5sm123873255e9.1.2025.02.18.03.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:59:33 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: gpu: mali-bifrost: Add compatible for RZ/V2H(P) SoC
Date: Tue, 18 Feb 2025 11:59:20 +0000
Message-ID: <20250218115922.407816-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a compatible string for the Renesas RZ/V2H(P) SoC variants that
include a Mali-G31 GPU. These variants share the same restrictions on
interrupts, clocks, and power domains as the RZ/G2L SoC, so extend
the existing schema validation accordingly.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 735c7f06c24e..1c81aea28c51 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -24,6 +24,7 @@ properties:
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a09g057-mali
               - rockchip,px30-mali
               - rockchip,rk3568-mali
               - rockchip,rk3576-mali
@@ -142,6 +143,7 @@ allOf:
             enum:
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a09g057-mali
     then:
       properties:
         interrupts:
-- 
2.43.0


