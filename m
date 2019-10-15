Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3251D7367
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Oct 2019 12:36:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730783AbfJOKgN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Oct 2019 06:36:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:44358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726441AbfJOKgN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 06:36:13 -0400
Received: from localhost (unknown [171.76.96.211])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 470BC2064B;
        Tue, 15 Oct 2019 10:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571135773;
        bh=9iztyuwAyY1+lKbQfEHGpy3+Dgw2pZgS4ulG6VThWrs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZkqCFvCqSoL2hohqpARSrECg7b5GPzx2B6HM133Gyy/hYH6fEA7TNToeAeYcX0hsF
         LPCFL2bSMTbT5YG6MJvL5oZkn0g/2BEzXZo6DwaWjOJrsS/PXutJNjQ3tSzqvDA+L9
         k9sg4D+oG4Zti7Bvuj+gv8bRwKcoAYJKCuUi1tzY=
Date:   Tue, 15 Oct 2019 16:06:08 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: dmaengine: rcar-dmac: Document R8A774B1
 bindings
Message-ID: <20191015103608.GV2654@vkoul-mobl>
References: <1569580629-55677-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569580629-55677-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 27-09-19, 11:37, Biju Das wrote:
> Renesas RZ/G2N (R8A774B1) SoC also has the R-Car gen2/3 compatible
> DMA controllers, therefore document RZ/G2N specific bindings.

Applied, thanks

-- 
~Vinod
