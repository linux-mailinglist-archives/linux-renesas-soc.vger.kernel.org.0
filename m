Return-Path: <linux-renesas-soc+bounces-32603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OJ6LC37BGryRAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32603-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 00:29:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFCE53B700
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 May 2026 00:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C6B3301CFF9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2026 22:29:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBC5391E43;
	Wed, 13 May 2026 22:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkSTDeX+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAD338911B;
	Wed, 13 May 2026 22:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711338; cv=none; b=MBVoea5y0jP/7JEfdZViNC44vPaVoqvfsdt2Djuu2K2LuJ/GojpcCa4Jh7hTU8o7+ypqBQKnana+PSBqeFwWzTFZCAFVKL2ZIR8aujqvd2yEyZm4W0MRtd7UDnGBVbL2FnEt/62NF/8FfCWzIHvOReMH6vLpipp9WoS77FRKoi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711338; c=relaxed/simple;
	bh=5Nk0rRgq80ty0dx/6K6KZ2bDzftzeT3LI4fZFjuUYUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGzyAsU6tv7fBsV3Lq5kuOOdKT6PLkgv0y/ZMr1FJ4GVSPYpf9csdSCBypUUE9sXJ/utMRCkawnrGmHt8cagkvZag5h8nMwCxTNnYgJryLApmRyN2B7oV1NuHwpd31V/8yGUHS4W6Hs/IPDlDnhnEBGGVzgbq6ZIEkX5MX8YDVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkSTDeX+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26DA9C19425;
	Wed, 13 May 2026 22:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778711338;
	bh=5Nk0rRgq80ty0dx/6K6KZ2bDzftzeT3LI4fZFjuUYUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkSTDeX+KNPPe6GO2wGypLPD4LOzQ8dTJBdQbPnG9vsBEiWhkS3eIynY/sloT9Oes
	 Pe23Z4C3abDpKJo3HSvOcIdSKxsLTMFFNIOYtw0bL3Ga0x/yHwikA4OCT/IP3OG5YY
	 XJ4Ah7Aa7gEdsNHYB5BtV7w1UWTgvwSkfRBwLxJK+5P61AiW/zYzMSIUZrS14jK2Vn
	 M9Uhd9UqLRYXuCnYLSUkMGZcElveo3FW8krb0gLn9XJnbOHTljttUUj7fHJVWNu5aW
	 A4jjduLAjytjYCTNaDUzKWOd/e+HFGFV+jfwqsUBlfX6khY7uwqC33DqpDh9HQFGo6
	 jTj2qMOY2HrIQ==
Date: Wed, 13 May 2026 17:28:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	"Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>,
	linux-watchdog@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v4 4/4] dt-bindings: watchdog: renesas,rzn1-wdt:
 interrupts are not required
Message-ID: <177871133450.2129345.2012198232996151400.robh@kernel.org>
References: <20260507102410.43384-1-wsa+renesas@sang-engineering.com>
 <20260507102410.43384-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507102410.43384-5-wsa+renesas@sang-engineering.com>
X-Rspamd-Queue-Id: 1FFCE53B700
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[glider.be,roeck-us.net,vger.kernel.org,gmail.com,linux-watchdog.org,kernel.org,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32603-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sang-engineering.com:email]
X-Rspamd-Action: no action


On Thu, 07 May 2026 12:24:09 +0200, Wolfram Sang wrote:
> It is now understood how the watchdog can do its job without the need of
> an interrupt. So, it is not required anymore but optional.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  Documentation/devicetree/bindings/watchdog/renesas,rzn1-wdt.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


