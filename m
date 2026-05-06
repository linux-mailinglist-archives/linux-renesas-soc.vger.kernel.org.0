Return-Path: <linux-renesas-soc+bounces-32146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG2zOEth+2kuaQMAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32146-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:42:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBCF4DD757
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 06 May 2026 17:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D09CA303A922
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  6 May 2026 15:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D3F3FCB06;
	Wed,  6 May 2026 15:39:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C5F492520
	for <linux-renesas-soc@vger.kernel.org>; Wed,  6 May 2026 15:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778081990; cv=none; b=mnUx5qne6geySqJ+f9xzH8UwDbbOIVebTURONe8+L0HSlM0TTotG5FZzyQ13GJju68MunsmrRnkaFtuXgR1LhdKwcsF6gymTq9KB8PRqapPEouW3Ju4D1iBlP78+C8ehhXGit1NNlgoVCAdymQ+X6VjeJ6Y40op040s0EYdl+pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778081990; c=relaxed/simple;
	bh=LBmIgDAwAQqV4l2LIzPR18nkhRL7wfdwqg45Bs8q/1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EVH415I2xyWu8thh7zz3vT1I+uVuiPYBb5bWt708afCulRRIrNdTPqyCTO1IymU69IsFOhp/FdknPFKPViZsad2RpckHljpmJ6YvLz0DuHrPBqVen4BhTAWv48YPaEVD2RwzlHXrxc/dM15kJ5L0TIZkod+KodTcBZxoVGD/36I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-62ddb07fbd2so1467242137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:39:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778081987; x=1778686787;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kbrhikwqovxPcm2MY0WIUqDXXvt/c4ldcoQ6G9OQw0=;
        b=s6BCPGwmBpYX5mSdCXEqz+9A2p+WRWsRodh5IVGwm2zA9LYN+WJwaYlbXZ03WvjAnN
         pQKVM75JZ4J9fMBN7yB5CHSMW6QnVflAUKZfSGazdVK6FmWiOz5LvgSljh4hCPIWLziF
         y7M/VW3zLfTXZUPxOIx3Pr86jozY8/WiQpQIjEwP+d2WRmPnDYtpksJLjyXm5x0os212
         ifGMoDmtfZ6jvWpae3tz/4xZqje4QVP4Ovu6XB2i2bSElWlZTJqi/qfWceHSaIhefsb1
         PiYjASQBdDaMqTwyYT521KZ9ISzlvEPEw1ii8EyvyYzgW7vrC1LtSmgexX5QKGXEFb0x
         qnTA==
X-Forwarded-Encrypted: i=1; AFNElJ+DDNN011WEHBvYQVwFhoOpE7F3g+vAnUBLztCUKH/Z7uj5I3PUlBvE+Djuu3dk5LKiA/T0ZYCJ640cJ9G0wjTsnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHsmifkvSBsfroOGqmNo8hAGK2bkjKlhio4H6NhmZfSyvKH2IV
	l4jrGBz2pm5CFSk/nafyUkAfxbO/7esyYouFtyTzeSZ2ELmqWWpU6bMUjwHHybkn+ms=
X-Gm-Gg: AeBDievLcKJon+yYPmyso/FIbZ27EW7iIc6RCc2F0iNUtxaU4SB0cXLpo6UeacM8PZp
	/6Dyz48qHRHHfkZC/0iWKjKzGPTLU6CKeOsImltUWasVlzkY9h8EZFUpJcnVvr+uTn7HOgss1Sr
	tXk1v4LLPFuVubrp7WokIwZetJhSZ2xTSz+JmhYDlil9A2X7tfAzR/0WEjm9l4nQR7Q6M+kiUsf
	e55HPZOhGo237vzN0vXjousEqmUw7lbHu72kmB3I3zJIHHKCFTnan9PqdH2wn5PM1nzwJpGuh1H
	yenkLWtXR7ihORW0pb0A3UCKxmeXxgaBrxMnqtwdcmPxCcu1lnrLcfmulMJbJkAbABF57XBNF1C
	6e8pyhkTeaZLNBBvNKxJ9hE+QYFuS/w53Q9t+nMCcUghLC+OnDl2MjDlVvN7kzZdXCRegyLO0xQ
	1gA6n2nWVGP+GsnMXWSITo0Ay2DKWXaRU7Y3Xf9i3HBL9iBMRSJ8Fvmc/R+31G+vID4TjAaZbx2
	7g=
X-Received: by 2002:a67:e703:0:b0:609:af4a:371 with SMTP id ada2fe7eead31-630f90266e4mr1886567137.23.1778081987224;
        Wed, 06 May 2026 08:39:47 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5749f83cd00sm10987520e0c.6.2026.05.06.08.39.46
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 08:39:46 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56a9076813bso2971500e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 May 2026 08:39:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+8AMTkpFwstL/klif2uXEKqM28ngEhANAud+Rb0ZQmcLA2MQGtrbh1jS8hiJ0R158PtEw5RnhxK6yYl2kZECsZ6g==@vger.kernel.org
X-Received: by 2002:a05:6102:b15:b0:628:397c:ecea with SMTP id
 ada2fe7eead31-630f8ee791fmr1784531137.10.1778081986328; Wed, 06 May 2026
 08:39:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430093422.74812-1-biju.das.jz@bp.renesas.com> <20260430093422.74812-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260430093422.74812-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 May 2026 17:39:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzfB7d8S7y2YQk-QtgHff+QZeVcXHdmGFeFrT3acTZHw@mail.gmail.com>
X-Gm-Features: AVHnY4LGjtWPKHZA8LMgL9Wu8go-UfXc8etk5Fq9z1BmwattUYtahz5UCfOKg4M
Message-ID: <CAMuHMdUzfB7d8S7y2YQk-QtgHff+QZeVcXHdmGFeFrT3acTZHw@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] pinctrl: renesas: rzg2l: Update OEN pin validation
 to use exact match
To: Biju <biju.das.au@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: CCBCF4DD757
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32146-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,glider.be:email,mail.gmail.com:mid,renesas.com:email]

On Thu, 30 Apr 2026 at 11:34, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> The RZ/G2L SoC uses pin 0 from a port for OEN while RZ/G3L uses pin 1. The
> existing greater-than comparison against oen_max_pin in
> rzg2l_pin_to_oen_bit() would incorrectly accept any pin below that value
> rather than enforcing the single valid OEN pin for each SoC. Replace the
> range check with an exact equality test so that only the designated OEN
> pin is accepted.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

