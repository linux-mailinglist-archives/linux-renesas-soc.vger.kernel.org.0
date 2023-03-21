Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585876C347C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Mar 2023 15:40:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbjCUOkF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Mar 2023 10:40:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230425AbjCUOkE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 10:40:04 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98AD4FF23
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Mar 2023 07:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679409553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=te2wjPxLotIIBWis0C4qhukl42NU3760NpTaXDtKkAA=;
        b=JxMuyAz/xBwZJOwsE/nqNZ2g2S652my9U8KDLgXxZLK/CEmZin8vhdUS5hbTBM1xhSaD+R
        RUQwqXZRKBweHKs3YF4n+iXDpcyzDdkP7T49oRjtvaBMsW2vZfjGSL4e10c4iSB3D1C4zH
        +A+ZqtiPQuadhDc2qW6wKxvly+XwCzQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-QGxHuFAVMEydLD--pNGaSQ-1; Tue, 21 Mar 2023 10:39:08 -0400
X-MC-Unique: QGxHuFAVMEydLD--pNGaSQ-1
Received: by mail-wr1-f72.google.com with SMTP id o3-20020a5d6483000000b002cc4fe0f7fcso1793603wri.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Mar 2023 07:39:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679409547;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=te2wjPxLotIIBWis0C4qhukl42NU3760NpTaXDtKkAA=;
        b=kZ5v/HlQzs8zme0jEf1LbddwuzofMKRbS6Cob5g1iEQ+REhlj+JlKHNaEUoStKnL5n
         OndFO7hlqu+1sLl+L6CpNFNFgVP+Hx5XV86BX8ECi6Jhwi0zSwa+O/kEH+NIkpjPDvEp
         nJ8LmU59cMUPb0iCjqH8JyoAfAFHocWpnefJe6O9ufdWWs0j1iL3A0eM7qNYlT4Tg8Up
         UCxX6AeFqi0INmOqyPi/rMCk5v1EXbKIk7m/QLB4aOVLqVY72D0lDdDVzZzrl2+Om82v
         swy8dnNOI/e80IgVpnc9dvYPLScNNJy/RBzg8lw3QxcUKwKR41D6HCk2+bittDu56JiR
         CSRA==
X-Gm-Message-State: AO0yUKVP6Qri9XYf9a7o+YW2sc8JJ8aBFMKvj88yTi7DHoIhfZGwG6Jk
        hX3iqV+ywquyaRUe6moBDFCJGmqRuACnMCqlYyKpKdrYBBaIykyodb2MZiJgoTc+9g1MFmUQuPL
        CdYH6j9D/oLz/todSanJqlQeIDVEWMBU=
X-Received: by 2002:a05:600c:4744:b0:3ed:ebcb:e2c6 with SMTP id w4-20020a05600c474400b003edebcbe2c6mr2966527wmo.3.1679409547710;
        Tue, 21 Mar 2023 07:39:07 -0700 (PDT)
X-Google-Smtp-Source: AK7set8Jpe5k8eJaSDWziJnwP3NQWvprpto6X93PPJIuPivb6Bx6XPYOeMSt783Ld3ERpqKIUsu/Vg==
X-Received: by 2002:a05:600c:4744:b0:3ed:ebcb:e2c6 with SMTP id w4-20020a05600c474400b003edebcbe2c6mr2966505wmo.3.1679409547445;
        Tue, 21 Mar 2023 07:39:07 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-244-19.dyn.eolo.it. [146.241.244.19])
        by smtp.gmail.com with ESMTPSA id k15-20020a05600c1c8f00b003ed793d9de0sm2618439wms.1.2023.03.21.07.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:39:07 -0700 (PDT)
Message-ID: <7589589f340f1ecb49bc8ed852e1e2dddb384700.camel@redhat.com>
Subject: Re: [PATCH net v2 2/2] smsc911x: avoid PHY being resumed when
 interface is not up
From:   Paolo Abeni <pabeni@redhat.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        netdev@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Steve Glendinning <steve.glendinning@shawell.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
Date:   Tue, 21 Mar 2023 15:39:05 +0100
In-Reply-To: <20230320092041.1656-3-wsa+renesas@sang-engineering.com>
References: <20230320092041.1656-1-wsa+renesas@sang-engineering.com>
         <20230320092041.1656-3-wsa+renesas@sang-engineering.com>
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

On Mon, 2023-03-20 at 10:20 +0100, Wolfram Sang wrote:
> SMSC911x doesn't need mdiobus suspend/resume, that's why it sets
> 'mac_managed_pm'. However, setting it needs to be moved from init to
> probe, so mdiobus PM functions will really never be called (e.g. when
> the interface is not up yet during suspend/resume). The errno is changed
> because ENODEV has a special meaning when returned in probe().
>=20
> Fixes: 3ce9f2bef755 ("net: smsc911x: Stop and start PHY during suspend an=
d resume")
> Suggested-by: Heiner Kallweit <hkallweit1@gmail.com>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since v1:
> * no change
>=20
> In smsc911x_mii_probe(), I remove the sanity check for 'phydev' because
> it was already done in smsc911x_mii_init(). Let me know if this is
> acceptable or if a more defensive approach is favoured.

Since this is a fix, I would keep the old check, too.

> @@ -1108,6 +1102,15 @@ static int smsc911x_mii_init(struct platform_devic=
e *pdev,
>  		goto err_out_free_bus_2;
>  	}
> =20
> +	phydev =3D phy_find_first(pdata->mii_bus);
> +	if (!phydev) {
> +		netdev_err(dev, "no PHY found\n");
> +		err =3D -ENOENT;
> +		goto err_out_free_bus_2;

Why don't you call mdiobus_unregister() in this error path?

mdiobus_register() completed successfully a few lines above.

Cheers,

Paolo

