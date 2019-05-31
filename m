Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DDCC30BB2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2019 11:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726233AbfEaJfw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 May 2019 05:35:52 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:44124 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfEaJfv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 May 2019 05:35:51 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C810625AE77;
        Fri, 31 May 2019 19:35:49 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id BFA799401DB; Fri, 31 May 2019 11:35:47 +0200 (CEST)
Date:   Fri, 31 May 2019 11:35:47 +0200
From:   Simon Horman <horms@verge.net.au>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>
Subject: Re: [PATCH v4 0/8] arm64: dts: renesas: r8a7795: Add IPA support and
 dynamic power coefficient
Message-ID: <20190531093547.azktf3odsa5bg42n@verge.net.au>
References: <20190523142544.1273-1-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190523142544.1273-1-horms+renesas@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, May 23, 2019 at 04:25:36PM +0200, Simon Horman wrote:
> 1) Setup a thermal zone driven by SoC temperature sensor.
>    Create passive trip points and bind them to CPUFreq cooling
>    device that supports power extension.
> 
> 2) Describe dynamic power coefficient of CPUs
> 
> Changes since v3:
> * Minor changelot updates
> * Include updates for r8a7796, r8a77965 and r8a77990
>   (omitted in v2 and v3 to reduce review/preparation overhead)
> 
> Changes since v2:
> * Break power coefficient changes into separate patch.
> 
> 
> Dien Pham (4):
>   arm64: dts: renesas: r8a7795: Create thermal zone to support IPA
>   arm64: dts: renesas: r8a7796: Create thermal zone to support IPA
>   arm64: dts: renesas: r8a77965: Create thermal zone to support IPA
>   arm64: dts: renesas: r8a77990: Create thermal zone to support IPA
> 
> Simon Horman (4):
>   arm64: dts: renesas: r8a7795: Add dynamic power coefficient
>   arm64: dts: renesas: r8a7796: Add dynamic power coefficient
>   arm64: dts: renesas: r8a77965: Add dynamic power coefficient
>   arm64: dts: renesas: r8a77990: Add dynamic power coefficient
> 
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 54 ++++++++++---------------------
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 46 ++++++++++----------------
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 20 ++++++++++++
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 20 ++++++++++--
>  4 files changed, 71 insertions(+), 69 deletions(-)

Applied for v5.3.
