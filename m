Return-Path: <linux-renesas-soc+bounces-33966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uGPlLHaOLGqmSgQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jun 2026 00:55:50 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B920D67CEFD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 13 Jun 2026 00:55:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=IkhcIDmY;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33966-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8B0B13004CAB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 22:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CBC3D4125;
	Fri, 12 Jun 2026 22:55:42 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E16238E8C3
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 22:55:41 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781304942; cv=pass; b=enBiufP1YcDLjxl2mynh7eeXS4rQnEMqllupZpJLJLVXDUSIp9PI2JIf19NuP/eXCRIQ7PQdgIm34O4+hnQaODkQWfsJ1dfubPuXyRwYhL94Ty7n/SawORCE0wnx8Y/QDPzbh/7bf+BpU6stOsahisNl6iDx4LvjWoeLS+9lCe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781304942; c=relaxed/simple;
	bh=RnGRLsaryVYMbmEZaBHC0Tao43UKFOd1sK8lgdxTk3E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ao62cl6eqGhTkZGLHNdC9I//MGb3kSekGI0aJgLYTSXsnaZcg1n3jYGAwCRahBNfsC7RL/HRHI5URu2d3Kg5EcZWRiWTx68pOA/Ljiuy/ByZPd1GJ+lR5zbS7JawLFI0vw27D5cgNV34aDkB1MaTKaTixpzWXXJ6Ljs2454D2lI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkhcIDmY; arc=pass smtp.client-ip=209.85.215.169
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c858b392697so691905a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 15:55:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781304941; cv=none;
        d=google.com; s=arc-20240605;
        b=f4YIMewPbHDSfrQFxIEH1QnGT37Imqyu/ujEuFtehBJA7LYyy7725rFOd+zX2wn8z6
         VzWef2GDEkbwk6jMS3m/6cig5O7NFJx56cqLw4w391dYV5UU0EfT+19xUuX8aHqhEdUm
         X1Z00sC7V8ZA3AUsUXpKAjn5Sjw4tNkuQhpHltmeCYAclk9KQuh5c3EvWk/iEBIjbBCR
         f3JB9qrzWsuQe1g37bXHtTURhdwdMGp/1RoNc+bvqUCBZOPt70qYpiHpqMRSZRWghLfS
         k6YaqzUlkkt0KXcl6EwnFm/jxMJJldR0C9b33I412F4flh/2zzNmEzgbNGzGRuoc3S6A
         1R2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cemL8pO4O+gor5GCDMKqIY/b/nhS0YXr6Sf7gRABVFE=;
        fh=oE+ti/E9m++G/gj8atM95pUzOyTLYTDoXjrKvNgXO1U=;
        b=BpC7aOpReM3WXlYNaYfIQLi+lQkry1TiWl7Q1uGNMjTjga7+Fl2T7rA0JInZ1V31me
         FHSll/Frb0L/G5pgFgSqCxZH8CS4TYTdlDJAVLqWv0L+dz/OS9kbm3FPWZFN9lhC40pS
         Z31Sh51Kh1CsEMeGikwMJRpWBFmhw65/e5jBrdNp2q6DLHqKvlA3GeY35bYomZTX4HfC
         GLre81PKlf0NcreR7IwACg0utNHOXclvSHmPsnkn1CH184JKeMPSs1qkBP7xz65Ev6Kx
         STASZpzXzR9/d9Jo6GURoTDb4UDMZ8thW+kASaIz1b0ZvuoJCPju77rPYyanbghdZZDR
         bx3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781304941; x=1781909741; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cemL8pO4O+gor5GCDMKqIY/b/nhS0YXr6Sf7gRABVFE=;
        b=IkhcIDmYzzUQWGOq1uA0Kdk6Ulaoe7lQv+d1O2oiNIxFq3yoV3mAhSNS29A6QzanmE
         bAcADD8bsl8gDxvn3Ll6m4hB8tG34Pk6qwIPLIMlBLmkHCv2lKMKgyWpb9IvjAiLNyiD
         n4elFCz5AlCptW9jSDOBtJPsmDDIoFrCPfXNQbdZlFt9NxIRYFr/zgYR320BwvrKln6I
         BZw3z++91DyQnsZ4R0WZo6yiWTodDnzn13m2QzBdYkTZ+UDeFmCnO3lQ1No5J75IZthp
         7ohOv0Ddr+Jx43USh+pPc6DyT16CUH9EAew3961zsk4INZqQ8TEXHUOEdIn9LC8rP6VD
         kxIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781304941; x=1781909741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cemL8pO4O+gor5GCDMKqIY/b/nhS0YXr6Sf7gRABVFE=;
        b=srNztY1wIZu0autVXXO2eR1JAk6odfF0VddBtPpwOemb9PPrWEfqIscTgMC0NdcbMn
         Oeuql0q+RWM/7YA28KhzWRGSLYWdh5ZbQEyH+5u6w8jWZDlp9xkrboryQPXjev9m5SH/
         TJCCYCEtmW7mPbi5v7bneT/030Hf4uTBXtZSgeEwWXVEOQjSFwdg2azuhBebaHIIcUPc
         3eO1yl9bxS7G/ij0PmqumBANVYD7+td1JB8xPYUwcny+O30QJaF609/gPQbUYe1QEaj7
         pn02FRzzGm6DtUtot1gcq+VnqOfbj2gnL24hh7Lmyq0Ck/qIFT8uYdhqvaJAzKPNaHbK
         BXcw==
