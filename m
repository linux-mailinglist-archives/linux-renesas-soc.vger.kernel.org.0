Return-Path: <linux-renesas-soc+bounces-27450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uONeFIOdd2n0iwEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 17:59:47 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 557E08B2EF
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 17:59:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 589BA300E472
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 16:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 737AE32B9A8;
	Mon, 26 Jan 2026 16:59:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B884433554D
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 16:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769446758; cv=none; b=JeVIggnhn2TtV2sCO1CkvjeEuK8rmtWc9Nbewrmb9OIDG+zFDr8c0h+LQaKLMMfP0p2yX9dhL42vdidrMzYow/aISRhS5dFnC1u86mMcocdBHwKYHNOEXJ2b+zJ3/+kG11O9iA4wtd+51PMlG8LtIzwijuTXSDFMkNOyoaBVhgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769446758; c=relaxed/simple;
	bh=r226rCK4LUmTjUdkw/d4TzoTnxW8rmQ0SA+5j+h9MbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqRuZjcPUFwUiqjirMjT7OEbkWITOUNLGg39zCEtdJxr8GqEKaar6GUpiraWZSlaxB+tJBP85AazoD1jFtv7nvsrksGFw1vKPdVeKOBK0DeXBQlhENH4xbBUAzoJv00mCCegvJgBkDb4tKrtkkNUq7I/4RzOk7Um6Lj1SA/lJKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5f56066aa01so1726614137.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 08:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769446756; x=1770051556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DX+hzkzvZlTATTRkV+7hBeNOQ+pb6333spkvwFjnnA4=;
        b=j4IW/HRC1CXy6nx1zti2YH3YoPi4AryiBqMsJx8cA8BVpPr/8dGTghUGfB/BHQvwLW
         DR5UmL4C/NGqQY41feInQJM9Eilqy1TAplGx9FOAcT3FkPItbVB/kO/s8/SjvoZ7SRLb
         lnNFJ4LyakswvK8FYh3sureXkA6PTE0YLWzCa73QrnfrCI8vwEa0udUadtYOS1SP9s0q
         7rwb6eIz0jAOQpxoiiZFz+cTJvVK/6K2/oA9ErjDl/uMZhgmBiUtrbOyKG8IIPS8LMmq
         q+S4xn+CZxTr0iXCWmgmIpQdcpdnZn6uAiLF19LhQ1gjrHWKUex9+9HwE0HoQrglhXpq
         ga9A==
X-Forwarded-Encrypted: i=1; AJvYcCXL7r/5nIZtV+izJBaZTjlWvJEV62BjrVicT3jJ/wdPFWx9GyM0131kk+26Xvti7qWPlvfJLMOo0zeuLiB0c9tdYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzfMeSrwNYtZw2qA/j5EN9b+HUVIdlaL1vssiughLqJdueZKhx4
	LpPFe+40E5aU0wpZsabHBMS0JvMj6q9S4N0S9PeT+1Xu1Rh7Rx+ypGIc/IgpVRdB
X-Gm-Gg: AZuq6aK64PylOGimFyXMdorsOQ/3dhNYsc+8bZ7PZMY9gRL1K1Oyfppun9FB1MUwFOv
	QyH+Eh9HnphpcEsaUzpC+6p6gLPOe73RPC+f19ov6YHin2nMAgoYhLRvRNmZAdp2wbLdbOo7T/G
	qrglyoBd206b9yrcq0HP94/QJ8gyRLosbIBArYHxKs8Okc24MGYu8gQxGHbDEav9Q2sS/aw6Yw3
	MtQohibSg1OsLeEGjOW2klHTiM9vwrlt+KTQENlJKs2jjMu1rEAa4USux7p2paj/opkzndP/TqV
	jLd68nZp4XEdX4x9EW7ZPTTP647+BhbPgVC62OEZ9dzwV6ddNa6K1brF/b+QLe2MlRz/3hOOW4P
	hdlFYVWaxjhlWzSYrKRoQDgzPJuIYj3tTckK7jEebPnLyb7dHQp8/uwoUbjY2+GKj3RjmBdLn2P
	6Q4zfTJESLAy4ITVu0zpSfxF3HwJ3m9zbCHSof5xxSefs4Or3y
