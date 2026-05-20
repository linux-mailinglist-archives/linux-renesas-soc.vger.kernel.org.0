Return-Path: <linux-renesas-soc+bounces-32878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WILNFuzZDWrE4AUAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-32878-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 17:57:32 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B236D591551
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 17:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62AF4335F152
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 May 2026 15:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD3D53EDAB1;
	Wed, 20 May 2026 15:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8sogdFH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF82B3F23A4
	for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779290292; cv=pass; b=VmJ64yXAajOXwemiJdEmoXdfSPrTtaH0DxzMuXWQwkEs4+aERi8q7q6MMWARsyB13f3No72RrySnaDlfRZhQrJM4MGVvMx0rvfvV1/7eIL5gFIw8+MisqoUi/2dTm9zkTtqmVR74XFoTRh3ok88bZLW1l78uBV/r4fvKCvxHJfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779290292; c=relaxed/simple;
	bh=eiOOIR+BuCgNoFXzdn/1KJetRl3m/Y+Ifs/Wqtp9Tg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S3FlNHHjzHXSJ9L4j5QEPY175IhIbMA3fgfi+LHbIq8796+HVKY6ar55YXaK7FynOvXn7WJkUYs4k1Q03f9wlQCgUuATXAHzvbi0ExKE0yicxyweBw862mpxHoggML2LoroxpvBEzq4Qv6h3gl+WCnjxljSkBvnabr1MTB/DT78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8sogdFH; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-67c1e0229acso8397428a12.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 May 2026 08:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779290289; cv=none;
        d=google.com; s=arc-20240605;
        b=VA0pmTfSiH5X02hEUlq6FeN4KxAzDJ0pGxYXAsedmbQL8whH/CX6mxRqU7JUZadCo/
         lSwLBRB/Dol6MN15R1oTft3xZO3g8EidDLFI78pMcqsKh8KchyKWPGJHcrqKOUNdTLG5
         6k73jLnsqimFGrrSvbaEnBYkb36mYjb5yLEDiYiVMyxM8YkFtfNnOHM+Mrt39grx86lb
         59EO8OJcWZb9na1kxvoshX3h0uZFbo8wt3nHTtS72bhYUtAj9Pw27O/CrRm2JBxAI3XO
         v1mU3Iwm3BImqtKcMuBXroQwH8eUmcIAlcapbaNcvTSy4GD+Yw9gYt/aAvFMqxhKnASB
         Ux/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m9qLByd2PzQi0vKZgnHfAth5+WLU5IX+PErom9/qoQk=;
        fh=LPETfHsywPJOkT/QhMcXK/EdJyKSNvkOIeOXdUndzU0=;
        b=Kba9lHvmsQvlc9dgfM5bWxVw32yLpzAFjsLMHsvd569bEwisoMOanLx1aj7PI0x+7n
         BqnYy8n/UBzEKCg0mDlnM4HJJZ7BuKpUEA5Z+kMPGwcXV/vFRT29P6YXU4/1K5vOZyTn
         TO7dMK6dIjdsTeI2OuDhagzsf69W6w1bwKmnHi5NvM2Gf+/ozXWE2LhZ+n5DNRVm8RSQ
         4ONiTMsUJx2C3X94xoTkcxZ59EvLH3r95DSy9OpGNKQed3fw1yoeq8ieyS1JOxspoQ4y
         UDAAhclotQmxi/KqJYmxJuKvO3e53o5XFkh6rEACQ6Uu14kqGHWGaiDGC6j+wGx+0uNw
         zkzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779290289; x=1779895089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9qLByd2PzQi0vKZgnHfAth5+WLU5IX+PErom9/qoQk=;
        b=h8sogdFH2cYt4F/ShN5FoLrwrLKsUN5lhQEpBx3CYNijo/kidvmkwn+AVnCC6cryw4
         jOGh49qn2vQRvIzlx50T46iavk7ghjO8Amvr4MRtsi8bbB01HTEzAbw75Qxb33OjTxNc
         5pbij6JSFLFhUqIXzYTmr7rEVu1RpyWwUwWs6PYsivM/Q6hxKyClHE9Uf9q2ls5vqmXy
         r1qb6HQiAi6rA1cWUefkA7Wfqlax+Fqrt/m2cqmIMiHv4gQbBAFdIPah7aX6J2MSDhYq
         X1a0tRAG6t5oL+ZHzOiRvI9cpF2XCM8EkgB4cClok31AbVYQcp1jWxTaVfY9xNCaPVHx
         nFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779290289; x=1779895089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m9qLByd2PzQi0vKZgnHfAth5+WLU5IX+PErom9/qoQk=;
        b=SlkSiVGSog5HXF+SCw8XVxXYW0p4Yah546o83YqksVX/XxFN4vXCpbSSo5FZ5SK1KO
         XYfsDs12whb9WtqMA7WYlE9KzXlA4c/z+O4Z/jSPUS8FOIWMqM8lHJpoIPLeot6Sq/3d
         jfYSskiC9wHTo/Yr4Es67APJRD00Vnrvz2VtCZYl85MTIF9LHcL8wrEH4El03yYtQL69
         baKaB1SA3xu8gliv7MZTJ5/QGhkBFbYSIT5XM7sIyXLDPwliKn3frPuPobBIZd53BBmp
         +uBF7/RrmcQH50jcWLHUCqHzyWVrF6abwD+Xbg+URaHekj3v1w0v3h03+XE3zDr0GxuJ
         y0XQ==
