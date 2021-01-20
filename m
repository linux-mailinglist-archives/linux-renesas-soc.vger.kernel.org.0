Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CA0A2FD77C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jan 2021 18:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730547AbhATRsy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jan 2021 12:48:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:40896 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732872AbhATRsg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jan 2021 12:48:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45EFB22287;
        Wed, 20 Jan 2021 17:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1611164865;
        bh=CdcJIV2X1M1d2cO6Ducm130ev0WBzP4AjGYpoB38wrA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CSLTk1OqdVKAqy20FTjfz6a7jLQAtXS79kLMRFKCEV0x9swne+5IApw6yOCw4cDkW
         rGwFD7Nm/lWjNZTiXJh2j6DdWQbZg+AempSFF36I04NgAfJtJkcfpNPNkGnYtlMs9z
         ZYKXSw8M1x3gigm4OJhVRriL14B8IoSHw/j53pF8=
Date:   Wed, 20 Jan 2021 18:47:42 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/6] dt-bindings: serial: renesas,hscif: Add r8a779a0
 support
Message-ID: <YAhsvvOpXTyWCSNt@kroah.com>
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
 <20201228112715.14947-4-wsa+renesas@sang-engineering.com>
 <20210119221624.GA3651@kunai>
 <YAfjJwije0H56wp7@kroah.com>
 <CAMuHMdVYmW3kkYv2xTCS2X4pFpChknX7yy7N06EOegGTzK=DmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVYmW3kkYv2xTCS2X4pFpChknX7yy7N06EOegGTzK=DmQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 20, 2021 at 09:02:58AM +0100, Geert Uytterhoeven wrote:
> Hi Greg,
> 
> On Wed, Jan 20, 2021 at 9:00 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> > On Tue, Jan 19, 2021 at 11:16:24PM +0100, Wolfram Sang wrote:
> > > On Mon, Dec 28, 2020 at 12:27:10PM +0100, Wolfram Sang wrote:
> > > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > ---
> > >
> > > Can we apply this via the serial tree? Or shall we take it via
> > > renesas-soc? Thanks!
> >
> > I can take it, but normally I try to wait for a DT maintainer ack.
> >
> > If you want to take it, feel free to as well.
> 
> Acked on Jan 8:
> https://lore.kernel.org/linux-devicetree/20210108034114.GA1845830@robh.at.kernel.org/
> 
> Thanks for applying!

Ah, missed that, sorry, now queued up.

greg k-h
