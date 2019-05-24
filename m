Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0775298E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 24 May 2019 15:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391359AbfEXN2N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 24 May 2019 09:28:13 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58592 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391361AbfEXN2N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 24 May 2019 09:28:13 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 018B925AD7D;
        Fri, 24 May 2019 23:28:12 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 00D6C9404D5; Fri, 24 May 2019 15:28:09 +0200 (CEST)
Date:   Fri, 24 May 2019 15:28:09 +0200
From:   Simon Horman <horms@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] arm64: dts: renesas: ebisu: Remove renesas,
 no-ether-link property
Message-ID: <20190524132809.v7b4o4jk3t3ziusu@verge.net.au>
References: <20181121160808.13374-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181121160808.13374-1-horms+renesas@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Nov 21, 2018 at 08:08:08AM -0800, Simon Horman wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> It is incorrect to specify the no-ether-link property for the AVB device on
> the Ebisu board. This is because the property should only be used when a
> board does not provide a proper AVB_LINK signal. However, the Ebisu board
> does provide this signal.
> 
> As per 87c059e9c39d ("arm64: dts: renesas: salvator-x: Remove renesas,
> no-ether-link property") this fixes a bug:
> 
>     Steps to reproduce:
>     - start AVB TX stream (Using aplay via MSE),
>     - disconnect+reconnect the eth cable,
>     - after a reconnection the eth connection goes iteratively up/down
>       without user interaction,
>     - this may heal after some seconds or even stay for minutes.
> 
>     As the documentation specifies, the "renesas,no-ether-link" option
>     should be used when a board does not provide a proper AVB_LINK signal.
>     There is no need for this option enabled on RCAR H3/M3 Salvator-X/XS
>     and ULCB starter kits since the AVB_LINK is correctly handled by HW.
> 
>     Choosing to keep or remove the "renesas,no-ether-link" option will have
>     impact on the code flow in the following ways:
>     - keeping this option enabled may lead to unexpected behavior since the
>       RX & TX are enabled/disabled directly from adjust_link function
>       without any HW interrogation,
>     - removing this option, the RX & TX will only be enabled/disabled after
>       HW interrogation. The HW check is made through the LMON pin in PSR
>       register which specifies AVB_LINK signal value (0 - at low level;
>       1 - at high level).
> 
>     In conclusion, the present change is also a safety improvement because
>     it removes the "renesas,no-ether-link" option leading to a proper way
>     of detecting the link state based on HW interrogation and not on
>     software heuristic.
> 
> Fixes: 8441ef643d7d ("arm64: dts: renesas: r8a77990: ebisu: Enable EthernetAVB")
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [simon: updated changelog]
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

This seems to have fallen through the cracks.
I have applied it for inclusion in v5.3.
