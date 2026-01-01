Return-Path: <linux-renesas-soc+bounces-26233-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEED2CECF8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 12:09:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB9B83010980
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 11:08:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CB92C2353;
	Thu,  1 Jan 2026 11:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GWOsDNdx"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCA42C21C4;
	Thu,  1 Jan 2026 11:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767265701; cv=none; b=MWU+e5l5fPYZ2kpqFoM//zWTn3Y5S950wKRz/Ia8tgLB8ZnFVrxxzpkj7/s6HSupfiLJdxW2+bxNwriWLXnKYKasMi8DkLmcgjx/NMjqCxCjZ6FGlEhZRF0r4iTOXkouifmcrGwwndSqXOqAECAj8Oiki4t3Qxt6Vqvz7n/dGpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767265701; c=relaxed/simple;
	bh=oDX9OY3aMzQan91I3g8b+LhbDuDdQqiBxOgdnT9r130=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=myb1rr2UwX0KmbDbA1RVRPlzM2BSWdGmVBY7xPtSMcD2qtD3fysObHpK8C4Rcgalrn4mgLubVay0vCWQEXpVrqzPrxGu2BEVvpaR8C1C3fZuGSNIGKBCXiB+vhmGFtLu3uX7GLficVie5xnxLqTnrm0Pvmi8POlJhl4jvnEPyeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GWOsDNdx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15080C116B1;
	Thu,  1 Jan 2026 11:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265700;
	bh=oDX9OY3aMzQan91I3g8b+LhbDuDdQqiBxOgdnT9r130=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=GWOsDNdxz2NIQGByn4jsxvXUao/5a52yd5gNMaHfXOQOT+5kLGTdiz06Bwam00uD+
	 0IgLgGTTAQotzc4Ud2nlMG1GWtdZHPRYYhtsmOO6maQWHSrse6MxT65rcbhQG8C32g
	 8vdae/OMGHzZWPgw45+d1Mpref8xc3SU5HQoFnAnsgJTbhQpDHUQ6NjxCGnHbQXdf4
	 zm51WKVJ4Pim0i5+Io3w2ni+p0iISEhDwgKG0IZ0u2SvH5pj/mJ0ajmkAJIN9v90rO
	 EJ5SFt7OZYCTepC+ZOolQFfo4qCRXpVlxFkk8I1Q5jNu1iyWVXEiKoB12L2tqWPimN
	 qyYhaskoXB53Q==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224124407.208354-4-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] phy: rockchip: usb: Simplify with scoped for each
 OF child loop
Message-Id: <176726569771.201416.11757049759201403821.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:38:17 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 24 Dec 2025 13:44:08 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/3] phy: rockchip: usb: Simplify with scoped for each OF child loop
      commit: 943dbe1470529d7191dccdb56ee0bff83d3606c5
[2/3] phy: core: Simplify with scoped for each OF child loop
      commit: 175b46f31fe60d7772fae19f731f282327cb333f
[3/3] phy: renesas: rcar-gen2: Simplify with scoped for each OF child loop
      commit: b64b32791fb557f922beebddf74c47baf338cef0

Best regards,
-- 
~Vinod



