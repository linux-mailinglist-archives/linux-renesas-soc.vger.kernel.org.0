Return-Path: <linux-renesas-soc+bounces-33425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F3aWE9nPHmqbVQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 14:43:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 879A162E1E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 02 Jun 2026 14:43:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 653C430EA8D6
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jun 2026 12:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9EE730E0F5;
	Tue,  2 Jun 2026 12:35:35 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6574A33F59F
	for <linux-renesas-soc@vger.kernel.org>; Tue,  2 Jun 2026 12:35:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780403735; cv=none; b=uPJ2T1snEdwFarL6NgzJalQFqALvuYPhoBEHaRIKw+u5uiLrThy3sJwhUwIUiIcM/yIugiZTVnU892rxG2AhYJydxm4NqAuwO3fzx50jXHJPjX5X38ekztrlQBEx7lf/USEK/4U9rYpfrzguFMxrg+uXHqs9ksqEweOi0+MTEgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780403735; c=relaxed/simple;
	bh=YaiW5lMEZqjxEjR7yy3o2vTs2wWB729kmgqYprD1MOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vx9wnruk5c1rCwiB5rP6ojNUC2IlpGDLA3dhBYn/HgYmesfQyKFv2Yhl5b2yr90BZoTetb2YAnhdSJFX2oWJeria65NxvA4z4VaGKtGxZNjgyQOVJLkFp3aYg4mMwr76q9Hlz2abLtHUAnaKRsUfYhzTVf/T16BGDjdFawZdjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-68c08bfe5afso3144127a12.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 05:35:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780403733; x=1781008533;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIEBsIlRVNbhvgaksiRriTZDjJMik3x/MVOWGk+MF4I=;
        b=Zths7SSYZLd2rqGhHmbMMvB0jy/iv/2kMrGmwtQFqf3w/e6k5BoxqYxoDloKntxQpJ
         yUyPVHqbPJvFqS2x7w5cNhXvpleCfCoPBiLkQnXJiF8R9Ily0cYszPiEjAht4TexV1xY
         c5tiHa3RM4pnrzDDDqbrDJhw3tYrR64DIoy6jEttGPT7labupCpU/YIcveSaokyiX+EI
         rLkLG78c8c8+O7WKLF9NNYUEhEXDpNQR9Xae0QTQh3t34ScOKHRSY8TrjHgKpYB8C311
         yUT+rgosctcDzgktMdA8Pe24RjbH/8uNOfIu1yRHgU3J0KE7ppA6hhyo+8P94vSyJXoh
         Bi/A==
X-Forwarded-Encrypted: i=1; AFNElJ9zeFHeF204dw194DWojqeKRrFxtHFjtWX/0mTZC/qoJqCjJltD6D343D9EbDueNHAAu1HCmUtV5Ku4XumLvFdO+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyN7SAxPr9PquTM2+k0Wn1ZT8Oc4gytWHrLwJxzMiDJKxTi7E2l
	5rLhL5YFQH7MS2hnovlFTsKylGv439/TYFxd9iSmVnyPeUlUJbwsOV4jisXrEclqd4A=
X-Gm-Gg: Acq92OFcSJEMlTEKAOXep26vmBm3Rip+EJGnJYGjoKe0N4laj103JVXADKHXiPpHxD7
	YF18AAxw54DnLfbf6Np7flk01AFV96Fkmdgfn7h0E/G3sAsKJ5E6aJcjZIU+0nHkeIdB3/aOnI5
	EpqhbT9JyTgkqy1/2vggwX5CIPyl/lSXLkQG5HhOMNXU4g2hbbnNcjKBgm6cWX2sBp2Yr8BOORZ
	+8qIM8ita6/Gi4QpMdm23HU+I+og4a3iKLW18bi72+tdG67F4O+cTwDRM9t/dFF/5Mfb6YPmeQf
	Z2seKOXvi7HiT32LsNvOrCALzCDz3afVwcr1pE3snZem3BlEvE2vMK8rt8GMhrFYQbtuc4ZfTHS
	pQ0x0QuwNl8X700WIIqdrPFd+iHe6h07iZ7Tr2u1mrzCbZdeY7m9EvLmynH/HrAcQ0gxm3eDjvQ
	QplxUTCqeI45NOU9xiMwjAposPXXuiqzbQ+s85u/r2s0K8DbVtfUAcJd8v1DNYDdaLhsw/ea8=
X-Received: by 2002:a05:6402:5011:b0:66e:abe5:ab22 with SMTP id 4fb4d7f45d1cf-68c8910d123mr7399036a12.5.1780403732830;
        Tue, 02 Jun 2026 05:35:32 -0700 (PDT)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68ceb867d22sm3325210a12.27.2026.06.02.05.35.29
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 05:35:31 -0700 (PDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-687e7edaafeso18845886a12.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jun 2026 05:35:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/wahZFo8HgUITcWBklmYRAk9yA/xJMV830pyajHh0g0EWmNUmCafQF7lnlULBxqzbjS0VCTMTqwD3hOZIpRZTSfw==@vger.kernel.org
X-Received: by 2002:a05:6402:40c5:b0:68a:ac5e:f4ba with SMTP id
 4fb4d7f45d1cf-68c8baac8e5mr8113498a12.24.1780403728827; Tue, 02 Jun 2026
 05:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529125442.327290-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260529125442.327290-1-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jun 2026 14:35:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWF7HX2aaghtk292kD-qPu=LyTf+d6+fSjp3zE5EKsVxw@mail.gmail.com>
X-Gm-Features: AVHnY4JwHEvdZWAFqTBrT6yPywYB47cw10kf195rdpeOG1z1IQSlnWrhgDZ5Pis
Message-ID: <CAMuHMdWF7HX2aaghtk292kD-qPu=LyTf+d6+fSjp3zE5EKsVxw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: r9a08g046l48-smarc: Enable
 rsci{1,2,3} nodes
To: Biju <biju.das.au@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,bp.renesas.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33425-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.au@gmail.com,m:magnus.damm@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:biju.das.jz@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:bijudasau@gmail.com,m:magnusdamm@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,209.85.208.42:received,209.85.208.41:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,vger.kernel.org:from_smtp,renesas.com:email,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 879A162E1E7

On Fri, 29 May 2026 at 14:54, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Enable rsci{1,2,3} device nodes for the RZ/G3L SMARC EVK.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * Dropped SW_SER0_PMOD macro check in rsci2 as it is always available
>    for use.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.3.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

