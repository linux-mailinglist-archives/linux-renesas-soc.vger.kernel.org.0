Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BF5D46C4EBD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Mar 2023 15:59:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbjCVO7p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Mar 2023 10:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjCVO7k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Mar 2023 10:59:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53124658E
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Mar 2023 07:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679497126;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NTDHGidtxxNwvUoWqQhKBSxK12xTyzlrRv/7eEx1M9k=;
        b=EtgUT/D8iK7smfM1qawOuEEV54nU60+lRcjds2DqWNndVO43fRaEeGAyUwhjqmvzAuymex
        /WfDWptmtI48W6vq40QmKshDxoTPJzi7mA4DSU5QK6LmNS169duVSpGPd/eCX3P/+D+/Of
        1sYspSUVEvsQgz+JiIBX7Hm+sQsWoWs=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-Ss7RF0C0Nai-CU-1IpTubw-1; Wed, 22 Mar 2023 10:58:44 -0400
X-MC-Unique: Ss7RF0C0Nai-CU-1IpTubw-1
Received: by mail-qv1-f69.google.com with SMTP id f3-20020a0cc303000000b005c9966620daso4829725qvi.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Mar 2023 07:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679497124; x=1682089124;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTDHGidtxxNwvUoWqQhKBSxK12xTyzlrRv/7eEx1M9k=;
        b=wFZBq9QQE7w661OiLb7fXnh8xDrLhHLmo+l46ZjCoDHbubps86w4uu7TKzhEorImpB
         3dz0L2BhSLnSIfUgIIxJYA07h7XIB7/yUQR3Pr5cCIUvxBXmaA4WSCa3IaBlgcVPCrby
         TDTBTf4quEujh7mYGiJp2yb5x7Ysy+FVE9X3XQS/GiKOczcAJpJyBrg28e7l2cWeHTas
         StoQdwaKD8uDxDvjDX7NwcLh6Vf0RV7O4HKRm42jHjWqGeD5Pq6YlBmPHa1GpCkOf/UH
         dKyrzH3lKI1/lFX2zPVqpUlKwHhyggFkblW0vgy7GV0zQUBotYx0fsPpQ702jQ+9+frT
         68Uw==
X-Gm-Message-State: AO0yUKXNMB6ToAElPFrbcDGZPrYpZkuoKC5X3ynd56lVuytm/gDbuk06
        ab48ai4/5IOGT1UTtafYD4QUf/Lf2EYitSGcfEf9IDUR2NvJtf/kBt4mDH6+s/SiZDiquZWH0by
        opn1SbHvKyZ0A4I5lOMTDd9WqJa48eu8=
X-Received: by 2002:a05:6214:528d:b0:5ad:cd4b:3765 with SMTP id kj13-20020a056214528d00b005adcd4b3765mr9966456qvb.1.1679497124425;
        Wed, 22 Mar 2023 07:58:44 -0700 (PDT)
X-Google-Smtp-Source: AK7set8v93I76Hrh6VYaSGaLjbIuUhXMY4ShyL1lpTiTt6XnQgpguzMVChPp0c+PhTr3DB86BOb1hw==
X-Received: by 2002:a05:6214:528d:b0:5ad:cd4b:3765 with SMTP id kj13-20020a056214528d00b005adcd4b3765mr9966419qvb.1.1679497124160;
        Wed, 22 Mar 2023 07:58:44 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-244-168.dyn.eolo.it. [146.241.244.168])
        by smtp.gmail.com with ESMTPSA id y3-20020a37f603000000b0074382b756c2sm11405364qkj.14.2023.03.22.07.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:58:43 -0700 (PDT)
Message-ID: <65d770947b98805a52573b3fa2df11f5d1778af7.camel@redhat.com>
Subject: Re: [PATCH net-next] smsc911x: remove superfluous variable init
From:   Paolo Abeni <pabeni@redhat.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Steve Glendinning <steve.glendinning@shawell.net>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org
Date:   Wed, 22 Mar 2023 15:58:40 +0100
In-Reply-To: <ZBnBZwC9WEoNK0Gp@ninjato>
References: <20230321114721.20531-1-wsa+renesas@sang-engineering.com>
         <CAMuHMdXrvdUPTs=ExXJo-WM+=A=WgyCQM_0mGKZxQOrVFePbwA@mail.gmail.com>
         <ZBnBZwC9WEoNK0Gp@ninjato>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 2023-03-21 at 15:38 +0100, Wolfram Sang wrote:
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct smsc911x_data =
*pdata =3D netdev_priv(dev);
> > > -       struct phy_device *phydev =3D NULL;
> > > +       struct phy_device *phydev;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0int ret;
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0phydev =3D phy_find_f=
irst(pdata->mii_bus);
> >=20
> > Nit: perhaps combine this assignment with the variable declaration?
>=20
> I thought about it but found this version to be easier readable.

This patch does not apply cleanly to net-next, please rebase and
resping.

Thanks!

Paolo

