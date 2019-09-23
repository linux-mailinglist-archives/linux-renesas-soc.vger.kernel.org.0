Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 16D87BB2D6
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 23 Sep 2019 13:33:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728458AbfIWLd5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 23 Sep 2019 07:33:57 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58820 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727145AbfIWLd5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 07:33:57 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8CE7025B706;
        Mon, 23 Sep 2019 21:33:55 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 91DDD940310; Mon, 23 Sep 2019 13:33:53 +0200 (CEST)
Date:   Mon, 23 Sep 2019 13:33:53 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pwm: renesas: pwm-rcar: convert bindings to
 json-schema
Message-ID: <20190923113352.zzke445pyzjytipz@verge.net.au>
References: <1569008127-10555-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569008127-10555-1-git-send-email-ykaneko0929@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Sep 21, 2019 at 04:35:27AM +0900, Yoshihiro Kaneko wrote:
> Convert Renesas R-Car PWM Timer Controller bindings documentation to
> json-schema.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

