Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 739B7581686
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Jul 2022 17:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiGZPer convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Jul 2022 11:34:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233639AbiGZPeq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 11:34:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9CCF248C2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Jul 2022 08:34:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oGMZs-0006xb-LT; Tue, 26 Jul 2022 17:34:32 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oGMZp-003LNl-QR; Tue, 26 Jul 2022 17:34:29 +0200
Received: from pza by lupine with local (Exim 4.94.2)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1oGMZp-000AY3-7T; Tue, 26 Jul 2022 17:34:29 +0200
Message-ID: <37bd0aa73076debde01dc3327d81a3685977f977.camel@pengutronix.de>
Subject: Re: [PATCH] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl: Document
 RZ/G2UL USBPHY Control bindings
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Date:   Tue, 26 Jul 2022 17:34:29 +0200
In-Reply-To: <OS0PR01MB5922C60E1D0A737167CEEDE486949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423134601.141975-1-biju.das.jz@bp.renesas.com>
         <fd372f05-e811-a6c5-31ae-c80df44c9ae4@linaro.org>
         <OS0PR01MB5922C5F56F72744C1D7641AD86949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
         <0c7688d6-b222-530a-3c61-0b081b43d090@linaro.org>
         <OS0PR01MB5922C60E1D0A737167CEEDE486949@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Di, 2022-07-26 at 11:52 +0000, Biju Das wrote:
> Hi Krzysztof Kozlowski,
> 
> > Subject: Re: [PATCH] dt-bindings: reset: renesas,rzg2l-usbphy-ctrl:
> > Document RZ/G2UL USBPHY Control bindings
> > 
> > On 26/07/2022 13:04, Biju Das wrote:
> > > Hi All,
> > > 
> > > Gentle ping.
> > > 
> > > Are we happy with this patch?
> > 
> > Why do you ping me or Rob? If you want to ping, be specific to avoid
> > wasting time of other people.
> 
> I am not sure do I need to rebase and send the patch? since this patch is 
> for a while and no response.

Thank you for the reminder, I've picked it up into reset/next.

regards
Philipp
