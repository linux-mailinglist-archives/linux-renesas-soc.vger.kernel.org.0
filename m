Return-Path: <linux-renesas-soc+bounces-9061-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD98986E5C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 09:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDA77B22711
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2024 07:58:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B40618FDA6;
	Thu, 26 Sep 2024 07:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="b8za6l8V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021DF19413B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Sep 2024 07:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727337489; cv=none; b=S2maaCuh6/v4N/tzvgWpGWLDOL37BxjiRO1L+BhNzjvJMD22/emT5BMRAiY2t/96Vb2cgjjGnUJD92VJ5Sk6g+5MIO6eHfIFzNEZzynK/BoPFBFusLHDB/kBwOP0vtRRKxIzUFftbvj/YXlQwLC3KgUAbGMrYVCJxcR0Kpm+swQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727337489; c=relaxed/simple;
	bh=hks25NHK+0xaTOEYXD0Mkuj5kzB9Z6XhiaxUIOx4M00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lr1CP5gRxa9oqxPMTFY3qNkOzpRem4eDwyA0Hd2agBsq0uELagKf3ypSZMEOlUowiKbkB+fLYC5Pj7LSW1cFTtllFbjG2K3U7kQBHRjhwYLYSKxj4nt+2uARV7APckDujBYOBuxp4/OeJeGZD8DxVvSt9r0L7oQDOb9Mw2UB/1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=b8za6l8V; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=rROYepv66fnYL4
	l0i4A2pL8r6k3VREZ5/4tRfHP2TEs=; b=b8za6l8VL0YKdau85bN92zeJstZPQW
	vPGZMteHDBpgJUhyjiotIMc9RITiLen1a15+k5kis2myVCqYiHjF7E7Qut/JV3pe
	P3EoDtU5hxpj+f2HkM6+gyzII+LFUhVb+X7sHA5k0aKyZzdIfnu09xF6CcP5yCJm
	gQ5As5R5l93chyylg+pQwkR5slGUqiioSc9IzaYs5Ev+j/dFtdC/QGF/2Ks/ErDL
	XgJgGcBI9irq7vgBLGK51dop/iD+Av5tpF9g0zbLHLbGosSstC49xaeQubC5Qep5
	7ir0/y6G4r5KBSy/OpJOeb0pLKiiX8olGu3YeYMyV88oA6sGaWyGL1gg==
Received: (qmail 901330 invoked from network); 26 Sep 2024 09:58:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Sep 2024 09:58:00 +0200
X-UD-Smtp-Session: l3s3148p1@kPbnGAEjeTptKPAR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 0/2] ARM: dts: renesas: fix BSC nodes
Date: Thu, 26 Sep 2024 09:57:25 +0200
Message-ID: <20240926075724.6161-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While cleaning up the Genmai DTS, I stumbled upon further checks
regarding the (L)BSC. These patches fix them.


Wolfram Sang (2):
  ARM: dts: renesas: add proper node names to (L)BSC devices
  ARM: dts: renesas: r8a7778: rename 'bsc' to 'lbsc'

 arch/arm/boot/dts/renesas/r7s72100.dtsi     | 2 +-
 arch/arm/boot/dts/renesas/r8a7778-bockw.dts | 2 +-
 arch/arm/boot/dts/renesas/r8a7778.dtsi      | 2 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi      | 2 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.45.2


