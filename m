Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D44DB2FCC3E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jan 2021 09:02:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730033AbhATIBw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jan 2021 03:01:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:50294 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730358AbhATIBX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jan 2021 03:01:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3934023158;
        Wed, 20 Jan 2021 08:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611129643;
        bh=xbIP+WPsJ6E98Erl+eKehzZs7uNKeW7OigVWbF+7uFM=;
        h=Date:From:To:Subject:References:In-Reply-To:From;
        b=X+m8B59A7d3TnUA2HfoqkW+rQ5yzm5wAZNbkuQrZYMYQhZ1PsSBaL0hzLRu0cJeGl
         7dUNIkExXfvKsuefwGqoIhPynhhhDl/ipJGQ39Z2dU5Qd+sOs/Kznkf5N4O0XVaOM1
         OQ6HHKJDVSQhTF/Qflg7GQQ9jd0tHoD5X5kQICzU=
Date:   Wed, 20 Jan 2021 09:00:39 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: serial: renesas,hscif: Add r8a779a0
 support
Message-ID: <YAfjJwije0H56wp7@kroah.com>
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
 <20201228112715.14947-4-wsa+renesas@sang-engineering.com>
 <20210119221624.GA3651@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210119221624.GA3651@kunai>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jan 19, 2021 at 11:16:24PM +0100, Wolfram Sang wrote:
> On Mon, Dec 28, 2020 at 12:27:10PM +0100, Wolfram Sang wrote:
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> 
> Can we apply this via the serial tree? Or shall we take it via
> renesas-soc? Thanks!

I can take it, but normally I try to wait for a DT maintainer ack.

If you want to take it, feel free to as well.

thanks,

greg k-h
