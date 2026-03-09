Return-Path: <linux-renesas-soc+bounces-29059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAAlDiDirmlPJwIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29059-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 16:07:12 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CEACA23B418
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 09 Mar 2026 16:07:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id ADC693016EFA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Mar 2026 15:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683803D75D2;
	Mon,  9 Mar 2026 15:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YDCKAWzT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CB13BE16E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  9 Mar 2026 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773068821; cv=pass; b=ZJYLP9GydMXBU9SYfVbVRprv2vn+uHXs6BhxWr3UHl21T7roOcYJcMT3j2SW4+DBTYoJtaydCdR5uM7+1204vuch4EjjBJKf8t85uvswkI9KN1o0xhlLU0fugBK2ShAFba4VBfkxg+92/CoPg/ZtLXk82XLGZokVvt65U/VPaeU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773068821; c=relaxed/simple;
	bh=JKN2J4kHq0yD8TjxvyPjjgMMFAS3NaA1mJTCXgnPsRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGpDjzEStbG3VcBlzx6ZSd30GMYl5jYK/6wLL73+AnIki56113v2C+yJ/bbTlv6nG+YZ1ibYBKkNNwQvYFD1F8h6f4F+ZBzUL7GBX5VXQT8oGHUWREbNqBeUuy7Http7F6bAKRAep/32iaisMGxM/RQtJvhhzOxfn75EmNOSrGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YDCKAWzT; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a133b686f7so4695925e87.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 09 Mar 2026 08:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773068818; cv=none;
        d=google.com; s=arc-20240605;
        b=hSUJ0G5AveJ1wHOJuBDVrIbvW8/CbZBffJpxMUD1MNOixXIIJiBzkZpcBg2c8Z94vg
         1TzlaRsyHzqJAeBiY9vwnKmVBoHGf4kNXwgro5wC4u4+lty62Cm2eUbkGEN+UZSCEbgs
         a5xULY83kL1Ee6UQ9zFwizFqNwGfHLJN3J5wZvol0Bp+wG5q/4F6vZeBAhD7vQ5S85F4
         YDR9M7u69WHiMhvN31fXmK7fOsHgfQu2K1Qdoms94Okvx6EASJxlIQ8SkCgWDF82KjtA
         hePx6FSqsSZcDSJLlSKdaGTWYMlxbUf8wt1uQvARsg/m5Z1j8lXkJiySDjRI+feP2yhQ
         gXWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5tCYLBqDfvBtAEmrKe/1f8U+n/JTrn4BGEWGrJUqdlY=;
        fh=KzJAWouNQxDqkBcgR1Qim44BvcWyCod+m8YLRTbTCcI=;
        b=VbZY/zl0Y4t+WlIym0wEwJLUvH2P57OX424H2Sp4EA8ePbrVQtaciLILIv/p/FBW22
         U6dFgKPX/c6VBfvIjpwfJgApykUaIAXdUnJnew3lTLxNx3H7nK8qLCcrNJ11uul7NZvJ
         wwATd24rj26qEJrF/oKJeSY8QBV8fiC2UPdIQDwKSxXWQlUxEl7MwxZd1IDTj/+pzlJx
         sgWWdTkrVOY5vGu5uNiwfoFcJsrp3DLm0aT31qnHJiCyXeVrt8oUJRg+zlKSAWvimh3u
         lD+XWaS+ftYV1itqYEeMfWR55MujVZtnE4ypTIOiTeD9YUCJWRTKOTD7osO2AuwFmqxk
         2fVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773068818; x=1773673618; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5tCYLBqDfvBtAEmrKe/1f8U+n/JTrn4BGEWGrJUqdlY=;
        b=YDCKAWzTSjoyOKxywxX/89IU//SMk/64iocZQqSPHMm+RZyOKO61dyNWFH8+fDrUSH
         BhsrZMeW8TAfJqMdaAyEkf3OFDA63mDRaFuayeHDpbmqxS6dFezk9eEnH002tQ2OpMEt
         tv4B6QfA+/uuB001aM95V6PbaZdpSB6LnvAC5az3zDD7/Jeo503Erl50y/Z/OQoTmfUB
         gsrXxHQWndpKSnkqBf/TQThoIOiQSSpNSmwWdGp8MIQZC9wRKuXaD5KsunxTNwISM3pU
         +z078T8q/N7b+1nsIPv2gGu4cwBm7Lir78sm8SKWJd+vbaQ/R1qNAs6hWZ9EdoUy7rDb
         S6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773068818; x=1773673618;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tCYLBqDfvBtAEmrKe/1f8U+n/JTrn4BGEWGrJUqdlY=;
        b=Suko5c4n+IIXAHPQW7rq0684Taxh876OAFQ5ir9zPfPsehjdpeL7cUwqzFRYByPAAU
         YUBZJrs3QN5RNe/MIhtYOoRI7lpu9WI0HAB605zni6bbsrSqerLDPIIrIwPAK6iX1SzI
         FpICim23Z28OtpAi4c7YrMnocPVm39NA3TXfYnHx2LJeXV7mwzi/DEOXlCbcEaVdUXPw
         3S7qq46ODH5Np+B7/jr1H1GXxINLBt2SVWCl/utwKEeUQGc/hm5J+Qkj+Z+awxu97NK8
         vxfYdfVIKqpCyna07EJ1JmJUU00IQPvIfkOhOeghFk8wogDHuxj+DFzp/dU04L/I6rSj
         TRKQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8slS3XflUDDSEmFegHbm2UlDLQolApW9Y8tF052JaHVRwC69VzoKYqRki7SmCb4ptBar0EWPX7o2gkQyF8kqb0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpWq/coVzKDC0sNTQChmsg65N/T3PQAtFDE5MSRyjJWOIkr3/t
	OLVncz8FZ9GpbSll5BsDth2MRUTKqbmMoj49R8qlzCfzWMXwvOC4vQKYcckMAeifBGb/W1nwI9s
	ItdCaYVzjTMOkfLTgDhKpQq/RXNqwRu8RGcBe9shCTg==
