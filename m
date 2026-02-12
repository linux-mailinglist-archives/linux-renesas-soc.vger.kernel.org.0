Return-Path: <linux-renesas-soc+bounces-28176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OApRF6IHjmkT+wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 18:02:26 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B5412FC56
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 18:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 35562300B120
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Feb 2026 16:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CA2285058;
	Thu, 12 Feb 2026 16:59:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29C33FEF
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Feb 2026 16:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770915595; cv=none; b=CvIDrY3p4m9ws9RL2KEyTCo2SlRXzweVEZKeBdxf7khpnVGQ5v07pTlBvhy1CNuFUoOfy12JN4PfSPilCpZknEutFIPI/XA3VJYHwB8OxdtJD+6U63FXqgWVFcc55ImA1XirX/JzdqqqJKTpYPe1kT2DXBy+evL7OW4Q7Z3pGEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770915595; c=relaxed/simple;
	bh=FavnLYuCSZbZEB88+6M4JKOu7/zHNtiz8QGLBab5uI0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XbTmv6LVbLTbTL1ozP7sCJKUZZNQwFqcFhzvP6bTfKQ34VYyeDUqD28v+4iDhj2VUFVs43h7PXZ7el+4uXKkK/GuBhnFQHIvLRUOkoZSe4Jcq6Kh67uT6+tchBaI/pfLPzrttYg4NAjWrFpqmF+12U6lFpTRbAdlGjOfdUn1BSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5fadd5d4319so53094137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Feb 2026 08:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770915593; x=1771520393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=om3cuNbQzAgOvOQckRciuNr9O8eg7IAaHrWKXJVxB8U=;
        b=tcUxt81arIgriZbFG6BlTyzvR52tdzwTtHD4BSVx6KG7sm65MppdZdW15/dvoVO/Z0
         tF6BtMdHFRpd01c5kVxk7BS5djVGRm+3FnJDc2VvISifEcUMX3yRrA5sPknCA8CUcHXa
         NcdKGJnfduu/Aiz7XUV+xxuMrm2t9IFWqePMelNokkhqzXs8VZTbRMo3mwit1aFvj5wj
         NzQ2zGW2C+XuCvmskP1jgH6vTmai8Kwb9P0N2Q0eDyWXeO2peKU0cAsBSkymQ2k+ed0l
         K/UFHTsse2FAjMMkIWik7vZPGDX+3uzXCLSwqVbBBtEqeWgG3Y+J+JMEFHMLi4DXOIFn
         Q57w==
X-Forwarded-Encrypted: i=1; AJvYcCVN79RfjTXCO+GtA81vScxo+AVhg6wy+gdvnxF6AlABs1dWlYeMrmxNEeRQ+9N5FAnEgQrqvoCW4pnbhh9z1ui0YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxDc3TcgGatPzfS97hpKCtdKqer2/VaQClUcC54wLu4dCMjsz+Q
	5jshzoZHrbamih1pYmFYjKsjJmZPADdxOka0fc/sAg0V1+j/3rAWCyKUae5Q1YJ/
X-Gm-Gg: AZuq6aJ/YmyX2GIykQVre+5bjsLkwObefTjPvUFPxSSPWNEw4dcACqlFLT93HarPOkq
	8OyKfLD1Ty7N9JvRpAolkPDJ257RocyfeEZkNvazIj8E/r14+xegfdMUHLn8bGqf8VOr33zt0bj
	tBCjxL8COV4K0suiCREziXIyonv0Y1DoSjABiEkeYcT2Uh1InicqFWDM0NGq06WKFS0qXOi14MQ
	+Yf7pXWW2468aR+oq/+nPYNq5ooKQyLGRYkuW0G2PRDNneT5H8fgryBfhMyqtjUDKyzegMFzZMm
	adndBv2bara/lfOk/j7wOe+HBZZ+Fod53XhrjWqwkofx0j24Mmox1g+cjEBizDy/QzZjeTo93jT
	iGxOIKcS+Lb5JmdgmVGnkxxLvplNgrIY4iXiapm54+mebrwAR7+Dl4MFCSaB9UZNHGKjFZ5JgWo
	0B0uX/0h0HtRPZ+HQ0c913uSZBuKfqRQh7sGitZHgP3mx4Z1p25v7Ss0KaqzSQ
