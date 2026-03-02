Return-Path: <linux-renesas-soc+bounces-28640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 23aCNEGxpWk8EgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28640-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 16:48:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F53E1DC24C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 02 Mar 2026 16:48:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA8FD30378A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Mar 2026 15:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C03411627;
	Mon,  2 Mar 2026 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u4Z6EXBs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923E441161A
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772466192; cv=none; b=upRilgJuhqQb0uuihm0azP5F/TwDBwv44/jAAfRwsJIz81XPLfS9J4lphMCM+wG9bXAS/tfv3CmDULREOVvoTG9UYEOMjra3AbTSr6U9EHCUfO8+xNckmY+WtmRQVxxP0m2jVH/myIQQhjpavFZSGLwJW0T2rXiXPem8M/N8R4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772466192; c=relaxed/simple;
	bh=NYYtAmlTRII+aT4YTVrTRvC2DVAVLf9Fp6itPFnhyig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hn78M9yq00sRRK4DH3rodltTgwxdlmE1PWwlhdDFilfBzAIMRP90/wvQxeGbeM0d/IeeLg+PWVQTNOw6wcCD68PrPNDCUS/FsfNma+SAB+bdHnRARuwA1HhmMS8w2VZw53IhAMgiqjGAeoWtqimhduVaWPgMztRn0s468MEZZxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u4Z6EXBs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74E37C2BCB6
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 15:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772466192;
	bh=NYYtAmlTRII+aT4YTVrTRvC2DVAVLf9Fp6itPFnhyig=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u4Z6EXBsWrGIvbVtVDs2CcXUVPD1z1UII8ZrJ8CHFyOaYhSqs5pRF7l4NrWxWuxo5
	 GLbo7j968ZBz3SmstCj3zyX+kiIluz8xKmAYue77NNgve/51WK5TVEyEHb48bUC6Yd
	 +z4Y7iW+P8nUx7fi/qe/cA2balaQFaKQDUyP5101EzR0XWQjW9CiNV9eeEwiuJDOKg
	 Qr2/9hfokq9uLvjA4/cc4EQyeztXu1KOex6iEoIONDAaZ6Tp1Y37tL1Ua+aNzhw4+W
	 UhCWqJ3JPTrgsnaabrPXncAbTEniBQE3b+GWv7RWvYBtFOlmEKiYPqSr6Iv2PuY/Yk
	 7lPikg9iAVncA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-389ff3f41f8so46991391fa.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 07:43:12 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUFuL1NhM9LDB269s1Ue+e5un+q8x2c4BbVBOtS2nPnGlMs4nTXBtXnQUhNlCevpGC1dN+IdUpjwKiYdPa7vw/TOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo+G8DHFBVEiBr6RR4K/b/z0CkkttmITaqmXp9ijhrhu5Xo9kD
	8iwvm2KTqLakIqUXsNt6B91HhLlqbx2E+XrBQUurEM1HgHas3qxVMgl6eRpR/kHiMQL1hTrjdhV
	LZgfeurbAFohYkLnzZLHjji3A9T+Hy4Pck050p910hw==
X-Received: by 2002:a2e:b891:0:b0:387:da4:1664 with SMTP id
 38308e7fff4ca-389ff36c5abmr88837761fa.36.1772466190790; Mon, 02 Mar 2026
 07:43:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <EDF3FB58-4747-442E-8463-6F1C6E568962@gmail.com> <20260302160923.53abf2ea@kemnade.info>
In-Reply-To: <20260302160923.53abf2ea@kemnade.info>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 2 Mar 2026 16:42:58 +0100
X-Gmail-Original-Message-ID: <CAMRc=Mcg7_MAGA2_Ue7etOHvLOxpRs7aOBHxRM3AdAHyscFxDw@mail.gmail.com>
X-Gm-Features: AaiRm52x3shdJxbM6URWEGFBH14dpZAQC7dlrMWm0mp4oa5cHSJhvWQjaHcwLdY
Message-ID: <CAMRc=Mcg7_MAGA2_Ue7etOHvLOxpRs7aOBHxRM3AdAHyscFxDw@mail.gmail.com>
Subject: Re: [PATCH v2 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Kalle Niemi <kaleposti@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Branden Scott <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org, 
	Matti Vaittinen <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 6F53E1DC24C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28640-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,atomide.com,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kemnade.info:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 4:11=E2=80=AFPM Andreas Kemnade <andreas@kemnade.inf=
o> wrote:
>
> On Mon, 2 Mar 2026 12:38:27 +0200
> Kalle Niemi <kaleposti@gmail.com> wrote:
>
> > =EF=BB=BFOn 3/2/26 10:55, Bartosz Golaszewski wrote:
> > > On Mon, Mar 2, 2026 at 8:47=E2=80=AFAM Kalle Niemi <kaleposti@gmail.c=
om> wrote:
> > >> On 2/23/26 11:05, Bartosz Golaszewski wrote:
> > >>> In order to stop i2c bus drivers from dereferencing the struct devi=
ce
> > >>> embedded in struct i2c_adapter, let's allow configuring the parent
> > >>> device and OF-node of the adapter directly through dedicated fields=
.
> > >>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcom=
m.com>
> > >>> ---
> > >> Hello,
> > >> Automated driver test system bisected this commit to be the first ba=
d
> > >> commit, linux-next next-20260227 was tested. Failed tests include dr=
iver
> > >> tests for ROHM PMIC and accelerometers, which are connected to
> > >> BeagleBone Black.
> > >> The failed driver tests all fail to first i2cget and the tests stop
> > >> there: "Could not open file '/dev/i2c-2' or 'dev/i2c/2': No such fil=
e or
> > >> directory".
> > > Wolfram: well, now it would actually be useful to know which commit
> > > exactly is the culprit so maybe splitting the changes is not a bad
> > > idea after all.
> > > Kalle: which i2c bus driver fails here? Any errors in kernel log?
> > > Bart
> >
> > Hello Bart,
> >
> > i2c-1 and i2c-2 are failing. I am not seeing any i2c errors in kernel l=
og. I got two failures without the dmesg available (this is bugged test seq=
uence, and not a kernel crash), but those got the same stdout message "Coul=
d not open file ...." as all others.
> >
> Probably I am using the same host driver
>
> tested on OMAP3 DM3730, result: i2c drivers get bound to their devices,
> no obvious trouble. But controllers are registered with high indexes.
>
> localhost:~# i2cdetect -l
> i2c-3   i2c             OMAP I2C adapter                        I2C adapt=
er
> i2c-4   i2c             OMAP I2C adapter                        I2C adapt=
er
> i2c-5   i2c             OMAP I2C adapter                        I2C adapt=
er
> localhost:~# uname -a
> Linux localhost 7.0.0-rc1-next-20260227 #27 SMP Mon Mar  2 11:56:27 CET 2=
026 armv7l Linux
>
> Regards,
> Andreas

Hi! Does the change I posted earlier in this thread help?

Bart

