Return-Path: <linux-renesas-soc+bounces-32860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD2WEj+JDWpdygUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32860-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 12:13:19 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B039B58B7C8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 12:13:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4EAAE30B65FC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 10:08:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CD03D348C;
	Wed, 20 May 2026 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2MIEFrA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ECC3D5646
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 10:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271712; cv=pass; b=H3jhE5VD75xrYhaA3Z3oZ4AoxXuYo3DtLOA4ZdT8+Cnz5K9Tiy9XMR73RHl5mH/kLz6jD6z21qTnpN8aOhPtAhzcXQOI+GkmbYSKRyl+WzNVIs+c5S4oiEiZOWOqXXCs6SHn4LEYR8kvH3kmjjKwGduHXDKN54Jm71zYpMyHmFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271712; c=relaxed/simple;
	bh=G+RHRcrQuLFJOdUiEpoIvt1xeUTHOJ2UQpik+JvScyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kp4qMrKc8jwK5xXEs6niAM66HQZWN70lB3QS/ESQrdw1M2gDHOtIlhW70Aa1+iBrkd8syTpM7StydR6TZs5bOicu9qErDfNEE7J2IfrRWaVleyNaZogFYJKydIHtdnRG96THJecriNOoQ/NkMdZMJT9d3WnbbSYYOEghPyERHI4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2MIEFrA; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48fe26a177cso34536095e9.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 03:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779271708; cv=none;
        d=google.com; s=arc-20240605;
        b=FqYrmUbUoiTZExcfaIAzeokMVqI7jQW0ZCRqrMhneJac9qjfUsiDngPkE/0uuC7ZYv
         IZgSOGTS7sOeuHlzancFK6+ycb3nISjgoAeNxQB5ug9Acb+OUmPEz78scRzoHYIcZP6R
         U9BKwB8RHxNVakXHFCOcuWfs7cvr/CyRTRVWXtjdtIsRl+FWUgVHNeSOZbSS4LLXTuca
         JWvYBeXKRAM+lVUFWgG/hs3WsKtdG7/UN8tvxUQXY7kr7cvMUX5d85M1ObuPsTBMPqLf
         tLFeg6pQGenc6AA/NKRnb63xQgf7Qy0mhd/XWucbZBHdHY/DfAHeuInJiV59uVA4HhdI
         OYWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G+RHRcrQuLFJOdUiEpoIvt1xeUTHOJ2UQpik+JvScyY=;
        fh=Zped9uusZEWbm31fRN+vE2MBjv1s5tSZwOeqfdXsMJs=;
        b=D+qk7OUx1tjZJG+zbURVYv9gHuR0g82xmcVrdSP4n7YZccDcdJFKucLfNBO0TVKir3
         0EcbUSfCHgeg5ZVb+CCmKmwoLta39kmfb+KDccdbBMhXYdxzIvyxRZQb65WKJe+oyaMn
         xa0yraE5NgQSgWDotjr4IyKUxdC57oCL23gwETH6489JuX8p2fdpIVHZ7izEttBf30d4
         cOsp6+fqQocKb66rqopbmzkT85bAv6Q4lA7e6rYIARtpPSwpZgl0TM54C2fO7FHyadhw
         ketXa0m9q6WKINfp+ZVTgCLzwR96h8LmYWQ4ZNPJ8xUNb7/ot9XmZ5FjE0A4VJekiE2L
         64KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779271708; x=1779876508; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+RHRcrQuLFJOdUiEpoIvt1xeUTHOJ2UQpik+JvScyY=;
        b=Q2MIEFrAQbSqJqOeC1pUR/7qbdysVtyiJSS42KbHnpcGErqnd7YaksP/y9CYWU4Wuo
         qZ7grI3vDGci4xophDFJYBDgPpnPnZpv5yH/ugQfrC1jQ5XSC7T26hhOet/qB85fh51a
         LflpkfDNc3nT/ouPKj/bp6wwuBlI3Iv8iTNqehFFe/Z+6DpxudXC9IykHkqhWNhzEzNF
         tp6ORol+yDmROwOrKinzloBDVkiz4MS8HvCUwFcSTn4uz/s4vLUNdyeAWE5IFQ9vl2J2
         LMpYPG/EV2yxoQEli2Q6HrDhU9ImEWkXpaUnId2XYqqbwWCZ5kO6zekN3nI0Fk2lR6Zd
         4U5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271708; x=1779876508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G+RHRcrQuLFJOdUiEpoIvt1xeUTHOJ2UQpik+JvScyY=;
        b=FWxwvySVvryxQ+uPthximZ22jnfkLj+1FH4CxT2Gi5S9VvLoQ0TgRhFbQ6wTLpbam1
         FD7Qv6oNFu4BIbDCHl2h3vk9vqJYPN/3t+hTeSOkHI9uYao5N/ugK0iCzetuRhrxWCaL
         azhL46aDG9amsKpWbnhUEDrGyaWJOoP6AK6yVSQr/EUdhAW1mMD0CfAj6z68eV0eCuZP
         AvhPD56OwUO17uwqR41OdXmFinDZ8qF43N4PTlZb+9a1XOngZXs0Qr+vMg09IBLgtm2O
         dib6yyrY6sKnjLX2SX8m2bK7ODqFUlzTa2kZcPsgWqWgF3qO+qucQFObMQycfxP5S5v0
         4G1w==
