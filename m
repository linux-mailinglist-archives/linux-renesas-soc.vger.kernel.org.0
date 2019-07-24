Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5E972D06
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2019 13:12:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbfGXLMl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jul 2019 07:12:41 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45452 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726622AbfGXLMl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jul 2019 07:12:41 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id DCC9025BE43;
        Wed, 24 Jul 2019 21:12:38 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id E2DF5E22041; Wed, 24 Jul 2019 13:12:36 +0200 (CEST)
Date:   Wed, 24 Jul 2019 13:12:36 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, geert+renesas@glider.be,
        daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, tglx@linutronix.de
Subject: Re: [PATCH 1/7] dt-bindings: timer: renesas, cmt: Add CMT0234 to
 sh73a0 and r8a7740
Message-ID: <20190724111236.gkhs22rizwalpc63@verge.net.au>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
 <156345025207.5307.17135263586186534810.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156345025207.5307.17135263586186534810.sendpatchset@octo>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 18, 2019 at 08:44:12PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Document the on-chip CMT devices included in r8a7740 and sh73a0.
> 
> Included in this patch is DT binding documentation for 32-bit CMTs
> CMT0, CMT2, CMT3 and CMT4. They all contain a single channel and are
> quite similar however some minor differences still exist:
>  - "Counter input clock" (clock input and on-device divider)
>     One example is that RCLK 1/1 is supported by CMT2, CMT3 and CMT4.
>  - "Wakeup request" (supported by CMT0 and CMT2)
> 
> Because of this one unique compat string per CMT device is selected.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

