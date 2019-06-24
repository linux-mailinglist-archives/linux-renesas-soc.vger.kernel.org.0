Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1886505F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2019 11:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725881AbfFXJlP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jun 2019 05:41:15 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:55136 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727867AbfFXJlP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 05:41:15 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E1B6525B7C5;
        Mon, 24 Jun 2019 19:41:12 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id C97DAE22C2E; Mon, 24 Jun 2019 11:41:10 +0200 (CEST)
Date:   Mon, 24 Jun 2019 11:41:10 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Chris Paterson <chris.paterson2@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH LOCAL] arm64: dts: renesas: r8a774a1: Remove dummy board
 DTS
Message-ID: <20190624094110.rkpe3do3b7a5no4z@verge.net.au>
References: <20190620142325.28806-1-chris.paterson2@renesas.com>
 <CAMuHMdXUq=G0JEBvYk98RpzpHJHZqdbbVwAqTT5Ntr0kikOCNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXUq=G0JEBvYk98RpzpHJHZqdbbVwAqTT5Ntr0kikOCNQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 20, 2019 at 04:32:38PM +0200, Geert Uytterhoeven wrote:
> On Thu, Jun 20, 2019 at 4:23 PM Chris Paterson
> <chris.paterson2@renesas.com> wrote:
> > This dummy dts file is no longer required as we have a real board, the
> > r8a774a1-hihope-rzg2m.
> >
> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, as there is now nothing left in the 'topic/arm64-dummy-boards'
branch I will drop it from the devel branch.
