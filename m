Return-Path: <linux-renesas-soc+bounces-27052-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E68D3AF40
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 16:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52D6C3005ABE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 19 Jan 2026 15:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41E6E38A9D3;
	Mon, 19 Jan 2026 15:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q8K9mV+c"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BB1369218
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 15:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836981; cv=none; b=gufUXg0jFzWfg60hy340Vz3v83Ht+ZUrY1D4rCPiZFkhox1i8chMTwZrZ/1ljA0R4T5fgw9sfj0c7+IM94pYeUvGgibNbSAz2AbjWwTM+Yt4SZkF2xt7qLdlFIwavufMpDYYS4mkllbD7UJwJ/A+r3eMws8h6xT7r1sTwf1wNyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836981; c=relaxed/simple;
	bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cgBtsYAGGXxksCgpTHZ3N5Jis236GzawXRhg4RrQbtQOQJJ+UH14BecL71BMrUWJjz7fsCkwCK2xczLcYYnfX2MvTj4ofNC/CmrYluIws7t9DhT3mg0oC3ETdTeV71Ry+IC47k+abXkxersgPsuH5mpf+sMpzejM1NPtWjlQJms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q8K9mV+c; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so24079775e9.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Jan 2026 07:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768836978; x=1769441778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
        b=Q8K9mV+ct0Sq4RpPjnMfWNfUvj9PaDdqwRUPWLc+HO3PGTPX+SykrB7wZOt/xptCKP
         AaHJ1Ij+ExBenLLgzChp2qzPrv28JbuxjKLtXZsoW5frkaqrTDaLmHzUPvEvzQ6z3bW+
         SeHgwEqeV8bTNCM/z/FmvhWj7WLfNKCUwnioPULeqt+FdC47eUY2o1GG17M7A85+XsJh
         Rv+YC0G+2uOn1ofqKonGDybQ6o44ECDU+q0z8zNJZbJ0RO9gqLFYlrhXZPAOMUPLd6eu
         lqcFHD3aX7cZ/0X5m34g8mc4hNxr5+9DR3Nerna05uNOlKfYSjDBPHwS6mw1+PaNU0gf
         Ot9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768836978; x=1769441778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KMJ5nMJfhQBbodCSUw7/slQ7OY7bXr5BnBhnNIrMmcI=;
        b=iNwAz7LoR8d2MMz9wFIavwqe1L/3JQOSh0Jwh28MuLYyw8QoLuLa/CSSXCykxxkUXk
         Dh3N8XKw0X8rOFshhDmndqpgZssH0K0K9Iyufy8giKYqD+Ivirn6LT9gABoia+MWklrm
         C3338dnO8Z9kKoFUu9hnTPdswerU43pS0DoF8pSj/xtbN+xj8QpY5HWP30iK3Ra1QO4l
         rbtuQUgwYyjkt+jQn1c+nvB0bN3fSu/g9i/6cdaOV+uareBhUkxQTl5dILSovoZfwj0m
         lKSOwnATAmmB6DwVaprltM0XfjgOTZ4EUxBRhbHRylukZ4dQn3LhL12juc6oc0zw0fGM
         ZSgg==
X-Forwarded-Encrypted: i=1; AJvYcCV7dcFj4hVFSZm0n7sm3o1drQZbM9DutBZ4LeL3VnPusWqEv/hCKZmy6iLsHSgjBY3B9bk2mK+JYC6KCmFSJiN35w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOEupSVR5xTPzS5Jp8M5abjI5e0oJ6B02DujIoBq43hqgwhYcY
	DVS2rkLrr6gIFn8SNtrP0XGBGHoDhNwF+VUgjoD+oAqphAgFfhPjoi9K
X-Gm-Gg: AY/fxX5+95MFMIlKJk7zbjLNf8LOIh5izOlpgl6K5IufdNxC5yP8vwsAVJ/xJLnAdkp
	RfcCXZmg9U+ijWqiE6Ya0Zc0hb23HgIv+H5ammqSi8Sok0y7e1j7dCYcGm/d/7mKArA93WYsIOv
	fkaKlXj3xTKzcJ/i81VIOxZ6K2NVBR1TtHnNYPpqy1bXb3NX72KLpSBChLXYVWbP87MU+SAH2aI
	/QSurE+yVz9gCljhncDvTRAWJAWBaMKXPK7UaaIKpKy7aSmOfQUvd0CiK3meLa2ia8jb455dpQO
	pjxlnTwFSpKAxhbV2PcKduk0z4WemsKBQ7qL/gQh36lZdR0cOFnAxPWzW0S81OWidIPDN10ZTLX
	CNH+PTjvBgaQfw45KMgjc3q1Zf1tzq9mued9GAX+lzFh7aUTMe0U3WTYfjbZKAgtQHGjoYcrW13
	jkAbOwISrmC3qnbjbehBM7vMCQYfWZXYmNXZ6LgE+o1UM2UehJRjZDXipuC0aJcJV7Pb4I
X-Received: by 2002:a05:600c:4584:b0:47b:deb9:15fb with SMTP id 5b1f17b1804b1-4801e350af0mr140088985e9.33.1768836977812;
        Mon, 19 Jan 2026 07:36:17 -0800 (PST)
Received: from jernej-laptop.localnet (213-161-4-198.dynamic.telemach.net. [213.161.4.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ff1sm23614533f8f.13.2026.01.19.07.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 07:36:17 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-sunxi@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 8/8] soc: sunxi: mbus: don't access of_root directly
Date: Mon, 19 Jan 2026 16:36:15 +0100
Message-ID: <5957177.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
References:
 <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
 <20260119-soc-of-root-v1-8-32a0fa9a78b4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 19. januar 2026 ob 11:40:19 Srednjeevropski standardni =C4=
=8Das je Bartosz Golaszewski napisal(a):
> Don't access of_root directly as it reduces the build test coverage for
> this driver with COMPILE_TEST=3Dy and OF=3Dn. Use existing helper functio=
ns
> to retrieve the relevant information.
>=20
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