X-Forwarded-Encrypted: i=1; AFNElJ9InLvvBfDLtESr9OKugssCqfWXR1RHl6bUyYlEHBDyzL9NkcJfTtSBi2x+hzDAvY17kNKWzJaCAzMJ74undgd7Og==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXum0p6gxDhp4nvyE+cNtcp2eYG1OqIynaGgqkAP45nyYMWlHU
	I4zV949kuifM8wrNYDaS7qVFdjjh2EtrUNlFubW2wRJZDhklYWGVBB1QygekmPKMO1fADcUdaBi
	4MysmXQ2i5TH2V7IIa/g/nUKIhX3oklE=
X-Gm-Gg: Acq92OFVULDL1U827G2Y7ki9ZfhlIu8tjIvXJHLziKBFp8PX1votEo/DoLDFoDBpQVx
	CnAuGItTQB6wm9E+OoZITFORKqIqo+RVVawSG4Tp/0eg9V+fb1Usmfg7+/jLarWR9SoW8aAbNX8
	8mHm1OYX/fzD9i4Q1H+JqbD8uXXyL2SY4QnpzEORRlzgORoAJ/91LUz8GHOIy14g/JzSZCPb3sz
	o6aHM6X1oN4B+ywpFWaTEJT4PSURdvXHiNhmiNY30tiszqKTBxuDuOSam11r3GYIOtsBedquweT
	O8sILNtRGHQdOUawNxW30za3Ax6hb8OvA/9Mg/X5avw3B+gAI8nE+xzgaOzeGEhukeGtuBNH
X-Received: by 2002:a05:6300:808b:b0:3b7:99af:2d22 with SMTP id
 adf61e73a8af0-3b799af3065mr690013637.19.1781304940769; Fri, 12 Jun 2026
 15:55:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
 <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
 <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
 <CAABR9nG2kHH3=gkd0H+vhGZJtvkHLA7YMpoWt+p+XtdNV+oe=A@mail.gmail.com> <CAMuHMdVQhVQvvnh-aJxw64_h6jOcfaQFk6_Sez-T9aNV30DfRA@mail.gmail.com>
In-Reply-To: <CAMuHMdVQhVQvvnh-aJxw64_h6jOcfaQFk6_Sez-T9aNV30DfRA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 13 Jun 2026 05:55:29 +0700
X-Gm-Features: AVVi8CckQkjD86MDGtEDHBEDRZeUn6MBYP38VksTuYLHBCU5CWlyG_A5TkSZIfE
Message-ID: <CAABR9nFoLrYTUqRr0__n33EZ9Y+YfM=RxAMsx2EFnDWxHa4k3g@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:kuninori.morimoto.gx@renesas.com,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-33966-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[phucducbui@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[renesas.com,kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,vger.kernel.org:from_smtp,3.lr:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B920D67CEFD

Hi

>
> Thanks, confirmed.
> Have a nice weekend!
>

I went through the schematics and summarized the FSIA clock and data
routing below.
This is mostly for future reference, so that anyone investigating this
hardware setup later
can quickly understand the default configuration without having to
revisit the schematics.

In summary, the current hardware connection between FSIA and the
WM8978 codec is
configured as follows:

Master Clock (MCLK)

Pin 11 (MCLK) of the codec is connected to pin 3 of OSC X8, which
provides the 12.288 MHz clock source,
and is also connected to the R8A7740.On the R8A7740 side, there are
two possible routing options:
1 . Pin G3 (FSIACK - Master Clock Input for PORTA) through resistor R250.
     R250 is a 0-ohm resistor and is currently populated.
2. Pin K5 (FSIAOMC - Master Clock Output for PORTA) through resistor R120.
    R120 is a 0-ohm resistor but is currently not populated.

=> With the default hardware configuration, the master clock is
supplied by OSC X8 and FSIA operates in slave mode.

Bit Clock (BCLK)

Pin 8 of the codec is connected to the R8A7740.
On the R8A7740 side, there are two possible routing options:

1. Pin L5 (FSIAIBT - Sound Input Bit Clock, slave) through resistor R123.
     R123 is a 0-ohm resistor and is currently populated.

2. Pin F2 (FSIAOBT - Sound Output Bit Clock, master) through resistor R139.
    R139 is a 0-ohm resistor but is currently not populated.
=> With the default hardware configuration, FSIA operates in slave
mode and receives the bit clock from the codec.

LR Clock (LRCLK)

Pin 7 of the codec is connected to the R8A7740.
On the R8A7740 side, there are two possible routing options:
1. Pin F1 (FSIAILR - Sound Input LR Clock, slave) through resistor R124.
   R124 is a 0-ohm resistor and is currently populated.
2. Pin E2 (FSIAOLR - Sound Output LR Clock, master) through resistor R227.
   R227 is a 0-ohm resistor but is currently not populated.
=> With the default hardware configuration, FSIA operates in slave
mode and receives the LR clock from the codec.

Input Data

Pin 9 (ADCDAT) of the codec is connected to pin H4 (FSIAISLD - Sound
Input Serial Data) of the R8A7740
through the DBGMD/LCDC0/FSIA mux path.

Output Data

Pin 10 (DACDAT) of the codec is connected directly to pin J4 (FSIAOSLD
- Sound Output Serial Data) of the R8A7740.

Conclusion

With the current default hardware configuration:
The WM8978 codec operates as the clock master. FSIA operates as the clock slave.
If we want to test FSIA in master mode, the resistor configuration for
all clock lines must be changed:

1.Master Clock (MCLK)
2.Bit Clock (BCLK)
3.LR Clock (LRCLK)

In other words, all clock routing selections currently connected to
the slave-side pins must be
switched to the corresponding master-side pins.

Best regards,
Phuc

