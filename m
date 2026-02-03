Return-Path: <linux-renesas-soc+bounces-27791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0C3tD8qYgWl/HAMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27791-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 07:42:18 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B57CD568C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Feb 2026 07:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F22E0301B482
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Feb 2026 06:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB8A37D13C;
	Tue,  3 Feb 2026 06:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="mVWGrrO9";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="F6S0N+sN"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7581A37D11A;
	Tue,  3 Feb 2026 06:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770100757; cv=none; b=rVdnpDpj+4zFtYN5Ut/QIh9hQmJDhhw0+RLFAdcYMkLs4WH7eEfiVcDRkx8oR04t/BO9QTdUYe1MMU3cn4MzsKtFpGHoXhjX+hG3Yv+gfwddSTlsrulk3/TJhnVnr2JAfpWxoYJTS+TKSkR0jvlc2Kks9ZJPhxWVplzcr1hvFFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770100757; c=relaxed/simple;
	bh=AiDDBJGtNgZNRVsEzDtJsVCQd33d6VqLqoB4dm8VSUQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jI2X6MjlZ/x2u+iDa1I03UiEvRy60q+HNzJplUTmXvTnDc0FadVNrYwREN+6Z5DDidSJDKgFHm3YDb+objeIdnC+RjaLj9QxL1zaQYkpiPEHIyHc/aGjOI4k38EB1N4Xb3UIXyMjjuPlOMsd3ZbKG8sKMRYzr1XoXfGvzpxbLE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=mVWGrrO9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=F6S0N+sN; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id C2A44EC0175;
	Tue,  3 Feb 2026 01:39:12 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 03 Feb 2026 01:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770100752;
	 x=1770187152; bh=nnGqY3M+ChOVOPSRG02NPedwNqz8sr30QL/kclAY/NU=; b=
	mVWGrrO9RHxSbCH6yuhnIoADLUIzjK5khMFNp5/JP8PBivIYbWXoE7BoeaVR22mc
	1psAiI/qnSXMPGp2KKbnZiOGiIru5RUAPITJ3Cvtenr3z4HKPXl6E7xKXGjqujRk
	xFaDS1xopdfmdXUkwd2rfefeSjTgSeOJ19ZW9OSoiKPgsYFHX3rBVOBJWjaX2HBe
	sqoN5sMyU6iyqzaDip36L1OwzSYcIwePN9AIMhNClG9TKNsh7NABnn6FIol8TD3M
	rZVrKO1/O6n7LVShOv04Hxnq5gsmmkE5UuOVFl2vZmsJjaD6rQ7eYS7YIsN6/lU7
	Pha/0ewZ8aa99CyPThQFPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770100752; x=
	1770187152; bh=nnGqY3M+ChOVOPSRG02NPedwNqz8sr30QL/kclAY/NU=; b=F
	6S0N+sNvPZLXbYBXD60kyFahnpay7tHN31b2m6/g/8TukDK2as59WlUz8FwNwQDp
	rDvpNJhWCWk7Ad2Fx6+xOSRUHrJEoqpTIsPRqKXRHIikbKDZR4dlePyoEDw1ws3H
	FFgZepJIzGc0tFmJKwNrnumCnKE7RYBBjyFiGz1PZXPkTuxuC25PIdoZoUFHgiLJ
	N8OEFeIdlayKpbVd4qgupeQ59PYhXrV1UOh849IpRchH9huCqurcL3ikqpAejQFK
	84rTn8b5qpXySvVrOVdvqsYPDXQx+N9hJyAEH3BinwQMsR4GnfSEjTxkffxDdnlk
	7dRw0c7fokF+Si1tV2tIQ==
X-ME-Sender: <xms:EJiBaThGXBWNvLqdWpiKHtZHSHUfgSTAx-Pc0PPUeG3Q6YNRJ-TtgA>
    <xme:EJiBaYp5TkLx0cgg0GC-k4iT8p7g-UXGDVhXf2P4d5vA4PgckW9QetTxKFFxW_BIg
    kMNfU0YCUxSMD7Pr0KpKm2XEAxtT5Y85NbXRKWRtMwvSgu4Xo5WHAo>
