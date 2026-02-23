Return-Path: <linux-renesas-soc+bounces-28387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6NdNEFI7nGlCBgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28387-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 12:34:42 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DF517592F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 12:34:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 170E63068EC7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 11:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10AB0361DB3;
	Mon, 23 Feb 2026 11:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="jtvUPGtb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A41361DA3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846349; cv=pass; b=H2GVN/Yn8j2aBSjuJwekon5NwbDpvRAEwHSTPieDtd9QU7IGePCbffuI6/7EwfVJ+SlA/3XT5KrpcFvfttQ8H2cOgs97lKUAcMpKwl4xDgpCHJi/T+CjdcUCOuF6Ytp1HZ/7nXm3SLEF8fHz/KjmlQRoyUuT/bH0p9lGFMuVcyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846349; c=relaxed/simple;
	bh=uHtxhZgqkvvhkDixZGvThzOeJrJuPZvcOjfb03f5dzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B8HbyFHh9z75yfjGkYhKGaZXOnTMFLIq1oag19G39oQ3CldD3emLcRw5l+SKxIcFZGqcQc3J7IV6EDoYOCu0F3tZmv9eXRIOnclioOnJGGEFGe24IvqLOOG4HE+d+1otqQpVKjMIfGgkxaQ2G40dxWz82uirFNqqXzGw48e7QKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=jtvUPGtb; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-649df393c04so3535490d50.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 03:32:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771846345; cv=none;
        d=google.com; s=arc-20240605;
        b=I9JppTCuhw2AsAT2MlbgjXokN0wVvkuFtXwmRiQAL8e/H/llEP67qCebpY2JoqGLb6
         XosACj1yr0KY3kF4URXdQgV1j+t0/lbju7YIBzLh1Emz3FQValasyvVupylrJ9m5Rzw1
         pSlaXkF5OOPpOMBkSFik+BWqdQtTOETXknbEUISfEe5iAANn7mweK5UYOVShsaPa2Jz2
         K8KZ7BJWjmY7Zh9n+9VgAHfDxqLF9Tl+fYi7NW1072pM4VqBE8QaFUzMKeJpnMcEiDIL
         iFklcYupIfy4Hch/f/K01/VwXYFuWrh/Ank7Pwi7PNWEeRfreHSxcAhMl2ZSIgLTimFh
         xQPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JV6MMROodIfNHs5yZIiROnA2XT+gIEtvvO+RXDqEFEw=;
        fh=qCAK1TnIpDNR8d+icd03NiLBjbHkKnPe9cGCt4HmfTc=;
        b=GczfIjKGIwj4yYDQDaxg6dVvgs/p3UJt1IyGUEuQN9a+WgvN0EEC1nZ+54KFTSwyGy
         kMRjH0nfqaNxA6CcQR2e6tdTeTHkje6+fyrW9cGY7xI9hdvNiCyWEM0kyO8AfGyWlUIG
         XFWqNuJg4dEo/Xo4D11xOu+4Bzp8Pb/muBBLKc22QBC1yneMQvmK0CFjgDHVN3wRCTgE
         vyA4xDhQXp2W1W+sKO6ZSoa35zBSNaSoP1ruwD2Hs3sXthAQDy6+hMXr+B0HOcTXgobP
         MgeXTXl8qDcRR8EQFeH3jmXy0U6Li3g/Qk50JxW4usFTJbNnmqNDGuzotl2UiWOANkLc
         3BkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1771846345; x=1772451145; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JV6MMROodIfNHs5yZIiROnA2XT+gIEtvvO+RXDqEFEw=;
        b=jtvUPGtbU2Wj3IxSdHVfaI7AQSst6+thnd2ba2zTb/HK23eB0wcplM4TJf5noWT8j1
         ge8ldNisA1GAvbE06Pm7tTe59J+DICve1TZzAcm+hcDMBSbqidGhRGyoChKHP5qz0N94
         6lPKDePnGkuhwYSW4jfj5UxApMpW6AVdVO3pHkW3BdL8kRZ+nZu6JbCIi6Dg3KAfr9c1
         NteUpZJJ/x71K8cFUedwQDypq1yxKjEGLc4tOKm9MCsZYKOPt72K70b+vt9xb7x1CYy6
         SElcFIvERsf7RiLwck3t7NjFJolmQ3rbFhdthU0HhXs5EfxgOnQXYv/T53AlWotxAmvu
         y7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771846345; x=1772451145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV6MMROodIfNHs5yZIiROnA2XT+gIEtvvO+RXDqEFEw=;
        b=OWP7nDdY8rXGyda7brFxyQIec+3hkcj5vzqc4ogTQSKNbxCBAN1I9kgPHQAI+ZQRPs
         Y70UE1FUwpRftSvwydB6AVsV0W44jv2IN7/rWTvdgcahx0WvYA0XrJYa4HQgk5knHCfF
         tkR8sNzHLE7yVkZcDCzyawE4SIoS/ulZd5AlwnrzmEgbxKEhQ01ZgB4L/jreE3Jhqsk4
         yuoUVyFbHxP3e8Hpug5LAbta0Nt4K/21chHSV4qsyaqLRkikL8zSPujeM7GzkFlC8mNH
         3I6qNt4a5OVDABZ7OhyhGxJTp6XjoWStlhcYW53PPQrje5M3cQIATAfg5rbGCKpAhHt3
         mkiA==
