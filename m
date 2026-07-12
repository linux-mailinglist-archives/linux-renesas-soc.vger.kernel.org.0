Return-Path: <linux-renesas-soc+bounces-35084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gss2JsYTVGoRhwMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 00:23:02 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA8A74627F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 00:23:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=nAhAIMZo;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35084-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 99D0B3002B07
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Jul 2026 22:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A09380FC2;
	Sun, 12 Jul 2026 22:22:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274BA379974
	for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Jul 2026 22:22:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783894979; cv=none; b=E0JY2pSdWXZU0MGsk4eqS9Hbdobh1igJaaEmM1yxpa1fVswqi/Cr8yX6ughBiW5Oyt35qKgkyR4wzvRVYxDa1de3AI06W7o2Zu2XaQJ5TWIkVw92DZnZSSJWLGNYTDJyjpikTw/FeWXg6ojs+5PkP4UsUd1t8uc+Q24mxaU6eEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783894979; c=relaxed/simple;
	bh=8WRZxD4H8+tY9oaiz5xLvkGilYbPiA92y2Jesbmxnro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlHjr+xw/L2w/JLT4xJvGYpSjSs4e1myAZB11+Otk0hGm4LjfISoXR2S1D29HV6wwUugncmzuS6UBrlvoJSU/bKuMGHHJm5Kq9XynnD0/TE1yTLxvFMFVTQDFY5nMcRzQ7z9MyP3LCYHEMls1kfPCzxB82C4xcou1omkheTzoNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nAhAIMZo; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1281596f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 12 Jul 2026 15:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783894977; x=1784499777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8WRZxD4H8+tY9oaiz5xLvkGilYbPiA92y2Jesbmxnro=;
        b=nAhAIMZo/IvRqATdC2+4nvuMHx8v/2qJHt+WGnwWhoB2TXIYWixQot20r9o2Kl71Ve
         OjeTS1/8o9ZU9FZ0U9+lb/qkfsq0RiND+FlpB/oaOCDe5jn6WCq6+xbESWEaEv3/o+7q
         ZB09SviaIZgOp9H1KhmDf4a+j5lMng0+XN+5lFDzHcHxnP/hXhlkNdQNx9tCF0CXgthr
         /jT4xh6YWYOynhr+KjB00pqQ6vnGlqRDqQ7pG1Q91JpRh49Y256fYjdMxqxvA2DtAKQp
         FUBIKCNKN4SDMU6hE2T1zTCC+Q0BjX0E7Stjj0RUQdT1t8Gv5Iv5V6jEUQN2vp2MQuyG
         qlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783894977; x=1784499777;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8WRZxD4H8+tY9oaiz5xLvkGilYbPiA92y2Jesbmxnro=;
        b=SUcwF7MWBH80op4VwMSAL91Ppyn9gD/Q75g5AEGLg6eh8ZoXipcVRotIf0G1xwEb+9
         a3Q9RQeqEpgpaLct6zdW3HaRg3UBjcjTb/UPIlqmsySsmAK/DvIZNOfod6ZJlMUecfsd
         F1SOIvJW5MzVR2laqJv/S2iAfGgQr+ysb8iz9TAZ0gqn44rIO7MVSHwtHS9BLGN/RZvc
         lVAAz11hT22mIMFCwM5aqv1UyzIPOOn04VNeI/xUMlFPp/kcqJfJXvYqCFGpmibgr62C
         8Im+1lw1O9z2ZJ6sWuzjWW+eFHTP+b1NCLEV9u6eAhVqzc2gnU7Rt2wi1roabKfU3bhs
         6AGw==
X-Forwarded-Encrypted: i=1; AHgh+RrxXGQJZyZyThzJBbaNONTlLbtI+krA6E6vjnAzlu6BYiMyN41fX+OSS4tF/SzKW/SC6QOgrvRU6XOXZyOKg90mDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8xLdtmfR3h8575kfnGSP6ofqVw70rp7OQQUu1MxC2cQMsHzSH
	1u+jOVCaYZMxwvg2Dv1rhh1i3vnCscIFsq+lP9xXnLqn4APNL0IEO6H/5LM6QLwFZXQ=
