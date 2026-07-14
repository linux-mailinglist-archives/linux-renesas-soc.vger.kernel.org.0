Return-Path: <linux-renesas-soc+bounces-35207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GFDxMDM6VmpA1wAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-35207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:31:31 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9709775526A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 15:31:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=B4l90eyf;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-35207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-35207-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7EFF7301F9B6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 14 Jul 2026 13:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC28830DECE;
	Tue, 14 Jul 2026 13:22:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2D02FD7C3
	for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 13:22:24 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035346; cv=pass; b=CzCheFkF/2d2Qckw8O/2tD/jlXbZKUjaA/TwrIqdp4eAy9a9pPhTKzFpaCqSwjOwcIsQHmjufS1PY6tNI+S0gCtKUMp+QP02du5Dethiqi4pGW5tDG0nSrLzUVN0DTFnW3euIAiwkJg5mGpHQ7v3F5q9azNWesc3sruUKovfHaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035346; c=relaxed/simple;
	bh=7EpWkjOIX2bvUj7bhrZlFgeAZ49Zdzo9NleFTDfsS0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNtJMY7YHcTzSOJV2xvQgvw/k2krUvYAsA/jtCmnPEFzGH3nODJqdwR5HWaJO+D2TVhOLf2sVPcq9NWfAIE4gHWSmxWs+WbZyyKJ6EXwx5XYmX1cWu1M4uSJxPaptpeg78UVUgHk+7jqyV6l9sSd1DmeGptUx8vWLHLMbUbzE2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4l90eyf; arc=pass smtp.client-ip=209.85.221.49
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-476a130c138so985229f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jul 2026 06:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035343; cv=none;
        d=google.com; s=arc-20260327;
        b=q/KgSe/1y+s1KOROHWDo6xWaH9PrS5JPesI2NQi4dvwJAAh3SCspQOKJrofQXdNMfR
         DH7IC0ZNQPV6YREEXUfs/O+ByfUgGpntqa0epk/MyuCloDkwDU+adpkivzd/6f3g3RLa
         6nLRaIRfsMiROvJnbd7oDY9Jw3FnUopdCuhDnf4vhJvOj6t1da8lk73L6YAEBmNK3PTd
         48C0+gZ+QFAA3I8WF78v4UpgUPZ8XFcQnFu2j0AaJwAQYXAbbVNzv0IGXpA1+QARKZL1
         HVcqcANTk/MTmvIHHLB6/0fvRMvvWlkg33C91bPxcal++5jBvY0BHypyG3yo7vo8YOij
         6nsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gd9QWw526oknp7pc7L5j5Qo1NtCYrA+LbHXHAVKWIIE=;
        fh=gUbTP/NAg9keQ98FPliRZMhjipkamXaO+MA7J5TJB8Q=;
        b=k3QjAnO58I3uddcaI4j8qUJzu9l0BFq2SU+2myUe8AtQx/In0inRTgmrnWRJIKseL8
         dVT0CfhdQ7MB9cx57DsdIkbP/PZdpxOi8fTE80rLML8FD4yEY48+8YNhIuUUt/bCfYWe
         sPAfthMHCA/LZzwUGnnXT5dZfU0oaOI95osexwLv4NQnZB/Y5B1NqpYejjbF5kFe7/QC
         nH6UBTvuRUx4hSRVP43okdMU6vVgzTmYzAM8qIJD5KM1VKNmHkKIq4RCjryCa3mK35Fl
         AEVIHeEHHKJmKjFGZMWmH1pqYuhJvBlksjCGxLO5tYQOHQGTm/9Z+5YNNBApsgOpSCCf
         M/+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035343; x=1784640143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gd9QWw526oknp7pc7L5j5Qo1NtCYrA+LbHXHAVKWIIE=;
        b=B4l90eyfla2j6MFR41xOPXv7A4x1XRFSzPN0nowphIxuDh07m0WEWw0M2Sye1SgRy5
         Z7cGxEZTPj37pONqjgCqZ2CxMMSdgLvnZkXNya4mO4/NlD2iNFyuZPtAN7s5nHczZeYk
         hBcsI63u7ss99EzSNJBihvSHm2IERdi5suzh7ED1a35P448C6ldyms8MaCwskKGD0EC/
         SeJZLrdRxykA0fDTz8TJXSDys7cEaZQC9i4et2F9WEm5lcnkd7z0GBq0yJdBoaw4tIaJ
         bV33eXOaS9cnT+XJ8UipXMLXlrzd3Bqzn2tQT6JysybKRizKt1NPeiXkDwjZ4e5+PMAu
         4ryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035343; x=1784640143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gd9QWw526oknp7pc7L5j5Qo1NtCYrA+LbHXHAVKWIIE=;
        b=cSUHn1n9ZXhbWRl9UH9ToBVaKIOUsHokid6sqKwMaomH77LspA4ohM3184dMMkkQGK
         DATaCMox5U1gakDI03VeeHJELbRWRxhGQvxfASOk+pEUvyog3g6FZJd/gDMCuzpifM8m
         /aDHw2rXB3VbLDU0u6W+KRhvNcmtLQLAciZpUlwH4tou4EIMVV5tCsVIhCjw3+uUDqqw
         5BUbMFglGgds0L9yCIDN+EvNWP6stOIM5PRhgxY0K1mZpIIV04x0pcMQbz3AEMSjxFIr
         CiXuQvpQsbgenY5D/7eEIlG4CrgwFPUakmX/NPOzvLfNg1KFz0J1kkkQHYFMnmXN06Lv
         xfuQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKK+uVMqfKypdWe8i9m/OkF37zzt0QhIZrtHtLdnFdCDqxzLr/aBnPqkUukC7WpHLw5SQadqp/5UQ/tRDFiV6klA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+C+pa7qsQvZSie5UiMEr1mwbHoCMcm4+CNHyN2qFErFEznO5y
	Ls3iLO5Ly94MThtZrkIgLio3DbrNE56Yj60mInRDj/b8CPLBv6w4jpsNAsV2DY97p/CAM1nkO3i
	S8iwmJlxmBSrSN0dil8/wO89++MZWeVA=
