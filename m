Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2CF3017526
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 11:32:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbfEHJcW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 05:32:22 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:39578 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfEHJcW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 05:32:22 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id B84A93C00C6;
        Wed,  8 May 2019 11:32:19 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id NQdVxZEwCnQm; Wed,  8 May 2019 11:32:13 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id ED1EC3C004C;
        Wed,  8 May 2019 11:32:12 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0; Wed, 8 May 2019
 11:32:12 +0200
Date:   Wed, 8 May 2019 11:32:10 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Marek Vasut <marek.vasut@gmail.com>
CC:     Marek Vasut <marek.vasut+renesas@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        <u-boot@lists.denx.de>, <linux-renesas-soc@vger.kernel.org>,
        Michael Dege <michael.dege@renesas.com>,
        Gotthard Voellmeke <gotthard.voellmeke@renesas.com>,
        Adam Bass <adam.bass@renesas.com>,
        Bastian Farkas <bfarkas@de.adit-jv.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Philipp Ahmann <pahmann@de.adit-jv.com>,
        Simon Maleyka <smaleyka@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: Automated/remote flashing of R-Car3
Message-ID: <20190508093210.GA17684@vmlxhi-102.adit-jv.com>
References: <20190507104115.GA27355@vmlxhi-102.adit-jv.com>
 <79ae01fb-6945-05c5-a08d-92aaffeaa6f0@gmail.com>
 <20190507155308.GA1600@vmlxhi-102.adit-jv.com>
 <48af9a12-57d9-0279-581f-e81698b18adb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <48af9a12-57d9-0279-581f-e81698b18adb@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 07, 2019 at 06:09:10PM +0200, Marek Vasut wrote:
[..]
> >>> 1.d. Use CPLD Configurator
> >>> + H3_M3_StarterKit_Configurator.exe is a Windows tool shipped by
> >>>   Renesas, hence readily available, which allows to modify the MD
> >>>   pins, to conveniently switch between QSPI/Hyperflash/SCIF
> >>>   boot mode from a GUI
> >>> + Most of the advantages pointed out above
> >>> - ULCB-only solution (i.e. does not apply to Salvator-X)
> >>> - Requires a Windows host
> >>
> >> Where can I obtain this and are there sources / documentation available?
> > 
> > I am able to find below related package freely available:
> > https://elinux.org/File:H3_StarterKit_CPLD_Update_20190408.zip
> > 
> > Unfortunately, it doesn't include H3_M3_StarterKit_Configurator.exe.
> > The user who uploaded the file is https://elinux.org/User:RenesasJa.
> > Are you aware of any messaging/commenting feature on elinux.org?
> > If not, I hope Michael (CC-ed) can answer your question. Hopefully
> > he sees this message. If not, I can forward your question to him via
> > mantis.
> 
> It would be also interesting to obtain the CPLD sources and be able to
> synthesise custom CPLD bitstreams for automated testing.

Is my understanding correct that these "CPLD bitstreams" (once known)
could be implemented in U-Boot's board/renesas/ulcb/cpld.c?

-- 
Best Regards,
Eugeniu.
