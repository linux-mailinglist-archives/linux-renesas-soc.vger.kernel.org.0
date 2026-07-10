Return-Path: <linux-renesas-soc+bounces-35035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id boY6E2bSUGpD5gIAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:07:18 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96648739FAC
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 13:07:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D72C3054322
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 10 Jul 2026 11:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD4A240F8F8;
	Fri, 10 Jul 2026 11:02:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8522410D32
	for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 11:02:52 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681376; cv=none; b=BJBKq+INAuRbW2mv10nmkB9/gL/pGuEk4nLaVidN3rZKk4ptnZE6lCbeuf33Y4o7aAbQttIhtA8PkzlDAUmzH6AOGJyi4HO1LidQySyU82XQol+2T0yVcrC5d79MWWv1JSIQ2SShJkznc1uP7EhiFcM8drZiKUkkvbL78W32hq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681376; c=relaxed/simple;
	bh=TAoC8AtqfvyrcOiH125Z48ckCbhqCjSDAUjYBMGFx+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYJSDa/o8st1gnoHwNPr+OVzFCekpjHWHtvzLd/FTulNCdbaJ7Bc/RN1cSglIMshvSFY/+5AX/qPIhNu2sd7O/vOpGffFAV/O5b1cf2u8x1SopIA8KLjPsjS8klT2Knouo5prGm+A6iSugG3QdsYlRbgkXM0b+6hwWSxljkIKJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-726840fb461so202785137.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 04:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681372; x=1784286172;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MuUmGqSSA58rP0nRidv37IIoymAVqS6FDOb1XQHbyds=;
        b=XA6c3/ubhrLY7cZ1lx+GchfwqPsEdCDwYxgO0Mebxzwlpsdedrnf5d63zUolPapIlp
         xqBEu6Pw9PI5hwDxDdyYbO/lBl1n5u0+B0wSLHYwNiNEUm83OwPDr7d2TVI/g6SPttDL
         87gxtFmgcBdBvDBqBvw/9zwzCEQFOM8k4n2btk9f7p8sEHveeazT1IpZyke/UT8HdoyQ
         dwol8jQmHDgOZ9z9V+IDw09anFkIxAT/FjuEvi5e2PhosusIjYzHVDdkxEP1YGGXj9PF
         OVBcCwk9n2WvVw7JwZrBKMLurqzLMN9ZNOpAPo8BkNbUr1Rl20fFMwu8drCUkF2N7pK6
         zjvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpfMd3hAOyKUVmcrzskbq9Zf07WAJ2ntQb4a0nAeTtKzfOKWpK1Ace0/gGGdMnIKA2Rrte3AlVuTj5oVXP+ltpVJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxCTlRyWh5psJQByQfN5IxxSIGE3Dz4cu/0iMjMo2GT4W6Rbluy
	9nqlFSeM2WC3l224RJzU9ZyUOBVzug4/B/A5cDCzEFf/UbKo3O72s4+pv9i0c2C7gjI=
X-Gm-Gg: AfdE7cmwhPa7N1IjM3e/NXIUBUyFHwAkPWFVKGAxKlGyULYhPdNxHD7rmpoWVHHqJFk
	1jKsV6G8sJNKIV5UsQxj/NNVT3ljY+9KNU3G6UuxscaB1bt+28i1oBs1Qre2+hpZPqrS7ERlzWL
	sQ4H8WummfXpaDtgvwOI+wfGpm3NfPfE3wI6MBj5T8tCsPqcWlmbPt492cRgh+ePirdpVS6OPF/
	dt7Rjgq2pmgKqTxdaghmOcj6qRNUN1NJbf+CEcz5Bb51SwIi6p6S9Fg0Ez0m2oorZf40WVu6qCD
	zaFW3S+ohb1FxQYoX5wki5X+ZAPV92CEcHeC6brQGQXEsOEGhUJ2VdQ/uVMxaH2MTmPcE2GPUl5
	bJAreux5tES22yoT0HAPrT9FZ2Gy4fqgFOOOTzWbg1WDcPSNze6CBZUMp0uJZPw3z/lbjASQxvc
	GudLbw1Ny15dqSM3czeFjFsN4kzda9UXKtvxWrGOyWxQTxonRBCBcsbesDrgTf
