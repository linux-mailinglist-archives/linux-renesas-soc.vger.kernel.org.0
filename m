Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26CC61B5AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 14:17:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729758AbfEMMRT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 08:17:19 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57794 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727437AbfEMMRT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 08:17:19 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C64C025AD63;
        Mon, 13 May 2019 22:17:16 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 57847E22B88; Mon, 13 May 2019 14:17:14 +0200 (CEST)
Date:   Mon, 13 May 2019 14:17:14 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: interrupt-controller: Add Renesas
 RZ/A1 Interrupt Controller
Message-ID: <20190513121714.hvyapq7t5zfhpmor@verge.net.au>
References: <20190502123220.3016-1-geert+renesas@glider.be>
 <20190502123220.3016-2-geert+renesas@glider.be>
 <20190507135144.2pkfndhb2bduozh5@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190507135144.2pkfndhb2bduozh5@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, May 07, 2019 at 03:51:44PM +0200, Simon Horman wrote:
> On Thu, May 02, 2019 at 02:32:16PM +0200, Geert Uytterhoeven wrote:
> > Add DT bindings for the Renesas RZ/A1 Interrupt Controller.
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

FWIIW, Acceptance/Approval of this patch is blocking me
applying the soc and dt patches of this series.
