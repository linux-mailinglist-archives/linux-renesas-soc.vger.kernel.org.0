Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCE12164F5
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  7 May 2019 15:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbfEGNts (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 7 May 2019 09:49:48 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:60424 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726295AbfEGNtr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 7 May 2019 09:49:47 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A83A225AD8B;
        Tue,  7 May 2019 23:49:45 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 90A3D9403F2; Tue,  7 May 2019 15:49:43 +0200 (CEST)
Date:   Tue, 7 May 2019 15:49:43 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r7s9210-rza2mevb: add ethernet aliases
Message-ID: <20190507134942.idhlkq2rueaxn3li@verge.net.au>
References: <20190506201236.110281-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190506201236.110281-1-chris.brandt@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, May 06, 2019 at 03:12:36PM -0500, Chris Brandt wrote:
> Add ethernet aliases so u-boot can find the device nodes.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks Chris,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
