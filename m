Return-Path: <linux-renesas-soc+bounces-29278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNkLLLG8smmvPAAAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-29278-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:16:33 +0100
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52529272613
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 14:16:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C7B4301F19E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Mar 2026 13:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34DE03C454D;
	Thu, 12 Mar 2026 13:13:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE3E387597
	for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 13:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773321213; cv=none; b=orfn9058LaZwz6Ko85UKzX/42czwjyxwYc+Pj7oCs0Ys9vCwIj9m7xHF8jHDPvA+GnIxhUBIhut3uIafuIpaYw78MNCGn9Pw2RA0nUuF9uCDmXCln4/RMauXACgZeSU3eTVwUsgmRzEex/2YJWXHjuvELRg6E4MfCiBel1vHZgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773321213; c=relaxed/simple;
	bh=9Xf09/CQRKakxUM97o3pjEHQxlgCJx2m/hZtTEYbHSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GIHBu7PlJa+4ZX+rXy6NBPrEgYzmQSQoKH/TFwiNEbBtVQTadCJIyfvHBDAQLDvFEJ37dZ1alz/AyCKAQ8QZ19+hcByVj2jMu6lZUB/0eheJ+Y8NXXw069WRM1lHbM6BL4/WIinsC0dZsLQuhv1qrZxNzbUixGj59/JbtaNq83U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b96e9c59339so143188266b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 06:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773321210; x=1773926010;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=udEH6r8HyARkgcp8nLO9sBcamtg2WZj/AdfmCmcqat4=;
        b=YTj0vi199V4AHP2Q7x0yHi3K/Wa+Tx86z3vQ6UPKSC11htYLP2HVsvU7rWjLW3Nud/
         HQooZBCcHsI4HUbiRNCe6rcBR+P9kiNm+3tCRxmNfu0MTJFNem82+7yfa1PfT63rc13r
         IVNEhXKgavu0U/lm8oxukZELB38PXK12nBXVapeIVZNa2loLASLOiI/GA9jAjPgb8TRX
         jXndjmom8NArIKz5MuqqMqelMVGgRX6UO3r4fdMogDQOGrD1QAdZfpX8QP6UvP+Aa8jp
         QZBxVKk8qr7LkaIT8FMPWivT8TiW96HivzXZ4h9WU7eoEVROSSKZUQ4FDoIswqBGk8Bf
         KE9A==
X-Forwarded-Encrypted: i=1; AJvYcCUooKL5vaEy5gFJbRa3z681uhK+/l/pkco6aDymjTkSKdAQOupQekVP4IkLaHzgMsTCy8awbQ2MRkaSrIDbzb8eYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIZ6Y90uslYIx7WsNDn/77Em0i2tZ7HIp4TMcUjwHhIgJWo3P0
	9Xd1L57bl5LWw0xtygse1J3vE0f/taNvDP4koQ7ex1MhAKthClFA+nludP/Pa+x7Fo4=
X-Gm-Gg: ATEYQzy3BUEwBAUk6srua7OfXYZYDKsE12U7TluekxJnoyQH2qU3KZyu9GnXg2SYobO
	I8+Gdl+PRmpsz5VTtXeoXQnHDwkzx4ByjAb/bSzaGPLGvCJrNRrytN8GfXgqmfn63LkkmZYmzNG
	lATJZiULK7h5cKJJ0gC6FjZ0ZvZ0Zsg84KpHrHEMZikqcgIP2u0UmmNAk9+4vkQf3qrozYsdbIH
	+Dbfj76PpILCQUFD4SrKFoTJuQiuSBvHNQj/b8+DtWqzBw9gxzIcpaQUEHwhbFtG33qj5BozRIm
	Yoamz09VGF/+aRwycVxk7m7MP9pT9u0auyhFsSJ4c4fW7Jfl3mppSiFDnelX/JB68MM9ctFMknO
	t7Gb3JVKneWnyizidOqr08SYgRyXQQg3SqmOp0oBOf+hB0/X6fNaL4U7xFa2Ba2/ohxqFFJjJav
	49SkFlNClyZ7c1kkvj56XQZPd9x7K36DtdfOdHAVwkkOYzTf05XG9+Fty8SG7FFWG0b3FU3rY=
