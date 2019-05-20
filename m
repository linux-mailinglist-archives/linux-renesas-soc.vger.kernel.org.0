Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5A9F232DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 May 2019 13:43:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731389AbfETLmz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 May 2019 07:42:55 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34736 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbfETLmz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 May 2019 07:42:55 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3CF0D25AD7A;
        Mon, 20 May 2019 21:42:53 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 33FD49404D4; Mon, 20 May 2019 13:42:51 +0200 (CEST)
Date:   Mon, 20 May 2019 13:42:51 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 11/13] ARM: dts: r7s9210: Add USB Host support
Message-ID: <20190520114246.krdualiwdhr3gu4h@verge.net.au>
References: <20190515152048.42363-1-chris.brandt@renesas.com>
 <20190515152048.42363-12-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190515152048.42363-12-chris.brandt@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 15, 2019 at 10:20:46AM -0500, Chris Brandt wrote:
> Add EHCI and OHCI host support for RZ/A2.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Chris,

applied for inclusion in v5.3.
