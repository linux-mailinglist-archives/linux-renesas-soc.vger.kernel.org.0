Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8558CB4EC
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2019 09:22:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729462AbfJDHWW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Oct 2019 03:22:22 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:21208 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728356AbfJDHWV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 03:22:21 -0400
Date:   04 Oct 2019 16:22:19 +0900
X-IronPort-AV: E=Sophos;i="5.67,255,1566831600"; 
   d="scan'208";a="28060776"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 Oct 2019 16:22:19 +0900
Received: from morimoto-PC.renesas.com (unknown [10.166.18.140])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EFFFB4005155;
        Fri,  4 Oct 2019 16:22:18 +0900 (JST)
Message-ID: <87muehgel1.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a774b1: Add Sound and Audio DMAC device nodes
In-Reply-To: <1570172057-46159-1-git-send-email-biju.das@bp.renesas.com>
References: <1570172057-46159-1-git-send-email-biju.das@bp.renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/24.5 Mule/6.0
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org


Hi Biju

Thank you for your patch

> Based on a similar patch of the R8A7796 device tree
> by Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
(snip)
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				port@0 {
> +					reg = <0>;
> +				};
> +				port@1 {
> +					reg = <1>;
> +				};
> +			};

This is needed at platform side, not SoC side.

Thank you for your help !!
Best regards
---
Kuninori Morimoto
