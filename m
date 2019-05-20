Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F213F232FC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 13:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730770AbfETLsm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 07:48:42 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35648 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730479AbfETLsm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 07:48:42 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A405325AD7A;
        Mon, 20 May 2019 21:48:39 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id A050B9404D4; Mon, 20 May 2019 13:48:37 +0200 (CEST)
Date:   Mon, 20 May 2019 13:48:37 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>, xu_shunji@hoperun.com
Subject: Re: [PATCH v3 2/2] dt-bindings: arm: renesas: Add HopeRun RZ/G2[M]
 boards
Message-ID: <20190520114837.47bslbglanvidthx@verge.net.au>
References: <1558085189-22061-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1558085189-22061-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558085189-22061-3-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 17, 2019 at 10:26:29AM +0100, Fabrizio Castro wrote:
> This patch adds board HiHope RZ/G2M (the main board, powered by
> the R8A774A1) and board HiHope RZ/G2 EX (the expansion board
> that sits on top of the HiHope RZ/G2M). Both boards are made
> by Jiangsu HopeRun Software Co., Ltd. (a.k.a. HopeRun).
> 
> Useful links:
> http://hihope.org/product/detail/rzg2
> https://item.taobao.com/item.htm?spm=a2oq0.12575281.0.0.6bcf1debQpzkRS&ft=t&id=592177498472
> http://www.hoperun.com/Cn/news/id/379
> 
> We already know that the HiHope RZ/G2 EX will also sit on the
> HiHope RZ/G2N, even though the HiHope RZ/G2N doesn't exist just
> yet.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Thanks Fabrizio,

applied for inclusion in v5.3.
