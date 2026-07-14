Return-Path: <linux-renesas-soc+bounces-35203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qDU6BPA3VmqY1gAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:21:52 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5624D755068
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:21:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=SaGz3NUB;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35203-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC1703238CFB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B703A72617;
	Tue, 14 Jul 2026 13:15:19 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDE61CDFCA
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 13:15:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034919; cv=pass; b=tgXABDyjUTgEGDZwgtSSDRU0zXSfwzTtkGnbRgzN24+yJKgFqeoyWGBRGramSlFRl7iyTnqmksa9kA4bYRgyqoG+C+6aDU/duaf9AdnFWEhstUl0MaEz4iE2gtG1kQ/EWV9D6fpG6bh64S6F/uxA/4i88zdHdX412+/c5ce6FLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034919; c=relaxed/simple;
	bh=XEp4xPrufFEiSkrjh9AXuD4jVVMbyf5wsJtN2q7RBEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnglJ2J2tze2CdvQxfwzF5Rlqs53ddtnSLA3DsVnu2zFDU27cVsY1nQS4aO57i57ApmdpdwFPjL2gMbVHQwbwgJvzQ1BJEsU7IDGD+6D5qAFUTzibxtfESnnJs8Q2y7K9GOp8ZquB6NiXl7Ee/LTslj6xkqX9NSoMgT8weQIGEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaGz3NUB; arc=pass smtp.client-ip=209.85.128.45
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493e8d4f4dcso33359585e9.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 06:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034916; cv=none;
        d=google.com; s=arc-20260327;
        b=KTkdb9TU+qmkbzUAWFQqJ+uasdhbnQTQfUgwoyrQhPFk/nTIutt7/DaFXPCaYMxlwO
         LjtQ16YJoUvX6pktgWIpIRdoFTGrotDm6ov/vKc3JGOZUiAXzOajqLHvyD0KpatuCXmk
         uhwn4BhrGkXntcfa9mJscu2sKqj/jm4f0ubpfM2Akbmrm07cQ6blcZSjqdnnfVH1z1Nf
         ZZqGbMTcbkIi3SAHCZMtnAzxCf+ZlOcCfm4q61bLLVcyFSuftDjBrwUHH3//a6PTs5u4
         NOQTR+AqrjbxJLLd8fZ+WsRaJzvNAQk9kLIxIqTkLQXAFNY3KgtcrTrhesbfgx2+mdQi
         TbYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zYR8riHhwHFuYojsg/ml0oqHNKKCoDuF/KqtRlzn4Dg=;
        fh=Y/pw7g3TFitT4UokM7Mu6s6rK6tu1ytZy5AX6ER+VSk=;
        b=diq/yIb6DIIwBqjvllDrHHslQwwpPMik2Xx+bgllpMo+zbKdwg+vGowqUgqvJu8z5W
         AJl9XqyZSvNW1Uh7Liek4QOWbY1u0jvif2BvI6oLd460/8udjJenm2so3oJTvgSjQPfd
         g/5xZ/xDNPaAEWMqvl9jzSvSICY9NfYN2h0G6yXKA+t5VYcp5YxGy+6k6arfiAt1PGQw
         6EMEvX2LeGzBhQzadIOifdflfvZGutOhXrndkRTZmAPVlnI706rVIhasAeoLIk+9IF1I
         2I2yRzNCn2JACEOONshDz4Ot0gQIRdbO3adAQhUl1PjVtSCCDYuNTfvzstPEc0+MXZCn
         qlew==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784034916; x=1784639716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYR8riHhwHFuYojsg/ml0oqHNKKCoDuF/KqtRlzn4Dg=;
        b=SaGz3NUBQ2GHG8xCmhlhOvvjGUghtG3Ipcsm6tfITrC8ZZnP7nTePufsvZ6cflZpod
         QUizEVUcGU6d3lZddyIMOIv9O1IQh8dsIRjpP9mwPudguyeCdMMrrclFFNEtEBl+AVAx
         gNKfvAEXdo0joezZNbM5vjDxpubz55O09Hq7NJ3t4sGR08aZSdMHP/c/inb9myiKPSdm
         17NC6765bfaG2+JZuS+rXZOQ4WVUICc3rxVqNp+xviP/1lpldG66Be9oCvjI5yzHjtn3
         0rAOq9sF66RKv2BkT/+ls8+LNyuEvHybhO6ch5QhudaEIvhozGg2zYqQfsnytjIhsH/C
         mBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034916; x=1784639716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYR8riHhwHFuYojsg/ml0oqHNKKCoDuF/KqtRlzn4Dg=;
        b=BDuaVPnsT0cHL1BN5gpOXITwrGSGFCPX/9hDRKt19RdQo59kQrM6UgWvSy7w40avvs
         DtnuIKmCNq26ISC6UQTg7XaGahT1gsF/RFLO1GtLdnH7udFd61QqeU7jNO4pQe9Yfrwo
         4UpQhYXyL4S+MSAGYHAzyJT+mB526wzJAsbHvhofSY5er/MV7dYgRyHnCHWuM0GnzsgN
         94gJRV+bBraO4OoW1JltesVr5/8yJE+c4azJIGUHlP5gZeZMEpGMf2RQ5WYwt5WqccpP
         JnDofErTBS7a3UIJfoFpCxVzYH8h6OpkL5j0AwFb42HyNeGlAbJg9yYSr4MryP92crg8
         E6sw==
