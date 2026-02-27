Return-Path: <linux-renesas-soc+bounces-28542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PsNIz2woWmMvgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28542-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:54:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F7311B94B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 15:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9C0333012BFF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Feb 2026 14:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAD2428830;
	Fri, 27 Feb 2026 14:54:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55582D594F
	for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204089; cv=none; b=lurImTDuQVADzBBuWWePlO1XVT11FmgjyNX1pBVAATAkRRkfTpgVoDH5KxMISbAai0qvOWmQ4mPdH8VYzXvH1RKriyTOiVDexNCCK46iI3zsI+rqtZLew7bFWtpr8z+LOsFf9+tubgEQMhicBsPwGIIw4ROVXU/60OCznXXAjG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204089; c=relaxed/simple;
	bh=IbjpYjPyt7LrSqOdqijcKxV1tTGpTa+DCJfx1+OEgl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=K2CHRvRMZpU4YeoctjdnUGl8Uyh5Lpm0b/zFYZyrnYIB+2EpLUmwo41+HWgRbZazxnyM3JlC7m7Q6X+qIYQ5gHhqnmIIiYtx2Nv8hkvdaGuWMPVaXymyhyMBJosCwP2wi2cwkpb0RLk4V8Ho9Qs541Ous89giISdXEEXzlnJ+ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a88bfd470so1581489e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:54:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772204087; x=1772808887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Aa1HeQGt1TkOvVVQBH3CIgad0zCtpC8qvA4TYkUZFM=;
        b=pNEm5qzsqtg6pLMj9qLdJ+FM+dinArwrNL8so/qxGQ+D4XzcU9DkjblCHzAZwde2qw
         e4860d4ZSq49kPCpvNphsvqu4ipYp1OcXifD1x/i1bUWw/+qbuoNDK0Nyw+Xf2RxJ7lb
         D48tSJ5ao+Wd135kxbshH5/4U/UXpXOVQP9IrkxVSXu+aSkB/U5dhpClR5zWmDUWbsAb
         nFTBnGLIq179wIEERX7MJmqbfspG+gSRw+tYTp5IpstV5grBughU3xNk4kOCYlf9L7Hy
         TWr3oD70Qgy+pvotkJ8MaB1Zw+PmTO5eXe4oLejwYqpqP4oSfEknpaBe2KJKH+flv07h
         0NCg==
X-Forwarded-Encrypted: i=1; AJvYcCXCsAFKqPpqJ4uBgt65lMjX9vQVjfS2Uk8e1Ry6o0cwkPnt33L9BumunBr8BUNZIB+6zw220Q9ThXsfXgDmWst/JQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi41fZEY9J8oLsUsPbQd7AI2eGCFBDn/saBYKIrOL1HdGonJ+N
	Ybq3idVR2SR0dWv51Y5XcQ3OxAWC5W72ly3W+yqWWjDVxhNWcoD60AtnPWTYwTqAi5Y=
X-Gm-Gg: ATEYQzyrt1g20YVd0j3FrbkafHjr/suTpEFjrh3VxOXczGcjOloShu00+kznuD17Zrw
	VMTOAWbK5WyPLdyg37fagNVZb7Iva6OjOSWw8pUvHavjWlWvOBHZXksi6GvLthZ3KqackvPVAwP
	umHHNpbFFBixkT3kB0qo+2e3P+3wznzP50T2cSDr0XQAPlURl6cd5RgyecutZcBuncrv4dkQjBG
	a4rBAdN9mGzR85SXCAK88deYflNNDph/stvDjEDx874FFvE2I1BowG2i+A7soNEQ5cPWKZZhX8s
	VhSgMYBJjTkwLCIcAL83we/rrNoFd2eigoL8OHLvxCQYVDnCsQBEMa1iQ/hds4IXPbH6IVYDXcD
	ead1PxBg6NU8iweZLcjTj75JLGwJEOYSpk3P8Mgstq2SfLhXPfabtH+5MIbpvIEOYLg3+eecZ2c
	/Hs6Lq6UIOUaB71LO87Y8pgLdw7TCro75c4wWzMXXG3u2pQ/TbOvUPmIZZEw4l
X-Received: by 2002:a05:6122:1c06:b0:559:6788:7b55 with SMTP id 71dfb90a1353d-56aa0ec09d6mr1611503e0c.3.1772204086645;
        Fri, 27 Feb 2026 06:54:46 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9215ac92sm6982381e0c.14.2026.02.27.06.54.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 06:54:46 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5fdf71f3327so2211339137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 27 Feb 2026 06:54:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtdVMxoSnkjavN09gDKsRm2VNFnHn5Hxc+sEyPkiKSNHw2RCWK1vDRc3mgFnQ0bl1kw7TvbPgkNgUxiGhJvzZ92w==@vger.kernel.org
X-Received: by 2002:a05:6102:3a08:b0:5ee:a6f8:f93b with SMTP id
 ada2fe7eead31-5ff1cda999fmr3969088137.2.1772204085197; Fri, 27 Feb 2026
 06:54:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128215132.1353381-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260128215132.1353381-3-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260128215132.1353381-3-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 15:54:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVeH3eWZH6-b4f-cTY4W3Tyi+ibfkJtE5A_-J=nwqNB1g@mail.gmail.com>
X-Gm-Features: AaiRm5123zFOGxobgOmfUt0Ahb4WpCv50faXTjLep6czwjGjFva_w8fossmC2MU
Message-ID: <CAMuHMdVeH3eWZH6-b4f-cTY4W3Tyi+ibfkJtE5A_-J=nwqNB1g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64: dts: renesas: r9a09g077: wire up DMA
 support for SPI
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-28542-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 2F7311B94B9
X-Rspamd-Action: no action

On Wed, 28 Jan 2026 at 22:52, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> RZ/T2H (R9A09G077) has three DMA controllers that can be used by
> peripherals like SPI to offload data transfers from the CPU.
>
> Wire up the DMA channels for the SPI peripherals.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

