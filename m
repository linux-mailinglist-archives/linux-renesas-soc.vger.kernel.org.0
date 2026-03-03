Return-Path: <linux-renesas-soc+bounces-28685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKyBDWSUpmnmRQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-28685-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 08:57:24 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E691EA713
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 03 Mar 2026 08:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B0053045021
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Mar 2026 07:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A2338552F;
	Tue,  3 Mar 2026 07:55:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F866379EC4
	for <linux-renesas-soc@vger.kernel.org>; Tue,  3 Mar 2026 07:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772524505; cv=none; b=YQE9n9U0mySujuslLyHi+seSBT5O+PDECdGQ69HkVahmer9EN56tRE06dMu+ibWgXlf5N9Zhi4nY3BqLEZo7yqyAPA2CJK4Zv/qcSkR9mpjgXOWF8QdYF3BF8ZLd/SsFO7tuXfZuKyynk03poPbgAwkdisuFlDRj0dnrqgyJ4a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772524505; c=relaxed/simple;
	bh=hfo+0pbVF2ogQF/uJghFZ4wArUAer/UFKhenzcaQYtw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XES724GVxRl4FMI7Ezvsoxvqjmp3VgjdPiVADfrauDAZdGTsC/zKe3Z9rxIAZF0QdTrt+BW2M7dD/5FeJHtR/8rZN3SxUUJ1RX+qm1OXDXMTgg0KTqHUEazGpoCMSM3TSZKXEDoJ8Eqm5BB7a3PDVI2gfHgqI1CutXFLNz8q7jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56a8a20e6e6so2355003e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 23:55:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772524503; x=1773129303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZCaC/YnT+4W12pb1i++GoONxSFqUE6Q1n9/0jMoNGRk=;
        b=VNjyRiwGFMwCSMsuOJWzBGBfHnx26RYNmQR+OS7tJ0Jwu0XfCU1eJV69Yrv0u/SCMg
         NSXUrSIS8ufWuePRJwvuQSiRsZfB82mVFaIdBbLz8UlVTTiXmJbSzxCR85xlGO2iESuQ
         uniHk2x9+GDQ+zmV8JfCtZ0/Mn5/2MzIliouujMIYDUfalwsJuIMLPfJfKZSfuxO1zn8
         iZSiiQ8nrhxuIGyxpK6DDwVnssaST+sEpm1sAW8HjBv10/pzUSXbutSHkzwDek565BZ0
         f6K5SdadEGeMCfrvYu2+Ex5MoSu38LZcJ+TaQgK1XZ5DfAzN8SrftWBbDRQAGcxzDg3Y
         GVlA==
X-Forwarded-Encrypted: i=1; AJvYcCW2Id3kzaJJ1uutynYTp8pa8yP5ujU97urT6FB4TUGPFKhJNcwZLACbvricEkr0uZ6x9Xsb7RCRpbLCgvXWooPIJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpGQmRX33bu7Vhz/+bzm+JKRPg7bTMgYKJqC33lmbfw+XG+0jV
	AUgNoPx6ukioK3f1NFcNSwC/byEDvmJhfJxtC9XbOQMoVAieK6S8L4yLK0zf8G8A
X-Gm-Gg: ATEYQzw7dE6LBfBCG2YbGC21Kad6N0ODexnMRq4vx7jyIX9gLDRHSN5beuSnL3zE1a5
	tPb2GR8BH/8nksZWcYgIQhGwMaUvSIo1HEMdAe4qpO2Pbs74UH1PELmkjl6PM7OHbeEl9ocJvAG
	5Ssb+df618nvR35crLKMwonSk8mYw1Js0GRe3HSB2crpcI7iyLqQu/3wLTMIWdKCsH9pThn+pGf
	W/ED15npepNprMRg5X2QU8ifvjgWPKL/pFd10ciXTkPBY6pkVbfQQ0UcT+MvvIqeF5vUvhkktJj
	5SZLOE0jyLPWsJsw8Feg1ybbykFEaL1klv0F/d3r8DLCPB0eoqE/MIyM1hMJj+wkvXubtN/Acq8
	vgo0qubUdLGZMe6h01XGIsapBtMSNzkxePeSaWvtPXHYb6tTOam4ME3N/5hUuf4KAAaE/pKvSzW
	pfuss95doGWHUKnVeImpsjDUlGp8V9N/+6JqTpZtBaV2GEsiEQvGoQHgsEKeJ3qMLL
