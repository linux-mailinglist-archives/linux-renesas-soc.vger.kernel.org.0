Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB1C819FAFF
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 19:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729387AbgDFRGV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Apr 2020 13:06:21 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:39419 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729369AbgDFRGV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Apr 2020 13:06:21 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 325775C00DE;
        Mon,  6 Apr 2020 13:06:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 06 Apr 2020 13:06:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=/Lzv8kkLpHF7KEkC03gWCBEbGdy
        eh40gc5Bji/fWTYM=; b=lf6JNRUWHYlCTNX5iy9Mbg+XEr5qr5VldpB/VuvIeKW
        s9Hn5kGcNgqErjar6SUGDb2J6W5Y3qI/atzOtjuBhbXITtBjWdI8Nl9G2vdlWL4j
        p5xYCHKYHyw70nxA17ggAK1umqbQcxpBKSIPiMIsimi5m7iRf2mfyuzl7hxjqhQ+
        SQQl3Vf/TM2smq5gpRA/acnfchho2DlvJDpptESqcH2sG51b3/x1T6f8Bk0rWKDZ
        fUJAXAtDPi9x1GW7EtgdrtGb+PL9E2zHfVqPsO/9LviQA759NcfvD1UZffNQIizq
        VuNo/CQqN+5PX4tCzp6eJ1LzwDbkqF/XnkcRizWH9QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=/Lzv8k
        kLpHF7KEkC03gWCBEbGdyeh40gc5Bji/fWTYM=; b=jwqO12Z59Car32DsUVCZ8b
        Z8wKdBVb8oQTe+4JvDe3Iqm2UBXVlv3ZU/XQqLPhy7e+qQtoJWMGyznzLulAxBRf
        TpSYLizrvQ7XzKr0tnQTVOsFhLGSaJvaJjCIDrl2ZXcENsA+7XjMeA+4+32UpJOf
        Ulb7+Qf7Nj0RtZSxOn8hcPv3xUcraxXb7Ifukx4dEhx1RV6BbWAPmRWMqzCF9VR3
        QPktvECIIb5cEJqy9K9UkeO13KOre6aK4PrPGvXe4YHSQMIZxjiDT1ZVYu6tfGj1
        CjBQTF8tY4KeR4Xd/wP3P9PsTncdYrUfDlflMjxVkq+bBiiipyqb0VYR9kERUnWw
        ==
X-ME-Sender: <xms:i2GLXsVVIIUBTqWgxmxBumR0k2flXLEyPOrcyDXmTxUXfUXGj2KhAQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudefgddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
    drkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:i2GLXlRq_hGXHVv2MdkobdJr52P9UMn3tZG41inMpMLQGFOA17vuOw>
    <xmx:i2GLXoSgu1W4qRfMBCxWrdbuM9K3DQufoSjvHsfP5G7sziCKJhq_SA>
    <xmx:i2GLXvEcfbc56e0svgMVpITguOt39ZhkLEPrM-fqbO06KlbsMLQ68A>
    <xmx:jGGLXlPujvAggqCKKzw3ya6MZ2v83Omy4p6CKbpdqdWVWFkuWJcX7w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        by mail.messagingengine.com (Postfix) with ESMTPA id C9373306D44A;
        Mon,  6 Apr 2020 13:06:18 -0400 (EDT)
Date:   Mon, 6 Apr 2020 19:06:17 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <mark.yao@rock-chips.com>,
        Sandy Huang <hjc@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH/RFC 2/6] dt-bindings: display: bridge: renesas,dw-hdmi:
 Convert binding to YAML
Message-ID: <20200406170617.uryn53wv62cbjwf5@gilmour.lan>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-3-laurent.pinchart+renesas@ideasonboard.com>
 <20200406075705.a67tjx7jamdvqpl3@gilmour.lan>
 <20200406112856.GE4757@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="p57vkc2fwadv27ss"
Content-Disposition: inline
In-Reply-To: <20200406112856.GE4757@pendragon.ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


--p57vkc2fwadv27ss
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 06, 2020 at 02:28:56PM +0300, Laurent Pinchart wrote:
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: iahb
> > > +      - const: isfr
> > > +
> > > +  interrupts: true
> > > +
> > > +  ports:
> > > +    type: object
> > > +    description: |
> > > +      This device has three video ports. Their connections are modelled using the
> > > +      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
> > > +      Each port shall have a single endpoint.
> > > +
> > > +    properties:
> > > +      '#address-cells':
> > > +        const: 1
> > > +
> > > +      '#size-cells':
> > > +        const: 0
> > > +
> > > +      port@0:
> > > +        type: object
> > > +        description: Parallel RGB input port
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description: HDMI output port
> > > +
> > > +      port@2:
> > > +        type: object
> > > +        description: Sound input port
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> > > +      - port@2
> > > +
> > > +    additionalProperties: false
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - interrupts
> > > +  - ports
> > > +
> > > +additionalProperties: false
> >
> > In the case where you have some kind of generic schema and then a more
> > specific one like you have here, unevaluatedProperties make more sense
> > that additionalProperties.
> >
> > additionalProperties checks that there are no extra properties on the
> > current schema, which is a problem here since you have to duplicate
> > the entire list of properties found in the generic schema, while
> > unevaluatedProperties checks that there are no extra properties in the
> > entire set of all schemas that apply to this node.
> >
> > This way, you can just put what is different from the generic schema,
> > and you don't have to keep it in sync.
> >
> > It's a feature that has been added in the spec of the schemas that
> > went on right after the one we support in the tools, so for now the
> > kernel meta-schemas only allows that property to be there (just like
> > deprecated) but won't do anything.
> >
> > This should be fixed quite soon however, the library we depend on
> > has started to work on that spec apparently.
>
> Should I postpone this series until support for unevaluatedProperties is
> available, to be able to test this ?

There's no need to wait, just put it in and it will eventually be
checked. And the time between now and then won't be worse than the
current situation of not checking anything at all anyway :)

Maxime

--p57vkc2fwadv27ss
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXothiQAKCRDj7w1vZxhR
xdVTAP4laC3rQPa7F72sLOS81gOVBqHyAuxuIZGWzQs1wG70swEAmG0Nph4gerBd
OqkdNzncoK1Flv0SGeJ/D/eaJLhCWwg=
=5keg
-----END PGP SIGNATURE-----

--p57vkc2fwadv27ss--
