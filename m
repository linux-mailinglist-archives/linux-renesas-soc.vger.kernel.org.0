Return-Path: <linux-renesas-soc+bounces-13225-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C0EA39448
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 09:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 473C21892C61
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2025 08:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C60AC211291;
	Tue, 18 Feb 2025 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lzcJk7wG";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4EK+CtiQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D9E20F082;
	Tue, 18 Feb 2025 08:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739865620; cv=none; b=ABiNNhcE2HvBT+IE8MC6g9+IRPWO7+bB0DMitNgXtpsPS/M7iREY0S12aSzIg3id/6eCtiFyEcoOvIhDDo6uOrCHM5n8wOHjSjyldq+zNWMXWj28QmTlLNM7i4mEWJPld16+J7kcHVYK+qOScKfKB7u8YUBFnzelSUCiK3uMsyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739865620; c=relaxed/simple;
	bh=BIBoLdAaz+syXSP2Bq+NI3t7QHXsMK1JKWwPblX5Opk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=f1TSmvr6DPdSvCXGPpuv0oaIhSWk/n959FHKy8dDcP4+2amPr8q8s/SZFdoBxtjWlhTW0Oto3ojATI8365Uz2QSR31eSD4KA1WmC/uVmJ1tpmjeYKzZw4WD8fuwHMbGuJDKTsWuJWoOIDcNmPwgjCowZoZ/k5GCvDtxgEwWjRP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lzcJk7wG; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4EK+CtiQ; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1739865617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1VopzplUY31yktOMEeJ7DZO4lbiNm+WmseWdkp9vwaE=;
	b=lzcJk7wGfDSoswY5b6fXLF8WXUqdt6HvIakiQw//oL9GTTJ+QWsT0/Y9VU5kyBqaZl/AeY
	xM6L8l7IIhUqYsnsNHf0nVsN6VlYITV2W/yVImUaynppDxYIUHivitxc8gzY9a2qCDInCq
	eOuOl4psopZyNjJUqS50bwF9BTfWPNMu2qh7VZMev/mZ/7WdXtVsbPehvCXuCKmxDvStjg
	jq9gD+KMQd9pPqFL/+JSlE0s6F9hf44j8fZQgOlDPe/qeLOf3WHo17JcFzESAimmIrn6q/
	qhmz6mzijUyLd1irQmridL5XTcJ1WdVUgek0E6PYp0Y/G0a3cNxKwB2YKS0yNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1739865617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1VopzplUY31yktOMEeJ7DZO4lbiNm+WmseWdkp9vwaE=;
	b=4EK+CtiQ827ZYkXO6ioIZHJZXMvjyNhbA1ri+Y0EMk6EiaNNuX+ltmB4o/kxm7FO5BicXx
	bH5M61qxoHHAJVCA==
To: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, Lad
 Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/7] irqchip/renesas-rzv2h: Add
 rzv2h_icu_register_dma_req_ack
In-Reply-To: <20250212221305.431716-5-fabrizio.castro.jz@renesas.com>
References: <20250212221305.431716-1-fabrizio.castro.jz@renesas.com>
 <20250212221305.431716-5-fabrizio.castro.jz@renesas.com>
Date: Tue, 18 Feb 2025 09:00:16 +0100
Message-ID: <87a5ajk7hr.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Feb 12 2025 at 22:13, Fabrizio Castro wrote:
> On the Renesas RZ/V2H(P) family of SoCs, DMAC IPs are connected
> to the Interrupt Control Unit (ICU).
> For DMA transfers, a request number and an ack number must be
> registered with the ICU, which means that the DMAC driver has
> to be able to instruct the ICU driver with the registration of
> such ids.
>
> Export rzv2h_icu_register_dma_req_ack so that the DMA driver
> can register both ids in one go.

Please denote functions in the subject and change log body as fun()
according to documentation:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#function-references-in-changelogs

With that fixed:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

under the assumption that this will be merged via the dmaengine tree.

Thanks,

        tglx

