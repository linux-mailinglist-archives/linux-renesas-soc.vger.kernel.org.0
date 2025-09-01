Return-Path: <linux-renesas-soc+bounces-21132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E628DB3ED21
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 19:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC5372C1131
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  1 Sep 2025 17:10:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C62D343D84;
	Mon,  1 Sep 2025 17:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFq9HdRO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426BF343D7E;
	Mon,  1 Sep 2025 17:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756746510; cv=none; b=o2S/0m7ZNTBEt8Bf1qAHleKmr4TgfxBxJyw7rOFayeRr8aTjyIPW/Jo347Bx/tU/XiArZhtVkvWhv2cPbSwtt473oTbKLDCUI5wNcQpE2WRERA0qXPCwRmG69YQ31gm6eryYLDfiBDpowe3lbBYnvyfXFT8tLOJ6m9adu1ZGGPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756746510; c=relaxed/simple;
	bh=zD2cqAHxzinu1xqZSy9fx1UkGEK00Mem1gE1dgsjZrs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Pdlhsp/+LinI6SpYIC9HitPn6F/PcwoPuDABnZ2Po2rIYrZM1WB0wZ/y1OPMpU2gieqmry0wcb+ozGT+88BdatpdziLYTDunUmOlEL66BU07iWA1+3qJ77hv50Wjo6I035fJG8ACPH0YzxGGXUHHVC5soPPINowZFqjtwYPSe0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFq9HdRO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252AFC4CEF0;
	Mon,  1 Sep 2025 17:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756746509;
	bh=zD2cqAHxzinu1xqZSy9fx1UkGEK00Mem1gE1dgsjZrs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YFq9HdROE7xurb3UnkwvAxcAkCzWDFW+THL1nvdjEUpikcG2YwGU8qMcoJwcqoaay
	 MUrgdpYvbDtzXtvWsnfzJvoIOY/RtOxXjh9tjnYyHxTAAcEUsVDiAf+k1pxirp/2ta
	 MCmKmPodJMBOAB4kCuj2cDsYjI4CzQxP0zO+04Wri7nOVd0zoaIBydITiyXWjwYNpq
	 xZR6tBta41plEbUU8laQqU31JYOmmyueUR5JHoJZ69qBbiPU50gAdNDkU1YDyRp18s
	 12W+4X/B7BXVu3h1sqzjiQw+V+KTs7OzKx0Ft5XhaNo8skZ0DPWyqkeXutJPF3EBj1
	 W6iJkpDZtcYPQ==
From: Vinod Koul <vkoul@kernel.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250821155957.1088337-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250821155957.1088337-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] phy: renesas: rcar-gen3-usb2: Fix ID check logic with
 VBUS valid
Message-Id: <175674650567.186496.17960330116402166478.b4-ty@kernel.org>
Date: Mon, 01 Sep 2025 22:38:25 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 21 Aug 2025 16:59:57 +0100, Prabhakar wrote:
> The existing ID detection logic returned false when both IDDIG and
> VBUSVALID were set, which caused incorrect role determination in some
> cases. The condition:
> 
>     !(device && !vbus_valid)
> 
> did not properly reflect the intended relationship between IDDIG and
> VBUSVALID signals.
> 
> [...]

Applied, thanks!

[1/1] phy: renesas: rcar-gen3-usb2: Fix ID check logic with VBUS valid
      commit: 356590cd61cf89e2420d5628e35b6e73c6b6a770

Best regards,
-- 
~Vinod



