Return-Path: <linux-renesas-soc+bounces-33769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ibiuBEchKGq9+QIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 16:20:55 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCAE660EFB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 09 Jun 2026 16:20:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=hVkDsuBl;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33769-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 266D43052FD4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2026 14:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05265329367;
	Tue,  9 Jun 2026 14:14:37 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BEC31353C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2026 14:14:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781014476; cv=pass; b=RtwpW9CGTzr1mJAIS+nOcuqKUgNsYLDuYdplEwCQS/AlvoFftyYfsslnt7KyMboUV/IlQCR4zR7JbV5AQwNmefjhc0Y2xGTIB39xel7fUu0SwdWH0lQuw8//sUaKcRHXhgssm252Wy3Hj6XZ5cpk6JzOd/5/rdG1VHlZLQXGeGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781014476; c=relaxed/simple;
	bh=Wt9b0GDOzfbd/0ns8DJu7GyOrhJ4Z/5e5VGfsnNYW50=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGyGk0KZ4gxWajN2BkGc1RB0nP7I+RaoTB0OGD17yuTsqdDNt5wvHH1LWzFiLAL6R6zwY3fjtg68VZfg9us+fe80f+5KfgSXiv9NdroizWbiR4jIYIYNFMloqON14SCFFGLkTWZPeT2ZfKEZSOzd8yKSZzrrM+WFKhwKRc74vFs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hVkDsuBl; arc=pass smtp.client-ip=209.85.216.51
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso4965380a91.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Jun 2026 07:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781014475; cv=none;
        d=google.com; s=arc-20240605;
        b=Y0P1xMxtMYjzeiG1QHCDhql1YAIuA5gVbiXnSvo5byy9GN+pAAeJVhJeSNfM9zT9Pd
         RvdlDCi6g1SNlalbCZkAeIxptHjBUkAfqBH6Oo7hfUGiGlBi5066wgMt5RNqwAfzdiGq
         Lmzqi4vUv68X5XVEwFTszq2A7J8BlxweK64sZ/O6BbVmYEMD1m9WEkxnwcbdzUYjDuNK
         9UmGyEL97bbSRKelEVev2Qzw8aVtzjZxXpox9lG5IL7kd0roDIMSQ6D8x/N86P4KCn7M
         rO6d3NoVGvkvXWyrfGy0ZpjfOSTGEiklNqYCAMKAGHuoJj4c//dh9oCyUziZYjPpqiaP
         mUYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YVCTP06+ReD7xAAc8z3Zxd2jt06xnT3/d3ueG+sZj3A=;
        fh=3u6UO/Ikb+Xmck2LNZCF389m4AqJRrq0/ycELeGc/Ms=;
        b=Gt/gRaSFivj9S9fuR19EIcquFcsWVgsIRJcGBSVagTgsZjmlMAyBZfziBLOH1Mhai6
         MuzSgOUV/ZTtKklqnJJ6+oP6rBJVqtebB6XgxrMdJaDAzq/hNZRwdgAIgKQS0/SUFKRX
         2+zxx21wssuNa39RPY2u0LysnF/ykUrGxCy7gZ84RZ8mtcJH+tZYZuYC1EolbZRWh1ET
         uePP5us5A8ZM88fIUwJsHPKHzR5neyorpE6qtKdhJwEyP3Da0IpBEFDbxE0fsZltL9gu
         R8Iszt+intuwBQOJKdRaubDhdoaYIxV2mbC4NtThCmwB/MCzcFS5mNTvB16gtQKFexSN
         H4fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781014475; x=1781619275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVCTP06+ReD7xAAc8z3Zxd2jt06xnT3/d3ueG+sZj3A=;
        b=hVkDsuBl01Ge5M5dAy+QxgOS9LQWkHB33ioPVqAlcCl+TdXELe99YQD//3QSxX/81g
         eekSaO87B3uipPBc2pfixMYXSRZ2Air01xlT4t4PqbsKG7WjWI9JEWt5/T7IKEcgDmyQ
         j/VX81B9OknFjzaKndLenwmrBcEHJX8BPK2Hsv/ShcDuGaKPIb8sBDEI0mTOTc3hvlt0
         gwVJu4H/SYcUnPIyLO4ck5OaSKc9w6iNzDkisERqsweDZBrKwmHHkxWX/pDaD6E6mV2O
         urAGTx66Fp/s02pXB+MLE8n10lLWHb3+xc4YXZXKFacpnr2iftzzZv08jbxmKwcGAIMo
         Gdbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781014475; x=1781619275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YVCTP06+ReD7xAAc8z3Zxd2jt06xnT3/d3ueG+sZj3A=;
        b=WoLCTWlG4tPVjMxONovdauU3dLVcRzBBsQaA8YAv4+4sr+bC+c9INFvrcgmZ08DQ9B
         ReigYE+opoo+9ZqzqjKLUPgAGh/N1IgN/meNj/8nKMAM5hjeMpCVr/hpGzC01nd1tDZ4
         /AdNHz3ScALqems+GPSTmmsT2buy2QJ3pczyU+J1hKyT6ugP2LD3jUBNSAW7s4cx6oK2
         /CA47SlleYmortAQp5GaqGDb7VrLgoEOG8IHjqlYOD/r7XnGcXwME33Wl1SgDeG2z5Q9
         yxSy2yvAi5rRWeEnqVKCfpi1YscNvwxtZbbIYegZHaY0uD3OnS0eE/LN0GB1E4A+OpK3
         0MbA==
