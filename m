Return-Path: <linux-renesas-soc+bounces-26231-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6A2CECF74
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 12:08:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A4BDC3013EE4
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 11:08:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34252C21ED;
	Thu,  1 Jan 2026 11:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ep4xzSqC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2DF2C21EF;
	Thu,  1 Jan 2026 11:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767265685; cv=none; b=H9vOvErquZqjDn6lmlgsovfItdqRCsp38FqBy6MPuZFZ1gQohjrXyVEXKhJwkuHridJSS5TMlSbu56R9O9srM5ccTbK5RBVZ1JQ4HWcX5tyJb+GWOiv4h9y42oOF8/WYcicVFmMZboUyoPRhp6LGGQiFVw+Ma5HoYcAEg3AKBpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767265685; c=relaxed/simple;
	bh=GlFzX75qSvx1N4AvF+Y7taDoArcf3LPSROcsNlz5isE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OHR8iSL42JwCmU21W0IOu4DCJqI2F+K06WpYzINNSei5osu9FZpbha4Rgi4Jd5QnprB0UHyV1/1U7gGAKglevOeMMmjOChMqWHRkZMEEW+6oT4DYQ8POYXADgEhTikwq+lkR1BA4GJXmQ6bfHgbmAeesoBPUIw0bLLvp7yYZNkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ep4xzSqC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5927C116B1;
	Thu,  1 Jan 2026 11:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265685;
	bh=GlFzX75qSvx1N4AvF+Y7taDoArcf3LPSROcsNlz5isE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Ep4xzSqCIjEayf8R7q38QQq3rX9Qmgkzx9H7vHADJfITHMCycnOMIL5JvgVmRW8HL
	 hFf9oEoq6Y3hhMjkOXlVMyNaNjH+1v5u3Nv+ZnIgT5wD9WU0xRaDo5sNJOwM8v5f9L
	 xSrPA3h/kB6JVftdsR+7FGPWNXXxFsH6uNyPb9loZr94+Fi2ObtLrYNiPIUGdvGK8A
	 krgilWYnp9qWJx7iILrDa/evBCLn9k2jp52Og02jTFLZApONfyOWViZLtnHznFcg3j
	 I+Q3OrqcyZ3fNU4Btk9w2C3ZfpbDkp15yM8ObVAzAn2jOiF8tPGSouvWj/Q5WrOBy2
	 KHQY4Ip5YXWfA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <3ca9f8166d21685bfbf97535da30172f74822130.1767107014.git.geert+renesas@glider.be>
References: <3ca9f8166d21685bfbf97535da30172f74822130.1767107014.git.geert+renesas@glider.be>
Subject: Re: [PATCH] phy: core: Reinstate pm_runtime_enabled() check in
 phy_pm_runtime_put()
Message-Id: <176726568337.201416.2895663594412389018.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:38:03 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 30 Dec 2025 16:04:05 +0100, Geert Uytterhoeven wrote:
> On Koelsch (R-Car M2-W), during boot and s2ram:
> 
>     phy phy-e6590100.usb-phy-controller.0: Runtime PM usage count underflow!
> 
> While phy_pm_runtime_get{,_sync}() and phy_pm_runtime_put_sync() still
> contain pm_runtime_enabled() checks, the same check in
> phy_pm_runtime_put() was deemed redundant and removed, causing count
> underflows with PHY drivers like drivers/phy/renesas/phy-rcar-gen2.c
> that do not use Runtime PM yet,
> 
> [...]

Applied, thanks!

[1/1] phy: core: Reinstate pm_runtime_enabled() check in phy_pm_runtime_put()
      commit: 0287c960b15f27498d85cadf584bb59301ea2382

Best regards,
-- 
~Vinod



