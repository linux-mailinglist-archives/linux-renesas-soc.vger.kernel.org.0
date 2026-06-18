Return-Path: <linux-renesas-soc+bounces-34190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5WgaF4XGM2qGGAYAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 12:20:53 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F3C69F3E4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 12:20:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="ID4/kqZ8";
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34190-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B596302A6AC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Jun 2026 10:18:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2F5B3E8352;
	Thu, 18 Jun 2026 10:18:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804AE3C5DD4
	for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 10:18:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781777886; cv=pass; b=AeDgQ/DnB4labsidMia8DhicyHJDywEGexPV9R32drMFk7mvcxMJ06UTB5C8Kuk2yqsmjWD0WC8bLt8Cd/WCiPdSNTF/smoGthK6t7HuAoDT+SCp89dYGs/p23CB4gLXtdpnoGbx1kaJ69qNTLXpnA98+JLW3MVUcNla6ZqORd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781777886; c=relaxed/simple;
	bh=d3UI51xhDccu7qrMqr31ZRLTAiml8TgixkPl2atEXVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBqsJ001wKsGXUa3DiV84gFOylDM4MFGuJ7np6OZgS03yNX8glV8IM747fR3xMaP9I/nj1I9THlqFhfknDSQU5tF0wplua7HUo93GB55IOboWYD3vh/l00dZUvBaRpoq6MJt4Sj4x7oro3/j4RbDhmaVR/HzSoDBJ+svjIkMsDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ID4/kqZ8; arc=pass smtp.client-ip=209.85.221.50
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-462bb734793so608509f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 Jun 2026 03:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781777884; cv=none;
        d=google.com; s=arc-20240605;
        b=hhWz1zvCXAXHqLoOKqvNNDvnLRFTE6jKShRxIfF5ka78YfdwUTG1b/rMDTxyDK3SNH
         zPS4uVGigNP3LJdfmPaoFoCM8+zEiciI6Oy/Hs9FUiNSCqkLLlPW+ElLRBDeSU9ZMx+H
         XbuZjmmuBmPjmtTfhblz5hgLdYwCzn0bRJb0KslnnC5/xq4cg1yTXCyXxXAgAkOWWo+A
         oaQqJSUqqFUvcGnsVXjGSnMjqmLsP2gToFLn5zpDfTayUzfY6NvE142/mYYu2MG/kLwP
         q6NO/ZI+AQ2VBKubnphe0ZbFhweAPHgnNBrZrilLWm6h+ZtlEH85/F8Rz4v5DYusRoCp
         Htow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gmshtDYoyJi3az2OMgVxmco1OYRSd0HgGniKLz30q/M=;
        fh=BVDbA6rf/Jb3XMv6llFl6P8dovdlrW5YiGXmZ8z09wQ=;
        b=BCTRYhR3lQ/cg9YYWuMVYTUqA3rDBs+3A2SB0X97TTmrdOdNTC7hiBi9OVK8vI4rPL
         Fwh7lVOBRy3vVL/1NxLtmKFj++3OeK4Rays/hn97aVkY3M+wKQBIFxC7/kLIww/AtBHR
         1isNGF5/ItzqAydAW9sh2S5gBZtDiY8YBUZTwcEGYYolZ46YsSn2iTsnWmBMvTA+9ORO
         c2cEEQNw1V/Ra7DHo9vd+ZcG7XddxmTYOOKlSlB88hivM+yKhAHL4B77plRd0J3Hwss6
         RQJq/oMoC66V0eVYxNWEsTxvI3MPUspsXulRRxLG0CCu78NdOMvWnyz/Yflkbkx6cFPd
         wq9A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781777884; x=1782382684; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmshtDYoyJi3az2OMgVxmco1OYRSd0HgGniKLz30q/M=;
        b=ID4/kqZ8vADaM1lJqaiaYShy3/fKugrn9Q7rHcWSf43WT00yhafJZMc5Ckhd9OMnQW
         VMa5O9snDlmfgAa2HFIE3h6R08cgFcNDz0x0PifG+Rby2aBimayCp9qbbqd0Eg0aLygp
         CYSTu2kVBNriIpIBn2mm6HkOA24sskW3nwQ2XAEXWl7BdcOm+SmqP9mW8nKAVIH9iA5V
         wD6pkZvwj7v9ixyEziF4Kg6ipISsHu5QOd6JAdWJ7SSaQre4mq+pNqIrZ1r8O1ErR4Jp
         MZVWxBpzUJTm0/3h/v12FRgwTPTG0FONamTFanoSCPES+CZBUxY8R/D6omDJqiblGqWn
         sIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781777884; x=1782382684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gmshtDYoyJi3az2OMgVxmco1OYRSd0HgGniKLz30q/M=;
        b=INcKKdq4Pi5CyitCz4fNi4Zit5L2p64mi//VwfrdgPx+QA5Dr2Bx3TNpbq0c97LdSz
         PHb3VjMW7f3MRMRDfSSqywAR3DQMQmfK6l7vhnFTMpfklJVj8EoehcZ4wtAxbjSUXMiQ
         IQA9fFzAaC6//nZIw0TItW0JPfeLDjqvA6p1je/tqS71rA+ICFzajhln3NCo10BLP/ga
         psSNb+cV4+gV0npnJwx/zJ8uH5t6bwvnXiccPuB7Tlq9B5q5Qfu8MzvEU6hDmuLwleY9
         Nwf9sTH/HncQNY8ahrO0R7szbDez2IhZ4+ebXWQHAy87sa8U+2kA56Uof/nJWIdxQ34F
         T1ww==
