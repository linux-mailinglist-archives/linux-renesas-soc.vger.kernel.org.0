Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9DC13A4313
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 15:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbhFKNeq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 09:34:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:37288 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229633AbhFKNeq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 09:34:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5E59761076;
        Fri, 11 Jun 2021 13:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623418353;
        bh=EIFpqlDym69GnyAlPWtXeooqguqpOX1xdv/QpaiV32M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jIgDx0bjxyUHw/R/rsxLuKV26m6btArLCkzKDqtcxKlXFk30rw/9fnpis2oK3KSMQ
         iYWR4tXAbXF4TydS+ja09Xlx29zeqbDbS6uIJPQbkv8WNsf5HP3KDDJ1t09c1OwY2t
         O2UJ4ZhlytTz4d2UdPDEanQ0NPS+69E/HgxZlO9s=
Date:   Fri, 11 Jun 2021 15:32:31 +0200
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] usb: renesas_usbhs: Fix superfluous interrupt happens
 after usb_pkt_pop()
Message-ID: <YMNl7+FClXrdBr5M@kroah.com>
References: <20210611105411.543008-1-yoshihiro.shimoda.uh@renesas.com>
 <TY2PR01MB36925F99E90B91E235CEE168D8349@TY2PR01MB3692.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY2PR01MB36925F99E90B91E235CEE168D8349@TY2PR01MB3692.jpnprd01.prod.outlook.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 11, 2021 at 10:57:56AM +0000, Yoshihiro Shimoda wrote:
> Hi again,
> 
> > From: Yoshihiro Shimoda, Sent: Friday, June 11, 2021 7:54 PM
> > Subject: [PATCH] usb: renesas_usbhs: Fix superfluous interrupt happens after usb_pkt_pop()
> 
> I'm sorry. I mistook to send this patch.
> So, I would like to recall this version.

Which version/patch?  You sent 2 here.

confused,

greg k-h
