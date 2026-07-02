Return-Path: <linux-renesas-soc+bounces-34665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id krh7FkGARmq0XQsAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 17:14:09 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E53226F9447
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 02 Jul 2026 17:14:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=mxwtnWgX;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34665-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C8A8B30248AA
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  2 Jul 2026 15:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F601433E96;
	Thu,  2 Jul 2026 15:13:28 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D083C23BD1D
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 15:13:26 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005208; cv=pass; b=IqebNWB3ge15+AFYiyZmGojwe4u8V5YHlhJ0r5xKXzbt2N4yR+CaUZQfTeGCdtTKyIsMcEgzOxJCxRxpwAbxQpzdFG/CgEVbI9f+QnW5POhDq9StiSiyXM/29Xpd5FLgsozvGCHF486RR4+NhxL4MCGel61y+ySbymODodTKsqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005208; c=relaxed/simple;
	bh=/4egXjCN8R7F9xxzpwAYPp/3i0iFE+B6QSqkJayqSxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHeIFUCJWJNZt65ZyG7NhweIWEbg7iI8MOwvqsJ95o8QW6iQ/CMRLhXZOoQtC4KItX/z7oEv2yFuTFjvbOY1f78me3jmYQqygSouVFYClogxz0MF52q/EjunKAtaHHUyCMwEFb33nIZSz0LxiAdvh+JDunlsKNx+XZpdOkH9xfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxwtnWgX; arc=pass smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-472055b0efaso1341066f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 02 Jul 2026 08:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783005205; cv=none;
        d=google.com; s=arc-20260327;
        b=owuI+suTxacHY5HWMoiltwiqceDSHUO6MEOhFM4an6bHZOfMiWM++X/ozFISB89EwX
         nfyR9PoL2zf8ygPz6fcwirdeDZCHdUC+q8ApK68sc1oLTdxLDOjR+diQiuZKi7xW9EUH
         4BeFveUk9uHEzha8L/OS0USFar+D084aU2eLs6tbJmx8WYZSA3j7FX4amvAgdYoyHzHA
         B+1LD9uAGBSdo6TvTzx0pioCfaJvvz1UM11yL7A4Q2mW5+C5bvm4IDzxA7Ed7OAKnYoD
         HLq8z4ZNZVoYulSPWNk98HNjVY3V5Pd5s8pekty6eoyg/x6PJTEkngS42irzx1OcIcjY
         4W+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/4egXjCN8R7F9xxzpwAYPp/3i0iFE+B6QSqkJayqSxw=;
        fh=G85hFlypfT9wv4em/NIwls9+YCWuGD5DAjJsySHTFi4=;
        b=Kw9LIC6ZEncsfcqnsqeXBDUiV0ytI7TTGvT0KUiab5o3rV22yA4f+Ztkmdw/ir+xSe
         YJf5E7VBfOsHzCQx9qH0wlh3YzHTe19DedW4/oZZmNvgdbGHc5laIaP/ckHzVbhSlYj6
         mzS5pVnwlqPQexMot5ixXv+zJM4L98M3SKLaiBWkP9gpGtJ89RTrXlQx7RfihTAepLn3
         EjP67XKgm0zP4D1AOvxkj5e7VYscRSxrCmTRLJzgtVYl4FeITadW/adDWGdBOYDoMlhf
         6X9SpzAObi+1FFL90kCcz9h2//UG9aau53dQYhW5wv8788f46p9HBTp1VjLT4Kt5iM/V
         DvAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783005205; x=1783610005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4egXjCN8R7F9xxzpwAYPp/3i0iFE+B6QSqkJayqSxw=;
        b=mxwtnWgXSUJ2VTpxDgjhS7KhZUtoDgNgcYhnNevbp0k93vTeIRBovOxpbe5r1n55F7
         xgz4dC9vIg2GhR9kdP6BneN7wjbA6SE2DHVfqYBYMEeXqnwoAMZuxFFPm1LDoLmwYqHC
         XuYg+ywghF8myR54ikxzuuvjyJ+czHEqRHrlN15XDfqhqO5HTVvgxeCxfP3kpovvTQ7n
         hD1AwUBGhVSWrmu/JRUY7J7cRSgiCgJ2BTtLrCIgU3qiqiZyEu7YlJ1NxiGtsjaiSG2L
         pnKQFxVKoDksdl6k5lB5rvynD9icKEJgOqrzNslpia7bb7ryDROwsLjQmP2K/pijmFYi
         rrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005205; x=1783610005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/4egXjCN8R7F9xxzpwAYPp/3i0iFE+B6QSqkJayqSxw=;
        b=b8cVwklIqtMWLOxiUjuukGGIqzDiHdNEhxK65bfXwzrBe68j/3R8T1wluY5apuzAtY
         ktgoqSoD3xVUGZeTDKYt0+s8dRBV0TnbOHIw8me9e9NvNLKWE+OMy5D71ELoH4+3dVaa
         C6XAuXeRIUVBNGjj96cfqyTG5eTZmCTw4zqU3nUkm4sZxKhFSDtD5tkc/Z5u4YaVUod+
         2r3+d7xEQbDvByOB1WIt+qZAzUEOpG9oUClzeg8hUa/wtRVR1Jnngmb0RgzHWfayjvFk
         AmC9wgTR4QzA6HmH8Lew1VemVpVFwXreueOX89Gv5PI0Ib9XS9DaKuwL285HEVmx3cy6
         I/+Q==