X-Forwarded-Encrypted: i=1; AFNElJ/p+ucKhVOTH1awSOG4G7r9N+8ZJTfVux6Av3x+X1QjqVjeQFOr8J8/27aWDlHpW9NuTyD/AwamuAQ4lBJFK/oB/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpokmRxZvul8qsKf6PcuNxNBIYS6X7AZyT+a+XviAACfL7XICq
	pz1F/WXxTk7tHQhsCTnzGU04Pi42mLQa+/DaWVTKdbI2hXD3EzqlJfnF3T1bMLj8P9o9Wkp9r2+
	0sp36BOMTX+f6DAR9fxXWZR8zax+cL2I=
X-Gm-Gg: Acq92OECusZSvT7Ff41WgNhbrOSWFTSE2Y4+vzgQpg752ahThhsMQRSpl2aDQuvDAVJ
	mhwhsNW8IJdpPu2g3SWuy4QgOgK5v9YrR6wvoIN8ZFIAleIMNpkAhnZ09EOWG4d+93DvCG/ksfq
	sAC5eZnhVZs4o+7eZcU+StmtkHiMtgABKk9+fMHccLxmC730GSivgPwkSGtPEeERLwv9m6Za20m
	2QzZcRDFKJCT8H72vA7W6GLhLMkAwBmLhi83PEYaGwWx7Qh6/30xS/H2QAvRcSX7LkNogh4ayEU
	TTuQEUzIazWD5VVjxyO3+fvmPwghjpvP5mD1Kfju5hma12MKmEDDDzNst4vkJA0uCzPfgw==
X-Received: by 2002:a05:600c:8189:b0:488:ac01:72b6 with SMTP id
 5b1f17b1804b1-48fe6323addmr339237555e9.21.1779271708314; Wed, 20 May 2026
 03:08:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520091638.68370-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXDdS1_69+36h=HRKGvbZQ9j8_ma_sFW=ajXy=sn1M2Cw@mail.gmail.com> <TY3PR01MB113460DF331AF8A6FF89FF37186012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113460DF331AF8A6FF89FF37186012@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 20 May 2026 11:08:01 +0100
X-Gm-Features: AVHnY4IeMKd81qP5KY9sl61jzoiL_UHLXsJvDnEfRbh5YnW3GcVHa85CuOeui3w
Message-ID: <CA+V-a8un-MUoR9ak=a8XxUp=x8DOhjoVjuXCyd+XMsvK6VHw3Q@mail.gmail.com>
Subject: Re: [PATCH] thermal: renesas: rzg3e: Drop stale syscon documentation
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: geert <geert@linux-m68k.org>, John Madieu <john.madieu.xa@bp.renesas.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32860-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-renesas-soc];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,renesas.com:email,mail.gmail.com:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B039B58B7C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, May 20, 2026 at 10:38=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
> Hi Geert,
>
> > -----Original Message-----
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > Sent: 20 May 2026 10:24
> > Subject: Re: [PATCH] thermal: renesas: rzg3e: Drop stale syscon documen=
tation
> >
> > On Wed, 20 May 2026 at 11:16, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Remove the stale kernel-doc description line for the 'syscon' member
> > > from struct rzg3e_thermal_priv.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Fixes: c33edd8f936ccf2e ("thermal: renesas: rzg3e: make calibration val=
ue retrieval per-chip")
> >
> > If commit bf746e2a41efd986 ("thermal: renesas: rzg3e: Remove stale @tri=
m_offset kernel-doc entry")
> > would have had that Fixes-tag, perhaps it would have been noticed that =
that commit removed _two_
> > members?
>
> I posted a patch removing both the members, Somehow that patch missed fro=
m the thermal patchwork [1]
>
> [1] https://lore.kernel.org/all/20260208092848.5313-1-biju.das.jz@bp.rene=
sas.com/
>
Sorry I missed this. A partial change was already applied with commit
bf746e2a41efd986 ("thermal: renesas: rzg3e: Remove stale @trim_offset
kernel-doc entry"). You can take over this patch and send a v2.

Cheers,
Prabhakar