X-Received: by 2002:a17:907:72c2:b0:b93:9407:ea5c with SMTP id a640c23a62f3a-b972e5e5cccmr408442966b.57.1773321209994;
        Thu, 12 Mar 2026 06:13:29 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b972e18fff8sm130865066b.56.2026.03.12.06.13.28
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 06:13:28 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b96e9c59339so143181466b.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Mar 2026 06:13:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXxC/Fywiysj6zsvkFY485hutxEK5c7Q6my3akIm70tlooRuRVdidGu9UtFTnG0bwqNx0/mM9ZXAzgzjv4rEzVdgQ==@vger.kernel.org
X-Received: by 2002:a17:907:7b93:b0:b91:2f65:e938 with SMTP id
 a640c23a62f3a-b972e603b8amr390837366b.60.1773321208196; Thu, 12 Mar 2026
 06:13:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203121723.312336-1-biju.das.jz@bp.renesas.com>
 <CAL_JsqJK3brXxSeD-U42PBCeHoxUhWJYho3ZWj__t5C1LL-n-Q@mail.gmail.com> <TY3PR01MB11346B87DF83086FCFE19B15D8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346B87DF83086FCFE19B15D8698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Mar 2026 14:13:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW7GeCF-xTNpRRNEBfzbqUA8ZNqFxctT8zufdRHkvSiAQ@mail.gmail.com>
X-Gm-Features: AaiRm51xpIeuv2QHPm735sslWhSiZm3fYb3vmdcw6ZXZmPeZ7Qqh0uUgQF8JQ5U
Message-ID: <CAMuHMdW7GeCF-xTNpRRNEBfzbqUA8ZNqFxctT8zufdRHkvSiAQ@mail.gmail.com>
Subject: Re: [PATCH net-next] dt-bindings: net: micrel: Fix dtbs compatible
 too long warnings
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Rob Herring <robh@kernel.org>, "biju.das.au" <biju.das.au@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stefan Eichenberger <eichest@gmail.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lunn.ch,davemloft.net,google.com,redhat.com,vger.kernel.org,bp.renesas.com];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-29278-lists,linux-renesas-soc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,netdev,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,mail.gmail.com:mid,linux-m68k.org:email]
X-Rspamd-Queue-Id: 52529272613
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Biju,

