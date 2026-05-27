Return-Path: <linux-renesas-soc+bounces-33237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N6bBLU9F2qg9wcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33237-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 20:53:41 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 249715E93EB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 20:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A694E303E2D0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 May 2026 18:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6573F44DC;
	Wed, 27 May 2026 18:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b="CZPrCZhI"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from vinatta.cz (vinatta.cz [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958FA3C5837;
	Wed, 27 May 2026 18:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907090; cv=none; b=ByEA/OwU9bY8c69rmYXKIaJBrvVBcPPAFfyYTqnNB68Zu4p74DhkP+EzA3+WXN4TrkWOiK48FfCfEWBNhg7cvzQ3KS+J7Y9cAA481/Zi2oitNLUx29OU6OnSOvpqCuRjQQBmACOqy4l3vioJAjoMXQ0GgHD4oehFyj5mdn4t318=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907090; c=relaxed/simple;
	bh=ApEPioN6Lb4OKyOa7Ff37Nv+Yg/r+wxB4CavphylJVQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:To:From:Cc:
	 References:In-Reply-To; b=SlaPwXfkiGihZWJbmhahPCdvnpzyPRUXBB++bfuazN5Z9cHXFWTssLvY2E2rl0zCbV1i91drlTN2H7aNvjCzZamTKrL0EJ/3FlaPD6DfUYQ8wO8JWjL5tNRNjGrRuqjk3yXz3Lncj1mRroMSiouz6UZDuJn8w/ZZPAIu20IKcz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=vinatta.cz; dkim=pass (2048-bit key) header.d=vinatta.cz header.i=@vinatta.cz header.b=CZPrCZhI; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinatta.cz
DKIM-Signature: a=rsa-sha256; bh=kpx6Uj9RIdUNjK8W3CnmyMzyh2ekBIwrGqDnhdzKB20=;
 c=relaxed/relaxed; d=vinatta.cz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@vinatta.cz; s=default; t=1779906099; v=1; x=1780338099;
 b=CZPrCZhIXkDoHB0cMhVJm/JiciH7dzJdwyLBNIe3/8l0Zq3QV7VFjYO1LEd+kDuYAthVAc6v
 9Phsze4RHJ9Wiy9dWqZUi5r11Ec++f5qsA7nGRjusmk7hxln5DUEsOKnpA2/zvZ9LMdttYtwoyk
 obUMhAA8pyd2d3p8TJdxtRngXAsD4MSuHOA2w5iCmS3mJjwGMFQ4EIGNj12WNFNtf7i78IRXvpe
 JEqKD5JLfzCf1QT+W+0p1tE0PQQ7dibqrscIPMku5iDYLpWuWEeYveIaDWU/huyQb4ixLw5hd7h
 EVuNnF/o8bxGM9wtY1p5oWRroCkzvfJ9ffBm6K/KgWwcQ==
Received: by vinatta.cz (envelope-sender <karel@vinatta.cz>) with ESMTPS id
 4f3f7766; Wed, 27 May 2026 20:21:39 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 20:21:38 +0200
Message-Id: <DITO1XL17NWQ.31DQEIXADGBND@matfyz.cz>
Subject: Re: [PATCH v1 2/3] regulator: Use named initializers for
 platform_device_id arrays
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
From: "Karel Balej" <balejk@matfyz.cz>
Cc: "Matti Vaittinen" <mazziesaccount@gmail.com>, "Marek Vasut"
 <marek.vasut+renesas@gmail.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Samuel Kayode"
 <samkay014@gmail.com>, =?utf-8?q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Andreas Kemnade" <andreas@kemnade.info>, "Kevin Hilman"
 <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <imx@lists.linux.dev>,
 <linux-arm-msm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-omap@vger.kernel.org>
References: <cover.1779878004.git.u.kleine-koenig@baylibre.com>
 <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <d02f55dfd5bdd743ae5cd76f2a5af0d346226a68.1779878004.git.u.kleine-koenig@baylibre.com>
X-Spamd-Result: default: False [0.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[vinatta.cz:s=default];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[matfyz.cz : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[baylibre.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33237-lists,linux-renesas-soc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vinatta.cz:+];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balejk@matfyz.cz,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,samsung.com,kernel.org,collabora.com,linaro.org,iki.fi,kemnade.info,baylibre.com,atomide.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,matfyz.cz:mid,matfyz.cz:email,vinatta.cz:dkim]
X-Rspamd-Queue-Id: 249715E93EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Uwe Kleine-K=C3=B6nig (The Capable Hub), 2026-05-27T12:47:45+02:00:
> diff --git a/drivers/regulator/88pm886-regulator.c b/drivers/regulator/88=
pm886-regulator.c
> index a38bd4f312b7..7328cd1cf265 100644
> --- a/drivers/regulator/88pm886-regulator.c
> +++ b/drivers/regulator/88pm886-regulator.c
> @@ -373,7 +373,7 @@ static int pm886_regulator_probe(struct platform_devi=
ce *pdev)
>  }
> =20
>  static const struct platform_device_id pm886_regulator_id_table[] =3D {
> -	{ "88pm886-regulator", },
> +	{ .name =3D "88pm886-regulator" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(platform, pm886_regulator_id_table);

Acked-by: Karel Balej <balejk@matfyz.cz> # for Marvell 88PM886

