Return-Path: <linux-renesas-soc+bounces-26232-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7219CECF7A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 01 Jan 2026 12:08:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F0AB3015D0A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jan 2026 11:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6363C2C0F90;
	Thu,  1 Jan 2026 11:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3LObSyW"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DE52522BA;
	Thu,  1 Jan 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767265694; cv=none; b=iqC0hsC1+OhlsCe8fjTRCW5+Es3CIW+kZf1rxdiosQf5l6KQtIXmTMH0+Zq4Cwrfbnlcl+jmGYwMHJdUUcxiLcKoE+dEGaO2ym65+DmAsK1LJkysPxh/sL8DGhs0ys9VDc4NRhEQLQ/OpNT589ceGDltNStQ7IE2RZ+hMm5gmF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767265694; c=relaxed/simple;
	bh=DIrTBlhGlKqjKq8gIq4zDuQ4NpbywDGZmvh+KkyVEfU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=tGm2ZGJ+5MBtj4C06lfeyB69QycB3LGTsmVOmdi3qUkomIq3493hM9eZPUhdNTvoYXG9izp2JPNU1sPwuUygxZU2pfWgn8DhsolBpC2Cg4FJ/1fcsmK+BiUQdKVvrdKGpsbDB217o6VCtVH1PS+AowUnaffBH3D7q0jJSnJISvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q3LObSyW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1E89C4CEF7;
	Thu,  1 Jan 2026 11:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767265693;
	bh=DIrTBlhGlKqjKq8gIq4zDuQ4NpbywDGZmvh+KkyVEfU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=q3LObSyWHSr037mtvgLnfAoTfburGkxndEFlc/RHBxsjb0MQU4XucRlMkTDtAdaGF
	 NKreWnxqlX2J9zFaAd1uXJ2xJZlwgmfaVu5edCrxW17geR2OT2IdMEP3SWKO5lBXgJ
	 gZsvwscgXHb4pkmbenTQOIvK3yUVBbYdA7XBPcNXpTroiG9fG/IjUVZ4pfE+I2gOkz
	 LAW/wqjzzpeIJYlOD1tzUJA+SsrLJltByy8w8URm5rsWgwcpV5w6mDffa8aNnIgvCJ
	 R7l6UZiN4eiS2wtDMjeMv69EHCkHvqmbrj9savB4ogjiShPJzmWHXExyfbIAwZEH/o
	 I/2p03piEik+g==
From: Vinod Koul <vkoul@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: yunbolyu@smu.edu.sg, kexinsun@smail.nju.edu.cn, ratnadiraw@smu.edu.sg, 
 xutong.ma@inria.fr, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, linux-phy@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251230141050.93856-1-Julia.Lawall@inria.fr>
References: <20251230141050.93856-1-Julia.Lawall@inria.fr>
Subject: Re: [PATCH] phy: renesas: phy-rcar-gen2: fix typo in function name
 reference
Message-Id: <176726569055.201416.10909096861421617891.b4-ty@kernel.org>
Date: Thu, 01 Jan 2026 16:38:10 +0530
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 30 Dec 2025 15:10:50 +0100, Julia Lawall wrote:
> Replace cmpxcgh by cmpxchg.
> 
> 

Applied, thanks!

[1/1] phy: renesas: phy-rcar-gen2: fix typo in function name reference
      commit: 5068c09db5c9ccd47f531bd3ff7f9fe50400fa13

Best regards,
-- 
~Vinod



