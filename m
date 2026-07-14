Return-Path: <linux-renesas-soc+bounces-35219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xcTuBpppVmpk5AAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 18:53:46 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F24E7571F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 18:53:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sUB+07b9;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35219-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABD5531382EE
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 16:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034854D90AB;
	Tue, 14 Jul 2026 16:51:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0B447DD49
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 16:51:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047872; cv=pass; b=r3qxGELqJQntc7DGw44VEOB6yND6JnIFfsiAFa+AVQaUjSzYK+TYwscgf73iYFDuLjqo7UNL92GQLMbZx3nD+QcBrVRIYZXAyjYg1nZNxrAQxlYe5qQ7UR4yPDA2lFBDymHcriBVltHWcvv7/RSNCDavAFhTq4UKWgR6q3UYung=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047872; c=relaxed/simple;
	bh=UKuXmnxAZy4X4Zfjms3mGb3B8NsNDeeH3MZJWfiGhEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XodvooVKeTyxHG/054xKPcsw4titgtVHBJg3Z9alnU1G8lWV/xr+JuDBDi/jly0h7lAzFnPCU469sG8Iiw/oLjjFHo0Zh2+w7I37E1ZTPQ4n8vOVDBdKkG0reCWDz+geBTfo+eo2MDvSh4KTCqmFh+u4EYZeaoJ30zo0TtXgfV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUB+07b9; arc=pass smtp.client-ip=209.85.221.53
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4798bea72f9so2476955f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 09:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784047869; cv=none;
        d=google.com; s=arc-20260327;
        b=pndckRr+4Gksaxi20wEIo6WtIui5G5BM41Wc622KxcHDeH9nVbUPMWxqYmk2sa28dy
         rQERDOhr71z3thmePPXOIOSlVX4dUpYfdjPJ2lUTrNASRSrFGevfO5qsirroonSSpO7c
         kH5rRGbwC7tj7QYs5L0gFimGFpimFt6DZWgm6JyFQwuXiKr7vI4Ja2hEEsEc1cF673Sk
         MXytiOGZgb3HMzTvkGma80jO4P4NMHExyXXnLtqPb5+LwBeRnUusXUxbfvwmcHOsUEWC
         0zJNGU3kt1j7W1Bv+Lk3OulS2f80S2deeqWUqomvFvsDvTVfOD3wWSn7KQYXEoF8PtHj
         dMoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8BlgmiFQrHiuTd+MM0CeF9cu80lrra6/Pp38WzQSYbE=;
        fh=EVMTIilDBEpQYw7s/mCbxhzwDlWlfuzN/C/0evwvlQ8=;
        b=lNpZZad1Lnxd12Pzn8AE5IjHdWhlSdemz3IMoGN4Ubi1svgEmfvOcaI/SnOkU6SCpJ
         SZOgeQcy7I74/SoBweqw95V5BL/fqShrlyOpno6WuNScMOzhkSetryRZCbcTP+UMN65j
         YuLiyg4tPjHs8ASAG1EGkIaL5VC4mmZP/acU0dO2yAuxprI68KO2R5OIdwFZgBD5+TPO
         +YPt9Yhg9KJOZ8duA7KCUdNxyBEIVfXGnfzGGg18/5YNfKRCdl7pOtrO9Uu6ahZDOr1A
         U4d8hzL5DAkmeGHxcbcXN5fWD1NVG4msMnnpT4H/RHHgHUoCfJWbSBIp6Zh3lJamTWWm
         yK5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784047869; x=1784652669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8BlgmiFQrHiuTd+MM0CeF9cu80lrra6/Pp38WzQSYbE=;
        b=sUB+07b97KGV3ebDMkf0d3LU/JbugGI5wAiuag6v2+UK398tluefGUR03Qt2NGVOt3
         poU3WOZaYSn4pp7yER5a/Tzddw/uxLuMGI+r8BlwLUNOMQpmkEYJ5fOQNP7Rp0zMyeDI
         g4deAY34diw6dPfpcjDMqPsuLXhuI+1fX4H8oicc3qt5mN0Dw6/KHBTch5etD6Dr3LpF
         Vo2XBs61rXFmCWC82PizuiU7IC0sO4juLej9ZePmzKnC3CXA/egtX60IONCorzuqrqx9
         t+T+fSoyeH3ErkF+ezlR0c7Tqpx+FocK+eTnhmz0ZTOTUYKAOcZUUqLhbFWff6hiTyhq
         fFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784047869; x=1784652669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8BlgmiFQrHiuTd+MM0CeF9cu80lrra6/Pp38WzQSYbE=;
        b=NTp28AlMCD32kFW9MzN+KBTQSu9Lekyu5d3jdhKI4GCq2lMb0cXm97dR5+EqBSfTrr
         4tAtmdUFpjmU0n2tI4OZr70s2fwJbLu7/NjtpR86GmRxYnsRNooYT5bv2mm0Ha7aM6Vb
         TDOZNFsIeGrKdHp8z18J1QU1ir077i5apE+H74XXYqnrL37IhvpcAjaNr/eqPmOk3zcK
         wafbbaasS/WNo+vNtKXvipeArDd+FbcJH8jBNrGODN2YiE98hRgaTsMLzz/cZowXvFRG
         5lwOgfWbdY8g2TVTkiYD6BeVSaf2QNSqWLokgOVzqBkKHIKDaAiirJ3J/c8hiee7AAVC
         wtEw==
