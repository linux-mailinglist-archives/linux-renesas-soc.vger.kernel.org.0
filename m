Return-Path: <linux-renesas-soc+bounces-22770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5F2BC2631
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Oct 2025 20:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 594224E5E07
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 18:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC652E2DC4;
	Tue,  7 Oct 2025 18:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="sJVjtHnP"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189412E8B87;
	Tue,  7 Oct 2025 18:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759861808; cv=none; b=evYANK10cuy5ELDhbd7T4GpY6nMrvQd+VwJqyaTzEXcXKjCY51Elf/+i0DK93B6/x1SAdlBIv5n8cY3WndKemYRIa0uVZMyC/UGZnHnGM2U3Fq2nSd7agNjMQqvCAb0KqMRrJ5Fee52lpwT+aBbw+EnXOYHWe9188PYbaBr7f50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759861808; c=relaxed/simple;
	bh=bibjKRv6dGO4H7/h7R+GuQ7813QvdsOd7tCe4yM2b4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1MqQlOwY91FX0hRIBhzUGaU9ht9lq/W24vvmgkp3rw8stvMTKodTQzcxhlOxkbZM2UdZL5xV3UjF1oRf8Z4oEpreOSfl4v2ZtLww3If3Zq0FCbacPobkqJxqEBtZjusVziCLMAphQUwK55InZ+vvGYsgEcUEW5HcG+LsSTxRmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=sJVjtHnP; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=oDOt1aWIz6+vKSFnV3XS0Aos6XJUvne1tQ7/rj+HdSg=; b=sJ
	VjtHnPELAOEANqQ6XIjBMItKMSUg+uvW1r/PhK2UcoXhq91GLGodtf5z8sw22zZhiap+G8z42Ar/g
	h8US9t/ud/qsCaBMLLMFKzYGkEEDkEpGptHpx1RaxKv4PopKv4B78ebr+0UENZDhM2OaeYLRcHZaN
	jwNYgd6B60RhfRg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6CRl-00AO22-Gd; Tue, 07 Oct 2025 20:30:01 +0200
Date: Tue, 7 Oct 2025 20:30:01 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: netdev <netdev@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: CPU stalls with CONFIG_PREEMPT_RT enabled on next-20251006
 (Renesas RZ/G2L & RZ/G3E)
Message-ID: <dd6d8632-7102-4ebc-92e6-f566683f4a33@lunn.ch>
References: <CA+V-a8tWytDVmsk-PK23e4gChXH0pMDR9cKc_xEO4WXpNtr3eA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8tWytDVmsk-PK23e4gChXH0pMDR9cKc_xEO4WXpNtr3eA@mail.gmail.com>

On Tue, Oct 07, 2025 at 05:40:09PM +0100, Lad, Prabhakar wrote:
> Hi All,
> 
> With CONFIG_PREEMPT_RT enabled, I’m observing CPU stalls from the Rx
> path on two different drivers across Renesas platforms.

Do you have lockdep/CONFIG_PROVE_LOCKING enabled? Is this a deadlock?
Something else is already holding the lock?

	Andrew

