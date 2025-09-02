Return-Path: <linux-renesas-soc+bounces-21160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2A0B3FB40
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 11:52:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 657411B23BBA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 09:52:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75C252F5322;
	Tue,  2 Sep 2025 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNxoblO5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF2E2EDD75;
	Tue,  2 Sep 2025 09:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756806618; cv=none; b=sgD07QZkId2ZD674kP1lQnxVLsBJluDODNhRMpqgqOLCCqcpTXs9l6eq9NGhXWuhRR3wGtuAZws/mCzMck/MBrlFxZvFbDIDeTnXoXA//LOcJk9gT0DwXdInr7XBXTrdYYxTSR0a+lsMG9vhykfCZeDJZW7CLtVTHgpQIQvqatc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756806618; c=relaxed/simple;
	bh=ezKvsUrfP+7bg4ys751Ino9ZSoBxTPU7y+g2rK+k9u0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X2qe/yKs4mnwt14WdPeVR5W90mNI4nB5dMjjHV+YGqBigNzDfpSaos07J2mmHg9kcquZsMzq1+84frhOZoec1xN/hn3RcuzdBpTUne8S2f4IxjdmNsvSNr+4h1+TeZviWjgw4t3tP9F+ngGc8/8FZThOltoOyJbZXQcsCtYG5Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNxoblO5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132EAC4CEF7;
	Tue,  2 Sep 2025 09:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756806616;
	bh=ezKvsUrfP+7bg4ys751Ino9ZSoBxTPU7y+g2rK+k9u0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KNxoblO5Sx/ehSK0U2W9GiqHuVOzhJSb7kD3vaI70GyGceuKbG+KvE6ruqCgFklMw
	 8zZyf1nfyYFw5LmN56iceCDpfS8d4Y67IG4IbTucGwV8MARhd0o1XIbZItCjhuaHi2
	 OlgirLVDV8xX5UODlNDbwRuzgw66YoN0Da056zvV8wH1kISVDt9jAlbwYxXc1AhClo
	 lgGkAi/2+IUGfiHn/mgKtIy7YaXUYDuweeBbwkmUb2efseyOgL1OfdY0yxUE00OMiO
	 9XfPoyCDzoZ+8Bt4PmZcZKz5IjQW2LxFc9RErKY07NhfJA9pUao0U1+fnVtii/uHn2
	 CziRlVHmKITAA==
From: Vinod Koul <vkoul@kernel.org>
To: tomm.merciai@gmail.com, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
 prabhakar.mahadev-lad.rj@bp.renesas.com, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250801084825.471011-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250801084825.471011-1-tommaso.merciai.xr@bp.renesas.com>
Subject: Re: (subset) [PATCH 0/3] Add DMAC support to the RZ/G3E
Message-Id: <175680661258.246694.16970472340052106378.b4-ty@kernel.org>
Date: Tue, 02 Sep 2025 15:20:12 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 01 Aug 2025 10:48:20 +0200, Tommaso Merciai wrote:
> This series adds DMAC support to the Renesas RZ/G3E SoC.
> 
> Thanks & Regards,
> Tommaso
> 
> Tommaso Merciai (3):
>   clk: renesas: r9a09g047: Add entries for the DMACs
>   dt-bindings: dma: rz-dmac: Document RZ/G3E family of SoCs
>   arm64: dts: renesas: r9a09g047: Add DMAC nodes
> 
> [...]

Applied, thanks!

[2/3] dt-bindings: dma: rz-dmac: Document RZ/G3E family of SoCs
      commit: cc0bacac6de7763a038550cf43cb94634d8be9cd

Best regards,
-- 
~Vinod



