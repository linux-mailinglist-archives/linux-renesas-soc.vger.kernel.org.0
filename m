Return-Path: <linux-renesas-soc+bounces-31505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIhnIDO86Gn7PgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31505-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 14:16:51 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D829D445C98
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 14:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF14B30B6624
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Apr 2026 12:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447273D3305;
	Wed, 22 Apr 2026 12:12:39 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84C53D1CB0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 12:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859959; cv=none; b=ZqDVOFWl0IF2MjpTNfKngMzrvxFuAHxU7q1iPLRr5YZ9sSjQR4OkCTydlH5RBrRyimAePIyPDINFnwRkzF7iW2D9i6u4MNTHT7v9+JWOCIDAqxjjkWCXPwBK0cExBnhmodYC3ZDO2rC6nyW2rqCpYSsgxN0zIc9gmrhDEB1zCSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859959; c=relaxed/simple;
	bh=+cd7Wb+c/DY6qqIEwHbkqt47rbEMh9g1QmhO3O6IsJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qevycEa5Q4tqq4VVTBnQWKEmM7MvOi2jxuX6v1wGWwJIPmq0dnw7Mcar+0gh7y8L6ScOatuzbeWiQMBug2h8vGjW8hXrvfUgNzmiFZSBpWXBxShuPUZ5Y0m+/+nTQyoTI5GUSHiS1EL41E72eMAyTcdOtk6xkRp7T88HRmnd0w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56d933b555cso1704371e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 05:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859957; x=1777464757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psCgEnuCREmVs+Euo3XSmQiyScd22lKrY9eBfSqyFx0=;
        b=FA/kcU9GMrUTaH0zIWeXlscdqhIaR3Gwo4tDQIHVSqukAgIAsojbyr7dwulQvFvkx4
         ljY8GBhu2tamtee0Gch+MHWJwhujw0T4188YcHyASLVvtZ5zNoDj8BjOfOCODesViKaU
         kO8Sqb33YxURtIXqvjCr9E/MrngeziWdXMyrizcR03NNOPiRWCfH0TU5DHuh23I9ZEw/
         neyUt2LbTeU1odabG0/VU+MYS5XvO5VmsIw/5Ii+/+Czg/qFJGRvWm6/4MBmA+oXfSJC
         rjxZoIzbRaXO9MxUVhBPJh+9aePFiE0a9sFcSX4sVnKrLmv6WDBkVUXFKWBNDBR+BoH8
         7ieg==
X-Forwarded-Encrypted: i=1; AFNElJ9pTyt/tf7mkLfkw2iWcIvAJdzVZZjoQD7nR5DEJ4W0ayGpWBThRMu99fJXz7wyqQDDHTALOYPQRExTiIm0YOO98A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3+v/etsUvdigvBnWnHCqCAZ6O2GmfOTlw8LyyD35sULFuwjtc
	TjaYDuIbcDb4nSXQ/tkrrQGbOeW9eWQkGWwgYfNjHpksfe4FnWXO+MwI3EbaDjZvOVM=
X-Gm-Gg: AeBDievttj4zYVOb66F2hVRdZJdTcbG2Abod/8eTse7UYN2YrYQjIcuIGN7wXnvBkbp
	nQYB/AXEy2U+u0t32TWmbNHZTpf5x2vZz7EI4zd6xJkd9JdtpPWSfN0HBfilVbFl1vBjRT7B713
	ZHI5KTNtg2AOcdWUHpOVFCW3oeewhj0r330DHDyOyh7hYPDLPb+1a0ccBn69zOqcO3eK6JjwjLh
	fEBuXyusQPf5BzFempP16kLS5+Ob3L18sCcroe43ch9Sg/AacqolKZJ4outsLA3ldMVCBXY3FJO
	Via/zZz2+9hb96FrvawYmMIQoG3qw85LJDKFahYemOGUZdIDNndtSYARgZ1tomLrgqGFgOdzp44
	u1jK3VEZ1SGf8f97Azlx7aXp88TPwvXhBWZZkrH4obKzCfOqMcfYbwsa6fKRBXapTu3fG/32LjL
	z63lplMYio4dYyyxlbHCXB1lvEMduaWtVQTTA5HYC8DqI0n/jIrCWHZwq+5t+60sHfT4rtb7CqJ
	WI=
X-Received: by 2002:a05:6122:4696:b0:56a:9841:9f81 with SMTP id 71dfb90a1353d-56fa583840emr6677248e0c.6.1776859956873;
        Wed, 22 Apr 2026 05:12:36 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa92f25acsm9510449e0c.9.2026.04.22.05.12.35
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 05:12:36 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56d933b555cso1704359e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Apr 2026 05:12:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8UzEIwDYaxDmckBDR6Co3IKAVW+yID8oNltGy1s3rDb7T4YsURFov2q7zUPvr1wsFcE6gKfjqYV18FfMJBG1K0lg==@vger.kernel.org
X-Received: by 2002:a05:6122:2087:b0:56f:2aaa:450c with SMTP id
 71dfb90a1353d-56fa57a56e7mr10839676e0c.1.1776859955553; Wed, 22 Apr 2026
 05:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413182456.811543-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260413182456.811543-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260413182456.811543-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Apr 2026 14:12:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVMkSsGb9Q9CaL20eWpZz0PM_TRWi0JWDWfUt8=qWY0oQ@mail.gmail.com>
X-Gm-Features: AQROBzC06dhbox3-XpxeCkjK1m9Ewa091HtabksZINdNUk6YJQcf86V-GFrLgIc
Message-ID: <CAMuHMdVMkSsGb9Q9CaL20eWpZz0PM_TRWi0JWDWfUt8=qWY0oQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] pinctrl: renesas: rzg2l: Handle PUPD for RZ/V2H(P)
 dedicated pins in PM
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31505-lists,linux-renesas-soc=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: D829D445C98
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 13 Apr 2026 at 20:25, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> On RZ/V2H(P), dedicated pins support pull-up/pull-down configuration
> via PIN_CFG_PUPD. Add PUPD handling for dedicated pins in the PM
> save/restore path.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

