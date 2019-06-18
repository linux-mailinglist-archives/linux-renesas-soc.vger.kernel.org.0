Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 065664993F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 08:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfFRGrq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 02:47:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:54176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726007AbfFRGrq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 02:47:46 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 33C3720645;
        Tue, 18 Jun 2019 06:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560840465;
        bh=mQfh0C0JeS0A0+IQvv+298zojcZZwFO0yXtAm60lrqM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nrP56nXq7DGLDxbx+TfeAQdVycT2E2Svc8chq//QPc5xjy1IojSgsw88yqfIFMFwF
         Sry94dJKcBHjF8VKDkhQfxAuj6lhIA5QN9vmgEu5inV588qOt1nYk+rieUQKbThCuY
         UQ+ZdQ62OeI9KcGtOXIp2dR1e9Wd2AkYoQkCvSKc=
Date:   Tue, 18 Jun 2019 08:47:43 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Felipe Balbi <balbi@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-usb@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 3/7] usb: typec: driver for TI HD3SS3220 USB Type-C
 DRP port controller
Message-ID: <20190618064743.GA22269@kroah.com>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
 <1559296800-5610-4-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559296800-5610-4-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 31, 2019 at 10:59:56AM +0100, Biju Das wrote:
> Driver for TI HD3SS3220 USB Type-C DRP port controller.
> 
> The driver currently registers the port and supports data role swapping.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---

I tried to apply this, but get the following build error:

drivers/usb/typec/hd3ss3220.c: In function hd3ss3220_probe:
drivers/usb/typec/hd3ss3220.c:179:23: error: implicit declaration of function fwnode_usb_role_switch_get; did you mean usb_role_switch_get? [-Werror=implicit-function-declaration]
  hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
                       usb_role_switch_get
drivers/usb/typec/hd3ss3220.c:179:21: warning: assignment to struct usb_role_switch * from int makes pointer from integer without a cast [-Wint-conversion]
  hd3ss3220->role_sw = fwnode_usb_role_switch_get(connector);
                     ^

You might want to fix that so the series can be applied :(

thanks,

greg k-h
