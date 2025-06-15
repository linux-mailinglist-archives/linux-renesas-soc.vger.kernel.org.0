Return-Path: <linux-renesas-soc+bounces-18342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 90034ADA2B8
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Jun 2025 18:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 091A47A74F6
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Jun 2025 16:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041F227C167;
	Sun, 15 Jun 2025 16:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kUy74Sp5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF39727C16A;
	Sun, 15 Jun 2025 16:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006373; cv=none; b=o5bAqFO9OKNmDBZtnrf2WfDXmXjnVbSbMZD62eiZ4kYspsnt4YZfNzmiGfBcAsomaBfxINSUymQuUrDbO61reb2ZyRFocu677JqK39ZA3HeM0s9OGmqqT/bPKomPaGmvxgCa5SJyBZSIwyUn6vaLnK48LGHuS3MHMMQxE4kTnNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006373; c=relaxed/simple;
	bh=TqLr/OCBktBZQpeIStq66n7a03Pl9cTeFHgLsL3jA5Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=uKZYhGUQYXklCWq95cHC6ZCHVp3/wkBNedBEVvj097u2U9XNRM8A2i0ow1YVMxSrad/RP/pie3PvZf6miVOcBo92QvkNSx6UqFYvbVfj1sAjfZiZq0aYl7r2MXKUB/KUW2zOnXumHQ6NG6qgZJ+LERCP2tEfQ6nQVF7IFkTQn2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kUy74Sp5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10DD8C4CEE3;
	Sun, 15 Jun 2025 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006373;
	bh=TqLr/OCBktBZQpeIStq66n7a03Pl9cTeFHgLsL3jA5Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kUy74Sp5/YdI9tbwp3MmfXvHsGNeh91SLmRJp+dX5BoAZggUkRJriagL1FJe6s7G7
	 Mpo4gho07NrQfQvNOp0tFHFwUG+JR76cKnjI4dnzn5j14BU5MNyvS52b9WT+JWSwT9
	 6Johrp3AyysxuWhtfCeX1hCG01y9XkjF2JIPij+tC8rWfckKoylyPfj0NGM251yMgw
	 HAeOrF/3KgT/sC3uJ7oGfWirhNRqoj9gkg7W85lL0LvtaHI3ae2nrpdbPYlc2YUf0A
	 lQUKmrspkUn7iDeIT33F41YG3CGKSwvEZyum6NsBXKvDbc3LjxXyu2Vx0NUY/o8ImK
	 xAURId6iywE1Q==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250528133858.168582-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250528133858.168582-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: phy: renesas,usb2-phy: Document RZ/V2N
 SoC support
Message-Id: <175000636867.1180927.12382475104046951897.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:22:48 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 28 May 2025 14:38:58 +0100, Prabhakar wrote:
> Document support for the USB2.0 phy found on the Renesas RZ/V2N
> (R9A09G056) SoC. The USB2.0 phy is functionally identical to that on the
> RZ/V2H(P) SoC, so no driver changes are needed. The existing
> `renesas,usb2-phy-r9a09g057` compatible will be used as a fallback
> for the RZ/V2N SoC.
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: renesas,usb2-phy: Document RZ/V2N SoC support
      commit: 00399bbe02d2bb6fd8d6eb90573ec305616449f4

Best regards,
-- 
~Vinod



