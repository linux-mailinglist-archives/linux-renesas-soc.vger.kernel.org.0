Return-Path: <linux-renesas-soc+bounces-26900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C02D8D29BD6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 02:50:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66C9B302AE29
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 01:50:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0042532A3D9;
	Fri, 16 Jan 2026 01:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tejgTdCh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8C2328B7C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 01:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768528244; cv=none; b=qvJvD2lZFwFrTOOdq0Yw1O947jjfiMyjtCjJNXX1S0BOxn+FpnH/2tgHj1qm0VfOdQ2Fiki8TETaXaNbziWzDLDYqah6tGLB2HUZNt9QxXaZ41Lz54swM+GXQ6aBaVH7TolSCnD2LFKpA1mhm9K6Xz+IrZttozSqjSivskgaELg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768528244; c=relaxed/simple;
	bh=dDnw5mOhk7/iI/4fF28OGLUQnKTw2aqseKu2VwtAmf4=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=uCRbI9qGmMSzy48jmIWbtYTgdqE1bcoI/I8ZAiSo1qFnq/XDgK+hpphKMsqGz5Bub+Gfma5jdOINpqGs0DKo7Y4FtXh2775mBeD07VEhd9p9EbGWwZ5DIlhwHN3R7fqLw4xZJQiI4XFm2Erq+mohX4+nLJRf74w2zWkA8LXKreE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tejgTdCh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D6D1C116D0;
	Fri, 16 Jan 2026 01:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768528244;
	bh=dDnw5mOhk7/iI/4fF28OGLUQnKTw2aqseKu2VwtAmf4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tejgTdChU+gn6ddXoU+/haWRLI/yeA4IEJyMrjXzqE16xCSrOr1bzYpn8gd1AJQ9z
	 0wEUKU9WpzRHzj36LRI5Wvmo9q1pw882B9iNwa5/rSjTefZheDivVBFDiFzhsCdcUX
	 dfwVDJwJI0cnwY2/i2gySVgr0kLlS6ITNPGNbH+6H/E+x1DOjJVTBsQrkyiX6ei7GM
	 fGSyciDd/Qbj++eXS4paEjA2NxrXDTcLkND4MPIuhwup1+CIVyl+cxOf2jVAVAy/xg
	 jnuB1epdRDcpSgQSnn/6KhG1iXtV9bq1nCDqOjajvJNE5pEzjuHpP+m5T12GSk40zD
	 JG8WRAnkXMU6Q==
Date: Thu, 15 Jan 2026 18:50:42 -0700 (MST)
From: Paul Walmsley <pjw@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
cc: Conor Dooley <conor.dooley@microchip.com>, 
    Geert Uytterhoeven <geert+renesas@glider.be>, 
    Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
    Paul Gazzillo <paul@pgazz.com>, 
    Necip Fazil Yildiran <fazilyildiran@gmail.com>, 
    linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linuxarm@huawei.com, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/2] soc: renesas: Fix missing dependency on new
 CONFIG_CACHEMAINT_FOR_DMA
In-Reply-To: <20251210160047.201379-3-Jonathan.Cameron@huawei.com>
Message-ID: <a5df4517-40af-2406-8a18-cd8da18aafdd@kernel.org>
References: <20251210160047.201379-1-Jonathan.Cameron@huawei.com> <20251210160047.201379-3-Jonathan.Cameron@huawei.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 10 Dec 2025, Jonathan Cameron wrote:

> The Kconfig menu entry was converted to a menuconfig to allow it to be
> hidden for !CONFIG_RISCV. The drivers under this new option were selected
> by some other Kconfig symbols and so an extra select CACHEMAINT_FOR_DMA is
> needed.
> 
> Fixes: 4d1608d0ab33 ("cache: Make top level Kconfig menu a boolean dependent on RISCV")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512100411.WxJU2No9-lkp@intel.com/
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Thanks, queued for v6.19-rc.


- Paul