X-Forwarded-Encrypted: i=1; AFNElJ+U4Ab6bYjBZbIuds/JvTZmOJmybwHoxItdbJcwewEhUm/iC1UZhTfdUKfSqIn9xz8bVLaVhc/xXMfpJRmvI2eHqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyPrRlQNVqySlj9o7QkZXIMPDIcPiI9k/WimHlr4oGO+FSE2L74
	YnPAMarWdG5/a5tjKaDZbZVkiiCb5QBjZhy2bO0ORjgMX/I1jcEiMpr/ouqJk/V9InV4CGOOuh3
	WvRSg4k8jVXzmEuJJ2j44wbnajkfsn1c=
X-Gm-Gg: Acq92OECaFkEyNrti0aqWF03/YkW6QYimZpgEog4PYQ3z+Bi1tBjLeVxOBxPdXPZ4p8
	DXysUIRTWTc57DZ0yFedh8Ba4RULZPmi1eIHyre6y4d8r8we4ygOXYVaeS4El9E+31Cf1398zQv
	xiSxhQrrQYnR3PAt7VOZwzrtUTNR2lW9N8Iqru1GdsisOcPIvhRHlR8ua+3rczcJcRA/SjSOH04
	BnKj7mmWZ+NCHE6D48uw6ZDgCG+nquG0h5Yi3+tk6C99JRSpja6j8ZDWVh/TemL4IjKkDSWWjdE
	7llSyGedcvFee3Dq+9M005RRLnN+yyZAwRJqG8Ju88SoKzxxnUGBWxqH0py8BbWF
X-Received: by 2002:a17:907:998d:b0:bd5:5834:1d3f with SMTP id
 a640c23a62f3a-bd558341ef5mr1219917066b.22.1779290288833; Wed, 20 May 2026
 08:18:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518155324.168948-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260518155324.168948-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW1m1bUJY+7AF+W7hZ_zpcBt=nbJivjr-nrmSLBiZv8qw@mail.gmail.com>
In-Reply-To: <CAMuHMdW1m1bUJY+7AF+W7hZ_zpcBt=nbJivjr-nrmSLBiZv8qw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 20 May 2026 16:17:42 +0100
X-Gm-Features: AVHnY4JybpRBzBUvxwIH8V6FnXAx2_urpMr8NNxvoYafQOv4Ri8o8_Tz826UNqQ
Message-ID: <CA+V-a8uY0Bit=3g-3ZMB+nDyMXoCqHuqQiusi-c29DWMfWHJ_w@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: PCI: renesas,r9a08g045-pcie: Add
 RZ/V2H(P) support
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh@kernel.org>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32878-lists,linux-renesas-soc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,google.com,bp.renesas.com,pengutronix.de,glider.be,gmail.com,vger.kernel.org,renesas.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-renesas-soc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,renesas.com:email,linux-m68k.org:email]
X-Rspamd-Queue-Id: B236D591551
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Geert,

