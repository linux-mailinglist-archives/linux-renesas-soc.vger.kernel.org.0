Return-Path: <linux-renesas-soc+bounces-13256-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBC3A39B8F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 12:59:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E71787A496B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 11:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BC824113A;
	Tue, 18 Feb 2025 11:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PGp+GRR0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CA5190470;
	Tue, 18 Feb 2025 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739879975; cv=none; b=amr3ifa1XIQyEAC0MKL7bk5dKuew+lqEcsp3oUesDc4E4FRGqxR5E7CjzRqKkosSHdvz+zuaWBRXashYbpbVB/nvzH0ZiXOUYgBEABNpOJzcveIlP7WYXOEYV75mD+Ta12E9a3PNczOZ9GwUlr8qOI3UXU9T5xe6iIEr2xI47JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739879975; c=relaxed/simple;
	bh=BGkRowTNpxM8ov9TCW1djUTWPviAU6I8quExpf6NmK0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SnpAhtbqDeyyzSW1guEYm4Vvqv3ez8jphA/2lXio83EN9AG5xdKSlelCes2HZDzmqvUVYT5LrbCeCS7CVsg1brticxb3gzuqcmWIYr2mDLtphEZjnlupdoL0xTCT2W6+ZBbjc8oSpWFQw3f7TWs3D8OjU93l08RukuxymUD6HMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PGp+GRR0; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so55910205e9.1;
        Tue, 18 Feb 2025 03:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739879972; x=1740484772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O813gytfaIQgKCLFaWJ2ufXSdD7F7BWIQSR0PxjKtPk=;
        b=PGp+GRR0IJ0vRXbStQ3lxjccftIv9mOnlCaizEjPaYFEGtQGiwEz3Y3AhEt1WGuUXS
         uDcZjNSRU9XYLefcjyyOTOgmPPqP5liO3MWyHRLkJoUWTIM6JXxRXYo6Y3gn4ir/KBE2
         SnS5bfuxqaUq/p53b1fuQ7R+SnGi+oaZ0K7fZV9Q/T8je2FQsK6CqEVnYh8zCmJoWFuX
         9ZO6r22CeSOoTfH7TVW4xgHldYZcjajE4S8jZupermPD3Mp2++nHp7q81lNlPX0FNVzE
         ZycVe4F6xl1zEm0RsYbrMMzCAW3BBqGLntxQZZDKsaGEHNBwJSYrOo0lNq4iDnO1y0PR
         1M8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739879972; x=1740484772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O813gytfaIQgKCLFaWJ2ufXSdD7F7BWIQSR0PxjKtPk=;
        b=kRHCPIZDkRVsgVOaCaWs2bf6p593VYESRhRUw9tvGH8/SYsODdGgQ1S8tSnOKLCyve
         salA4dRS1GtXwNyoCc6D6nC6vhOnUUrfs76WjBtzJ6g0ci9z1SqgWOqRb54zG5SCzFjm
         yx/JRAkI9Y+pJCOL66PCdN13wEBRBY8bhHMjo+dj5jEXAjkLtoDFcmyTgBEo9VUfuBGM
         /bkFvjNBO9DCFZok3SNNdjlcSBzhthiVM8ZMSPn8poMAu4alWOLL5ur+5K7opkdMAhln
         lIMueN7RfZuS1/NQWpBrFX2syStbp8Bp+CyoBHdrmYXsj1uNMzUZwhl0fKPxJAmE7x2b
         UKHg==
X-Forwarded-Encrypted: i=1; AJvYcCUq4d7+FNDM8+72sA1L9s2fsKPGtwwg28FKh2dh+Lx7T1CfOrYvE3+TxEI1OIyd1UxU3n6Zh8H2Xyk7+DsZaB3OVmY=@vger.kernel.org, AJvYcCWCl44Joxt0d+lE8CmBU7g08uVIdkuVlLb+Qc56YEliW/nRii/CtOh3CuQlrOFFzLREcjZmealKfTL870O4@vger.kernel.org, AJvYcCXx2f4Baj1b6PUyL+uTNM8+pKmqcqfB9ONYO/aaft8Nwb7Otko1ixlctJ79YHhl+gUzQRh+gUZgBYeQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwJ5rr7+ka0rTGIYZorMBAj5uYmeemB5CDJRMzbUX4N/PUDI0fA
	Xnm/Yb4dIQfNz0ewQxc+jimgAhreh9iHQ5ihX2SEVtudLr8hJdil
X-Gm-Gg: ASbGnctXtswJuxQFDrgWw1YT6MTgF114JrM0hOq1H0vHXt/90i7zfnFZKpFV86KJhZB
	ArhUZrMAJWGwKlWhQericPMb/DzQRXNckx9D9eve7/eON++vYXmOOXe6sqHSStFOtrvhGGQxj4A
	p80xx2Vq9WcU9bS2yX9ZgInu34ZpYq2hF1dSygVAfillJUMPj78QQyZqY5y/v/subCgc3RMGbQd
	gp0KcKam/6zVDXm4tmhVe5kVPHGUeDnn19lKrdS8OfUfi2A/9J1eTmjqqnN/ngGgZaHWYIIgOeq
	bqRTEje4QHHNb0mQzt+RhPRU11cJYqXmauoXVXIqUMpG
X-Google-Smtp-Source: AGHT+IG89ZnXBXFf5f1VSsSomJrwv7mMVHfOqUcCIv9ZtqZW9JNdN8IPm7JEBYPGywYE8kKOC0HxLg==
X-Received: by 2002:a05:600c:1e23:b0:439:8346:506b with SMTP id 5b1f17b1804b1-4398346535emr60676785e9.19.1739879972344;
        Tue, 18 Feb 2025 03:59:32 -0800 (PST)
Received: from prasmi.Home ([2a06:5906:61b:2d00:6940:cc67:5b00:b151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395cf084d5sm123873255e9.1.2025.02.18.03.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:59:31 -0800 (PST)
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
Subject: [PATCH 0/3] Add support for Mali-G31 GPU on RZ/V2H(P) SoC
Date: Tue, 18 Feb 2025 11:59:19 +0000
Message-ID: <20250218115922.407816-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the Mali-G31 GPU on the RZ/V2H(P) SoC.
The changes include updating the device tree bindings, adding the GPU node
to the SoC device tree, and enabling the GPU on the RZ/V2H evaluation kit.

Lad Prabhakar (3):
  dt-bindings: gpu: mali-bifrost: Add compatible for RZ/V2H(P) SoC
  arm64: dts: renesas: r9a09g057: Add Mali-G31 GPU node
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable Mali-G31

 .../bindings/gpu/arm,mali-bifrost.yaml        |  2 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi    | 51 +++++++++++++++++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 15 ++++++
 3 files changed, 68 insertions(+)

-- 
2.43.0


