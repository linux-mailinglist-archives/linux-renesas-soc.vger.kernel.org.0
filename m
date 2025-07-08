Return-Path: <linux-renesas-soc+bounces-19404-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 23872AFDA38
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 23:55:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77B675855DE
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Jul 2025 21:55:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34C2C2459DA;
	Tue,  8 Jul 2025 21:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="NhT/JyME"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8F412CD8B;
	Tue,  8 Jul 2025 21:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752011714; cv=none; b=CpP+xeVhjJJ3XDMRFn9j/Dnp567FvnbNpxuQs0ISF8A1qV2zak9rrggaV+YxBoZ9qbRyy0o2EuqEMR0cgDrx9vG91oWfTVWTFxDGM4cTEqJH3KRDbwQ2sbYvvsEk4eRsw0Y3My2At+GCw+z4r/LoLhFLqgoApBnYV3UVQs28e1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752011714; c=relaxed/simple;
	bh=pq1R66Bs0KYTOtnSZgW/ckr8Q4vrh2ke8DAFd98X9G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U4vqcKb6+GB4yYVfbzczgL565BTpLZu1IRSQlmuOl2HXqO/hC2XeBClFpXnuRs/v/y4JrXLVlRP5dRM0ET9aIz1VPfYox3dNXtkuUgC4gh+kTq2qsVXjrPxikCPXNWVqhepXBEaU8AOhpHGgs0YOwm0GVx7XY/1+5OvIlduVkP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=NhT/JyME; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=k4L1bJC9JgFHOhs5LqKdHLJEdogybpwNiGaldIwTk98=; b=NhT/JyMEB+OOvtQlsu6jYMLC4E
	0YIFDZs/xXlsBx/nfvYgrjOt8FgwJMtfQbiuSMfJav0U1UHw8CdJn9hYYmuwYc7l8NBTK8+eZVxeE
	SHtE8QFx4T+SpkgbbYijUsSQjjChuVHCXj/U5O9u+Epig+Vdw1RvadSB8JJ8dmQPvvrU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZGHE-000sEX-Ap; Tue, 08 Jul 2025 23:55:00 +0200
Date: Tue, 8 Jul 2025 23:55:00 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Michael Dege <michael.dege@renesas.com>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Paul Barker <paul@pbarker.dev>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Subject: Re: [PATCH v2 1/4] net: renesas: rswitch: rename rswitch.c to
 rswitch_main.c
Message-ID: <90353bcc-af82-44dd-962e-568e31808f08@lunn.ch>
References: <20250708-add_l2_switching-v2-0-f91f5556617a@renesas.com>
 <20250708-add_l2_switching-v2-1-f91f5556617a@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250708-add_l2_switching-v2-1-f91f5556617a@renesas.com>

On Tue, Jul 08, 2025 at 11:27:37AM +0200, Michael Dege wrote:
> Adding new functionality to the driver. Therefore splitting into multiple
> c files to keep them manageable. New functionality will be added to
> separate files.
> 
> Signed-off-by: Michael Dege <michael.dege@renesas.com>

I gave a Reviewed-by: for this patch. You are expected to include this
in new versions of the patch. b4 prep can do a lot of this monkey work
for you if you use it.

    Andrew

---
pw-bot: cr