X-Gm-Gg: AfdE7ckE8RqA96mSmeypMFbERgYh84hdHXQZkLh3qxpL32UEKN8Giwyo0SHGfVNguuS
	lZvVIXV+ePrGlg26PZrsnp4pLn6ouSKvenJLPEfU2xhMQJFHQK2YFRQqGkkhjJD+YwXo3RkYQPk
	6S+fWHB8R5bSnmt0xIBPubMlSDeIbI/COgTJnXjcxttjvtSNv2TJzcMwU2iy4VyQU3Oi7+U7qMk
	lu2wW5itZXLyOPg+88MHu8P/VujmsWtouENOAX0RnDtxhyGkk/BykHlReC684AqY5tEzzQEIdXf
	IKoLCNyqai+cy6Vsby18RmqxaW5uYkkWw87y17jYPme/1GLRG3ibG600juM=
X-Received: by 2002:a05:6000:612:b0:478:65a8:262d with SMTP id
 ffacd0b85a97d-47f2dcd1a6cmr15559441f8f.9.1784035343221; Tue, 14 Jul 2026
 06:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260702123112.161160-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz4J5eEPMQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz4J5eEPMQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 14:21:56 +0100
X-Gm-Features: AUfX_mx629uzNMG8Nucw8hUhgYkDfx2F61U6edckb4KFpd8R3v5p5R-Ssz_7kJI
Message-ID: <CA+V-a8uWMJo8-WaFiXJQDs97gsrAEJG0-4PYgsp8J1LMjxd4-Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/9] dt-bindings: clock: renesas,cpg-mssr: Support
 RZ/T2H system controllers
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
	FORGED_RECIPIENTS(0.00)[m:geert@linux-m68k.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wim@linux-watchdog.org,m:linux@roeck-us.net,m:magnus.damm@gmail.com,m:p.zabel@pengutronix.de,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-watchdog@vger.kernel.org,m:prabhakar.csengg+renesas@gmail.com,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:prabhakarcsengg@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-35207-lists,linux-renesas-soc=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9709775526A

Hi Geert,

Thank you for the review.

On Mon, Jul 13, 2026 at 4:50=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/T2H and RZ/N2H SoCs features system controller blocks for low-po=
wer
> > management and access control that reside within the CPG/MSSR address
> > space. To properly represent these hardware modules, allow them to be
> > defined as child nodes of the CPG/MSSR controller.
> >
> > Update the CPG/MSSR binding to support child nodes by adding
> > system-controller child nodes using a patternProperty, requiring a reg
> > property and a renesas,sys-block property to identify the controller
> > instance.
> >
> > Restrict these new properties to the RZ/T2H and RZ/N2H SoCs to ensure
> > existing bindings for other Renesas SoCs remain unaffected.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Updated commit message.
>
> Thanks for the update!
>
> > --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > @@ -99,6 +99,41 @@ properties:
> >        the datasheet.
> >      const: 1
> >
> > +  '#address-cells':
> > +    description:
> > +      Required for the RZ/T2H SoC to define the address space for chil=
d
> > +      system-controller nodes.
> > +    const: 2
> > +
> > +  '#size-cells':
> > +    description:
> > +      Required for the RZ/T2H SoC to define the size of the register
> > +      blocks for child system-controller nodes.
> > +    const: 2
> > +
> > +  ranges:
> > +    description:
> > +      Required for the RZ/T2H SoC to provide 1:1 address translation
> > +      from the child system-controller nodes to the CPU address space.
> > +
> > +patternProperties:
> > +  "^system-controller@[0-9a-f]+$":
> > +    type: object
> > +    description:
> > +      System controller child nodes representing sub-blocks for
> > +      Low Power Management (LPM) and Access Control.
>
> According to the documentation for the PRCi bit in Section 11.3.1
> ("PRCRN : Non_Safety Area Protect Register"), the low power consumption
> bits are in the xx28_xxxx blocks?
>
Yes the low power consumption (MSTPX) bits are in the xx28_xxxx blocks.

> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +      renesas,sys-block:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Index of the system controller instance.
> > +        enum: [0, 1]
>
> I am not so fond of such "index" properties.
> And of subnodes ;-)
>
The intention was to allow consumers to easily specify which sysblock to us=
e.

> > +    required:
> > +      - reg
> > +      - renesas,sys-block
> > +    additionalProperties: false
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -126,6 +161,10 @@ allOf:
> >        properties:
> >          reg:
> >            maxItems: 1
> > +        '#address-cells': false
> > +        '#size-cells': false
> > +      patternProperties:
> > +        "^system-controller@[0-9a-f]+$": false
> >    - if:
> >        not:
> >          properties:
>
> As RZ/T2H and RZ/N2H are rather different than the other (mostly
> R-Car) variants, perhaps it makes sense to spin them off to a separate
> bindings document?
>
Ok, I will split this up in the next version.

Cheers,
Prabhakar

