Return-Path: <linux-renesas-soc+bounces-3025-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD48485D00C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 06:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 92A271C20E33
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Feb 2024 05:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0165439FFE;
	Wed, 21 Feb 2024 05:44:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C210238FB0;
	Wed, 21 Feb 2024 05:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708494275; cv=none; b=ZD4zBiL8xmdWw5RIC3URfqPtJmjGkD59X8uU+30ASb4d0Y7NcavWGZAGgV5yOBQTCM1L0RYDMWudBaXk47IvKOrkkLPoPirB1q9TTROwZva945R/XTkK/YXH/xKSYC13QDL9x8MjNEhup0Ceu/pihgG3NjQdApKhGyYLj5Kzs40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708494275; c=relaxed/simple;
	bh=vWdAxpAefZa8/oWIvIAjkimATzuMQ8IAnCIrFXs/XK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fxZsGyDPHCvKl5haZqUxavrb9ShKjqzoyMXpEzTixPTxrLVUU0DV/PhdTuDQHg80imQcCBQ0VB93nEl9HX3SVB0dcIoH8mZlUBydgEOKBX6joHmN5OIPGd8hb3oSktGx9DZdUoBi86oNUqpaGn7doYiTWbnu5/HiWk1pe2viUZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id AF02468D07; Wed, 21 Feb 2024 06:44:24 +0100 (CET)
Date: Wed, 21 Feb 2024 06:44:24 +0100
From: Christoph Hellwig <hch@lst.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Justin Sanders <justin@coraid.com>,
	Denis Efremov <efremov@linux.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Geoff Levand <geoff@infradead.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>,
	Jack Wang <jinpu.wang@ionos.com>, Ming Lei <ming.lei@redhat.com>,
	Maxim Levitsky <maximlevitsky@gmail.com>,
	Alex Dubov <oakad@yahoo.com>, Ulf Hansson <ulf.hansson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 17/17] mmc: pass queue_limits to blk_mq_alloc_disk
Message-ID: <20240221054424.GA12033@lst.de>
References: <20240215070300.2200308-1-hch@lst.de> <20240215070300.2200308-18-hch@lst.de> <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdWV4nWQHUpBKM2gHWeH9j9c0Di4bhg+F4-SAPEAmZuNSA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Feb 20, 2024 at 11:01:05PM +0100, Geert Uytterhoeven wrote:
> Hi Christoph,
> 
> On Thu, Feb 15, 2024 at 9:16 AM Christoph Hellwig <hch@lst.de> wrote:
> > Pass the queue limit set at initialization time directly to
> > blk_mq_alloc_disk instead of updating it right after the allocation.
> >
> > This requires refactoring the code a bit so that what was mmc_setup_queue
> > before also allocates the gendisk now and actually sets all limits.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Thanks for your patch, which is now commit 616f876617927732 ("mmc: pass
> queue_limits to blk_mq_alloc_disk") in block/for-next.
> 
> I have bisected the following failure on White-Hawk (also seen on
> other R-Car Gen3/4 systems) to this commit:
> 
>     renesas_sdhi_internal_dmac ee140000.mmc: mmc0 base at
> 0x00000000ee140000, max clock rate 200 MHz
>     mmc0: new HS400 MMC card at address 0001
>     ------------[ cut here ]------------
>     WARNING: CPU: 1 PID: 20 at block/blk-settings.c:202
> blk_validate_limits+0x12c/0x1e0

This is:

	if (lim->virt_boundary_mask) {
		if (WARN_ON_ONCE(lim->max_segment_size &&
                                 lim->max_segment_size != UINT_MAX))
			return -EINVAL;

so we end up here with both a virt_boundary_mask and a
max_segment_size set, which is rather bogus.  I think the
problem is the order of check in the core blk_validate_limits
that artificially causes this.  Can you try this patch?

diff --git a/block/blk-settings.c b/block/blk-settings.c
index c4406aacc0efc6..2120b6f9fef8ea 100644
--- a/block/blk-settings.c
+++ b/block/blk-settings.c
@@ -182,16 +182,6 @@ static int blk_validate_limits(struct queue_limits *lim)
 	if (WARN_ON_ONCE(lim->seg_boundary_mask < PAGE_SIZE - 1))
 		return -EINVAL;
 
-	/*
-	 * The maximum segment size has an odd historic 64k default that
-	 * drivers probably should override.  Just like the I/O size we
-	 * require drivers to at least handle a full page per segment.
-	 */
-	if (!lim->max_segment_size)
-		lim->max_segment_size = BLK_MAX_SEGMENT_SIZE;
-	if (WARN_ON_ONCE(lim->max_segment_size < PAGE_SIZE))
-		return -EINVAL;
-
 	/*
 	 * Devices that require a virtual boundary do not support scatter/gather
 	 * I/O natively, but instead require a descriptor list entry for each
@@ -203,6 +193,16 @@ static int blk_validate_limits(struct queue_limits *lim)
 				 lim->max_segment_size != UINT_MAX))
 			return -EINVAL;
 		lim->max_segment_size = UINT_MAX;
+	} else {
+		/*
+		 * The maximum segment size has an odd historic 64k default that
+		 * drivers probably should override.  Just like the I/O size we
+		 * require drivers to at least handle a full page per segment.
+		 */
+		if (!lim->max_segment_size)
+			lim->max_segment_size = BLK_MAX_SEGMENT_SIZE;
+		if (WARN_ON_ONCE(lim->max_segment_size < PAGE_SIZE))
+			return -EINVAL;
 	}
 
 	/*