X-Forwarded-Encrypted: i=1; AFNElJ9ZjfxoOHGB2B8sfBSpRDQB7EEmu0NfyR9I1wDMGH25CfTckmqLb4+LTy+f+AIZ9qGWLz16+JN94CmdMmSxd4vhyg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvQXTVFmWsN9cWR7um/7GeXzNlWLGbM3H3e6wSdYMU71KB6O66
	ilXsv01DEjcBfA737JlMp9NfwW909nYXOGfjSLluug9FRJTke5lS8e7crAFu/OviRenZ9mbYkA9
	VryGdB+BYngBHZaW6Ii9WqV7tHBN0sVU=
X-Gm-Gg: AfdE7cmGozsZ+QhOIcHcYA5VmlEEscsFm372gWTf5SUbv6vdsTzSYJxMyq2EgP052sc
	kGvV8Tqo7V4Zt5gdGY7QYgEQPG/3QCaWqAffWXw5gyvZPIyJdHVAHy4Z0bhfQlGtgtpOs7apJeH
	53NOLbyxWmsbXIvET+qjWx/x0EkS96xsNojQn9B1jsUUYqiJxq9bJiykGR3vGuYMpEv8X1NA3mk
	2xvPzcVu5yYpCuFsaeEjNMB9yLQQPcvytmANowWz3hDfnqj5g82I+2mVUoWs5ilGBvdisbFfYWH
	ru1ZtEEkhEA7SiKRCYr/H1eS6n/0re1IqEIyoyrdL8tNaabkvPfPpXN/aJxXrKFMvz7U6xVGI8r
	pRuxoDAIoFVWv28IvfsuKRrt9UA==
X-Received: by 2002:a05:600c:1395:b0:490:e5c1:b8b9 with SMTP id
 5b1f17b1804b1-4923a8c402emr24573155e9.0.1781777883721; Thu, 18 Jun 2026
 03:18:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615154805.1619693-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260615154805.1619693-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <ajJvn2YkaspTYx9M@shikoro>
In-Reply-To: <ajJvn2YkaspTYx9M@shikoro>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 18 Jun 2026 11:17:37 +0100
X-Gm-Features: AVVi8CejmAUnxV28-Nv-iRPPqNanTzOmym7-UH_9-4KCncFioQAXLRdjmh4wMqM
Message-ID: <CA+V-a8uKW6QSOjhW0NW3pp4d0+mVh19rYUKKexqCjdD-WThNDQ@mail.gmail.com>
Subject: Re: [PATCH 04/12] rtc: Kconfig: Broaden RTC_DRV_RZN1 dependency to ARCH_RENESAS
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34190-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:miquel.raynal@bootlin.com,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-rtc@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:wsa@sang-engineering.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[bootlin.com,kernel.org,glider.be,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8F3C69F3E4

Hi Wolfram,

Thank you for the review.

On Wed, Jun 17, 2026 at 10:57=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > -     depends on ARCH_RZN1 || COMPILE_TEST
> > +     depends on ARCH_RENESAS || COMPILE_TEST
>
> Yes, this helps X5H also :)
>
> > -       If you say yes here you get support for the Renesas RZ/N1 RTC.
> > +       If you say yes here you get support for the RTC found on Renesa=
s RZ/N1,
> > +       RZ/N2H, and RZ/T2H SoCs.
>
> Such lists are easy to get stale IMHO. What about "initially found on
> Renesas RZ/N1 SoCs."?
>
Ok, I will update it as above.

Cheers,
Prabhakar

