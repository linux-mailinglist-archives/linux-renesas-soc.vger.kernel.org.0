Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3376B42511
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 14:09:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406363AbfFLMJV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 08:09:21 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:39222 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405581AbfFLMJU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 08:09:20 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5F85925AD60;
        Wed, 12 Jun 2019 22:09:18 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id A6843E21FE5; Wed, 12 Jun 2019 14:09:15 +0200 (CEST)
Date:   Wed, 12 Jun 2019 14:09:15 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v7 7/7] arm64: dts: renesas: cat874: Enable usb role
 switch support
Message-ID: <20190612120915.pkoljraxl7oilk5u@verge.net.au>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
 <1559296800-5610-8-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559296800-5610-8-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 31, 2019 at 11:00:00AM +0100, Biju Das wrote:
> This patch enables TI HD3SS3220 device and support usb role switch
> for the CAT 874 platform.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

the related dt-bindings patch, "[PATCH v7 1/7] dt-bindings: usb: hd3ss3220
device tree binding document" appears to have been reviewed and on-track
for inclusion in mainline. On the strength of that I have applied this
patch for inclusion in v5.3. Let me know if that is not desired at this
time.
