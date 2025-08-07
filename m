Return-Path: <linux-renesas-soc+bounces-20106-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9685B1DE3A
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 22:25:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D5477B4736
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Aug 2025 20:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE71D239E64;
	Thu,  7 Aug 2025 20:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IOLqSjqH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A514723C51D;
	Thu,  7 Aug 2025 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754598113; cv=none; b=DrWIfRWU646JFF8cUVgLGwXewxiW2KrjSiLaa810g+y2QKNuQmkrrWHcA6RiWiPsqbR/MQ0tcNQUVVahgwkHzHzwXsAtW5wjxs1OjlCXeizwL44IfD5to3fmzyZAgHiLb/QjoKXSZ2Ih4XAfHrRF4IZqYZa9iRb2lKC3NDw+ANo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754598113; c=relaxed/simple;
	bh=I2rrN3Y0hd3DDIX5ZrPwcQ/5ZGpRZ9QYaIzsdOTkcb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVwrIeap8lIav02guvemtzDSt7i8vnd+bPe+4G8UYQV2GQL56AMCTsdEMlfiNnBK/S1+2NU8kPJZwga12BPDyQ3QzCVRfpTCfs/EVX6CrivHsBnz/5okw6qOIuaL5uJ56r/neEVESGqvtJBM8fSbnUcGhwNyTZ6DwJijbeK/DLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IOLqSjqH; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 15C8544369;
	Thu,  7 Aug 2025 20:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754598106;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fzalCYw2na9KY0FHYqIxf5tZkPW5UaHRqpyCgMjgDrw=;
	b=IOLqSjqHHqPAdp5okV+hl1oKaLuNgpO+acKT+QM81kpigrRHjMJQ6UR3b7D8+YbqcaflDt
	SVwYKdzWrF5U+Wan6+YShaU5nt/CiScFCtOc1eARVUbtZBjAuqJfwaMfIv7+vW/QWd82lL
	/FSSgSYw/HPQNQmLIpeAn5HoMf62pbSHVnrfgg927QGV08mWtHM/ettyIFAliwTq3eax2F
	wV2rbCz2dMDfMnr01CJ6aUALct3MEO4IoiKR/BY8kUzShR5QvywM953XwekjCEvx5lj7/+
	osIKx9fwxg3iYnfFINvVAx9harzSb7jbmU809D219yh/OoSGz3dss21be7fv0A==
Date: Thu, 7 Aug 2025 22:21:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>, Frank Li <Frank.Li@nxp.com>,
	Jorge Marques <jorge.marques@analog.com>,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH] i3c: remove 'const' from FIFO helpers
Message-ID: <2025080720214218750df5@mail.local>
References: <20250807043456.1624-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807043456.1624-2-wsa+renesas@sang-engineering.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduvddukeekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepieejfefhffekjeeuheevueevjedvleevjeetudffheeutdffudefjeduffeuvddtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepkedurddvvddtrdelfedrudegleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeekuddrvddvtddrleefrddugeelpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeejpdhrtghpthhtohepfihsrgdorhgvnhgvshgrshesshgrnhhgqdgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtohephfhrrghnkhdrnfhisehngihprdgtohhmpdhrtghpthhtohepjhhorhhgvgdrmhgrrhhquhgvshesrghnrghlohhgrdgtohhmpdhrtghpthhtoheplhhinhhugidqiheftgeslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 07/08/2025 06:31:24+0200, Wolfram Sang wrote:
> As buildbot reports, some architectures do not want const pointers.
> 
> Fixes: 733b439375b4 ("i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508070438.TZZA3f2S-lkp@intel.com/
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> I still wonder why SPARC discards the const but since nobody seems to be
> commenting on that, I guess the fastest way to get the build error out
> of Linus' tree is to adapt the usage in I3C.
> 

My plan was to let sparc people handle their mess, there is no reason
const should be discarded.

>  drivers/i3c/internals.h | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 0d857cc68cc5..2b0b9c3a9131 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -30,8 +30,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
>   * @buf: Pointer to the data bytes to write
>   * @nbytes: Number of bytes to write
>   */
> -static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
> -				   int nbytes)
> +static inline void i3c_writel_fifo(void __iomem *addr, void *buf, int nbytes)
>  {
>  	writesl(addr, buf, nbytes / 4);
>  	if (nbytes & 3) {
> @@ -48,8 +47,7 @@ static inline void i3c_writel_fifo(void __iomem *addr, const void *buf,
>   * @buf: Pointer to the buffer to store read bytes
>   * @nbytes: Number of bytes to read
>   */
> -static inline void i3c_readl_fifo(const void __iomem *addr, void *buf,
> -				  int nbytes)
> +static inline void i3c_readl_fifo(void __iomem *addr, void *buf, int nbytes)
>  {
>  	readsl(addr, buf, nbytes / 4);
>  	if (nbytes & 3) {
> -- 
> 2.47.2
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

