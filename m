Return-Path: <linux-renesas-soc+bounces-25138-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AC28FC87617
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 23:45:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A95F34E2A4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 25 Nov 2025 22:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 900821EFF80;
	Tue, 25 Nov 2025 22:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kqOvMUkc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A791423D7EB
	for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 22:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110751; cv=none; b=gg22gXAppXqIZ1sHerDyM3M2XITChZyEc6LUwC30iVUQnZVHFeL/08eszfmK1idClbBCOn5Nl2FvdOPTBy1tU8PYYVrBU9LGvEgNYTpmdas/hFZyfsWd1iMx0wSjme1yKlgRveYCCkabK13nZ/BEpk1pI0dNf2KbzZxNcsj9kbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110751; c=relaxed/simple;
	bh=w8mNRAeLKha33VFGvL1XvP8M4nXjp41sOz7XYvZq+Y4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sbXHpSNhxHQEz1InZbua/MwphDFgtOZS31AOv947y/XXDQgjtiSqjKbnpFw+MJyA3q14tpT5vw1cHzn1oEaxpk3pXRGi7aDhWd1InbD2tFlyV/IGaHjjhYIun+JZMwbscufuKA876gCgeaEWwpKiV8kdibIWc0+k3YjYsMNMj3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kqOvMUkc; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47796a837c7so40115485e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 25 Nov 2025 14:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764110748; x=1764715548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V0KAk0RzOUIX6B125q7+2X09rFqLxaF64bhSJF+hv48=;
        b=kqOvMUkceKMaBtfmz9XRrRAj7Ih1MNHz2sPiG6krKQzXKMSuwZ8WXu2C6uSP0fjgXf
         Wbe5vBg9BHWZ/rzB8uNkPygAbXRB2S56psYAXvFE+Z6KuSh5VL1Xx0p+ymHXrJzL1MUH
         zEID6yaiXWGC+caRFZK+n2i7ox2b533FO6paA+umYyC1ASHS5/OUf4Dm6B0KQP0b934+
         q6PUEkgJzUmpux38+iWSvw2FCIGLD8QAIAokGHN6MtGxc+8pIOnGBOnS5wRGJKzL3017
         Y+VC3X+oF7dVF93lu/hW3TdHH5HPuEQ0OkF0rxP229yjPlenHk9j+c9Kx7JX2FQaR0+K
         k4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764110748; x=1764715548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V0KAk0RzOUIX6B125q7+2X09rFqLxaF64bhSJF+hv48=;
        b=dx1BmqSa4dXbvvNxRm+Bx388SeySs1LU2VmKeP3bJD7YIkjPuq9luzuSq5eK0feI7p
         lv0aiBfHnqaK3yihkKx6/J3Xb7Hh/FEfZqwV/9M0LM1vvu7gkGCvT6BSaO+NEvjtGVkE
         eOpp7oEE24xjpqW3jbaAl0evUcKUjFtHYmgWq5SXlMYkxJY2kGyqkVpSYNIrbubcHiV5
         RzQsU1tR9AdXEy2qS1slSx5RgNdLciYLspOUicIOtihU2QeGD78tvBSdYwv8/6RqYX6A
         h8tlfiFj0lqpVR6OzkyQqR99Ssulr3N8AHTGD1PJmQtnyj28jO4cu1DUoc637BU6zP8m
         0J2g==
X-Gm-Message-State: AOJu0YxZ+aNUCHAf5zD2k7W/WD96smK7oVxpNH9S96utbFOA3JGvWbEk
	fFypvOhE6c8+gQpJemvbkxTeivuSMmB5bJ4y+T5OMXopcOXuIk1H6Zr0
X-Gm-Gg: ASbGncsCxtWOSWbXGkzI4WHFOSvOfpLb5JuJYPyFhAnZ9UoVWVC2+8gSOKsm3jH1wH9
	p3CLVp5m8fLqh6fdar2fogU6GAGeRjAW922WwfEZh7nf/ED/WNRbjJlkKEy56lUOiz795KssDac
	3kl3ew9BEWiUTqk6KtNj3+q5NBmgV66zh/9glbmCUVFsOFt3hPjwy/ci+jvwZX8leEZoAtC4sZy
	3HhHD+fY7N0Mshcl3Lj4rwP97D+SmpegmXjhjxb4LWNMW0vg8vK0OJHe9gTM55h8WHr/3/I/UVP
	V+E1acsQeVKQViqLJvsxeAK4eRqD00P/O/nA/yiNtS9QD3jmgCvJPPE+8cIr8H0dBbvjbBYzthA
	X4dixwxveMDv2tPbnkF5NeGoD+oyyMAiHkXJohhbFuk0utnhnu3ieUL+cxEjEvtus6afxLXVpQU
	rDRkkVzNg8xTW0ZdcJCk/xPijyjZ2CR5Dm5A==
X-Google-Smtp-Source: AGHT+IG9SgbWz5dsRFc+pdK87KRnRDY0uLHyRj7mcEOhq7+XRO0EpZAtynsoeqnsGhkoLy4CapHTjQ==
X-Received: by 2002:a05:600c:3146:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-477c01b2211mr170722745e9.18.1764110747920;
        Tue, 25 Nov 2025 14:45:47 -0800 (PST)
Received: from iku.Home ([2a06:5906:61b:2d00:325:d7d3:d337:f08b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc5ea6sm11683045e9.3.2025.11.25.14.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:45:47 -0800 (PST)
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
Subject: [PATCH 0/4] Add ICU, DMAC, RSPI support for Renesas RZ/V2N SoC
Date: Tue, 25 Nov 2025 22:45:29 +0000
Message-ID: <20251125224533.294235-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series adds support for the Interrupt Control Unit (ICU),
Direct Memory Access Controller (DMAC), and Renesas Serial Peripheral
Interface (RSPI) found on the Renesas RZ/V2N SoC. Additionally, it
adds support for a NMI wakeup button on the RZ/V2N EVK board.

Note
a] The DT binding and clock patches have been sent separately for review.
  - [0] https://lore.kernel.org/all/20251125212621.267397-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
  - [1] https://lore.kernel.org/all/20251125213202.270673-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
  - [2] https://lore.kernel.org/all/20251125214529.276819-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
  - [3] https://lore.kernel.org/all/20251125221420.288809-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

b] This patch series applies on top of below series:
  - https://lore.kernel.org/all/20251103200349.62087-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (4):
  arm64: dts: renesas: r9a09g056: Add ICU node
  arm64: dts: renesas: r9a09g056: Add DMAC nodes
  arm64: dts: renesas: r9a09g056: Add RSPI nodes
  arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add NMI wakeup button
    support

 arch/arm64/boot/dts/renesas/r9a09g056.dtsi    | 320 ++++++++++++++++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  13 +
 2 files changed, 333 insertions(+)

-- 
2.52.0


