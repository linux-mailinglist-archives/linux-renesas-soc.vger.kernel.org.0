Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22148764DCC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 10:40:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234000AbjG0IkT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 04:40:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234027AbjG0Ijt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 04:39:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9283626AF8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 01:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690446074;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RGeV47pO7s8gps9ksu/4+lDYD8FHRHT3YEWZYPUU9kM=;
        b=UwqlwwjszfvP/0JgYdnhNQiYFN5Oiqka47fUMl8ezx//3MmLxaM9w3wgb184QxcSM1q8kR
        abU5nR71SU95YmtUD1C+86ZPWrtnzJGYuDJb2t/hQRTHRsywtcsgg5sYYAo8+YoiV5WO2i
        A2Tdn4t46bb4w2KZzjCA528u8/AioH4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-4bquWbAKNPOh7BQPcD2Olg-1; Thu, 27 Jul 2023 04:21:13 -0400
X-MC-Unique: 4bquWbAKNPOh7BQPcD2Olg-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-767ca6391aeso16196385a.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 27 Jul 2023 01:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690446073; x=1691050873;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RGeV47pO7s8gps9ksu/4+lDYD8FHRHT3YEWZYPUU9kM=;
        b=H7kspyCWsAmAg6CATJaHULYKU1CFb67GgpINVZ3y22dDA7vlQ5XvCzLSy4s1Z1H/I9
         VKWmqug5Vr3ZSqXP5ILdZ61rXmT1igjbCMziBOAup/kG/p/TGQ95qw+ayxpuORLSbYZF
         FM5vhldWQFjz6jSmGyZVGYz8TZ7FWr+DcuJDtRf35zimZZJiEGFgvkpyp0eOS82L99zf
         jZUjQXzZLA7mVY4Z1Ke6e0yjU1CS/8vlrr5MkXgkbwmFrz/xw4MyN2rSvwdbDC1YIm/Q
         K5ruV/IYt5Tlh90mRIQ4p54pUqxA5VAvARW+o+PxVp4jpMz9Gsx7VhxYcw+4W6x4GAsl
         PbEw==
X-Gm-Message-State: ABy/qLY5W+UriqJA2lMuiSnwQhWqzmwS9RBNq7KJPoxC/DDKn/RRGlcH
        +gnKN2CKXTrTghJhkQE1QsMYRW+QDtGE0vao1AtK+Hnhl+WSzs67KJZZQB+D5+SVt94B12B6cGx
        QXl9PCGuSl7crrtcxA7orWvQsrnrnr3Q=
X-Received: by 2002:a05:620a:31a1:b0:75b:23a1:69ee with SMTP id bi33-20020a05620a31a100b0075b23a169eemr4576181qkb.5.1690446073026;
        Thu, 27 Jul 2023 01:21:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHs3zPOBeUj9ojGrgUE/X3gQH8r73DGALfDrJ+7Y3EtRQm+q4OZUXkV2TRkziNvYTa7JtMfZA==
X-Received: by 2002:a05:620a:31a1:b0:75b:23a1:69ee with SMTP id bi33-20020a05620a31a100b0075b23a169eemr4576160qkb.5.1690446072769;
        Thu, 27 Jul 2023 01:21:12 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-238-55.dyn.eolo.it. [146.241.238.55])
        by smtp.gmail.com with ESMTPSA id j4-20020a05620a000400b00767d8663b3asm253886qki.53.2023.07.27.01.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 01:21:12 -0700 (PDT)
Message-ID: <9cfa70cca3cb1dd20bb2cab70a213e5a4dd28f89.camel@redhat.com>
Subject: Re: [PATCH v4] net: ravb: Fix possible UAF bug in ravb_remove
From:   Paolo Abeni <pabeni@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>, Zheng Wang <zyytlz.wz@163.com>
Cc:     s.shtylyov@omp.ru, lee@kernel.org, linyunsheng@huawei.com,
        davem@davemloft.net, edumazet@google.com, richardcochran@gmail.com,
        p.zabel@pengutronix.de, geert+renesas@glider.be,
        magnus.damm@gmail.com, yoshihiro.shimoda.uh@renesas.com,
        biju.das.jz@bp.renesas.com, wsa+renesas@sang-engineering.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, hackerzheng666@gmail.com,
        1395428693sheep@gmail.com, alex000young@gmail.com
Date:   Thu, 27 Jul 2023 10:21:07 +0200
In-Reply-To: <20230725201952.2f23bb3b@kernel.org>
References: <20230725030026.1664873-1-zyytlz.wz@163.com>
         <20230725201952.2f23bb3b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 2023-07-25 at 20:19 -0700, Jakub Kicinski wrote:
> On Tue, 25 Jul 2023 11:00:26 +0800 Zheng Wang wrote:
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/eth=
ernet/renesas/ravb_main.c
> > index 4d6b3b7d6abb..ce2da5101e51 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -2885,6 +2885,9 @@ static int ravb_remove(struct platform_device *pd=
ev)
> >  	struct ravb_private *priv =3D netdev_priv(ndev);
> >  	const struct ravb_hw_info *info =3D priv->info;
> > =20
> > +	netif_carrier_off(ndev);
> > +	netif_tx_disable(ndev);
> > +	cancel_work_sync(&priv->work);
>=20
> Still racy, the carrier can come back up after canceling the work.

I must admit I don't see how/when this driver sets the carrier on ?!?

> But whatever, this is a non-issue in the first place.

Do you mean the UaF can't happen? I think that is real.=20

> The fact that ravb_tx_timeout_work doesn't take any locks seems much
> more suspicious.

Indeed! But that should be a different patch, right?

Waiting a little more for feedback from renesas.

/P

