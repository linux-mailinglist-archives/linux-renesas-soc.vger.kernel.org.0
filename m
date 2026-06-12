Return-Path: <linux-renesas-soc+bounces-33919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NJ/aGAjzK2qPIQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 13:52:40 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3489679213
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 13:52:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33919-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CEE44349B6B7
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 11:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 809E52E7BB6;
	Fri, 12 Jun 2026 11:45:55 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9B53E8665
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 11:45:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781264755; cv=none; b=k5mz+4xyE2bK0qa3Gu3+/tHmodkCTME696IBN3pgLoQvhG7AhSF/XZ+BzDe71p4XQU9WcAPVsQ8y76G1Q3VJBjTTczQfMQZziU4WFLXk3gojqAsGUFAu/1NLlUSjuzzvD1NsHbcbuoO9JM7K2O855X6T554xx7qOsalFDj/DeBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781264755; c=relaxed/simple;
	bh=oGUJQrXok0oefnVapsoFTOkDTq4rMzW8cVDmbrT2fZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4E3wNpru9H0g9wuTxibqbkr3SDwT4bZNAC+ZESXrnAYDyBHI8upwaqn6iRmtHyv1zmVmC/Kqc6jLEMUUqqfGmxYMyZy0LDmTDlHUnZvBrSjxZ/mPYbnOex5JAMqeOdK+BBbR/rN9xbSDusdro6TsCaNxoyl4L2ro/1NaouaeDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-961556c15ceso238475241.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 04:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781264753; x=1781869553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZNp4g5Gvhs1Bf1iVWmOM1OJf0ux2oAi1myswnuPAOFE=;
        b=LATERBctzZsseUEHfCNe2+cFn/vk7/NDOfDkrSsOfTVqwbaMko0SqoqylbkYVE6gFy
         b9dSswOj4YfYeCeGcCAHxsx8VfkyCdqFIEoD3CdUtcy2wr9i5ESWMO3Ee/6VdaKlTX7m
         A0Ms2G4+1ic6SFd7L28v8VNviGGvlGDTJC+c92tQN/E2GqKyvCHLv2/4VehaLlSakL82
         e/IXC0oSUeOy8XNUqarfdq8Ldu98/oJEJXucL1XrmNmStjDBe6Pxf7fxSFN8e+ZQcpiH
         7VVj8rpEuSTlslZOrsxu9MKMAYtxt4Fygy/BKv3lAbDLqKKJKxU4VJg4Bbr6e/tabGSf
         PJjQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wXJ6CyfogCvewTboO3d71JE/jHGXI67eEymvKn5hRBgjLBJeNQ+4f0OfIKPKCoBEWMbGC0IkGo1vKl6jM454MYg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/RCp2vCNw/wYm52+opdYi9T12idlfugrhx+QNWzox8zBSA3/O
	gByJKifueYdW3FxlP5DopU/PgzWOAuYnRKBDGfglSCH2FMiJYDJ/DReRbMy5ly2R
X-Gm-Gg: Acq92OGIo42BbjzQp25sUJGM19JpXgf7fBlhU1pN0V9lGiHG+tsGAEIsi1XkRpBIcax
	uhwvQtYNtb77j5Nc+fFBiIAOykq+zSPKuoI3f8DbVBqMydgrPjzI5PXKV+sLYjV6y27F6Xd3j7t
	uXKBNFq+QrPcVL0OCdnky2BK674KbdsbNrU+frHx7SAHKlUK3SJLX3rD4enZuOuwnK5VD2pZCBS
	kSaEijiSEmmJvFcFlfLRrnoEHMDABh11d0+7i0ijPT+wtFkZph6E4GSQSKKniUw9+gcFLt4YeFN
	qalra5b5CcCirDLTE8b+/sT88ZI6r6kcOHu88WN7jra4773QEz2o3vZttx7FKlgluUHEC5FBVUC
	8tRIVMZ7ZSb7QVC7frQXMZ0QlA6ibKOgAyOYIXxDDuXpm7JiEB/pSAdDnPXWbOhsLS9EPsjci6P
	jqqO8R06unfwh6EqR7M5JgX/gqA4yOReLiaxVhBEQqGpY92L1Qr70NSS7RtLa48XM6
