Return-Path: <linux-renesas-soc+bounces-30378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCuSGhhdxWlM9wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30378-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 17:21:44 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEEB3384D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 17:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AAF8230F48A1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 16:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A5440B6E8;
	Thu, 26 Mar 2026 16:12:18 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBEC402BB3
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774541537; cv=none; b=lz2aUQsyZaOT9DTBFZT+99cKrmCJIy/l7CPq4wIh7ATkJmDbUVoS2yybwJ9KmAUzEVy5LVD+bJwr7zoMejDbNS6m+c3cdo/5B3eRJPco5NoEPe2lAeIzm7wmJ43dZYAXIDKxpAiBpIrJyjOPAX5uRFlfor0DYoVcwwZ8Aits+oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774541537; c=relaxed/simple;
	bh=rNsqYs9XZiNIs58rpzMtgeYcYIlt3WXgo1ohw4icZf4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Im/8kVrcgLi0wbJwTssP/WSgHy7nSmX7afrXJygEyQ6K/VwjccxzbCx3TAz5XE4rn8vN0oHDqCRs06ipnWe6iFHB676HFzHpsAYNwkLsIFz5vDPrhR5kx/9m/bSXCcVbvO1gY3dS9tU7WgYAEa0Auw3dUHuDlr7hJcqasQrZmTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5675d609621so1020363e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:12:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774541535; x=1775146335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSoOoWFbk127jfYcbLQVHGWRDLpMWSdUjX9Ohf2bfKM=;
        b=P85fcvmQP9dts2TxM47ikl0nySMX+WVuBuxUe2yVRDStvvma3oC1KwN1lFAJAguT4A
         yXVb9Sg1frmQ1y01RkNNrUvyr7MVifS/iQUcGN8AP5RCd/STKRy866bgKE+pETTJEng2
         cGVSrwYgqguFjwT17C/KxAbI3lVeE7q6fADMurYUam4Vl4uRbyExT1esHDkHTU/29/Lk
         vZouAUUA6f0tNzqPSLVwI5riqdOPp7hkOPp91Q6rAH8De9pMh7RzY3rFyFUeRa8acT7I
         tomp/vtCJpWH29gNwudGhYFJXITtvevPZTXkD2ESOQOcrSgnr24PeWDvA97EQNpovzCL
         BxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMkvowjlDc0NvoTvEJ5zMdrVuEX2qfnwaHyeIoJ4BgGXu9X93P6MnJUnxUA5h6ILDXKoyNWsv26VAL4BNlM9BhGg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4hnwT/ifUk5cLAal2dW65BQFSxzKyEgLAi9Q/UWsYTjAW4f32
	eoOpVE69sRnGlBkErHagxfcxfaDiNiEgK11P+Xkymh5rvCsoowbkgcRF1rweY7YMi4g=
X-Gm-Gg: ATEYQzzv4esGDUKXHmMyjRlttHDMQgRkmzydB1okqI70sYG/zF3ZV0VWjP8kGFUuut/
	Zr62MGoOJF6I4Cj+daf/jj95tXWYpC1ldIryZx9OUPPgL0PqoZ+Fk1KXhfDfpMhSAO53U4HSoMo
	wsARLbtivuuw7rezx/tvF5cOKbJEWTkQV1roI+JOGtA7IfUDG5LRWSN3cDZM20a2y5yiEutUu7V
	UzXGc5vJ39pXxguW5hZOXNUsUz7XcX0Ad9KDkOb6mylrNBrBDxuCxg8QBeSuo9sXuXEbZ9RkqLq
	tb/FWaAUZN6/bH0U9HiYfm2O3UU+n0feu/JzJ6kiXkwOeoHy9etKoUpuRGPYcapASjo/Yo3EeMK
	Xx5aGQP0ekVLGuJlh0X9uTT3tjZrevMXi0RVEsJQZHaWU1wkFhYOziD8rmv3KLhh3YP9jQ5ZFXu
	fmrEi7XKiE7Gsx+9/VgEZqMVUBinLsS0eUUqXmwd1FkZk0xWcTudcBtB9Aqi/W
X-Received: by 2002:a05:6102:8016:b0:604:f155:9374 with SMTP id ada2fe7eead31-604f155b637mr534244137.15.1774541535406;
        Thu, 26 Mar 2026 09:12:15 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-604d531357dsm3560164137.9.2026.03.26.09.12.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 09:12:13 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-94acb3d6cceso655558241.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 09:12:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUul1QCN4acltlhoOyl0etAxkX8kxTyWD9MHHoC5r0fXmmcrvL8A5EHppXOzgSl59KhVgBQj45TcvUVwi0QsMse2g==@vger.kernel.org
X-Received: by 2002:a05:6102:6c4:b0:5ff:1cc2:aa8c with SMTP id
 ada2fe7eead31-60387536b11mr3781605137.36.1774541533179; Thu, 26 Mar 2026
 09:12:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260319141515.2053556-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 17:12:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXzWFHxeyR4Z4fLUc-QhwPK1RnB5VTzQODjzoR6oDwKHg@mail.gmail.com>
X-Gm-Features: AQROBzB4lDDc6Paz2lavGGOEVw_oYmGOkaXAJNxgaMlSXZ2W_dPOAbJR1CHRwrA
Message-ID: <CAMuHMdXzWFHxeyR4Z4fLUc-QhwPK1RnB5VTzQODjzoR6oDwKHg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: renesas: rzt2h: Add pin configuration support
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30378-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,linux-m68k.org:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AFEEB3384D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Prabhakar,

On Thu, 19 Mar 2026 at 15:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add pin configuration support for the Renesas RZ/T2H SoC. The RZ/T2H SoC
> allows configuring several electrical characteristics through the DRCTLm
> (I/O Buffer Function Switching) registers. These registers control bias
> configuration, Schmitt trigger input, output slew rate, and drive
> strength.
>
> Implement pinconf_ops to allow reading and updating these properties
> through the generic pin configuration framework. The implementation
> supports bias-disable, bias-pull-up, bias-pull-down,
> input-schmitt-enable, slew-rate, and drive-strength-microamp.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v1->v2:
> - Updated commit description
> - Dropped 32 bit reg access for DRCTLm registers
> - Switched using to guard for locking in rzt2h_pinctrl_drctl_rmwq
>   helper function
> - Dropped using RENESAS_RZT2H_PIN_CONFIG_DRIVE_STRENGTH instead
>   switched to using the standard PIN_CONFIG_DRIVE_STRENGTH_UA

Thanks for the update!

> --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c

> @@ -54,6 +56,16 @@
>  #define PFC_PIN_MASK(pin)      (PFC_MASK << ((pin) * 8))
>  #define PFC_FUNC_INTERRUPT     0
>
> +#define DRCTL_PIN_SHIFT(pin)   ((pin) << 3)

"* 8" sounds more logical to me.

> +#define DRCTL_DRV_PIN_MASK(pin)        (GENMASK_ULL(1, 0) << DRCTL_PIN_SHIFT(pin))
> +#define DRCTL_PUD_PIN_MASK(pin)        (GENMASK_ULL(3, 2) << DRCTL_PIN_SHIFT(pin))
> +#define DRCTL_SMT_PIN_MASK(pin)        (BIT_ULL(4) << DRCTL_PIN_SHIFT(pin))
> +#define DRCTL_SR_PIN_MASK(pin) (BIT_ULL(5) << DRCTL_PIN_SHIFT(pin))

I will drop DRCTL_PIN_SHIFT(), and replace it by "((pin) * 8)" while
applying, for consistency with e.g. PFC_PIN_MASK() above.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

