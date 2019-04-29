Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACBF3E353
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 15:11:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727332AbfD2NLO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 09:11:14 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45994 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfD2NLN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 09:11:13 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6024E25B263;
        Mon, 29 Apr 2019 23:11:11 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 69CA9940376; Mon, 29 Apr 2019 15:11:09 +0200 (CEST)
Date:   Mon, 29 Apr 2019 15:11:09 +0200
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
Subject: Re: [PATCH 4/5] ARM: dts: r7s72100: Add IRQC device node
Message-ID: <20190429131109.6qqti7z47sy6xucd@verge.net.au>
References: <20190429093631.10799-1-geert+renesas@glider.be>
 <20190429093631.10799-5-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429093631.10799-5-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 29, 2019 at 11:36:30AM +0200, Geert Uytterhoeven wrote:
> Enable support for the IRQC on RZ/A1H, which is a small front-end to the
> GIC.  This allows to use up to 8 external interrupts with configurable
> sense select.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert,

this is fine by me but other parts of the series need respinning.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
