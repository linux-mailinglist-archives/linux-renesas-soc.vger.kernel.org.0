Return-Path: <linux-renesas-soc+bounces-35247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XrdaNxFPV2oVJAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 11:12:49 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C1175C4BD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 11:12:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35247-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B70C5308534C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2026 09:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3795E3EAC74;
	Wed, 15 Jul 2026 09:03:11 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B543EAC9A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 09:03:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784106188; cv=none; b=AAH4g23uwDCk+Efc9wwPBtUrC0akcFimCM+euHOo4ay3xHn7SzoDw16IfNm8Dxh4P85HhofXeBbCz8CCuXRaGi5+WEnQS7b8Ja/JATu/SH+u0zU0Xb52bOjaKX//yvbtjRgeXm3Epc55+RBQ1VjhibUnAHW0BCFXxubJ56pf1yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784106188; c=relaxed/simple;
	bh=UpStxGVYslbxooun+2Y901dqVJN3H5rYG1yY1FSZ/gc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r8ZCnJM82/iHCDDYG3EQwfL1SH0JKxFq3ewSMJO8sypqGv18cTEhQWe7DKbkb+4U1SJx+iHoYZS+Bu0sxbu0It8kvjZ0jo6D18AuJNb4kGFCEeNm7irCDTfs7GkvyLscnqMA4LFA15JcKSeODBBMmbjyrtxjju0YMQYJdKbDtnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.176
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-848595b338cso6092658b3a.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 02:03:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784106175; x=1784710975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIyweZY2e0/6Tej8S0XE9Agd9YDC5DXPE+LxKJOtIuM=;
        b=BvYYAmJ+uQ1DtEN4wtfPXN61ZaXHndsM8vhvMx0zvJOnDH2fBAILOTSm2Gn4Xo5gTs
         SwQU2Rlfj9d8PVPosdaHHr/YBpqT7uaUziNB2qRCI+NwDfPbxX6yUtZmzjLJ9s5CxOJY
         /W+i5tZHcbnO/TFiXWKm4yoVASR9HAkmKHlhksQbHcHfh9MFcKpM6l0r7JRU+wdeyDnU
         jy63GuoABJIsLI7iE4+WyzHACrUcul5jGsy27aXV5DdGjxbxO2W7EJZAw83X5V3A01eM
         2KeW6ku27UuLutwhB0R6v936mMXxeLyg80/eVJoIb737KPL3zTT0cmwXOi6QEYDC88PA
         ywmA==
X-Forwarded-Encrypted: i=1; AHgh+RoxQUQ5lEGfc5RCvLOgzLPbntVeCC3ADI7dLR1+fsjG4Iv6eyhPCCTUPCumDe1fA2loxAxhCQao5TSRPQY4xO8pbA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysjQeOTIAgUeVYB+zQAcKCHvbLqwltY/LrbOnurxUjANrFhA3a
	MXCbNoj90kpKvzsWKw4akk2VgjDAu4pj83e450wDmocyhay3N4GWZriHnc9rW9iw55w=
X-Gm-Gg: AfdE7cmeCmFVI/N362e0/DrlmOBt/2BZnNMJRDrYPnoLN0840pXGK8CLvUHHxXw/9wq
	+S75GOJw0axKjnWm0EZhEcMCHgbNxs3ApfELS5uzWi5fq4xZtZsKyLx2pFVw4rk/kmAu7W+gXi3
	+e3wMOUr7bZ6YbQvHHkn4mazO7isaeu+wuZyD8W3qFJHIO3MdN+h+49pKLajh31W9q1aocvkbbk
	uzwn/Sx1epXB9lvrTRzOtN5vZnbfaoxJzlS2Tq5GXed+awUNovH331MXiSZGDUEgXdfCU3CtbqL
	28CRlU08nUu4wwRUWnQzJUuD3ZB6Txi+mgqFE3IUwgYDOTetDzpu8MVNDQzbRGcedaqdNpkWXX8
	7oB1H2H6YgjubrlUEIGHh4e04ipD12IV3B65UwD5k8p/8xGXe+v0oxuKyJQPoDnGINr12rBHB9C
	TjKbQv7gKkx8RwDKwi7YaY1Jv4HsqBSvd7n3p2xiimqkTVj8m47RFZ2w==
