Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 527B84F1764
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 16:43:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350751AbiDDOpb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 10:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379290AbiDDOof (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 10:44:35 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FC7943AF8;
        Mon,  4 Apr 2022 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649083199; x=1680619199;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=1gQ3++FzrayW9QOsopIIgb0F8M/Kgf9VfCcFL8iZW1k=;
  b=BnosQoInZRr5iyjq2XpnLQjMs39GNYS0caOAD0TizgtPFRhRN1QsMaNZ
   xBIWUbg/U48bbFMp+c37e/OaQEmKBKEuCClnwbvk+ScJfbbU7lUMrI2z3
   7xFPWQGlulcfTaNflcM18JL4u4KwFoYUJ5Zi1DeWif+Lh3QwUgJPAIZFF
   0fddql9e3y4DfL1EjlsBX7Pgik6B4Vm8hhh6msmFk+S5mwG5bsuA13UOQ
   vKaAjfRYCT06QOJfGt0+WcM4KYrb21bazYJvvFhN47+JA4GoP0ge64KJM
   RtJ6DlM1q7OQOL7L94ABCXKv1GBhVAe4vanLbBz5RmyBYTGe8dCeQXFDB
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="260225020"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; 
   d="scan'208";a="260225020"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 07:39:45 -0700
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; 
   d="scan'208";a="569409446"
Received: from rhamza-mobl.ger.corp.intel.com ([10.251.211.126])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 07:39:40 -0700
Date:   Mon, 4 Apr 2022 17:39:38 +0300 (EEST)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-serial <linux-serial@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>
Subject: Re: [PATCH v4 0/9] serial: 8250: dw: RZN1 DMA support
In-Reply-To: <20220404162050.7831ebfe@xps13>
Message-ID: <42b8671b-48a2-43f0-975b-3b9e98202328@linux.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com> <YkRlfGUM/lb1fKC6@smile.fi.intel.com> <20220404162050.7831ebfe@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 4 Apr 2022, Miquel Raynal wrote:

> Hello,
> 
> andriy.shevchenko@linux.intel.com wrote on Wed, 30 Mar 2022 17:13:16
> +0300:
> 
> > On Wed, Mar 30, 2022 at 03:20:29PM +0200, Miquel Raynal wrote:
> > > Hello,
> > > 
> > > Support for the RZN1 DMA engine allows us adapt a little bit the 8250 DW
> > > UART driver with to bring DMA support for this SoC.
> > > 
> > > This short series applies on top of the series bringing RZN1 DMA
> > > support, currently on its v5, see [1]. Technically speaking, only the DT
> > > patch needs to be applied after [1]. The other patches can come in at
> > > any moment, because if no "dmas" property is provided in the DT, DMA
> > > support will simply be ignored.
> > > 
> > > [1] https://lore.kernel.org/dmaengine/20220315191255.221473-1-miquel.raynal@bootlin.com/T/#m0ef3323abce3eec961e142bf2fb35e95b9045fc5  
> > 
> > Couple of versions ago I have asked you to Cc the series to Ilpo (Cc'ed).
> > I hope you will not forget it in v5.
> 
> Sorry I forgot to re-add manually Ilpo in the recipients.
> 
> Anyway, if Ilpo really needs to be Cc'ed, then there is something to do
> on MAINTAINER's side.

While I'm considering doing like you suggest, I don't think it can be in 
general said that people who you're specificially told to Cc would be ok 
to get dropped unless they're among the listed maintainers.


-- 
 i.

