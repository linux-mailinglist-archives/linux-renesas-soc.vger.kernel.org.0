Return-Path: <linux-renesas-soc+bounces-31032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGEWK8R21mlQFggAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-31032-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:39:48 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7983BE507
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Apr 2026 17:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0E663301A28C
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Apr 2026 15:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDD528E0;
	Wed,  8 Apr 2026 15:39:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDF83D3301
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Apr 2026 15:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775662782; cv=none; b=PngV6e9ulMeBQ/Z00s0juGNExQC39W5+J60hInYIRUSZXkbr2sRgseHS/1r9Q8r68w4FZG2WSKGr6JwnKatU6jTBarGzYBKU4lVctCVi4Q5t4rFydA6034VqDp7p3cxjkqBIHqzXJQjIlHdVG7seE93coGEaKuSHMvRDQB8OYds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775662782; c=relaxed/simple;
	bh=y4zf7cW5EbZBC46mnLaONDcohrozG4F73JPhm83PJ3Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQUnYmBN1tN3Vu+CWVBRyKGjsGEEX9n2WghwoUtFnEzdXToarNS7n7UfGCw0CDt1vLpgB2SmDxA5pDaUmmstIvG03iAZ3OB4Cgld6Fe9Sd9E7QMcDOR/2jYzDXITil9+7SFOstHaLAi+oTeMww9+vgwWVQhoFGEqoZ+Bu3SUqhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso5001156e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:39:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775662778; x=1776267578;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LKwJyBa6BNRH4CJj7npuL4jDFCQf7vqexI4deVey9ew=;
        b=ijb7bqIlOOVLBNOof/UOsa69uefFC5XtsF7pYG/iTS1UF6GdLNnh5s7faliCPwB834
         qJZsdx5UCl8lH/BBBRrwLJvXVP24mrIwSSGmubd7+2y2KCtGBGu2uiQ92kuFu1rDEf8o
         U4mV1j3vA/IOzRyuoUZY/LtOorDTjM32gS5QhaCSDFnJKIeEP/Kx28IvYOrakP/jmxHE
         vvWIgM3UHMDZjJv6OdJx9BvyZci3Zclt0/PDld862ATU6NzdJKheZIE1D3Ls2K5Pyv8r
         qsDy9ZYwJuesWk08fOggIqtSKhQEPDMsa0bbT8nBQSMyBe1vp/Nb2LYiNv0X7lvf5ya9
         TfRw==
X-Forwarded-Encrypted: i=1; AJvYcCUjilb8o9QszenQFn6Qy61rj3PRNTmk2NvpRYoTYcwq3TQ1oTo11YJLVol7SNeYPphbuT7R2IKjzbobYjt9FDbZoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvRI+CXZHej+ENoGfXgb4lo1AgxcKdDLupLqCvOlrODXgDEK2u
	exVwf67HTD1vOMjd242RWAV9Sqh6Ff6DPxUe8ZxKzb+53z1zPAsfRCdbjIaknlIn
X-Gm-Gg: AeBDievichobOlrSOOyZ8d/iA7NgsjIg+hOqiJCRMRhjuXviZEkb4hDWRa6TVU5oXSQ
	WRCVtkwwcl8dK5Wa6KrOpKn3zD+/OU0A8szuvDTIEJC5BN046VJK9mARuCnx2ZxG4V40DNM3opv
	Dn4kPflNHxmhfwQDjEIPnP1ZihnXlBEcyIRLS2iC1mqq8uqBSiWUOm9aLHS+zlWZBUD6/yubVT1
	4J50op/CtsJdc9/dpzlIvSKUShhje0w5RyHEGDov9fwM2rDfd6cb98L9ZqENQD1TKBy+CCXIGfu
	4aw1Hycp55z48914GH8+lBLMN6UjF/PZIEkzkcbplqgoEfexmCP8sBNRQaCCWqKGnsb+nmd+d1a
	P5fN3Q9jv/Qtkrk1VCcMkcfCktj+559z1T4OEw1UfgaHMe/tVYmUGrKwI07K+Q7RCtACRcFp2gw
	kHateBM7TlO24hhAy2LmzhRnsIKVkI8EZyfccaMEFvu1kJJ0X+l0mW4S3jxDnYIyfX
X-Received: by 2002:a05:6122:8287:b0:56c:da22:6919 with SMTP id 71dfb90a1353d-56dab9a2a3fmr9513573e0c.10.1775662778317;
        Wed, 08 Apr 2026 08:39:38 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fbb1a0d7sm16060119241.13.2026.04.08.08.39.36
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 08:39:37 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso5001095e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Apr 2026 08:39:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUaag3AMt14LmBlOscwMJFPHxMRZHu3630YMlvZaUQcpbFr3sKzR8NAvgICQy+EdQSCTfLLfn60AOhe4u7ugouzQ==@vger.kernel.org
X-Received: by 2002:a05:6122:17a9:b0:56c:d6f1:d742 with SMTP id
 71dfb90a1353d-56dab8f874bmr9660188e0c.8.1775662776150; Wed, 08 Apr 2026
 08:39:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260408142105.310210-1-biju.das.jz@bp.renesas.com> <20260408142105.310210-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260408142105.310210-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 17:39:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW5_k+iBekmV47W+Qqt5qDLMrLMRWZnnH5wCNP8E30N3A@mail.gmail.com>
X-Gm-Features: AQROBzB3_pGc4FZfhgLwR-Yt_w0_lTPGNrQbLw_Y5u5jxNU4I7ayBJbLjcoHCC8
Message-ID: <CAMuHMdW5_k+iBekmV47W+Qqt5qDLMrLMRWZnnH5wCNP8E30N3A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] serial: sh-sci: Avoid divide-by-zero fault
To: Biju <biju.das.au@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31032-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.750];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: 2A7983BE507
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 8 Apr 2026 at 16:21, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> uart_update_timeout() computes a timeout value by dividing by the baud
> rate. If baud is zero =E2=80=94 which can occur when the hardware returns=
 an
> unsupported or invalid rate =E2=80=94 this results in a divide-by-zero fa=
ult.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/tty/serial/rsci.c
> +++ b/drivers/tty/serial/rsci.c
> @@ -286,7 +286,8 @@ static void rsci_set_termios(struct uart_port *port, =
struct ktermios *termios,
>         sci_port_enable(s);
>         uart_port_lock_irqsave(port, &flags);
>
> -       uart_update_timeout(port, termios->c_cflag, baud);
> +       if (baud)
> +               uart_update_timeout(port, termios->c_cflag, baud);
>
>         rsci_serial_out(port, CCR0, ccr0_val);
>
> diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
> index 6c819b6b2425..429e89106ee3 100644
> --- a/drivers/tty/serial/sh-sci.c
> +++ b/drivers/tty/serial/sh-sci.c
> @@ -2805,7 +2805,8 @@ static void sci_set_termios(struct uart_port *port,=
 struct ktermios *termios,
>
>         sci_reset(port);
>
> -       uart_update_timeout(port, termios->c_cflag, baud);
> +       if (baud)
> +               uart_update_timeout(port, termios->c_cflag, baud);

Nice catches!

>
>         /* byte size and parity */
>         bits =3D tty_get_frame_size(termios->c_cflag);

I think there's another one out of context, which can even trigger with
baud =3D=3D 75:

        s->rx_frame =3D (10000 * bits) / (baud / 100);

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

