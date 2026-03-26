Return-Path: <linux-renesas-soc+bounces-30367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCsfOZ1JxWkU8wQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-30367-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:58:37 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E2593372A5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 15:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED57F30A3DCA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Mar 2026 14:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF97A3FFAD1;
	Thu, 26 Mar 2026 14:49:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB093FE65F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 14:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536566; cv=none; b=VYAGc+SFBF8sz4TYblRioqsqvGC6us/8+8ovRzLCNAyNvdW+axuJodFQf26+wbBBpAGvDq8qRwTARRYgYgqocrjGkSIhyuG59X4gK2w0LcX9CQdvs3kIh+TGqfuyaif/Pa+cvL6Oyl3aX3GUaezRKbbXfBp+WSyJ4FZOSTHwSQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536566; c=relaxed/simple;
	bh=LAjDDjYLxBGBKYW9On9dS5WSAEqjQOfiLvmLec0y5VA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MK2E+VW4vN0RXD6OLKn7fNDScByacid93sJeSw0WdGq4pUAKVExSQcY0UmzjdCwVrnGo+ekcjYXkRhiz41GAbmz7O92Bqi2jprG6HlneDcGlEZhjLKXDqi+DBLCh4PcWnfCiKkXe1gGl1g1btIhIP7GskmzyG6nOfJRELnfCl4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so136833166b.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774536563; x=1775141363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SfvDUd4xZdosPMkUZ31iKqQ7IrFxYHt5vMpaGx7N+g=;
        b=jsDabT4JHo0BkGg8wum70283rlqxIJYGUf/mFaTW9newT0H3m84odmkGw4ZjB38PZl
         utdHthjE2vcj8Epk39s6b05VopO8EkI4AZr4il91lJRjHb7oFCa1ZetDR+ZAn0Nb0gxO
         /lECkSrv+BLaApHjxoZjEWF5Ig+UiaI7VExZFAjo96T5PWzzcrjVS7g8ISxtQ2vzucH/
         8q6nbTvM/+FllmRsX9FwhRtS+MQutVDaxJY9El/unhgDIL9+mKpVT+wpD8JLvpAMLOGD
         PXmIvWNzBh23cMpdWVHcsFgDXbi0z2+d2vhpi5lqD1yl/igFuR9ltJgPbJ/QHmPrRCRJ
         8bQA==
X-Forwarded-Encrypted: i=1; AJvYcCW3cmD4wW600PhxXf9Xbd4hLDVXXxL3LUCnkMr3giITcBnZjvWSWELVP0/fCSLTk+YCsa5aVoodqrwi5U1o0HSWOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMCtt94g5criFfRvRnkaFy8N2KaVC5I7IImTQ2Mz7CKdqrKFec
	+3ycupEUxpDO9N0qB9FKukH2FXboOPMUoKeFgzOzs8AyHZbmdkUBZqImFkvSZqhgg7c=
X-Gm-Gg: ATEYQzyBTLZWPRU/iMaPdPgCP/s762TYXcIJvgebO97yzAibUbTL02Q/6MsXmYzVkLU
	wiS8o5KMo2FLeSYS8KWQyKjeeTuyvgQgy9AucgxvqYUb77PgTaBevTCc1uszNZVu5xvw5yPI/l2
	p36OEIBbTVbcl4m9DvwYVHCmHT6sgC6GDnbmiWQWvYjlfFR0h3i+oycGoAh2xVeZxtp81EiB7Tg
	ZTVDoKrAC4BI6Fd7+xBT5FgKNo09uk4NN9D7cPEkW13LK6EDUMIfHLxgce7s3LyJhinziT0vP8B
	94h5C3DbJEyjbZ/JcjIHKvl95BMoWVDiVDsmaOPtMslc42MffIkIjh9LUV0e9Qj7HuE+YkHTG4b
	0zLAOMassccMQmnEpnHocO0B/wfe+Ocrvdadj+YPfoDYmZJHfNvbVUeZg19g3VF8k2bg00ynooR
	qPPDKLCioFxUaEHV9WtG38NAJtxwp7bU1kpml1Tl8ZVWZgMOxhKwckckZ884+W
X-Received: by 2002:a17:906:80ce:b0:b98:528b:844a with SMTP id a640c23a62f3a-b9a542ab2b9mr358404766b.51.1774536563014;
        Thu, 26 Mar 2026 07:49:23 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265120sm129435566b.16.2026.03.26.07.49.21
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 07:49:21 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6618bc129acso1542766a12.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Mar 2026 07:49:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIS6Z5abi6KjXjs/uaudOfqI/PEumvcWbe+mOdLfp668I+R6wlE+rqg4Z5nF/By7TpU5/pZTZ3Qfsf71UUu2dFEQ==@vger.kernel.org
X-Received: by 2002:a17:907:7a89:b0:b98:3ffc:1c39 with SMTP id
 a640c23a62f3a-b9a542bc0ffmr559718266b.56.1774536561331; Thu, 26 Mar 2026
 07:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312082708.98835-1-biju.das.jz@bp.renesas.com> <20260312082708.98835-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260312082708.98835-3-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Mar 2026 15:49:08 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXdxOFoHUqf_fNcj=4A9+EhXAKk2LgjYQGcpY4_-=TOVA@mail.gmail.com>
X-Gm-Features: AQROBzCb1QcDxR_6QXsUfkI4LmWBih6e7SaYIqht2U4adElNYYtE0VKLraUtMyQ
Message-ID: <CAMuHMdXdxOFoHUqf_fNcj=4A9+EhXAKk2LgjYQGcpY4_-=TOVA@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: sh-sci: Add support for RZ/G3L RSCI
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,bp.renesas.com,sang-engineering.com,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-30367-lists,linux-renesas-soc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 7E2593372A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 at 09:27, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add support for RZ/G3L RSCI. The RSCI IP found on the RZ/G3L SoC is
> similar to RZ/G3E, but it has 3 clocks (2 module clocks + 1 external
> clock) instead of 6 clocks (5 module clocks + 1 external clock) on the
> RZ/G3E. Both RZ/G3L and RZ/G3E have a 32-bit FIFO, but RZ/G3L has a
> single TCLK with internal dividers, whereas the RZ/G3E has explicit
> clocks for TCLK and its dividers. Add a new port type
> RSCI_PORT_SCIF32_SINGLE_TCLK to handle this clock difference.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

