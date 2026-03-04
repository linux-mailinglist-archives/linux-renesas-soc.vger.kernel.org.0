Return-Path: <linux-renesas-soc+bounces-28751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFBIBMzvp2mWlwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28751-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 09:39:40 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0DF1FCBF3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 04 Mar 2026 09:39:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD5CF301BECC
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2026 08:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DD403914ED;
	Wed,  4 Mar 2026 08:37:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E058637C928
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Mar 2026 08:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613479; cv=none; b=LfAK4jNQiIX80ETOdUSuZ7jdkq1/NhmujyFyAMaIHNQpmtan7kNrAd8YWxf3qeBPxLgvihL9046iGULO/R3xWpnGBh3rHXNJZpo9qD6dTzyVFBYuT8W4YvFCNNTxp8VOpaOe8zaJbjz/Qc+S4XCoTHCp0/o3QSI+vL3IkYtCKvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613479; c=relaxed/simple;
	bh=Tq04qypjNQNgmU2wRJWLaT1HWMLuQT81NdpL2wCYVEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M5cIpoGy+V0a2i328daLu5DzqF+lNZqvWa9vmr2xbqk75Wd4Mna/6jPbLHiVVlxlI0JbZJucH/IjAE/R211HNyh04uuFfnC8CHZfCCMWkNu5Nkj05oa2JWO6MjZGOn1P1pYV8tZsIDq8ZbkYV07jjUvyiRHjgHeeLhCtUPfiWa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5ff9d7ce3bbso778730137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 00:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613477; x=1773218277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcDMJPJs+z8CQ5zjSzQa+p2pLkwVXWMeUZRxF+PzwxY=;
        b=Qj/qx5gRjQWofVfijIZsK+7CA/2annJg2pCtFt/UCjQtZpHHzVoYSfSVPlg/3g22hC
         8ztZ6pBpOOg7XsrQhVkyxz/OzEiX5Wvyl/3d+AwaTAj6I+yQeXUWiY2zAp7XRMrphrfR
         GpmFoxdjl/sUbz+fty+X9AiUKx+4ZeWLxpehqrpSrBEVzSxVoXal+8z3Bzl5+A5K1TJ4
         TviDYSvAQU2YH95m7Guu3avkB6+m0DCnW3iucW6GycBVk7Ulnj8zPnLqOpD9NwYTVGSS
         D4KHhc14P8GdnXpcTq8ykxUXzw0zeE4r8XsBByqBr8zH39bFArLbzYrk5yq/GDxuzP4C
         oCXA==
X-Forwarded-Encrypted: i=1; AJvYcCVqTJkMUzFIgO92fN+Xd0QxkNWvnogYTW6F1Smpm41t27/M03yn55hKQdKVQzQldeYHgKk1bMktfZ8X6TsApzCOBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVcedJE53qUiBK4AoY+AlNmNBrqonuCxuRZ/rzSYnEipGhmv/A
	BYnqtSrvUwclVPyEmxj+W8+M6+I2yNATM1DSqWagbQus5jRXsrkezEQc38clpJdU
X-Gm-Gg: ATEYQzzS5YHzOTnHjdf+gMhYXsTFMj5/b8XCtt3zqnvQocMgpCN84xkaSxMX61zCs3b
	aTEaElXnCbGv+V5IkKtbb5faxSX4kfx7U8mmHrt1Sa+UBmffINZgejVx6A3zxPqiZVGTk7FsKRl
	Ne6MOarIppqavDHerHlBcYU+HZDkn2Qv/WQJjP7r/QXgEqd1JK3dHV94S2FRMgeMpR5RCFpcGE5
	7hTcgcvGgg/tpLStVStt6l7elm5z59aTgwRqmhWlI7crl/TR7X8+K92qznLV4FXEcEiPB13d9pE
	2jgALzQCyPDJoGcGO7aU9kHTzVkcV0hA/G7Rr2Ok3fuGqTusBitGKOh3G/ltdTwfY6Zv3BG67EV
	LhPvpTvgiUft6HVsKoNMBY8EF0AlUeaKOHMh/s91FSvffuu0z2HAsClIHacBbqDufW+bfXDwLb6
	JZzFOg16CwkPvN9+C9licH5LawZkY+Bhw+KBE6S5cg8gCYEfLNuDnK6pTE+F6T
X-Received: by 2002:a05:6102:3588:b0:5e8:1dcb:4dfd with SMTP id ada2fe7eead31-5ffaac1e77emr595299137.5.1772613476760;
        Wed, 04 Mar 2026 00:37:56 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5ff1ea6b5fcsm19449816137.11.2026.03.04.00.37.56
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 00:37:56 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ffa7389919so326544137.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Mar 2026 00:37:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUnGX0Mq6ijfwrbdsv/0cLDtlDxEd3zD6/wPZnOHqyd0xc6zAdZ5KuGt/PZXlCtXDTgdXLhJJOiz/+oIwDVCBKUzQ==@vger.kernel.org
X-Received: by 2002:a05:6102:3ed0:b0:5ef:248b:d533 with SMTP id
 ada2fe7eead31-5ffaafb3af4mr636017137.31.1772613476047; Wed, 04 Mar 2026
 00:37:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203103031.247435-1-biju.das.jz@bp.renesas.com> <20260203103031.247435-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260203103031.247435-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Mar 2026 09:37:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXM1vg732dausgoh7pL2w9_=_sPT4-J=1=1VpWYUh7Cjg@mail.gmail.com>
X-Gm-Features: AaiRm52Ev8cLUHs0zy68n4P0L8brdg_y1hA5j2hexRTEJLmalENcLuVTLFq7muM
Message-ID: <CAMuHMdXM1vg732dausgoh7pL2w9_=_sPT4-J=1=1VpWYUh7Cjg@mail.gmail.com>
Subject: Re: [PATCH v3 04/10] soc: renesas: rz-sysc: Add SoC identification
 for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 7A0DF1FCBF3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-28751-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,bp.renesas.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.439];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,glider.be:email,linux-m68k.org:email]
X-Rspamd-Action: no action

On Tue, 3 Feb 2026 at 11:30, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add SoC identification for the RZ/G3L SoC using the System Controller
> (SYSC) block.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

