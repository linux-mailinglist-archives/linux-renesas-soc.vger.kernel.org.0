Return-Path: <linux-renesas-soc+bounces-27433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCBPHdl5d2n7ggEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27433-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 15:27:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E72A08971C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 15:27:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33456303C2B7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Jan 2026 14:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE5433E349;
	Mon, 26 Jan 2026 14:26:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C7133DECE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 14:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437595; cv=none; b=pSnJcViZ8oV34FzgZFbeJNhgq5hauD0jxelIAU5MajEwDm2P81zPKHFVLPjwrZbyKUcTzdhE5IYNLri7ECE0whNW+wODGGsZg/EuFgLWybLD+VRSGU2yr40B9WIyiqcYQlMk0dSmWOuokYx6Oqxexc/k4vObid7sewk6Ht/WpeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437595; c=relaxed/simple;
	bh=PsOC2v/AYbvlfb4MfXbU5AGiA/whklG4mc3MblwxpCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mwQPlPA5MGkhU4xoJPwtTFM7oR2viE83PgWLd7Bbih3OXWd+TQ4VP9gEwE03r2OLppxfI1ztMqDW/V4FrcrbM/C1cIiDKW2RcUjIv0s+E1l4HJ3Pld9rv0GEyjO2fyo/ODTltxNPbTPjYCgrptQ2V5Z8HhyLGaw0hGXQz9RRAFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56376c3e866so4402101e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 06:26:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769437592; x=1770042392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7iJqQHbebbJvqdS+f32gVVmPeXTBs2LPTWdyCk8n5XQ=;
        b=ZzNUNU67zcdv+RSP24oBjLl0EPgHoa9+bODhgQfpwN2u/h2ObYO/yjDv5I3mgJaSOr
         paxt8JcKWTNn6xXrWK+oXy6AR1O0o+FhKdx6/Rh+q1mQ71nx7F2URuQIcilQ3lyRQs0N
         PibSAR5w33B9A4pS0QSe+bQLPTnaDiYwWXhUHTv6KUDGX5uH0XozGz3Kgmt930hUjFRF
         nLjidNvc9uDelouQkHLKskuWCg/Je/64JuhCVAs5J/9QJO7J/A2ETBdCblp+U+Ieykhi
         ItOs3FxbMHDG93OJU0/CVp1D2jDbC9R28QMms3MPGsy7K/eQLymHOYUTMWd4GRFc8k4F
         laKg==
X-Forwarded-Encrypted: i=1; AJvYcCU3iXQXFO0GMVpuKtDoUD1VgdJjTJeOQvtLmUTBqbsiIVSm0Rx5lkLRKdYGJBHQ1RU8XeKLCGtAbuHn1UYHcvseVw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyT2LCQlyFHGQ5PKi76iRh0EHmIKKM4fnQEvrVNGd931qtTOih1
	nRwZrHNS4KFSmHd90+4JGIwQpbHUffKnn0be7vlvGckGXsmqFkIvizzd9kiPdRW3
X-Gm-Gg: AZuq6aIRK0XYtYU4tTjN3P5cLeB/QkGu1T55fsLd+ox2AQwA2BCnchPk7ItwK9ixVgs
	N9NwYqMg8+jnbVr68G52oa2cP0u226D1toK7uqPBaIq/0+ExU7Htl8WA6O7Kb6nGSwiy8K8Ssxr
	yIOkWFftQmM+nGqNEFl60IU+of0Nr96hIVu//SMzvz2nEqfM32GYqxwJg978JOQHmjCvWBFYSea
	RLUlpJ4TuQU4vDp4i2a1cvYedqOLO2JSZVk2p0Ao0PBmTPqM/4dsxbVXs69iFK8zOI8MPw6lWxA
	cy+vzAvMZGqj5IDc4+Rpxkt3PWkmGP9zeg9VbYgUIfwiX0dJR2CITe9rsFozkXf5XeMPEtMeWMk
	vCxM6BNgsFRi/VKZBAG9CwL8V9X9iUbNANQrUNrYrYsgItIW/5VoPTSnj7saQSjO+1cXPHC4F97
	Sdp6rTAjWfap9M52AGzM+rf/hjfdYYhay21wUW9NMAEiYeDC+5DB94
