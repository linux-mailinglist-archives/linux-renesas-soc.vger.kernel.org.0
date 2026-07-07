Return-Path: <linux-renesas-soc+bounces-34809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YIK1Ev0ETWpdtgEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 15:54:05 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E5E71C288
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 07 Jul 2026 15:54:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NPCuvKS9;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34809-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EEB33311E37C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 Jul 2026 13:48:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 006A0408606;
	Tue,  7 Jul 2026 13:48:45 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB67B3A168C
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 13:48:43 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783432124; cv=none; b=UIJ2upYElCfyEwcSyt2dGXcot1gyzDmv8OseCiWYSlhcGFZ4WZEFnW1Vucos7PmERP476oC/D3W60dA8dtedUl0mT43qNOrfoJfrpRNkJTeWt7w22CXp24LSj7/kg952PzVssmb6+64zz9cVGpxIDKdlivzZJOTJkxRvJgSqCSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783432124; c=relaxed/simple;
	bh=1Yo7u0z6k8U7Mbjer68rrWV0r8Sh5LFdbkY5Y5c3Jrw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTsLN//o70QXQ3lBGRY1avAo2AdiIxi0Vd5YwRxn2Bm3d/NBjsNyzCYDxrHj6il+GHodtXYr512ZlbtDqJiTlXT7pbFFRcAwVlY63fgH3PKO/Ujr56UFEVxRca3QFcHl8moRPWEcp5FwIYn9g/3AXNXG+Sko3BbIj25ciDVOi2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPCuvKS9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB701F00ADE
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783432123;
	bh=1Yo7u0z6k8U7Mbjer68rrWV0r8Sh5LFdbkY5Y5c3Jrw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=NPCuvKS9DmuWd/fR9VVpq+WbeO/Ot0DDaoQl5jIEz89qXFKsFkKmIprS7NaXGXWRL
	 t2yAZ4U0j3Rb3zkIpWXmPbjuB5YQWaCwh4r2JFuvNrOPvgDKgxA9q03vH/of9UZUiE
	 FYhVQpFW0/6midrCXMGP8ncBcwzNZdh4RvHMeiKLhreqNzmYRR+JJflSjmiKKBeAeT
	 kQ1dOTgzJurwcAmph1jgWj/Dp9Xwb3bVlWhSjdk7uO6oaAfpcm2ywr/vzQrwT66jDt
	 0nV3XL83iB/0IEniCmUdCjGqf9drDcLVdIX48UfQ+igaqtm+HCCfG6eWPHAYDqs0rD
	 sP7LyceuqpP3g==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39b2be45e8cso33461411fa.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 06:48:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrkl1IAiZPr5/0yC4Z/IbEJ7WrkVShkBcqIZ929d3pvPbEHRGGEdEeWZWdMdElrtqZCrhQoTNCF1BYYPo2fAjjsKA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Qq6GmeyDwPht0JsToagIbTXEmRkdyGiZWE7H8qtizsqe8Ir9
	h8+wGWuay2AWzI2PE+cWsfrn7hO5sanXJKF6Z33Sz/IZgxcZoHKrTBYEGoo6XBXF6KWfDw6sJ9k
	gv5M5f2bXjcyASjbWx0OrT1J2Mc/LDTU6LhibW9cs6A==
X-Received: by 2002:a05:651c:e15:b0:39b:d76:5cb3 with SMTP id
 38308e7fff4ca-39c60015570mr11010031fa.29.1783432122399; Tue, 07 Jul 2026
 06:48:42 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 06:48:40 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 7 Jul 2026 06:48:40 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260704151521.211335-1-marek.vasut+renesas@mailbox.org>
 <20260704151521.211335-2-marek.vasut+renesas@mailbox.org> <CAMRc=MeyKGv75rTLauZuGxSfgjCPXVE_r=A7uNduRr6kAd43aA@mail.gmail.com>
 <edc7505e-1103-42d7-b88d-013ca10753b3@mailbox.org>
Date: Tue, 7 Jul 2026 06:48:40 -0700
X-Gmail-Original-Message-ID: <CAMRc=MegYyuqMVkG4_E_TF4hzoy1PVx=omXgZUPvnARd-Eh+7Q@mail.gmail.com>
X-Gm-Features: AVVi8CfTXb7a9CnF1kG_J33U_VZ0A1Fo3nvdJCm7SCTOOAtgiE9VDcYDyKYQeEg
Message-ID: <CAMRc=MegYyuqMVkG4_E_TF4hzoy1PVx=omXgZUPvnARd-Eh+7Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: rcar: Add R-Car X5H (R8A78000) support
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34809-lists,linux-renesas-soc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mailbox.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,mail.gmail.com:mid,vger.kernel.org:from_smtp];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:marek.vasut@mailbox.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:krzk+dt@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:brgl@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4E5E71C288

On Mon, 6 Jul 2026 15:06:01 +0200, Marek Vasut <marek.vasut@mailbox.org> said:
> On 7/6/26 11:19 AM, Bartosz Golaszewski wrote:
>
> Hello Bartosz,
>
>>> +static inline int gpio_rcar_remap_offset(struct gpio_rcar_priv *p, int *offs)
>>> +{
>
> I am hoping to get some input on this remap function.
>

You mean its potential impact on performance or the implementation? In any
case, as Geert said: a table of function pointers could help to improve it.
I don't mind it in its current form if it works for you.

Bart

