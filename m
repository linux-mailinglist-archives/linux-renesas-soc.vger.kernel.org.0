Return-Path: <linux-renesas-soc+bounces-27335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDLiBLp8c2lowwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27335-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:50:50 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 645F17675F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 14:50:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E614301AB88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jan 2026 13:50:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA23F2C21DC;
	Fri, 23 Jan 2026 13:50:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FE92417E0
	for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 13:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769176247; cv=none; b=TCGaQFXD2adpd13WDH+izMxhX2jmL02gwaqV9hTGkufJ2uzVjdnLVX2c4lCtbKAwGQ5raxDSD3g2i423dVrROp3mqv3e9kn+I3Vgp6sVXJmM1FHN9yAsIy8WmEjUE9I/xALMl0GtlIfHzwJhwG58U3aXmxgZ4roABErRXucbOJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769176247; c=relaxed/simple;
	bh=0hwjiTdtsGb7eXLzTyw9ox8EL8oh0a8Wy0BY9afeh8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JSfbtlg6P4uiR70OKFjgzGxQZbpW+ALgfsYP3KpQ4qMt3PN/eupiYw6ar2tCuc7bqCxO7HdcXmatdGvsiY2yC52LMpmAieUesjDSo11q/K2VpGmM9DbbpxCnDfDBo0+rDUuYrBiIx6ePD9Ao+OUxvLRWFOOMO9b+ZLLz/1r/ZrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56643f72af5so144694e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:50:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769176245; x=1769781045;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erKWy/OEWmr/yg9KkMYnuhF8IxKQ1EzG0rrpKtHiTIM=;
        b=HMMJgvKaKJS7O0U0RiiwdZuy1lln56HMqLFXvWc5IInAtvOWzRI6XYblz1vXERgEOK
         Lh1TsFwV9tqRfmKTvpT6LI4fpQz9U4bk/kTQwj0xwMNCaWygX86XBtMR1wWr4FuQZoZa
         gIRqLyIey0EN4O4foX4jCtHSQT9WrX2r/FJeuxNBs1E2hcNqIO+FfufVbR3FHSQIHVms
         2AvjnK93NQ4eIItlZR7GMse+Mc2Eq8nc/TpcnO0l2vTcW8yPHyx/laxXtOPiu74de33y
         zN2V/6tNslKu77tOueH5c9ITPBeVIHr+N8UFUlCkRzOu6DrUdaqHa85xoMVrZPEarztk
         pcFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxbgAXHbguGspTYNzlOz4wTUJ61OKhJ58tAaMa9d9fQXHULzYtF4ony5T9+QPFKccU77FfbNsdgXZdsXCpFIXdDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkUKWwnkblFWwiDiq5jnqJQ9OTFwPIaBPLIoKYgdKmTVoOA601
	Q2awXeToVWaB3sdCIyq3MO7x3SYUHTA+85K/T0KRXsZITzZnNl4j1hrOgGeKeJys
X-Gm-Gg: AZuq6aLm7twAXM8NIddaujwbzoMj1JKGEACxA0bTnqXttwU/IkR8IUTHs1onwgfu6M0
	d4Gr/NFuV/NziZNkoLlxZJL8vJWZPWiVwcG0e72zC4KG+qnpq2GvPoRP4LNxJn6c0lA2heeB0Rf
	I6T7JVp3y92jYqOfyQeaWWap6SFWj0TpYy2oQfcuhbUlhDmEvhXsqRVG5wn4TUVRD1xjZ5kZSWH
	fvVmk3wTrNazeqcuFJG77zUNwXNb7Y/00N+6P8vEWRiOHkdnUUVk+N5cojlDAndqVe0o69GzaYA
	7tQqj3a3K8HAhZlyO+N9uPaH/05vqxdVH/zTYFsjazfpwyMdCTtJ2WfoHv7AO3g6xAHXiPg/1Q1
	Rn5Q7sYKXl3GxP76aJnwG7yjJS2WYgICw1N5wuZKIPKf/epaAbD2hyr94XZ0vPkyiFXPQkDE/Xe
	iuhQ6tLasEgLY1JO5ApnqlHnmGXmY8Ov/OPeQTM5p65vFxOJ4k
