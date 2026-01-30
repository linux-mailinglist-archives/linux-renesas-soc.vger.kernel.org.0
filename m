Return-Path: <linux-renesas-soc+bounces-27687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFqWMHfJfGnaOgIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27687-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 16:08:39 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D22BBE0E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 16:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BBC2300F5D6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jan 2026 15:08:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6044C31DDB8;
	Fri, 30 Jan 2026 15:08:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB352BE04B
	for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 15:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769785713; cv=none; b=De6xTxud7xLr6xJsu8bmefjA9HkR04XQeBxHZOH+/rbv0LY6R3oSRTWNIimkqJ2/M+CRJpD2HMcO5oblUtZF/S8dY1yTAvpDav48I7sH6edPDrGG2ifL1Ag9Ye4tJTwiVczgiJC1C5jukMrO9XxNSIDUHzfGqGrGCgWSfZwz/iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769785713; c=relaxed/simple;
	bh=ixVqgiNKWlgJlcIKmTWTDEQrvH4ksjQzpSZ+bGRd1qM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pEkOYbrVi/Uh6zh5HsnQWd8Douh9SjjYNcTbfJXxwFln4uMjsndzsw3gRuLe+/Sl5BrspJkz8sMfBoQvbogLM7FhHjKe4KcYiiLtr2ecFFCuzJCYibNXj5QpVVon+5Hdm10MAKf0t8GWx5oFoH3uBNKMjJdUlFU27zLeyv3Mejs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f66.google.com with SMTP id ada2fe7eead31-5f52b3d98cfso666969137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 07:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769785709; x=1770390509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGkx6eA6mbqfFwtrPFINFpkOa49uJ1Td/6euugAjzpQ=;
        b=KefBiinzzSPfg7o1FNjZjr4FexFI+FO9ta4r3z9chOCNfc+94gZm0U+spUG5shXvlN
         wnxN+GN8HDQQekLgGEoJMO+t//2rKiC4wx0Tn0siCHxY1Dv48qW7BCULvblqOaiiAc5X
         O0Z7Chrs2D4VZQoUF3MJyY+rIiIm4LhUxeFXWZ1Alsg2F/XGvthoNAXfGgB7ZfnLfxGY
         EWAcvxNlExnaBYGPhDcBdE6lSEb/RoEOnOlP/Nh8F89b5ayO3bD2NZQHxnqSsW3rr0H0
         hAXPE0GdigTYht8xjoGAkBbFGDL2kchlQ36oAmu1JfJJWvcrD0JaY5HE52TTdup6iTD8
         AfNg==
X-Forwarded-Encrypted: i=1; AJvYcCVcA/PujwxoyltXm2UIIFsfELiZ7+McJYzyO/IBfHApJ8MwRNrP9MVShpZ04Ja6W83B2flgoceYO06IpgMEW22NzA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8YGORGZ7Xb+zP8cOQ+ew3U4XDSHNvzUXU6Yxu5RksS42aJTOh
	thDLttqJmigXhZPIfFNk0gtyJZc2kf0cVFR5nAEC8gz5pvlH1UfiTtqXGgq8cHu0E+c=
X-Gm-Gg: AZuq6aK2UkzMpn2Pd3Ywdtbo/g9b/drr9/ZOyk+jDvevGl1v9MrqFFxzamcLpTQ7lbG
	62a92VDDysgY56tqXovOFDuEsNqXv9l6cwdH09NfOhKbH4J1Iqcjc5KlFbAdFAGuCACQuuW47W0
	2okoTLb4mUbQnO53u43pLOyrFcbYXcvEryHZtz3HsmAr5rqaEcmS2ZzQMZQA+B0QjbGYRVE4RdN
	SN7Q61Ln8LUyFeW/1SM+RgqL8bRM23uvrPUMJL8rDeHnzijLF87+dyxZTvVe8JsTsFbBQBPLPDi
	yuvbqDNwIrPo+ei/8X7+jLIZeK3CzezbJb9CTzfC5vQlN23FTR7A3FqpHPcbSauAxGMmtduC9c0
	m53Moarjr+gmFX8nkEzr/Ia2LjNeNLC6n8cq58CxFcMtdkMyfYcza5ALt7n72hunMKlQs4zRXWN
	WGKsZtTnVZoPw+4lv461xLQtAILfUeu7cjqVHrriYKbV4vA98H
