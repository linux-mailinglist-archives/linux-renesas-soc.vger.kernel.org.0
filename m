Return-Path: <linux-renesas-soc+bounces-16712-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6C3AAC39A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 14:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFACB3AC342
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 May 2025 12:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F27527F4D4;
	Tue,  6 May 2025 12:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fTCUrSqw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16A227F16F;
	Tue,  6 May 2025 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746533595; cv=none; b=VcrgVUR9ijYKVyaq8wlCs4g4re5wd99XhiT3Jr0XHupKEINdUbH5eaGSvKSjRBOMYjTF7sF8f/oSuQzbbovQdU8oGfJFSMkyzOUG+W2OjQ+CWDFuyT7XNqWhVezoJM/GuBkxCXfS/02+fwGsrS1NPfTyz8RKz6OkNArUXG/A4aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746533595; c=relaxed/simple;
	bh=WkezLrjTLU+d3BljfRIEuFJO5wKwrOidYS6e0q3POdw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rKf29YC/OYwqtQ35KoybmKYMhjQ4iM9inIOB7FMbiQpuBtjOi8+5VwZkKKUkDe/f4lnlpSqsxpCPrjVs6Lvv55kRfPo+jLTwTOMHqRWfqoUF9E3lLqxpHjhc1Tw67gZClKVi2unSpILmk3v+EOJ0nJwfRW5FG52P6Bsv/RF6aU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fTCUrSqw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87F11129;
	Tue,  6 May 2025 14:12:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1746533575;
	bh=WkezLrjTLU+d3BljfRIEuFJO5wKwrOidYS6e0q3POdw=;
	h=From:To:Cc:Subject:Date:From;
	b=fTCUrSqwLazFCD5DFnSFZMUbFbHM21mqRKvbAU8zZdwPdvVjpPelynfkuaUa70QBw
	 RqoV6xByHzslqvyDmVEHpDf9LJhRKzOxAGdq741zwS2jVfPXyjvvCmevZr6Z1qc6y9
	 TrW6XSFzjXoOTkaLLhQHHb4TotgNtr3tNjMj/8no=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 0/4] Add clocks and reset definitions for RZ/V2H ISP
Date: Tue,  6 May 2025 13:12:48 +0100
Message-Id: <20250506121252.557170-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello all

This series adds the clocks and reset lines (with backing macros in dt-bindings)
for the ISP in the RZ/V2H SoC.

Thanks
Dan

Daniel Scally (4):
  dt-bindings: clock: Add macros for RZ/V2H ISP clocks
  clk: renesas: r9a09g057-cpg: Add clock entries for RZ/V2H ISP
  dt-bindings: clock: Add macros for RZ/V2H ISP reset
  clk: renesas: r9a09g057-cpg: Add reset definitions for RZ/V2H ISP

 drivers/clk/renesas/r9a09g057-cpg.c               | 15 +++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h                   |  2 ++
 include/dt-bindings/clock/renesas,r9a09g057-cpg.h | 10 ++++++++++
 3 files changed, 27 insertions(+)

-- 
2.34.1


