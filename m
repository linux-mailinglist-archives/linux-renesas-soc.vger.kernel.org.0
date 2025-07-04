Return-Path: <linux-renesas-soc+bounces-19191-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F028CAF8C1B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 10:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5B1001C21B54
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 08:40:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94DFD28A3EF;
	Fri,  4 Jul 2025 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="2RoO49LA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0743328A3F3;
	Fri,  4 Jul 2025 08:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618075; cv=none; b=oK7kgqJvIJYYRU+TPWVxPN1Djec18zNIPBkWbufUQ1xzdfvMgyms3lRzIBvROTf/2YA2GWK7nHc32bOeg/mNlI0u5cW93p/jWj+MeK0zizUQrET4gE2hRGtMtNBwi2Pbn7FW7RxAyMk1Nao/flod3mqhUBE5M5RzAEwU70rGlQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618075; c=relaxed/simple;
	bh=4nraLcOFQGM1CSq5mhMSYtoadSByACBtnPvyEM1U5A0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORnxU4HsNUJ/yKPCwfYfU0waLkZiUYIp+EhvUfftcGCmzysoOWa9445Zb0usf2Trqy7/ELn4mvl31U1mHMHvhAguv/ZIv10Zda4rHSskJ0Nzh1zmfKtVL+E7MawiMUcdVMtRov6TNEmpFNkvRQP2zIrXm6oo8cSZDOSTNA9EUG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=2RoO49LA; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=R8tHJK8LX7eFc5Xx9afAZnwCpZdiKCSWfWOmcpA3xtI=; b=2RoO49LArWI44cfgK0z+8bmpiY
	P+BV9WohCyLJqnfplaif9/6xf8beKq9b8LBtZeuH+JwaOGJSHkG4g9CLlPqFFEyMKf4G0iuwqzhAl
	6wMZNaS7UeyBeF3fDERmDbtB4x5a0n2/so5Cb1Sx5Qez/KKZC//9bkmKpDWMMpdO29pI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uXbsH-000BZe-6D; Fri, 04 Jul 2025 10:34:25 +0200
Date: Fri, 4 Jul 2025 10:34:25 +0200
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
Subject: Re: [PATCH 1/3] net: renesas: rswitch: rename rswitch.c to
 rswitch_main.c
Message-ID: <47b7ee44-0c2a-4b5f-8b2f-6bfbc3511ada@lunn.ch>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
 <20250704-add_l2_switching-v1-1-ff882aacb258@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-add_l2_switching-v1-1-ff882aacb258@renesas.com>

On Fri, Jul 04, 2025 at 07:51:15AM +0200, Michael Dege wrote:
> Adding new functionality to the driver. Therefore splitting into multiple
> c files to keep them manageable. New functionality will be added to
> separate files.
> 
> Signed-off-by: Michael Dege <michael.dege@renesas.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

