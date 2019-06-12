Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35558424D4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 13:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391906AbfFLLzZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 07:55:25 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:38630 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391838AbfFLLzZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 07:55:25 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 52D0425AD60;
        Wed, 12 Jun 2019 21:55:23 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 3F777E21FE5; Wed, 12 Jun 2019 13:55:21 +0200 (CEST)
Date:   Wed, 12 Jun 2019 13:55:21 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add uSD and eMMC
Message-ID: <20190612115520.27likbbmm7dqbx7u@verge.net.au>
References: <1559895251-13931-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdXv91Tt+78zLJj6pHFj9XrEJJbWOf-kzBPRbcw=h+iDHg@mail.gmail.com>
 <TY1PR01MB1770E7346A27FB36658142E1C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612094524.GA2153@kunai>
 <TY1PR01MB17707726AF6BF3EE5408D5CDC0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612101516.xrlvqw7cls7eiv4u@ninjato>
 <TY1PR01MB1770B85D549CD20C963620E6C0EC0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <20190612111900.2crgsg4adinrrw5u@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190612111900.2crgsg4adinrrw5u@ninjato>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 12, 2019 at 01:19:00PM +0200, Wolfram Sang wrote:
> 
> I think it is confusing to describe a HS400 property if the HW is not
> capable of it. Even if the driver has a safety check and will prevent it
> from being used.
> 
> But as I said, I won't be insisting. I understood it simplifies things
> in grouping boards. From my side, we can close the case here.

I would slightly prefer if the property was left out
for one thing, how can we verify the board supports HS400 at this time?
