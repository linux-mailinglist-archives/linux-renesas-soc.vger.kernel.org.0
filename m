Return-Path: <linux-renesas-soc+bounces-26255-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4724CCEF403
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 02 Jan 2026 20:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D242230049CD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jan 2026 19:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF812D1303;
	Fri,  2 Jan 2026 19:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bDRSkhSj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C3F222599
	for <linux-renesas-soc@vger.kernel.org>; Fri,  2 Jan 2026 19:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767383900; cv=none; b=NMfpu2t3eILnEI+xAH/8Lp8AOLIdfNjfcpdQJRjZlKGBMalGYAPErW2mRoPCIeBgFuUaRLTpkwjTGOhTXoMT6erdnx77bzgI/j8lEqUCb5D/j8NCKfzx7Ke35SbcGLz+OpB05uFVUN+ZyueSh8jqAWA/W+0Jt30AVBlfhTtcfVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767383900; c=relaxed/simple;
	bh=Z9mML1bmJoiATvl+7IB3lTX4BlwKUn4UQJcP1Vpfsck=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=scpaJBcJLUQnOcRSIw16cFuevxF3dx8xEhhLALaKXK++Owa5+wj1Jzgx7sB2n0sX2xXvUZssx+j3F81ESWQBkUMBIvyJs4X2Gqd2pclIIrFAMa9579FsiHza/51eE3zz7zgNG9cms9K82HCpSaT0365G2U9YAstX6+AXFhMnrN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bDRSkhSj; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4djZHq0nK8z9tm4;
	Fri,  2 Jan 2026 20:58:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767383895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eUYu8XT3Nz/UFK8ip5o/E7e5B7G6lXEW26UvomGH+hU=;
	b=bDRSkhSjosmbnL+x5Zo08Qma2vvsC+HXqEfQTDV5v5GOJ8/PUV41eqs3lzjzjKyiw3YOwp
	q7tX2KhlJggbryx1JTyo9aa+p5zVpdwiHAtCRz8yjUIYRyGZzIOmrcf6u+/+lvcbDn2ZXF
	0s/UxZz+Tm4xpmXeAMIBh+1Iz4IPYwOVBqJVmeDNt7R1KOQjkDjWO+3zLKhuJq4N83r6Ta
	OUOFSNNCds+i/TdtGkAmW1LWAYW88NnqS6RtpBWnfgDVp7lj5M0vc0Q3UI4UMN7hhg1SG0
	rSES9/wgvNO0dwICFz5xdLikCvLj5SHrjgOQqR/K8MX579HdlG8EJPUuXM50EQ==
Message-ID: <aceda246-f4cf-4a3b-ba16-ff24fb17b06d@mailbox.org>
Date: Fri, 2 Jan 2026 20:58:12 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/imagination: Fix build on 32bit systems
To: dri-devel@lists.freedesktop.org, Matt Coster <matt.coster@imgtec.com>
Cc: David Airlie <airlied@gmail.com>, Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-renesas-soc@vger.kernel.org
References: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <20251106232413.465995-1-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: zcfcqb8bocmexte8gre9kc95fgsnucnc
X-MBO-RS-ID: d76068013051993f523

On 11/7/25 12:24 AM, Marek Vasut wrote:
> Fix support for build on 32bit systems. Include linux/io-64-nonatomic-hi-lo.h
> to provide non-atomic readq()/writeq()/ioread64()/iowrite64() accessors, and
> use __ffs64() instead of plain ffs() on 64bit number SZ_1T.
> 
> This allows this driver to bind on Renesas R-Car H2 which contains
> Rogue G6400 BVNC 1.39.4.1 .
Any news here ?

