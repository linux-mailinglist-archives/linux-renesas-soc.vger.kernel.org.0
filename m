Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE781B59E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 14:15:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728035AbfEMMPc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 08:15:32 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57710 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727437AbfEMMPc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 08:15:32 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0280C25AD69;
        Mon, 13 May 2019 22:15:30 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id E0BF5E22B88; Mon, 13 May 2019 14:15:27 +0200 (CEST)
Date:   Mon, 13 May 2019 14:15:27 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] irqchip/renesas-irqc: Replace irqc_priv.pdev by
 irqc_priv.dev
Message-ID: <20190513121527.tkbliq2n747tusxw@verge.net.au>
References: <20190429152006.22593-1-geert+renesas@glider.be>
 <20190429152006.22593-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429152006.22593-5-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 29, 2019 at 05:20:05PM +0200, Geert Uytterhoeven wrote:
> Nothing really uses irqc_priv.pdev, all users need irqc_priv.pdev->dev.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

