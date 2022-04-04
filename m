Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2B1A4F1860
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 17:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359499AbiDDPbS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 11:31:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356192AbiDDPbQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 11:31:16 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF082528C;
        Mon,  4 Apr 2022 08:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1649086160; x=1680622160;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vndZ3kJZ6l/muoOzYrxE6LSO++WUAQUZd7dQKpa+WZA=;
  b=ObtEAb8EKGpdF+rQn/f0EM+QXiEXayxbxvX432mj3varJ9wBS4YBFskI
   omv1dv1P0TFlc6OTQ01suqdin3fYktVrQE5QiQMj/idT9R/hemp3ECQM0
   Z40ni53CdZy15nEm9ngQZVBMkfxpH4v36MXwMjhrxywNjWGeAU88ZZtVy
   YVRKB6Ir1r5kQnJzPeS5rXGTOz8zmwMloRyKyq/2PsTQzA++7UnvvV87D
   oV8mZqPJI/R+NUSzyNQxe3ihQCYjiU8EKprHJZx6QaLhTnPUN7+ZscWfp
   fIiJplU29Weg3H02CSMHr++UviGIeFNLbngz3er6kk5gvOi8l6bxNtA1I
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10307"; a="248053708"
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; 
   d="scan'208";a="248053708"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 08:29:18 -0700
X-IronPort-AV: E=Sophos;i="5.90,234,1643702400"; 
   d="scan'208";a="569428775"
Received: from rhamza-mobl.ger.corp.intel.com ([10.251.211.126])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2022 08:29:14 -0700
Date:   Mon, 4 Apr 2022 18:29:11 +0300 (EEST)
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
        Clement Leger <clement.leger@bootlin.com>,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: Re: [PATCH v4 7/9] serial: 8250: dw: Add support for DMA flow
 controlling devices
In-Reply-To: <20220404172033.56c55a37@xps13>
Message-ID: <dcf9f1b3-87fa-2171-3f2d-f4a45c9efdb@linux.intel.com>
References: <20220330132038.808679-1-miquel.raynal@bootlin.com>        <20220330132038.808679-8-miquel.raynal@bootlin.com>        <24becf8-82c5-5a12-690-5b9e067ec1c@linux.intel.com>        <Ykc4kGLEnwdoUqZ6@smile.fi.intel.com>
 <20220404172033.56c55a37@xps13>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-746848247-1649086158=:11904"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-746848247-1649086158=:11904
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 4 Apr 2022, Miquel Raynal wrote:

> Hi Andy, Ilpo,
> 
> andriy.shevchenko@linux.intel.com wrote on Fri, 1 Apr 2022 20:38:24
> +0300:
> 
> > On Fri, Apr 01, 2022 at 01:56:49PM +0300, Ilpo Järvinen wrote:
> > > On Wed, 30 Mar 2022, Miquel Raynal wrote:  
> > 
> > ...
> > 
> > > > +			writel(0, p->membase + RZN1_UART_RDMACR);
> > > > +			writel(1, p->membase + DW_UART_DMASA);  
> > > 
> > > Currently there is serial_out(), dw8250_writel_ext(), and a few writel()s 
> > > too for writing to registers. It would be nice to move towards more 
> > > homogeneous approach rather than adding more writel()s.  
> > 
> > Actually a good catch!
> > 
> > > I suggest dw8250_writel_ext() is moved to dwlib.h. Then it could be used 
> > > here (and dw8250_readl_ext() too should be moved but IIRC there wasn't 
> > > any reads added by this series).  
> > 
> > I agree that for the sake of symmetry it's good to move both.
> 
> I moved them both to dwlib.h as suggested.
> 
> I had a look at the current uses of readb/l and writeb/l in dw.c but
> converting all these function calls is not as straightforward as I
> initially thought so I decided to limit myself to moving these helpers
> and using them in my additions, I hope this is fine.

Yes, I think it's enough for this series.


-- 
 i.

--8323329-746848247-1649086158=:11904--
