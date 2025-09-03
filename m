Return-Path: <linux-renesas-soc+bounces-21230-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A63EFB41418
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 07:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E4E01B271FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Sep 2025 05:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48CB42D0C9C;
	Wed,  3 Sep 2025 05:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="TFWlqiIu"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDCC32F775;
	Wed,  3 Sep 2025 05:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756875916; cv=none; b=dzn7zqKzswIDMl+ON1JfZIOvgwjh600mnAD5NI+C7ENVP7zMcPNbe4tUwJp5ZUBT+cPeW+77zyTvpXThtohNQb49QPqBV2dKgiWh9HhudHqcegId9dCM/nniVRLPy0rcsqMYSEWSGS2cuxh5T379M5hlganexX3oVDdvdanxXQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756875916; c=relaxed/simple;
	bh=z/aNFcuI5ER/zUmHNbZkEITb8B+mXfHQs+aVMjxDIgQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KW40dAdHeaS8ythcgwziX5RtdSpj5E4DIvA4CxR5mTndV+4XjMujtyy0W0BuH2rNl9fxJ5NjhhwUghsZMb4so+636PC1xIpL1RjTY7uHaPDnhPywGvGgN4F3Dysqy19/m2/r+501DCgJhLF0EodFV3ag46XrL3d1ESyho/g8HsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=TFWlqiIu; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756875911;
	bh=z/aNFcuI5ER/zUmHNbZkEITb8B+mXfHQs+aVMjxDIgQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TFWlqiIuq/EgRqWg5UZI7aD6HRJWbNSWozu+PymRFHSv2k6UeOld6m0jYPcxjava0
	 Vugz8yzOCBq02zTe/CBiKirpQyvEce/jcBYOO24thW8g/Dly1TIVEUXM2RqY6JHy0y
	 EKKRfbTP67sSiWeSptiKYQFGu7qTMz1ve1+9LKY4lnx0K4HjcPG+c24cRag9nM9FBC
	 g4djJ97GqjQm3aYAFwVlN42Owr329lTtiWBGHQXg9dJDoXHmfyo4+SwbxR07FLtbjf
	 g2guGt2m4+Rg7dpn+eFMvcpn98t3W6Ki/oo39zxVt0+LCFmVZhAqecTXmacPRl31Vt
	 k9fwlk2bwV7Ew==
Received: from [192.168.68.113] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 45A266E02C;
	Wed,  3 Sep 2025 13:05:03 +0800 (AWST)
Message-ID: <9e3d52078b0ad9da6015229d6f39cb013a4cffbd.camel@codeconstruct.com.au>
Subject: Re: [PATCH v11 0/3] ARM: dts: Add support for Meta Clemente BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Leo Wang <leo.jt.wang@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,  "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus
 Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	leo.jt.wang@fii-foxconn.com, george.kw.lee@fii-foxconn.com, 
	bruce.jy.hung@fii-foxconn.com, Conor Dooley <conor.dooley@microchip.com>
Date: Wed, 03 Sep 2025 14:35:02 +0930
In-Reply-To: <20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
References: 
	<20250813-add-support-for-meta-clemente-bmc-v11-0-8970d41f88b0@fii-foxconn.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Leo,

On Wed, 2025-08-13 at 18:04 +0800, Leo Wang wrote:
> This series adds initial support for the Meta Clemente BMC based on
> the
> ASPEED AST2600 SoC.
>=20
> Patch 1 documents the compatible string.
> Patch 2 Add pinctrl nodes for NCSI3 and NCSI4.
> Patch 3 adds the device tree for the board.
>=20
> Signed-off-by: Leo Wang <leo.jt.wang@gmail.com>
> ---
> Changes in v11:
> - Rebased on bmc/aspeed/dt as requested.
> - Link to v10:
> https://lore.kernel.org/r/20250801-add-support-for-meta-clemente-bmc-v10-=
0-c1c27082583d@fii-foxconn.com

I've applied v11, after tidying up some whitespace and the subject of
patch 2/3.

Thanks,

Andrew

