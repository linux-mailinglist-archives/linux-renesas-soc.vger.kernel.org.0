Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A39372D22
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2019 13:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726981AbfGXLNd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Jul 2019 07:13:33 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45686 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726960AbfGXLNc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Jul 2019 07:13:32 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id ED88425B7BE;
        Wed, 24 Jul 2019 21:13:29 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id C18CFE22041; Wed, 24 Jul 2019 13:13:27 +0200 (CEST)
Date:   Wed, 24 Jul 2019 13:13:27 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, geert+renesas@glider.be,
        daniel.lezcano@linaro.org, linux-renesas-soc@vger.kernel.org,
        robh+dt@kernel.org, tglx@linutronix.de
Subject: Re: [PATCH 7/7] clocksource/drivers/sh_cmt: Document "cmt-48" as
 deprecated
Message-ID: <20190724111327.gwurememjdhsbgtf@verge.net.au>
References: <156345023791.5307.6113391102648394591.sendpatchset@octo>
 <156345033835.5307.9206628986166423962.sendpatchset@octo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156345033835.5307.9206628986166423962.sendpatchset@octo>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jul 18, 2019 at 08:45:38PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Update the CMT driver to mark "renesas,cmt-48" as deprecated.
> 
> Instead of documenting a theoretical hardware device based on current software
> support level, define DT bindings top-down based on available data sheet
> information and make use of part numbers in the DT compat string.
> 
> In case of the only in-tree users r8a7740 and sh73a0 the compat strings
> "renesas,r8a7740-cmt1" and "renesas,sh73a0-cmt1" may be used instead.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

