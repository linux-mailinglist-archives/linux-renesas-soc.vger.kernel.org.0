Return-Path: <linux-renesas-soc+bounces-34944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id msTnG918T2oTiAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 12:50:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5895572FDEE
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Jul 2026 12:50:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34944-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2FED130451A2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Jul 2026 10:31:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B66B3FBB69;
	Thu,  9 Jul 2026 10:31:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151B2406804
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Jul 2026 10:31:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783593109; cv=none; b=VHW0WwLOGYZ5RMgdB0Qg6niUR+GCl7EsSVh38AN5dFjirFyyW1jlpYOccfJVCsyvLynKACvnPGUqegIeOVJGyjooXZmdiXTc665Bul2h6APPADpo8FoTphrV/DRAbdXbv8+AJ8T3OBkZlaaH15iZPTxrLQIdSGdBVdo9JdBn0Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783593109; c=relaxed/simple;
	bh=FxUfzWpCleIQzfr8y72a6t+Wi81Fv5S94Ccqz6vyAuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B21PGCC6zfSaihQelPDfD+u3zB2EcquUgvspMBLt2b+OfVUYWNfFBK/8ue8SMdalfeOUilrf+7sImPf6H+y+v/+uwnTArTzWFPneIde06WZfvflpbV9SXNpK6e34/EbXPK7DHcMaXjictPsQo07iyIoPkvJzbYBj607iHefro+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-9691ba8bc8aso860822241.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 03:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783593107; x=1784197907;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s6cZ9HNvj5euq2IsKqnGtW9n38TCf44UpefkQ/0EfN8=;
        b=Gl+skCKBboT0zM/DsIvhgfUc+YmDhnItZAzq1VmWDy78cfOmrznlIfzbTjtOxyMl8S
         B7K7lhfjYPgWOy9xnYd+9GyokZ5SaFTIz3/omklmJ+5DS4tpyUEv5PWt+M9CyJFUeLkP
         HZgcef2nMQo7E+FDQMu+7NraUeAC8mGj660pURrIpNJJ8GFJSdmZpPFfcyeikwswhS/w
         re8J/7eqoDsg3R778NKOz010hIVhcPkBRMPk6UH88/PkHuH0sBgcFCF7peGxBuQ9/zoe
         Q9EbMTWdcuiVozWcJbe2jz0e/KZu2tvhpQTI8Je3Hh8f+XQCRpUWMCSQJOYPkJ+bt8hB
         f8Xg==
X-Forwarded-Encrypted: i=1; AHgh+Rrx4ZSIBhseHD3EXsEq1uDiFFvdyaLFT1BmqS1/RQzF9zv8NZD5CwKJV+nG01rcbD2nshU/IqBOBiB8/ayxtdBC4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlvb7DE5jsoJJ3QJjElQcK1vHb3Zaa7rZykTIxYE1t/ztPUJkc
	FTIggQyeM9fKvy5dmmevjOvDevx+nJM+SbH00KE8H+40vBAPKEkKpDiLFeROnqG88P8=
X-Gm-Gg: AfdE7ckMsbYzGAS94rMKd+Ra4gJO4/RLNq9+kaerB+JkpBM9szroU/FtOGDxxq4N09M
	pZt18xiN9vrs4SdMtkWSKFaqYMQ9k1eHzbEr1mnFnIYLAxergejdLZ/coU9tesc08h8jlDDms/n
	h/BllBWqZXxXoH66NOOvBUflG+XjpM7VgkHksB1ARjYSLqQRM0HwSkqpMeGiAy0SxwXrohW+DfQ
	t5cEiIEfjaU9KJz86Xi6XYwdiEqCW/1wysTfjK4gcZFLCr5gRbRbT/hwIZu2PTbbgJL2sRc6gXz
	/jiKFEQkM43P8dHZPZBh5pJl3DS9pxxYPy+xQmbhbWftBcymtWfo4I1jdV+xmqSQEiE5EBmcQGn
	GPe4H2DGbkaVa92AD1qijPb4tzMCF9wTFwTfcsX/j+GOhDVENX9PClQy3phyxkaBAAp9DtBBBt2
	J+fdVYFdBJFHh6bHnpQri/LZHm0p3WFJ0DU3E5+YL3XjUaNzazzA==
X-Received: by 2002:a05:6102:4489:b0:726:717a:696f with SMTP id ada2fe7eead31-744e0426b80mr3851774137.25.1783593106944;
        Thu, 09 Jul 2026 03:31:46 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6e38d35sm3342815137.12.2026.07.09.03.31.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:31:44 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-73720e58dafso717422137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Jul 2026 03:31:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqXNbZS2tLhib0kUGLqhvba/oNFHpdFV3IHg4mxr8m2z47KEnH4PVpAVC8AE6FUU9i/sP/a9nzO4TgqbyrK44S8yw==@vger.kernel.org
X-Received: by 2002:a05:6102:94f:b0:738:531e:a43e with SMTP id
 ada2fe7eead31-744e00634cbmr4111626137.7.1783592670751; Thu, 09 Jul 2026
 03:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
 <59725f93-5269-4b0e-8633-48821219877f@mailbox.org>
In-Reply-To: <59725f93-5269-4b0e-8633-48821219877f@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 12:24:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCooODm3YuE1JjZJAc2BeQuD==kWbA+ZzpXRA3fqa0Vg@mail.gmail.com>
X-Gm-Features: AUfX_mzHlNNTYZ42llQz3ksPLOjU-3fWPe_bQZCByAo9mLJpSl17fS0OhOffgPc
Message-ID: <CAMuHMdXCooODm3YuE1JjZJAc2BeQuD==kWbA+ZzpXRA3fqa0Vg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-34944-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:ulfh@kernel.org,m:p.zabel@pengutronix.de,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:devicetree@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email,mailbox.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5895572FDEE

Hi Marek,

On Wed, 8 Jul 2026 at 23:56, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> > Add device nodes for the Module Control (MDLC) blocks on the R-Car X5H
> > (R8A78000) SoC.
> >
> > Complete hardware desciption of all (H)SCIF serial ports, by linking
> > them to an MDLC for power domains and resets.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> [...]
>
> > +             mdlc_ddr7: system-controller@e8380000 {
> > +                     compatible = "renesas,r8a78000-mdlc";
> > +                     reg = <0 0xe8380000 0 0x1000>;
> > +                     #power-domain-cells = <2>;
> > +                     #reset-cells = <1>;
> > +                     bootph-all;
> > +             };
> > +
> > +             mdlc_hscn: system-controller@c9c90000 {
> > +                     compatible = "renesas,r8a78000-mdlc";
> > +                     reg = <0 0xc9c90000 0 0x1000>;
> > +                     #power-domain-cells = <2>;
> > +                     #reset-cells = <1>;
> > +                     bootph-all;
> > +             };
> > +
> > +             mdlc_rt: system-controller@19440000 {
>
> Please keep the list sorted (0x19440000 should be before 0xc9c90000).

These are sorted by instance (Module Number), as per Table 18.1
("Target Module hierarchy of Module Power Gating and Module Standby")
in the documentation.  This order is indeed a bit odd, as it differs
from both alphabetical label order (unlike e.g. hscifN), and numerical
unit address order...

Any guidance?

> > +                     compatible = "renesas,r8a78000-mdlc";
> > +                     reg = <0 0x19440000 0 0x1000>;
> > +                     #power-domain-cells = <2>;
> > +                     #reset-cells = <1>;
> > +                     bootph-all;
> > +             };
> With that fixed:
>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks! ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

