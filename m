Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE229273BC
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2019 03:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbfEWBCy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 May 2019 21:02:54 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.167]:25787 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727691AbfEWBCy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 May 2019 21:02:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558573370;
        s=strato-dkim-0002; d=fpond.eu;
        h=Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=8VaFhlt3Sv+uRqmY+OUjVcUQP1dzNRTWZVk7slXg7j8=;
        b=WdzG6foWzjJ0jjgsyzTtlAmKSr1PKqncKgel5wBbrAQfFeQFFiJMVi/iUuMGdKRuqG
        7WoO/ZeK4EwkFAK3qFptV6loZ2COvbfueYAnfPr6gKrypORLgOBG7ATZPoZkKfbjDBPH
        Bh8kJ8Q9Ukp9VpgLZL9LNbIi3lKSf1oU5sLH6I0U/N4ylR1HeeoNUztdtPz6bO8ViQIw
        /9SIqe8OueJqq4nfg7wyTtjOT4lzL4cANIqxrqxl20Kv9r9It4Lhx+5pOzkHJFQOqIJ5
        JOFM7lgeae6/ytf1KB76rmV56qxUdL9aH57jngerbmfNICl7LEqa3BPcN2za98CByRBM
        iEBw==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73amq+g13rqGzmt2bYDnKIKaws6YXTsc4="
X-RZG-CLASS-ID: mo00
Received: from oxapp01-01.back.ox.d0m.de
        by smtp-ox.front (RZmta 44.18 AUTH)
        with ESMTPSA id y08c83v4N12jF5v
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Thu, 23 May 2019 03:02:45 +0200 (CEST)
Date:   Thu, 23 May 2019 03:02:45 +0200 (CEST)
From:   Ulrich Hecht <uli@fpond.eu>
To:     Simon Horman <horms@verge.net.au>, Wolfram Sang <wsa@the-dreams.de>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org,
        davem@davemloft.net, magnus.damm@gmail.com
Message-ID: <591180619.231842.1558573365579@webmail.strato.com>
In-Reply-To: <20190522115916.vlnbna2vxnf7zhod@verge.net.au>
References: <1557328882-24307-1-git-send-email-uli+renesas@fpond.eu>
 <1f7be29e-c85a-d63d-c83f-357a76e8ca45@cogentembedded.com>
 <20190508165219.GA26309@bigcity.dyn.berto.se>
 <434070244.1141414.1557385064484@webmail.strato.com>
 <20190509101020.4ozvazptoy53gh55@verge.net.au>
 <344020243.1186987.1557415941124@webmail.strato.com>
 <20190513121807.cutayiact3qdbxt4@verge.net.au>
 <20190520120954.ffz2ius5nvojkxlh@katana>
 <20190522115916.vlnbna2vxnf7zhod@verge.net.au>
Subject: Re: [PATCH] ravb: implement MTU change while device is up
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev58
X-Originating-IP: 85.212.212.17
X-Originating-Client: open-xchange-appsuite
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


> On May 22, 2019 at 1:59 PM Simon Horman <horms@verge.net.au> wrote:
> 
> 
> On Mon, May 20, 2019 at 02:09:54PM +0200, Wolfram Sang wrote:
> > 
> > > > > > > >    How about the code below instead?
> > > > > > > > 
> > > > > > > > 	if (netif_running(ndev))
> > > > > > > > 		ravb_close(ndev);
> > > > > > > > 
> > > > > > > >  	ndev->mtu = new_mtu;
> > > > > > > > 	netdev_update_features(ndev);
> > > > > > > 
> > > > > > > Is there a need to call netdev_update_features() even if the if is not 
> > > > > > > running?
> > > > > > 
> > > > > > In my testing, it didn't seem so.
> > > > > 
> > > > > That may be because your testing doesn't cover cases where it would make
> > > > > any difference.
> > > > 
> > > > Cases other than changing the MTU while the device is up?
> > > 
> > > I was thinking of cases where listeners are registered for the
> > > notifier that netdev_update_features() triggers.
> > 
> > Where are we here? Is this a blocker?
> 
> I don't think this is a blocker but I would lean towards leaving
> netdev_update_features() in unless we are certain its not needed.
>

I have read through the code and have indeed not found any indication that netdev_update_features() or something equivalent is called implicitly when the device is closed and reopened. I'll send a v2.

CU
Uli
