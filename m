Return-Path: <linux-renesas-soc+bounces-30204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YGWKBWGXw2myrwQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30204-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 09:05:53 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 852FE3211E5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 09:05:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1F2C30C7E7C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Mar 2026 08:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 122DB3033E3;
	Wed, 25 Mar 2026 08:03:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB8C38E109
	for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774425796; cv=none; b=KlTbMhKJTuU8IfvYNM3HRZcF8oT7BKRpnv9GbJ3M5GQA/f8H9pWs5ezF4yWcGqWfUvhFPMhUItjtbW5H5OhRF6gM38DqJTuWSo9uhlXctiD6W8fVtxQUFEmfMtsWaHa19HXVLMGl+W4/W5+YRyhfh1lo8OILBSDDbW0TwH3VAsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774425796; c=relaxed/simple;
	bh=ZYG/k7kjLeCs+G5BXN/DGjRFcRRtBzlVxNoa6nU4SS8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EF2YNO7v9mQrr8DSeB9HdLXw4P0npfSnXIR/Fez+NMYSGS3e086WxZM9tChFcLP6QiISwBBBmTT8TC27eBbBEbjClDzbcAQQgrPbltE/GZEUrLK7A92oVcSTEStwJr9vRCw13YOQLyQwK4PQCF5rRMPg3wgoM2fZsbw8/zYjfP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-951a4e8d1b5so245867241.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 01:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425792; x=1775030592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zEgogPO73kZUH+F/LPjEzcWkUO0MFC82X3nlBvBxxvY=;
        b=LpcQ0wpCq6dcEeDtAJzYAefiVGN3TM6vJwGiWIni+MKPt9O6Tpe8GiyOpjHfMaCfoL
         9YEq7qhCs2oSYvtP7NGs/L9mCaZ8OTyp2B1u7SKuf5GIv/JyAv/sV1O/2wQ6NmmvYVxX
         nw0VTJsZAy/jWwW8y9kY6018UzW+hKoagf2vcdg0gZNVxVlpFVmh+u8CyJp5kd7wytVx
         YebNfuAA1QAcPXata3+ci5YuEGup2EgW0gko4Eqgr7FMFllI8wi3LvOoceK7/jIMOvs2
         CwdilG0pWgOQTfnUTzkwdKbpn/SfnJ2sLc1G3ZkIZMesx/CWSRG96mgeDiHzewPlq+bz
         i3yA==
X-Forwarded-Encrypted: i=1; AJvYcCW+xjisLp6mNvw+++DwxYXHad3c4TFUK3d1NewpaQc46wOxlUKqk2LenE2LJFekHA2TuaInX+rNGwvqiUfQSLeCTg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybdmFBhBg6Lt5G4MoNhlhzESD0zZ8zjr9pvZ0JlAlWWuvNm1+v
	Av1VW1DjU2L/wtsDBwTUsbYo8RJlaru/yiVdnGmeYR7WAw7aEziUBKFuuSkjae81BdQ=
X-Gm-Gg: ATEYQzxPPJAbqvbQLu2bcPZXARDETOchzQZ681+0uYE4COlk/WfsvxFVXAf6HYhPJom
	ak2x+9sQVbmEQspHv5zoO45fsGn8S1LYYqFCV3wHdt4i7DJCjbhD9Yp3at3Anw/b6NfVVdiaqEx
	4V0oElHb4a32lGGDZHwQqwBVYsWSnVt13ZFv4Er4MtlWudIKi+4O/KeTUujY5f2YJ9bP33LUvt+
	twdKWnXNNkZXMvAK5VlMR8B3UpWpEmaTVSEN3Jq/m+AiJyfC0+jAm6dSOf/s/FAsTP4tmWGKPpB
	FSctQle2VUfhvbgmGM6OT0TJ/+B2t8iTb2LQ/l3Kf/3vCDvCljpWmOp0pZe5AU00NPsK/lrXV3h
	2OZZfH4pIhUUgXAgC/WtgxrnONAp28QXTlXDEDlYBiWX/+m9vh+cNwfFeX8Z+0aAZniQ5wK07Jp
	oS1BrxqJJO3A8HK6kZRBvBu+d23MPwXBr5eLCe+JQlIhEip/OZLAvK0shUYbds5Lrk
