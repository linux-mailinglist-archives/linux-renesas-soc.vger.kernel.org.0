Return-Path: <linux-renesas-soc+bounces-10515-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 111FA9C82B8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2024 06:43:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B469B1F2340A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Nov 2024 05:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DA91632FE;
	Thu, 14 Nov 2024 05:43:38 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECD813792B;
	Thu, 14 Nov 2024 05:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731563018; cv=none; b=qWHJSnFrwMN3aMfZqefvD35eqqmYyZ+puiTl1UKLzPUZTKhC+9IyIxg1Xup8XF1trxOQEDc8kWSJfLZvnq51jdDjSXt3XY39Ky+6AdLza4+yc7PLN188wCLhjbAtzNrejr9AY/BYvq/YvYc4hn3hlVGO1ipMsacNyxv0Sb6jmkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731563018; c=relaxed/simple;
	bh=a2lkZ9j+uMNMCTPC6Tte/JNlAXvP65iDwlzc/dyXrjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UTldIz8oeS3lIwu80Ahqe2fPSTD9k1tH7nr738KzjRUjyOV0xgOXWEsbahqysDt1HFEXear3uRLJRxVJ8ztcg2l/qps49MvmsKhg05ogN5huCg2aUngOxpoC/2w/jHa+H4yX0HuTT7A8WhRwQC8ptvVY/GCvPArHxcSm5r/nNt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 8DB1268C7B; Thu, 14 Nov 2024 06:43:31 +0100 (CET)
Date: Thu, 14 Nov 2024 06:43:31 +0100
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
	Rob Herring <robh@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dma-mapping: Save base/size instead of pointer to
 shared DMA pool
Message-ID: <20241114054331.GA10817@lst.de>
References: <f8cef6845a6141f0277e31a71fe153612daae776.1731436631.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8cef6845a6141f0277e31a71fe153612daae776.1731436631.git.geert+renesas@glider.be>
User-Agent: Mutt/1.5.17 (2007-11-01)

Thanks Geert,

I've applied the patch to the dma-mapping for-next tree.


