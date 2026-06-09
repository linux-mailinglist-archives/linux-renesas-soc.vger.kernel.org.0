Return-Path: <linux-renesas-soc+bounces-33770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XsJhJU4lKGon/AIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 16:38:06 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F16CA661362
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 16:38:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33770-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4E76311863E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 14:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07443438A5;
	Tue,  9 Jun 2026 14:28:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C2333E377
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 14:28:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015336; cv=none; b=TSv0tmbQyLs4qKf3gDe9VITnfgqvZbgYdUh4mukknehix7e1FEAxQIg8S2iEEaiVYBEFWi2zUWsJgC5XQ7n1cci2OGdRO4Jpilt5ArLfPM9v4VrVNyEaAUGv4He9F1khT1UF4ceA3rV5aTg2OQnAZnnXQ6IY1M8BT4RKCtpRiiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015336; c=relaxed/simple;
	bh=ogfDlnzBcc1OB6AZDDh1GpRPo9cWTVWur3OQA17OUCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WSNWRwZeEctq7haMu0N7k4Hd9/KD50gO/WEj2YpjuIhwp0uvmN3rLdK/t70wAsVcR565ZpH3C8H8DJVtEpq/hwOzAWOftXybGRC7mjeJtxYZ2wQX15h9HmdEkPA7Tl8yKKoAs40vyoX/RlNSLI6mv2q+k55KHlU4z6iHGNMP2pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-963f63fe025so1588924241.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 07:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015334; x=1781620134;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ip5sH1agdDU+wNC7wtZTrjXnWLeSyW0k20W5HgSy420=;
        b=XMP/Vpda5pRaXU4sleE2uwjLgZukhPSwaoinO/GL9lMytjvIovy7ovjsIjqLMnYFGG
         YwGjAqaz72afTxvufklqhPvgGbFEF7DibY/rL2xsUj8ipzS3kKFjbeWDk+Nw0761bf1O
         QrHMHXuRWeLeao5u6zx5tl1oWvX7y8+Dj5zHJ6WVoExkjfjT7dHLwJH4I6FCzRmXfVv5
         VhOpTHnG77ur0qYMCM91Q2fqHiJQbL1M6MxEEFcIqn0y1ouMqnr+s+11SYcuIbc69cgO
         l0QLaEKrXs5mFEKpu1DJS/gWMDz2adCuQRnIuIcKmm3dIjTsc+O9KTDqETaUa/ttW4O5
         +t9A==
X-Forwarded-Encrypted: i=1; AFNElJ9IR4ySfzl3spqFCGQYnFYvT07SPqplkXyKaQKlkv7wSx/mHFHh+++lIHpReaSkc/x8UGexfYxZVzq5z7zWFmZyQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjH1FTcnuxYd1CXjYngO3ysnPboFCX/qTqgls2jwOWSWQcAcwv
	zoxXm9zOWVyDK6jW5eY0PJPsDQFdYk0N1nM1g2bn8dNjpR0IYBgR1DmgflpMXrv/Kdc=
X-Gm-Gg: Acq92OFJCffUCMGIAILpNudTfQE+3IvNzD8eitiZRDjG7Kp2Sx/iWODmEITs2ZayZd3
	dJQS+6x2Zzl3GUsjoCY7mSMPkn82dAbgwDxzVlXNMTaBO0Dbdm6KPJQlNl8W9sAN8B4wGHU6x0f
	XRr4G1V3mEtbpCqGHv16Aw1U/03ls8s9fDWyz4VfOBzDw4jG/JDsGHDsy0/EBlIujQP5kpdYloG
	FSIGw1hTfFVGr7bm+6YrWnd1FYG5uCH49PDVVFXCLEVHurzO0xUMpgfPCQ5Sc1CeL2Y5d1q/yDm
	DtoLmSJClVTK+ZxP20qVgckOW9jtxoipPLigMo5rF7AsWdcne50yrOLyr5R+FtDXnSRolfVaDcb
	0NmSbKX1ozzlxqTe3+06Sgfur9XCG9IvUnUiCQs+B92ltdBXOHsIydb0nKqqjWHzF99jsoPcjvC
	n5krO+CgVq6JJuxnydKJAQPqK/gNBbEY38Szgz1rHfs3Fw/k/DCnsItIa8R82Cfzp3uefrq00=
