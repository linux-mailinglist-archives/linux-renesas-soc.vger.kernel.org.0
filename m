Return-Path: <linux-renesas-soc+bounces-26899-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD58D29BCD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 02:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D3663002D38
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Jan 2026 01:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BAD26AA93;
	Fri, 16 Jan 2026 01:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aof5HGd7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1162F692C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Jan 2026 01:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768528233; cv=none; b=rYUvSVTHwBO7cOuP/AS1bEEQXYu1FbDOqItWrESnJoeaGMBUZ3cdqne++l4TDbh/4JvqBG+VRXDFs438UXq+LJq0Gjw0whLbPtbFV7I+G13bPqZ1uwwUxwyyy3y4NybkKwT5o2+xiY+LoUmBTv1c6Jd9aiLyyYsW+eXdEyY2xcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768528233; c=relaxed/simple;
	bh=wTJkF1ObFmb6vTCmdOsPYMsKK6ryfl9IIoIdiRKDHew=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ibw6+vlXe5HP7bxR4zfnrX1kZOEdO9weXt2zQ3c1Rak1K9V8KIUBZ6Dq6wCDUXoz0f7gbA5eTVmJ1l1eJsDtOIWSaD/8GKmTKgToCEXvG/qHdJdNWeeKxA744yNLvPPmwwxvUPOLVZVjwPaMjEkpxn95FLYcYqrGp+oTtO1LwSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aof5HGd7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E6BC116D0;
	Fri, 16 Jan 2026 01:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768528232;
	bh=wTJkF1ObFmb6vTCmdOsPYMsKK6ryfl9IIoIdiRKDHew=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Aof5HGd7eeeGhg0d9X58wUsnwOofyQFyqnZdvr/0ivyMJMdnv3LHyIFsrtfleUmtz
	 P8WwY0qLKaSHYY3tzqWiWiwSB3FiJdhcN8BrJ9LEVp6UgAmxU1gRShrQotEoPOfVZP
	 uc3aH2/wlzmkAHksHMtNs1OIdoczMvfxs4EQVBUwMu/xzHAXGfXTjSCMDBmxI7tkQB
	 fG+hPd5ULmNSo9eLQJ0QRkRh/2wF0faW53xbTNUMUMqfTrx6REgCpPcIHWM172Te6B
	 uuuVHvuSxIF51r9HfI3yPEsursM7aL53XSo0FC/Ob+KequEJCZ6smxzJ0CkPc/xcD9
	 N8cuum6Ls+fjQ==
Date: Thu, 15 Jan 2026 18:50:30 -0700 (MST)
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
Subject: Re: [PATCH 1/2] riscv: ERRATA_STARFIVE_JH7100: Fix missing dependency
 on new CONFIG_CACHEMAINT_FOR_DMA
In-Reply-To: <20251210160047.201379-2-Jonathan.Cameron@huawei.com>
Message-ID: <7b2ce9e7-7261-690c-c5db-f4c70389bd22@kernel.org>
References: <20251210160047.201379-1-Jonathan.Cameron@huawei.com> <20251210160047.201379-2-Jonathan.Cameron@huawei.com>
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
> Closes: https://lore.kernel.org/oe-kbuild-all/202512100509.g6llkMMr-lkp@intel.com/
> Signed-off-by: Jonathan Cameron <jonathan.cameron@huawei.com>

Thanks, queued for v6.19-rc.


- Paul

