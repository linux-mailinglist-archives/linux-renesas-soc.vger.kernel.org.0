Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EEFD694186
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Feb 2023 10:41:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230313AbjBMJl2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Feb 2023 04:41:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230397AbjBMJlU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Feb 2023 04:41:20 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4210126C2;
        Mon, 13 Feb 2023 01:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676281262; x=1707817262;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Y7G9zEsvdIfX8TiOyD5qigYI/W3Bv9o5zukstDlMd5A=;
  b=Xo6DJeQgLxDqNL3aGoeuHwVeTO9troaRkqPmwo0WesxXBWPhhxEO9wD9
   Xpf0L/1PkdqrbRpTkXKTxErGZBLRi6l/PqI83fVyYpYPS6RB5RNsp0S/o
   tYvGRyEo3iqoCJTOfjagWv8dE0li5+eO7GcAAX7LnDGB3phTqrhCLS+mR
   kP7plfMmFM8aC6SdM48maI08LSCj/IybywAvH05UKAxvsQhrbDNb6ePyl
   bTc7VkRtWOvhpEgXkRlHaISs8hl4aW5BNXPGJcA+1czlGA8Ebgg4/iSNl
   KzlcbgMLOUPPl1kP5eAsf+DJkxGq+Wo376pV3jL2WNydcag5MhktgkxUm
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="310485960"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="310485960"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 01:40:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="997632799"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="997632799"
Received: from hdevries-mobl.ger.corp.intel.com ([10.249.36.140])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 01:40:51 -0800
Date:   Mon, 13 Feb 2023 11:40:49 +0200 (EET)
From:   =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Jiri Slaby <jirislaby@kernel.org>
cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-serial <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] serial: 8250_em: Add serial_out() to struct
 serial8250_em_hw_info
In-Reply-To: <4dfbdc92-bc49-11b7-932d-806079ede9c9@kernel.org>
Message-ID: <7a1379c9-99cb-e955-4f69-e360743ad44a@linux.intel.com>
References: <20230210203439.174913-1-biju.das.jz@bp.renesas.com> <20230210203439.174913-4-biju.das.jz@bp.renesas.com> <56b431df-be7f-474c-8cf5-30c2eaa2745a@linux.intel.com> <OS0PR01MB5922A860B77A9BC0C9E5E3AC86DD9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <cc7f4d69-7e68-0d0a-4b89-c4e16dff716b@kernel.org> <56c8fdab-a037-ea00-d83e-f75c92566d92@kernel.org> <9d141bd9-ca58-4ea-e17b-4a3229eda9b2@linux.intel.com> <4dfbdc92-bc49-11b7-932d-806079ede9c9@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-949675858-1676281253=:1712"
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-949675858-1676281253=:1712
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 13 Feb 2023, Jiri Slaby wrote:

> On 13. 02. 23, 10:22, Ilpo Järvinen wrote:
> > On Mon, 13 Feb 2023, Jiri Slaby wrote:
> > 
> > > On 13. 02. 23, 10:10, Jiri Slaby wrote:
> > > > On 13. 02. 23, 9:53, Biju Das wrote:
> > > > > > > +static void serial8250_rzv2m_reg_update(struct uart_port *p, int
> > > > > > > off,
> > > > > > > +int value) {
> > > > > > > +    unsigned int ier, fcr, lcr, mcr, hcr0;
> > > > > > > +
> > > > > > > +    ier = serial8250_em_serial_in(p, UART_IER);
> > > > > > > +    lcr = serial8250_em_serial_in(p, UART_LCR);
> > > > > > > +    mcr = serial8250_em_serial_in(p, UART_MCR);
> > > > > > > +    hcr0 = serial8250_em_serial_in(p, UART_HCR0);
> > > > > > > +    /*
> > > > > > > +     * The value of UART_IIR and UART_FCR are 2, but
> > > > > > > corresponding
> > > > > > > +     * RZ/V2M address offset are different(0x08 and 0x0c). So we
> > > > > > > need
> > > > > > > to
> > > > > > > +     * use readl() here.
> > > > > > > +     */
> > > > > > > +    fcr = readl(p->membase + ((UART_FCR + 1) << 2));
> > > > > > 
> > > > > > I don't get the meaning of that comment. It doesn't seem to match
> > > > > > what
> > > > > > your
> > > > > > code does as the code seemingly has nothing to do with IIR (and none
> > > > > > of
> > > > > > you
> > > > > > changelogs refer to IIR either)?
> > > > > 
> > > > > The generic macro UART_IIR and UART_FCR in linux/serial_reg.h has a
> > > > > value
> > > > > of 2.
> > > > 
> > > > Sure, IIR is normally WO and FCR RO and share the same register. I would
> > > > simply define UART_FCR_RZ (or alike)
> > > 
> > > Or even UART_FCR_RO_RZ?
> > > 
> > > > for 0x12.
> > > 
> > > I mean 12 or 0xc.
> > 
> > Won't that collide with LCR reads then? They are currently mapped by
> > return 0; but after adding a case for UART_FCR_RO_RZ they'll read from
> > what is the FCR register on this HW?
> 
> LCR is WO, right? But maybe I'm confused by this really weird HW design?

LCR is not WO and it is read during autoconfig too:

8250_port.c=static int size_fifo(struct uart_8250_port *up)
8250_port.c:    old_lcr = serial_in(up, UART_LCR);
8250_port.c=static unsigned int autoconfig_read_divisor_id(struct uart_8250_port *p)
8250_port.c:    old_lcr = serial_in(p, UART_LCR);
8250_port.c=static void autoconfig(struct uart_8250_port *up)
8250_port.c:    save_lcr = serial_in(up, UART_LCR);

Although the only thing the value is used for is to write it back to LCR.


-- 
 i.

--8323329-949675858-1676281253=:1712--
