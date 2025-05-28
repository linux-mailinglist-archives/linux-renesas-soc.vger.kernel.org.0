Return-Path: <linux-renesas-soc+bounces-17631-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05284AC6B33
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 16:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C80C5166F44
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 14:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50CA28689A;
	Wed, 28 May 2025 14:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MdfI/omr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23861A5BA3;
	Wed, 28 May 2025 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441106; cv=none; b=HCPUeAkTL+XBc5/9jXuyMGVTRUzKWorUHo99yDQqt9icmVfPlngsv3y0kukxpjFXIk9B70h/F2mKmP5TWkGVcDCNcGg0HXvW/nVGYzggR51Eu/bStOOuvbyNHypPZSzjq4V1aK6xxOF6kwrS0JMvyOw1w4LHsZWIRjcjKLdiu8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441106; c=relaxed/simple;
	bh=zjn5gJRBgTscFFqn7FJUgUIpKHNTfnPwm0I1AAWljy4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EhJq/GimghOa9/VfGGeNaRaH3EfRqj7H6FgqYjuAjaosz1tshb1eeJEYJOtkk9mNxaooRGv8LlRUHtFZQpNK2kVm31GzTf8XcUhGBMqbGyUd7yMPJNkURD8gFmZuAoI3Gc/5HwTiQpa2QQXcgIDfUXEsla6qnHKFz8xk/AqFVp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MdfI/omr; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a366843fa6so2853063f8f.1;
        Wed, 28 May 2025 07:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748441103; x=1749045903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oPEjb9xSYINExy0eyIdBHIutjX/5AUSSUBN5rBiGPII=;
        b=MdfI/omrnUGROE7u6KoEZVVGzO58cnZdmD7RZqpYDk+OeY5v5Frq0bsFtmDKx2vmZJ
         MYKeo2NuumD2W9gExFsD/c4b5GZgycola9Nea0l32NFK728A7DXM2hMFcF0E6xMUMWA2
         plJrGv0m3LQHmDf7x0PYK2qGt8IWrksndOfgME0vsULrYLPxEvjitwozJ0iLduFq4Lh0
         jM6TeVy0S3z5JOW+YvcuNcqUMtUYVhts/fwY0kzKxBh1fKew4JkyHzNGmiOEZpsQ1TVw
         sGYGqAaiOARXMYcRfai/9YjFDjZnCYDh+mYCBwjMLaw3REoWkKtpMig3Iqxu2T5TLc9E
         KduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441103; x=1749045903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oPEjb9xSYINExy0eyIdBHIutjX/5AUSSUBN5rBiGPII=;
        b=NDKbLitt7WNUlZNvDrv0gI6FA/fk5ubufrnJSAH7eDcXG8FTQNltjESp15oxUUIBap
         CtqqTkIjJtETOcbaVGxg5x+BPZGLDbRTFzxMHiMGq6yrUk5ogyF9k5cVcufrZ9O391BO
         /7p6tEx+hmKgDVwHbR6u4g2N5OZOz+Tqf4E6klkpwdbFmpdBcjJKrefOURzPpta0au3Y
         8laX/PfCPTYLhIwSFL70hSJhe89joGNX8yNtwMDr/xEuEciOYA+ix2sG4RwMnZcC03JB
         gpOypP2xRhBnK+bY1AI36eRflZlICeaSYtThBqahrP2a1nPQLDDoA8WzN+O7CNPdKGTl
         G7qQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOcsNvr983MRriJZD5SV8TN9xPkcdhpJQ1nesFaDcmdLC385isVXrCOad5kaNyVQ+2PC68SGpAy6EvOdPB@vger.kernel.org, AJvYcCVhQ8iyJKFXype+0/9okX/oIFqBBAL+DviFmZLgImfrvmn8XFmjvhp0BVjCs8ZCGj0H5K/KyBE8Rn1e@vger.kernel.org
X-Gm-Message-State: AOJu0YwuMDJTxMA2LmZtrF6Uk3cGn8lzvaujgiQcbdCGuHC6JgJ/bG4j
	IKKfDSrf2VK3lGY0DWzYLy97fb1jv2Gvro3BP6avgXhCg5C/sCxQTaXO1hoL4C/S
X-Gm-Gg: ASbGncswQCN2mpON6jDXa3J6s3cnhoLsaVT0U1DwzrmOHX6MoTp6FKuik4RHCkwTF5e
	nNML16BB82CnR30IamvYcHK9znbgv5ZK4DiX7VGdw6AHCiWOKoMSr43cVrrtsdy+S8KW+xWQV2R
	RhnHMj8aGIHmcoLZrk2KN/HZ6FriqOs7JUkxXygHrV72OhKFprY55rAeDOpA57I7SxRM9XkRPUl
	UA1BrnkkyXwzC8TdSHWEJocYr2ajM5GZJ2G89DSqzAzEpIAxuIGNd7BpC9LxnPqjkEU7I7PpEvK
	j0ZEeenuLrQCiacBLLtZtYUO3bPnXNL4D0euljn7U6NBG+PR5Uox9ztE/Svq7U6Ol+RaSE9Vumd
	J
X-Google-Smtp-Source: AGHT+IHgujYjNU6Xq5ZNRiDumeW0aKz5xZPU9Qup+8+ClYpot9snD3m49i9q/XW2gyj5h/3d/p97IA==
X-Received: by 2002:a5d:4102:0:b0:3a4:cddc:d3da with SMTP id ffacd0b85a97d-3a4cddcd4f1mr12452290f8f.36.1748441102966;
        Wed, 28 May 2025 07:05:02 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:7078:193c:ccdc:e2f5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450787ccbd1sm18846795e9.25.2025.05.28.07.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:05:02 -0700 (PDT)
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
Subject: [PATCH 0/2] Add USB2.0 support for R9A09G056 SoC and RZ/V2N EVK
Date: Wed, 28 May 2025 15:04:51 +0100
Message-ID: <20250528140453.181851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This patch series adds USB2.0 support for the R9A09G056 SoC and the
RZ/V2N EVK board.

The first patch updates the device tree source file for the R9A09G056
SoC to include the USB2.0 controller configuration. The second patch
enables USB2.0 support in the device tree for the RZ/V2N EVK board.

Note the binding and clock patches have been sent separately,
clock:
https://lore.kernel.org/all/20250528132558.167178-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

bindings:
https://lore.kernel.org/all/20250528133031.167647-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
https://lore.kernel.org/all/20250528133440.168133-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
https://lore.kernel.org/all/20250528133858.168582-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a09g056: Add USB2.0 support
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2.0 support

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 66 +++++++++++++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 36 ++++++++++
 2 files changed, 102 insertions(+)

-- 
2.49.0


