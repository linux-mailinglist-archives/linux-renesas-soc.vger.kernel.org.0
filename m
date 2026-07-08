Return-Path: <linux-renesas-soc+bounces-34876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h5Q5FpVJTmrpKAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 14:59:01 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB2F72688E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 14:59:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=OPchiDIQ;
	dmarc=pass (policy=none) header.from=linaro.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34876-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2251430A7293
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 12:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49AB04611C9;
	Wed,  8 Jul 2026 12:54:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9161B4534B7
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 12:54:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515296; cv=none; b=tZlF7YEEPjYUghVAcquJF4xQ6pCFMmR4bBGWzT9NT3J6E3UdyaUOFOnHmRrwp72KH1AwoCLLevkcL2gHCN5YzULVbZdYupsPuLtp51VVza34uVda6QrO7mwI/MW3MDj6ShjO3etk3Q8OBYxYMtSXaINnecmMb54v0qzPag+/EQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515296; c=relaxed/simple;
	bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=t7uTgLMcX8zRWHiXBzVUMMK9Ou8ZLGQtPhrz6JjeyfdC6QMi7v1QdMDrow0l+pj5dJc8J5E9zCWJgYBCu90Onk9mQNbEQSc3QhBEsi1LyzBKJm1EWgor5Zo1R4JGwNv1ogcSoDdku3br43v5rO/+3T/lXS2agab/9nomWF1JTEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OPchiDIQ; arc=none smtp.client-ip=209.85.208.45
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-69532288224so1295371a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 05:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783515293; x=1784120093; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=;
        b=OPchiDIQUJypNYvQDZ5Emw1SPIjZMHfIfJz/4WNNtBw34u0DgXs097IcHrO/tft+pL
         5RkEn3HDA70TDl/nqQl5u5I6LbTRBPldanvHaX7C7u4VtoIRT2IjscdYeYVzwxqEtFC9
         8zNLW4Xk/H9tKCf6NQvOInnKR/0wkVgN75Iqx934PbZbl/9eL8wGP7Ow+KidHDW+uaa3
         WGFVUAxJa+hSHN7veFSM9/zOKXazGzNQd2EXwur8xbp2nFLePZheZnMkxfVVxEpfURil
         tOf1SXcjX0Gdu3aeDuF7dEPD/dELQ5kN0RvxrNi0R0XfUU7PypMXR3sP3DdwGKQwobSb
         qEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783515293; x=1784120093;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqIdz9eEaKfnjtFoMaD9625M1qr2VdseCv1Uqzseygc=;
        b=ilUvLiYUuXUFI4kMtsHpCCGxFJgmTgV02+CHnnXg0qodbN7JyVm1264l0bvQQsxSW5
         6YxjUtftWX30q2r1PQF3mOrz4fMD3iVWIzh5XWm9RSQtyaC4mDlSs5/Ckfnl6npngO9X
         ZrF0BfOfLHcM3U47NDihx5YvFk00t1rHTtchU4e+HY8DPxaOanxzcEYNNaE6PodQ4AV5
         NN93ie0/WaNP2kUhP37gV3jSgS7+ri1LABbGoZ2vFo/AbNSAErd2qtq9l8d+WaIFvdFd
         2K33v6xqxDvuzX7SP6bMqJvJ1c2C6HEENiKQplq/8+PIevdfcmq2+yYj0mfHYRgqe9SM
         jtNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1YmRx+MJ2UUZ12ueVROMwMb3SnM7MPpZdj6uYakRmxgpT8nPTwDJcxa5SGbA0iNJCbya+PMbSudQRHGPoj8CUbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySTl1oBcvh7Ef3mjEMw+yont84ndZtqDwwlM5Gmtu2nd4qh8+V
	nxMwYeFPG7v+TV+Uy8/g6VDfoG63e9Ba7fyJp0ulCITia8HEca0O7ry7y2c8O/5buE8=
