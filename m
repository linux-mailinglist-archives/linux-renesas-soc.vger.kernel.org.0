Return-Path: <linux-renesas-soc+bounces-27892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNVWGNNsg2kFmwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27892-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 16:59:15 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 54332E9B4B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Feb 2026 16:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E683330C5E5C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Feb 2026 15:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6AE2BF002;
	Wed,  4 Feb 2026 15:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="iDTCb/I2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C130F2D5926
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Feb 2026 15:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218319; cv=none; b=pb1s+FaYx4zaOKXelntOj6rQPiVfHb25aSqloTNMiLljhyS2lZ/PZ5rkhedi+DLRjR1r/GeXGIGUnE+fOmzVcOmJRX6aBgqwQVgNIwj+LlORvCSv+Pt77wFQXk0yYqk3Fkcyi1QWtIiWEMjx9DwdatAhk5jG3PiKbS0UKZYRyqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218319; c=relaxed/simple;
	bh=HeoDdrClK0JpMaaC6HkxsSXrArPgi2RboMnEzglTb3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgI7swOdnbQjIdbTGwLfx/hJHLYjO9CHJ2E+EJg4EunuAoY/TXZdNjVPOhjrd5BrnBQ1HsZDHBZZ517pbH2ZaRUEvPjNG1YkXnFIlT9ZAIYPDV7QcT6+ZdH3KFeLc4Af0Sn3yqv6Csy9VEiBRi98+y0gC3GeTPFcZWMz7mAKLZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=iDTCb/I2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=UTvz
	QkxlS44jgbjtA5jGWOWg4/op5k6r0cuc8aC+1cc=; b=iDTCb/I2Gmcs07H1qQX/
	5of6uGapHxgquGCuYUdd9Xoz0qaTOG3wMnisfrqf4GAkCA75/96n7mF63Qk9d7EZ
	OuqsLeATCF7ITmjCFKKmwD6/WLuJ/iyyY5HvCoio+OECQm1SJqfXGaTJEZ3AvTXK
	1jhnS2Gos45/HzB7Hv0XPyw0kdDRG3Vq6wZyO+Q+AkUR/JGKHWLdytKQ1i8bRixy
	aGrLhu/mzQSUW23MFhr1EFt41xxCnhIQkGg9lmdYxx/PuZnHn1CBGdMjh7sddHis
	+biMcvTPMOmRFKhbxJBGogh5S9l7UHBnYNVMs1kjWtPAGtsKftysMz2EiAFPm581
	Bw==
Received: (qmail 2407763 invoked from network); 4 Feb 2026 16:18:33 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Feb 2026 16:18:33 +0100
X-UD-Smtp-Session: l3s3148p1@IHW5EQFKto0qAAAQagvIAoH29ntsUY5F
Date: Wed, 4 Feb 2026 16:18:31 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Vignesh R <vigneshr@ti.com>, Andi Shyti <andi.shyti@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8 1/7] phy: can-transceiver: rename temporary helper
 function to avoid conflict
Message-ID: <aYNjR6sHCzy49Ykj@shikoro>
References: <20260203-rz-sdio-mux-v8-0-024ea405863e@solid-run.com>
 <20260203-rz-sdio-mux-v8-1-024ea405863e@solid-run.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-rz-sdio-mux-v8-1-024ea405863e@solid-run.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[sang-engineering.com:s=k1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[sang-engineering.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-27892-lists,linux-renesas-soc=lfdr.de,renesas];
	RCPT_COUNT_TWELVE(0.00)[31];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sang-engineering.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wsa@sang-engineering.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,solid-run.com,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[solid-run.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email,sang-engineering.com:email,sang-engineering.com:dkim]
X-Rspamd-Queue-Id: 54332E9B4B
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 03:01:34PM +0200, Josua Mayer wrote:
> Rename the temporary devm_mux_state_get_optional function to avoid
> conflict with upcoming implementation in multiplexer subsystem.
> 
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


