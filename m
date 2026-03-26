Return-Path: <linux-renesas-soc+bounces-30320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAPMEggAxWlC5gQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:44:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 363CC3328AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 10:44:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70B113042D8D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 09:43:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65F8136492E;
	Thu, 26 Mar 2026 09:43:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF2C3537CD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774518187; cv=none; b=BMEDRg9+X5sj8rUYR8i2KotpVJRF1kkZn8ItnyG2wmB/GLEpHdo+ftEIk6SO+PJj+iNXXOcPHrWEt+fAamoUP6zTdu67sXuLLHjRMc0K/xTwrJhhS9pw6KswY7C8pn2C6SmGdLwZe5FLiG+noMHt4ZH2iONVmGHK7RFjtT7++AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774518187; c=relaxed/simple;
	bh=BiAwvTDvxBZNe4zMaISQ9WF5iLCnzPvWoQ3vuS7x9Nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rvRzKJwJZmo+wMbSil9OJ6Se+k2hjNEPHCurXYT7OmHqzsepp85mLK2yOOBriTwTaEKQ3Zqnl5zyXr4WGU07uZ8TwmmlTV4pDaYJZwj+bTWLj8eTmM3xrf/YKQGwkCHrsfTBxdCzX1NbUb7LsK7oQ3EJlRTUGF4+3zafToVZ3F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5675d609621so700592e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:43:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518183; x=1775122983;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8kU0JKCVLmRyv60mHDUvVFC/LUQqWVAx2g7oJNxauWQ=;
        b=Ay8TwimLtCIUdsl/0/abblWRuLZiq/l973dYjMpSAmmQ1kpXnYm/RnbgmBdSfQnqhm
         VnNO3mgrm6TnkWzR+0jMXZkTVSGv/i7AZkBA9znI3un+zgM2/TSAaYBAlK5CgvD5if9R
         j7NqFxeMzpWxuRxyfOymSMhtF0HXgzwezp/wB797Q1sd5gRj37jzXMB3eXRQ8sNeRgWH
         6gZ4NcoF5+6+ui46wP3XpMlQ1MOa+hTTMRN0J7r10UhwI70dRknZt6rMVLbQsjZOZWU7
         D9MP13ESRiXls1D1wLy72e/9vffIhWeJwNrsn1NOlim7U5jzSs5mPMJ2vllrHWRejcED
         XQGA==
X-Forwarded-Encrypted: i=1; AJvYcCX1kd2DJCuHfUK5MU6MmkHUnVpIsLCjuvHwXifw4g/ew2q5OsRy8Qo8wLYWJzYaLWTFyCNUDqPWiuJ6t1z1xO7Baw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxelpaQXYnSwmu1n87J5z579zWtaPI9SJNcY/Vucpr3P4HtL/ip
	V5oG8UFjHFMMoTNJUJOTANUua5yACVJZlip2W9Lg7KtfYwbh6U5/mxhpz5nlN5lgeL0=
X-Gm-Gg: ATEYQzw2ygf0A1RTw7+ceLFYdeTzBwDa7d8gnAhMTf0txRI3XnlY1xo3Knj9NGYz/CT
	ZAUkF4eYPcIexNDV+GzN9EDM9XInsZuI5T7rl/5w92/h2jsLnOUsQmafXw3JcHbHvGDqc8yehRN
	oR63iqwzvMAbToCa2y4c22Rb0dAExpmFUQOhbdSFLK38uPpw07RsvO8sgKGsDN4sJ3tnwPoo5zX
	mfYF21mzvRTY8SWxLBbq2BiQy0D/P98l6xY7qUhdfxsYR12Pdt5BEmXOF6jNwDT/ttMLBdG2j5u
	oY0tJVefSZiv39ARqASiNj8BgNmA/OxdiCSAw3tmILznS0XwTyX1M1rYGti/B+BcND1DufbsB3L
	ukVbR5WdhWxS5AbJNUCaN8rXwWeLP+XQwoYtkfNzPnF7XKIIDHNyHbi9z7GNBChYxdb9obr+tAj
	6dmY5Zt3/Y91qQJzAzle7nC3N3QFozoITwNfeauVQ57E+UTDD88DilJrcC1d8x
X-Received: by 2002:a05:6122:4f9a:b0:56b:8ba0:fd6a with SMTP id 71dfb90a1353d-56d21d07a9dmr3660677e0c.0.1774518183454;
        Thu, 26 Mar 2026 02:43:03 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d31d394fcsm3411252e0c.12.2026.03.26.02.43.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:43:03 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ffc879c1aeso497379137.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 02:43:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWB73mjp9mLMYS1gr7YZnET6XLd1/dctcsliznRkUtiuqQdOy2D43hehLUXZhna3yPuqz1KKFZm0uDzwPbpEb9z4w==@vger.kernel.org
X-Received: by 2002:a05:6102:2912:b0:5ff:dabc:db3c with SMTP id
 ada2fe7eead31-60387434993mr3725937137.33.1774518182764; Thu, 26 Mar 2026
 02:43:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251010-kakip_eth0-v1-1-0d8fdcbceb9a@ideasonboard.com>
In-Reply-To: <20251010-kakip_eth0-v1-1-0d8fdcbceb9a@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 10:42:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdURyu4U4ndv=YE47o6S_9O6eKVJKw_O=g+1c370Y5oTUw@mail.gmail.com>
X-Gm-Features: AQROBzDbZehn_4D-IYCZOycaqBEf9nJApEKcYwJ0UO0dOgClazFf2m0HC7BXIuk
Message-ID: <CAMuHMdURyu4U4ndv=YE47o6S_9O6eKVJKw_O=g+1c370Y5oTUw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r9a09g057h48-kakip: Enable eth0
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30320-lists,linux-renesas-soc=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.3:email,ideasonboard.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 363CC3328AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Daniel,

On Fri, 10 Oct 2025 at 13:11, Daniel Scally <dan.scally@ideasonboard.com> wrote:
> Enable the eth0 node and define its phy.
>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

A few more comments, due to recent evolutions.

> --- a/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts
> @@ -50,6 +51,33 @@ vqmmc_sdhi0: regulator-vccq-sdhi0 {
>         };
>  };
>
> +&eth0 {
> +       pinctrl-0 = <&eth0_pins>;
> +       pinctrl-names = "default";
> +       phy-handle = <&phy3>;
> +       phy-mode = "rgmii-id";
> +       status = "okay";
> +};
> +
> +&mdio0 {
> +       phy3: ethernet-phy@3 {
> +               compatible = "ethernet-phy-id0022.1640", "ethernet-phy-ieee802.3-c22";

Drop the latter?

> +               reg = <3>;
> +               rxc-skew-psec = <0>;
> +               txc-skew-psec = <0>;
> +               rxdv-skew-psec = <0>;
> +               txdv-skew-psec = <0>;

txen-skew-psec?

> +               rxd0-skew-psec = <0>;
> +               rxd1-skew-psec = <0>;
> +               rxd2-skew-psec = <0>;
> +               rxd3-skew-psec = <0>;
> +               txd0-skew-psec = <0>;
> +               txd1-skew-psec = <0>;
> +               txd2-skew-psec = <0>;
> +               txd3-skew-psec = <0>;
> +       };
> +};
> +
>  &ivc {
>         status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

