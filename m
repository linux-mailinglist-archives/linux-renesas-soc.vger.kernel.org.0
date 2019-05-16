Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B16522043F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 May 2019 13:14:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727274AbfEPLNR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 May 2019 07:13:17 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:54768 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727281AbfEPLNQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 May 2019 07:13:16 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 916BA25AE99;
        Thu, 16 May 2019 21:13:14 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 89818E21EEB; Thu, 16 May 2019 13:13:12 +0200 (CEST)
Date:   Thu, 16 May 2019 13:13:12 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] phy: renesas: phy-rcar-gen2: Fix the array off by one
 warning
Message-ID: <20190516111312.rrscsw6eho3pvqoo@verge.net.au>
References: <1557927786-29557-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557927786-29557-1-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, May 15, 2019 at 02:43:06PM +0100, Biju Das wrote:
> Fix the below smatch warning by adding variable check rather than the
> hardcoded value.
> warn: array off by one? 'data->select_value[channel_num]'
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

