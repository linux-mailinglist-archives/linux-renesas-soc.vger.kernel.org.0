Return-Path: <linux-renesas-soc+bounces-28407-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJA+OzdhnGkoFgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28407-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 15:16:23 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 95800177E4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 15:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBA73302D72C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Feb 2026 14:16:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3B60279DAF;
	Mon, 23 Feb 2026 14:16:21 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877DE142E83
	for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 14:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771856181; cv=none; b=CV1ILiRvM5kHZMiCyYPZocXWIAmVa95xkgk9PyLxrZlXQgMZiCx6QOPIx9Zh3poIXy5cDStcoHws5kKOHeNCX7Jlj8l4s5kAmDnsYMd7coN12VYpvMC+0/1Bn12u+wl8nnPiF7xje6GBeos4q0DeMbbkb0Gplo+D0gBA8+ILX3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771856181; c=relaxed/simple;
	bh=BPlCyTz8G/El4l0BA0OckJ22InPEejXQZx1TWREEqyA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b9epQWAryzmymVcPCWk4UmV9oBgtsmbMXoxp5N1l1jJfuFa+0ZL7QuaVScmg1eals3hYW49oYHtfU40I2j4X11opv+/LG6nDnEZ3+Jb3vfU5b1jCkqLBmneER911mDp/pPNHSPRSahouQoIerWdAliO46GUWdFFcQ1UIMlTEYw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-413c2977db8so2720507fac.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 06:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771856179; x=1772460979;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nLzVdK8lDfgaTPyV9xNjlD/1kxno0u/2SblofGNbVRQ=;
        b=CQSUC2m/qu8YqHK7IhdSMmMDd4GNBw3g0cs9d9DYlNhaTE83yOE3E8L+P+UrJ2jAB2
         cf7HisDvBdIC4JT9A777Zt1imeZmhOGcm58/sqe9ToFHZ+ocMuEcPfoCAGrbS5wQub5u
         hUGdP+d4je/vsbdBEaBDOIB8RK3m1hYCPCo98nbNx+aXIHr4R6SweDhh3EmNLsBHwlux
         lzbM4MEwam/krDR5G6/wMja/fDsRjsH4wQCWJttJs+xmcNYpJstVMvoKCE66EG45l7se
         jLcypH6z2vXY6VSgU8j967T7Kjr1UHjbLhP8V1pHqCI0YiBVGbr4qIqBH+EH9iBhKsxq
         JvKg==
X-Forwarded-Encrypted: i=1; AJvYcCVCopX/t0WrAuypCWyx+iHqLaHKFzpknYch9UCFvXGgMQcB0FqifS0srqjjTvERf8WynQAIQKFRzXLsZDlxFaN40Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzK8FHbnU867s1tbHqxKQ4XMS27qKccXReEjAgQ743f4S2hRUN9
	/na23hhPQIpM6mg0CSoUfAUAtKWVGdz3uKqZwEEk/P1VK7nC486H9AEeMfd4bjyu
X-Gm-Gg: AZuq6aKPb7qXNAPAzkCBP3KNbx+BSo/y0axW0U+z94Z8iyGyMC9V1PV/vp8P0ss/9i7
	Gk69xXI6/G+6FVDoswPLip9AA/dfqIaQYPUi4Z2qn9Wt0AFnJ54C6McN+yLf9DmxI6ZApWB5/BI
	IML6XnSwj7KnZRSMWd0osDsRl3z2MkxfU0BkpSsiTfRtXmsK/yCZxAOtCfMh/nV1o/2eioc7z9y
	S72AeNSiZ9INHHLMJ6gdvbJ6ogSCFhpeeMUJK3NusNME+EPrgd6l3HVZuPmvK5ep78p1CsF9Gk5
	NCLvbvuOMrk3VH+msXJlV5CHdcM+am/nQ4zYgCElhaqKAiYT3+1K9vGhDHarL8FCLrav1EerKYD
	hSWMCfV2Y/vuYlG6qlPXMmcR7vmR95aF6GXHMNySMQw9sTAJsEMlygfc6eo8NQT9WTF5rVn984V
	AgtJIymoE05Uty5eYo7Cl5kJz4Ua52WOYQ/l5awA4WwQYMFgDZVyYaYPc7/x3K
X-Received: by 2002:a05:6871:7bc9:b0:409:76e0:bd84 with SMTP id 586e51a60fabf-4157ac87cbcmr4167717fac.24.1771856179408;
        Mon, 23 Feb 2026 06:16:19 -0800 (PST)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4157cf9a231sm7576733fac.5.2026.02.23.06.16.19
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 06:16:19 -0800 (PST)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7d18a9d2b1aso4125357a34.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Feb 2026 06:16:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWy2DUf0MJ0VMCh6U85ghrAYvh9Z5modKBPN8KU4tmkxo87haAOP2roCLghqWk2Np0FYrZe7mjF0IN1BHoi/9q4pw==@vger.kernel.org
X-Received: by 2002:a05:6102:38ce:b0:5ef:a346:a020 with SMTP id
 ada2fe7eead31-5feb2f081dbmr2742454137.17.1771855750377; Mon, 23 Feb 2026
 06:09:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 23 Feb 2026 15:08:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWJCc-UeaJLM4dpDN=toDvteXFvOFpTm5AbvNoKf3rTqA@mail.gmail.com>
X-Gm-Features: AaiRm50V2ONm2B9njU7ZJRcOuR4Nb8zI5Hsqj9aPxNU6M55eyuOZ1HhwjvL4ass
Message-ID: <CAMuHMdWJCc-UeaJLM4dpDN=toDvteXFvOFpTm5AbvNoKf3rTqA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] i2c: configure parent device and OF node through
 the adapter struct
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
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,broadcom.com,ti.com,iki.fi,gmail.com,atomide.com,kemnade.info,baylibre.com,glider.be,foss.st.com,pengutronix.de,nxp.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-28407-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.980];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: 95800177E4C
X-Rspamd-Action: no action

Hi Bartosz,

On Mon, 23 Feb 2026 at 10:06, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
> Changes in v2:
> - fix a NULL-pointer dereference in gpio-rcar (Geert)
                                      ^^^^
I guess that is bound to happen when a GPIO maintainer touches
the I2C subsystem? ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

