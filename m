Return-Path: <linux-renesas-soc+bounces-34838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pftQNIsKTmqICAIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-34838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 10:30:03 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B94D7232C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 08 Jul 2026 10:30:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-34838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-34838-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82A4D300B9D6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2026 08:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 889503FE37A;
	Wed,  8 Jul 2026 08:29:05 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B81257435
	for <linux-renesas-soc@vger.kernel.org>; Wed,  8 Jul 2026 08:29:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499345; cv=none; b=Qmq4NYA7TVI+uwA3DFoZI++/8MKkh7HW1i8c9YGFSWyKa672omup9K2gcso9IWFy9cA73Jg44ENG76kmR3Gb1IKEUeNFxGjlVnCQvlp8GwKpiPGwXCjo/OxTG5rbM81kWW9VD6+zW5l2OCO8j5GixW9OZ4j7gfzy2Qt+b8p+xg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499345; c=relaxed/simple;
	bh=1+kLOi9LSD1pyXHqpzeVhqiWWKo5xTD+altUk9sec1k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMxLbMDgvNJRlYK152NTKh2DNYvKq5CDRmnHlqLKyAayZn9+NtC87TQejuykLIcsJ2V3vY3dDFIsRP7gflyYYLVqZXjBHLxiYbtSTIy0eTvt/HymgsaFsE/XoWnTfIjAweG6xTEy6eMgfGF8fEQlcr8/E9DO09ByHjI7sfyLBJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.52
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-698acd36d67so830034a12.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 01:29:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499342; x=1784104142;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JpLToNdHAo/RVR2y6MFG/cqnedbdColih9Tbumz3lLg=;
        b=aM5LwJJv4900Mc7pn/II1ia3pgiftbUiiL58EoGPCHu51DbFCILvTqVy5WIqfQ0bcr
         ADFBtGlsUm0RBzUct9qapUT/2+Pt1lqEe4IeilMK/ZmRFPmLH06HMsKNGE5PZe00+hPW
         JBWu3+AGd6GqyzH58gvDei9oOw2Lqz4Mup5MGpeQ3SNA9Phq9pP1s2A9+ecD5B7oaSpS
         o+M1BaWkvPo6EAdT6Bjl3z/8rD1JZdawqoxPcIb54lZ4UvA+Kkeq34SsoNYFZ5vgIhHs
         qEHcM+4Hc+vlkMP19c4K0DJIfVpnLM7VvJ2VcpRsseGcK26EHaGHRpyb5F6gYEYfDbhk
         T67g==
X-Forwarded-Encrypted: i=1; AHgh+RpiX7UGhKANN0Qs7cJSdtAek5TZQeaqSgUMCz9DGVKGNlnGHZ7pvJ1S0GvPAatsvLRLr6EhVdJxruTjpIjHIEiCOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUR6j2EsMmrcU0PHFif/hqGlKXnY6NLcmGCWZTf0fthXU3oFsA
	/yXWQDZlADIeLr/5/8iGv9XD3iLQtukcfk47HTm+ZHKwBM3+OQHA7pBnjJwKkwc/Qdk=
X-Gm-Gg: AfdE7cn2UNeiS3aReRDD/q3hDbP7iHdqW/c/25tGuhbL087ZqcVyPgSBCjCoW4VbuDn
	cKWj0kQF4xhCIFg9iaOSCIB4ZX7j9UQR7f/HBCEWX8naTC21VIkHOrGcL2f7qn8/FZNeSEkm6dM
	PMaImKHtVVMbhNdRpDYc+fTg8JAgez37R4fi8FKTTIyLGvPc393JfgUn873XwXRvWjkeA9xOl2D
	Tr7tO4qDVVRnaw3rtBmuoQ2qyCnOtXbPIs8IAPCc+JnC5TyeuZK/v8ruNNQ9P3GQXAP71xrST+Y
	LMnJO6NgKu9BAGNOmvtwaGDVkaxqXCNe5R7COx2PQiWk0AQ0vgCin9uZePT8mNiUfLU6qyFBjQg
	TNFEwgB3BVZWoLqfD1KlME+NhDCx47W7Mu8PU3oPLWpW3+nW+QZfPgSgSJWMkH/lOIpJoIbtk7e
	I8mopcupwqpy254HF2Yo3sWmDlwbuESBj7iqfRTzYdYYIStFJZIepGMWjdE+EY