X-ME-Received: <xmr:EJiBaaiOuGoy0fmMS6fRHh0VkTSla360Rg7f5iIDWyyizQApK6EZtGSO1IOvcTxDWdN_qqxfGtb7DcTouGs5hUpw2knNVIM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeelkedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffej
    gfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhope
    duuddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopeihohhshhhihhhirhhordhshhhimhhouggrrdhuhhesrhgvnh
    gvshgrshdrtghomhdprhgtphhtthhopegrnhgurhgvfidonhgvthguvghvsehluhhnnhdr
    tghhpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtth
    hopegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepphgrsggvnhhi
    sehrvgguhhgrthdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghnvghsrghssehglh
    hiuggvrhdrsggvpdhrtghpthhtohepmhgrghhnuhhsrdgurghmmhesghhmrghilhdrtgho
    mhdprhgtphhtthhopehrihgthhgrrhgutghotghhrhgrnhesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:EJiBaaPIakMtT4vVG8aCNEopzOcFpCDeAkXFKiBlm3P-rNLBDosmNw>
    <xmx:EJiBaUxKL7KK6LExLny72aClO8MOrQodcFTOpy351cdm9p23o5rzkg>
    <xmx:EJiBacojRIlE41CsVmoBZhQi34WRCvFkFZa5moEAfsEV7--Wtk-TTA>
    <xmx:EJiBaUP2EAchLYbXd_iev4l64GRB3hLaCYXEkoSejoYAw9A7JgBKlQ>
    <xmx:EJiBaWKXJbjVYJ18SVhPOF6CU2EI22Z9F-ZTWY5qsHBmZO3rcRGdLcfM>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Feb 2026 01:39:11 -0500 (EST)
Date: Tue, 3 Feb 2026 07:39:10 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [net-next 4/4] net: ethernet: renesas: rcar_gen4_ptp: Hide
 private data from users
Message-ID: <20260203063910.GB2323039@ragnatech.se>
References: <20260201183745.1075399-1-niklas.soderlund+renesas@ragnatech.se>
 <20260201183745.1075399-5-niklas.soderlund+renesas@ragnatech.se>
 <20260202191121.71326ca2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260202191121.71326ca2@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FREEMAIL_CC(0.00)[renesas.com,lunn.ch,davemloft.net,google.com,redhat.com,glider.be,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27791-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,messagingengine.com:dkim,ragnatech.se:mid,ragnatech.se:dkim]
X-Rspamd-Queue-Id: 2B57CD568C
X-Rspamd-Action: no action

Hello Jakub,

Thanks for your feedback.

On 2026-02-02 19:11:21 -0800, Jakub Kicinski wrote:
> On Sun,  1 Feb 2026 19:37:45 +0100 Niklas Söderlund wrote:
> > The Gen4 PTP helper module is already used by RTSN and RSWITCH to
> > support PTP clocks and will be used by RAVB too. Hide the Gen4 PTP
> > private data structure to make sure none of the users poke at it.
> > 
> > This will be more important for RAVB use-cases as more then one RAVB
> > device will need to cooperate using one PTP clock source.
> 
> IMO hiding type definitions in C is an anti-pattern.
> Sooner or later you'll need a sizeof or a static inline helper 
> and you'll have to bend over backwards to access the type info.
> 
> We can take this if you have a strong preference, but please
> think again if you really need this or it's a code cleanliness
> instinct carried over from objective programming, hence foreign..

On principle I agree with you, hiding type definitions is usually not a 
good idea long term, but here I would still like to do it.

My reason is that the goal is to completely remove the type from the 
header file and only expose the struct ptp_clock to users.

The private data will need to be reworked as the next device where 
support for the Gen4 PTP clock need to support the same PTP clock device 
to be used by multiple network devices. This will make the private data 
more fragile and I don't want to expose that to the users as the helpers 
will then be mandatory to use.

I'm sure there are multiple paths to achieve my goal, but unless you 
strongly object against this intermediate step I would like to move 
forward with it.

-- 
Kind Regards,
Niklas Söderlund

