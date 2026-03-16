Return-Path: <linux-renesas-soc+bounces-29456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPL2JVW8t2mpUgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29456-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:16:21 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3EC29607F
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 09:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A0943021EB8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Mar 2026 08:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755C7355F42;
	Mon, 16 Mar 2026 08:16:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A445D18787A
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 08:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773648965; cv=none; b=SU+xmabZL1Ie8yWIXI8ZQNn2RMnxZdRtQcmRHz67625DhQX0a+uy2wRJkZ9DkVaGUoY/HNUIUfTPo0JzXIyaq/LRJzq4Rc84yMyZDFzeBvY8OddohE7CXH//rRgQoixpwdibcxBLI38xIPXqU98V0PBGKE4dw3lj87tj2V4gsFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773648965; c=relaxed/simple;
	bh=6J6jIiMws+sldd1rr8KuW/unMB6Pf7N1kVnkcrX5N0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sfnimax6LHxJbNf+E66IDIbkr6MXHmo2iTqLbUGAWIQHzqorYKJvKV2gS/ALPGapv9TR3To6ZikwonnqSv2Cnv8KddSoIoNi8kBMUErvp0czowIUhwGxSpHUJdam6mgrUgn+FR0wGlvjmrpyJL1FH5dKgjAJLrUv7cJxCRuHVr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a8fdaddebso1596550e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 01:16:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773648963; x=1774253763;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmTefij6xVk2JRb0OyDr5LMzX/ACr1ha2wKgEcc1/H8=;
        b=csOZw9RHv8b7A8OKdRIUQHpV62+5UMhfa3h59jVuLMt0+x78CwnK5LpMOsgxbiT6YE
         v8sEKr2WW4gsUGDfxypzQWFumr34Cjt91Ff7OPFhApdFlVSms0wvFS722VSvF7pNxcF2
         KZJJKbwxUvevjQ/51QXua7Inb4mjEZhg9VLhIbJMzuayt/AcCSnl0+qdtHrDZT2kybgI
         zNx/lc+VIOPz2kSYznglTMLB/J8b78E/hwnj9aRkVb2ZFQ1/ZKM5DJwLguRuiaVj/TQ3
         JJdhuzmRCpug9290klqPkBlg891Yhi8bIUGIul5LrIBhzTdf7mGHOlf7SSdwURMFrOtu
         wY9w==
X-Forwarded-Encrypted: i=1; AJvYcCWjR7hMXSgXxMOy+SolB1JEBYcP7EKuq+oTmyA/1FIZ6T+JY4VMb/AQD9ZtiL8G9zGfwkTwCCI5sXtj3lwBD6vMsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn+qFCGEBYgytmLYuBQWZMIMD3of+1mEn/qrz4A7f8bT6R/kPa
	DnZisJkpKGxjYFKd3cuh+UqNSkiiiOqGTpWx7E/V4+Ghp9yodkrLLnHazUkrtMli
X-Gm-Gg: ATEYQzwFRRUE2u5++4Bij5F+XRY68Sha50PUMe/dzKUxAwhQb8bgKTZYbguvKAL8fNe
	S8IorqjLx6iNq8ZYtcdfxpqI32liqrnTPojAeeCug3z50lBQplfqNmnl3uruLFmIjjOWhz6zvG5
	4fWNkDY+qQH4wFcGbtRxNEpu7xDjLbnQCnr6gcJUqHs05DlzDiOmnQiBHKlewa52fS+Zl+vpfAq
	v5iXkcdkao5RjDUKD6taByOjYcp7Ks/S/2ezVJgYkeafaz4Smw8rAZoeJ65Ir+jZeINTSXrnwqt
	JvZwkOhZmXMZc4TPq36fA1L93AFBEAgZuNCLuv8zkZoodZ+WAy6xeeMP1DJu1R6nhxSn8OU39l7
	RpqYUAwu/yF0htQp63pGbbJcJsFmAl2zi3b/OCkap/v5efXpi+UG4uYtYJjG6IrlgmScY7TjryB
	/C5fUjIeGu6ey9wJ8P3TOO/KEt0wn2mvv9GJDsNofASEh7Anweg65/e+i4ns+OVyMhTqHAxbqVm
	Og=
X-Received: by 2002:a05:6122:320e:b0:56b:8e1c:582d with SMTP id 71dfb90a1353d-56b8e1c5c4bmr423521e0c.14.1773648962505;
        Mon, 16 Mar 2026 01:16:02 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b84300190sm1257471e0c.18.2026.03.16.01.16.02
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 01:16:02 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56af30dde0cso1596167e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Mar 2026 01:16:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUpvD7GeBo6z70zjvtE6HhWgYXhE+LuiKymmRCuzfBBXXGcm7sRxzHQgsqCaNzWcQjFnHUkzXMphgYKGT98o7jD3w==@vger.kernel.org
X-Received: by 2002:a05:6122:659e:b0:56b:8d2a:8c8f with SMTP id
 71dfb90a1353d-56b8d2a9d66mr528332e0c.11.1773648961820; Mon, 16 Mar 2026
 01:16:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1773399669.git.geert+renesas@glider.be> <cover.1773399675.git.geert+renesas@glider.be>
 <20260314-arboreal-bold-vicugna-cdca27@quoll>
In-Reply-To: <20260314-arboreal-bold-vicugna-cdca27@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Mar 2026 09:15:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVg_no3Y65D=E9pmPZ=vxOfcJ8hKC2Jd7W8J2Bxrt8V5w@mail.gmail.com>
X-Gm-Features: AaiRm53Rv5kBqmNlsxPfaTacL6gnOFBZ2evKRoyLQgMqcyEYrLLjn0WDPu1UeIk
Message-ID: <CAMuHMdVg_no3Y65D=E9pmPZ=vxOfcJ8hKC2Jd7W8J2Bxrt8V5w@mail.gmail.com>
Subject: Re: [GIT PULL 4/4] Renesas DTS updates for v7.1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@lists.linux.dev, Magnus Damm <magnus.damm@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,gmail.com,lists.infradead.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-29456-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: ED3EC29607F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Krzysztof,

On Sat, 14 Mar 2026 at 12:13, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Mar 13, 2026 at 12:13:00PM +0100, Geert Uytterhoeven wrote:
> > The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:
> >
> >   arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.1-tag1
> >
> > for you to fetch changes up to 0928a28daf017504e14920f4131bb99e3bc39dba:
> >
> >   ARM: dts: renesas: armadillo800eva: Add wakeup-source to st1232 (2026-03-13 11:00:48 +0100)
>
> Next analysis tells me:
>
> Days in linux-next:
> ----------------------------------------
>  1 | ++ (2)
>  2 | ++++++ (6)
>  3 |
>  4 |
>  5 | ++++++++++++++++++++++ (22)
>
> Please keep non-fix patches in the next for at least 3 next releases, so
> you are sure any community tests/complains reached you. It is
> unreasonable to expect that community will test your for-next patch
> immediately the next day.

Sorry, you are just soo much quicker than Arnd ;-)

> I merged other pulls but this one I will leave for few days more.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

