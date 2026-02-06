Return-Path: <linux-renesas-soc+bounces-28022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GoxCzUihmklKAQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 18:17:41 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF6A100DA2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 06 Feb 2026 18:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D16F3300559D
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Feb 2026 17:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597403A1E72;
	Fri,  6 Feb 2026 17:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="hBohwdmD"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2564352FB7;
	Fri,  6 Feb 2026 17:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770398257; cv=none; b=poErP+rSOccfTITf+szRhNUvLD4wy3+vQFSgZTTMNLt3vtjCCw1qgHkhiR4BkmLrkbEQxfv4NRqg9zDCfhn5jCJ6nSeKHafHLClLnonhIaI/Jo/1e4tcSRDf4CbXIl2lKMscoWKC666qRYS3zd3JxGbNy+/R6kCdosMfoqPO/1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770398257; c=relaxed/simple;
	bh=sTEb/e7pAGdnj0Lle8dENGCcDlwrF+BHV/spyQAZrkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IpEwPL/sPlm2npAu0UYaIQZ9VXphXk5JP39uc6rhB7Rcl9FSblH59tYL5KeOk1fKQhu8rGGx1Rsfx9miwZiP8V+lar6l3+lO/zwlXC6gzU1HJo+OG0M6q0t9o/7mGrXOeZLUovMzY3ujeFlOfv6oZkqI3s5ZRpdsDxdv+BQ5HoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=hBohwdmD; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lV15MDu97rxiDNJIhwBcLG3FZ3YE/GmtyjhEBWXOLiQ=; b=hBohwdmDGjbTHO+ojHERGhQTVr
	X3EyOJBt20CEF/Xx6HbQuGGMG4iDTPuSA5/262VdLf9d7MPuiPylMOyyj8dgj+xvCR97RFX82VELQ
	ZxRjkppZYU3CBHpJgBIIXZoOr6rwU+zE+R7H4dHTnWnIaGFVAi1hZXsCs+sZLOa+5Kd4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1voPSQ-006PHB-Ux; Fri, 06 Feb 2026 18:17:26 +0100
Date: Fri, 6 Feb 2026 18:17:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Nikita Yushchenko <nikita.yoush@cogentembedded.com>
Cc: Michael Dege <michael.dege@renesas.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Christian Mardmoeller <christian.mardmoeller@renesas.com>,
	Dennis Ostermann <dennis.ostermann@renesas.com>
Subject: Re: [PATCH net] net: renesas: rswitch: fix forwarding offload
 statemachine
Message-ID: <59c7e214-8fbe-42bb-9da0-df41b1794d37@lunn.ch>
References: <25ff0841-545b-433a-8e88-6e463ea718e7@cogentembedded.com>
 <TYRPR01MB14284CB75C7DCD35381BD17EE8299A@TYRPR01MB14284.jpnprd01.prod.outlook.com>
 <237bee8b-a7cf-4c14-9946-8bf72dbddde5@cogentembedded.com>
 <TY4PR01MB142829EB0EDDE13B588F949298299A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <a4cfeba2-23da-4fdd-870b-6533b5ce267c@cogentembedded.com>
 <5b8bcf37-5cd0-4c32-b0ba-3386142b7795@cogentembedded.com>
 <TY4PR01MB142820FC29E751D8C7F0B7C348266A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
 <1aa615e2-1297-40a9-b7c4-beb943996721@cogentembedded.com>
 <38e09d91-c514-4090-8e31-1709073b237a@lunn.ch>
 <da7edbbd-5a31-46a3-a091-b06ca4fee683@cogentembedded.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da7edbbd-5a31-46a3-a091-b06ca4fee683@cogentembedded.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28022-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[lunn.ch:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.954];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 8EF6A100DA2
X-Rspamd-Action: no action

On Fri, Feb 06, 2026 at 05:10:26PM +0100, Nikita Yushchenko wrote:
> > 
> > DSA switches handle the CPU port in a few different ways:
> > 
> > * They do address learning, so learn what MAC addresses are in the
> >    direction of the CPU from the traffic sent by the CPU.
> 
> rswitch does not support hardware learning on CPU port.
> 
> To make use of L2 forwarding to CPU port, one has to add destinations to MAC table manually.

O.K. That helps explain a few things.

> > * All frames with a destination MAC address not in the address
> >    translation unit get sent to the CPU. This is sometimes implicit,
> >    the CPU is included in the flood for unknown MAC addresses, or there
> >    is an explicit bit to enable this.  The software bridge will then
> >    handle the frame. The reply, if there is one, should then trigger
> >    address learning.
> 
> rswitch does not do anything implicitly, each frame is processed by trying in order:
> - match it against "streams" in L3 table,
> - match it against destination addresses in L2 table,
> - match it against VLAN table (VLAN id only),
> - try port-based forwarding (i.e. common rule for anything coming from particular ingress port)
> 
> At each of this level, it is possible to configure one or several destinations to forward frame to.
> Flooding can be implemented e.g. by configuring "port based" for each port
> to forward to all other ports, so if a frame is matched at earlier stages
> then it is processed per what is defined there, and if not then it is
> flooded.

So it sounds like you could flood to the CPU port?

> > * The switch driver taps into the events the software bridge issues as
> >    it does address learning. This allows the switch to setup its
> >    address translation tables to mirror the software switch.
> 
> For rswitch there is no easy way to sync hardware-learned L2 entries to software.
> There are no notifications of hardware updates.

I was meaning the other way around. The software L2 entries can be
placed into the switch, to make up for the switches inability to
perform learning on the CPU port.

If you flood unknown destinations to the CPU, the CPU will do address
learning. The software bridge will flood the frame to its other ports,
and when there is a reply, it will add an entry to its table. You can
then mirror that to the hardware, so you gain address learning on the
CPU port.

> In my original driver, I enabled L2 forwarding only when at least two ports have been participating.
> I don't see rationale for doing differently on this hardware.
> But Renesas can have a different view on this.

So there argument is that it simplifies the code. We might want to see
the patchset, see how much code they manage to delete.

    Andrew

