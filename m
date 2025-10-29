Return-Path: <linux-renesas-soc+bounces-23858-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2ACC1BB40
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 16:37:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ADFB621DD9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Oct 2025 14:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345DF72639;
	Wed, 29 Oct 2025 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HVwISxo1"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80591171CD
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 14:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748236; cv=none; b=H1vwu85E+CnkLBvkH2NfQvGVUaaTvgCvGs5Gvne/vRwjln7v5+HkQ0tIfGtmJbO6hRcgu+5N3DCwpoY+y0paW/O5BxGmuoblXEgrXT3MbE3DJU6lG8WCFS36iKWAaRlcyQ/93E3USEqNutXIcRTgDkJOicBsSz3G/ySgZzFbfDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748236; c=relaxed/simple;
	bh=7qSqb+8qhf4bmtYpSevPKgH9NpBXdJ7Y+QlL0CxIedM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d2noXX2y/WsIZJmYiwYVK7xr99Rk57oh2XLgYjD4xkKV6WofsBEDC1qjiwLJIgUQqI5iQZcDaX/NzvsVvb3eCAKorr5v4VHRJEVO4FfVMw+NHTvOzCOt/9Cv6WAOnetPHdIwOyCQq5kOTvhQw4T3/le/CCLy+2nDjjCdIJ6OqyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HVwISxo1; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ecf9c2c9acso37800771cf.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Oct 2025 07:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761748233; x=1762353033; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JnpQqG3KsjO8HR5ITuKL9a0uCELInljqSPlsEDY9f3Y=;
        b=HVwISxo10QqmrSYJm8NEWiPwMQdAiacHa63OSUEAOSCJl5S1CA8h1XtfTBJ+HmBrua
         w0YVot9mWsIVPfNpcf5bUtJMJXLuR8HvqT4uo56qtjCKmLUSQiBatizK3mNSYFVNIqyT
         YawDnfkurMYiTvK7GaRIEg9H7V06d4KB0okYHxfQLUJ8A0wxiAMZLhq6yzxKrBJvE948
         ydDUTAKK8c26FesuIPJAp59RrcCTDy4fWxTiLBQNwkkz17hNB535tNRdNm6xv25uX473
         +duWPWlmevzjZB4BKgqyMhXV20EeZDWiiTFHXfrcKqcTmGlM9nxBaHBuIZ7w/752aBPM
         1Zmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761748233; x=1762353033;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JnpQqG3KsjO8HR5ITuKL9a0uCELInljqSPlsEDY9f3Y=;
        b=Dxjv+/KTxLCKsUJhXIIqr9Lx+nWg9xgXrdERTIah110M+0Jdn9+V0MraY8bjDZAvHh
         0RjX5vAejiB8Iidl5Snet/8pk/PO0p+Qm8Gfn7br+9xG+eD1OPaTj1bYPDUVhZ2kRs6e
         /joX8Vrh6HQhacRAXaYzX9HD6MwhWF/vfI22cNsv/MsUhFz7w8plqYCSjV5YITbkiRq/
         D4f7m73DY6mwu+HlesGwYFPTgUfx13ZZvTvjxSPFsE+Gy3miGqxRrreTmgjfB90Vc3n7
         iQWHpHOXGjbiRx0mdW60Bn0UKLTjEQGFBYJIeUw8Ow3TK+n8L5KRWGgS6ZmuOhYroLWb
         WHXg==
X-Forwarded-Encrypted: i=1; AJvYcCU+VHNmY9Ib3iE89lP7DDZLpPZvJ5rgWJx9nJnK5giYDkdyFA1UVBztERYMGqztn3vIQ4SDVo27+A9rtL/mNZXLSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ/qHQjmEcmaxfpmjlbYHw89IeVga5nLBDx0L1jZ0cyz8UXdYT
	+hCHdR2+u7xwuwxeErghqYJvaWhO45TNVKZBAA6xnl4UsfzuYKKPcmaf
X-Gm-Gg: ASbGnctEE2rdEeDhEF9D9CVzpROpvSlzuEvvRZ3TnsTB77Fb9UQxzuR/FzMSmTicwOL
	9/+5h64nywETE1cM85tOjLBvl9cS2hSN1PFD4wLYCDQ9D9YtwjnRSTxs5dOGz6RwcmC+LCOjb0K
	hGBwacziKpn4Xe3bn6QMANH9hYeEOqafelhocPzMTKFlS5JPiZUhJVTh3+bXsYDUwZY5UYzocPd
	rV26XkZj98/1jicgaXDOsNFl7Ecy0lNAsM8n/bzPo80aPvfl+CIKfUjlih8g08uxa5fMTFDxpnW
	M0r+krbmG+5vAScA/QliLwa3x3/5BjHgt4wZapimRiNRvLkhGVul7ncWEnyaz18f8nhScf/yRw4
	DaTli9haoSspgOPKf0mQ+CflEiWnCjqpAMq+9OGcyTDCcMHM4i8h+1lyf1wTmvQDODl1wzGvm
X-Google-Smtp-Source: AGHT+IHd6ZEI/4efuxlvOLVTSJQH1JkXxxhkGirHmvwiRC9eDvjzIFKRpIZ05PrXMHCHH/Mrsnw0AA==
X-Received: by 2002:a05:622a:24a:b0:4e8:93fc:f8c9 with SMTP id d75a77b69052e-4ed15b53cd6mr36770551cf.15.1761748233098;
        Wed, 29 Oct 2025 07:30:33 -0700 (PDT)
Received: from localhost ([12.22.141.131])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87fc51e3809sm96571096d6.26.2025.10.29.07.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 07:30:32 -0700 (PDT)
Date: Wed, 29 Oct 2025 10:30:31 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Miller <davem@davemloft.net>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Crt Mori <cmo@melexis.com>, Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@ieee.org>,
	David Laight <david.laight.linux@gmail.com>,
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>,
	Jason Baron <jbaron@akamai.com>, Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Kim Seer Paller <kimseer.paller@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Jianping Shen <Jianping.Shen@de.bosch.com>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org, qat-linux@intel.com,
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 07/23] pinctrl: ma35: #undef field_{get,prep}() before
 local definition
Message-ID: <aQIlB8KLhVuSqQvt@yury>
References: <cover.1761588465.git.geert+renesas@glider.be>
 <03a492c8af84a41e47b33c9a974559805d070d8d.1761588465.git.geert+renesas@glider.be>
 <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkda6ykSZ0k9q4ChBW5NuPZvmjVjH2LPxyp3RB-=fJLBPFg@mail.gmail.com>

On Wed, Oct 29, 2025 at 03:19:45PM +0100, Linus Walleij wrote:
> Hi Geert,
> 
> thanks for your patch!
> 
> On Mon, Oct 27, 2025 at 7:43 PM Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> 
> > Prepare for the advent of globally available common field_get() and
> > field_prep() macros by undefining the symbols before defining local
> > variants.  This prevents redefinition warnings from the C preprocessor
> > when introducing the common macros later.
> >
> > Suggested-by: Yury Norov <yury.norov@gmail.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Do you want me to just merge this patch to the pinctrl tree or do
> you have other plans?

There's a couple nits from Andy, and also a clang W=1 warning to
address. So I think, v6 is needed.

But overlall, the series is OK, and I'd like to take it in bitmaps
branch as it's more related to bits rather than a particular
subsystem.

Thanks,
Yury

