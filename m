Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73F717195D8
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jun 2023 10:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232046AbjFAIm3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jun 2023 04:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbjFAImZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jun 2023 04:42:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A6B3D1
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Jun 2023 01:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685608898;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=q7l8GTS9GpdOoo1zOHl/lA+HDvKVa49LWct1T5+lgHA=;
        b=c5S6rjtZJ/7RceV417X17PK6Yyz/4hWzNEof15QH/tWbaw65ybBdbfmK7IMdGZ6122rIt1
        eTj/OdKjwzgmxvC7Ana0VkvzSYkqQvrmndro1vjyBFoU6JlIxHABdtqT9rOEIdc0sfVTzs
        zr3RUja8e6rc9ZRQ1Vcnr9yxkSfC5rE=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-CdfNUpFiNqWwt0FQ8am5-w-1; Thu, 01 Jun 2023 04:41:37 -0400
X-MC-Unique: CdfNUpFiNqWwt0FQ8am5-w-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-3f5fde052b6so956375e9.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Jun 2023 01:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685608896; x=1688200896;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7l8GTS9GpdOoo1zOHl/lA+HDvKVa49LWct1T5+lgHA=;
        b=PWTXmtNIfufCSNF387IVSGTBq5iewIFZU1R2Ennlgfw9QcrGocF9aoNu35dFC4pdPT
         CIaaBiDFC9qO12640TOlbGI0Txuv5PrZlAONHLTe1fCUaw3BfvnpnxtLHp63EQCJzFTQ
         r5Gy7tYSNAtt97+INuYjyaFTeTDp/MPea9GjKCUN9QBJj/ZcIzt1QDTmubExZManCc03
         Ibn0/Bk/sNEpwvLws2atOJoAdOMEmxan0p1TzR41pWRRLRVP0AkCvf/uFnZ/cWGIVHUS
         9l6AZZWDuikOSGTjG7W8ICbJqPc3Y9FFmuvkz+NuMGE668NKww+qv4BoYDM+Wxaw1Bb0
         L5Wg==
X-Gm-Message-State: AC+VfDwfkgtztQtFDHcxXm4Xk/sa+LTVaIsdPALpf4We9X20BOZpDZF6
        gcBO2Io2S5+eZ7dU5B80OjaeJl7OousgDcOzDaTmixyADtudBCIRzAmqwuGKkKDcr/4exBoVYYv
        NmLamo9PicULsbb3oN8W8WZwoPr0x0+U=
X-Received: by 2002:a5d:534f:0:b0:30a:f103:1f55 with SMTP id t15-20020a5d534f000000b0030af1031f55mr5782214wrv.0.1685608896519;
        Thu, 01 Jun 2023 01:41:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ626Kt6ImpYOTgZmZUEm+Tg7IMlMe1JY3ab1PXP1Pb+AbaZKIT+vKdlGl+LNZIaxjD5CtiFKw==
X-Received: by 2002:a5d:534f:0:b0:30a:f103:1f55 with SMTP id t15-20020a5d534f000000b0030af1031f55mr5782206wrv.0.1685608896246;
        Thu, 01 Jun 2023 01:41:36 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-242-89.dyn.eolo.it. [146.241.242.89])
        by smtp.gmail.com with ESMTPSA id n2-20020a5d6602000000b0030903d44dbcsm9273875wru.33.2023.06.01.01.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 01:41:35 -0700 (PDT)
Message-ID: <7d84293de72a05c76d66f9010248f4d233cd1c1a.camel@redhat.com>
Subject: Re: [PATCH net] net: renesas: rswitch: Fix return value in error
 path of xmit
From:   Paolo Abeni <pabeni@redhat.com>
To:     Simon Horman <simon.horman@corigine.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Date:   Thu, 01 Jun 2023 10:41:34 +0200
In-Reply-To: <ZHXhNH64lel+h/+R@corigine.com>
References: <20230529073817.1145208-1-yoshihiro.shimoda.uh@renesas.com>
         <ZHXhNH64lel+h/+R@corigine.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 2023-05-30 at 13:42 +0200, Simon Horman wrote:
> On Mon, May 29, 2023 at 04:38:17PM +0900, Yoshihiro Shimoda wrote:
> > Fix return value in the error path of rswitch_start_xmit(). If TX
> > queues are full, this function should return NETDEV_TX_BUSY.
> >=20
> > Fixes: 3590918b5d07 ("net: ethernet: renesas: Add support for "Ethernet=
 Switch"")
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>=20
> Hi Shimoda-san,
>=20
> I agree that this is the correct return value for this case.
> But I do wonder if, as per the documentation of ndo_start_xmit,
> something should be done to avoid getting into such a situation.
>=20
>  * netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb,
>  *                               struct net_device *dev);
>  *      Called when a packet needs to be transmitted.
>  *      Returns NETDEV_TX_OK.  Can return NETDEV_TX_BUSY, but you should =
stop
>  *      the queue before that can happen; it's for obsolete devices and w=
eird
>  *      corner cases, but the stack really does a non-trivial amount
>  *      of useless work if you return NETDEV_TX_BUSY.
>  *      Required; cannot be NULL.

I agree with Simon, it looks like the driver usage of
netif_stop_subqueue()/netif_wake_subqueue() is a dubious.

I think you will be better of using
netif_subqueue_maybe_stop()/netif_subqueue_completed_wake() alike what
rtl8169 is doing. e.g. netif_subqueue_maybe_stop() should be invoked
after the tx buffer enqueue, and netif_subqueue_completed_wake() should
be invoked after successful tx ring cleanup.

Thanks!

Paolo


