Return-Path: <linux-renesas-soc+bounces-33938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q6U+EK8YLGpPLQQAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:33:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D32FF67A34A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 16:33:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33938-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D26E301E12C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jun 2026 14:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E6335E1C3;
	Fri, 12 Jun 2026 14:31:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA56238A714
	for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 14:31:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274709; cv=none; b=UzGj3Qc94eAtV+pOBsw1r8BX4P+iBB2GH8Ixl5606BqU/i8yymqWCCqGodYSKOZpiIpt/X4b+fAUa3EI7V39PtSbCG0WUtr5Iln3DLi8yVu/nS3+bMGDw/DH+DIrLcTDe8LjtjVGnDJkpDWGvN8pSWUg0G9lRXSRQYegZeBqoTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274709; c=relaxed/simple;
	bh=hA3EQ6NGh82+AwwxLF9pQfeChp6zhM8Sbh2F0J21T9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nvx1c5vM3a9Q1XTwh895HePhqPAferUvca+24TyaLutjOL0/+xwYZVskXTfSkwbwl+nMKZuLlqzJwkipqg/pg+iu8vO4opC4U8zpxUmpaR3JXDplvFra1kpmQeIA7HC3bJCgtzjP8h9jNMJXIjc4qY0SB7W3R4/Gg+0NcVp/zw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.43
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6924a68e3f3so1841008a12.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274706; x=1781879506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ctV4WQ6XNHzaDQh531DnVbwuxtW2dAJDIPTs6QoUPY=;
        b=dGiLmMz5w7JIxrK7pLNUpyrv6yjeUjN6sd6zUKIbY6ZHXQlFtL1KmNqvnEDSvu6Rn6
         s8GIvbNouWiN7fo3lD39QvN//qEG2mo3Lnw65BdiWvkWwX6wWjW4uWvwLfmFNGomlSfl
         MFJ/i5PdpGwctHCEhBtYzxtrHMF0GfSJFtmfqJOIzQ0ahQHCVrpzCQzKZD/db266xkcW
         w2WU02dwprhwV/i9CfsKczuc1STZrCANSoe93/F0kWG8VHMQ3tFc8f4Bg2BtYC8ygJ9J
         GJHN5cmisOyLQhkcARP4wBZVnSv8wOlJU2Lk+7tal0WTnzGquFzoS3s92HjNiYOrH1hP
         u89A==
X-Forwarded-Encrypted: i=1; AFNElJ8vnM9kyyS3fppgFE06jFJR+XSD5DAvKpP0ztdK4wkQocMxKy7MHlGCOhXRT/CkjnRYngsoCXt5nH7RhKUmwOX5aQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwriDefncdL4i6Xh/X/R7p+VCjf8Me7Sk9ds8lNEImb15WrezXZ
	7fMhx9y5hHnL1n3Jgazaq7p7u0t8VRgKCZ5GjN7XupybkcSkDDg4X8wSQaiAF8km6nk=
X-Gm-Gg: Acq92OGRHJganQF0lP51b2nzy4MYyc9WkEJE/MGlVAlFuUAaWp+2fYpREjR5OWaSF89
	r7ntRtT6jzGg77fsDel38XlnseK8udYN8MwC9wiE8g7CfNMtE/hb3xJmTeFWdZrXVg+Bgkro8De
	PBcjeE+LR2zkLJIbZk9oF5OZ2wl96mTx8dkweiF1h3YBjef2rvf+Nfb1qf81NtKrmZM1DMygORN
	OyUnujJQjnWHo/piqVKIuKJDFwj5qK1luyVAhw2/wtqRYWChMzL+FhjHv7cop+72d0CQ9nlVlb4
	RhoSXMmqznw4NFU8bLsFDZutuxZlJo2a9IFpiA37bA/RDoGsr/MNMdnf85+Tg0Pzu0CwMyG/5yk
	gFjevXR7orrbnkXNMJN/9mnmUZ/BYxtvLGJZvyYnWl6I5zY+6qYowtcUgWdXexR9e+HxMQmgEjv
	3ZW6Io2Jh0hTHOLFmItfD0TfYzimpo9hzupU1KUAHnvTRW6hd45tNP0GVcvZum
X-Received: by 2002:a17:906:cc4e:b0:bec:2a21:785d with SMTP id a640c23a62f3a-bfe2bfa08c0mr103725566b.46.1781274705919;
        Fri, 12 Jun 2026 07:31:45 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfe5116f409sm75287066b.23.2026.06.12.07.31.44
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 07:31:44 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-68f36e1663cso1771223a12.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 12 Jun 2026 07:31:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+r1I6TVS/8XJlb7JaFfY1iSGK2NJbuJss2RKgnlZ5hzdiDv8mOnUX6EgvGnE5glIRWG7FaTsorLt47s2b1cqVgSw==@vger.kernel.org
X-Received: by 2002:a05:6402:3213:b0:691:afc9:f59c with SMTP id
 4fb4d7f45d1cf-693784eb0abmr1551827a12.1.1781274704600; Fri, 12 Jun 2026
 07:31:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
 <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
 <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com> <CAABR9nG2kHH3=gkd0H+vhGZJtvkHLA7YMpoWt+p+XtdNV+oe=A@mail.gmail.com>
In-Reply-To: <CAABR9nG2kHH3=gkd0H+vhGZJtvkHLA7YMpoWt+p+XtdNV+oe=A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jun 2026 16:31:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVQhVQvvnh-aJxw64_h6jOcfaQFk6_Sez-T9aNV30DfRA@mail.gmail.com>
X-Gm-Features: AVVi8CdbLq3XktR5SNY6UI5yuB8PMlJ_y93ZpORIxTU_5bqPrPMevfVX5_O9YCY
Message-ID: <CAMuHMdVQhVQvvnh-aJxw64_h6jOcfaQFk6_Sez-T9aNV30DfRA@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33938-lists,linux-renesas-soc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D32FF67A34A

Hi Phuc,

On Fri, 12 Jun 2026 at 14:54, Bui Duc Phuc <phucduc.bui@gmail.com> wrote:
> > According to my schematics (RevA), R120 is not populated, but R250 is.
> > So the 12.288 MHz clock is fed to both the FSIACK-pin of R-Mobile A1,
> > and the MCLK-pin of the WM8978 codec.
> > Which revision of the schematics and board do you have?
> >
>
> Oh, sorry, I misread it. You're right, mine is also Rev A, and R120 is
> not populated, but R250 is.
>
> > I haven't located R120 and R250 yet, so I don't know which
> > configuration my board has.
>
> Please flip the board over; these resistors are located on the bottom
> side of the board rather than the top.

Thanks, confirmed.
Have a nice weekend!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

