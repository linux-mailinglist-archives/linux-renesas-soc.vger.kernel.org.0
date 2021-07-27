Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29AEE3D7798
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 15:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230500AbhG0N6f convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 09:58:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232185AbhG0N6c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 09:58:32 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22627C061757
        for <linux-renesas-soc@vger.kernel.org>; Tue, 27 Jul 2021 06:58:30 -0700 (PDT)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1m8NbC-00008n-1y; Tue, 27 Jul 2021 15:58:22 +0200
Received: from pza by lupine with local (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1m8Nb5-0006hK-U5; Tue, 27 Jul 2021 15:58:15 +0200
Message-ID: <190c36e7efbd9a2ec0c17ac73485820102268569.camel@pengutronix.de>
Subject: Re: [PATCH v4 04/10] reset: renesas: Add RZ/G2L usbphy control
 driver
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Date:   Tue, 27 Jul 2021 15:58:15 +0200
In-Reply-To: <OS0PR01MB592261A1BE75C39115A4C01F86E99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210719121938.6532-1-biju.das.jz@bp.renesas.com>
         <20210719121938.6532-5-biju.das.jz@bp.renesas.com>
         <OS0PR01MB59224851A0C86B3AFECD575186E99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
         <94589fced6b4495593ff558b2b56eae4fff70bed.camel@pengutronix.de>
         <OS0PR01MB592261A1BE75C39115A4C01F86E99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-renesas-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, 2021-07-27 at 13:53 +0000, Biju Das wrote:
> Hi Philipp,
> 
> Thanks for the feedback
> 
> > Subject: Re: [PATCH v4 04/10] reset: renesas: Add RZ/G2L usbphy control
> > driver
> > 
> > Hi Biju,
> > 
> > On Tue, 2021-07-27 at 07:55 +0000, Biju Das wrote:
> > > Hi All,
> > > 
> > > Gentle ping. Are we happy with this patch? Please let me know.
> > 
> > Do you want me to pick up patches 3 and 4? Are there any dependencies that
> > I should be aware of?
> 
> Yes please. There is no compile time dependency at all.

Applied to reset/next, thanks.

regards
Philipp