On Wed, 4 Feb 2026 at 10:18, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Rob Herring <robh@kernel.org>
> > On Tue, Feb 3, 2026 at 6:17=E2=80=AFAM Biju <biju.das.au@gmail.com> wro=
te:
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > The KSZ9131 PHY is suitable for IEEE 802.3 applications.
> > >
> > > Fix the below dtbs warning "compatible: ['ethernet-phy-id0022.1640',
> > > 'ethernet-phy-ieee802.3-c22'] is too long" on the below dts:
> > >
> > > r8a774b1-beacon-rzg2n-kit.dtb
> > > r8a774a1-beacon-rzg2m-kit.dtb
> > > r8a774e1-beacon-rzg2h-kit.dtb
> > > r9a08g046l48-smarc.dtb
> > > r9a07g043u11-smarc.dtb
> > > r9a07g044c2-smarc.dtb
> > > r9a07g044l2-smarc.dtb
> > > r9a07g044l2-smarc.dtb
> > > r9a07g054l2-smarc.dtb
> > > r9a07g054l2-smarc.dtb
> > > r9a09g047e57-smarc.dtb
> > > r9a09g047e57-smarc.dtb
> > > r9a09g056n48-rzv2n-evk.dtb
> > > r9a09g056n48-rzv2n-evk.dtb
> > > r9a09g057h44-rzv2h-evk.dtb
> > > r9a09g057h44-rzv2h-evk.dtb
> > > r9a07g043u11-smarc-cru-csi-ov5645.dtb
> > > r9a07g043u11-smarc-pmod.dtb
> > > r9a07g043u11-smarc-du-adv7513.dtb
> > > r9a09g047e57-smarc-cru-csi-ov5645.dtb
> > > r9a07g044c2-smarc-cru-csi-ov5645.dtb
> > > r9a09g047e57-smarc-cru-csi-ov5645.dtb
> > > r9a07g044l2-smarc-cru-csi-ov5645.dtb
> > > r9a07g044l2-smarc-cru-csi-ov5645.dtb
> > > r9a07g054l2-smarc-cru-csi-ov5645.dtb
> > > r9a07g054l2-smarc-cru-csi-ov5645.dtb
> > > r9a09g056n48-rzv2n-evk-cn15-emmc.dtb
> > > r9a09g056n48-rzv2n-evk-cn15-emmc.dtb
> > > r9a09g056n48-rzv2n-evk-cn15-sd.dtb
> > > r9a09g057h44-rzv2h-evk-cn15-sd.dtb
> > > r9a09g056n48-rzv2n-evk-cn15-sd.dtb
> > > r9a09g057h44-rzv2h-evk-cn15-emmc.dtb
> > > r9a09g057h44-rzv2h-evk-cn15-sd.dtb
> > > r9a09g057h44-rzv2h-evk-cn15-emmc.dtb
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  .../bindings/net/micrel,gigabit.yaml          | 23 +++++++++++------=
--
> > >  1 file changed, 14 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/net/micrel,gigabit.yam=
l
> > > b/Documentation/devicetree/bindings/net/micrel,gigabit.yaml
> > > index 384b4ea6181e..284c3ba379f3 100644
> > > --- a/Documentation/devicetree/bindings/net/micrel,gigabit.yaml
> > > +++ b/Documentation/devicetree/bindings/net/micrel,gigabit.yaml
> > > @@ -17,15 +17,20 @@ description:
> > >
> > >  properties:
> > >    compatible:
> > > -    enum:
> > > -      - ethernet-phy-id0022.1610  # KSZ9021
> > > -      - ethernet-phy-id0022.1611  # KSZ9021RLRN
> > > -      - ethernet-phy-id0022.1620  # KSZ9031
> > > -      - ethernet-phy-id0022.1631  # KSZ9477
> > > -      - ethernet-phy-id0022.1640  # KSZ9131
> > > -      - ethernet-phy-id0022.1650  # LAN8841
> > > -      - ethernet-phy-id0022.1660  # LAN8814
> > > -      - ethernet-phy-id0022.1670  # LAN8804
> > > +    oneOf:
> > > +      - items:
> > > +          - const: ethernet-phy-id0022.1640
> > > +          - const: ethernet-phy-ieee802.3-c22
> >
> > To avoid the errors, you would need a custom 'select' that excludes the=
 c22 compatible from this
> > schema (IOW, lists all the other compatibles here).
>
> OK.
>
> >
> > However, I think the correct fix is probably dropping the c22 compatibl=
e from your .dts files. I don't
> > that compatible is useful on its own?
>
> I will wait for Geert's input to drop c22 from .dts files.

Makes sense.

So we should probably fix the following, too?
Documentation/devicetree/bindings/net/ethernet-phy.yaml
Documentation/devicetree/bindings/net/mscc-phy-vsc8531.yaml
Documentation/devicetree/bindings/net/renesas,ether.yaml
Documentation/devicetree/bindings/net/renesas,etheravb.yaml
Documentation/devicetree/bindings/net/amlogic,g12a-mdio-mux.yaml

> > Also, it doesn't make sense that ethernet-phy-id0022.1640 is sometimes =
compatible with ethernet-phy-
> > ieee802.3-c22 and sometimes isn't.
>
> OK.

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