X-Received: by 2002:a05:6102:cc6:b0:5f1:51b1:480 with SMTP id ada2fe7eead31-5ff3228a285mr5263777137.8.1772524503492;
        Mon, 02 Mar 2026 23:55:03 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94df6417a98sm14849519241.4.2026.03.02.23.55.01
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 23:55:02 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56a981f44c9so2323244e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Mar 2026 23:55:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVnsqkfHNaP2RMS+1+RekvssylW7BM0UraTVmVaypkl1IcoZ8fKIaFwUDJtGreLdwiIqG/MHdbRs6R30pRIi4LobA==@vger.kernel.org
X-Received: by 2002:a05:6122:3790:b0:54c:da0:f711 with SMTP id
 71dfb90a1353d-56aa0a50444mr6590193e0c.7.1772524501632; Mon, 02 Mar 2026
 23:55:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115164905.1203453-1-herve.codina@bootlin.com>
 <CAMuHMdUi+FsBveQ9HU+NT7iE7QOX0tKn4Jt_1mfDdq_D0=czJA@mail.gmail.com> <20260302182335.312e0c3a@bootlin.com>
In-Reply-To: <20260302182335.312e0c3a@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 3 Mar 2026 08:54:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWbYw2rrscCd9rc6w3LRAvz8obNt8_ysdFpKDap9HnUUA@mail.gmail.com>
X-Gm-Features: AaiRm53L2Wsi2wlZdUwYCWIWcNicK2zIjnLtyGVZgbFptvGHSV0Nd412z43_ha0
Message-ID: <CAMuHMdWbYw2rrscCd9rc6w3LRAvz8obNt8_ysdFpKDap9HnUUA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: renesas: r9a06g032: Add support for CPU
 frequency scaling
To: Herve Codina <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pascal Eberhard <pascal.eberhard@se.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: C6E691EA713
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[sang-engineering.com,gmail.com,kernel.org,vger.kernel.org,se.com,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-28685-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.235];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,mail.gmail.com:mid,glider.be:email,linux-m68k.org:email,0.0.0.0:email,bootlin.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Herv=C3=A9,

On Mon, 2 Mar 2026 at 18:23, Herve Codina <herve.codina@bootlin.com> wrote:
> On Mon, 2 Mar 2026 18:04:36 +0100
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> > Hi Herv=C3=A9,
> >
> > On Thu, 15 Jan 2026 at 17:49, Herve Codina (Schneider Electric)
> > <herve.codina@bootlin.com> wrote:
> > > In RZ/N1 SoCs, CPUs are allowed to work at 125, 250 or 500 MHz when t=
he
> > > 'ref' clock frequency value is set to 500 MHz which is the default 'r=
ef'
> > > clock frequency value.
> > >
> > > Add support for CPU frequency scaling defining those 3 frequencies in
> > > the opp-table with the assumption that the 'ref' clock is set to its
> > > default value.
> > >
> > > Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootli=
n.com>
> >
> > Thanks for your patch, which LGTM.
> >
> > > --- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> > > +++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
> >
> > > @@ -24,6 +57,7 @@ cpu@0 {
> > >                         compatible =3D "arm,cortex-a7";
> > >                         reg =3D <0>;
> > >                         clocks =3D <&sysctrl R9A06G032_CLK_A7MP>;
> > > +                       operating-points-v2 =3D <&cpu_opp_table>;
> > >                 };
> > >
> > >                 cpu@1 {
> >
> > Unless I am missing something, the RZ/N1 clock driver does not support
> > the A7MP clock yet, so how can cpufreq work for you?
>
> R9A06G032_CLK_A7MP is DIV_CA7

Thank you!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.1.

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

