Return-Path: <linux-renesas-soc+bounces-29785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHq/GMO5umk4bQIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:42:11 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D91062BD5C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 15:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B1C73308699D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Mar 2026 14:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CFE3DBD6B;
	Wed, 18 Mar 2026 14:34:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9133D3DCDBC
	for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 14:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844446; cv=none; b=FfJOp0K7rzDxa11sUR1Gh5P6jjfbZwIfSn5bBhFk091haiFDHq9OKAtU9A2yU/S+Wzs1hi133EPjXFxTkp4rVN9O+IX8ZTZK7NIMZO35EO2MyBcg60XInUkOiFnsiLBuEKPwpZ68ex2YOlt0qxfLwRN5hA0MLOItulcknWG7OWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844446; c=relaxed/simple;
	bh=RLkVcEP08TMA4s2p2rg5pNoBKSU6ELsDGsBnRKWdlAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YQrbjBkRNUUh8E3zoto5aYC3WAqx6Ds+aqwgpJqY1s/SNxvBn6ho0xgbBBOi2UGZCQ5SGosrqESr6ptnqL/S8eO/Hgm+Lfb/gtZsbwK75FOfVYu14qMptZk94UupYPh6P/5STMh7afsG2/nnrYgyYPgcoKbR2AzhehzikQ9HUN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5fff77ff719so3268713137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 07:34:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844444; x=1774449244;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RVuLY5xzbZ7Lht1V7TLoSww4Hf8zSjGXKz5xyn0WXmw=;
        b=PergA8RkoWoPFb2KReOsWhLlxuL+MCeNv8qlFaojjsHw155UAKPKznvd6kPqTLZex1
         BBgOK2bdfXv/UUfMMVV/s0vXDQc4GGOKwyKwiTobkutJn47g76UKKfGnCgu9ca2fHlrF
         lwwqa9MPG6WOUEsbZMh7yWQ8Qv5KCOjNamz5wGV+4DYfzS5qyEKHHBIjeRYjV3UVAy5t
         Fa+ObsQQsDI42t8tgB7VDrTNI5UIGiCWePHh92LhRWkVj/w+8Ab2JwY5bzu6YAsEIKIw
         ++ON2/KKQENYAPeTAukvG9QhoEOGOfYE4rlMyySFBXQ+Rp17RxQaAwPYFmjtPexBH7yu
         5MfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZBiO34SbuyMuK9pLgH4YY6zFj8VN/bGB8HOF6xo9v9L4P9IBUYX88Ur1sCfRpSszZPQPUBcxQ2EfXJ5CR/366zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDCoXHfmYpTwr7ydEkYvQJy+jh/BlNt4Py4bzxOFJ33VQbb5z5
	Km1wA60k4t05Nd1dDcChfSOBnEGKPCt9XbUVnMMSi4KGb63luMCllRx4OCbDQbqTCvg=
X-Gm-Gg: ATEYQzxGw1WKi57pVaUs5dgKL/j1eU72rV8QDJ/RWWrrCAiPQBWASYJZ+j3vv2M0/Zb
	ZzJ9c2D9ADCSXnqeZOV9xj5jUOBmmBdfT1sqlzoK8gDY3IgWQztspJ7hJiiCZ6HpJPWrdmjf09k
	SGMq2sPwyruReTWAEktNXlI+RMf8LbvmNh4Q9NAdgqNO9oUdNQ17OFIe/lAh8SClsasr0nqksD1
	24EJ+PanrkCW32C/S2Si9181D45D470WymK9RnUv3jNDq6hHwDYK1RkmMqhjM7/4myqXaM46Q4s
	h2+PpFZQGszDrlpiWoGALXjom2m/zY17SxMNU0mC9KZNztFsoSAcq6YE7fOmfFQBwdAJPE8JFCv
	z7AuvWcZoLdjItsvo3qFZUszHRuGXJh9PXvTR59qfzs9lZoszGcj+JVjKabIjFa3GgrCWTAVN/M
	x+nYc2kLMlfaXryOW9UUgIPekSkg8H7Ruul26IylhOQNF3YhiAL+RLY7llubbGbtPC0J0mDhg=
X-Received: by 2002:a05:6102:5108:b0:5f7:24e9:ece2 with SMTP id ada2fe7eead31-6027d379368mr1876036137.28.1773844444483;
        Wed, 18 Mar 2026 07:34:04 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95112e39b5bsm443612241.12.2026.03.18.07.34.03
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:34:04 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-5fff77ff719so3268690137.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Mar 2026 07:34:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWSLcZsGzWMYQiLBrPnSpQe+WouIlF3v47hnBBxIEtCmTkv+NFnYf095SoaDibGnOx4foBeYcivH9WTPcptzrwRwg==@vger.kernel.org
X-Received: by 2002:a05:6102:370c:b0:5db:ca9e:b57c with SMTP id
 ada2fe7eead31-6027d3785cemr2012196137.27.1773844443605; Wed, 18 Mar 2026
 07:34:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260312111521.115392-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260312111521.115392-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 15:33:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX4O6a1PizcEEQbcqNH9uS+EFBh5PNtdxLOSry05ZMyGg@mail.gmail.com>
X-Gm-Features: AaiRm53rPDQhGHM9fT2pQfuJKQAJYchfr5aoQucymEyAiqvstwv_Sg2uVhxKDN0
Message-ID: <CAMuHMdX4O6a1PizcEEQbcqNH9uS+EFBh5PNtdxLOSry05ZMyGg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r9a09g056: Add PCIe clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-29785-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.282];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,glider.be:email]
X-Rspamd-Queue-Id: D91062BD5C7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the PCIe controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

