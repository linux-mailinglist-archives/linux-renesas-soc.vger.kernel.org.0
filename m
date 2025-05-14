Return-Path: <linux-renesas-soc+bounces-17095-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1584AB6A46
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 13:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F62B3B19E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 11:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8623C27E7FC;
	Wed, 14 May 2025 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uuclqcQI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2ED27603F;
	Wed, 14 May 2025 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222674; cv=none; b=dINNbL1egBycAB9qduhDLxJUm6swQUu0nMhGC4jNpp11SLPV8cD9yV7M/NL9m03HWn+bdEOGuVXbXtnSaeeLz8JEy7kO3xcGp2NthVubgLdyeNFkTE8Rb5X1Sp6eW19E/ySICoFwmBJv7B+HY40LxR9wqir1cs1acuN1e4gV1+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222674; c=relaxed/simple;
	bh=R/MbuxF9Q/H1tecmqJbiAyPjtoLODQkOyXszcxLXrMI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kfTSFN8ypH1FKB9i6bkyjsF9F/vZL0zaxmEWDgsIpuTpaoYAext71iRR/2E/EUil+J93XjgS99fpJQXsTWyKih5Q/twOkpcdUXUFvHJVSS/1XvDJvJfFejbWqbIbuE1SayXFOYGt6yJEX6pGnNXP+cxcwVHFajFnPTJS1prETik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uuclqcQI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4A39C4CEEB;
	Wed, 14 May 2025 11:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222673;
	bh=R/MbuxF9Q/H1tecmqJbiAyPjtoLODQkOyXszcxLXrMI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=uuclqcQIK1zA30nOKIaH/32sXQpqaGqEy/3n3KbGds0vfhZSwAyr7BXjqLd4A2KS9
	 g3UVFK/jiWspQWpPxB62OJYHGseA03C2VLPrQ4KM9zfQfIRHhiQvx5a15Dtz+8KNdA
	 tDUdMwMGjIxOfkMBu1pIVI7ygZh4EYSIcSppHgBL2FA4x1yIfwDDE7MxRkhSwund00
	 Uko5gtKVlvq5Q5Z1JwbYnhgQK3GOUAQjLXDblDQNdwICHR0GU3B4NsuVjQh1p38W+1
	 vFjOhyND5mNWf/R7rgr/GVCogdnMCzxMMpwgZjtVz3PD+25TdVCmhrK4r7ZlPhaKns
	 l6ADPQA3F7FgQ==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250414145729.343133-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH 0/4] Add USB2.0 PHY support for RZ/V2H(P) SoC
Message-Id: <174722267052.85510.5832087290882468385.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:50 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 14 Apr 2025 15:57:25 +0100, Prabhakar wrote:
> This patch series introduces support for the USB2.0 PHY on the
> Renesas RZ/V2H(P) SoC. It includes updates to the device tree
> bindings and driver implementation.
> 
> Best regards,
> Prabhakar
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: renesas,usb2-phy: Add clock constraint for RZ/G2L family
      commit: 31eebeef8cdd4c9bddc9d34053cab6553616d0b7
[2/4] dt-bindings: phy: renesas,usb2-phy: Document RZ/V2H(P) SoC
      commit: 9c4fbefc962dd13694b4a5051f432ed435c92220
[3/4] phy: renesas: phy-rcar-gen3-usb2: Sort compatible entries by SoC part number
      commit: 9414ceb38a74470249dee69784d6079daa452c3a
[4/4] phy: renesas: phy-rcar-gen3-usb2: Add USB2.0 PHY support for RZ/V2H(P)
      commit: 3767474d7497a4d03f58118d02b742b903626d03

Best regards,
-- 
~Vinod



