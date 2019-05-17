Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7C6217D3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2019 13:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbfEQLlw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 May 2019 07:41:52 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33026 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727727AbfEQLlw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 May 2019 07:41:52 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 947BE25AD7D;
        Fri, 17 May 2019 21:41:49 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9383B94048B; Fri, 17 May 2019 13:41:47 +0200 (CEST)
Date:   Fri, 17 May 2019 13:41:47 +0200
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
Subject: Re: [PATCH v3 1/2] dt-bindings: Add vendor prefix for HopeRun
Message-ID: <20190517114147.l547h3276nm4sn5c@verge.net.au>
References: <1558085189-22061-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1558085189-22061-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1558085189-22061-2-git-send-email-fabrizio.castro@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, May 17, 2019 at 10:26:28AM +0100, Fabrizio Castro wrote:
> Add "Jiangsu HopeRun Software Co., Ltd." to the list of devicetree
> vendor prefixes as "hoperun".
> 
> Website: http://www.hoperun.com/en
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