X-Gm-Gg: AfdE7cmUANOPGaurt/tbZhCMK6wwFLZr66aqiTEhOshaqGA3Sg8XjDEP15cp0ke68DM
	62ZXF7+k2TKG5bl7fZy8rZKPWxS4Sswd+0lubf72AF3tBTlfht2goVfjOBbite82yBT3kpKcxHX
	+81OogPxcDho9abo++PfhOG9i2/UKsQUDNtzTK2Dlxk/ZyLpRoe2N5ugknxtt4U2vkr+LJveysD
	oN8GpY4XNO9FbYwTSdZvhD3y2Z8sLjLppIAqDdVMKtOvqKk4LveevxdYFbF3iWfoX7HoiHNWsi9
	u9BdylCImUtCjX0Q0OjbKPHtEeDHWTvF/WH3MGLu/xhHC+1avuBZNalWHKzbfIAW5sd7DYfabwu
	8Cm62DYlpt8xBypCBcXeh5HDkVSxawLHbGHzumsBvzr0yM/A179rT0KGGidhJOSVUx2uUOfthjC
	6MH1EiUH02d1JHUNNBq5E=
X-Received: by 2002:a05:6402:1906:b0:698:b60b:aac2 with SMTP id 4fb4d7f45d1cf-69ab4453d30mr1054344a12.4.1783515292855;
        Wed, 08 Jul 2026 05:54:52 -0700 (PDT)
Received: from draszik.lan ([212.129.81.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69aa613d4e2sm2000319a12.24.2026.07.08.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:54:52 -0700 (PDT)
Message-ID: <4a5a09fd68fe45939bdcec4a3c5a781d664eb34c.camel@linaro.org>
Subject: Re: [PATCH v2 13/23] mfd: Use named initializers for arrays of
 i2c_device_id
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= "(The Capable Hub)"
	 <u.kleine-koenig@baylibre.com>
Cc: Lee Jones <lee@kernel.org>, Michael Hennerich
 <michael.hennerich@analog.com>,  Chen-Yu Tsai <wens@kernel.org>, Marek
 Vasut <marek.vasut+renesas@gmail.com>, James Ogletree	
 <jogletre@opensource.cirrus.com>, Fred Treven <fred.treven@cirrus.com>, Ben
 Bright <ben.bright@cirrus.com>, Support Opensource
 <support.opensource@diasemi.com>, Andy Shevchenko <andy@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald	
 <rf@opensource.cirrus.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof
 Kozlowski <krzk@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas
 Kemnade	 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros	 <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Andreas
 Werner	 <andreas.werner@men.de>, Samuel Kayode <samkay014@gmail.com>,
 Maxime Coquelin	 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, 	mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-omap@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 08 Jul 2026 13:55:06 +0100
In-Reply-To: <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
	 <5aec0fc2ac0cd1d2e27027ad0c180e2647bd494e.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8+build1 
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[32];
	TAGGED_FROM(0.00)[bounces-34876-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:u.kleine-koenig@baylibre.com,m:lee@kernel.org,m:michael.hennerich@analog.com,m:wens@kernel.org,m:marek.vasut+renesas@gmail.com,m:jogletre@opensource.cirrus.com,m:fred.treven@cirrus.com,m:ben.bright@cirrus.com,m:support.opensource@diasemi.com,m:andy@kernel.org,m:ckeepax@opensource.cirrus.com,m:rf@opensource.cirrus.com,m:cw00.choi@samsung.com,m:krzk@kernel.org,m:aaro.koskinen@iki.fi,m:andreas@kemnade.info,m:khilman@baylibre.com,m:rogerq@kernel.org,m:tony@atomide.com,m:andreas.werner@men.de,m:samkay014@gmail.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:mfd@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:patches@opensource.cirrus.com,m:linux-renesas-soc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-omap@vger.kernel.org,m:imx@lists.linux.dev,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-arm-kernel@lists.infradead.org,m:marekvasut@gmail.com,m:mcoquelinstm32@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andre.draszik@linaro.org,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,analog.com,gmail.com,opensource.cirrus.com,cirrus.com,diasemi.com,samsung.com,iki.fi,kemnade.info,baylibre.com,atomide.com,men.de,foss.st.com,lists.linux.dev,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.draszik@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:from_mime,linaro.org:email,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBB2F72688E

On Wed, 2026-07-08 at 13:15 +0200, Uwe Kleine-K=C3=B6nig (The Capable Hub) =
wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
>=20
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
>=20
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
> =C2=A0drivers/mfd/max77759.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org> # for Maxim MAX7=
7759

