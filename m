Return-Path: <linux-renesas-soc+bounces-28044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNxPHQ2YiWlj/AQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 09:17:17 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A2210CD51
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Feb 2026 09:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B244B3004C05
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Feb 2026 08:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 465651FBEA6;
	Mon,  9 Feb 2026 08:17:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087471917ED
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Feb 2026 08:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770625035; cv=none; b=hK21Rsj24lUtPqVhv0vREUARFKXH4h2wbACLHcNwOKfZIx8jHbpheMGofRa+7AZlKKR9ToUVomCf5lAUIlid+iVhE+VUiJKHrGQ3rXtB4xBsxkLVYC4oUX1H7wQvpSmy3OV+rr5vAgYcOn3w65P1xzW/hiqUU9mb4Q9lHUOafg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770625035; c=relaxed/simple;
	bh=/zYgLPOAHXK4/exWmt8hOWg3cIDWG24Bmk4iX8O5iZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p3Z6UDhyd3HHEp1Z4pLFolYDei91Dbc/yq13lcHZV9hbBhapMVMnfi/VIqLHWUiwAiLSmq4LCkEOsbpZYIpO30kRhxH9MPKX3KB3zVdfYKJ+ubuPJIqBy3MYoCEXP4praI7SxIUyX2e+BVU98npKGi0JL8kvdbg6MxKyNcRhXf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-566474a6e10so2269796e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 00:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770625034; x=1771229834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2bAsoauLtymOFaOmBSRU1sXzH6MyMCHQePcHPtAadtM=;
        b=JiodYLitY1th+xS5zYbmm0nDNssBE0UPM6GOonTnR8Hr32/2AYyFmUPsuMQb0Y7b0M
         XLOtdRdR2wFSZt/DsYEy9hs0kgZOl+c+CweF3wy9cC/FAj2sSoS/7YXtJZRroP7QA3vK
         Q8T0STjueupSXQIYEirdTXVnPyyaWo4DbIkLq5+5t8eRnIN3kvtURatSWfIZhIaaJh32
         TQExX0+6MXzAp3rv53vZZsYrcsP5NeIxERxLIaSFLceDM1pjkCmZZXtoSnBnmUFaOSQz
         NY8PWj3Sbf+32xK8EoipKHvzfP6YhFLKVWsdENTBIC3sHnOlPEoXMxX1v8/1QUXWQ49w
         pydQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR98Pb6r4zFfi6js7H8IB/8mh4Fku1IRbcCEvNg4Hu1pXMB9LmUPKR52jhlUok6M/dV+bJmq3gamqbIT+3NpPmFw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzA3N/9M41J0x32KZTCCzXtfNMGV+ZGapGS14YvhzQJIQybUz76
	0C1waD584HLibcpmEh1KdSeFROSWPtGAZbi+tJstP7RWh4LAlThO0WNgS+SHIAod
X-Gm-Gg: AZuq6aLSwU4y7i+ii8OuAz2+zu6hkK8pC0xza6LD4kVOQnOPtHKYlN1O597qecBegpi
	ts5fVh8ShW+UsdJrTKI3yVzmx/0gM7aYvvBi0XfnRoGsmTN6QaRarXpVmTuyeEROvcDiKJLcwYp
	L8xfU5U7RJzIJhJ33Rl/MepPB208VP9k4UK/lTzaN16grtKzke5ynuUG3KG19RP3AcGL92+5xRz
	xol39ftcK0n2s9YNmolxmRh/9wOD79Ha4YT0HFuH8ImjwGv4GxBNcF8Au+UfIgcGAbIP4/2CcQa
	ebOpFJC4GnRY+b/9/XtsrKwOROdrQSm4kypgFJoh8e+GzoxnlRgdoRi0A0Ett5rkT4oua4VfHwD
	P7o33tEgHWRAsDLpv8de8N/fqBS09UIJoF2Ljjeyk7EpWdrh8jiKQysrU8MdMzIy92/AfOVBwLQ
	l4omPWk2Jvx31pjVmgYi9rOzgJzHUlt8YWEoICItpHE0yr/419
X-Received: by 2002:a05:6122:3310:b0:559:6b7f:b110 with SMTP id 71dfb90a1353d-56705e97411mr2722562e0c.2.1770625033914;
        Mon, 09 Feb 2026 00:17:13 -0800 (PST)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-567072e965asm3427888e0c.5.2026.02.09.00.17.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 00:17:13 -0800 (PST)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ed065f1007so1862277137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Feb 2026 00:17:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVr4lY8rWj5vG1z6iys3gfC6SkSoSbId4pQo/l4aW7x5GisddTedtGFoh2LDJzoeQMFJ88yiKn10McK/n0aatXp2A==@vger.kernel.org
X-Received: by 2002:a05:6102:5092:b0:5f5:3c96:983f with SMTP id
 ada2fe7eead31-5fae8a3ad9cmr3362584137.1.1770624619183; Mon, 09 Feb 2026
 00:10:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208-rz-sdio-mux-v9-0-9a3be13c1280@solid-run.com> <20260208-rz-sdio-mux-v9-3-9a3be13c1280@solid-run.com>
In-Reply-To: <20260208-rz-sdio-mux-v9-3-9a3be13c1280@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 9 Feb 2026 09:10:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV2a7uvtrJpSprU3YbgFSTmtKkMi+Z6j0m9-4vVXWK4=A@mail.gmail.com>
X-Gm-Features: AZwV_QhXlEX6D1abbrehjsrn3uf8WxyCcirF_ZvMoX3URB-GFlRdZjQEEn6kewA
Message-ID: <CAMuHMdV2a7uvtrJpSprU3YbgFSTmtKkMi+Z6j0m9-4vVXWK4=A@mail.gmail.com>
Subject: Re: [PATCH v9 3/7] mux: add help text for MULTIPLEXER config option
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,solid-run.com,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-28044-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.926];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,solid-run.com:email,mail.gmail.com:mid,linux-m68k.org:email,glider.be:email]
X-Rspamd-Queue-Id: E5A2210CD51
X-Rspamd-Action: no action

Hi Josua,

On Sun, 8 Feb 2026 at 16:39, Josua Mayer <josua@solid-run.com> wrote:
> Add prompt and help text for CONFIG_MULTIPLEXER to allow enabling this
> option thorugh the kernel configuration without explicit "select" driver
> dependencies.
>
> Select it by default when COMPILE_TEST is set for better coverage.

Merely enabling COMPILE_TEST must not enable additional functionality.

> Signed-off-by: Josua Mayer <josua@solid-run.com>

Nacked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