X-Gm-Gg: AfdE7clYrRza7XFYHVvx6NYKJnXpIAT5VgXcLIEDzQL4f1PWsga2wsig5U8fw1nKG3G
	GaoG0cFZYU4DikjUUJ4d5AQJ2LvLy8Iud4uWnhXNI1UaGmzA9+WBWaefFdPVYmWQYI5Vi76cba4
	rndG5Y1Ga1TxnXzQnOZ6OZlLJWO/A11MlB8DD0Nkcb7PrOQklcCFqzsqSgzYv7LErly/K4mOisg
	xesvtdcc8EZGxohx1vd6PILRbittgo5M69B6+t2H5Z8uw1id1kcfh7XFYDy3WYoqzKikkBlj7Hn
	CcQ0f70xkr17KeFgNkYVQku0oErCWuuGGyvVzQD0PvSf8VvnKwODdhp5bTRccbsvw/+gIj/c8yK
	wRqEc7jjEXWH6sX5FrRm59XKGcJXsvQoILxIyRYxldjP9B/5AQbLhQC+94zIoFiios740hyqqiw
	/Ws9tGPuKahp4oH1sI3QY3pEau1nJR
X-Received: by 2002:a5d:59a4:0:b0:472:9bf7:2f58 with SMTP id ffacd0b85a97d-47f2dcc69e2mr6731266f8f.36.1783894976653;
        Sun, 12 Jul 2026 15:22:56 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47aa0f213e8sm78667437f8f.34.2026.07.12.15.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:22:55 -0700 (PDT)
Date: Mon, 13 Jul 2026 00:22:54 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
Message-ID: <alQTnZwVRwpVTVUf@monoceros>
References: <cover.1783505142.git.geert+renesas@glider.be>
 <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ak3qgcbynp5sb6ym"
Content-Disposition: inline
In-Reply-To: <50f5804f00c55cd60604d00da1bf1f1dc912ba8d.1783505142.git.geert+renesas@glider.be>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:geert+renesas@glider.be,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35084-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,monoceros:mid,baylibre.com:from_mime,baylibre.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2DA8A74627F


--ak3qgcbynp5sb6ym
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 3/6] clk: renesas: Add R-Car X5H CPG driver
MIME-Version: 1.0

Hello Geert,

On Wed, Jul 08, 2026 at 12:15:08PM +0200, Geert Uytterhoeven wrote:
> +#include <linux/mod_devicetable.h>

Please don't add new users for this header file. Only use those
<linux/device-id/*.h> that you actually need (if any).

Ditto for patch 4.

Thanks
Uwe

--ak3qgcbynp5sb6ym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpUE7sACgkQj4D7WH0S
/k692Af/VsqjHq8LAyiXwd69+QSwZHSG0U4MEBmnqkTcJ6mPo3Q1tfbuac0TZGpR
buYByMLca9o6W+7RHLvf+/Zr3Deak9AlTYe0KCuPpU7D8l92MkJ9qyU4qaQWyxrI
Hv1YMMYA5G+C8pvTfUspprOv7ql6Xa7cYPsIo3jLpjbhJL3dg7EiCHHjEt/TyipW
XDBbz9nhJzlzRZZzwDROzHctrH75sRADO/UfFjRhtDmkYC4qRs2tvJk7mEMQ9TG0
ZBnRKl3liOyOP0apWQ9wSU/MuVwRJ+l7pTHIihy3BPhzxJM+7fQFIzy3bdjFMWZY
qnwvvfAtAsXvn3SjgrZe5nuPmhpk5A==
=z1Ow
-----END PGP SIGNATURE-----

--ak3qgcbynp5sb6ym--