X-Forwarded-Encrypted: i=1; AHgh+Rrh73EL0BnMdGJnfpG+6feinJ28PInmqwT9fDs1ZUc0HgxDMfJM7sYJHiLB7cT7HM0tYG/aciX7LWk6oYhJIvglLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTIRb1rMRH31McgjRYqw0fQBzmrpWSokdjwBwYTXPabgPnk9ZN
	VAxj5L/q39ttczNk6l3Jz8HhkOt1jdhaSk8xMdRB2ebAsBkctgqt9Bw7Qm15zPvI1gezc3EGY9G
	tzC+wnptLxqzNBF6h4GAkMz2doe6VuTg=
X-Gm-Gg: AfdE7cmsuyhRET5Pjei4dHHbTumHhAAFDpwXspWedRKPbcEYGaCsipmg0wz7lqidz7n
	rL6SeEslI8zfC2JS1kcos3LumqMZkohALwUe+DsJAiLnPJjuhNWZ38HtPzBKuALcavXIoI6GsTs
	rPQ/muf7DddhTAJq8H7RE9SFzdwL0JfpJl/uwcELFm3BUUHj89CiJQoMqhhEbdvjqPFJDswN1Ja
	/++HE6FCN93VhStCm723i4Ru11nnJJ8V0r+/7LWhYFl136nao8y9oqI4UuA3PrT+TesJh88VQBr
	PUEhd52hMMixB3UIp8NTQtjAMpZ+d5EAM77iXL5DKRLohNQh/s6oMj5hOIE=
X-Received: by 2002:a05:600d:6413:10b0:494:1cdd:4f9e with SMTP id
 5b1f17b1804b1-4941cdd5035mr50422985e9.31.1784034915742; Tue, 14 Jul 2026
 06:15:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260702123112.161160-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXYpDfoRhgfhqeU4_acGQj7f4ivEdB3Ms6SKeeSwY5iLw@mail.gmail.com>
In-Reply-To: <CAMuHMdXYpDfoRhgfhqeU4_acGQj7f4ivEdB3Ms6SKeeSwY5iLw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 14:14:48 +0100
X-Gm-Features: AUfX_mxf9CoAWS1OaHlxkRnP3RC1vp9ZjYGgKTNfss75dU2ZLfsEhv632kdc6DM
Message-ID: <CA+V-a8t1TbnD14s-d=UVTL58jWA9Sxcyb6mt9tfgAMBUkoJmRA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/9] dt-bindings: watchdog: renesas,r9a09g057-wdt:
 Add SYS syscon support
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
	TAGGED_FROM(0.00)[bounces-35203-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5624D755068

Hi Geert,

Thank you for the review.

On Mon, Jul 13, 2026 at 4:55=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
> > resides within the System Controller (SYS) block rather than the WDT
> > address space itself.
> >
> > Previously, this was handled by including a second register range in th=
e
> > "reg" property. However, this is architecturally incorrect as the SYS
> > block consists of two distinct regions (0x80290000 and 0x81290000) that
> > contain registers for multiple peripheral blocks.
> >
> > Now that the SYS driver provides a unified syscon regmap, introduce the
> > "renesas,sys" phandle-array property to allow the WDT driver to
> > access its control register via the system controller.
> >
> > Mark the use of a second "reg" entry as deprecated in favor of the
> > new phandle-array approach for SoCs that require WDTDCR access.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - No change.
>
> Thanks for the update!
>
> > --- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.=
yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.=
yaml
> > @@ -48,6 +48,17 @@ properties:
> >    resets:
> >      maxItems: 1
> >
> > +  renesas,sys:
>
> In Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml,
> the similar property is called "renesas,sysc".
>
Ok, I will rename this to "renesas,sysc".

> > +    description:
> > +      System controller registers control the start/stop of the WDT, a=
nd halt debug.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle to system controller
> > +          - description: watchdog IP instance index
> > +            minimum: 0
> > +            maximum: 5
> > +
> >    timeout-sec: true
> >
> >  required:
> > @@ -73,15 +84,29 @@ allOf:
> >            minItems: 2
> >          clock-names:
> >            minItems: 2
> > +        renesas,sys: false
> >      else:
> >        properties:
> >          clocks:
> >            maxItems: 1
> >          clock-names:
> >            maxItems: 1
> > -        reg:
> > -          minItems: 2
> >          resets: false
> > +      allOf:
> > +        - if:
> > +            required:
> > +              - renesas,sys
> > +          then:
> > +            properties:
> > +              reg:
> > +                maxItems: 1
> > +          else:
> > +            properties:
> > +              reg:
> > +                description: Deprecated. Use renesas,sys to pass the o=
ffset
> > +                             of WDTDCR register instead.
>
> the index of the watchdog IP instance?
>
I will update the description to "Deprecated. Use the renesas,sysc
property along with the watchdog IP instance index instead."

Cheers,
Prabhakar

