Return-Path: <linux-renesas-soc+bounces-19575-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BC7B08C6A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 14:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8B49A47529
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Jul 2025 12:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA42829DB76;
	Thu, 17 Jul 2025 12:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MCzVgkqn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8741C29B77B
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Jul 2025 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752753887; cv=none; b=Y5bpife3bVnCzU9tMh5W5b41lH4irYzvONpVmoPy2zwMOp2guQG+H7CDNvMF/lA1lMWXBxsKAFDSjwwBhGaZqPxFtceMCJu8MyjwGnyUQFUw9eUGgWgd6y5Afi267zpAaNnTOO68oRw44pA4pVBFD3A1WXM9TxGBRvdiHNsna/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752753887; c=relaxed/simple;
	bh=M6Ya16CMFbVI6tcFbaGSamvGuZTDOfrELjEnXLbNK0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sk4e/x8iR1gR0c8GYUNQOq0N8orfRhuV0APy+aemMzpVbNUCqhodTE0LvKf1+MA6tvsaD73BvAUbuPN8ry6dSwDS7rNrcWYHTrcSWkW08rXXbQkTihYElcmnLuz5fWHSc0B03QPxx8xs9aNfJ1r0srriLoE+Kz5/Zg1/xj1gxHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MCzVgkqn; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=HL0V
	WTAht8AVy4zqain08zkh4A2mMxT0R9SsJPX1Hl0=; b=MCzVgkqnJqo5893x/yj9
	FvBv65ra2ykSCN8eTFbvwwt2+himuFy4BGELoaE40P7c35EPyZfOOcVr092JM1DS
	htX97mIXCei0NertlUBEfObwcUqEOKd4QMAJTtmiExunsgz9SyV7gaWSHB3wIsRs
	INyTa1LyeVNzdgUkEfgufddWMJStpV7hINVz+bOUSVF5gqt/7ulHeyXfT65Oq8nt
	XgMoCEFsrFtyTgs+2QzqVdGRUhPNeuxZR37oa3LN0JP6pzfu5Fdg6PNC/z9FFS/y
	oyBIGq9o3xXqWSDIDciIS/XwEGCVfLJfCnp9ueVL3Z1F/MQJG92heFT2nKSWftT4
	bQ==
Received: (qmail 3665366 invoked from network); 17 Jul 2025 14:04:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Jul 2025 14:04:39 +0200
X-UD-Smtp-Session: l3s3148p1@aSlU0B46UpMgAwDPXx+vAAkEB0lWxGP4
Date: Thu, 17 Jul 2025 14:04:38 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: add missing include to internal header
Message-ID: <aHjm1tjpBk4h3SSp@shikoro>
References: <20250717120046.9022-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717120046.9022-2-wsa+renesas@sang-engineering.com>

On Thu, Jul 17, 2025 at 02:00:47PM +0200, Wolfram Sang wrote:
> LKP found a random config which failed to build because IO accessors
> were not defined:
> 
>    In file included from drivers/i3c/master.c:21:
>    drivers/i3c/internals.h: In function 'i3c_writel_fifo':
> >> drivers/i3c/internals.h:35:9: error: implicit declaration of function 'writesl' [-Werror=implicit-function-declaration]
> 
> Add the proper header to where the IO accessors are used.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202507150208.BZDzzJ5E-lkp@intel.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Fixes: b7371ff9bdf7 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()")