X-Forwarded-Encrypted: i=1; AHgh+RqtOTxAZWudAIWNP7r3Gyxos7qf2IyDjYWLw9T2TujtbJ9SAYBiPiquJXKc/qG7qxoqw/x+ZkQCSDOBo0Xg50JvDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyhCWDKAQMrOq3fiDxc3RG1hZpuIxPaCZEaFTWD8aRDviJMMK3H
	3UdKhGSlRCcBvSzXGTTTFTQe0L1InP9t/+EjFAzaZ/GaqLAlO4C3/sN9vuTmv8qQdElYeLhvYOw
	jXhgcOSjq7w6vO/e/uBUpCiaajIGpt2AasPsW6gA=
X-Gm-Gg: AfdE7cl0oocQSVrBVNvVDvJVH7w7nf1+b70Jw+6q/d1qDd2S7qe9IKoNusZn5gKht9w
	Z+nXrfXYn91w0qnKw3ym4c2GAzL58Yu1eto3rfJyFLqqq+jh0DG5z/D+O++oYsVv5J+ycV4bGWG
	gXeicMqZd3L75g346kJx91nTkrpQhszumBNnq2VUbFHVEHh7Psm678iYQJkYmFMfHDPtlWFRF85
	0cm2mggftO3aeQRJJf3dk7NKfoShV48Qg35Hjw1LIrjP069Lgj6lFCo+cYtmAE6wB9KMzVa5JV5
	d2UXRy+e/EC7LlDo8aFkkVavKRTfVadaTHRHpSln+kwbq1NufYNahqgvbyjYWeV5LI8e2g==
X-Received: by 2002:a05:6000:46c2:b0:47f:4c49:4318 with SMTP id
 ffacd0b85a97d-47f4c4944a5mr1473055f8f.49.1784047869366; Tue, 14 Jul 2026
 09:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com> <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
In-Reply-To: <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 17:50:42 +0100
X-Gm-Features: AUfX_mwxd6v5gFWCuMlhAPL7PON29wGJJEnO7K61SQDYcZ5CBYFFPz5abzgomRI
Message-ID: <CA+V-a8utJuuwVNy8o2zM5jHf9qXx36S79uKGtYr5O=sASh_wpg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/9] Add System Controller support for RZ/T2H and
 RZ/N2H SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-35219-lists,linux-renesas-soc=lfdr.de];
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
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,redhat.com,linux-watchdog.org,roeck-us.net,gmail.com,pengutronix.de,vger.kernel.org,bp.renesas.com,renesas.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6F24E7571F2

Hi Geert,

On Tue, Jul 14, 2026 at 2:27=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Geert,
>
> Thank you for the review.
>
> On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > This series adds support for the System Controller (SYSC) blocks foun=
d on
> > > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical low-=
power
> > > management and access control functions.
> > >
> > > Hardware Architecture & Dependency Challenges:
> > > ----------------------------------------------
> > > The SYSC in these SoCs is a multi-functional block responsible for:
> > >     - Clock & Reset Control
> > >     - Low Power Management
> > >     - Clock Monitor (CLMA)
> > >     - Access Control
> > >
> > > A key architectural detail is that these SYSC blocks are physically l=
ocated
> > > within the CPG/MSSR (Clock Pulse Generator / Module Standby Software =
Reset)
> > > address space. While the CPG/MSSR driver is already implemented and
> > > functional for these SoCs, the integration of SYSC adds a layer of
> > > complexity due to a cyclic dependency:
> > >     - SYSC requires CPG: The system controller needs a clock to opera=
te.
> > >     - CPG requires SYSC: Access control registers within the SYSC con=
tain
> > >       bits necessary to control the PLLs managed by the CPG.
> > >
> > > If implemented as a completely separate top-level system controller n=
ode, we
> > > would face a cyclic dependency between the CPG and SYSC drivers durin=
g the
> > > boot process.
> > >
> > > Proposed Implementation
> > > ----------------------------
> > > To resolve this, the SYSC blocks are represented as child nodes of th=
e
> > > CPG/MSSR controller in the device tree. The SYSC regmap is registered
> > > directly against the CPG device node. This hierarchy correctly models=
 the
> > > hardware address space while allowing the drivers to share resources
> > > without deadlock.
> > >
> > > I am sending this as an RFC specifically to get feedback on the
> > > implementation of the SYSC as child nodes of the CPG to resolve the
> > > dependency cycle.
> >
> > Personally, I am not a big fan of subnodes.  I assume you are using
> > subnodes because you can register only a single regmap per syscon node?
> Yes so that the consumers don't have to specify it by indexing.
>
> > Would it be possible to just extend the existing clock-controller
> > node with two more reg entries, and expose them through a single
> > combined regmap?
> >
> That should be possible. Or would you prefer just to extend the sizes
> and create a single regmap for it?
>
>                cpg: clock-controller@80280000 {
I wonder wether we rename this to `sysc: system-controller` but the
compatiable string has "*cpg-mssr" postfix.

Cheers,
Prabhakar

