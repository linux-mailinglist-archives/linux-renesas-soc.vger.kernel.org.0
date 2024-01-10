Return-Path: <linux-renesas-soc+bounces-1453-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB43829252
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 03:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 08E5A284A15
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jan 2024 02:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0013017F1;
	Wed, 10 Jan 2024 02:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hEUsXdPE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55C21376;
	Wed, 10 Jan 2024 02:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18AEAC433F1;
	Wed, 10 Jan 2024 02:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704852375;
	bh=K20e8jhxQctdn0EQe0a64CVvGFTYjmTc3LS7asQogyo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hEUsXdPExgJ/6tyvorNMmv2xbbnN/ksrlzf9XWoz4XzMSpDxk/Su9jRai8A6JmPqT
	 CROg9vyX/uPgMa6hC3+dIv1+9VwRJuYOHwCZqh4PPAT20xe0N58/U93+wqZ4eMep+N
	 C9Y9/Yl2ILJOSVXmlxmhAbkx+aAbO4RSpzEDkemhkakgnE8rlLiL7DE1D79+kIKw62
	 c5+A6TL8g0sDmmmyWP6zXo51r4mcIw9+uHa66sJvr6wGG+GkGqe1ewkKXIi+ONI0Fz
	 xX64W1DE45sKKqohJS8CPYy6lPEmA17vOTByyqBIbrhq4wLzLuEHnHNC1j3EhDfzcF
	 aA908fHMhDbXQ==
Message-ID: <c2f88d7b-cded-42ab-bc5c-3d9a723daa1f@kernel.org>
Date: Wed, 10 Jan 2024 11:06:06 +0900
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [DO NOT MERGE v6 27/37] dt-bindings: ata: ata-generic: Add new
 targets
Content-Language: en-US
To: Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Gleixner <tglx@linutronix.de>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>,
 Heiko Stuebner <heiko@sntech.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, Yang Xiwen
 <forbidden405@foxmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Vlastimil Babka <vbabka@suse.cz>, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 David Rientjes <rientjes@google.com>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Azeem Shaikh <azeemshaikh38@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Bin Meng <bmeng@tinylab.org>, Jonathan Corbet <corbet@lwn.net>,
 Jacky Huang <ychuang3@nuvoton.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <06fdb2cf7927681acf3099b826390ef75ba321af.1704788539.git.ysato@users.sourceforge.jp>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <06fdb2cf7927681acf3099b826390ef75ba321af.1704788539.git.ysato@users.sourceforge.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 1/9/24 17:23, Yoshinori Sato wrote:
> Added new ata-generic target.
> - iodata,usl-5p-ata
> - renesas,rts7751r2d-ata
> 
> Each boards have simple IDE Interface. Use ATA generic driver.

This looks OK to me, so feel free to add:

Acked-by: Damien Le Moal <dlemoal@kernel.org>

Note: The "DO NOT MERGE" patch prefix almost got me to immediately delete this
37 patches in my inbox... If you wish to get this work merged after review,
please use the regular "PATCH" prefix. No worries, the series will not be merged
until is is reviewed :)

-- 
Damien Le Moal
Western Digital Research


