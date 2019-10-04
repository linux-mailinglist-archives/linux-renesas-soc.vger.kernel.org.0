Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 74DE2CBA35
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2019 14:19:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728356AbfJDMTf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Oct 2019 08:19:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:49908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728288AbfJDMTe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 08:19:34 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F02F6215EA;
        Fri,  4 Oct 2019 12:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1570191573;
        bh=EZhcaGWIbvQNFC3/x1R6aUD4//NbWdk3Zca6MrIdJoA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=za1MnphWmlCH0KGtsCgXp7XDwes6il1aMU0DBMP5JXqabUqKHFw9ml10Nnmcf7sww
         ty3WB7F06h4uiq1fk5mjfqNANTflqXRjIPFDIfyrbPWrh7SZbpo4Sfa/O8FnauHU/K
         ZZoNxwcoSUA1XWtO1Oij+4yTU48HUWSTrAFFWMXU=
Date:   Fri, 4 Oct 2019 14:19:26 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH RESEND v7 0/3] Add USB3.0 and TI HD3SS3220 driver support
Message-ID: <20191004121926.GA409389@kroah.com>
References: <1567584941-13690-1-git-send-email-biju.das@bp.renesas.com>
 <OSBPR01MB21033E657CB361169BE71D51B89F0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB21033E657CB361169BE71D51B89F0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Oct 03, 2019 at 01:06:31PM +0000, Biju Das wrote:
> Hi Greg,
> 
> Polite reminder.  
> 
> Are happy with the below patch series, since the dependency patches hit on mainline 5.4-rc1?
> 
> https://patchwork.kernel.org/project/linux-usb/list/?series=169305

Now queued up, thanks.

greg k-h