X-Gm-Gg: ATEYQzz3M8o8ftoUpgpOKjkumVXZUGYHtum4O4feRtwYhrgsQWWhSzx759UpLR123ex
	XyaTD3lq6nhxjaXQwSXmo/2jL/beZMUAAsyhE7omeZp0dubnpJLqzzeLEAb1td7NRkic/gJqJuj
	kmaFfu71tguY4K3yOxdcDyu9xVbG4dP5KbOPp87Fii/Zm57tOCsU78lQt9l2qvV7odPdRbRZ5Md
	oFqYs6ydC5mMd/5GfJxsDr0UFGLl57SUKWmFf2DwYgPq7jlNlQlZg4PHYNYx/CzVuf3ygCbN9fB
	KkHFblPg
X-Received: by 2002:ac2:4644:0:b0:5a1:3ab6:6de2 with SMTP id
 2adb3069b0e04-5a13cce183dmr2793114e87.37.1773068817703; Mon, 09 Mar 2026
 08:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226-rz-sdio-mux-v11-0-c2a350f9bbd3@solid-run.com> <CAPDyKFr5NZKEKpV2+GXGnzH9pyyj_TLmMCc3rac8h248srX_dw@mail.gmail.com>
In-Reply-To: <CAPDyKFr5NZKEKpV2+GXGnzH9pyyj_TLmMCc3rac8h248srX_dw@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Mar 2026 16:06:20 +0100
X-Gm-Features: AaiRm51gPNstmfmPCbGsevKfnVyHAve3znxWrnZO7sNkn4-s9OVpM21rgVmHXjc
Message-ID: <CAPDyKFqyUsKbp9pgKHsMoOd5Qe_0f9rxsX6C61adQC344eA9Lw@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] mmc: host: renesas_sdhi_core: support configuring
 an optional sdio mux
To: Josua Mayer <josua@solid-run.com>, Peter Rosin <peda@axentia.se>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Vladimir Oltean <olteanv@gmail.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: CEACA23B418
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29059-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,linaro.org,iki.fi,kemnade.info,baylibre.com,atomide.com,gmail.com,ti.com,glider.be,sang-engineering.com,renesas.com,solid-run.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Action: no action

On Thu, 5 Mar 2026 at 17:19, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 26 Feb 2026 at 14:21, Josua Mayer <josua@solid-run.com> wrote:
> >
> > This series has evolved over time from adding generic mux support for
> > renesas sdhi driver, to partial rewrite of the mux framework.
> >
> > Several drivers have started implementing driver-local managed and
> > unmanaged helper functions for getting and selecting a mux-state object.
> >
> > mmc maintainers have requested that new code shall intreoduce and use
> > generic helper functions that can be shared by all drivers, avoiding
> > code duplication.
> >
> > This series is structured in 5 parts, each of which is self-sufficient
> > depending only on the previous patches. This shall allow the first N
> > patches to be applied even if the last ones need further discussion.
> >
> > 1. Rename driver-local helper functions to avoid name collision with
> >    global version to be introduced later.
> >
> > 2. Implement generic device-managed helper functions in mux core.
> >
> > 3. Convert driver local code from similar patterns to use the newly
> >    added global helpers.
> >
> > 4. Change mux-core Kconfig so that it can be enabled through menuconfig,
> >    without an explicit "select" dependency from other drivers.
> >
> > 5. add dt bindings and driver support for mux in renesas sdhi driver.
> >
> > Signed-off-by: Josua Mayer <josua@solid-run.com>
> > ---
> > Changes in v11:
> > - changed approach to Kconfig making MULTIPLEXER a bool, and adding a
> >   user-visible wrapper for menuconfig.
> >   (Reported-by: Ulf Hansson <ulf.hansson@linaro.org>)
> > - dropped the "default m if COMPILE_TEST".
> >   (Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>)
> > - improved kerneldoc line wrapping.
> > - removed unnecessary changes to original devm_mux_control-get.
> > - fix "reference preceded by free" in mux_state_get function
> > - Link to v10: https://lore.kernel.org/r/20260225-rz-sdio-mux-v10-0-1ee44f2ea112@solid-run.com
> >
>
> [...]
>
> To me, this looks ready for a new try. Unless I hear some objections,
> I intend to apply this as material for v7.1 via my mmc tree on Monday.
>
> The complete series will be available on an immutable branch, for
> other subsystem maintainers to pull in if that turns out to be needed.
> I let you know of more details on Monday.

I have now queued up this series for v7.1 via my next branch.

The series is also available at the immutable "mux" branch (based on
v7.0-rc1) via my mmc tree, which other subsystem maintainers can pull
in if needed.

Kind regards
Uffe

