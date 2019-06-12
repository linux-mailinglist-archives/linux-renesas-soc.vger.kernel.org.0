Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F468424E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 13:59:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727317AbfFLL7O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 07:59:14 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38770 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727233AbfFLL7O (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 07:59:14 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id DBC6125AD60;
        Wed, 12 Jun 2019 21:59:11 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id CE451E21FE5; Wed, 12 Jun 2019 13:59:09 +0200 (CEST)
Date:   Wed, 12 Jun 2019 13:59:09 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Andy Gross <agross@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Shawn Guo <shawn.guo@linaro.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v7 5/7] arm64: defconfig: enable TYPEC_HD3SS3220 config
 option
Message-ID: <20190612115909.7gsfxmdzrmqtzkc3@verge.net.au>
References: <1559296800-5610-1-git-send-email-biju.das@bp.renesas.com>
 <1559296800-5610-6-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559296800-5610-6-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 31, 2019 at 10:59:58AM +0100, Biju Das wrote:
> Enable support for the TI HD3SS320 USB Type-C DRP Port controller driver
> by turning on CONFIG_TYPEC and CONFIG_TYPEC_HD3SS3220 as modules.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thanks,

I see that the corresponding driver patch, "[PATCH v7 3/7] usb: typec:
driver for TI HD3SS3220 USB Type-C DRP port controller" has been reviewed
and appears destined for mainline.  On the strength of that I have applied
this patch for inclusion in v5.3. Please let me know if that is not desired
at this time.
