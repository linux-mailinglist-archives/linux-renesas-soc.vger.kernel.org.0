Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 236D64213B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 11:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437364AbfFLJmu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 05:42:50 -0400
Received: from mga17.intel.com ([192.55.52.151]:62733 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2436777AbfFLJmu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 05:42:50 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jun 2019 02:42:44 -0700
X-ExtLoop1: 1
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 12 Jun 2019 02:42:22 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 12 Jun 2019 12:42:21 +0300
Date:   Wed, 12 Jun 2019 12:42:21 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v7 3/7] usb: typec: driver for TI HD3SS3220 USB Type-C
 DRP port controller
Message-ID: <20190612094221.GA19831@kuha.fi.intel.com>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
 <1559296800-5610-4-git-send-email-biju.das@bp.renesas.com>
 <20190612082502.GB18301@kuha.fi.intel.com>
 <OSBPR01MB21037C117F1E7125615AB643B8EC0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB21037C117F1E7125615AB643B8EC0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 12, 2019 at 08:42:47AM +0000, Biju Das wrote:
> Hi Heikki,
> 
> > Subject: Re: [PATCH v7 3/7] usb: typec: driver for TI HD3SS3220 USB Type-C
> > DRP port controller
> > 
> > On Fri, May 31, 2019 at 10:59:56AM +0100, Biju Das wrote:
> > > Driver for TI HD3SS3220 USB Type-C DRP port controller.
> > >
> > > The driver currently registers the port and supports data role swapping.
> > >
> > > Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> > 
> > Acked-by; Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Thanks.  I believe there is a typo  it should be ":"  instead of ";" .

True :)

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

-- 
heikki