X-Received: by 2002:a05:6102:580f:b0:631:2dc6:2f5c with SMTP id ada2fe7eead31-6fedea4018cmr9144699137.0.1781015334441;
        Tue, 09 Jun 2026 07:28:54 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6eb649b710csm17107336137.7.2026.06.09.07.28.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:28:53 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6cfd17e9250so2395790137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 07:28:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Kvpk4PAmr+lxUZOdtZGDaxf6xc5yxKl+l5QpuaITzJPaiAKt2PohE/V16z7gBFiRB4xHRE+kakmO0KvRbnGJC4w==@vger.kernel.org
X-Received: by 2002:a05:6102:4191:b0:634:a573:c097 with SMTP id
 ada2fe7eead31-6fef36392d5mr8870898137.13.1781015333253; Tue, 09 Jun 2026
 07:28:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-rzv2h-rspi-v1-1-c1d5ed562249@gmail.com>
 <CAMuHMdVEYciUYq6savTuOqDUQp6AqHGkeP30s6Z7PoZ3q-Pqvg@mail.gmail.com> <CAN4SLj0o+3Bjq0aBJUYbKU-YkXUeM9aPgRxiwmOHX_Fz-_Hq+A@mail.gmail.com>
In-Reply-To: <CAN4SLj0o+3Bjq0aBJUYbKU-YkXUeM9aPgRxiwmOHX_Fz-_Hq+A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Jun 2026 16:28:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVX4ZJkXe1if=iHu5dt=Xtka=C9y8hxKYKc_7=bysycog@mail.gmail.com>
X-Gm-Features: AVVi8CfM28mVF7ANUyqKAdwxfMg6jnbRMy8l3EB3MFSG3wNg3msORlNrQsZGdzQ
Message-ID: <CAMuHMdVX4ZJkXe1if=iHu5dt=Xtka=C9y8hxKYKc_7=bysycog@mail.gmail.com>
Subject: Re: [PATCH] spi: rzv2h-rspi: fix incorrect readl() accessor for 8-bit
 RX path
To: Felix Gu <ustc.gu@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33770-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:fabrizio.castro.jz@renesas.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F16CA661362

Hi Felix,

On Tue, 9 Jun 2026 at 16:14, Felix Gu <ustc.gu@gmail.com> wrote:
 On Mon, Jun 8, 2026 at 3:55=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> > On Fri, 5 Jun 2026 at 17:26, Felix Gu <ustc.gu@gmail.com> wrote:
> > >
> > > Fixes: 8b61c8919dff ("spi: Add driver for the RZ/V2H(P) RSPI IP")
> > > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> >
> > According to Chapter 7.5 Serial Peripheral Interface (RSPI) Subsection
> > 7.5.2.1 List of Registers, the SPI Data Register supports access sizes
> > of 8, 16, and 32 bits.
> >
> > However, the "Access Size [bits]*1" column header has a foot note:
> >
> >     "Note 1.  The read access size is fixed at 32 bits."
> >
> > Hence that means the rzv2h_rspi_rx_u8() function as generated by the
> > RZV2H_RSPI_RX() macro is correct, but rzv2h_rspi_rx_u16() is not?
> >
> > Also, readw() in rzv2h_rx_irq_handler() is wrong, too?
> >
> Thanks for the detailed explanation.
> I didn't check the reference, just thought it's a little weird here.
>
> Although the column header has a footnote to indicate the access
> size is fixed at 32bits.
> But in 7.5.2.2 register description, it specifies that for registers like
> SPDR, SPCR, SPSCR, SPCMD, SPDCR2, SPSSR, their access
> size are fixed at 32bits, but for SPSR, there is no footnote to specify
> the access size.

True.

> And SPSR is 0x52, readl on the register cause alignment issue?

Good point. Let's wait for Fabrizio's response...

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

