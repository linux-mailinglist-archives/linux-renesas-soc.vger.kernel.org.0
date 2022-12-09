Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0C3964866C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Dec 2022 17:17:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229715AbiLIQRH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Dec 2022 11:17:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiLIQRG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2022 11:17:06 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 016F680A11;
        Fri,  9 Dec 2022 08:17:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8732562086;
        Fri,  9 Dec 2022 16:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96C42C433EF;
        Fri,  9 Dec 2022 16:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670602625;
        bh=KAxlnzl5MNz5dTGtMn4zNk5uXxipggCtCn5pdRueOuI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U6iM06caIEOWCXsrQYHkAFbJILCIbqFPGLc8gzc+DjXoJzH8chRUEOYKouk9svtwC
         G7qB6b0VM2Rta3P/vYzrVrVjZEsCoJajIgnLKPCsSTNZ4va4kwU4Gxn1KAGlaLtjJ5
         uwVI8NFoh2JsWb3ZFOC++8WslPcRQnVFhd8rSAHw=
Date:   Fri, 9 Dec 2022 17:17:01 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Biju Das <biju.das@bp.renesas.com>, linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: typec: hd3ss3220: Fix NULL pointer crash
Message-ID: <Y5NfffSLz7DUgF3b@kroah.com>
References: <20221209155623.29147-1-biju.das.jz@bp.renesas.com>
 <20221209155623.29147-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221209155623.29147-3-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Dec 09, 2022 at 03:56:21PM +0000, Biju Das wrote:
> The value returned by usb_role_switch_get() can be NULL and it leads
> to NULL pointer crash. This patch fixes this issue by adding NULL
> check for the role switch handle.

Why isn't this the first patch here, and cc: stable, or just as an
individual patch that has nothing to do with the other new feature
patches?

thanks,

greg k-h
