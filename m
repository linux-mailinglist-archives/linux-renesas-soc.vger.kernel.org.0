Return-Path: <linux-renesas-soc+bounces-26088-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5627DCDA264
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 18:44:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E8FB33034A3A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Dec 2025 17:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CEE63370F7;
	Tue, 23 Dec 2025 17:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XvspivJs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBDA3128A3;
	Tue, 23 Dec 2025 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766511868; cv=none; b=soINE1Y7JScciM98EdZHg+lFQ74PWeVB88gsT2Tvg/S759Yzn7ORga3PZpuZ8gLezOhtxzSBqhLvB9rxJHWMAwhBUBaR7vsrjaHqFFORb91v6xv8eIKogUG+4EDV/uhWBG9ByXVptIo2Mfa+OZSjODYAVdwRXDo97cZqFjZJTxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766511868; c=relaxed/simple;
	bh=P32gz1U3xDoCzfl2+VR66RJPFywlOedw+TA59vavrqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o3YEoMiWagw2VNUi5kB2Q9+O5JUoU3vW+HcACvZGpkkrqDcWxkRIZZmtDbFBpXe/eJ7D3jeWQOMb3eMSXW7elQBZ/yWXDy7msJ3Louzf7WbCTKbpaRAFwmDnMH1wvSdW9pm7TgtO64Y6FM66b1yaV0x5mJYS/KAIc1g73zZSU8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XvspivJs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6C6C116B1;
	Tue, 23 Dec 2025 17:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766511867;
	bh=P32gz1U3xDoCzfl2+VR66RJPFywlOedw+TA59vavrqM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XvspivJsIRocXPqGb1tBZQufWCeg6pDpMF8CV8Upoh0wFHwreL0GYwKxtIlAFtmbc
	 H68tM3n/PhozmfzM9EVbc0fAvtoxhb1+lngM7cxARGvGLsjaZf6mEUAfByr5/KN/ZK
	 awW3U3HrKocXqszeJbLyzExTQSZLDLz2pTvBzgQpYriAo5vfUFTA/rVvHi7HLY4ciX
	 vA+JM158xeAsFc1f9olYKEnxkKrNrj5NQFv3oq/Z3rHoQ72JRRCgB8Y8NqxWfgUNBN
	 P+KRByHoKFSah+mWKaXQtdUud/q2YTEgZWj3DnsXKe6enwpvZTExHZAPYK+Cp4qq9K
	 8Z91sEgR+BoGw==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251222161846.152952-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251222161846.152952-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2] dt-bindings: phy: renesas,rzg3e-usb3-phy: Add
 RZ/V2H(P) and RZ/V2N support
Message-Id: <176651186340.759340.4570439696222386912.b4-ty@kernel.org>
Date: Tue, 23 Dec 2025 23:14:23 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 22 Dec 2025 16:18:46 +0000, Prabhakar wrote:
> Add compatibles for the USB3.0 PHY used in the RZ/V2H(P) and RZ/V2N SoCs.
> These SoCs integrate the same USB3 PHY IP block as the RZ/G3E, so the
> RZ/G3E compatible is used as a fallback for both.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: renesas,rzg3e-usb3-phy: Add RZ/V2H(P) and RZ/V2N support
      commit: 8a203b0571d0a28e227dff7ab81e64cd7aa18e17

Best regards,
-- 
~Vinod