X-Received: by 2002:a05:6102:3ec3:b0:5f5:46f6:fb29 with SMTP id ada2fe7eead31-5fe006d9326mr958541137.26.1770915592760;
        Thu, 12 Feb 2026 08:59:52 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94afd1ab720sm1885033241.4.2026.02.12.08.59.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 08:59:52 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5fe086fb0baso30772137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Feb 2026 08:59:52 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWinAwNt8/zUQqYZsBEI7nk9tRwLzRfNQdyS8uxXAuA+SFHOFJCHIUSvUz9CECduAj0J263g2AB89XnpJX6ab17YA==@vger.kernel.org
X-Received: by 2002:a05:6102:3051:b0:5fd:f8d6:e5d7 with SMTP id
 ada2fe7eead31-5fe003fb1fcmr1021759137.11.1770915199593; Thu, 12 Feb 2026
 08:53:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260208-rz-sdio-mux-v9-0-9a3be13c1280@solid-run.com>
 <20260208-rz-sdio-mux-v9-1-9a3be13c1280@solid-run.com> <20260212164823.mbeycqwzsy2dfq6e@skbuf>
In-Reply-To: <20260212164823.mbeycqwzsy2dfq6e@skbuf>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Feb 2026 17:53:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVOqovkugmCnR4FOfk8VkQyN_dmyKFzbsOSN0mPKQedeQ@mail.gmail.com>
X-Gm-Features: AZwV_Qjd18dp3H6_yOLJUoqzfa3vu8ojTLTUkfH0N1bdOdZMnHdC-jkEvP2Togs
Message-ID: <CAMuHMdVOqovkugmCnR4FOfk8VkQyN_dmyKFzbsOSN0mPKQedeQ@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28176-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[33];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[solid-run.com,pengutronix.de,kernel.org,linaro.org,axentia.se,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,vger.kernel.org,lists.infradead.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,solid-run.com:email,mail.gmail.com:mid,glider.be:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,sang-engineering.com:email]
X-Rspamd-Queue-Id: C2B5412FC56
X-Rspamd-Action: no action

Hi Vladimir,

On Thu, 12 Feb 2026 at 17:48, Vladimir Oltean <olteanv@gmail.com> wrote:
> On Sun, Feb 08, 2026 at 05:38:56PM +0200, Josua Mayer wrote:
> > Rename the temporary devm_mux_state_get_optional function to avoid
> > conflict with upcoming implementation in multiplexer subsystem.
> >
> > Acked-by: Vinod Koul <vkoul@kernel.org>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Signed-off-by: Josua Mayer <josua@solid-run.com>
>
> In the future, when you have a series with cross-tree dependencies,
> please try to think of it as individual mini-series for each tree's
> 'next' branch, and specify clearly that you need stable tags (to be
> pulled into other trees). Telling maintainers what is your expected
> merge strategy helps avoid making mistakes.
>
> For example, if you did that in this set, you wouldn't have missed the
> fact that in linux-phy/next, phy-can-transceiver is _not_ the only
> occurrence of devm_mux_state_get_optional(). There's another one in
> drivers/phy/renesas/phy-rcar-gen3-usb2.c, and that should be also
> handled in order for trees to not enter inconsistent states.

To his defense, the one in drivers/phy/renesas/phy-rcar-gen3-usb2.c
is a recent addition.

So this is yet another case of "convert all current users" (i.e. those
present in the typical subsystem base, typically *-rc1), with new
users popping up in -next in parallel, which happens all the time...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

