Return-Path: <linux-renesas-soc+bounces-31611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOX/EXgX62niIQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31611-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 09:10:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB4245A8F3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 09:10:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 70002301C3C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 07:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCDE9324B2C;
	Fri, 24 Apr 2026 07:10:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1F0346E43
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 07:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777014616; cv=none; b=dPDyWZHBaiFquUdR6WZXfvOq1RzeZhiT/HkYZt5OzIAMK9UcB4zGYLcCAYiCqNDbadJJKs5OWnIBw+4L2XJ5kXJxcL9pcQ8imAMojt5FlQWzNSKxV5UHpp4m1tDz9pYgVkHC43TZte6JAvJh/omu8xBeHFTQwN0viYsFfDXVj14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777014616; c=relaxed/simple;
	bh=LIq2WZpBnpzd2Ev5F4Kt3DKCFE0DPJZT5JzFcd1U2S4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KSrtHfwlx2fTRacI3V+dfd6uUSi+c+MxIAgrEY+F74e9r+s7Kyaf3xB/0k98J8glASjTyjKmGq8p0n1kcVg0i2WBjFhvtbqQumwS7puaryCwNyXWO1VePVpNHaLk+ltFMjZrKmKewoDDMC9Ib0IRMTdCY/s8Lsq1n7cvIuf7Iqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-60579e72ff9so5125825137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 00:10:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777014614; x=1777619414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWOHnN+6eqD5mfsGVjdyXg1PSr4rRoWrvIXL10/Nauw=;
        b=OZz9IE9gHiy3iwd8PnUwczyRLzl2mziAAa59pKykE7EG52UbL/NDxhgrWKyjvH50Xl
         lbAESDlW98nHzJplRIvCHFSgsPTsTYK45re692D6yRMMO6NrJzxasu2wfQQfNycP6HLB
         Lk60lhNiR6dkK2zAovVYvwVjxX/ljTP2gn3kWGTjJVoDzf1jnKVSqgN+8saeV1/AItO7
         7ezKuTL04SlqLnBJfd99Uyn/uuH0hkNgnxe6pg8TD1xSi2R5YzMenUZDVDOeEub/VLdf
         5iAJw6PQhrgLYO4m27bzMz/7Ruqj4QAlOJ7maohV41ONShc+rYFk3Cq08i4eZiZwLFny
         EC4A==
X-Forwarded-Encrypted: i=1; AFNElJ+obgJdLPlNBAoS6gfJ2vh/qWpu83QW4OZ4aqrxLHJrIdNzX0BEQ6gi1SJkWZhe5HJroZJ+w+SvVZMb4ATSQ/DW0g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2ABxGNJlrgg2bzLcA6vZ+0c+EbwTb/0lcRBwHPU1hQlH6vYw1
	BY1l8lKYRxbv4g+IaPS3hHYjJ4dh2kO2j5GmEAAjDiztIA5BZKepE7nOjOARmbt8UnU=
X-Gm-Gg: AeBDievbaFh/j9G1nby+Md+e785r42MtnqHPPi589Q97WKFeQAahDsFRQEMH06BZb7V
	Xahg0QpKrvBA4JjKXpCov9dEpge5eMMTrpWnrqq3P7SAB3z7Q6e0lY7pyZUhkUNjI4mVNp1x2ks
	3quRYAPye6DSKxKbYnLXVlJzk/Yqe/QR3KpgIM61rWmn3dFqaM2yUM7gQsLLaAQjoGd9HUDMYzD
	mqEhJnc6LNEIMJDXvraKvvO/oQDvW2z+A0A5P2Vlab86RR0Woajh97NRSEpUJDSSUmHnycJE6z1
	j0D/bQK1zaYGhbDbWdh6lNkXw8t0m/N2TYAf5XEJU1r8s3jwknT0zkUIzZ4GVpymYff3F8JKmML
	gWmuffaAPlS6RaVgvptqwK3aMXtbBBboycmY8Io7f7Ls/VrM/65cwJ28geFFBjEga4qedwoOq3e
	AVViA7w4LIu3y08+o9QLVNKrEgLrJy+nFsj3NLBZYUPyB8G+xU2Y9bSP+oh5PF8MMg/kCkm5BkY
	BME0GgFHg==
X-Received: by 2002:a05:6102:5e94:b0:610:347f:9f3b with SMTP id ada2fe7eead31-616fb8a0537mr11157074137.3.1777014614585;
        Fri, 24 Apr 2026 00:10:14 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589065388asm10817208241.0.2026.04.24.00.10.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 00:10:12 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-610f4cf6ddcso5963734137.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 00:10:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+TUqtZIMYjzf2vsX0IjqIQMyNuaGq0UfXpSVBe3r3u4vrUliroAzw1I61Lz4Ku1vub0QDlexUnpTYBP8z/jDogWg==@vger.kernel.org
X-Received: by 2002:a05:6102:148d:b0:607:9b72:28c1 with SMTP id
 ada2fe7eead31-616feb804demr12593221137.22.1777014611387; Fri, 24 Apr 2026
 00:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326110648.29389-1-biju.das.jz@bp.renesas.com>
 <20260326110648.29389-4-biju.das.jz@bp.renesas.com> <CAMuHMdWEQpg8biC1BFJx1n4byXDWGDK+QZdLkpHFypX3zYFWCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWEQpg8biC1BFJx1n4byXDWGDK+QZdLkpHFypX3zYFWCQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 09:10:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUP0=wQ8A0EOR4GgLJcmiigGVJsp_8G9cv7uBHkEEESrA@mail.gmail.com>
X-Gm-Features: AQROBzASsJ8jLNRx0XhI12Xisy31etJ04Smzr_WDPM7mKm0bZr1QZGo4oQcDx3I
Message-ID: <CAMuHMdUP0=wQ8A0EOR4GgLJcmiigGVJsp_8G9cv7uBHkEEESrA@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] clk: renesas: r8a08g046: Add support for PLL6 clk
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 3EB4245A8F3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31611-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]

On Thu, 23 Apr 2026 at 11:37, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, 26 Mar 2026 at 12:06, Biju <biju.das.au@gmail.com> wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Add support for PLL6 clk by registering with rzg2l-cpg driver.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

