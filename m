Return-Path: <linux-renesas-soc+bounces-33172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4EhrJbiWFWp9WgcAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33172-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 14:48:56 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EE35D5C16
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 14:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE18930293C0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 May 2026 12:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4B4D17A31E;
	Tue, 26 May 2026 12:46:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB7B18EB0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 12:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799582; cv=none; b=fPzsDG2lfzITNK1R+fh/c1A4KN7dMGAIBfInzYytAVxdI+oUXECO5TX3VtyH1uCqH7ntJbcWSdZtX+OQCl5jGgt9o6HfGVkLO17gbH4WP9RVaWj8qymHSz4JoGWxt1MNFk5uxWIrfhwvgjiPgdz6zYgQSfSWYm4YcivEWUVSfrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799582; c=relaxed/simple;
	bh=1KZuSJ54bOlx11+C6QvYz2C1CWXUb2onHlCMC1rn8g4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Arf8VMc/scmCwAhhAFmZZuGAbawMGrwy2Toet6W0Py9OWQ/QFc8GVK2cMmoeQn8O5eFTIQzyfz/1JEIZZfPEvwBhqzsd/ysnMDFI5Q1/463CYXoX5whpCOtxSZ/Nq26OEEaaxwlDhCRcv6k8L5rp/YCf2PNfTKdmKMWFmQ7ncXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-577500ac0e4so3327560e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 05:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799580; x=1780404380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3snD10qfTEx+T27DMfMG7Byy+g37m3U+s2y938/elLI=;
        b=DM3CAF9i9xWKhtdnXyXoz2sxIetQ+qbJWUOoISyoQaGd2VAvzolQ0uvdXLgddhunGz
         X2y24UxGQ6ewunjFsmrfrcazwj3T1gnhnNYaAnOewgj+gHmfAcIUvvwXyiNtIJWKh0ci
         qbDStD2LGZJ7+YY0QKl3uBi/DJlhjCaAwdAf2sMgccaX1P9wHYEicu8bx28LtelMfBrt
         lW9nGFaZhYvHktszHaNqEB6/AbMf1PyX/grN7vpJwTOT/bAzkBZqjxIEKI6nSnvPfpGA
         L6aVU/1O1oUm6qxRszLlFOpf+S+CeiNlxfZNhO0PGCNhboZ1DkIks/slQNJECflkLx6f
         ATwQ==
X-Forwarded-Encrypted: i=1; AFNElJ/0wPKVJSJBzqmUDjCW3M27x0oudmmnQlPXTtPs/sb1fWrS2/vKh07Kni6T+ws+6mH1FTv0mKkl24Xw76bqynRwTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYZ5rtUbU1SaaZgO1fSHUedSiOBeLW8ODOVsT2Jm4pBqaVlS6g
	6yf93uFpZQMKRdlX8U/JnXbGfaf8o5y74YDmgJ+jkuzabVzw2AdI/PJTzNqrwNYE
X-Gm-Gg: Acq92OEV+46YUslctM2EQdBH+TUg3BNvF9tWJGEgn8kecXmRWrDJeOWkr6G86Dv91h9
	wMAs5kwugaPKGJw+2CICzZBD6tod1DPDg019NuevED3X9Zzrjmfe4OlTcm/Z+rZJNYLxCPy3R6o
	SJcAMO4xmwf0VGFvlveuk47Ka93hUPGRzeX+ivCw12GWptOXe49pI36FCU9Mj+d7ouwv0SRgXjE
	JaCr47a/M0L2ohuV477izr8ZO1YHa6QtKhYQef22GW0+zfAbhVdb6791oHGG9VmlaxdUMW6LEaA
	pwz1oQzzkONVvH+KBeqxMFXuUkvfKCvkXMI5BIDCXJqt8uE+ozwrFHEeQUqi0e4CZWiMKOLIq5j
	aVOUIpQlpT3M/SKAfz8AAQdqhF8GCtYfO0uzO08J28kQEcovL2D05pzSHlqgN+oK1q4Nc5TgR5g
	2LSIPelzsThYHc4Lei8LKu8SmFe8YZOkQCtg/DvFNzA/hrJBfwVn2n1I0xHxB1aeMy
X-Received: by 2002:a05:6122:e465:b0:575:352f:eac0 with SMTP id 71dfb90a1353d-5865ec7ea17mr4421701e0c.7.1779799579872;
        Tue, 26 May 2026 05:46:19 -0700 (PDT)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com. [209.85.221.174])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-58d6412d8cbsm7823712e0c.4.2026.05.26.05.46.15
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:46:17 -0700 (PDT)
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-57602a2d80aso3352983e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 May 2026 05:46:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+LumFgq7/wZVXaICTCQo5173srv+pRnL387maJjDslJkJAxH+obWmvV4kUnWtJzTPdmJnE0vtdu2p1nIKpSaGAxw==@vger.kernel.org
X-Received: by 2002:a05:6122:f90:b0:56d:b4d1:3c3a with SMTP id
 71dfb90a1353d-58658560e64mr8563847e0c.0.1779799575125; Tue, 26 May 2026
 05:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526120306.184283-1-biju.das.jz@bp.renesas.com> <0e71f527-db39-4ad2-84d9-897464f74316@kernel.org>
In-Reply-To: <0e71f527-db39-4ad2-84d9-897464f74316@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 May 2026 14:46:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzjj3dE3wQ84XGoP7RAfKxRAChPnbzkAW8NnrPhtoeoA@mail.gmail.com>
X-Gm-Features: AVHnY4LagBR0FMrrQ_wpAC0PPnxsotUy7GXpru1yd0ZVu7Y_7KxH7fjZXndyCtg
Message-ID: <CAMuHMdUzjj3dE3wQ84XGoP7RAfKxRAChPnbzkAW8NnrPhtoeoA@mail.gmail.com>
Subject: Re: [PATCH] Revert "driver core: Use mod_delayed_work to prevent lost
 deferred probe work"
To: Danilo Krummrich <dakr@kernel.org>
Cc: Biju <biju.das.au@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org,bp.renesas.com,lists.linux.dev,vger.kernel.org,glider.be];
	TAGGED_FROM(0.00)[bounces-33172-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.976];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 02EE35D5C16
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Danilo,

On Tue, 26 May 2026 at 14:09, Danilo Krummrich <dakr@kernel.org> wrote:
> On 5/26/26 2:03 PM, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Commit 1137838865bf ("driver core: Use mod_delayed_work to prevent lost
> > deferred probe work") introduced below regression on Renesas SMARC RZ/G2L
> > EVK:
> >  class_for_each_device called for class 'devlink' before it was registered
> >  WARNING: drivers/base/class.c:415 at class_for_each_device+0x12c/0x13c, CPU#1: kworker/1:1/26
> >  class_for_each_device+0x12c/0x13c (P)
> >  fw_devlink_probing_done+0x58/0xa0
> >  deferred_probe_timeout_work_func+0x5c/0xb8
> >  process_one_work+0x150/0x290
> >  worker_thread+0x18c/0x300
> >  kthread+0x114/0x120
> >
> > Reverting the commit fixes the issue.
> There's already [1], which should also fix the issue.

Thanks!

FTR, that patch is not sufficient to fix the WARNING (on RZ/Five)
for me: I need both patches from the series to get rid of the both
the warning thousands of "sync_state() pending due to" and
hundreds of "deferred probe pending" messages on other Renesas systems.

> [1]
> https://lore.kernel.org/driver-core/20260525012340.3860581-1-dakr@kernel.org/t/#u

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

