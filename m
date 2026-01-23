Return-Path: <linux-renesas-soc+bounces-27330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDzYLXZ4c2kfwAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27330-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:32:38 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 375E376487
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2A3183016D25
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CDF030B52B;
	Fri, 23 Jan 2026 13:32:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F674231845
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175155; cv=none; b=oHXPMoKywdhIwvznkoXZlRXaDLgOfCvFVAm0KhX7uHIJ3DoPj+eMwXtU2jAmZ2p+H5RrSl/4ZX7gw8PrbUU5CX/NuBHSstUMzzEEYLYAhOphuUQ/tvlHXuaIee/wz9DrI/Dr77frlC9j1ncAwWVVIUFq0mBf4guzXZF5pOMx08I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175155; c=relaxed/simple;
	bh=W0zpmMbe+WvioRjE44xS7zUUzI81BLkbMT72TBI9N0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5bsbbpN7vGdDI6yK5nVGsroU9H3kRvUGHt98racwYcQHKsaKpWDUftcxFystOAJv4SJPqwLW7p2A/uIHRvYis9/HyXwnm39XluqsfM0oBAz42v+P3QFRRBnJTZhzNk2JygQwT65xNGWVCGCMeeWMKLR/aKB2x7jslbZLw+Ji9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-93f56804894so1641795241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:32:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175153; x=1769779953;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFcVCUbs6+A4DjohoDcTbMd4NWYz6AemlNmvZZNsXj8=;
        b=atluBRSq+B17gmTr45cx+jYAnDV7V0TPpz1HUABrSmZwknEEqEFsj9IWodk0bfYOTk
         fUOUx9/zDRkzMUE7QVZ53fcgxavlXf2wuE3zWZRCCYnFvdKYCqj4CKpJI3H5/YpvPIb9
         y9wMqfY+lBfmtjVYrbNnkZ9R3+HQPj6TaOxi5yJjJtoeMPv5lbK6+RUp6ZFQWjnw3xeG
         pRMxQwXV5MyFVqNya31wwdQUd/ouDYWP9zX0EeHCwDtAGexPjOEUe4EIH5TBIhRRv6V/
         kFRgAXK7ZYfT3QmzhCDRCKcfWzxv/d5bZJP0uc/78PCWYa1CJT7FK0hhAH/8rjiN9ipP
         uunA==
X-Forwarded-Encrypted: i=1; AJvYcCXNwu84wTZUwzlA4tGC5dFNLoT0OybLk4QQRHKojEr/AUBXG91bgCKw89LpQ9pVWTEE1m1G6l0+FmQhD8e5GEp64Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNfayWS1ogvVMmYHSzTVRnBpidXoWxQW2e1AyOKAS2gLmP6jg
	8F9uck5yYzmBPgTqP9ajHj0a+J3D7RQFtybh0QgNBP4N6xAKm2toRbpfy3vd51Jo
X-Gm-Gg: AZuq6aIT5Qjmmr8DlP9+WFrlFPZmqTx71VepKq4rwHSBCYqNSrqX5FRTxejqmeCeShm
	N/ab0JMVrnj7Falu00XEhlxWCMop6+DzSVL+PNEOE3R/kfVuuhDd7EZjp5vTJQT/KA/4GG2z1Dy
	pxMVoRFc2hXLKh39xqUj+zYaImCkJCsaWW4jcTG35qw9bsD9feV/MvfNmheo6EFVOID5iHLCHlz
	gM4ZruOgceIfk+jSjCVd2QvIf0HWISLE8FOQeMG8qmVgx9cl4ww5Hn8HynY8k8sKmseHOgv1s+l
	/uSYb3G+hVVzYLjt4WwRCYe3FQNNi7r2h9g4NEKKMk62BKQDsJgBglVaebKNnwre2dnZz0TAACt
	RPzGOrlgSp5RT636XGApnHBjqy3HQ8J125z++lVaJ9SVJDa2Iz0gAovVmJqThQiEU5fMf1LTpT5
	BYB2s5RwMgv5Xh2Iqe2BVyil4SKvyCfu/DeKqXleiBo9R2tDQVgpLQ
X-Received: by 2002:a05:6102:ccf:b0:5db:efcb:72 with SMTP id ada2fe7eead31-5f54b99aa38mr1090148137.6.1769175153148;
        Fri, 23 Jan 2026 05:32:33 -0800 (PST)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9482e2aa79asm505839241.2.2026.01.23.05.32.30
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:32:31 -0800 (PST)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56641200d6eso971151e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:32:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIPcXgRDRZMGIgdwj5iErq65AEdkkr0I7F8QDW58lpSJ8vyaHJaVGGgoYlnX3/gEE2ovML9tRLyj5lqcMJ2Bw89g==@vger.kernel.org
X-Received: by 2002:a05:6102:f14:b0:5ef:a9fb:f1f3 with SMTP id
 ada2fe7eead31-5f54bae7a41mr1054952137.11.1769175150254; Fri, 23 Jan 2026
 05:32:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118135038.8033-1-marek.vasut+renesas@mailbox.org> <20260118135038.8033-7-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260118135038.8033-7-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:32:18 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUaPJCdzx5nGgmO4=z5TL6UYiYDaEgL1ezWABh6vPJOCA@mail.gmail.com>
X-Gm-Features: AZwV_QiSLMv1d8wTOd_fggCZcAN0A0pAIafduPy_jaGRkU9OQ3Tlbc0VC45o0gg
Message-ID: <CAMuHMdUaPJCdzx5nGgmO4=z5TL6UYiYDaEgL1ezWABh6vPJOCA@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and
 USB3S0 clock nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	devicetree@vger.kernel.org, linux-phy@lists.infradead.org, 
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
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,gmail.com,linaro.org,renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27330-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.988];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,mailbox.org:email,glider.be:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 375E376487
X-Rspamd-Action: no action

On Sun, 18 Jan 2026 at 14:51, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add USB 3.0 PHY and PHY clock node for R8877990 E3 . The PHY node is
> different in that it does not have control registers and extal clock,
> which are not routed to the SoC pads on E3, therefore describe the
> PHY as usb-nop-xceiv simple PHY. Add USB3S0 clock pad fixed-clock
> node, the frequency has to be overridden at board level.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> V2: Describe PHY as usb-nop-xceiv and update commit message

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

