Return-Path: <linux-renesas-soc+bounces-28475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F2KAGsAoGlrfQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28475-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 09:12:27 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EE01A2588
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 09:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 13DE730A528F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Feb 2026 08:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5933859F6;
	Thu, 26 Feb 2026 08:09:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2180E2C08C4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 08:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772093368; cv=none; b=m+y0WZaNW07jMoRXNa2eYhZLDcDozfWNFFv5blCvAKOdApG/51RCWTv1cHoXXJChS7kp1IODNN38k98A45wYhyb2XJvZziBd2jMEDj3V+DEYpq3uQdloSgqyGKm/0w2YpkaKuxKPSuACKyM8NoPdZjGETHwF/ceviPnquI5ryBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772093368; c=relaxed/simple;
	bh=4WdaRgojKBKUTXO2hqOIT8A//U2HVyL+u4sHOXmxkxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jhr+sbfJekpEzUf8Jcr5wLF6Y0dw0ocMAuQHlJZgd0vBDZMapc4Xr+rrNNHRKXG7epbRZFSw0Ze0OAY8LsNRw3PKWERDtF0CLEPJ89LKOSO9MoiatCrZVZ1SXlCn3wTfjIlbSbhClTVLGTz+4zzjS4VWoDgzWL0JqtZ6w8CoqK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-567543b8989so257370e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 00:09:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772093366; x=1772698166;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMwst+L/dmOaYbXaIYLxxc9SkmqogXh2haYIQH1PaVs=;
        b=Z9Zt/7I3uFoyMMKksHRXN8bZR4/KYrEv0SkLLr6ujaLvL0KqMUo22FTEC4TyTDns90
         eDyYlttO9zqSPt9bVfcsI3r+gEOKwX8M9qsMJDX4KbvQ/Op+kN6udKViwZLQwkCy6a5o
         0cMBw3OgSCKUcR7RNn35tBzLEerATAKM5m3Xkfpo06zqRzC8K3MBxmxE94HpPRH4IVwL
         R0P9atN6Mc3Ps1qsm/Tk9TPVFrj4W6vIKZsWEWIZ+QxsUp/eCK2X7snUpkatI8wHWBSZ
         tgcUcMrbAsM10hJ13zBcRk75pJgtcj3gpHpz2la1DCdBw4MYhdVP07lhhAt6cy3p9OsJ
         7IEw==
X-Forwarded-Encrypted: i=1; AJvYcCXDh/uDChp/suw4eRmGTCfzgEO5eXOZFSxckm88UMJzRvC4HPzQQ7VCxVIAwkqxEoEtSusj30J0KbRFZqVCOWEFvA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk4QaQKP6kbB2d2pP/GPqJq9k1tLL5fYIELquuinDQZZyQJBR7
	l1bdmzjC5gLszEd+tEVHkztMgnDzYl46QBOBZQjwa6qbgfHHZrMDz2zunVMJo3LW
X-Gm-Gg: ATEYQzz9P1GOgg7vtFDVYXiIjbFsCwBa2/ZUu+ry5RldfjKFA2gJRDOuRIDQyijzMsj
	Iqn/CNDtoYT6BnZhEynLa4pWZMlSlN1JuMqdjhxKcClNjifBsEJ8ob7DsKBbE/0/2AilAVG5SNj
	+hBrhWkeYNcPjks1VIfap49+st0DF+8iLNiKyTEJyjrsw8m/RESrkaK3UThfEh4v5/oNbdSTfHZ
	tL9Uq4s4DPbyztBi9RCldxPvh3Rhp3i+1HYFxdgTXPWtFB5LIx+oFXdm0WwqXqeBI/uoTAV13vf
	mQ1aPdSqMbgR3A/mKsc7qXoS9FLXWQzVI519T1+qcNkzuIVm9To6w9RD72Jcu10M1xdO7C/A7sJ
	hEpJr1EdnrLnTKAX/Bs7/lcKqRRCZgE0ulN7HygKXGCoALuYtAc0wwcZrwqflIrADGR6u2VZ39b
	8B/3T11lHJGH3wVasfJo6GbxR4TDISGfw14Zsn778ET1cdOlUNBlbtoXNu3B64
X-Received: by 2002:a05:6122:ca1:b0:566:23b5:ced7 with SMTP id 71dfb90a1353d-568e479194amr7501200e0c.5.1772093365902;
        Thu, 26 Feb 2026 00:09:25 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91659421sm1929830e0c.0.2026.02.26.00.09.25
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 00:09:25 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5ff2139643aso106762137.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Feb 2026 00:09:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKnE7/D1/hsqh0kBxV9QBMEMD+GI4xpz3g/iT5pIwZaG0iQAT7VDzO8RF3LABfRxVJrsBty8MbjSfwALWkJLNziQ==@vger.kernel.org
X-Received: by 2002:a05:6102:f14:b0:5ff:1f6e:6269 with SMTP id
 ada2fe7eead31-5ff1f6e7e68mr545413137.41.1772093364755; Thu, 26 Feb 2026
 00:09:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260226051338.27460-1-phucduc.bui@gmail.com> <20260226054035.30330-1-phucduc.bui@gmail.com>
In-Reply-To: <20260226054035.30330-1-phucduc.bui@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 09:09:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXrYTGQkjC1Sr4NjOcsRyOw3_eEj9m5MVVo1GWUuCxo3Q@mail.gmail.com>
X-Gm-Features: AaiRm51XMkux3B1QqgjcHVbFdYag1eq8lj6Y0Kfg2ouDz7vKdp5cWOR8jMqmm4E
Message-ID: <CAMuHMdXrYTGQkjC1Sr4NjOcsRyOw3_eEj9m5MVVo1GWUuCxo3Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm: shmobile: Fix blank screen after resume when LCDC
 is stopped
To: phucduc.bui@gmail.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,ideasonboard.com,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-28475-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_NA(0.00)[linux-m68k.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linux-m68k.org:email]
X-Rspamd-Queue-Id: 79EE01A2588
X-Rspamd-Action: no action

Hi Phucduc,

On Thu, 26 Feb 2026 at 06:40, <phucduc.bui@gmail.com> wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> The LCDC controller on R8A7740 loses its register state during
> deep sleep. Upon resume, the driver's Mirror Register mechanism
> (MRS) fails to update active registers because the controller is
> stopped (DO=0).
>
> According to the datasheet (Section 38.7.1, Figure 38.13), the
> Two-Set Register Switching logic only triggers a change between
> Set A and Set B when a Frame End Interrupt occurs at the
> completion of a display frame. During resume, as the LCDC is
> stopped, no frame is processed and no Frame End pulse is
> generated. This leaves the Display Data Start Address (SA)
> pending in the standby set, while the active register (Side A)
> remains at 0x00000000, preventing the display engine from
> starting.Debug logs collected during resume confirm this
> behavior, showing the start address written to the standby set
> while the active register remains unchanged.
>
> Prime both register sets when the LCDC is stopped:
>
>     If DO=0: Use lcdc_write() to force the Start Address (SA)
>     into both Set A and Set B registers. This bypasses the
>     switching logic and ensures the engine has a valid base
>     address immediately upon being enabled.
>
>     If DO=1: Maintain the standard Mirror mechanism and MRS
>     toggle for normal, tear-free operation.
>
> Verified on R8A7740.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Thanks for your patch!

What do you mean by "deep sleep"? s2ram? In upstream, s2ram behaves
the same as s2idle, and the LCD works fine after resume from s2ram on
my Amadillo, with and without your patch,

What am I missing?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

