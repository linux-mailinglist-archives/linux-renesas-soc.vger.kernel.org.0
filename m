Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2761F71EEDC
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jun 2023 18:27:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231513AbjFAQ0w (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jun 2023 12:26:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229880AbjFAQ0v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jun 2023 12:26:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F02CC186
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Jun 2023 09:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685636768;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j/F1LxZirDfErPdq3R0sb7ggL9blNRNmZw36x3XSQIk=;
        b=W/KObxkefGADBXf0aeaYnakczM4SAXESG6lFNbAlq2t2ChAQgtp9PrH5L6vskz6N8TaA7k
        wl0kVQDaWgHAcFHwHyXivMefBrU5YY4rjpo3QVe37K9l2nDltlLjHgfQYtLLoVXrviov8p
        6AzB3o1ionYj2WiBEwpYxKgZfI2Mpfc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-DTKA09QQO6OvB-8DDqLlJw-1; Thu, 01 Jun 2023 12:26:06 -0400
X-MC-Unique: DTKA09QQO6OvB-8DDqLlJw-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3f607da7cdbso1925875e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Jun 2023 09:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685636765; x=1688228765;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j/F1LxZirDfErPdq3R0sb7ggL9blNRNmZw36x3XSQIk=;
        b=Ggfe38gfKCfaTRV5NoTdp/J00dunTzS7qyXbO8QVzVLSIeFLtV8+evpRYh2I+/2GYl
         PEOjcouRq1zbm8waYWFvl/S6qY257pRgz+UTZ/EdFmWcKFY4zFxoL196ZibM0fEnz1cI
         r5fHg4+BF0qHNnWriQsD/2phI1xQnh9FH7g6wBZXDpzOLMPSWWheAtVc0u79hIU7WHpP
         vwisLlCQIcNo195mrYKjk4zzXWcvQbaFoc4BqD5dov9aVOUybCO38x9izLtTh1MDx1vf
         9mmsRIpwlmnZvQYT2xj5Eh1gR3a5RXhN+l3znGm6Rb+thfxXXor1OHa+iTxNNnXPXQph
         RDdA==
X-Gm-Message-State: AC+VfDzuKI9Z9KWmVYoNbj9x/G6OwU1B4QVGyHupzi3zWyQTR3yUjx1a
        viJf9kBAI0nOTaaUxEm6Hbit5brBjnohq20MjQyMN3kMTL1tOjev5zfsN7IIgpoGy/WzulIqGRr
        2Y0BX7s2Vut5cBJR+e2FHwPZ348wadF8=
X-Received: by 2002:a5d:5490:0:b0:307:a582:330a with SMTP id h16-20020a5d5490000000b00307a582330amr3966676wrv.2.1685636765648;
        Thu, 01 Jun 2023 09:26:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7YWyAb3b7g10pD2iXkCFC0qcap3q8bVkVqyFnP8UMDfu1FHM3wasSwSxkzVS7+l7p9lsRizg==
X-Received: by 2002:a5d:5490:0:b0:307:a582:330a with SMTP id h16-20020a5d5490000000b00307a582330amr3966662wrv.2.1685636765295;
        Thu, 01 Jun 2023 09:26:05 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-242-89.dyn.eolo.it. [146.241.242.89])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600012c400b003047dc162f7sm10917574wrx.67.2023.06.01.09.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 09:26:04 -0700 (PDT)
Message-ID: <cd383482ff59517ed424bafc2b1def3a3b0b5c42.camel@redhat.com>
Subject: Re: [PATCH net] net: renesas: rswitch: Fix return value in error
 path of xmit
From:   Paolo Abeni <pabeni@redhat.com>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Simon Horman <simon.horman@corigine.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Date:   Thu, 01 Jun 2023 18:26:03 +0200
In-Reply-To: <20230601091012.5633540f@kernel.org>
References: <20230529073817.1145208-1-yoshihiro.shimoda.uh@renesas.com>
         <ZHXhNH64lel+h/+R@corigine.com>
         <7d84293de72a05c76d66f9010248f4d233cd1c1a.camel@redhat.com>
         <20230601091012.5633540f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 2023-06-01 at 09:10 -0700, Jakub Kicinski wrote:
> On Thu, 01 Jun 2023 10:41:34 +0200 Paolo Abeni wrote:
> > > I agree that this is the correct return value for this case.
> > > But I do wonder if, as per the documentation of ndo_start_xmit,
> > > something should be done to avoid getting into such a situation.
> > >=20
> > >  * netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb,
> > >  *                               struct net_device *dev);
> > >  *      Called when a packet needs to be transmitted.
> > >  *      Returns NETDEV_TX_OK.  Can return NETDEV_TX_BUSY, but you sho=
uld stop
> > >  *      the queue before that can happen; it's for obsolete devices a=
nd weird
> > >  *      corner cases, but the stack really does a non-trivial amount
> > >  *      of useless work if you return NETDEV_TX_BUSY.
> > >  *      Required; cannot be NULL. =20
> >=20
> > I agree with Simon, it looks like the driver usage of
> > netif_stop_subqueue()/netif_wake_subqueue() is a dubious.
> >=20
> > I think you will be better of using
> > netif_subqueue_maybe_stop()/netif_subqueue_completed_wake() alike what
> > rtl8169 is doing. e.g. netif_subqueue_maybe_stop() should be invoked
> > after the tx buffer enqueue, and netif_subqueue_completed_wake() should
> > be invoked after successful tx ring cleanup.
>=20
> That's a separate issue, tho, right? The cleanup is lockless and our
> magic lockless macro scheme does not protect from spurious wakeups.
> So they still need to check if the queue is full at the top of xmit.
> And they still need to return the correct error in that case..

I guess you are right, dubious wakeup could be addresses with a
separate patch if needed.=20

Fine by me to apply it as-is.

Cheers,

Paolo

