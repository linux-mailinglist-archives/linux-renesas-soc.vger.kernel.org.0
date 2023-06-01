Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B2DE71E9E9
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Jun 2023 18:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbjFAQKY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Jun 2023 12:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjFAQKW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Jun 2023 12:10:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 910681AB
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Jun 2023 09:10:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 29A1D64736
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Jun 2023 16:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C59C433EF;
        Thu,  1 Jun 2023 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685635813;
        bh=7KlwukzG9aEJJ3A3UcKClMqRHLsdvMpH/8EBlCttKds=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QbUcm6uRSbYjoLeyOBKaB8tnSW4/zcCuXr4IvEn5zjwnvG/qP+O9PololUOyTAWG4
         g2TQUPnVLGs1YNyZIl9wA8QCycsUQ/VERy86DanTZG3cw06GQGP6VGleNsA+OdP/qC
         iFtExKlts6nGRBhMBzw75iIoMVGz5xhPjAfkmxpSQ5oABfZ9nwOzKJhLZwEaWSDmE2
         XGbybkfNIPvPdybntWkzG43Adai+C8Z9snFWcRIwankn+0an7ZtaepTACTHKM6TyZ1
         APFmDMAKYS5USQfC0Z7tP3FRZx6HUe2nGgyN1TWni+zOGyMqnlar0JXMGlNXIeJj0I
         pi7orMq1SfEaA==
Date:   Thu, 1 Jun 2023 09:10:12 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Paolo Abeni <pabeni@redhat.com>
Cc:     Simon Horman <simon.horman@corigine.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        s.shtylyov@omp.ru, davem@davemloft.net, edumazet@google.com,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net] net: renesas: rswitch: Fix return value in error
 path of xmit
Message-ID: <20230601091012.5633540f@kernel.org>
In-Reply-To: <7d84293de72a05c76d66f9010248f4d233cd1c1a.camel@redhat.com>
References: <20230529073817.1145208-1-yoshihiro.shimoda.uh@renesas.com>
        <ZHXhNH64lel+h/+R@corigine.com>
        <7d84293de72a05c76d66f9010248f4d233cd1c1a.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 01 Jun 2023 10:41:34 +0200 Paolo Abeni wrote:
> > I agree that this is the correct return value for this case.
> > But I do wonder if, as per the documentation of ndo_start_xmit,
> > something should be done to avoid getting into such a situation.
> > 
> >  * netdev_tx_t (*ndo_start_xmit)(struct sk_buff *skb,
> >  *                               struct net_device *dev);
> >  *      Called when a packet needs to be transmitted.
> >  *      Returns NETDEV_TX_OK.  Can return NETDEV_TX_BUSY, but you should stop
> >  *      the queue before that can happen; it's for obsolete devices and weird
> >  *      corner cases, but the stack really does a non-trivial amount
> >  *      of useless work if you return NETDEV_TX_BUSY.
> >  *      Required; cannot be NULL.  
> 
> I agree with Simon, it looks like the driver usage of
> netif_stop_subqueue()/netif_wake_subqueue() is a dubious.
> 
> I think you will be better of using
> netif_subqueue_maybe_stop()/netif_subqueue_completed_wake() alike what
> rtl8169 is doing. e.g. netif_subqueue_maybe_stop() should be invoked
> after the tx buffer enqueue, and netif_subqueue_completed_wake() should
> be invoked after successful tx ring cleanup.

That's a separate issue, tho, right? The cleanup is lockless and our
magic lockless macro scheme does not protect from spurious wakeups.
So they still need to check if the queue is full at the top of xmit.
And they still need to return the correct error in that case..