X-Received: by 2002:a05:6a00:b55:b0:845:e8f3:bdd0 with SMTP id d2e1a72fcca58-84a557595b2mr5701553b3a.33.1784106174499;
        Wed, 15 Jul 2026 02:02:54 -0700 (PDT)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com. [209.85.210.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f2778acsm2810326b3a.20.2026.07.15.02.02.53
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 02:02:54 -0700 (PDT)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso5538898b3a.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 Jul 2026 02:02:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpcbd9JfRlhQWur5/zsu5BaxCaRk+a/6Fa3Dt45EHjgnRzW+ZsGACLRX5D226EBwXMEGAsO1UzFpNiURgv+aJO7zw==@vger.kernel.org
X-Received: by 2002:a05:6102:1499:b0:737:ba2e:8a26 with SMTP id
 ada2fe7eead31-745875931d5mr3323342137.27.1784105797210; Wed, 15 Jul 2026
 01:56:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
 <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com> <CA+V-a8utJuuwVNy8o2zM5jHf9qXx36S79uKGtYr5O=sASh_wpg@mail.gmail.com>
In-Reply-To: <CA+V-a8utJuuwVNy8o2zM5jHf9qXx36S79uKGtYr5O=sASh_wpg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 10:56:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVT-wWtJaB1bHR3CjfjEGhVfWWKrs6YyZbahOTFSFK4Kw@mail.gmail.com>
X-Gm-Features: AUfX_mwT5leJvJcjodDPFjgFmedyheuuombdI-qCHkgNmnfgE8I_sxJbNtJF5DY
Message-ID: <CAMuHMdVT-wWtJaB1bHR3CjfjEGhVfWWKrs6YyZbahOTFSFK4Kw@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/9] Add System Controller support for RZ/T2H and
 RZ/N2H SoCs
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35247-lists,linux-renesas-soc=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de,vger.kernel.org,bp.renesas.com,renesas.com];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 67C1175C4BD

Hi Prabhakar,

On Tue, 14 Jul 2026 at 18:51, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Tue, Jul 14, 2026 at 2:27=E2=80=AFPM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > This series adds support for the System Controller (SYSC) blocks fo=
und on
> > > > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical lo=
w-power
> > > > management and access control functions.
> > > >
> > > > Hardware Architecture & Dependency Challenges:
> > > > ----------------------------------------------
> > > > The SYSC in these SoCs is a multi-functional block responsible for:
> > > >     - Clock & Reset Control
> > > >     - Low Power Management
> > > >     - Clock Monitor (CLMA)
> > > >     - Access Control
> > > >
> > > > A key architectural detail is that these SYSC blocks are physically=
 located
> > > > within the CPG/MSSR (Clock Pulse Generator / Module Standby Softwar=
e Reset)
> > > > address space. While the CPG/MSSR driver is already implemented and
> > > > functional for these SoCs, the integration of SYSC adds a layer of
> > > > complexity due to a cyclic dependency:
> > > >     - SYSC requires CPG: The system controller needs a clock to ope=
rate.
> > > >     - CPG requires SYSC: Access control registers within the SYSC c=
ontain
> > > >       bits necessary to control the PLLs managed by the CPG.
> > > >
> > > > If implemented as a completely separate top-level system controller=
 node, we
> > > > would face a cyclic dependency between the CPG and SYSC drivers dur=
ing the
> > > > boot process.
> > > >
> > > > Proposed Implementation
> > > > ----------------------------
> > > > To resolve this, the SYSC blocks are represented as child nodes of =
the
> > > > CPG/MSSR controller in the device tree. The SYSC regmap is register=
ed
> > > > directly against the CPG device node. This hierarchy correctly mode=
ls the
> > > > hardware address space while allowing the drivers to share resource=
s
> > > > without deadlock.
> > > >
> > > > I am sending this as an RFC specifically to get feedback on the
> > > > implementation of the SYSC as child nodes of the CPG to resolve the
> > > > dependency cycle.
> > >
> > > Personally, I am not a big fan of subnodes.  I assume you are using
> > > subnodes because you can register only a single regmap per syscon nod=
e?
> > Yes so that the consumers don't have to specify it by indexing.
> >
> > > Would it be possible to just extend the existing clock-controller
> > > node with two more reg entries, and expose them through a single
> > > combined regmap?
> > >
> > That should be possible. Or would you prefer just to extend the sizes
> > and create a single regmap for it?
> >
> >                cpg: clock-controller@80280000 {
> I wonder wether we rename this to `sysc: system-controller` but the
> compatiable string has "*cpg-mssr" postfix.

I think the current name is fine, as clock control is the main function.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

