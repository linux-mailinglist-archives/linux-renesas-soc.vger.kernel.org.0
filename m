Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB31464DA99
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Dec 2022 12:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229911AbiLOLoL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Dec 2022 06:44:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbiLOLoK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Dec 2022 06:44:10 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D39322C11C;
        Thu, 15 Dec 2022 03:44:09 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6C71361D73;
        Thu, 15 Dec 2022 11:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0B9C433EF;
        Thu, 15 Dec 2022 11:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1671104648;
        bh=qKOBxYX9hK7wNtSbqkd1Mf3g2xc0U5CtzK24DAOF/2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cDpG65Se8GqelPpl03gw9hupo5PpHb3fwPy4/HoS3WCCcIjfKq9WU+Mut6oVfc+KE
         YrtbVud468/G+LMTnNsvd8vpEnWATAAE+oHTaeCyzuX3X6SFVbibhVHYWjBnpX16+M
         Ei3i+naFlnaQBabLFIfsaVbVSM0ngVfprXVqtZOg=
Date:   Thu, 15 Dec 2022 12:44:06 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] usb: typec: hd3ss3220: Sort header files
Message-ID: <Y5sIhr17jO9wdCwY@kroah.com>
References: <20221209155623.29147-1-biju.das.jz@bp.renesas.com>
 <20221209155623.29147-4-biju.das.jz@bp.renesas.com>
 <Y5NfWiqhoPhkGGjG@kroah.com>
 <CAMuHMdUwhBQ-VUJ_QMuBjgvNhgkba4SquzF9Pma9nLy5d39QGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUwhBQ-VUJ_QMuBjgvNhgkba4SquzF9Pma9nLy5d39QGA@mail.gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 15, 2022 at 11:05:13AM +0100, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Fri, Dec 9, 2022 at 5:16 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Fri, Dec 09, 2022 at 03:56:22PM +0000, Biju Das wrote:
> > > This patch sorts the header files alphabetically.
> >
> > This says what you are doing, but not why.
> >
> > Why is this needed?  What does this fix?  This is no requirement of USB
> > code that I know of.
> 
> ... to avoid merge conflicts when adding/removing includes in future
> patches.

Then let's deal with that then, again, this isn't a real issue, sorry.

greg k-h