Thank you for the review.

On Tue, May 19, 2026 at 7:57=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 18 May 2026 at 17:53, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for the PCIe controller found on the Renesas RZ/V2H(P) SoC.
> >
> > The RZ/V2H(P) controller is similar to the RZ/G3E variant but includes
> > additional registers and configuration bits for PCIe lane control. It
> > supports multilink operation configured as either a single x4 link
> > or two independent x2 link controllers.
> >
> > Unlike earlier SoCs supported by this driver which only feature a singl=
e
> > PCIe controller, the RZ/V2H(P) SoC implements two controllers. Both
> > controllers rely on the system controller (`sysc`) for configuration,
> > but the required registers reside at different offsets for each instanc=
e.
> > To correctly identify the controller instance and map the corresponding
> > system controller registers, make the "linux,pci-domain" and "num-lanes=
"
> > properties mandatory for this SoC and restrict their values according t=
o
> > the hardware capabilities.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
>
> > @@ -235,6 +238,20 @@ allOf:
> >            maxItems: 1
> >          reset-names:
> >            maxItems: 1
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: renesas,r9a09g057-pcie
> > +    then:
> > +      properties:
> > +        linux,pci-domain:
> > +          enum: [0, 1]
>
> Sashiko has the following comments about this property[1]:
>
> | Is it appropriate to use linux,pci-domain to identify the hardware
> | controller instance?
> | Device Tree is designed to describe hardware rather than software polic=
y
> | or configuration. The linux,pci-domain property is an OS-specific hint
> | used to assign logical PCI domain numbers.
> | Using it to identify hardware instances strictly couples the hardware
> | register mapping to an OS numbering scheme.
>
> and
>
> | Does limiting this to [0, 1] cause a regression for valid software
> | configurations?
> | For example, if a board with multiple PCIe controllers assigns domains =
2
> | and 3 to these instances to avoid conflicts, the binding will fail
> | validation and the driver will fail to probe.
> | Could the hardware instances instead be identified via standard hardwar=
e
> | descriptive mechanisms, such as their physical base address (reg),
> | standard aliases, or by adding a phandle specifier argument to
> | renesas,sysc?
>
> dtschema/schemas/pci/pci-host-bridge.yaml states:
>
> | linux,pci-domain:
> |   description:
> |     If present this property assigns a fixed PCI domain number to a
> host bridge,
> |     otherwise an unstable (across boots) unique number will be assigned=
.
> |     It is required to either not set this property at all or set it for=
 all
> |     host bridges in the system, otherwise potentially conflicting
> domain numbers
> |     may be assigned to root buses behind different host bridges.  The d=
omain
> |     number for each host bridge in the system must be unique.
>
> In the RZ/V2H case, the number is local to the SYSC instance referenced
> by the renesas,sysc property, while linux,pci-domain is global to the
> full system by definition. Fixing the numbers to zero and one works,
> until some other controller in the system has conflicting requirements.
>
> I do see a future case where this may break: if Renesas would release a
> new SoC containing two RZ/V2H dies, there would be four PCIe controllers
> and two SYSC controllers.  This would require two PCIe controllers to
> have linux,pci-domain =3D <0>, and two having linux,pci-domain =3D <1>,
> which is not permitted.
>
Agreed.

> Hence adding a second cell to the renesas,sysc property, to specify
> the base offset of the PCIe-related registers inside SYSC seems like
> the best way to go?
>
Ok, I will change renesas,sysc to use phandle-array so that we can
pass the controller index.

Cheers,
Prabhakar

