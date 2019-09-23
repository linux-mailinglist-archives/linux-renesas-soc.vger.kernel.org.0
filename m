Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACE28BB2B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 13:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732189AbfIWLQM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 07:16:12 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58366 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730155AbfIWLQL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 07:16:11 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D542A25B706;
        Mon, 23 Sep 2019 21:16:09 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DB576940310; Mon, 23 Sep 2019 13:16:07 +0200 (CEST)
Date:   Mon, 23 Sep 2019 13:16:07 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: irqchip: renesas-irqc: convert bindings
 to json-schema
Message-ID: <20190923111606.cp6bzcxui2a3hbkl@verge.net.au>
References: <1568915311-28928-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568915311-28928-1-git-send-email-ykaneko0929@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Sep 20, 2019 at 02:48:31AM +0900, Yoshihiro Kaneko wrote:
> Convert Renesas Interrupt Controller bindings documentation to json-schema.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
