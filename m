Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7246469DFEA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Feb 2023 13:07:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233736AbjBUMHe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Feb 2023 07:07:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234581AbjBUMHc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Feb 2023 07:07:32 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7011F27D5C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 04:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676981071;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZEuOkrsozFdoPORVuJE/m8NTeHtX1hbGyE+AebQNhhw=;
        b=KBb42NhMnZWA9eeKDxKWnJFzpj/qovwE1N1DhsBLPV0CHSnNi/tSAp65amMay/vwfG8ib1
        n5XxlmSZkjschnTfK4Ga7Bbr58ah3/zFLdgxWdgVdgt75LK365KGSbt51r/AL7IW33pOvA
        MLWNV0oyEyf7WpB3qeAywQxgZBFohwg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-624-QeiI6zYLOjmdjFqy8aFAKg-1; Tue, 21 Feb 2023 07:01:13 -0500
X-MC-Unique: QeiI6zYLOjmdjFqy8aFAKg-1
Received: by mail-wm1-f71.google.com with SMTP id x18-20020a1c7c12000000b003e1e7d3cf9fso1996913wmc.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Feb 2023 04:01:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676980872;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEuOkrsozFdoPORVuJE/m8NTeHtX1hbGyE+AebQNhhw=;
        b=BbnAe0kPv5xQ97gJPEKbaMhikFaDw9KLnYUp7yb/LGEVmemSUCrtsLzUilndUD9Gmp
         VqqLNR9u3tIFvqYg6WJ3qzbaNkciZCxWoCGTihSlk6raXUpvbUYSGsT4cEZcVvj6Uhcj
         DUuLMWFJjfXsZ1RkBUjJxVDAMOUVLWNBUD2gwrB3Pv7Ve8xSrMNSuvdfAfWxcWZtR6EW
         OqzzullMAHyWsn6u2e9uEgAgltKsHwMcpeozpxwFxnZX1jZG/mlkOQsWE5m740MSulu6
         azHi96ACUO6DJSelFOnRb4HNYrS4rqrc2qrCyzQsS3dCdGr79MWSJXGQ7Wr35QAKs65j
         Vx2g==
X-Gm-Message-State: AO0yUKVZV9pqAaBJqK7nX1rQzF6Dvu6SBPxCwcknkNi7IOa8R9205wtA
        Rq9QaQ42qB5Iaao51zFiagTPk4K5VGzMug0woFwsSvquNYdcFR3pk5LGyZ29TSSi5yPWSbyvVZl
        Ep21TyLYrdcmPcuMUFKdtqWMYBZ4KwNU=
X-Received: by 2002:a7b:c842:0:b0:3db:2063:425e with SMTP id c2-20020a7bc842000000b003db2063425emr4040501wml.1.1676980872505;
        Tue, 21 Feb 2023 04:01:12 -0800 (PST)
X-Google-Smtp-Source: AK7set8PaVDhgVo1lgR0da8lUdHjH25R3LyU28rdPMhylHxaJZIJiB/EWk7MyM/lSUZca+9Qs3BwKw==
X-Received: by 2002:a7b:c842:0:b0:3db:2063:425e with SMTP id c2-20020a7bc842000000b003db2063425emr4040459wml.1.1676980872120;
        Tue, 21 Feb 2023 04:01:12 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-121-8.dyn.eolo.it. [146.241.121.8])
        by smtp.gmail.com with ESMTPSA id b3-20020a05600010c300b002c57475c375sm6910399wrx.110.2023.02.21.04.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 04:01:11 -0800 (PST)
Message-ID: <d5ea4ad402f78e538a2566e0109b8216af32edbf.camel@redhat.com>
Subject: Re: [PATCH net-next v4 0/3] net: dsa: rzn1-a5psw: add support for
 vlan and .port_bridge_flags
From:   Paolo Abeni <pabeni@redhat.com>
To:     =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vladimir Oltean <olteanv@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        =?ISO-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@bootlin.com>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Arun Ramadoss <Arun.Ramadoss@microchip.com>,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Date:   Tue, 21 Feb 2023 13:01:09 +0100
In-Reply-To: <20230221092626.57019-1-clement.leger@bootlin.com>
References: <20230221092626.57019-1-clement.leger@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 2023-02-21 at 10:26 +0100, Cl=C3=A9ment L=C3=A9ger wrote:
> While adding support for VLAN, bridge_vlan_unaware.sh and
> bridge_vlan_aware.sh were executed and requires .port_bridge_flags
> to disable flooding on some specific port. Thus, this series adds
> both vlan support and .port_bridge_flags.
>=20
> ----
> V4:
>  - Fix missing CPU port bit in a5psw->bridged_ports
>  - Use unsigned int for vlan_res_id parameters
>  - Rename a5psw_get_vlan_res_entry() to a5psw_new_vlan_res_entry()
>  - In a5psw_port_vlan_add(), return -ENOSPC when no VLAN entry is found
>  - In a5psw_port_vlan_filtering(), compute "val" from "mask"
>=20
> V3:
>  - Target net-next tree and correct version...
>=20
> V2:
>  - Fixed a few formatting errors
>  - Add .port_bridge_flags implementation
>=20
> Cl=C3=A9ment L=C3=A9ger (3):
>   net: dsa: rzn1-a5psw: use a5psw_reg_rmw() to modify flooding
>     resolution
>   net: dsa: rzn1-a5psw: add support for .port_bridge_flags
>   net: dsa: rzn1-a5psw: add vlan support
>=20
>  drivers/net/dsa/rzn1_a5psw.c | 223 ++++++++++++++++++++++++++++++++++-
>  drivers/net/dsa/rzn1_a5psw.h |   8 +-
>  2 files changed, 222 insertions(+), 9 deletions(-)

# Form letter - net-next is closed

The merge window for v6.3 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations.
We are currently accepting bug fixes only.

Please repost when net-next reopens after Mar 6th.

RFC patches sent for review only are obviously welcome at any time.

