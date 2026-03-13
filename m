Return-Path: <linux-renesas-soc+bounces-29320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEN8BgnOs2n2awAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29320-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 09:42:49 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8578D27FE0B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 09:42:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 243D7300C9AA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Mar 2026 08:42:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFCB34CFCF;
	Fri, 13 Mar 2026 08:42:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E410431E830
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 08:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773391365; cv=none; b=knuBujTCzYzUzhoV+k2zEaGYzD8awDBoTmCswvhjfkBPQKYWydDxr1/Epzz8DFyKZ4EhBcXjrUnY7nF97oW8YQdluzXueUZUZ9C3rU+aCBxhC0LyTMZhXxXgPlar1QbZP23rFLBr8jtCux2R+5yJZcR24i73TyHNK2D3u0DI4II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773391365; c=relaxed/simple;
	bh=oH3WYOW/LiUiABFKR6xKEO8hM4DZchJjZtA3Bx/1qlw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nu/16hbi/AphviXeJ6DyD29UNhasG+6kgh6Fpjgrpat2gaVA9ct0Pn2oUjKt5ahfAiI1Kz2/78Rr8t8QJ+g2ceKTABSE2yi8eaFIqrn0I3rtT2WkC+qRr6YjnGg2OXxXk4YsB8O6vPModFV/Bow+TzIvYgNpgsqBD5oWev02VC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-56b16428b77so2041872e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 01:42:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773391363; x=1773996163;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=coFdykaFhQc0bQ/g4Wh8hLjrN7rpqsPnMcfIcHyR0fw=;
        b=HQi/mcoLscDvjAXQ12FkMtBweZT0q7lm9CMGBA7YAbEpsikl7ddc7sUDkyzAACqJMr
         C59dfrhDEkUS8WGL7Ihni3cMap5JEproktgOYbfsLSzr5PwulM4/pIHr8i2QP3/xJu62
         ARa1zdVtPdrHYNQaecVcUmrH3W7nCHI+V1XI4/ZVMFEhbXIh7dgb8dTiGJyvW97+pTyg
         H3MbNNch2Tsbhcxe6NbhEL2qIdJprb2ja/SGp+N5wwWoBEQHLA4HeahmgD8d2eTTF3Yx
         SGgxxUmxb39Oph6fRbSN7TgdYm6jrdeFiFiUbcZh48ye4WUngF2Vx+o0+Cc6cZk4lEwo
         WQKw==
X-Forwarded-Encrypted: i=1; AJvYcCV9YZ6YSd8uilQ/dEKmuLL655Lke4aBmHcMe7A3bAciNIt+kS7amTSPqrcoi+3QF8fQvdgY3ZVy/SNiM0w6xT+z8w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyeDmt8GXSxv0rD0FTgQ/uvxWlTUSQk91tUX+b6LqNBVmfmFXe+
	j+Sj+u8QtRXYaLVHJ2/PFbb584FTv8KzfmwlAUNEPQh9d4GJLqEzRDAltkzYumb2z/s=
X-Gm-Gg: ATEYQzxI4jCvnapk30xuhRewDha9mQGw33QCeUOvklrVqdzV8lT4DyuHwkIiCa2pGO4
	FKcNyNUbhDFBHemZFmZ46dtCMMc1LLNjnfHu9emWvCA9hliZDRpd+/5YEb9UeLQI7Tcx+6CAEua
	wzUtUpYoQnjDX0XaRMWJVaPS32nZyy+OXze6JyyFRlaCBzrQVVN/dhjx3Em5m8U/5Tbzv2qSX6K
	xu6/XmqKIkwiZ4rtqwXDWmRtEVq4Xdy4yIDFXwFxRrmCPBwoVbHQSlMdUo71x2QlBz9y+265H3u
	CEvTgfIk1PUoTODE0e8gmqqKGjkHd58UUvq1G0KEAI/MUwDfXgpjaGeaITl8z7+X+v3iJutXZnm
	uwU+LNAQl4VP+Eb3zVHiEBCPUUMNLyX+Ms5l4TC/u1N76uWxsSQDR14ea4QE/sKaLL8nL26LsAT
	LygrVx8tbcqE6uXE649+X9XMst3nMiMY/OGufDzvDX/S8eJ4Nm1KTKN6hxlKjK
X-Received: by 2002:a05:6122:2a0b:b0:563:66ec:8fdd with SMTP id 71dfb90a1353d-56b629bc968mr910379e0c.16.1773391362886;
        Fri, 13 Mar 2026 01:42:42 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b464c2924sm3592420e0c.19.2026.03.13.01.42.42
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 01:42:42 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ffe6887e29so1228784137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Mar 2026 01:42:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW2de2I+lja0cwZOL8w2IYvxVbusvYXY/hcaTuV2abIb2vHZIk6rhc//rjxmSl4C+FaaHTvvuKgLS4mRBA7KbsfGA==@vger.kernel.org
X-Received: by 2002:a05:6102:32c4:b0:5f8:e4c1:7bd2 with SMTP id
 ada2fe7eead31-6020e2172e9mr1003965137.16.1773391362257; Fri, 13 Mar 2026
 01:42:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMuHMdXrYTGQkjC1Sr4NjOcsRyOw3_eEj9m5MVVo1GWUuCxo3Q@mail.gmail.com>
 <20260227095742.4449-1-phucduc.bui@gmail.com> <CAMuHMdUNA=wTksUEmnW7NQ=XCjMBuHDyJy-XqZh4yRxECNFuwQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUNA=wTksUEmnW7NQ=XCjMBuHDyJy-XqZh4yRxECNFuwQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Mar 2026 09:42:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXJQmfU0p=yk1kROTm=ZiiQoUHZQpw5kj813x=RWCS1fg@mail.gmail.com>
X-Gm-Features: AaiRm533L4rgQGHamcsBJAYP34l6jzwmxk9y4dM9xwhf4jREg3YdsecGp-kRNPY
Message-ID: <CAMuHMdXJQmfU0p=yk1kROTm=ZiiQoUHZQpw5kj813x=RWCS1fg@mail.gmail.com>
Subject: Re: [PATCH v2] drm: shmobile: Fix blank screen after resume when LCDC
 is stopped
To: phucduc.bui@gmail.com
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org, 
	laurent.pinchart@ideasonboard.com, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, simona@ffwll.ch, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.freedesktop.org,ideasonboard.com,vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,suse.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29320-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	DMARC_NA(0.00)[linux-m68k.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 8578D27FE0B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 13 Mar 2026 at 09:37, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, 27 Feb 2026 at 10:57, <phucduc.bui@gmail.com> wrote:
> > > What do you mean by "deep sleep"? s2ram? In upstream, s2ram behaves
> > > the same as s2idle, and the LCD works fine after resume from s2ram on
> > > my Amadillo, with and without your patch,
> >
> > > What am I missing?
> > > Thanks!
> >
> > Thank you for your feedback.
> >
> > To clarify the "deep sleep" context, I have tested both s2idle and deep
> > states using:
> > - echo freeze > /sys/power/state
> > - echo mem > /sys/power/state
>
> OK, same for me.
>
> > On my hardware, the issue is consistently reproducible in both cases,
> > resulting in a completely white screen after resume.
>
> TL;DR it depends on kernel config.
> With my .config, your patch is not needed (but it doesn't hurt).
> With your .config, your patch is needed.
> Unfortunately I haven't found yet which config options causes this.
> I will send you my .config by personal email.
>
> Your change looks valid to me, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

And of course:
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