X-Received: by 2002:a05:6102:3053:b0:5f5:37f6:2b4e with SMTP id ada2fe7eead31-5f8e26b8e96mr838465137.40.1769785707462;
        Fri, 30 Jan 2026 07:08:27 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-948723ef5bfsm1994798241.4.2026.01.30.07.08.27
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 07:08:27 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5f52b3d98cfso666949137.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Jan 2026 07:08:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWV+W5S3a/QWffYX7/cQrB1SceZRLCfhi0WT8N0WaUdzVu9h2QTMv9AtX4PwDlGPGd4T0Bu3Fbpmqrdw48oIG7Qkw==@vger.kernel.org
X-Received: by 2002:a05:6102:a4b:b0:5f5:7723:28ee with SMTP id
 ada2fe7eead31-5f8e249d107mr1020998137.11.1769785707020; Fri, 30 Jan 2026
 07:08:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129214130.16067-1-john.madieu.xa@bp.renesas.com>
 <20260129214130.16067-11-john.madieu.xa@bp.renesas.com> <e53b50e2-72dc-47c3-be52-cefa593dd30a@tuxon.dev>
In-Reply-To: <e53b50e2-72dc-47c3-be52-cefa593dd30a@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Jan 2026 16:08:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXiQeMgJhs9QvEcBNeGRf85Fi0w-WODyaGBDrOdZeSgPg@mail.gmail.com>
X-Gm-Features: AZwV_Qjr2oO3yVh97tvIdXRZ_5OwPpjHqcx_MNr99RIUg39FgQPjshWvCCZ7iVo
Message-ID: <CAMuHMdXiQeMgJhs9QvEcBNeGRf85Fi0w-WODyaGBDrOdZeSgPg@mail.gmail.com>
Subject: Re: [PATCH v4 10/15] PCI: rzg3s-host: Explicitly set class code for
 RZ/G3E compatibility
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, claudiu.beznea.uj@bp.renesas.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org, 
	geert+renesas@glider.be, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,glider.be,google.com,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-27687-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60D22BBE0E
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 at 14:55, Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
> On 1/29/26 23:41, John Madieu wrote:
> > Program the class code register explicitly during PCIe configuration
> > initialization. RZ/G3E requires this register to be set, while RZ/G3S
> > has these values as hardware defaults.
> >
> > This configuration is harmless for RZ/G3S where these match the hardware
> > defaults, and necessary for RZ/G3E to properly identify the device as a
> > PCI bridge.
> >
> > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> > --- a/drivers/pci/controller/pcie-rzg3s-host.c
> > +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> > @@ -1054,6 +1054,7 @@ static int rzg3s_pcie_set_max_link_speed(struct rzg3s_pcie_host *host)
> >   static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
> >   {
> >       struct pci_host_bridge *bridge = pci_host_bridge_from_priv(host);
> > +     u32 mask = GENMASK(31, 8);
> >       struct resource_entry *ft;
> >       struct resource *bus;
> >       u8 subordinate_bus;
> > @@ -1077,6 +1078,13 @@ static int rzg3s_pcie_config_init(struct rzg3s_pcie_host *host)
> >       writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00L);
> >       writel_relaxed(0xffffffff, host->pcie + RZG3S_PCI_CFG_BARMSK00U);
> >
> > +     /*
> > +      * Explicitly program class code. RZ/G3E requires this configuration.
> > +      * Harmless for RZ/G3S where this matches the hardware default.
> > +      */
> > +     rzg3s_pcie_update_bits(host->pcie, PCI_CLASS_REVISION, mask,
> > +                            FIELD_PREP(mask, PCI_CLASS_BRIDGE_PCI_NORMAL));
>
> According to kernel test robot report on v1 this throws a compilation warning:

Yeah, in case of a non-const mask, you must use field_prep() instead.

> https://lore.kernel.org/all/202601152104.pV9uMS76-lkp@intel.com/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