X-Received: by 2002:a05:6102:5e93:b0:738:5853:fe7b with SMTP id ada2fe7eead31-744e04524c5mr6104434137.28.1783681371535;
        Fri, 10 Jul 2026 04:02:51 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6771d49sm5313435137.0.2026.07.10.04.02.51
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 04:02:51 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-9690c99c917so242241241.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Jul 2026 04:02:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpRYOT+9ZTplhvPIWKu928+PYZvSJUTz1Sfbiuya76odRimsruyas6982b54MAppsQn/phPE2PXjtpJTtzjwj1pug==@vger.kernel.org
X-Received: by 2002:a05:6102:5789:b0:73e:9fae:5844 with SMTP id
 ada2fe7eead31-744e0426fd6mr5821388137.27.1783681371174; Fri, 10 Jul 2026
 04:02:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505329.git.geert+renesas@glider.be> <49726acff0fee1c3606e83c4f242ef6aad25b4b8.1783505329.git.geert+renesas@glider.be>
 <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
In-Reply-To: <20260710-adventurous-burgundy-chimera-b2fff9@quoll>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jul 2026 13:02:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
X-Gm-Features: AUfX_mypDnJ4qFpPLK-a5R1Mbwkbc6yQr178xDsRkCp5yARGuoX_7FuK_KFx-r8
Message-ID: <CAMuHMdV=ckONBbTYELPJU8YWoNzdu3PJ95VR8cz+f_7dUeiPUw@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: clock: renesas,r8a78000-cpg: Add
 firmware property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-35035-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:sudeep.holla@kernel.org,m:cristian.marussi@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:saravanak@kernel.org,m:ulfh@kernel.org,m:rafael@kernel.org,m:p.zabel@pengutronix.de,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:bartosz.golaszewski@oss.qualcomm.com,m:vkoul@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:khilman@baylibre.com,m:florian.fainelli@broadcom.com,m:wsa+renesas@sang-engineering.com,m:marek.vasut+renesas@mailbox.org,m:kuninori.morimoto.gx@renesas.com,m:arm-scmi@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,m:wsa@sang-engineering.com,m:marek.vasut@mailbox.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96648739FAC

Hi Krzysztof,

On Fri, 10 Jul 2026 at 12:21, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Wed, Jul 08, 2026 at 12:16:23PM +0200, Geert Uytterhoeven wrote:
> > Add a firmware property, for systems where SCMI must be used instead of
> > direct hardware access.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > v2:
> >   - Spin off from "dt-bindings: clock: Document Renesas R-Car X5H Clock
> >     Pulse Generator".
> > ---
> >  .../devicetree/bindings/clock/renesas,r8a78000-cpg.yaml    | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > index 4e23bba334382346..fc499e7cf52e4f0c 100644
> > --- a/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,r8a78000-cpg.yaml
> > @@ -35,6 +35,12 @@ properties:
> >        <dt-bindings/clock/renesas,r8a78000-cpg.h>.
> >      const: 1
> >
> > +  firmware:
>
> RPi is doing similar, but I have doubts. It looks way too close to
> generic "syscon" which is disallowed.
>
> I think this should be vendor+purpose specific, e.g.:
> "renesas,scmi-transport" or "renesas,scmi-firmware"

The disadvantage of a vendor-specific property is that there are more
cases to handle for fw_devlink, cfr. "[PATCH v2 02/10] of: property:
fw_devlink: Add support for firmware"[1].

> Also we have "firmware" nodes, so this might cause conflicts in dtschema
> validation.  Anyway, the phandle itself is fine for me, just the naming.
>
> I'll ping also Rob to chime in.

Thanks!

[1] https://lore.kernel.org/de34ac0c52695d92c67cf950b3d8e9b30095d305.1783505329.git.geert+renesas@glider.be

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

