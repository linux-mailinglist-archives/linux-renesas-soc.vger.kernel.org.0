Return-Path: <linux-renesas-soc+bounces-34505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nZNoAGxKQmqb4AkAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 12:35:24 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEC56D8F6E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 12:35:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=sang-engineering.com header.s=k1 header.b=iZBxETln;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6143F302D109
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Jun 2026 10:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF9883B8BD1;
	Mon, 29 Jun 2026 10:32:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220B833B961
	for <linux-renesas-soc@vger.kernel.org>; Mon, 29 Jun 2026 10:32:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782729175; cv=none; b=RpdIcYcpcUXqrxXGuwhjvfCnsZTsXQG81U3TQEPUhrTHazpvS8VfvVRN6AoqxewE94ZBqlYYDt7fUmCaUn95V+oA/Bz9RSoSJFffTalkiohVnyLP0zM5+lFPNoHpImIqKREBWHTk6Lhy+fOuMRAgOuxcwtYdHLiVbSc3LUTHiMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782729175; c=relaxed/simple;
	bh=GAVPGmMNqMrJOmIH4YyvjVq5OzbZxpEO5nPWtCNJWMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTOZ1ygLDwO43z3fhTL/SpizEVfP+8K1a74vu3SMeZHQUSqSGdGSl0FXVN1lXg9Hb86diOUnp4XIzHQpwx4+mBcG9SbslxQc+ZaFgBMVLFjTUiR863sbg2rp0LyzzgnMutEfL13nuWjx5SzQh4n0xc6LruveCCNSE8/1EpBCiLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iZBxETln; arc=none smtp.client-ip=194.117.254.33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=GAVP
	GmMNqMrJOmIH4YyvjVq5OzbZxpEO5nPWtCNJWMQ=; b=iZBxETln74865akYcKUM
	uabt6k+6PCBb3v+VuIk307KJ4a4uPMYywdn/6637ik2h58L8lkMrTLSADy3O6oHc
	cPGTozlgkdIaS/UQ6GmorywUhQhh7pk3GWNmFeEaTyWZ1MLFZiH+hOskx7UeWgqf
	SvaIUPRG99mpoMqirXWAhvVb0NTn9W/MXa+/tNZz+qG8moWYOSPlL55Ymknid0Eg
	CcFwHm9jHICT4/Kdf4b4EKdeX3zeeIggCUHrtZwZnmewewZjZGPPyjfmQnXL59se
	jR4bm008PDa+GLtjYYqrzxp/cQra9TDChXpp/6KSDkGK/+B4gCv6EHetc90B/ku5
	xA==
Received: (qmail 339816 invoked from network); 29 Jun 2026 12:32:52 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jun 2026 12:32:52 +0200
X-UD-Smtp-Session: l3s3148p1@ovYF+2FVpqwujntC
Date: Mon, 29 Jun 2026 12:32:51 +0200
From: wsa+renesas <wsa+renesas@sang-engineering.com>
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Felix Gu <ustc.gu@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Mark Brown <broonie@kernel.org>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] spi: rzv2h-rspi: Fix DMA transfer error handling for
 signal interruption
Message-ID: <akJJ09zjt_dXp1jS@ninjato>
References: <20260627-rspi-v1-1-170c93ee14da@gmail.com>
 <aj6sEE5y62SOVsRb@ninjato>
 <TYRPR01MB156197735CBABA1699843B9B085E82@TYRPR01MB15619.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYRPR01MB156197735CBABA1699843B9B085E82@TYRPR01MB15619.jpnprd01.prod.outlook.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:cosmin-gabriel.tanislav.xa@renesas.com,m:ustc.gu@gmail.com,m:fabrizio.castro.jz@renesas.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[sang-engineering.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-34505-lists,linux-renesas-soc=lfdr.de,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,renesas.com,kernel.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ninjato:mid,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,sang-engineering.com:dkim,sang-engineering.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4CEC56D8F6E


> I also think the patch is correct and should be accepted for now.

To bring a broken state into a less but still broken state? I don't
agree.


