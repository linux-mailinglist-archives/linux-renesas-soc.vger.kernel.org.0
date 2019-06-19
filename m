Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57B5F4B7AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 14:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbfFSMKZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 08:10:25 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58272 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbfFSMKZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 08:10:25 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 5590B25AF1B;
        Wed, 19 Jun 2019 22:10:23 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 552DA9409FF; Wed, 19 Jun 2019 14:10:21 +0200 (CEST)
Date:   Wed, 19 Jun 2019 14:10:21 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/3] ARM: dts: Add CMT0 and CMT1 to r8a7792
Message-ID: <20190619121020.asmuj2skaicuzorb@verge.net.au>
References: <156076300266.5827.16345352064689583105.sendpatchset@octo>
 <156076302818.5827.976723043537886578.sendpatchset@octo>
 <CAMuHMdU_BfLBPvohz752j16FLoDb0X2tCR=UTFcuLo_Y45AKPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU_BfLBPvohz752j16FLoDb0X2tCR=UTFcuLo_Y45AKPw@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 03:54:29PM +0200, Geert Uytterhoeven wrote:
> On Mon, Jun 17, 2019 at 11:17 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> >
> > Add CMT0 and CMT1 to the R-Car Gen2 V2H (r8a7792) SoC.
> >
> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for inclusion in v5.3.
