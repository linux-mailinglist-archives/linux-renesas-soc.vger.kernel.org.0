Return-Path: <linux-renesas-soc+bounces-25978-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A88FACD60A5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 13:49:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D3273016363
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Dec 2025 12:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C77313E36;
	Mon, 22 Dec 2025 12:48:36 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2D92D248B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 12:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766407716; cv=none; b=uw5eMEUpr4Eiaj1MFlDPXSDdAWwkQp26XsskrMFQBvNSrKmx1UMAeA6aq9Pr6ydc8qpMEpZyHgTFJMzAa7tKkKusqG37CZEi7Fc17svSVtqFmqQAr1WPGvCPzBj9h9zGo1COdiDmCsLCRh0RX1vlgvyjTOxHDHu3pjlDE2rHT8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766407716; c=relaxed/simple;
	bh=Xp2JxaURk7cqCR/j5M2KjzDOwxRykTFTwS1VU/qCsh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eh9pArIl5tLydIQrxNMcQeZ/Gmseauv6ZKvTQxsvR/QC8JV0mBrkE1Wp1LdY+MhPQ20M7m3TZXNADM+s3M5QQHHIVjGXeWjgo83fxqPWjfkTg1LEMq05UdA2iW0nQ7bB2PkxeVYEWPmb440g1orWISi3o2nfPQUyaGiwOU4nkyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5dbd9c7e468so1591386137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 04:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766407713; x=1767012513;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VgM9E2RUaWwSmEYTs8cEM73rjhci1votspeG4LjZ3Jk=;
        b=j6t2Oin7VVEmwSMvuDQ/BMVwL3IWU4U3eUGwd61SbP3BsnbDKFu2tYTgC6Ob2gCZAu
         FqxNJbLyNkCwCd8tu27pu1nCBLBE0gwlb5M0/rwHsVOiztPSp98iJIONHLQMXQ4BTL8V
         09PRDe+1BKPuX8tACSFYXOHOJUi92CSB9bVs0CaZCCd/CMtFJqqxmf8/UfA8P+dfuJ6l
         pINimJq9BAfGhIfqHfj9+eAQ82IT0vS9qWMkrnzCR+FY8fkGwo70yJQ4ZGf1rHZXNenP
         0tWAZpJmTWq4C2Mtwv0K/WozlcSa+zci2SuPRcnq49MY1znkmqH7B3hSZQDES9DpyDdP
         1zhA==
X-Forwarded-Encrypted: i=1; AJvYcCXqZosZHtjAjRg5V5AFUjH/oyPS6CLhjKahSMnuOm9MNsGAIJVGOoyUz0R05oThOfNkn8mkS6/uq9jyQrQ1eYjGLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEseha/eEqSL1CYtl6qOzw67T8BJybIq0KwYMUFOPQO0C493m9
	YvVc0zlk9vGw4+zqVJKEhlw/BBuE8kNcgwPqC96Ic9e0XLFXB11aT9bDuaqY4vsB
X-Gm-Gg: AY/fxX6rLTHAy4dHCBWlnqoK0ulOLqN4MTYaiIkPnXufq3YMYX/5xJbavIjsV3iNmWF
	kFX1S6GObzYCiHnRyNE+ZgV0EYle7rk8SJPl3mA57grmkvt1nuADpiO7B8gCNieaau3xESMXeqS
	2ShzVHa5Dtn69Xsa1/Ee7o0PDTbBD+UZmecULJ/iQpi1w25xE+gDRXjKX7rvZ7s8kdxGAXCbdIq
	DMlrVEpgffyiNkfBivlaVsLV4iQKmgb4unE2kxtyI5A6B7S5mjIYPwjkGeS4dcSIgojA4FnmWX8
	GUJs74RZJta4fzSwtG99e71vhwJM74hS53dyzifdmvgZgMvKf2O5XVZDNnlUrFQsPwjrCIIKh90
	PyVBSs8PHXaNFqxDut/SIkzhNAhjxNYRyZyw1LLVGtVNkMPq5A0LCrv0+YNUQR8tvI/H0lRrbEl
	+eqNK83huKTpCf2LA//Dlu4yOG7YtG9f95ODi5vJhBFSHVuHOHnfVA
X-Google-Smtp-Source: AGHT+IHsvli7oeA51wAkf5xVN0LShu41dxiKi2slP95RkP5UEXfbxjmAiHr8OARakD7/7aasBcpFxw==
X-Received: by 2002:a05:6102:54a6:b0:5db:d096:ba6e with SMTP id ada2fe7eead31-5eb1a828c39mr3116361137.36.1766407713247;
        Mon, 22 Dec 2025 04:48:33 -0800 (PST)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9434176bf72sm2998892241.10.2025.12.22.04.48.32
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 04:48:32 -0800 (PST)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-55b26332196so993239e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Dec 2025 04:48:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVg5WSa4le7Dy/JwCJbbuLVc3wWeD6mNY/aelAESWDorUGqYMziog82HC7gjdmZyivNrU16U+Dq8J9xGL4eKRB3hA==@vger.kernel.org
X-Received: by 2002:a05:6122:a04:b0:55b:180f:fed6 with SMTP id
 71dfb90a1353d-5615be677b9mr2876994e0c.13.1766407711710; Mon, 22 Dec 2025
 04:48:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251219-schneider-6-19-rc1-qspi-v1-0-8ad505173e44@bootlin.com> <20251219-schneider-6-19-rc1-qspi-v1-7-8ad505173e44@bootlin.com>
In-Reply-To: <20251219-schneider-6-19-rc1-qspi-v1-7-8ad505173e44@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 13:48:20 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBwZW1JCrtpYe7mc55FzEv0BZOWC5NNNVejxXSzDLCpQ@mail.gmail.com>
X-Gm-Features: AQt7F2orBW9lxEBIu81Xb5vtVrPMESy_KNg1aazPhtOsl5NUSmaZ5WtqS55gX-s
Message-ID: <CAMuHMdVBwZW1JCrtpYe7mc55FzEv0BZOWC5NNNVejxXSzDLCpQ@mail.gmail.com>
Subject: Re: [PATCH 07/13] spi: cadence-qspi: Fix probe error path and remove
To: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Vaishnav Achath <vaishnav.a@ti.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	=?UTF-8?Q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Santhosh Kumar K <s-k6@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Pascal Eberhard <pascal.eberhard@se.com>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Miquel,

On Fri, 19 Dec 2025 at 20:23, Miquel Raynal (Schneider Electric)
<miquel.raynal@bootlin.com> wrote:
> The probe has been modified by many different users, it is hard to track
> history, but for sure its current state is partially broken. One easy
> rule to follow is to drop/free/release the resources in the opposite
> order they have been queried.
>
> Fix the labels, the order for freeing the resources, and add the
> missing DMA channel step. Replicate these changes in the remove path as
> well.
>
> Signed-off-by: Miquel Raynal (Schneider Electric) <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/drivers/spi/spi-cadence-quadspi.c
> +++ b/drivers/spi/spi-cadence-quadspi.c

> @@ -1995,7 +1995,7 @@ static int cqspi_probe(struct platform_device *pdev)
>         ret = cqspi_setup_flash(cqspi);
>         if (ret) {
>                 dev_err(dev, "failed to setup flash parameters %d\n", ret);
> -               goto probe_setup_failed;
> +               goto disable_controller;

FTR, this conflicts with commit 9f0736a4e136a6eb ("spi: cadence-quadspi:
Parse DT for flashes with the rest of the DT parsing") in spi/for-next.

>         }
>
>         host->num_chipselect = cqspi->num_chipselect;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