X-Forwarded-Encrypted: i=1; AHgh+RphcQgo6HZ0yw7q2NTj1vaF10wOa7kmlQNHvGyf7iNvyTUy0OZkjq6dDJ5rBzpevOqOhc30OXjldX4XjQBDYOkz9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsKcq9KpMiIe72rndtzgJXVAXs3l3taGxDuubr0CvOYnRwCEnz
	gdHeuhouFmCGRdz7zJj7PXg2jIvK0oE7kMPgcuzzA02uJQDq1x92748j7HP/3rVmVzDfxjO8pPA
	WVsUOO1Comh3k6aIWHjcE6q3cBlQN1G8=
X-Gm-Gg: AfdE7ckaiHlwKUtphiLlD9je2pa9RSijelAvGqKRjL+9ynF2Vp/esogckbhQelGTG5I
	CTye7mmPz2V+GUTQ9t8gQZkPMNDSjNXINcvQ+UbR30YtY8fO7M6r+mUw/dMNof59livQT2dnDja
	YmMT82dXpH7F26k8asciN/kmo7q7WPwa0Y+enrEn+VbRCdOTXGDZ+U0CVGBqdxIok2VP5AYjiGv
	Y0K3Es0KiKnUAgDjy9E8mgkYgSIUEf6QnnmF8FNLWfdG71Uk5JHw0iI1f+MPAq0XCkAZfHQCe81
	QzUKV3GguW3UC6AnrzjMgpJ1d+DdUPNjmQ0UJHRxPdAwDYqTpELQ1NNslw==
X-Received: by 2002:a05:6000:310a:b0:474:b860:b7b1 with SMTP id
 ffacd0b85a97d-477573bbc08mr9500811f8f.9.1783005204503; Thu, 02 Jul 2026
 08:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260702123112.161160-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <c3ef312a-4c26-498c-90c8-118c6dc035a0@roeck-us.net>
In-Reply-To: <c3ef312a-4c26-498c-90c8-118c6dc035a0@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Jul 2026 16:12:58 +0100
X-Gm-Features: AVVi8Cc-s3hEJSawL1gEVp8kBOMXlVewT2dK4bhHbDClofCdIh5uSGgHTJrBYuY
Message-ID: <CA+V-a8tcFzoGBZ0NBE=612Py+E6gJ4MRqyT2QjxSN1s6Dv5CvQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 7/9] watchdog: rzv2h: Add syscon support for RZ/T2H
 and RZ/N2H WDT control register
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux@roeck-us.net,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-34665-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FREEMAIL_CC(0.00)[glider.be,baylibre.com,kernel.org,redhat.com,linux-watchdog.org,gmail.com,pengutronix.de,vger.kernel.org,bp.renesas.com,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,roeck-us.net:email,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E53226F9447

Hi Guenter,

Thank you for the review.

On Thu, Jul 2, 2026 at 2:27=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 7/2/26 05:31, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On RZ/T2H and RZ/N2H SoCs the WDTDCR register resides in the second
> > region of the System Controller (SYS) block at 0x81290000, which is
> > shared with other peripherals. A dedicated SYS driver now manages this
> > region and exposes it via a syscon regmap interface, making direct
> > mapping of the WDTDCR register by the WDT driver no longer viable.
> >
> > Update the WDT driver to support both access methods to maintain
> > backward compatibility with old device trees that use direct mapping:
> >
>
> WHy don't you convert the driver to use regmap first and then just
> update the regmap pointer for syscon support ? If that is not possible
> for some reason, I would expect to see a detailed explanation.
>
Good point. I will send patch 6/9 and the regmap conversion patch
separately, and I will send the syscon patch when the syscon changes
are accepted.

Cheers,
Prabhakar