X-Received: by 2002:a05:6102:c51:b0:5f1:606f:2a14 with SMTP id ada2fe7eead31-5f5764a4897mr1568673137.23.1769446755600;
        Mon, 26 Jan 2026 08:59:15 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d157564sm2162871137.0.2026.01.26.08.59.14
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 08:59:14 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ed065f1007so3100215137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 08:59:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7BtP+u8rRVKYiLZ/I3NdFPEaWesedfrEmTGuyzeRHOSD1CIBWJXpwGrK+HJpmxl8QmJMmRZF+1+PR44r6z+PECg==@vger.kernel.org
X-Received: by 2002:a67:c48a:0:b0:5f1:9641:4f2a with SMTP id
 ada2fe7eead31-5f57638a4edmr1135520137.18.1769446754221; Mon, 26 Jan 2026
 08:59:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1764241212.git.tommaso.merciai.xr@bp.renesas.com> <63e8022438eb0d485505c262cac383d76c804403.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <63e8022438eb0d485505c262cac383d76c804403.1764241212.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 17:59:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfsO1NVv6+N37C8ss3thKz+sANCtO00PRhgnD5M1cs0Q@mail.gmail.com>
X-Gm-Features: AZwV_QjJzffyx5kQPgMaSLBq9RR4EDkJTeL5IelsyAZXDhJ2Ar_AWtIKRIoFYWc
Message-ID: <CAMuHMdVfsO1NVv6+N37C8ss3thKz+sANCtO00PRhgnD5M1cs0Q@mail.gmail.com>
Subject: Re: [PATCH v5 15/22] arm64: dts: renesas: r9a09g057: Add USB2.0
 VBUS_SEL mux-controller support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Peter Rosin <peda@axentia.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Guenter Roeck <linux@roeck-us.net>, Mark Brown <broonie@kernel.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Georgi Djakov <djakov@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,bp.renesas.com,axentia.se,kernel.org,renesas.com,pengutronix.de,roeck-us.net,huawei.com,linaro.org,arndb.de,linuxfoundation.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-27450-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,0.241.62.152:email,0.241.23.136:email]
X-Rspamd-Queue-Id: 557E08B2EF
X-Rspamd-Action: no action

Hi Tommaso,

On Thu, 27 Nov 2025 at 12:51, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable control of USB2.0 VBUSEN via the VBUS_SEL bit in the VBENCTL
> register. According to the RZ/V2H(P) SoC hardware manual, OTG channels
> require VBUS_SEL set, while HOST-only channels require it cleared.
>
> Add `#mux-state-cell` to the usb20phyrst and usb21phyrst reset
> nodes to expose them as mux controllers.
>
> Set the required mux-states in usb2_phy0 (OTG: state 1) and usb2_phy1
> (HOST: state 0) nodes.
>
> This enables proper VBUSEN management for OTG and HOST-only USB2.0
> channels.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
> @@ -1034,6 +1034,7 @@ usb2_phy0: usb-phy@15800200 {
>                         resets = <&usb20phyrst>;
>                         #phy-cells = <1>;
>                         power-domains = <&cpg>;
> +                       mux-states = <&usb20phyrst 1>;

I am no USB expert, and didn't really follow the USB specifics of
this series, but isn't the selection of host (VBUSEN = 1) or function
(VBUSEN = 0) mode decided at runtime?

>                         status = "disabled";
>                 };
>
> @@ -1047,6 +1048,7 @@ usb2_phy1: usb-phy@15810200 {
>                         resets = <&usb21phyrst>;
>                         #phy-cells = <1>;
>                         power-domains = <&cpg>;
> +                       mux-states = <&usb21phyrst 0>;

The second controller is always used in host mode, so 0 is correct.

>                         status = "disabled";
>                 };
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