X-Received: by 2002:a05:6402:5d0:b0:698:3365:f950 with SMTP id 4fb4d7f45d1cf-69ab449d9b1mr554426a12.21.1783499341999;
        Wed, 08 Jul 2026 01:29:01 -0700 (PDT)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com. [209.85.218.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69ac41d7ceesm130647a12.23.2026.07.08.01.29.00
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 01:29:01 -0700 (PDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1268d56234so50233166b.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 08 Jul 2026 01:29:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrAxmsaFsEDXrxf1vOc/T6puMznD3hJ/b9X4hfRIwEp32J5xXH7ktMfmoZ4J/Ps22J87Vs0TRlgNkMNhQfcLBn/CA==@vger.kernel.org
X-Received: by 2002:a17:906:ee8c:b0:c15:a444:5cf8 with SMTP id
 a640c23a62f3a-c15ce1433fdmr69940966b.33.1783499340582; Wed, 08 Jul 2026
 01:29:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
 <20260707143646.245177-6-biju.das.jz@bp.renesas.com> <02831bf6-cb05-427d-8592-b3fff31b6913@sirena.org.uk>
 <TY3PR01MB113468F9FB9AF3DEB1598462086FF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113468F9FB9AF3DEB1598462086FF2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Jul 2026 10:28:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWkew5pEtSoXpnjB0whCb9yi8MGEsvDTgyY0Dk+Ak0ezQ@mail.gmail.com>
X-Gm-Features: AVVi8CfVJPUVL4hFbhqbTG5nmKv7RNubqBvMVJCFe5OasZDZMpBpp0iYn1NQinA
Message-ID: <CAMuHMdWkew5pEtSoXpnjB0whCb9yi8MGEsvDTgyY0Dk+Ak0ezQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] regulator: renesas-usb-vbus-regulator: Add RZ/G3L
 VBUS regulator support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mark Brown <broonie@kernel.org>, "biju.das.au" <biju.das.au@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34838-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:biju.das.jz@bp.renesas.com,m:broonie@kernel.org,m:biju.das.au@gmail.com,m:p.zabel@pengutronix.de,m:lgirdwood@gmail.com,m:linux-kernel@vger.kernel.org,m:geert+renesas@glider.be,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:linux-renesas-soc@vger.kernel.org,m:bijudasau@gmail.com,m:geert@glider.be,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,pengutronix.de,vger.kernel.org,glider.be,bp.renesas.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,mail.gmail.com:mid,vger.kernel.org:from_smtp,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B94D7232C6

Hi Biju,

On Wed, 8 Jul 2026 at 10:10, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Mark Brown <broonie@kernel.org>
> > On Tue, Jul 07, 2026 at 03:36:37PM +0100, Biju wrote:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > >
> > > Add dual USB VBUS regulator support for the RZ/G3L (r9a08g046) SoC,
> > > which has two OTG controllers (one per port), unlike RZ/G3S which has only one.
> >
> > Reviewed-by: Mark Brown <broonie@kernel.org>
>
> I have encountered compilation issue on x86 with compile_test,
> that build this driver as module.
>
> Looks like I cannot use two module_platform_driver definitions
> in a C file.
>
> I will switch to single init explicitly registering 2 drivers like [1]
>
> [1] https://elixir.bootlin.com/linux/v7.2-rc1/source/arch/sparc/kernel/central.c#L264

Why do you need two platform_driver instances?
Because of the different device names? You can use
platform_driver.id_table for named platform devices, just like you
use platform_driver.driver.of_match_table for DT.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

