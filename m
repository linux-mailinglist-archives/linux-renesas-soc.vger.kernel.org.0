Return-Path: <linux-renesas-soc+bounces-29485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHH8F7gDuGlpYAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29485-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:20:56 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BD529A3E7
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 14:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 52AA230791FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 13:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E61D397680;
	Mon, 16 Mar 2026 13:14:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576FC397698
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773666889; cv=none; b=TzF/mTvmm3xPwPmmu+qrKuS8mL9dSg+lA3/r6xFcGoZ4p5gbcs5uQ+iUCO2tCoxQBGaLMU/kYxRmbFMZp0hIedxkBS/yZ1ZoNaz2a5A2T0u5WKxdQtiW3zjCaoVc9Y0cbY53ESU/ngWn4mFWlrUPO3Via/0cjPZSeTZZm3dMGvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773666889; c=relaxed/simple;
	bh=DDY7EYDhWeOmwSs8atxp+sr5B+S6sv76cVNjMqxsV1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EZ+jYrp1zjBpT+RcBx1+jJdr/DyV52GjupR7/7uRJUABp/Jh54N+h1jiyKWR/UL92KBqtPSOLimj07qtQzXON0IDO5hxHXS5ozfO76yT8bS15kR9wmoCXJboljFymIbyDbTk1RdSBq/wXnxM2+CiF2ojhnFSvFWkFSoLOB+Ff4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ffa277c156so601473137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 06:14:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773666886; x=1774271686;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+36MhJBSl35eE6xuK7IokZVVTyDXo3UUbxp5wEXrbos=;
        b=W5QpsSrye4qVqWFEAfioe1K7s6x+gN5VH52VNUAc7MlLUjvmFGdIhTLqd3FftS7di7
         XAYRC772Tyd90R95JLIXZ/mcfb3sT+vcQZ4eapMwSnSXrPRuQrd7ZSE9Sr40JpQe4cuj
         EnFhjrMGVRf631+HyxuaUvF4bWwPGcPb18GfSgxje18HwR/Nt8PsaQLEZkGNP6cUWpDM
         nWrtGP/2p6cVAouddxPBi7TB/6cIlpXzb1QJV4aJ/eS2nJZVY7NVeucmj/vT0PBLeKHt
         kuclkybt99nqkX4EzMK5mFJwSkx78kfFbPToVbi10zc+bMmBsm3PSgeETFrVldTFHMfe
         Wwag==
X-Forwarded-Encrypted: i=1; AJvYcCUnXrrkZaCSiMOsUpUdGnDf+eSNFe5LLsJCep3MvezDOHw8kz7mu6hNmSoC2EU50JqSZgFaSMZTqkGZswcIwozKUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKC8RY8PU9xTk6SJFveAJgUAwi+gEqqu2r/kcpNggpuNM1fr2W
	mwfyoGsAxbuMFKhlMwg2R4ddHg7dU1WFdzujCVfUMJlO+LLHMZRiNO4xl2HQaZ8O
X-Gm-Gg: ATEYQzyilbE+bI6XabziTNOeVvkOOSpljBgFIPi6e8j0BtVGn1sgexxqPGOr+7WqGAP
	eylJb8eRjBOTFfpJfZudE33dlAvwmTYbxweC59KW/XXuQG2Beb+nmqCNhVW2SjHqHpJQWjUmnvy
	R/uwPilS6+En4rVjGTbkTIEbYwand5tYDvfNWnMq3efZv//3zXOmC4WMZ83BoLdznDUHCeqIjb7
	JL3ZehMbuxQcAvBlzIFxYeA5DGWR+GbzxuWaB5qFSPrHx1swSzyoNGcKWkF8AgKN65Z8jijk6Zx
	pTz4GTcmvZBcRZk7BkXUJSVDd1E017Gtcrl2KB6mmqaSSHQdHlCGW8cC5x6VJE8wg4c9tkVhJnG
	6Cc59Dbsm96AeAfyb5PnPPt6/ZOrrLAVSA5XLcjxl7A8/nwuQntlxF07CezuflLckbgnmmo8pix
	aOF897Hc+iSVaJBkgXcCzPxjkplgUjyUZfVg/4xJYAjijG1bV8ELwVbjPDzvv+
X-Received: by 2002:a05:6102:290c:b0:5ff:a16b:93f8 with SMTP id ada2fe7eead31-6020e176e70mr4367840137.6.1773666886222;
        Mon, 16 Mar 2026 06:14:46 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecff71462sm5726634241.14.2026.03.16.06.14.45
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 06:14:45 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-950bcf4df06so399243241.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 06:14:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSA9jcYUDxA3D67o1LR/F8mZ9CajI3UZecfB6dl4iooJ2FZ78ANO8Ps8W5SeUIW80Fu5DmGIklYaX0M7/BGiBkTw==@vger.kernel.org
X-Received: by 2002:a05:6102:4192:b0:5ff:1cc2:aa94 with SMTP id
 ada2fe7eead31-6020e4d0d32mr4644483137.26.1773666884844; Mon, 16 Mar 2026
 06:14:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdXJQmfU0p=yk1kROTm=ZiiQoUHZQpw5kj813x=RWCS1fg@mail.gmail.com>
 <20260316112540.8636-1-phucduc.bui@gmail.com>
In-Reply-To: <20260316112540.8636-1-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 14:14:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBwNtdhZYnA3+nwe-CEmrUdPu_K7923uMY5qi9edbkbg@mail.gmail.com>
X-Gm-Features: AaiRm51t8uL0ZGlIo9FRuR1UhJ93R9SWSZBixMMZfa7Gkr4ku4NExUwiqJiqfiA
Message-ID: <CAMuHMdUBwNtdhZYnA3+nwe-CEmrUdPu_K7923uMY5qi9edbkbg@mail.gmail.com>
Subject: Re: [PATCH v2] drm: shmobile: Fix blank screen after resume when LCDC
 is stopped
To: phucduc.bui@gmail.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, 
	wsa+renesas@sang-engineering.com
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,ideasonboard.com,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,suse.de,sang-engineering.com];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-29485-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.969];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	RCPT_COUNT_SEVEN(0.00)[11];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: B5BD529A3E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Phuc,

On Mon, 16 Mar 2026 at 12:25, <phucduc.bui@gmail.com> wrote:
> > TL;DR it depends on kernel config.
> > With my .config, your patch is not needed (but it doesn't hurt).
> > With your .config, your patch is needed.
> > Unfortunately I haven't found yet which config options causes this.
> > I will send you my .config by personal email.
>
> Thank you for sharing your configuration file. I noticed there are
> numerous differences between our configurations. After further
> investigation, I narrowed down the main cause to the following debug
> options:
>
> CONFIG_PROVE_LOCKING=n
>
> CONFIG_DEBUG_LOCK_ALLOC=n
>
> CONFIG_DEBUG_RT_MUTEXES=n
>
> CONFIG_DEBUG_SPINLOCK=n
>
> CONFIG_DEBUG_MUTEXES=n
>
> CONFIG_DEBUG_WW_MUTEX_SLOWPATH=n
>
> CONFIG_DEBUG_RWSEMS=n
>
> CONFIG_DEBUG_LOCKING_API_SELFTESTS=n
>
> CONFIG_LOCK_STAT=n
>
> CONFIG_DEBUG_ATOMIC_SLEEP=n
>
>
> These options are enabled in your configuration but disabled in mine.
> Enabling these debug features introduces additional overhead, which
> slows down the resume process. This delay unintentionally provides
> enough time for the hardware to generate the Frame End interrupt,
> effectively masking the issue on your system.

Thank you, that explains the difference!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

