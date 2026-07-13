Return-Path: <linux-renesas-soc+bounces-35147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6SAWHLcMVWqSjQAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 18:05:11 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA6374D673
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 18:05:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35147-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50D96301D94B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Jul 2026 16:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B8028313D;
	Mon, 13 Jul 2026 16:00:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B7F2236F7
	for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 16:00:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783958451; cv=none; b=q1OLVhgJr7Fs1S2ZlupjAWGB54kHid/ZVmvu8j44aSXvQadNcFBpTo90WYsaYwcD6jVECjShcBQ0B7YaF0etQFnN5/BMYZm5Zkioc24dp1IhhIQvPjmcHf6NOWfIri5BSFV16TatjupPL8zqlVJ0M5TS7ED9yl64XoaEeL3JU90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783958451; c=relaxed/simple;
	bh=SsOh1enJoELJHzfIclkKXerzvf46Ll/w8xxgwM0UOnc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EosQ6FGzIf0KPpb+G5tuu9sVh4rWtUOpHNmj5lMP8xn2OEDq9hyBZpGniSQNjAiLuwV7gjweXu9PcErxFL064tt5XFjLmV44kvA/BQu/M7BatBkgiDZk5Dzchp0vL5RaynKQ+v3ZnqiqXBJE/rzZsSu7/f2YsFpWv1WE8svJ2nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.50
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-736eec08c43so30535137.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 09:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783958449; x=1784563249;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=674QbDTihSeDJzkwbUpD4t11m/0pIrH8HDq4q33BUPk=;
        b=hYdhPdZTeONQRfvbmrlnCt5uy1ue6M2vjmQgLegfXZWLShhS4p/oSGRjL6RMTdKv5n
         ogKqC7OphaN+5EL4KjJ9GksIT6VIsog6/jqB02GGheOIOwe28xJQemq0v5NfsZR/i9oK
         awDydJ4nvPqsr1t9gex3ILkmEHlCA0CQliSCL0nb1RfUOH1U6UzB1N7nYHbDlQ6GDgJ9
         aWJhMmBKlZjuQ5XQ4kRG83AowNIsYbehhJLlgYEjsf1DpHCIIFgmd5xHfMCPXFt8UBow
         i/gxMvso0N7/LRZZ5gGhlzxD/aNN2CMVinpZhCRIltvADoqAfsHSnOs8fjbCeeKOMobF
         ya7g==
X-Forwarded-Encrypted: i=1; AHgh+RqVviqRePYFg1Kx0EueuLkILNmMIW5wGxh+t+N38SoHKXOWISAh9pEd2YXHa78HhQz2sl43OO16upstWmciH1YdFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywzdr6OUIf/R25OKnptE+3J6ewWL/pIlELhRerxUQLhMdu25Tve
	kTpfenXuctYZzVefSa9ZftdzlFLr/3EYtp3+TElmV3Ih5DdCwuUksUGMnSuaxF0Jgys=
X-Gm-Gg: AfdE7cmj5rNvtC2GvDb7bzK826TdWJjdfFVQa80KOu5MFlInHcttxAyttZULozE4YYr
	l3PHfJblHE4XFHvDbJsijbrr5rEoxKxOfNQCpYaEE0s7uhBLlMZis92b41WZuc0nWl16M9DXCsj
	6b+Os/FjUHc1Ej/qymTiKeVzYDZrG5UNrDYvGvSBtXQ/QgleWmx1G1A93bNXTubig7zrv+7355y
	n7uB3cWTNloBX6BskWJDARKVlqzxPRwHzdzerQcklbAzm7g0CTQHxLv4OGf/R8yVMh7+C+/nePw
	wFEw2sIkSRpXq6XiQVNrSIi/3uEwiE8FB1RmNt7zg5djST02euFwi3mLhrZfYDWkxMXMEWnKonv
	HXMaWvZ99+bk/2Zc02G/OjcUmotRRgotL+MAiH8F1Fw2bGsglHnk65bGscVwTmWXRHJ0AS6uYsS
	b+g2tLUYw10zRwo2A8+AlM4jBg3a7XZ5CiCecOzBXBypzUWvkectSP+w==
X-Received: by 2002:a67:ebc5:0:b0:744:e49e:df75 with SMTP id ada2fe7eead31-7450cbb8ed9mr5489711137.21.1783958448663;
        Mon, 13 Jul 2026 09:00:48 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-744d6a3eb8esm8893231137.3.2026.07.13.09.00.47
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 09:00:47 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bfbbe5220dso12812e0c.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Jul 2026 09:00:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqWN6GlIl+k5gqTFJNFJ3TDG9sDn8bgZQhx0QZeryiltJ2CD0B/ip2HGlhiFnSHLOxa7/lYUFpOe4WLk6JOyQHQdg==@vger.kernel.org
X-Received: by 2002:a05:6122:6310:b0:5bd:a2dd:60ee with SMTP id
 71dfb90a1353d-5bfa470c003mr6470720e0c.3.1783958447155; Mon, 13 Jul 2026
 09:00:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Jul 2026 18:00:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
X-Gm-Features: AUfX_myKEIDnT9gmvoSHxK3o8Be_bh5PlIka-qGq00orZWkHqkcXT9vOA0tXJpw
Message-ID: <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/9] Add System Controller support for RZ/T2H and
 RZ/N2H SoCs
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-35147-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de,vger.kernel.org,bp.renesas.com,renesas.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux-m68k.org:email,linux-m68k.org:from_mime,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CDA6374D673

Hi Prabhakar,

On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> This series adds support for the System Controller (SYSC) blocks found on
> the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical low-power
> management and access control functions.
>
> Hardware Architecture & Dependency Challenges:
> ----------------------------------------------
> The SYSC in these SoCs is a multi-functional block responsible for:
>     - Clock & Reset Control
>     - Low Power Management
>     - Clock Monitor (CLMA)
>     - Access Control
>
> A key architectural detail is that these SYSC blocks are physically located
> within the CPG/MSSR (Clock Pulse Generator / Module Standby Software Reset)
> address space. While the CPG/MSSR driver is already implemented and
> functional for these SoCs, the integration of SYSC adds a layer of
> complexity due to a cyclic dependency:
>     - SYSC requires CPG: The system controller needs a clock to operate.
>     - CPG requires SYSC: Access control registers within the SYSC contain
>       bits necessary to control the PLLs managed by the CPG.
>
> If implemented as a completely separate top-level system controller node, we
> would face a cyclic dependency between the CPG and SYSC drivers during the
> boot process.
>
> Proposed Implementation
> ----------------------------
> To resolve this, the SYSC blocks are represented as child nodes of the
> CPG/MSSR controller in the device tree. The SYSC regmap is registered
> directly against the CPG device node. This hierarchy correctly models the
> hardware address space while allowing the drivers to share resources
> without deadlock.
>
> I am sending this as an RFC specifically to get feedback on the
> implementation of the SYSC as child nodes of the CPG to resolve the
> dependency cycle.

Personally, I am not a big fan of subnodes.  I assume you are using
subnodes because you can register only a single regmap per syscon node?
Would it be possible to just extend the existing clock-controller
node with two more reg entries, and expose them through a single
combined regmap?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

