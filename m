Return-Path: <linux-renesas-soc+bounces-31634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM7CL39o62n1MgAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 14:56:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E9445EBD8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 14:56:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BFAB93006019
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 Apr 2026 12:55:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E263D1CA0;
	Fri, 24 Apr 2026 12:55:20 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A173BB9E5
	for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 12:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777035317; cv=none; b=GR/UaySbjtnH6XayQBzeKp9l1e0mp9OfQ4F4A+TIvJCpl2EboByKEMKZTNRr+/FLEP3Tg95/EjyIAUDFS8VHA0AjNGdZtek3z8zZPg/2+AJhNM4Zq2o46dlG2dWZhbc5O1S0q04krgrJA0dqAr0oYyWjzAlmaDRYma7CGm14/xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777035317; c=relaxed/simple;
	bh=0AkTkz7PavrZfk2ep3iewGI6ARs5eoc7dMRB/pPd/Rs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mhJseULdxt2xvkvwyUW9puMKxZdO68ApIh1LYp02wIS6ZmFbzPO9/Ypk52vzG4AXXo0OYALHW8l+/oxUx5Q48EzDZIbLw+u59VX+8TQ4b113NTB7Jg/GjLvGB3Vr0YXfR4VxA4f0or2wTrR1nqy+udWLw1Y/J4VgZnhJhvrEUM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-baa8c78ac7fso563447766b.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 05:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777035311; x=1777640111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5vJjGO2tC5oIa+NDmM7lxEsTgUzNznIowWCeDLtGCw=;
        b=VNRBKqDz8BpiTCS9mLyspC2PiXpEwtl0Ymy5YwoXR0vaIJJfjsIRHhX19mE2NS9O9r
         4dUYuPQBOCh++T5UjN9EpL3XGykZFChLovDR1B+rrQETvR43qAviwjRYVIBH6k5pMMOP
         6WkmiWT+iZswElBT3u8X52zfSuyt5xpDpbWtS7MlWg2tTuqq/6KsJmGPQEIRE2rVwX0B
         lmGMry5PAFvODsOPRyu9MkkyG62I3eK2hvNuJLUZ90oeDorJPAldwe5+ZvJvFCu7nPMd
         wc9RodMNw+sfwqFWh6kzTYIXzdlCfaxesege3RXBS2zszjx7xSIevaICrbXlDJHfqDcY
         TDeg==
X-Forwarded-Encrypted: i=1; AFNElJ/jud795XAKXeu+wN+WRDs/9VgxK5fZ3E49db1UxmqawMkfqudYL1TDhGP1sDT/Izc1KqRgoIH9cCqQd8Hvic4bRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwQu2Zc7nKzN35gkndjdZig5mFSEJOa2hw4Tacvk+OJds1ADNBD
	VpGAUXscMcRkTvLTRxw/pAQrC+8WJr1hyWyRyWuDGVfoDMFhJFccefwkHwa3Y4bBW80=
X-Gm-Gg: AeBDievw03xT0j3M7Mtw2+71wAUODxy5ltkQKvXpvPdiPKO2ji3oGhA2mItc6pZZix8
	Lvupe6uY/OckX87Wk04zeaJtb/4KrcX6Tajvlg2F9Kf+ybDxuWoZt/PLVXu0ckO/itKwCbl0a98
	469e01BA30TwNTUPzXu759BEdDlFFLQUUZb9SN9VPUSPKdRcW2T7Ili0FDZq5/ha7BnawuYoXg7
	PO+VyRgnuWh6Sx8Wi1mO9tNzyz4f1TZId4PunZ3b2RTTN61e15B582uU7qFg5RX1IcIuS4nzAwW
	fQH0zr76NYCApIrMDUGzs7sWBVRAoJTnXeYgun4i/zzTqyOUVihpQaaCaVmKAsUNaO7GGjLsPns
	HFdmv/2ZxCB9Ipv9OPp99fWHU16Ccf0zEniMY8LrdYiKx9CJwF0+LmbY9uEViBqzv+OM2U+Ft4Y
	YdNQDYxB7T8q9q+AMtX09Tw+nyH0vsqxcPV5YSkSD45qRYtykFCdQePNFJBZ4CXPw0SeMGfew=
X-Received: by 2002:a17:907:a80b:b0:b73:2b08:ac70 with SMTP id a640c23a62f3a-ba41b5d27aemr1614672366b.49.1777035311471;
        Fri, 24 Apr 2026 05:55:11 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba6366452c6sm642396966b.11.2026.04.24.05.55.08
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:55:08 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-674a44b84fcso10367829a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 24 Apr 2026 05:55:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ97YMFQPtBKacjUriawiqgnANRy9wxZuQWMVYnnshJkEUu/y5lNHXOkXFdgr466JWTWJsQbbqZzX86s280Wc8OkBQ==@vger.kernel.org
X-Received: by 2002:a17:906:4fc5:b0:b97:aea3:86dc with SMTP id
 a640c23a62f3a-ba419074424mr1701986366b.15.1777035308315; Fri, 24 Apr 2026
 05:55:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330132349.149391-1-biju.das.jz@bp.renesas.com> <20260330132349.149391-5-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260330132349.149391-5-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 14:54:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU67v__Vx9bEXt3J6=KPL1H+BMZze3LciENenMkVghqeA@mail.gmail.com>
X-Gm-Features: AQROBzCGlvM1AaRvUuqM2RvSN4bri7K6oIFhtK558gdagjk0-rYNfxDSOhaRcnQ
Message-ID: <CAMuHMdU67v__Vx9bEXt3J6=KPL1H+BMZze3LciENenMkVghqeA@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: renesas: r9a08g046: Add SCIF{1..5} clocks/reset
To: Biju <biju.das.au@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: B6E9445EBD8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31634-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid]

On Mon, 30 Mar 2026 at 15:23, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add SCIF{1..5} clock and reset entries.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