X-Received: by 2002:a05:6122:2382:b0:55b:305b:4e40 with SMTP id 71dfb90a1353d-5665ca018ecmr1264843e0c.17.1769437591743;
        Mon, 26 Jan 2026 06:26:31 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb7e5c2sm1667529e0c.17.2026.01.26.06.26.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 06:26:29 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5665171836cso1476267e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jan 2026 06:26:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV9XL7W8vo3h8Hm41KZPnwwizvkOa+aS9FHnHdeKN1FZ/ecudQYMDfUheInJuhiEa2wPnFgjrrpIobhPPIWgqvzEw==@vger.kernel.org
X-Received: by 2002:a05:6122:82a9:b0:566:395c:ed5d with SMTP id
 71dfb90a1353d-5665c9d2073mr1538350e0c.11.1769437587151; Mon, 26 Jan 2026
 06:26:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126103155.2644586-1-claudiu.beznea.uj@bp.renesas.com> <20260126103155.2644586-7-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20260126103155.2644586-7-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 15:26:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWhY7nNanQ=h8HGrWyDfpCSL33QFJorhLCgnKASbmHiYw@mail.gmail.com>
X-Gm-Features: AZwV_QjS0M2A0ks0k6a-mivuyl26TKVYOh4l03PhTFHHbbMOHWiHryV9qXisIqI
Message-ID: <CAMuHMdWhY7nNanQ=h8HGrWyDfpCSL33QFJorhLCgnKASbmHiYw@mail.gmail.com>
Subject: Re: [PATCH 6/7] ASoC: renesas: rz-ssi: Use generic PCM dmaengine APIs
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: vkoul@kernel.org, biju.das.jz@bp.renesas.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com, 
	broonie@kernel.org, perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de, 
	fabrizio.castro.jz@renesas.com, dmaengine@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,bp.renesas.com,gmail.com,perex.cz,suse.com,pengutronix.de,renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-27433-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.993];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,tuxon.dev:email]
X-Rspamd-Queue-Id: E72A08971C
X-Rspamd-Action: no action

Hi Claudiu,

On Mon, 26 Jan 2026 at 11:32, Claudiu <claudiu.beznea@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> On Renesas RZ/G2L and RZ/G3S SoCs (where this was tested), captured audio
> files occasionally contained random spikes when viewed with a profiling
> tool such as Audacity. These spikes were also audible as popping noises.
>
> Using cyclic DMA resolves this issue. The driver was reworked to use the
> existing support provided by the generic PCM dmaengine APIs. In addition
> to eliminating the random spikes, the following issues were addressed:
> - blank periods at the beginning of recorded files, which occurred
>   intermittently, are no longer present
> - no overruns or underruns were observed when continuously recording
>   short audio files (e.g. 5 seconds) in a loop
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

> --- a/sound/soc/renesas/rz-ssi.c
> +++ b/sound/soc/renesas/rz-ssi.c

> @@ -1116,15 +936,19 @@ static struct snd_soc_dai_driver rz_ssi_soc_dai[] = {
>  static const struct snd_soc_component_driver rz_ssi_soc_component = {
>         .name                   = "rz-ssi",
>         .open                   = rz_ssi_pcm_open,
> -       .pointer                = rz_ssi_pcm_pointer,
> -       .pcm_construct          = rz_ssi_pcm_new,
>         .legacy_dai_naming      = 1,
>  };
>
> +static struct snd_dmaengine_pcm_config rz_ssi_dmaegine_pcm_conf = {
> +       .prepare_slave_config   = snd_dmaengine_pcm_prepare_slave_config,

This fails to link if CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM is not
enabled (e.g. renesas_defconfig):

    aarch64-linux-gnu-ld: sound/soc/renesas/rz-ssi.o: in function
`rz_ssi_probe':
    rz-ssi.c:(.text+0x538): undefined reference to
`devm_snd_dmaengine_pcm_register'
    aarch64-linux-gnu-ld: sound/soc/renesas/rz-ssi.o:(.data+0xc8):
undefined reference to `snd_dmaengine_pcm_prepare_slave_config'

Adding a select like this white-space damaged snippet:

    --- a/sound/soc/renesas/Kconfig
    +++ b/sound/soc/renesas/Kconfig
    @@ -56,6 +56,7 @@ config SND_SOC_MSIOF
     config SND_SOC_RZ
            tristate "RZ/G2L series SSIF-2 support"
            depends on ARCH_RZG2L || COMPILE_TEST
    +       select SND_SOC_GENERIC_DMAENGINE_PCM
            help
              This option enables RZ/G2L SSIF-2 sound support.

would fix the build.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

