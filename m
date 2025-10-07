Return-Path: <linux-renesas-soc+bounces-22773-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D8BBC2EAB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Oct 2025 01:04:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEA713E2112
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Oct 2025 23:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AEC2236E5;
	Tue,  7 Oct 2025 23:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="DCngyiup"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7152C9D;
	Tue,  7 Oct 2025 23:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759878253; cv=none; b=KWOSrVnZdj9uDfoCR9lok3zsQi5wR1Nre4B+eipT2XVTuQYTdC/zLMZSEvHIGZEONaikGT3IfNwe2RY8HYcpJlHaejGYXE7GYNVujqNKxX2BwYmTtpynI6PoDmT5swuuTfJ3M/j0zgGE2zhEhQojy2K5dDcnkiT0mZLuWOrquIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759878253; c=relaxed/simple;
	bh=DmUNTt2axIlkGHXADv0e0jYWiAffbGEyg+3VV08bliI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MahMRskcaPSEIEbe8jDn9HiHsU1zXBJU4mo32SVbm7t3ydHKYsEL0plnnv9aaghA422YRfjOswrqtmuJbTemXwXu3oF3M8OkqcEMdZUPc/gUNGdEFpP/JCFbrKGo6c+9hw/o2UKmbtl44jkTRKITf5lL+AZe5HKMBI9ULp6sg/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=DCngyiup; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=jjt4KaYIhQgBbXhm7vy589MatOwIZ9D3kuIG0kfCUOM=; b=DC
	ngyiupqM2UyYTfa53W8065E5uQ2/NKEtnoSg5vGRbN2i8CGRZRHEevgAOd+xc3XzETU+cJZTSEGKd
	GQAWGo3iYV0bp2OX4plngHz2u8lMAxatVPDGJqg6eEjYMRiCI71nztYHb6lLZJLD8MlIpxMg44tRd
	eMP1ZTbEn5utNns=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1v6Giz-00AOkx-Cv; Wed, 08 Oct 2025 01:04:05 +0200
Date: Wed, 8 Oct 2025 01:04:05 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: netdev <netdev@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: CPU stalls with CONFIG_PREEMPT_RT enabled on next-20251006
 (Renesas RZ/G2L & RZ/G3E)
Message-ID: <5ac7ca4a-a85f-4611-92d6-fa1e26ee1c65@lunn.ch>
References: <CA+V-a8tWytDVmsk-PK23e4gChXH0pMDR9cKc_xEO4WXpNtr3eA@mail.gmail.com>
 <dd6d8632-7102-4ebc-92e6-f566683f4a33@lunn.ch>
 <CA+V-a8v89b0Mg8ZX6nabNV8bMEan3EkonVhhHCb4t1GNxaxqrg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8v89b0Mg8ZX6nabNV8bMEan3EkonVhhHCb4t1GNxaxqrg@mail.gmail.com>

On Tue, Oct 07, 2025 at 10:40:59PM +0100, Lad, Prabhakar wrote:
> Hi Andrew,
> 
> On Tue, Oct 7, 2025 at 7:30 PM Andrew Lunn <andrew@lunn.ch> wrote:
> >
> > On Tue, Oct 07, 2025 at 05:40:09PM +0100, Lad, Prabhakar wrote:
> > > Hi All,
> > >
> > > With CONFIG_PREEMPT_RT enabled, I’m observing CPU stalls from the Rx
> > > path on two different drivers across Renesas platforms.
> >
> > Do you have lockdep/CONFIG_PROVE_LOCKING enabled? Is this a deadlock?
> > Something else is already holding the lock?
> >
> I am using the ARM64 default defconfig with RT_PREEMPT enabled.
> 
> CONFIG_LOCKDEP_SUPPORT=y
> # CONFIG_PROVE_LOCKING is not set
> 
> I need to check if it's a deadlock, but from the looks of it does
> definitely look like something is already holding the lock.

Once you enable CONFIG_PROVE_LOCKING it should tell you about the
deadlock, a stack trace of the other locking path involved etc.

	Andrew

