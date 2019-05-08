Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F37C71759F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 May 2019 12:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726768AbfEHKIW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 May 2019 06:08:22 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:47306 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726776AbfEHKIW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 May 2019 06:08:22 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 2D63025AF6B;
        Wed,  8 May 2019 20:08:20 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1B0BC9403E0; Wed,  8 May 2019 12:08:18 +0200 (CEST)
Date:   Wed, 8 May 2019 12:08:18 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        broonie@kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, daniel.lezcano@linaro.org,
        tglx@linutronix.de, robh@kernel.org,
        yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH v2 0/5] Add TPU support for R-Car H3/M3-W/M3-N
Message-ID: <20190508100817.ap5i7djcoi2z5zbt@verge.net.au>
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Apr 25, 2019 at 10:25:12AM +0900, Cao Van Dong wrote:
> This series adds tpu support for r8a7795/r8a7796/r8a77965 SoCs.
> Based on the renesas-drivers-2019-04-02-v5.1-rc3 tag of renesas-drivers tree.
> For test, after booting, I found the device was registered in the booting log.
> 
> Cao Van Dong (5):
>   clk: renesas: r8a779{5|6|65}: Add TPU clock
>   arm64: dts: renesas: r8a7795: Add TPU support
>   arm64: dts: renesas: r8a7796: Add TPU support
>   arm64: dts: renesas: r8a77965: Add TPU support
>   dt-bindings: pwm: renesas: tpu: Document R8A779{5|6|65} bindings

Thanks,

I have applied the dts patches for inclusion in v5.3 based on
a) Testing by Geert and yourself; and
b) A belief that the hardware is very similar on the SoCs covered
   by this patchset
