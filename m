Return-Path: <linux-renesas-soc+bounces-19269-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BC3AFA149
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 21:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 26DF27A128C
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 19:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94A931C84CB;
	Sat,  5 Jul 2025 19:08:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DEF19CD1D
	for <linux-renesas-soc@vger.kernel.org>; Sat,  5 Jul 2025 19:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751742530; cv=none; b=mMXdw0e9ITBoDhoVK+OhTQVxm24z29tFNaMd6jdcy9GCQl5tBBiztCXnvekx8ptYhhGb0tiWUvBeV0i0eumTzGgYv1mkLRQ2N2s2M/QamobsNxrqwRmJfFV21lkIgLc9SdELoz7Kw3uF5bCv84WyfepWiq7K63ysK1ofgT64Gao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751742530; c=relaxed/simple;
	bh=7M9mpvMwXno2tINlC/k/YCV868UAs8VKdBeG4ME54LY=;
	h=From:To:Cc:Date:Message-Id:Subject; b=unyR0DVI2OhKOvD1u/KmoBXgTuftxz/OTJL2GdUmiULmZTcXukBdD+JUDFxDpQ/QsUakGwHx5ZQdaWkisx1gEWNK/ybxn09mT7o4C/8uUes8CCQZ+Jm/P2BaPxCDxJBbYxpXGhZnRkjoU7RaJ7CZ70i9SCPqwUoP2MZ7fjNoznE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=opensource.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6facc3b9559so33678256d6.0
        for <linux-renesas-soc@vger.kernel.org>; Sat, 05 Jul 2025 12:08:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751742527; x=1752347327;
        h=subject:message-id:date:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oo7p5L1krWoHLWjiaYwSuyJcNLXuqBfpbtRJqREB/mw=;
        b=VQFui9RC2Pi1deGRk/shkvMoX6Lglko06yU2RFIRpRRqQCMeyqOEMT+TYjarjWr8wR
         aHU0ppnEjZn1qQGhpY4p54AOOfZ3r1vFhEbCcA7f1YAO04Zxl6y4TJuPhoVYrDBIgjpt
         24I51yVRXr9KQUEkWwVApvkS+g3HDdBhST2o8rXWtwczXbsKWfjjhd+3vTeF9zTugeDF
         x9llRGZXm/2v/bTYxFBmgY2vXTeq5+m+bcJx/d11714AzcLCO8G0e5O+T1d5VdR0L5j0
         DaCWnkxRHnL7EeofmbvVMdvYHcYemqZyE1gIDXgM/6qYK2joCbs2e47Fn6D8Qml43qjI
         8RHg==
X-Gm-Message-State: AOJu0YyrHsu+30UZBmseIWmEsxiLZrK06ZjUOV7vhmZd3u7pFR6zqc1q
	+/l+d5vyPT9BjkZtwBd529xMjZx5dpPOC0/BJmAec/oGcjW8pI6EeqQrEM89akfk
X-Gm-Gg: ASbGncsDoqDnJNIRhswMrLcxuPovqR15it/vBc9MsYmzF9yj1VeMG0VPUw6UVEUP5kZ
	P9Sklf17EF3r3gTURRwzXhLHvG1iuKjDH1LraZ2Ya20PCv75lKE+KG1QbR1/UA5+bjc0IZt4HFA
	dmYKPg41r2OMHtbHLE+VnAN5kxGR6SHnXM9jVU6IGNWtTtwyXDhStBt1iXP8UabZyxtB213pfoU
	SZghyDVIi6ZayMQukOavU6if/H0DM8LxrooASE+SvFFLles2bZ1KZw6YnwdM9/aqhuSdjd9b1Rv
	4OklrqSZYB139890YTTcRQZ9UE9CCJxjPQSrOQr/2N5rO2QbQWX+OWMBfAClJR16eYiORJDX+BF
	Akm6vQffX7AHM
X-Google-Smtp-Source: AGHT+IGg7awBjOvd3anfpfxWJ5cL6ZHCASS5pXIsVSPusqr0VxnJ+iwuJq8sTbSNYfpY7AfPd+MLAQ==
X-Received: by 2002:a0c:f083:0:20b0:702:d0e6:6e6b with SMTP id 6a1803df08f44-702d0e66e9emr38690936d6.45.1751742526536;
        Sat, 05 Jul 2025 12:08:46 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([167.99.4.198])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5ad3csm32492616d6.89.2025.07.05.12.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 12:08:46 -0700 (PDT)
From: Magnus Damm <damm@opensource.se>
To: linux-renesas-soc@vger.kernel.org
Cc: wsa+renesas@sang-engineering.com,Magnus Damm <damm@opensource.se>,geert+renesas@glider.be
Date: Sat, 05 Jul 2025 21:08:43 +0200
Message-Id: <175174252387.83411.17393827352291413834.sendpatchset@1.0.0.127.in-addr.arpa>
Subject: [PATCH 0/6] Add rpc-if to RZ/A1, RZ/A2 and update/add board support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>

Add rpc-if to RZ/A1, RZ/A2 and update/add board support

[PATCH 1/6] dt-bindings: memory-controllers: renesas,rpc-if: Add RZ compat str
[PATCH 2/6] ARM: dts: renesas: r7s72100: add rpc-if nodes
[PATCH 3/6] ARM: dts: renesas: r7s9210: add rpc-if node
[PATCH 4/6] ARM: dts: renesas: genmai: add rpc-if SPI NOR flash
[PATCH 5/6] ARM: dts: renesas: gr-mango: initial board support
[PATCH 6/6] ARM: dts: renesas: rza2mbtc: initial board support

Add support for rpc-if to RZ/A1 and RZ/A2 SoCs and update/add a few boards
to make use of this and other devices as well.

The support level of the boards when this series is applied is as follows:
Genmai: (RZ/A1 SoC) Serial Console, SPI flash, Ethernet
GR-Peach: (RZ/A2 SoC) Serial Console, Ethernet
RZA2MBTC: (RZ/A2 SoC) Serial Console, SPI flash, Ethernet

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Applies to next-20250704

 Documentation/devicetree/bindings/memory-controllers/renesas,rpc-if.yaml |    2 
 arch/arm/boot/dts/renesas/Makefile                                       |    2 
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts                            |   71 +++--
 arch/arm/boot/dts/renesas/r7s72100.dtsi                                  |   22 +
 arch/arm/boot/dts/renesas/r7s9210-gr-mango.dts                           |   87 ++++++
 arch/arm/boot/dts/renesas/r7s9210-rza2mbtc.dts                           |  133 ++++++++++
 arch/arm/boot/dts/renesas/r7s9210.dtsi                                   |   12 
 7 files changed, 300 insertions(+), 29 deletions(-)

