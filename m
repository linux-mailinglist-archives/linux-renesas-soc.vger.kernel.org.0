Return-Path: <linux-renesas-soc+bounces-33335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEFRKURjGWoBwAgAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:58:28 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8336005CB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 11:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C8B1C30BEA83
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 May 2026 09:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A096A359A6D;
	Fri, 29 May 2026 09:53:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723721E1DE5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 09:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048429; cv=none; b=DnCJuteRKimpBHG6VZt6tpOvTsf4otXjSgvg92huGojXp/5TS36rcTThp6UgiQ0F1G0Z4D/o9DEZKs0BFhz3/8qgjEY1RaNJGYBtfHCcVS0/f1yjLMw6LkGGOEd3ORZ5wRbR0LYLQTDm4ghgwhwZHm2/UT+gJF6wQNQUfkANuxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048429; c=relaxed/simple;
	bh=PNxZ1ZSWxQktRel0VIU9+ncnpbyTsai9GjZU4o8X9AE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eMxAt5NVW+jkTUFnP8Dy24IHY/cYKomOcX6NVu/qWvsxG1PkhW+PAMEyeVBubSTtR447J+ZsXRgG8yNIRSMsnrBC4zeUipbGO0ODTZNnWk95fmslFi0vlV8AUG789ERHwHRT6ucUoj5e7I727htuuc+ibbQQdAnFfMtqbgKGEtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-95f61c1ace0so8320790241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780048427; x=1780653227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62xqlDQ54Tz/hWgLYE0Bl+jO+OO+Qog2TKg7daGuCMI=;
        b=KQm1XPNeVejs8x9kMPRm9LPxFKGLO3dns80OfiNxzoAHuAZHAY++N2qa7T9uJeeKqF
         nGkS4APJi1jNknG3w4FjjMccE0QLmcSP8hcr7GOe2tsDDNB+JevcR4+3Oq2G3d4Q5uwW
         b2U2GJMUmQhWOds0xJyvG7owT7n7YyvRRp14Ft/gTV5MzDj0RAUp3qZS8MVvHlp1yPSH
         /MjRaOfACwJaBHMAo0OvkLVHP8fKo9Ailx9JNjce0NuvIGmUw4akdEB3LnzyR+6pVLzU
         UAuKayOMhKy4v1MDf1IfJClzSVo9r1CZeyUAw9f6r0gDx1pZQgf200SuI0oTXcPQv+pE
         0Nhw==
X-Forwarded-Encrypted: i=1; AFNElJ9jRdDFVkTCTlxDtHeTfh5MrlcW993Vi0hmUdDEu0XZYEI0ZtHx3hW2udy1Ow6azzxtSUOkzZ8yUrcpBulpQRgI6A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs+ZcZwbOHurqi12PQHgV9J3LVLO0uoLCce0l6QVcj1KL/W3OV
	zv4BPGXWafkcs4Q/06BCU5QB6pxZu1A9SPneYEdIooGWqGnOX69X/r26JrsLbNtnTw0=
X-Gm-Gg: Acq92OH3PU+AQtomdKV+B0o4DL/enwYj02rZzBBxS2WG2O1ckV//PZJN6R5oN0zpxSV
	iqU+Pw4pyVgzYy44rEaSrzmQwkPB4KMCDB1VkW5mn7r+jwhQGK4itNedk7qWs6yZTcUCWBGuPJ1
	XtB+3mTzIfKhhudCui7DuepLMVGI1wMRICYWr2ixu2Kwl08C7tJLsWZZ/qhVS+UUxyzzGRo3lAU
	8MsUC2WYrMJ5Iau/CP7jgSVy8sjHMUGoqEoNvXV8vtq55ivor+xs8jGwQHey8oqgpGN4XlBKrcV
	8G6uQLbgJ7/hUTZfcBkgw+SvdoKmlf6ggp9zPputageiK1++cH+56FRnwardLEmnLa8lZfwm8R7
	H+8WET9kEXf11VbkdnmKoB3dmPRU5a2cgwMT2MG7oL0rVf/sIEe/fbXJFf5B1IfwtUnMofVnaji
	zrPGn9mEgLaSspxEjO+6IDdhFcgaVhKN22JWY3f+w49+GzaGpDUiGaRtwzKJ/OlEHS+z1/m0Q=
X-Received: by 2002:a05:6102:948:b0:62f:5908:648a with SMTP id ada2fe7eead31-6bf40c92146mr707609137.28.1780048427371;
        Fri, 29 May 2026 02:53:47 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6bfca34f6basm671673137.10.2026.05.29.02.53.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2026 02:53:45 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-95f61c1ace0so8320769241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 29 May 2026 02:53:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9d3PtDjDEG7v2rIA2p2gTzaR1cZqbMPLLmDKuEWhfT9AteHfMv+9NEfSqjaKqzNq0Hra86M2LSEgGlCMz1MWjfjQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3e19:b0:604:f155:9374 with SMTP id
 ada2fe7eead31-6bf39268585mr788185137.15.1780048425234; Fri, 29 May 2026
 02:53:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519100022.116318-1-biju.das.jz@bp.renesas.com> <20260519100022.116318-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260519100022.116318-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 May 2026 11:53:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXEnidpA01431Rqm_X1ro0XD0zRXuYEao1Y2H5dB6BF6w@mail.gmail.com>
X-Gm-Features: AVHnY4IgytCf4g4vVvkl_DTDux6ZbuRTuEGS5daghZ0sc-QecbMVbcW5iprm0YA
Message-ID: <CAMuHMdXEnidpA01431Rqm_X1ro0XD0zRXuYEao1Y2H5dB6BF6w@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 rsci{1,2,3} nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33335-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.983];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,renesas.com:email]
X-Rspamd-Queue-Id: 1F8336005CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Tue, 19 May 2026 at 12:00, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable rsci{1,2,3} device nodes for the RZ/G3L SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
> +++ b/arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts

> @@ -147,6 +175,37 @@ ssi0_pins: ssi0 {
>         };
>  };
>
> +#if SW_SER0_PMOD
> +&rsci1 {
> +       pinctrl-0 = <&rsci1_pins>;
> +       pinctrl-names = "default";
> +
> +       uart-has-rtscts;
> +
> +       status = "okay";
> +};
> +#endif
> +
> +#if (!SW_DPI_EN) && (SW_SER0_PMOD)

Can 't you drop the last part?
  - If SW_SER0_PMOD is enabled, rsci2 is routed to the PMOD connector,
  - If SW_SER0_PMOD is disabled, rsci2 is routed to the M.2 connector
    (replacing rsci1 above)
In both cases it is available for use.

> +&rsci2 {
> +       pinctrl-0 = <&rsci2_pins>;
> +       pinctrl-names = "default";
> +
> +       uart-has-rtscts;
> +
> +       status = "okay";
> +};
> +#endif

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

