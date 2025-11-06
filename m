Return-Path: <linux-renesas-soc+bounces-24271-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEB3C3C8A7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 06 Nov 2025 17:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 00CE3352584
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Nov 2025 16:45:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25CDE32D0E3;
	Thu,  6 Nov 2025 16:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Es1QkEdA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CA4335541
	for <linux-renesas-soc@vger.kernel.org>; Thu,  6 Nov 2025 16:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762447506; cv=none; b=kFO2Q6ny9XKdzlaB33vvfjFiTUfeZJAApyyDVNZSux1G/H7OQt0JdfBkSLXJn2240gZpIwkGadrhyuRn7iTVwpa8yk8MwMrStl9BaqoGVmGYYvFI7MpRlNlKZGIQD1LyDY9C7iP2wzpNoelQxQ9l7f9t9W3i1I/7ausJn1aHQzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762447506; c=relaxed/simple;
	bh=X9BEWwB0FNpTpkWJhm+qaXY0I7iml0fSupTwank2kMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rMcZ4mWRG5Kg2yCBPCudHaYc/X87HPhvZP1BHd7onWgSaPZ/ZQws6KhE0Y/9mkSc48B8k4ebTBD50n5us8aUL3hrNDc+yjcHYnXie/yw8nfwxQnTps3lpEPneJE80c0qgKVyCl2sQRemJVTIJO6W5WYQWJWIkpVr+6pVCyJZ3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Es1QkEdA; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-781014f4e12so12337197b3.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 06 Nov 2025 08:45:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762447503; x=1763052303; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YCzuZ/teXYU7yevuP9B3flHK19xr/xlr710i4rE8skU=;
        b=Es1QkEdA/zBpIPzi+HGQl/7UQTc0u7rQ8nQ0oNHOJvYpsDrh52P+nfcZ1rRMFmekG8
         oWKW1fPLFi0yEr9g8nCV4eIarl2Kv6/bIY91CoJxqjC4yot5jHJvoora0gdiknA3GU5/
         RdStclCYNas64mysPuwfygU09X9y4gu0ZUbgVKQIBgM9pLWf4tzdiQpuBD/RsrJTUmiL
         o/sCo5ZnjxyWXd/cYR+X3YeriM6gB0Nn6LZO5rVnBQNmPEwaWl+/x71i20PG8OY4Fi+S
         cbK27KlFofPjN4icMa0L/Tu7aA857zVeADmHxcoOlL6BaEvh0ikqYMl4fChbZSHxKrt/
         O3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762447503; x=1763052303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCzuZ/teXYU7yevuP9B3flHK19xr/xlr710i4rE8skU=;
        b=NiPf0kjGJ9uIj+LWIpeDMWymE307OahjCvXHsRXZgusHbgOYsKMQcDe41k/f5vzxin
         qZiCBhQZdjvgdpxTT0B7pZMwn9PaVsp3AqDTXrZcfa3Vx+DB79s8qii5i6o7Cf8hqDMs
         mjFEMEYHoKLLMSp+Hv5MQncwtRqxFoXbZA2PorClfQNMFDt9e+kGR9t8aQdgQ7QPNdiM
         7t/WwHw0FP26XcThSR+nPppTbq7lkL+VizegKm47VyMnhjmrw2Itgb5cWNqonw43BdsR
         hDJshlnV/wF9F+X1GE8hiw1j2BKlK3Z2fDcRCsgX99pQvs34KO8dHkqrfmZpruxNR+6S
         g1MA==
X-Forwarded-Encrypted: i=1; AJvYcCWKkhzw6W2IOMy5zYKRoqUcpQM9XhxTI8kiNArQSM/Px1B+ZCYyjV5BuauFyMMftTP3ahedBZQD41wfxmSAGpmXOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMv7qBMR3KcyRFvpDY63OEQLAXSLgrzHAR21jt37mXDe5nRjI3
	XbLG5XkbAcivG/59eFbQixwGRPoI7P6G7QFzmHlWgkRbq3f3fKLp0fLV
