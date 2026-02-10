Return-Path: <linux-renesas-soc+bounces-28114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFx/IlgSi2nSPQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28114-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:11:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E559B11A017
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 12:11:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F9093011F27
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 10 Feb 2026 11:11:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41F2035C1A6;
	Tue, 10 Feb 2026 11:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZvEJ4Ymb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B182DC339
	for <linux-renesas-soc@vger.kernel.org>; Tue, 10 Feb 2026 11:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770721878; cv=none; b=olD2x5R3IepizguK8doNogRo5VIA3klDlC/UO+x2x788UHZTUQZhmFCKHWDUCDJ/Y6DSFtEk9gbev4tIoY9LlCR3g7nArA2GS4H0x20hgE9QkVQfNvsMehl6Kh2Nr8yck3m8vXGHiWMzyFE0psemOTIB9mfs5zCz2hMgYi75oFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770721878; c=relaxed/simple;
	bh=IIIH8rs47eeZASgfNwrXLb1U2ER3O5vT4pgpQkDTOCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmwSV7M9mIAYUTQj+TA48lMi9wr44awEnMPNmtjXu+YTUGi6kfZ5wF1WxkBrCAto7kZkJjjD2ct7E8PVzLqccpYk5+COQ1nNbVusFnKhIywF0S9zWPrX7GuACT269BW4SrPigQlUyzMqkSSC67VuX5On1+x2noAOaZN2E2BSouM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZvEJ4Ymb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IIIH
	8rs47eeZASgfNwrXLb1U2ER3O5vT4pgpQkDTOCE=; b=ZvEJ4YmbBjtfe3ItFGC9
	0A3ilKieAnuoeLsLcTO/KGKoPkOvC0JUE25/etzCrxCErQCrLrBUwHThiGNf61Fs
	ym3qFHjDsQ+Iq/3lL9k9RZ7A0Rj0He2l6dCs2UMZu/Yh1Sozi6MvCVkPG4705e5v
	oEP8DxAa79F+178kq7p3S62BmTdXGUFAS2O7m8eXNQCg8XPZCMyDWIFr31kaQCPO
	EEaSv9vlKvHHHOi/dF1uaRsoerWutfnBMqVu+XqLGFYollME8mi8OkKnf3A6563f
	8IlUah9hI5el4tCtL5U2WHJvQE3pDY6vaqbv7bFGFj0minuNGnVdpcAEpVJZO0gV
	3A==
Received: (qmail 359802 invoked from network); 10 Feb 2026 12:11:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Feb 2026 12:11:14 +0100
X-UD-Smtp-Session: l3s3148p1@XrhVUHZK2L4ujnuT
Date: Tue, 10 Feb 2026 12:11:14 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 2/2] firmware: arm_scmi: Implement
 arm,no-completion-irq property
Message-ID: <aYsSUlbsJoSjj_Qg@shikoro>
References: <20260117010241.186685-1-marek.vasut+renesas@mailbox.org>
 <20260117010241.186685-2-marek.vasut+renesas@mailbox.org>
 <aW5ifVcxVf6uux3m@pluto>
 <9175b8aa-18c6-4dc1-8904-c26fa1dc7428@mailbox.org>
 <20260209-quixotic-offbeat-stork-f1d310@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-quixotic-offbeat-stork-f1d310@sudeepholla>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	TAGGED_FROM(0.00)[bounces-28114-lists,linux-renesas-soc=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E559B11A017
X-Rspamd-Action: no action


> As I had mentioned here[1], I am happy with it and I will pick it up for
> v7.1 once I start collecting the patches after v7.0-rc1. It just came in after
> I had sent my PR to SoC team for v7.0

Great, 7.1 is good, thank you!


