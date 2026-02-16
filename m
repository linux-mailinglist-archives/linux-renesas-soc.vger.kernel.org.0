Return-Path: <linux-renesas-soc+bounces-28236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFqaKwzrkmlSzwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28236-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 11:01:48 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3C01422D3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 11:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 21F6C300FB65
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Feb 2026 10:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5539121ADB7;
	Mon, 16 Feb 2026 10:01:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECE99443
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 10:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771236105; cv=none; b=HjsD/pmCVcAYSQVVn/BtUrEExKQncjvy0SeadIwDZysVY5JOkmwrPzX0EUX+07FWqtXXGo6f94LCVl5V4ikf/Qfx5ZAUlTUC+shV9vSJylzzVoIVV5/wSoZLxE22KL5dd49ikaxKJ4XvhfCwgCYIeafk3qDzK9zBvpZeA90y8bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771236105; c=relaxed/simple;
	bh=qIHY7cCiEnGtwkY7aFFwE/mZ8uiiY18ecDxBJTYhSwg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MkkIE0JfUh11qQafdpDaCz8/VbywMBkXU5YVk7KxMHkQm194crV/BaGvuNQRhu5JhR72slrl8T0fUK+jNzBb8naDzijemp5tLc6vzFZyi2qZo3guGl/Uh/hO20TQPaC+28mY3z+T232b1WRxvUfwz1pS7Lxtt+m4Lhck0Mxlklg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9489d087bcfso1711965241.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 02:01:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771236102; x=1771840902;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8QwpdPffhWm62Ds9NyNo/SaQsJWiUgFomKDnAW7WiSg=;
        b=I+TNpNhb2vzlQ0i6xMGoTeVzrO5FF9WLwKJg4QtWXvT8cgCtXd0kCfcXBE3qsylElt
         0Yj/NxSVe5duaJ/0GArncCN3EnF4iXqOUi/y1BoL6Fkfwi8nkBmXFglxHs0zWmACWj7Y
         uU0G6yBZC8XqBSIb1oBh06c0AadZaNQYBK7ywkOvb3S/fyw3Sqy+wlyHceDBlcTD+CXj
         QLAD3OBPT6utpCjW+fUOBPhsTQOizUlJOPMVoablZ2KHBCAxsIIrIcOUQ0l9fDdaVBdR
         sTGTxKyP1jNUTXf9LMfvfFffHBylPVdkOzwYEM4sU8quZHPoF3m852WAN0RSaCY/nLWU
         4RHw==
X-Forwarded-Encrypted: i=1; AJvYcCW/fcutr/Sh+4Wu4jJwKXbvsNbP3zZyCtw1louUIoDLIdHX5cZAjwAwgIn26G6luyFVcVu1/gRXoht2PkvJz9fX3w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSvccbQrbCcaKivifcT2NPSZZeWGXrktux8xpRiCh5SH3b239c
	dsmCoskZv25LKCDXi2JUTwY7ydAisxxjSanV9gLIt9paIkA7Snd3sV+csmw5QH+x
X-Gm-Gg: AZuq6aIIy06Kg2yI6FtSTJqSeNtsWB3na+jA+zP4kDhuWw46oIfDRDnauzSnOocfqHb
	g35PZLeSoQxkMpBULvEl2nzYedhTkPH9u/obCQa8K8fwWdic2OrdIyWQVC1t+FnJf8xNaIJ0FWL
	s/VQRu04DLAk1NkYd8WMMWfIwb8CccSw+SJKmpP4hObOdjDAdZkscyGMvYcJhjMiZMzJvCdm5Go
	LLAgv7tCR+v7TVFpavn14BpU1PMOCqjiX2ZKfEAqMfwTuLkRdWHu82zGcYWd7bG4RUEOF9QTxI4
	j3A5z2lgQAW3iJhp3F5mE2k7urF28LKoJQa3GC1RanHO9Qr83rf3NwNv66VspBOOtSO7lle6AiA
	rRAYsTXVh5pasB/hxYHuPcDZVK913KfbfLL5AfckD58rrSGKIHFW5uvgA0ZpJj5I4Vqz3fvweX/
	ubd5pZj72IqE6jMtZsCnW08WO9fuEK8VrH1xAhodUAIofmrr1M16BgzwUycP4jPhB8
X-Received: by 2002:a05:6102:2ac1:b0:5f5:3c00:1813 with SMTP id ada2fe7eead31-5fe1ac6da2cmr3839435137.1.1771236102646;
        Mon, 16 Feb 2026 02:01:42 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5fe153b3231sm5029521137.5.2026.02.16.02.01.40
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:01:41 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-566390e7db3so2245422e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Feb 2026 02:01:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV+K2p5sUzBZYBpv45i7jePV6JiFIf2JVEjDTlXkiPdoYGI2eTCVAFsWbDJ8gxp9rgOiJjHd6aoJOhzbsiYK03sDw==@vger.kernel.org
X-Received: by 2002:a05:6102:cd1:b0:5fd:f145:b88a with SMTP id
 ada2fe7eead31-5fe1afcd3b7mr3584435137.40.1771236100546; Mon, 16 Feb 2026
 02:01:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208-rz-sdio-mux-v9-0-9a3be13c1280@solid-run.com>
 <20260208-rz-sdio-mux-v9-1-9a3be13c1280@solid-run.com> <20260212164823.mbeycqwzsy2dfq6e@skbuf>
 <CAMuHMdVOqovkugmCnR4FOfk8VkQyN_dmyKFzbsOSN0mPKQedeQ@mail.gmail.com>
 <f9ede0d3-6a37-449c-b62b-a5c761ece097@solid-run.com> <20260216092914.kmvl7aep7dantcsd@skbuf>
In-Reply-To: <20260216092914.kmvl7aep7dantcsd@skbuf>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 11:01:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUH4W9W2uNknr41AgVQfO7inwZP6BfuMatyEUvJtf+Ueg@mail.gmail.com>
X-Gm-Features: AaiRm50a7dRj7dLKtMGILEQb14-VkaVzM5nFFHi-S8Lj08OYuJXTfF9bVPV6HRk
Message-ID: <CAMuHMdUH4W9W2uNknr41AgVQfO7inwZP6BfuMatyEUvJtf+Ueg@mail.gmail.com>
Subject: Re: [PATCH v9 1/7] phy: can-transceiver: rename temporary helper
 function to avoid conflict
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Josua Mayer <josua@solid-run.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	"linux-can@vger.kernel.org" <linux-can@vger.kernel.org>, 
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28236-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_CC(0.00)[solid-run.com,pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 2A3C01422D3
X-Rspamd-Action: no action

Hi Vladimir,

On Mon, 16 Feb 2026 at 10:29, Vladimir Oltean <olteanv@gmail.com> wrote:
> Then there is the fact that local definitions of devm_mux_state_get_optional()
> keep popping up, possibly in unrelated trees (not the case here). This seems
> to be a bad practice which should be discouraged during review if caught.

This was done on purpose, to (1) avoid having to make too many changes
to the file when a common helper would be introduced later, and (2) make
it easy to find all locations where a future common helper could be used.

The alternative is to use a completely different name (which is thus harder
to find), and having to fix up all the users of that name too.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