X-Forwarded-Encrypted: i=1; AFNElJ+01+MtmBYVuuE2C//BExW+XMw1yG6bocdmZ4s6btms6hDr0oQLrxp1jL6fOCXYiku+vxwcfTDWvKnkD4RfCWMPfg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJoO4f0NSP3/X+DhEkqdHqS4s39ReV0XvXXCdyk3EB1xcKSeqa
	XFhjk8RqwjH8Osmuh9ge1CWQn5hAsDop+1W8+tkv8/JDZBjuIwk+SjbwBdiKwmfN9QkYEdDrelx
	fn6uIJlmUAKrS9nSPmAqyyvqhMwknsgQ=
X-Gm-Gg: Acq92OEJ5/UWDUYZ0cczkHCNkf6r85XrcmJX8gZ1sG1Z2JsEptVMlbBrqh0NW1zbFU+
	NRZyObIrrCnInQthqDVE6ufMgqg2ehXjJXF3IbWDIorBqum7g30PAiC9lQcAFUaZtq08tKT5Wqv
	fpzrGoVwstn7iNh6Vz2oCZKgD5JANPELWQrmqqvxYmPbe4kwLRTtwrGxU5nJ9M/tpKEt7gNkvC9
	yhc4Id90x9Hk2Wjt/yQ3zMvDL+Sk94SQGPZ1yB5UsLbi6d7bJ3o4QUEnDZl4RSeIDk8ADS+XlpF
	CVkgRLhEv8+SVgBJomzUSDNAOCapWaKG2TgiGPSDOoo45DDMAQ+4TRWrpMjdFX25280DpgWZLg=
	=
X-Received: by 2002:a17:90b:58e7:b0:36b:936e:73c8 with SMTP id
 98e67ed59e1d1-370f0e4ad33mr24408813a91.19.1781014474736; Tue, 09 Jun 2026
 07:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605-rzv2h-rspi-v1-1-c1d5ed562249@gmail.com> <CAMuHMdVEYciUYq6savTuOqDUQp6AqHGkeP30s6Z7PoZ3q-Pqvg@mail.gmail.com>
In-Reply-To: <CAMuHMdVEYciUYq6savTuOqDUQp6AqHGkeP30s6Z7PoZ3q-Pqvg@mail.gmail.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 9 Jun 2026 22:14:24 +0800
X-Gm-Features: AVVi8CegqVqtWbCTnlD2kodnPbitaAU8L0BkslvTa0l9OTb7Eanw1TWxLeemMds
Message-ID: <CAN4SLj0o+3Bjq0aBJUYbKU-YkXUeM9aPgRxiwmOHX_Fz-_Hq+A@mail.gmail.com>
Subject: Re: [PATCH] spi: rzv2h-rspi: fix incorrect readl() accessor for 8-bit
 RX path
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Mark Brown <broonie@kernel.org>, 
	linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:fabrizio.castro.jz@renesas.com,m:broonie@kernel.org,m:linux-spi@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33769-lists,linux-renesas-soc=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ustcgu@gmail.com,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ustcgu@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CCAE660EFB

Hi Geert,

On Mon, Jun 8, 2026 at 3:55=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Felix,
>
> On Fri, 5 Jun 2026 at 17:26, Felix Gu <ustc.gu@gmail.com> wrote:
> >
> > Fixes: 8b61c8919dff ("spi: Add driver for the RZ/V2H(P) RSPI IP")
> > Signed-off-by: Felix Gu <ustc.gu@gmail.com>
>
> Thanks for your patch!
>
>
> According to Chapter 7.5 Serial Peripheral Interface (RSPI) Subsection
> 7.5.2.1 List of Registers, the SPI Data Register supports access sizes
> of 8, 16, and 32 bits.
>
> However, the "Access Size [bits]*1" column header has a foot note:
>
>     "Note 1.  The read access size is fixed at 32 bits."
>
> Hence that means the rzv2h_rspi_rx_u8() function as generated by the
> RZV2H_RSPI_RX() macro is correct, but rzv2h_rspi_rx_u16() is not?
>
> Also, readw() in rzv2h_rx_irq_handler() is wrong, too?
>
Thanks for the detailed explanation.
I didn't check the reference, just thought it's a little weird here.

Although the column header has a footnote to indicate the access
size is fixed at 32bits.
But in 7.5.2.2 register description, it specifies that for registers like
SPDR, SPCR, SPSCR, SPCMD, SPDCR2, SPSSR, their access
size are fixed at 32bits, but for SPSR, there is no footnote to specify
the access size.
And SPSR is 0x52, readl on the register cause alignment issue?


Best regards,
Felix



> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

