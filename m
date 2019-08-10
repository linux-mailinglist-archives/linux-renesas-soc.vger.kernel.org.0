Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D45D88AFB
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 10 Aug 2019 13:15:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726066AbfHJLO7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 10 Aug 2019 07:14:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:39088 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbfHJLO7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 10 Aug 2019 07:14:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C9F3C20B7C;
        Sat, 10 Aug 2019 11:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565435698;
        bh=t13AIRAZYhoUrOLJvl5x+ZVgB0KL8o23fw6CXgqk6is=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dC7XyLuXD6ZGuNwqdrTSZbaDo4D2XwOfBXHmyeo+IUXyud1E+ReRZ8QTKK2VoCj6d
         gTGCpnLVLgt8GQrz6NCeHxCwPaexPpXEsBhAV+L5Z9vnc4mY4N4V2iEdL1KKAqBvH0
         Cr32mFwadSkNbJTt0xHIY4XDUuPcKvFbhRRECB+Q=
Date:   Sat, 10 Aug 2019 13:14:55 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Simon Horman <horms+renesas@verge.net.au>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: usb: renesas_gen3: Rename bindings
 documentation file to reflect IP block
Message-ID: <20190810111455.GA30455@kroah.com>
References: <20190809213710.31783-1-horms+renesas@verge.net.au>
 <CAMuHMdUHK7Fq3m4y1rjVFxnSXH3tZyTjOzFMfVMtRtPcdKjNCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUHK7Fq3m4y1rjVFxnSXH3tZyTjOzFMfVMtRtPcdKjNCw@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Aug 10, 2019 at 08:40:15AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Aug 9, 2019 at 11:37 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > For consistency with the naming of (most) other documentation files for DT
> > bindings for Renesas IP blocks rename the Renesas USB3.0 peripheral
> > documentation file from renesas,usb3.txt to renesas,usb3-peri.txt
> >
> > This refines a recent rename from renesas_usb3.txt to renesas-usb3.txt.
> 
> s/renesas-usb3.txt/renesas,usb3.txt/

I'll fix it up now, no need for a resend...

