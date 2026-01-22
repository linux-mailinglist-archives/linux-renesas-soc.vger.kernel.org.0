Return-Path: <linux-renesas-soc+bounces-27307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMDMHrRWcmkpiwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-27307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 17:56:20 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C20CF6A75F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 17:56:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 54F193086536
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Jan 2026 16:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C1AF3BE486;
	Thu, 22 Jan 2026 16:29:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B803A5C25
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 16:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769099386; cv=none; b=MpXNWt72tAHRfAShXBt2CgS4Gcj6sxO2yTUAuTmcPNLsPltEI3XfMr8l8tSxCYgf2yRhexi82rgHktMu25ZIus4DSEwIJvfwgBZ7NKEPfg8NClElXRcA4HAro1letxe4gCp+P5KouGfUxd49BP+StCadlgT9lUZmcJoD+jEPu10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769099386; c=relaxed/simple;
	bh=KsGWBtdWAcOuouRcNgHYXyDSxWrjlkEILO0o03DoYzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tHYQdRAPGMQ6izAtoxlAnJrclKNvq5THd81b58X5iE2vPvuWPYRPJz69FgKkwjln3SLF8wiY6wlLPO6OrvBzodBUygJwEKitSobFU7o7GelxHUXS8aDICXAk8EmwDs62sT6RvAUCUGyQGTyWYz1YE9GRyllwRoGhoaWJZ1DPliE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5663601fe8bso523932e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 08:29:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769099375; x=1769704175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1WfrbwhdDFpnMP8QjUxFisYdCm9ShlmwjTsosQ6yyM=;
        b=Fe6TDZ5F3zzvma6BBH3C2LJV/fzK5aLzVuPNxWDglMcAMrJRRueTriuNrN3U0JhxFN
         nTatI/i842bljHa1SZ6kwgOo9El/iWNlZj8u9iIyVB3kDfOY5v32tVCaUTAplJpEKFk6
         0DP3aLK/Z11Eo3dEBiP9w1cx1hx5NSkUjNFn6IWL1f0Qw/v6oDpqwHHYnkt9A5nLwPmC
         M/OZBG+lJ7ip+lfXtzzC18fpfQI+kbk33keUYb8UNZxB/h9wGICyDFxmiUdUXXDgBTg3
         KNtIqyxZblmyGQs3QNfOTuq+qHx8BApDTzppDouKwugIkALIY87GOjc2NW3pjaLEbDli
         HMaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxtUDQy39l+EOb+rUtlWm7oVGzZaNX9bU4aw/G6I2Oi5yytHGyw9MD9s2hHpJ3waonKv2PDjt1eynbK4tIpzlOlw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzks+Ra+Qz0P5kfjEpAQ6lxx0zlDfMmxPLIqxGZSyuAY2Hqc5aU
	8M/UP3lm/lpyBl8ayqmVNsXkl2jeVl5gEdta2DNISZ/Oxm0S+3sn0tV41QhuLM2f
X-Gm-Gg: AZuq6aJaQiQssejFnrqcIvjmmYHKJWQ1Za5D87mlWdunzx7AAnDrSEMVwHcoiZX4Col
	Ovld24HC9CNfXYOTAuXNpc95aERTGcZBwBs/QM+vovKDJfRzvQCu+Va7kGxyGZUJhIDNvsWbb1C
	Jt70xyepajfDlWrB56Jrlh5aPyxFQicMb+zvsqDfHlxx5APO6bY+815wol6BfQL9MUhCAOJsqNF
	5CCHoEc7oXii0fzotNw4kr8ibzEzhqDRM8HkEOhpKkBdmh9NcWu8HPftvvvqRMNNw42YuYVYHG3
	Ov6EaVIzkqX+2n4t+GLLKdcX4upyhRePMd0TrJZ5DppxrECqIee7IKGwv7/0f90QAsfTelB6WsY
	/IcACN44/M3ffMuKjOkOpc8DuozGwBhijk9c64O/WhoVPbH4BX9EqfakAS/7V+z4cor35PFLI6m
	xKqKzGMt+MNju74YlRDiRshzoyX5uZsNbk4pGxUdS5l3QKeGoBTyruCpex9x0=
X-Received: by 2002:a05:6122:1350:b0:563:5e42:4731 with SMTP id 71dfb90a1353d-5663eb836d5mr62627e0c.15.1769099374872;
        Thu, 22 Jan 2026 08:29:34 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com. [209.85.222.46])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56628c994easm561436e0c.20.2026.01.22.08.29.33
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 08:29:33 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-941063da73eso537480241.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Jan 2026 08:29:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXhmS0s7pYy41FqZxwpAznNMUEMcB1oJx+5WQGDfAoJqraZXJAVkASYQ2XGmMt5bvt0WHu3sX0janHyCgBguwmVvQ==@vger.kernel.org
X-Received: by 2002:a05:6102:c88:b0:5db:25b5:9b5e with SMTP id
 ada2fe7eead31-5f54bc6f96bmr75281137.22.1769099373234; Thu, 22 Jan 2026
 08:29:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-4-john.madieu.xa@bp.renesas.com> <CAMuHMdXAAUe_0kboQ9C0AMPn5re-1kCagecp1fMCGramDpXGRA@mail.gmail.com>
 <TY6PR01MB17377AE5807504FFB6594471AFF89A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <TY6PR01MB1737738E302D0BA716AAA2650FF97A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB1737738E302D0BA716AAA2650FF97A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Jan 2026 17:29:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXk6A2-isnLQCgrjjWRX=pYKbUvVz-nfDwy72i1qo1-rA@mail.gmail.com>
X-Gm-Features: AZwV_QhbFTwa7jTSNEghn2CR26nFA8B0X7gABEL6FIix2T_XBXqsyJgYshZo110
Message-ID: <CAMuHMdXk6A2-isnLQCgrjjWRX=pYKbUvVz-nfDwy72i1qo1-rA@mail.gmail.com>
Subject: Re: [PATCH 03/16] clk: renesas: rzv2h-cpg: Add support for init_off clocks
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"mani@kernel.org" <mani@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "magnus.damm" <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,kernel.org,google.com,gmail.com,vger.kernel.org];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-27307-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,glider.be:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: C20CF6A75F
X-Rspamd-Action: no action

Hi John,

On Thu, 22 Jan 2026 at 17:21, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: John Madieu
> > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > On Wed, 14 Jan 2026 at 16:36, John Madieu
> > > <john.madieu.xa@bp.renesas.com>
> > > wrote:
> > > > Some peripherals may be left enabled by the bootloader but should be
> > > > explicitly disabled by the kernel to ensure a known initial state.
> > > > This is particularly important for PCIe which requires proper
> > > > initialization sequencing.
> > > >
> > > > Add new macros DEF_MOD_INIT_OFF() to declare module clocks that
> > > > should be turned off during CPG probe if found in the opposite state.
> > > >
> > > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
> > >
> > > Thanks for your patch!
> > >
> > > LGTM, so
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > However, I am still wondering if there are any possible bad side
> > > effects of disabling the PCIe clocks, e.g. when PCIe is in use
> > > (network card, SATA card, ...)?
> >
> > I'll test and let you know.
>
> I finally did the test, disabling the PCIe clocks while a WiFi module
> connected was performing pings. System got stuck, unusable until next
> reboot.
>
> Was that the kind of test you were expecting or did you have a specific
> scenario you can share.

Not really. I was thinking about a scenario where the bootloader would
configure and use the PCIe device, then transfer control to Linux.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