X-Forwarded-Encrypted: i=1; AJvYcCUMMp769Svcb2rADyr8+JFj+FQRmjxRsIhprdh+OixvzWw0b1PPXDcqkdX9kz2g8Doyc/KrstM6X4Cov6UcsVONAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YySbQVg5D/qQC88glkB7PAHY5nQ+35sdmmVlcP96ffEXQVdGWhr
	aClTYCPdbnE+2fJ+xIEhKEG7Kw7BHYBa6V26e+FsrKnIkJOtqROPvRsk2uujEYJcWB7Tr0FLrHq
	sgeV70LHf6mPsStAZOFw0gBEgVueqY2lGGNgPYSYxtw==
X-Gm-Gg: ATEYQzyzOrsVXTZDQJV9ZPsyWs9LJ8+loMMFYTmDhmZxLDf6kBnS2o9g8jxYgBFSj9T
	xMAukMhK4NXHdaXZ0bgYwrTvCBu1aoDBT5PGhG1WMr1lkAyAK5dHyuCmLxcGXiX1MCWS5M3KfFx
	/b0/Sk/91hthSZoCrKau0BwTVVDN7TZqOvt/PZcUMt0tCpjLfUdJsCLGS7MNQxb/SyvqYwC4nqU
	YQ7QFNw+Lg77t2G3qSW346SfdPcDT+2ShK0zdlVakWn8gkpNxbSSLZrrx7IjuY2PDR4wIu1p3nz
	dkx/N1dWw3vVSAH6Gmxm61XmAf7aj6PXycXekw==
X-Received: by 2002:a05:690e:1601:b0:63f:a7dc:5661 with SMTP id
 956f58d0204a3-64c789c7e4dmr4751859d50.12.1771846345547; Mon, 23 Feb 2026
 03:32:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com> <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 23 Feb 2026 11:32:11 +0000
X-Gm-Features: AaiRm53g18kb_D8a8Rz5gsK9_gN4L3-bPSeoZhzvicFe1V_X2f1sAQaShwQ_SAw
Message-ID: <CAPY8ntDgMHgjX65ZW8dFvo5jb+yZDUQq6cEJuw=zP6DddmTPrQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] i2c: bcm2835: set device parent and of_node
 through the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28387-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FREEMAIL_CC(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,raspberrypi.com:email,raspberrypi.com:dkim,mail.gmail.com:mid,qualcomm.com:email]
X-Rspamd-Queue-Id: 95DF517592F
X-Rspamd-Action: no action

On Mon, 23 Feb 2026 at 09:07, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

When used alongside [PATCH v2 01/12] i2c: allow setting the parent
device and OF node through the adapter struct:

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/i2c/busses/i2c-bcm2835.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
> index 0d7e2654a534e92a529f27fdc049812359678522..4f7e4a178b33fdd172657cc625a34018b18f88ca 100644
> --- a/drivers/i2c/busses/i2c-bcm2835.c
> +++ b/drivers/i2c/busses/i2c-bcm2835.c
> @@ -474,8 +474,8 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>         snprintf(adap->name, sizeof(adap->name), "bcm2835 (%s)",
>                  of_node_full_name(pdev->dev.of_node));
>         adap->algo = &bcm2835_i2c_algo;
> -       adap->dev.parent = &pdev->dev;
> -       adap->dev.of_node = pdev->dev.of_node;
> +       adap->parent = &pdev->dev;
> +       adap->of_node = pdev->dev.of_node;
>         adap->quirks = of_device_get_match_data(&pdev->dev);
>
>         /*
>
> --
> 2.47.3
>
>

