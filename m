Return-Path: <linux-renesas-soc+bounces-28623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLTJBRRqpWkaAQYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28623-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 11:44:36 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5E81D6C2B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 11:44:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32AF1305FFF9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 10:38:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50994332ED0;
	Mon,  2 Mar 2026 10:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N4naTIpw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2383328F7
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 10:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772447922; cv=none; b=pYmlzDs5lZtUsWkh0YLoYR8Q7FwgoeY3dDppqUriNYkR1JUAVJL8yqcz24knhBGQY32iyLZtw0EjIr7rCL8FbsBCf3xyx+9++/zVJTC4vxNpce62zd01GyZMClMZrUdSI+porP8zPgGbWQyfqhwgLNV5Q+3BjAK+tJ/PQq/gmtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772447922; c=relaxed/simple;
	bh=+dPP0pKLmuyRQWGO2igjZ68hfj2TtOyctwG0bH8SJm4=;
	h=Content-Type:From:Mime-Version:Subject:Message-Id:Date:Cc:To; b=MkWDX5jmUn59BmShLppHjGeC8rq43ZdIj+tx0wIdZ10+777ETSmRbdCbTYH6hW+QY+8o8mJORFhhmQNrfuua/JI/NtkCGggNSjZlaqJqekXxp/a6YHCgkGmnLV5X/7CWXcwFDM+rYhiJZZMPsjH7u/iODFfj+sikEuYIuKCQ/DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N4naTIpw; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3870dec27f4so4979411fa.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 02:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772447919; x=1773052719; darn=vger.kernel.org;
        h=to:cc:date:message-id:subject:mime-version:from
         :content-transfer-encoding:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dPP0pKLmuyRQWGO2igjZ68hfj2TtOyctwG0bH8SJm4=;
        b=N4naTIpwcuC/qx5sfNFTxitY68Caq14zq82+r0fa4bspB+RVdfAkTmN1qL/74nlshO
         mPnbQK9OXtyqewDgg0ffLhxkkLEOvtM6TyHdesDRA2nceA6I43RCI7SDQRIxIEso2+qi
         Q4rlDkYmAsvIhjc4YMpAbU84RSQt/ZofK0kiEef++PK4VkNbkU+stXzKWCSihkdDDSfb
         UjQ2izI7vQbm14WiqniUM5cBLxgl51H2wM0VXtVn5EW4nsPtPqTF5y169vDimbIYbs6x
         sf0n6+NQCmYA6xXxxLcsnmY21g7rzxKAgrsHXNqrqxVwnSjMFuvJ7eYdvutr0UKxT/C+
         3TgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772447919; x=1773052719;
        h=to:cc:date:message-id:subject:mime-version:from
         :content-transfer-encoding:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dPP0pKLmuyRQWGO2igjZ68hfj2TtOyctwG0bH8SJm4=;
        b=glTPge0wctML//l5pxqfmF9gHo+soNbWDfJ8evZC1TQyd8Yu0nrHSjQ5y7z45kLSxu
         Ap/BGNXQno9NPR9PYlsoKzWIXv8G7tqoUUPkDkf32/TdREFFGS161JkmCM2nvYNOk0YH
         hRjmFW3wrFvhx6X0LFhYRIDSVqRRG2sZoI48NhjiukHhI+hQV1GWqiyqiyp8wBQYgO/w
         LT1vHFSpbMVyowqInava69M7OmDlTdwnD/Q87UbMj0a7dYzKc6mvpxd/BNaW1tCVw9g+
         n34OCsniiaZp2sYRLOVhodb1sbiL7clSXteVfE0asKpj4IBb+mJmUWQUtqG9ah9ZX+av
         USZg==
X-Forwarded-Encrypted: i=1; AJvYcCUjQBMCEPRnoqCGJfLlc4vIe0mhB8a7vLG3KShwjeuOKhgnBIX1RDfP9K+p43UraVAnu/upCiSvrnGtrvFRTIw1/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt1CRzIQzJDl6ib9L/+FCcuIdyWSsGmdfQmVsCJlGW41kp6iUk
	fO0bExIJ87pFf5PVWcBsm9l32Geh3zZ0aXbmGgGBOvbaeLRN7rdcl7mr
X-Gm-Gg: ATEYQzwyotCj+LnEFWYcqrZp0YMtxemi+xIVhAtnB5qfYl1fGeu76ohBGNV4Q4Klv7+
	jcuIZANT6WDq+KnBxTN41nvkvbLLzVfKKD117PTPGXfQBfeN0qtoMAx/yfB6O6VF3+5/EgfpqZk
	HlSDauFKiRFzfgs8TV2bpYbhe96cdjLkudV4dWR1nqw47PQ6n148USeDD+4Vy7APWno70palb11
	cBBV+8dDWB1vs2aLwiBKiIdYdPM5CYBgfKeFn7Dgn20h1daeZnwWxM+mCTWshJbvi+or2nWj1JU
	+vSIZeqLA40pm3CeUwBORJqWZbm8w+w50x4Y2Z1EAG1IQbiEN3eFEAI3qIoSG8npS8l07MPesOR
	4Nv8HfQ8wpXJl2eArh917X0cM3dz30ETFaEeQnJ2OuBRUJtSxs3v1vCgJgKW1NgnMPnqAb7IT/B
	ZUao63df4Mbl0rAcL5z60cgoijpV1AGABFXP4ZXpAG/tb5dCygv9zdkf81HR02LiJsCG9I7UJTT
	mioy85xqtYc
X-Received: by 2002:a2e:b018:0:b0:37f:d9ba:747 with SMTP id 38308e7fff4ca-389f1d73cecmr67253571fa.5.1772447918848;
        Mon, 02 Mar 2026 02:38:38 -0800 (PST)
Received: from smtpclient.apple (mobile-access-2e8433-189.dhcp.inet.fi. [46.132.51.189])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a116de019esm1424664e87.3.2026.03.02.02.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 02:38:38 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Kalle Niemi <kaleposti@gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF node through the adapter struct
Message-Id: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com>
Date: Mon, 2 Mar 2026 12:38:27 +0200
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
 Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Branden Scott <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Vignesh R <vigneshr@ti.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-rpi-kernel@lists.infradead.org,
 Matti Vaittinen <mazziesaccount@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: iPhone Mail (23D127)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	FAKE_REPLY(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28623-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	APPLE_IOS_MAILER_COMMON(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kaleposti@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7D5E81D6C2B
X-Rspamd-Action: no action

=EF=BB=BFOn 3/2/26 10:55, Bartosz Golaszewski wrote:
> On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.com> w=
rote:
>> On 2/23/26 11:05, Bartosz Golaszewski wrote:
>>> In order to stop i2c bus drivers from dereferencing the struct device
>>> embedded in struct i2c_adapter, let's allow configuring the parent
>>> device and OF-node of the adapter directly through dedicated fields.
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com=
>
>>> ---
>> Hello,
>> Automated driver test system bisected this commit to be the first bad
>> commit, linux-next next-20260227 was tested. Failed tests include driver
>> tests for ROHM PMIC and accelerometers, which are connected to
>> BeagleBone Black.
>> The failed driver tests all fail to first i2cget and the tests stop
>> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such file or
>> directory".
> Wolfram: well, now it would actually be useful to know which commit
> exactly is the culprit so maybe splitting the changes is not a bad
> idea after all.
> Kalle: which i2c bus driver fails here? Any errors in kernel log?
> Bart

Hello Bart,

i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel log. I=
 got two failures without the dmesg available (this is bugged test sequence,=
 and not a kernel crash), but those got the same stdout message "Could not o=
pen file ...." as all others.

-Kalle

