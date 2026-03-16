Return-Path: <linux-renesas-soc+bounces-29457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMbTAfu8t2mpUgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29457-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:19:07 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4942960F2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1B1E63010B8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 08:19:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDAC134FF48;
	Mon, 16 Mar 2026 08:19:03 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B2C18787A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 08:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649143; cv=none; b=ZTGUp/I0LMMrrnEIvZox458AHmd510gZDj/lK1YGujUD+gneRTgAv7+UeNisXl4jRR0sydam0RAPZvz+Jt49ERV9/6dZBKaZQD+VZCYSCLVvRz/9FjdJEnu8y9CimNvWdmGlFTA4Fh5fDBBGE7Af6y64gJGXXD0TMHe1IpgJtSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649143; c=relaxed/simple;
	bh=2iXoS3m6dNsX83tj7CSq5KxhYihKVQmUZZSrLXTwQKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qJM6vGVfTg5u5NDQGzhclQXyqwHjHfcZj98lVM5IieJcBy+AyklQO/TAufiZcyjg/gyHPhSmNw4dN6XW5lEQi38e1ObwqhsQBegZeaxFs5mw4wNMugme7kiZNLCzbu+ZbCAwQpCVSqyVmRMs9EfY1yiTzOygomkVwos25whCN6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56b8804f37cso232507e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 01:19:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773649142; x=1774253942;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZ5ZL3YahQ5LgPO6RUkICWxC/OTnvmWLlmCP38xXSZI=;
        b=L+1t+iDHtHLKCXMktqSSiUioQ/8ALW+gyI4NX6ApqEsiSldmMF6FsGEB0ObmdhBUGG
         U/X0V/bNBwSvH+7j0PydIIHQCkqOPiZjjoeVg2i0B/KZXW2lwaURNcs3IfAWyGW6ocAL
         URCdVa/1yYHplhWpoCY2Puo+qTe/2VQ959R12cbpFb1UdMdGniCqjEplyFmXHwXY5VRK
         b4Cxa1tp7gQ72I/ZuW/fRRsXydig8UTThrvpuXJJcCzL2nl8y682A4DfphOA/N1R6BZt
         Rxz6EI1uQdn+xLQKDGgbLK2rVb7kw9vuZnoSOepttgXWDCezcTM3UE0kMEzdI0+p//o+
         cE6w==
X-Forwarded-Encrypted: i=1; AJvYcCVoVp+rPc/4PVQ/aw41PHO6jUeRu6xmqvnV2OTxr8r45hTN2R3KVvYScBJbxexPDaJIutH3gJBR1M6nvpUq1m66QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZlC9+8YDztZ3gm9cxflTciUfzZJdjD6gyFKixJ6InjxvbtuWW
	okEBGC08PVQnYBKxDh8gr6dVj4ZwRzLvt2ABcrO+5BNhNrcXXv1v5ZxkCjygmXY8
X-Gm-Gg: ATEYQzyKA9oIHi2Vde+RXYK1FwjLceWKzKq6WWmlpmp+wRFzwOEGezI7iMgqQsIN1Fu
	X6SFhRanHBCzLouxyknSHCrM2i/N+OOn3K1MMY3U0YWvnF5P57heZ6+N3WjwMlmYWrqR5x4qnsK
	WAyBoCpiV4W+rqgfvuaJsaUJp3z9wHxOQIZQu0QQvTlrWZJ0vPRmGWktuxIw8BXB8YjlFZ0r7cc
	HKlDekUCE5wFucJAy0Sm7Qd6hpeMtVG/yH1FDWikwodlhp2mFhFk0qxC9h34LSKQHhINwrVi0xg
	qpV9HsSG4A0KpLlVOk+PlJ9+AREOOcRlusHrAJT1aAA4jmyg4oZdezeZ3k1KuN5EeDtx/SPRZcE
	RsfbZVRO84NM8iET+/v3IX5uuwJRHSDztUhICSzqYIaQhj2UiukEuSK4zSzqafVyNYl6FTrhUyd
	ILpagnyBDI2u0H2SH+37YjxNLInaxDls5awgQunt+kUW/bt7wy5Mr3+SAt+Qr1
X-Received: by 2002:a05:6102:c8e:b0:5ff:a4e0:1939 with SMTP id ada2fe7eead31-6020e1ad281mr4607930137.7.1773649141463;
        Mon, 16 Mar 2026 01:19:01 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601f31e7520sm5756914137.4.2026.03.16.01.19.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:19:01 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5fff77ff69bso834361137.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 01:19:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWrjfzH6lXgkNLdmOeCtmH1KiRAyUnv47V58eE3+0jiXY5gpzkBEvF6GZibD3AikVVP/IvOKUtagplyZkFjxPvz6g==@vger.kernel.org
X-Received: by 2002:a05:6102:952:b0:601:f82c:57e7 with SMTP id
 ada2fe7eead31-6020e5f1888mr4295849137.37.1773649141135; Mon, 16 Mar 2026
 01:19:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <cover.1773399675.git.geert+renesas@glider.be>
 <44491e75-4c73-4c8b-bc34-888d1e047cff@kernel.org>
In-Reply-To: <44491e75-4c73-4c8b-bc34-888d1e047cff@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:18:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWLOCvKfp4bULzm6N_3u1Mh831Z0EW++8473wvs29MRHQ@mail.gmail.com>
X-Gm-Features: AaiRm52ybkgfdE7QGE94nAnXy7mmjQuKiyvylh7pzD-F9X6Hn2BIVpsA-3r677g
Message-ID: <CAMuHMdWLOCvKfp4bULzm6N_3u1Mh831Z0EW++8473wvs29MRHQ@mail.gmail.com>
Subject: Re: [GIT PULL 4/4] Renesas DTS updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29457-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5C4942960F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Sat, 14 Mar 2026 at 12:23, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 13/03/2026 12:13, Geert Uytterhoeven wrote:
> > The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:
> >
> >   arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)
>
> Also nothing explains me what is this, IOW, why this is not RC1. Pull
> request email has place at the beginning where you explain such things
> and I can easily locate or understand the base.

Let's readd the part you cut, which is also present in the cover letter:

> > Note that this PR is based on "[GIT PULL] Renesas SoC fixes for v7.0".

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