X-Gm-Gg: ASbGncvr/IlSUaQVQ79D0jE+VEnwFWAsQ4ix8uZfX/3bHqwQy+4qAbGJbYW8csLSyH6
	ErqJ2Y/uskEWegWjOmGQigeHJd9NX0C0PmAwVYcXrFCwgA3OigiuERHPOn5xzuiloh3egK0QtHB
	51nbj+BRUh82p9z3kXriJGnASb9YeYHlJC2hchTr7iz9pLkyLGxOSj0k0eTXbmu0imGvcbwrNeE
	AxsrRdwqmnr1zjO0pe7O6rs2webKgi+hUGGIu+LE1emV+SIfxHf2Q/9CNnqsP8nEdjCxpsz1Y25
	Udz0qTC1qOl9Z2ReSfGZ782zPFWQHtv/+iz+T8ruKdsHIAKuQ0f5Joh17HrfzNID3cCSAiREitQ
	jfCrGzMJ8XAt5gxDTwMqQsXqKPP7K6vE33Jl6V969mv0RaMlodlLoaKqcpIV4zuvxuBTNvoBIaM
	VFptWkKY4NuEyPmsMODJDmEffvAyzHy/STxS5+4ZLUenY=
X-Google-Smtp-Source: AGHT+IFgqblsjDg64jVhZU34czKFHTApBwHTvzKvobAZn60rv4BaSs97biLpVcByf7R85pQynTZCWw==
X-Received: by 2002:a05:690c:46c3:b0:786:45ce:9bd3 with SMTP id 00721157ae682-786a41b2455mr71656237b3.34.1762447502815;
        Thu, 06 Nov 2025 08:45:02 -0800 (PST)
Received: from localhost (c-73-105-0-253.hsd1.fl.comcast.net. [73.105.0.253])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-787b13b6954sm9471997b3.5.2025.11.06.08.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 08:45:02 -0800 (PST)
Date: Thu, 6 Nov 2025 11:45:01 -0500
From: Yury Norov <yury.norov@gmail.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	David Miller <davem@davemloft.net>,
	Linus Walleij <linus.walleij@linaro.org>,
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-edac@vger.kernel.org, qat-linux@intel.com,
	linux-gpio@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-iio@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 00/26] Non-const bitfield helpers
Message-ID: <aQzQjSMOSrUIgMCL@yury>
References: <cover.1762435376.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1762435376.git.geert+renesas@glider.be>

On Thu, Nov 06, 2025 at 02:33:48PM +0100, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> <linux/bitfield.h> contains various helpers for accessing bitfields, as
> typically used in hardware registers for memory-mapped I/O blocks.
> These helpers ensure type safety, and deduce automatically shift values
> from mask values, avoiding mistakes due to inconsistent shifts and
> masks, and leading to a reduction in source code size.
> 
> The existing FIELD_{GET,PREP}() macros are limited to compile-time
> constants.  However, it is very common to prepare or extract bitfield
> elements where the bitfield mask is not a compile-time constant (e.g. it
> comes from a table, or is created by shifting a compile-time constant).
> To avoid this limitation, the AT91 clock driver introduced its own
> field_{prep,get}() macros.  During the past four years, these have been
> copied to multiple drivers, and more copies are on their way[1], leading
> to the obvious review comment "please move this to <linux/bitfield.h>".
> 
> Hence this series
>   1. Takes preparatory steps in drivers definining local
>      field_{get,prep}() macros (patches 1-11),
>   2. Introduces __FIELD_{PREP,GET}() helpers to avoid clang W=1 warnings
>      (patch 12),
>   3. Makes field_{prep,get}() available for general use (patch 13),
>   4. Converts drivers with local variants to the common helpers (patches
>      14-24),
>   5. Converts a few Renesas drivers to the existing FIELD_{GET,PREP}()
>      and the new field_{get,prep}() helpers (patches 25-26).
> 
> Alternatives would be to use the typed {u*,be*,le*,...}_{get,encode}_bits()
> macros instead (which currently do not work with non-constant masks
> either, and the first attempt to change that generates much worse code),
> or to store the low bit and width of the mask instead (which would
> require changing all code that passes masks directly, and also generates
> worse code).

Everyone please send your tags. I'm going to merge it in
bitmap-for-next before Monday.

Thanks,
Yury

