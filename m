Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 908D111BD7F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Dec 2019 20:52:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbfLKTwc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Dec 2019 14:52:32 -0500
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:39273 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726345AbfLKTwc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Dec 2019 14:52:32 -0500
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id 41E1E3C04C0;
        Wed, 11 Dec 2019 20:52:30 +0100 (CET)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id iYSVJoHIIe6l; Wed, 11 Dec 2019 20:52:24 +0100 (CET)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id A1DC43C00BC;
        Wed, 11 Dec 2019 20:52:24 +0100 (CET)
Received: from lxhi-065 (10.72.93.66) by HI2EXCH01.adit-jv.com (10.72.92.24)
 with Microsoft SMTP Server (TLS) id 14.3.468.0; Wed, 11 Dec 2019 20:52:24
 +0100
Date:   Wed, 11 Dec 2019 20:52:17 +0100
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
CC:     Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: Rename r8a7796* to r8a77960*
Message-ID: <20191211195217.GA10150@lxhi-065>
References: <20191211131311.23661-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191211131311.23661-1-geert+renesas@glider.be>
X-Originating-IP: [10.72.93.66]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for your time and effort to decrease the chaos in the
R-Car3 DTS jungle. Just one small comment.

On Wed, Dec 11, 2019 at 02:13:11PM +0100, Geert Uytterhoeven wrote:

> Disadvantages:
>   - The DTB files are renamed.

This reminded me of a past contribution [*], where, based on feedback
from Laurent and Simon, the decision was to avoid DTS renaming. Does
this series mean that one day, given enough time and resources, we
might also eliminate the "r8a779[5-6]" and "(h3|m3|m3n)" redundancy in
the naming scheme of the ULCB DTS? (not that it bothers me much)

PS: [Thinking out loud] Need to get prepared for using two versions of
U-Boot scripts when switching between BSP and vanilla kernels on the
r8a77960 targets. This will definitely add a tiny bit of overhead, but
nevertheless it looks like an investment to me, the one which users
will not regret (on the contrary, will be happy about) in some years
from now.

Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>

[*] https://patchwork.kernel.org/patch/10555955/

-- 
Best Regards,
Eugeniu
