Return-Path: <linux-renesas-soc+bounces-18580-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F9AE1AA9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 14:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFD114A6DCE
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 12:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05A4828AB00;
	Fri, 20 Jun 2025 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwjA8Iek"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107728B501;
	Fri, 20 Jun 2025 12:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421459; cv=none; b=FpBPM10W63jgXRdRX66lphfqYOOd2S/CyAmV/eGk2hSBvx5Lfi5HsyaV22anCvWFCrxtjOQ5ulmIpBZptveIPux5sBZCe8aKSOTUW+mKgS0jrQJMfLEpKYu9iHKfUTJ5z3XHsAJYQpe3XWrCimSdC1Gk/6bYB3Io6E4IjPYG/Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421459; c=relaxed/simple;
	bh=Gdsl7ltgcSSl1T/a9BRg4IRgPzHjEOcp1Ptwab5s3L0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eIuAGB/rFXoLk0zn0uA2ElLRCKg2BdO51Vyf2Z2m5cIurpVpQ3Jr89reHwSId/MQ5rBi1xbKpL1hToj5eYEv6zyT3aXhREAwmpIpldn6FWqPvjaxmCZeJkvqWXWmbW2LtfcJ0E1hZJk3uKHLIfVswRB6BK8+j+11miKqlD7wV0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwjA8Iek; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a54700a463so1018127f8f.1;
        Fri, 20 Jun 2025 05:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750421455; x=1751026255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yaHis4TQolxCGd0DYXkBS/c5nHz2SDiffjSBzhVvE0s=;
        b=fwjA8IekJk2ubVvPN+3LjzH/Crik+HB1qyYI8ymy9p5sUjEcqYgjQcrnOeiWC/F76T
         7RbX58201wzC5gc/uSeTzIQXMA1viMBSycBkYoFLKZt+mZ2+Nnbzh2giQKbggCRi6VLi
         YFQBQnlQpMZYjStJ39+tAUzzHMbkvdhja91ucA1lzD8T6vahr8t88DvbFY5O86Jr4BFa
         04PMu2wxQyfA51rq2OkG2SDPCFY1oSmi6jloPVnpRm8cEtBzZKC4gAJoTjQGEalxk+wb
         dMm5ibHS0Afu7c9nKHYcRi/TjlwczcXJXPKJBpsE8L/FNLWu0BddwbogQyWox1+9GUPR
         rboQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421455; x=1751026255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yaHis4TQolxCGd0DYXkBS/c5nHz2SDiffjSBzhVvE0s=;
        b=QfaysvQcXfWLumCQjDNc9RR+2DHB2cEDNQj9Xp/xmk0rzwPnQ+tc+uJljNpsiR44OR
         cc96vb1KE1ZMz9pLMzgO1/r+hXyzHf9CpFnhTwZQkWy2ZVJw+2wWMbbU1Q0G2amoYNj2
         8xYthIDJdKeQrozEY8AUCS2D9xsfwu9p9PKVHoybMadLnyxdDAICjhtfLqe1tFv00L/p
         ZvnNzJNyTCUC9lD0Oef24+F0lKmke0Q2F3sZdcTahNUrZ2Gar7OkBeFQUuk56ISVWyHB
         ljavJIs4FozGg2dZi9MTCC8cFVOz1n/52tygAm27NAnqO/YoB55zTWVT27+mybozTylp
         du5A==
X-Forwarded-Encrypted: i=1; AJvYcCVXMrTTUC1IXZIvxSkVXjBxiqpZcDEvMuEiphLKpBtca3R1Nzs07y/ewpcxGQLIn6Q0EIx2Qiu2I+jOzgTd@vger.kernel.org, AJvYcCWRwJp5fHt/6ope5XVAUTiHl5sIjlmYxsKI34r4LDgYqd5YPrdYFCnediEDIzqjRAjFT8TBxOWP269N@vger.kernel.org
X-Gm-Message-State: AOJu0YxGF2XCaut2ePO3PiedV23kSLyo5OyfFrBuI0MoTZaRf/7SkWjI
	qsIdrJ7XZDwdLHYx6ELOGyCD36dfZ4jd9muqWOyA5CeBiKcLDn/g3ZaE
X-Gm-Gg: ASbGnctjtIpvGZgxCmKm62oOWXPe+Vfs6TtpSzLknOTUYIH2tD+FhrjfU5lrepyez/4
	qg64r9RSQFbrazM8HOJcWRHmHD0d3FClUMJcJKxYXEYBWtgzEOdY88j7aDqfZ9f9eQIH7eGfuof
	s6PKgONxIvtYcxUBdBRybEgAxtg0InSUVeiQzMI/WfuqqJV6tzpQKQqihAnqOv4vGs+dlfLt4v1
	RV32x8GWvqEtPjeWMOEiAseMZoILlP/8dDysZrIHoRkJ9CszPmoEmpMQ80MoaLR7rGq/JBosnLO
	54U2USjod8AxJz3rHvhqbwJOTySW85wJo9prTQq3K6BsZFfyfW2OUBP759JphyR+6XFN2pmO72C
	/uknt7dGU6g==
X-Google-Smtp-Source: AGHT+IHUnxU4a+Lid6u3sR5kgimhf4N4hEUSoyeS3GWqYTWIGu4WGeSGmL7q3DCvDAIvHah6NwVE3A==
X-Received: by 2002:a05:6000:2282:b0:3a5:270e:7d3 with SMTP id ffacd0b85a97d-3a6d27e16ccmr1728088f8f.13.1750421454825;
        Fri, 20 Jun 2025 05:10:54 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e188:15d5:9cc6:1db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97a915sm58234645e9.7.2025.06.20.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:10:54 -0700 (PDT)
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
Subject: [PATCH 0/3] Add CN15 eMMC and SD overlays for RZ/V2N and RZ/V2H EVKs
Date: Fri, 20 Jun 2025 13:10:42 +0100
Message-ID: <20250620121045.56114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

This series introduces device tree overlays for the RZ/V2N and RZ/V2H EVKs
to support the eMMC and microSD sub-boards connected via the CN15 connector.
The overlays utilize shared DTSI fragments for common configurations, and
also update the base board DTS files to define necessary aliases and
regulator nodes.

Cheers,
Prabhakar

Lad Prabhakar (3):
  arm64: dts: renesas: Add CN15 eMMC and SD overlays for RZ/V2N EVK
  arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Rename fixed regulator
    node names
  arm64: dts: renesas: Add CN15 eMMC and SD overlays for RZ/V2H EVK

 arch/arm64/boot/dts/renesas/Makefile          |  8 +++
 .../r9a09g056n48-rzv2n-evk-cn15-emmc.dtso     | 15 +++++
 .../r9a09g056n48-rzv2n-evk-cn15-sd.dtso       | 16 +++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 10 +++
 .../r9a09g057h44-rzv2h-evk-cn15-emmc.dtso     | 15 +++++
 .../r9a09g057h44-rzv2h-evk-cn15-sd.dtso       | 16 +++++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 14 +++-
 .../renesas/rzv2-evk-cn15-emmc-common.dtsi    | 46 +++++++++++++
 .../dts/renesas/rzv2-evk-cn15-sd-common.dtsi  | 67 +++++++++++++++++++
 9 files changed, 205 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk-cn15-sd.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-emmc-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd-common.dtsi

-- 
2.49.0


