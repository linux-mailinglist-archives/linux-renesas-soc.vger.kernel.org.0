Return-Path: <linux-renesas-soc+bounces-35181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K3Y0HXXqVWonvwAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 09:51:17 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03983752140
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 09:51:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35181-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 050333040DA6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 07:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BA563F20FA;
	Tue, 14 Jul 2026 07:50:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80E163F0AAC
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 07:50:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784015454; cv=none; b=HtrWbLEdnzBYQfMrG6izJ4GmZHJJmYAxrQ3H6vRzjRX6Sa1J61KkFPEzBj0G/s/H6ItIbZc4+W4jnrjoyLXWNSII4Bo1ZNpCFrengUeq4FwDPfW8xue+BAcL38trcSkRNJQO+SYCm3jWUmnjbIisfihJQPbvpDPVAwX2rrFgPUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784015454; c=relaxed/simple;
	bh=iq8Kc5+SBapLqwF6ORCrQ5sCq4FaCemr05ZMk3EEWBE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BqfuStIZZXrRBf2HWGXY5FU8zzwRkilEU3a4QJNVLaIKuzTnb8ZW+2UTO3rd3cLfVeXDJYyE33oyhrlYM4NSwSVneEWt0kSbSiJNNXH5vkRXIRAWSCiOoZ8hGNB3I8biDN4O5zRRBvYauPZ5VjXMn6lV6e9CbG53UmTdgpHkx+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so322994e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 00:50:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784015451; x=1784620251;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yavgJsn42/mg7FbRzuzYhczZGQV3Jism9aLSRgEzMNU=;
        b=IByS392vJPdWs255B4uI+iTiR8kI5oGQcbP0SWRjj405QkGYcVLu1j7jaM/er+IF5I
         0oMBKWdfM4T1ZzaXVX99fj6MgQ6PZHna6UDLlV2Afst6oecJY893mdtZgFalm3bJkNcn
         zydOGIt2uzcn23tuL0sy66UT+musNhyH0wQy8AzTCPPRmjM8780XoKZDMAUa230BYZGP
         Ca789Gcf+HgdemxzcOZ+eMT8PmjB0x8R9mHcpXDaQQp6FaMwklckIZwX3R4j3h81LaZd
         MrFEmvLNsz7iUYqDcxgu1XvjEqSCmyWz3yw4yULrlMcAHwHJA+ygUkwK5uc523FgMyDh
         AnEw==
X-Forwarded-Encrypted: i=1; AHgh+RqSNvcGD3QmPUJFTr5NVJbHQUyfAs1iPCyR2LNhf1+wMVzrAHiVIuveUTe1177QMqFJ0b46mr+Taa7sX+CiyXbUQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjrIoppdfFz5lKaez/WtBVDMT2ss9qm311QdbH+8SKF9YE9jlg
	SCDHCw5atB9dTcvx6F9HzzUubpqGiACJjOaDUkWcMgePyu7UveQVk3RrV5yTy2LuXk0=
X-Gm-Gg: AfdE7ck0RrLp+yS40SAzNuVwOtFsWQ6dUSUUug7akDIOXto6qCK0vwLxsAF1ms51KDH
	9K6AUx1tIrdG2Rcu0Q0jLJ5A74m0nT9+MtrSapWP1uW0iz8S85riCvhzGX0ECG+ICYwdPWODDKq
	3Gch/VfI3gUlfEzuHIh7qYvAO99mBYUG9o+WqOJYPhg7pLw741xVNLPvIz7le+Xhuk63UB/r4HP
	yyTryIV9iZnrs1LAckcLYJPF68ZcnkpD6fVmsaBc8L113rniEKXB7kTRS/5E5OUMVmALPNC6cpR
	A2mzr3YM9Qmm3nZ9VQwa6szQjZXRIJhZZoXVDljXkoXcWETCCKRyLeYB74GFnqkZROuqwePW2zV
	IpUyivxJ8XhijqT79de4jMfzEMK71QXbz9/395mGTEyZkgzDucGB0FxGdnTBvhbiEWHh/oDHytQ
	epwlLZxR6qUTLpm1OWf3cXxaIA6YLTEpjQQU3md3fz3QpY9OWBDK/MzTvxz12U
X-Received: by 2002:a05:6122:6e13:b0:5bf:8c77:e89a with SMTP id 71dfb90a1353d-5bfbf0a9d24mr7009403e0c.2.1784015451528;
        Tue, 14 Jul 2026 00:50:51 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96ed5d4cb01sm8302576241.10.2026.07.14.00.50.50
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 00:50:50 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7383cdb7800so519422137.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 00:50:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqVRWm03+ImgQa7J8EPgXV7VIn/GMLk+ThUD2C+poimRAoEUSTWJ0nUDRKGR0E54ZGkYCxC84JTvCQJEHoQKA9B7g==@vger.kernel.org
X-Received: by 2002:a05:6102:1608:b0:739:15ef:cdfb with SMTP id
 ada2fe7eead31-74533b84395mr8279731137.5.1784015450565; Tue, 14 Jul 2026
 00:50:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710160450.64967-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdUQJ8mzUi0birB5f1KnCMX_QufHTgYB7AW=d3ZoFer+Yg@mail.gmail.com> <1d0d4074-90ca-4b33-9bd3-ff27aa0fd4d4@mailbox.org>
In-Reply-To: <1d0d4074-90ca-4b33-9bd3-ff27aa0fd4d4@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jul 2026 09:50:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWNcbMxONo=PaHqJnD1EErc8AzYLf0MceD+vt9UhmsVfQ@mail.gmail.com>
X-Gm-Features: AUfX_mxwFeauCKqv0YVOv7ObJuQMatx6kqMpuGapev3XA_vc1zBsK6ZaiEApGuY
Message-ID: <CAMuHMdWNcbMxONo=PaHqJnD1EErc8AzYLf0MceD+vt9UhmsVfQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: ironhide: Describe inline ECC carveouts
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35181-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,vger.kernel.org,kernel.org,glider.be,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:linux-arm-kernel@lists.infradead.org,m:stable@vger.kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:magnus.damm@gmail.com,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mailbox.org:email,linux-m68k.org:email,linux-m68k.org:from_mime,glider.be:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03983752140

Hi Marek,

On Tue, 14 Jul 2026 at 01:27, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/13/26 11:11 AM, Geert Uytterhoeven wrote:
> >> +               ecc@1e66660000 {
> >> +                       reg = <0x1e 0x66660000 0x0 0x999a0000>;
> >> +                       no-map;
> >> +               };
> >
> > Given all DB[0-7]FSDRAMECCAREA00 registers on Ironhide contain
> > 0x0000cccc (md.l e98[0-3][7f]450 1), I think the last 3 regions should
> > start at offset 0xcccc0000 instead of 0x66660000, too.
> > As a bonus, we get 4.8 GiB back ;-)
> I asked about that part internally already, and yes, it does take away a
> lot of DRAM. I think it is safer to reserve more DRAM and have a stable
> system than reserve less DRAM and deal with potential stability issues.
> I also think we can always update the reserved memory nodes in the
> future and shrink them to make more DRAM available, once we know that it
> is safe to do so.

Agreed
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-fixes for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

