Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA8897AED2E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Sep 2023 14:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234709AbjIZMr6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Sep 2023 08:47:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234703AbjIZMr5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2023 08:47:57 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 588BEFC;
        Tue, 26 Sep 2023 05:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=0P+TyX4oNvsiAlMR/YZ9R9enQXrEzDFfV4i0tuqPyMs=; b=I0GxKZskc/gB995p0OUTBOe13j
        P/QpVIPpTDyZCMMYNzFis+Zkk12AZNBqueaI24npcUAbCutPZUsTzxQkdViSSnag2/+r9hVjsV+r5
        JO1nevz9o0Nuoyg7QnhURPPIX3gYY7xMzMapg2QLgMxwKis7oXRX5ckzIl2+j8k7pCgo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1ql7TV-007YDq-4w; Tue, 26 Sep 2023 14:47:37 +0200
Date:   Tue, 26 Sep 2023 14:47:37 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Tam Nguyen <tam.nguyen.xa@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH net] net: ethernet: renesas: rswitch Fix PHY station
 management clock setting
Message-ID: <496825ea-8d78-47b7-b4c7-f74874ca278c@lunn.ch>
References: <20230925003416.3863560-1-yoshihiro.shimoda.uh@renesas.com>
 <7156d89e-ef72-487f-b7ce-b08be461ec1c@lunn.ch>
 <TYBPR01MB534186322164085E74430B4BD8C3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYBPR01MB534186322164085E74430B4BD8C3A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Sep 26, 2023 at 07:21:59AM +0000, Yoshihiro Shimoda wrote:
> Hello Andrew,
> 
> > From: Andrew Lunn, Sent: Monday, September 25, 2023 11:18 PM
> > 
> > On Mon, Sep 25, 2023 at 09:34:16AM +0900, Yoshihiro Shimoda wrote:
> > > From: Tam Nguyen <tam.nguyen.xa@renesas.com>
> > >
> > > Fix the MPIC.PSMCS value following the programming example in the
> > > section 6.4.2 Management Data Clock (MDC) Setting, Ethernet MAC IP,
> > > S4 Hardware User Manual Rev.1.00.
> > >
> > > The value is calculated by
> > >     MPIC.PSMCS = clk[MHz] / ((MDC frequency[MHz] + 1) * 2)
> > > with the input clock frequency of 320MHz and MDC frequency of 2.5MHz.
> > > Otherwise, this driver cannot communicate PHYs on the R-Car S4 Starter
> > > Kit board.
> > 
> > If you run this calculation backwards, what frequency does
> > MPIC_PSMCS(0x3f) map to?
> 
> Thank you for your review! I completely misunderstood the formula. In
> other words, the formula cannot calculate backwards. The correct
> formula is:
> 
> MPIC.PSMCS = clk[MHz] / (MDC frequency[MHz] * 2) - 1
> 
> > Is 320MHz really fixed? For all silicon variants? Is it possible to do
> > a clk_get_rate() on a clock to get the actual clock rate?
> 
> 320MHz is really fixed on the current existing all silicon variants.
> Yes, it is possible to do a clk_get_rate() on a clock to get the actual
> clock rate. So, I'll use clk_get_rate() on v2.

Was the original version tested?

I've run Marvell PHYs are 5Mhz, sometimes 6MHz. This is within spec as
given by the datasheet, even if IEEE 802.3 says 2.5Mhz is the max.

Now if MPIC_PSMCS(0x3f) maps to 20MHz or more, it could never of
worked, which makes me think the clock has changed. If it maps to
6Mhz, yes it could of worked with some PHY but not others, and the
clock might not of changed.

      Andrew