X-Received: by 2002:a05:6102:3e8d:b0:5ff:a51b:9f02 with SMTP id ada2fe7eead31-6038728a8d2mr1058432137.19.1774425791891;
        Wed, 25 Mar 2026 01:03:11 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602af8ae780sm13273524137.4.2026.03.25.01.03.10
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 01:03:10 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56cc6fe8815so2708762e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 25 Mar 2026 01:03:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWdP26HD1Dg9MUQm1u9RD1bsF+w27nBsCwUJ0tczHFtFPP38MDkGgJpyKf1M90MIsUGhVBqKhUej493pmDRkHDjuQ==@vger.kernel.org
X-Received: by 2002:a05:6122:311e:b0:56a:e0e2:69b3 with SMTP id
 71dfb90a1353d-56d21cf9aa1mr1214240e0c.0.1774425790419; Wed, 25 Mar 2026
 01:03:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260320112838.2200198-1-claudiu.beznea.uj@bp.renesas.com> <20260320112838.2200198-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260320112838.2200198-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 25 Mar 2026 09:02:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUw+Dg4wEv9+F71aWgY9SLxPO6DyXO+30Gi_sNFpxechQ@mail.gmail.com>
X-Gm-Features: AQROBzBTFk3wDshBCZKCcekMpDggyNDKzrPFZ_w0YB_UnpLQ_sKycSkS0HnN5zA
Message-ID: <CAMuHMdUw+Dg4wEv9+F71aWgY9SLxPO6DyXO+30Gi_sNFpxechQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, lgirdwood@gmail.com, 
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	p.zabel@pengutronix.de, fabrizio.castro.jz@renesas.com, 
	john.madieu.xa@bp.renesas.com, kuninori.morimoto.gx@renesas.com, 
	tommaso.merciai.xr@bp.renesas.com, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bp.renesas.com,pengutronix.de,renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-30204-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 852FE3211E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Claudiu,

On Fri, 20 Mar 2026 at 12:28, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On Renesas RZ/G2L and RZ/G3S SoCs (where this was tested), captured audio
> files occasionally contained random spikes when viewed with a tool such
> as Audacity. These spikes were also audible as popping noises.
>
> Using cyclic DMA resolves this issue. The driver was reworked to use the
> existing support provided by the generic PCM dmaengine APIs. In addition
> to eliminating the random spikes, the following issues were addressed:
> - blank periods at the beginning of recorded files, which occurred
>   intermittently, are no longer present
> - no overruns or underruns were observed when continuously recording
>   short audio files (e.g. 5 seconds long) in a loop
> - concurrency issues in the SSI driver when enqueuing DMA requests were
>   eliminated; previously, DMA requests could be prepared and submitted
>   both from the DMA completion callback and the interrupt handler, which
>   led to crashes after several hours of testing
> - the SSI driver logic is simplified
> - the number of generated interrupts is reduced by approximately 250%
>
> In the SSI platform driver probe function, the following changes were
> made:
> - the driver-specific DMA configuration was removed in favor of the
>   generic PCM dmaengine APIs. As a result, explicit cleanup goto labels
>   are no longer required and the driver remove callback was dropped,
>   since resource management is now handled via devres helpers
> - special handling was added for IP variants operating in half-duplex
>   mode, where the DMA channel name in the device tree is "rt"; this DMA
>   channel name is taken into account and passed to the generic PCM
>   dmaengine configuration data
>
> All code previously responsible for preparing and completing DMA
> transfers was removed, as this functionality is now handled entirely by
> the generic PCM dmaengine APIs.
>
> Since DMA channels must be paused and resumed during recovery paths
> (overruns and underruns), the DMA channel references are stored in
> rz_ssi_hw_params().
>
> The logic in rz_ssi_is_dma_enabled() was updated to reflect that the
> driver no longer manages DMA transfers directly.
>
> Finally, rz_ssi_stream_is_play() was removed, as it had only a single
> remaining user after this rework, and its logic was inlined at the call
> site.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- a/sound/soc/renesas/Kconfig
> +++ b/sound/soc/renesas/Kconfig
> @@ -56,6 +56,7 @@ config SND_SOC_MSIOF
>  config SND_SOC_RZ
>         tristate "RZ/G2L series SSIF-2 support"
>         depends on ARCH_RZG2L || COMPILE_TEST
> +       select CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM

Please drop the "CONFIG_"-prefix.

>         help
>           This option enables RZ/G2L SSIF-2 sound support.
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

