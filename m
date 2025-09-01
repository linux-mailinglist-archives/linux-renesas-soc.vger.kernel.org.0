Return-Path: <linux-renesas-soc+bounces-21131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1460FB3ED0D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 19:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 964A4188F500
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 17:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B04A32A815;
	Mon,  1 Sep 2025 17:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqzJr3/k"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A71324B2C;
	Mon,  1 Sep 2025 17:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756746493; cv=none; b=nrHvGujj/lRXS/UzNPjh2OYqA/rli2s4omi5AFvIdi/gMY7X6kAhDy+OZCuok99Scrc6JwR4kq0/EySSrBv4VktXHgzpk6+mjyWw3vDBMhwUGdiaqk4JQSIXIOM2vFogS45JdSE8nrjTS9Fy3MaS/ZU3K9Bu01S6enW4UQsurQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756746493; c=relaxed/simple;
	bh=Ja93BNF+w9Y+juSkpFLMtct5ihTyu7k3QSDMWQqxw+o=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DCe63FJ3RAcA4ent65ajqhbnDp7qKkqljrS0ZWWG4sg21lVS2CJitL5Ja3AauEN8Pi/dDOkaBJE86BWlrPNkbcDoMPwYodn1Zgwy4JHPD4uoNMY9N/drnL7bGSy2l2QuJ+PrCajmWx346MWVrAtXrabCrgOnZfyzG1tHSw5NBi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqzJr3/k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3B3C4AF09;
	Mon,  1 Sep 2025 17:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756746492;
	bh=Ja93BNF+w9Y+juSkpFLMtct5ihTyu7k3QSDMWQqxw+o=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=nqzJr3/kInRF4RAUv1LtECAn7lgX/SE7cXFYTn8hEw81z0y7CsnIczEVggZnPzrIg
	 37dciELZGe6Jo1Io/agHNcO+ZIsQqH7N2FBabD2rxBOlbP+/LtwIie0cYj+PD0RFXg
	 tjNgPwwiIITnzkTs8QcVWCdzLhW2Hg15Wk33FoXnY3a2ibPuhl7xnTWydblQ9zsrr0
	 hg0fk2RIHmQD+qrfs3m/SOsYy+UVzScTbbhjG2434+KRG1hE9entEFp9868HTey0Cs
	 DmAezIVP+DTrxT/HLiR8vNuIz3ov0xU267maYJL51Y2KvR1n3ISQjBqvKpJD4lNUK9
	 9CzOfX1aW4XNA==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Liao Yuanhong <liaoyuanhong@vivo.com>
In-Reply-To: <20250828122401.17441-1-liaoyuanhong@vivo.com>
References: <20250828122401.17441-1-liaoyuanhong@vivo.com>
Subject: Re: (subset) [PATCH 0/3] phy: Remove redundant ternary operators
Message-Id: <175674648843.186496.241265078555502799.b4-ty@kernel.org>
Date: Mon, 01 Sep 2025 22:38:08 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 28 Aug 2025 20:23:54 +0800, Liao Yuanhong wrote:
> For ternary operators in the form of "a ? true : false", if 'a' itself
> returns a boolean result, the ternary operator can be omitted. Remove
> redundant ternary operators to clean up the code.
> 
> Liao Yuanhong (3):
>   phy: hisilicon: Remove redundant ternary operators
>   phy: renesas: rcar-gen3-usb2: Remove redundant ternary operators
>   phy: rockchip: usbdp: Remove redundant ternary operators
> 
> [...]

Applied, thanks!

[1/3] phy: hisilicon: Remove redundant ternary operators
      commit: da938e39a81642748db3ec2385e8a53fe03d9bd1
[3/3] phy: rockchip: usbdp: Remove redundant ternary operators
      commit: 0c5375b06060fa40a8f8ce2e926bde125fdf6c3b

Best regards,
-- 
~Vinod