X-Received: by 2002:a05:6102:4412:b0:634:a573:c097 with SMTP id ada2fe7eead31-71e88c554d2mr849130137.13.1781264752737;
        Fri, 12 Jun 2026 04:45:52 -0700 (PDT)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-71e8889b1desm1094676137.6.2026.06.12.04.45.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 04:45:51 -0700 (PDT)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-59ebde7d704so254029e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 04:45:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/QThj2MAgKoDQ3iAWfRXaBEnRf+HtpwbFaxMxaceXT0d1xsvwAR3W1iXuDeiBAim+Y4LJ1r24MPK/oV3EsYLVMUw==@vger.kernel.org
X-Received: by 2002:a05:6122:6606:b0:5a2:4391:1730 with SMTP id
 71dfb90a1353d-5bb6c0dd1abmr737507e0c.7.1781264750451; Fri, 12 Jun 2026
 04:45:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com> <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
In-Reply-To: <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 13:45:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
X-Gm-Features: AVVi8CfnD-TjdQCjcklRKqlAWA3VoQ7yU75YfPEvom1NYLk1a4nkIC9X_AZgb2s
Message-ID: <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33919-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:phucduc.bui@gmail.com,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phucducbui@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3489679213

Hi Phuc,

On Fri, 12 Jun 2026 at 13:08, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > I have one more general question.
> > arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts configures
> > audio for FSI (fsia_pins), but does not fill in a clock-frequency
> > in fsiack_clk.  Instead, it fills in 12.288 MHz in fsibck_clk, while
> > the schematics call it FSIACK.
> > Apparently the FSIACK pin is shared with FSIBCK on R-Mobile A1, so
> > which function is used depends on pin control.  However, the DTS does
> > not perform any pin configuration for this pin?
>
> I checked the schematic in more detail.
> On sheet 12 (FSIA section), the FSIACK signal is connected to the
> WM8978 MCLK pin (pin 11).
> It is also connected to the X8 oscillator output (pin 3) through R121.
> By default, the board populates R120 (0 ohm), which routes the signal
> to R8A7740 pin K5 (FSIAOMC).
> If R120 is removed and R250 is populated instead, the signal is routed
> to pin G3 (FSIACK).

According to my schematics (RevA), R120 is not populated, but R250 is.
So the 12.288 MHz clock is fed to both the FSIACK-pin of R-Mobile A1,
and the MCLK-pin of the WM8978 codec.
Which revision of the schematics and board do you have?

> From my understanding, the default resistor configuration places FSIA
> in slave mode.
> In this configuration, FSIA receives BCLK and LRCLK from the WM8978,
> while the codec receives the 12.288 MHz MCLK from oscillator X8.
>
> This matches the current DTS configuration:
>
> simple-audio-card,codec {
>           sound-dai = <&wm8978>;
>           bitclock-master;
>           frame-master;
>           system-clock-frequency = <12288000>;
> };
>
> Therefore, I do not think it is necessary to provide a 12.288 MHz
> frequency for fsiack_clk (xcka) in the current configuration.
> If the hardware were reconfigured to operate FSIA in master mode, that
> might need to be revisited.
>
> I have considered testing the alternative resistor configuration
> (removing R120 and populating R250)
> to switch FSIA into master mode, but I have not done so due to the
> risk of damaging the board.

I haven't located R120 and R250 yet, so I don't know which
configuration my board has.

> As for the relationship between FSIACK and FSIBCK, I am not sure.
> The schematic I have does not appear to describe FSIB at all.
> The HDMI section only documents video signals and does not mention audio,
> so I do not have enough information to determine whether FSIACK and
> FSIBCK share the same pin on this board.

That information is found in the R-Mobile A1 docs (PORT11):

Table 1.3 Pin Assignment (505-Pin BGA Package)
    Ball No. / Pin Name / Multiplexed Pin Functions / GPIO
    G3 / FSIACK / FSIACK/FSIBCK / PORT11

Table 54.1 List of Multiplexed Pins
    Pin Name / Function 0 / Function 1 / Function 2
    FSIACK / PORT11 / FSIACK / FSIBCK

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

