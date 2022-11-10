Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C050623C50
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 10 Nov 2022 08:06:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232702AbiKJHGm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 10 Nov 2022 02:06:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbiKJHGl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 10 Nov 2022 02:06:41 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F28B32CE15;
        Wed,  9 Nov 2022 23:06:40 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A22BDB820E3;
        Thu, 10 Nov 2022 07:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB825C433C1;
        Thu, 10 Nov 2022 07:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668063998;
        bh=JILYWmRHeQlrFq3PO1cP1RJjbl5/5CrcYkqjDHCWjWM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OvfqSv4r75YqGPVAWeAToKYtQyQHg+n+KTDxH/3plnKdhLUGzxYO/n2shTUdfeyIk
         dX0l5eY8w8A12HUS5pTskACnnAE5WSipi+7K8nQDnbhvlDqGYEgMT4bjG0MsQAdZal
         o0hDOkZ/hEJbovax1KCOTMfD+M0QIMg+c73VXdJIoKwPmxeknXizqNHX81dgy+so1N
         5ia/jXhV94zCopqmhxRG87vvC6/gHFjy12+ni80KISw1dSyD3RiYp94NB612NNWSv2
         3JvzUpsZNc6Z8Tv/wyBL3LmF+pThWNqGdMIkW1VHNLLW6Xle8rcMzncpxY4hz9SS9k
         4yj2zqnrEaQUQ==
Date:   Thu, 10 Nov 2022 12:36:32 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "kishon@kernel.org" <kishon@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RESEND PATCH v3 2/2] phy: renesas: Add Renesas Ethernet SERDES
 driver for R-Car S4-8
Message-ID: <Y2yi+PRyupPGCB9k@matsya>
References: <20221027134006.2343164-1-yoshihiro.shimoda.uh@renesas.com>
 <20221027134006.2343164-3-yoshihiro.shimoda.uh@renesas.com>
 <Y2ZzowD2eAxBFcwR@matsya>
 <TYBPR01MB5341DC696FCF3B7D4E139006D83C9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYBPR01MB5341DC696FCF3B7D4E139006D83C9@TYBPR01MB5341.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 07-11-22, 01:50, Yoshihiro Shimoda wrote:
> Hi Vinod,
> 
> > From: Vinod Koul, Sent: Saturday, November 5, 2022 11:31 PM
> > 
> > On 27-10-22, 22:40, Yoshihiro Shimoda wrote:
> > > Add Renesas Ethernet SERDES driver for R-Car S4-8 (r8a779f0).
> > > The datasheet describes initialization procedure without any information
> > > about registers' name/bits. So, this is all black magic to initialize
> > > the hardware. Especially, all channels should be initialized at once.
> > >
> > > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > > ---
> > >  drivers/phy/renesas/Kconfig                 |   7 +
> > >  drivers/phy/renesas/Makefile                |   1 +
> > >  drivers/phy/renesas/r8a779f0-ether-serdes.c | 416 ++++++++++++++++++++
> > >  3 files changed, 424 insertions(+)
> > >  create mode 100644 drivers/phy/renesas/r8a779f0-ether-serdes.c
> > >
> > > diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
> > > index 111bdcae775c..68f160b0e8ef 100644
> > > --- a/drivers/phy/renesas/Kconfig
> > > +++ b/drivers/phy/renesas/Kconfig
> > > @@ -32,3 +32,10 @@ config PHY_RCAR_GEN3_USB3
> > >  	select GENERIC_PHY
> > >  	help
> > >  	  Support for USB 3.0 PHY found on Renesas R-Car generation 3 SoCs.
> > > +
> > > +config PHY_R8A779F0_ETHERNET_SERDES
> > > +	tristate "Renesas R-Car S4-8 Ethernet SERDES driver"
> > > +	depends on ARCH_RENESAS || COMPILE_TEST
> > > +	select GENERIC_PHY
> > > +	help
> > > +	  Support for Ethernet SERDES found on Renesas R-Car S4-8 SoCs.
> > 
> > Sorted alphabetically please and not at the end
> 
> I intended to sort alphabetically about the prompt strings:
> 
> <snip>
> "Renesas R-Car generation 3 USB 2.0 PHY driver"
> "Renesas R-Car generation 3 USB 3.0 PHY driver"
> "Renesas R-Car S4-8 Ethernet SERDES driver"
> 
> However, IIUC, should we sort alphabetically about the config strings like below?
> 
> config PHY_R8A779F0_ETHERNET_SERDES
> config PHY_RCAR_GEN3_PCIE

We sort them based on config symbol and not the prompt string
-- 
~Vinod
