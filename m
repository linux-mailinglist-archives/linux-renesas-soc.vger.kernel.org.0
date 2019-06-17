Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49ED647D55
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 10:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727649AbfFQIkG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 04:40:06 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:35278 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727669AbfFQIkF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 04:40:05 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 49E0E25AED3;
        Mon, 17 Jun 2019 18:40:04 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4B70794024A; Mon, 17 Jun 2019 10:40:02 +0200 (CEST)
Date:   Mon, 17 Jun 2019 10:40:02 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb: renesas_usbhs: Use struct assignment instead of
 memcpy()
Message-ID: <20190617084001.67c5524q4xp3xh4i@verge.net.au>
References: <1560424728-13929-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560424728-13929-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 13, 2019 at 08:18:48PM +0900, Yoshihiro Shimoda wrote:
> To avoid the error-proneness of calls to sizeof() in the memcpy,
> this patch uses struct assignment instead of memcpy.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