X-Received: by 2002:a05:6122:3208:b0:55f:c2cc:50a6 with SMTP id 71dfb90a1353d-5663ebcebd5mr850051e0c.20.1769176245341;
        Fri, 23 Jan 2026 05:50:45 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fb7dab9sm480922e0c.15.2026.01.23.05.50.43
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:50:43 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-93f5b804d4aso757462241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jan 2026 05:50:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUNlIwADwG69F1vkOW52BGT5hDSaJn6a/+soJtdTlXtRyAGQIr72kw4y1m/iMHLhVYO+rjL3JDJio+eF3DG3RLwHw==@vger.kernel.org
X-Received: by 2002:a05:6102:e07:b0:5ef:b5fc:dd48 with SMTP id
 ada2fe7eead31-5f54b994197mr835389137.9.1769176242766; Fri, 23 Jan 2026
 05:50:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <194465eda54d1f852a9226cf691ddc5aa208e0a3.1769097977.git.geert+renesas@glider.be>
 <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
In-Reply-To: <ffdf3982-e22c-4d01-afa6-5449ed381000@imgtec.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 14:50:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
X-Gm-Features: AZwV_QggHEVwIqc1kEtstmdEvFabNWQsOAWxfVgLAyebxcJ0E8lsdThbjxeQnuI
Message-ID: <CAMuHMdWMh_oJFg-KtapcTDGvYWZ-hg_ZEJ2=E5Tp1apOEc8tnQ@mail.gmail.com>
Subject: Re: [PATCH] drm/imagination: Convert to dev_pm_domain_{at,de}tach_list()
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Frank Binns <Frank.Binns@imgtec.com>, Brajesh Gupta <Brajesh.Gupta@imgtec.com>, 
	Alessio Belle <Alessio.Belle@imgtec.com>, Alexandru Dadu <Alexandru.Dadu@imgtec.com>, 
	Marek Vasut <marek.vasut@mailbox.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-27335-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[imgtec.com,mailbox.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lists.freedesktop.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,imgtec.com:email,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 645F17675F
X-Rspamd-Action: no action

Hi Matt,

On Fri, 23 Jan 2026 at 14:36, Matt Coster <Matt.Coster@imgtec.com> wrote:
> On 22/01/2026 16:08, Geert Uytterhoeven wrote:
> > Call the dev_pm_domain_attach_list() and dev_pm_domain_detach_list()
> > helpers instead of open-coding multi PM Domain handling.
> >
> > This changes behavior slightly:
> >   - The new handling is also applied in case of a single PM Domain,
> >   - PM Domains are now referred to by index instead of by name, but
> >     "make dtbs_check" enforces the actual naming and ordering anyway,
> >   - There are no longer device links created between virtual domain
> >     devices, only between virtual devices and the parent device.
>
> We still need this guarantee, both at start and end of day. In the
> current implementation dev_pm_domain_attach_list() iterates forwards,
> but so does dev_pm_domain_detach_list(). Even if we changed that, I'd
> prefer not to rely on the implementation details when we can declare the
> dependencies explicitly.

Note that on R-Car, the PM Domains are nested (see e.g. r8a7795_areas[]),
so they are always (un)powered in the correct order.  But that may not
be the case in the integration on other SoCs.

> We had/have a patch (attached) kicking around internally to use the
> *_list() functions but keep the inter-domain links in place; it got held
> up by discussions as to whether we actually need those dependencies for
> the hardware to behave correctly. Your patch spurred me to run around
> the office and nag people a bit, and it seems we really do need to care
> about the ordering.

OK.

> Can you add the links back in for a V2 or I can properly send the
> attached patch instead, I don't mind either way.

Please move forward with your patch, you are the expert.
I prefer not to be blamed for any breakage ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

