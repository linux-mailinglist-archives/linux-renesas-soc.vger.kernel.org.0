Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 755AD1E965
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 May 2019 09:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726039AbfEOHwG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 May 2019 03:52:06 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56848 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbfEOHwG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:52:06 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 20FA825AEAD;
        Wed, 15 May 2019 17:52:04 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id E5D49E21335; Wed, 15 May 2019 09:52:01 +0200 (CEST)
Date:   Wed, 15 May 2019 09:52:01 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        USB list <linux-usb@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v3 01/15] ARM: dts: r7s9210: Add USB clock
Message-ID: <20190515075201.cdz6tnurr2zclz6l@verge.net.au>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
 <20190514145605.19112-2-chris.brandt@renesas.com>
 <CAMuHMdWW=4nS__ykVBVe7Dz_3aaJQ4s5GK5Rdazg0nj4X==_Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWW=4nS__ykVBVe7Dz_3aaJQ4s5GK5Rdazg0nj4X==_Wg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 15, 2019 at 09:38:32AM +0200, Geert Uytterhoeven wrote:
> On Tue, May 14, 2019 at 4:56 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> > Add USB clock node. If present, this clock input must be 48MHz.
> >
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.3.
