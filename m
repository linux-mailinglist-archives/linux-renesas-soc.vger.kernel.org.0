Return-Path: <linux-renesas-soc+bounces-23495-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C02F7C00F35
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 14:02:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 300A418868F5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 12:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598D230F93F;
	Thu, 23 Oct 2025 12:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUzRVLSR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2768830F542;
	Thu, 23 Oct 2025 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761220905; cv=none; b=EzewLExU15E4qGEixo4+gLIvsBc6L1Q3hf3N8gfywwvMrm0TfQQtSPzZUG6Kov2RRIq0i5DFVt/OQHn/OgHbRi6Bqcx9FVzR8141L8YW7ai1phPNy63iG89djVPyg9CloFHwZVSIbcTQuWT/kwuiQVwjWtP2Fj/LkdE/vWz2M0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761220905; c=relaxed/simple;
	bh=8k0zkVr652YaJANExndgN8/09F75/Yh2yR8RKwAa0Y8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ab9qHfmtBuR1Yi5yv09vzHKHfnuI3GY40JpiDwS1BRKaOkwpRiZz91n/QobzmoKjFtjUygq5nNFKix+rZpo+xv0N+J+l9O3FfnipQyMKXOri3jyETbRonQgpDQR5ksuCe3ce8wxd+CDNMXolaphAkijuYkRQnbPUPi+TGPbYkHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUzRVLSR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105A8C4CEE7;
	Thu, 23 Oct 2025 12:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761220904;
	bh=8k0zkVr652YaJANExndgN8/09F75/Yh2yR8RKwAa0Y8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SUzRVLSR4uVduqSoxIp0oJciCTHeUeSzueQYxIPX5y/oNWBNHVLgOvgxwLKlvbXll
	 8MHtUgo4LCo1dnio7lKszcczffugxscMmnOrPgYcVN34dKjMFoYx3KcuJtOdbZucBn
	 opNKFENPfkzUEp7b6UNAudV4AZsI23CNpydoeK0LnD8Hs68Q+Z1Hy4aZv4Bbcu/Nft
	 ZK2tOdmNjFD73VhW9xwall3mPcffp4pw9vJXdWspUp02YEuYu5Wm2keJTiT35/1Qgb
	 lOxb7ui7Z9Asja6PA9IIIIAacskoDo4ZuHUHQjYYQrHXNk22KgnbJPK2B1GoKx/ajM
	 3I23zY3qBr3KQ==
From: Lee Jones <lee@kernel.org>
To: linux-renesas-soc@vger.kernel.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 devicetree@vger.kernel.org
In-Reply-To: <20251010094734.10487-2-wsa+renesas@sang-engineering.com>
References: <20251010094734.10487-2-wsa+renesas@sang-engineering.com>
Subject: Re: (subset) [PATCH v3] dt-bindings: mfd: Add Renesas R2A11302FT
 PMIC
Message-Id: <176122090273.2115353.8519326476219222297.b4-ty@kernel.org>
Date: Thu, 23 Oct 2025 13:01:42 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Fri, 10 Oct 2025 11:43:43 +0200, Wolfram Sang wrote:
> This PMIC is referenced in upstream DTs for the Renesas Lager and
> Koelsch boards. Sadly, there is no documentation available. This minimal
> binding description states the facts that we do know.
> 
> Fixes:
> arch/arm/boot/dts/renesas/r8a7790-lager.dtb: /soc/spi@e6e10000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
> arch/arm/boot/dts/renesas/r8a7791-koelsch.dtb: /soc/spi@e6e20000/pmic@0: failed to match any schema with compatible: ['renesas,r2a11302ft']
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: Add Renesas R2A11302FT PMIC
      commit: fa717fce4dabe7dc291b30e243cfc0b52576cee6

--
Lee Jones [李琼斯]


