Return-Path: <linux-renesas-soc+bounces-19194-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5236AF8D11
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 11:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5CA18B64944
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 08:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9801F28C01C;
	Fri,  4 Jul 2025 08:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="XI4oQgl+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD2A28A726;
	Fri,  4 Jul 2025 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618822; cv=none; b=VpKV439PhzyHAgaikGH6F1MNTu7hwTK6wI/EmFjLFRcvpm0TULOQKoENAtpP8Z68B5CiyLvDFnhA9kZIHvguKJqU/c2lThRDJfjnulpxPy1RCf9HPkMMufaXDaivYVRNPmhN+3RP9rhR5KfrAQedbyZgTX9ZwY0IYwxTFIzAbuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618822; c=relaxed/simple;
	bh=XU+dcHBSAS/ncL8YTbbCcj5a+KAEdqQRv9wfhVN6Pb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpeMwUdV29zV0KCoY3lHeAg+5uzPlxB43gTqTeYezhNGWK88ZAYrgwcMHr1I9Ldbt8H0kQ06vrs2tHgXXrNVJiGJchc1iT78i7ppnD4DELRCDbjdfdp6B1MqOFAsIfqrTvhDrbdtFSWGHTXhnfqZkGb+mdoK2BtCEMVHkjvFL6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=XI4oQgl+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=gaFXe83HJBk2WBrWwI8RhwH1+TlxwYUSWywwysEXd44=; b=XI4oQgl+HwK6zsoFchs0Hj4rug
	WT0kVsJ9xOgmosgGYYtSryIg+TmDg8o4zUnTaS3Xyl7OB74yjVWQ6X5fbp/2sdwWGMcWo+WpJzHGa
	F+Gt6bZvp54xIULKJPb7LckbZhBNyp8B5xuaUCCnOTuT1HeaetTNSLIxMXhsOMHwD9YA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uXc4J-000Bkg-BK; Fri, 04 Jul 2025 10:46:51 +0200
Date: Fri, 4 Jul 2025 10:46:51 +0200
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
Subject: Re: [PATCH 0/3] net: renesas: rswitch: R-Car S4 add HW offloading
 for layer 2 switching
Message-ID: <4310ae08-983a-49bb-b9fe-4292ca1c6ace@lunn.ch>
References: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-add_l2_switching-v1-0-ff882aacb258@renesas.com>

On Fri, Jul 04, 2025 at 07:51:14AM +0200, Michael Dege wrote:
> Hello!
> 
> The current R-Car S4 rswitch driver only supports port based fowarding.
> This patch set adds HW offloading for L2 switching/bridgeing. The driver
> hooks into switchdev.
> 
> 1. Rename the base driver file to keep the driver name (rswitch.ko)
> 
> 2. Add the L2 driver extension in a separate file. The HW offloading
> is automatically configured when a port is added to the bridge device.
> 
> Ussage example:
> ip link add name br type bridge
> ip link set dev tsn0 master br
> ip link set dev tsn1 master br
> ip link set dev br up
> ip link set dev tsn0 up
> ip link set dev tsn1 up

Looking at the code, it is not clear to me what would happen with:

ip link add name br0 type bridge
ip link set dev tsn0 master br0
ip link set dev br0 up
ip link set dev tsn0 up
ip link add name br1 type bridge
ip link set dev tsn1 master br1
ip link set dev br1 up
ip link set dev tsn1 up

   Andrew

