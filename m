Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 584691F407A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Jun 2020 18:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731021AbgFIQQI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Jun 2020 12:16:08 -0400
Received: from smtprelay0002.hostedemail.com ([216.40.44.2]:45008 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731061AbgFIQQH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Jun 2020 12:16:07 -0400
X-Greylist: delayed 445 seconds by postgrey-1.27 at vger.kernel.org; Tue, 09 Jun 2020 12:16:07 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave04.hostedemail.com (Postfix) with ESMTP id 6A8D8181D53FC
        for <linux-renesas-soc@vger.kernel.org>; Tue,  9 Jun 2020 16:08:42 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay03.hostedemail.com (Postfix) with ESMTP id BF78480DEF63;
        Tue,  9 Jun 2020 16:08:39 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:355:379:599:973:982:988:989:1260:1277:1311:1313:1314:1345:1359:1437:1461:1515:1516:1518:1534:1539:1593:1594:1711:1714:1730:1747:1777:1792:2393:2559:2562:2828:3138:3139:3140:3141:3142:3351:3622:3653:3865:3866:3868:3871:3872:4321:5007:6119:7903:10004:10400:10848:11232:11658:11914:12049:12297:12740:12760:12895:13069:13311:13357:13439:14181:14659:14721:21080:21627:30054:30070:30091,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: tank82_4f0fd4926dc3
X-Filterd-Recvd-Size: 2004
Received: from XPS-9350.home (unknown [47.151.136.130])
        (Authenticated sender: joe@perches.com)
        by omf02.hostedemail.com (Postfix) with ESMTPA;
        Tue,  9 Jun 2020 16:08:37 +0000 (UTC)
Message-ID: <77778948acc1f475e82ad36d015ba76dc96352ff.camel@perches.com>
Subject: Re: [PATCH 17/17] scripts/spelling.txt: Add descriptors correction
From:   Joe Perches <joe@perches.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Xiong <xndchn@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jonathan =?ISO-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
        open list <linux-kernel@vger.kernel.org>
Date:   Tue, 09 Jun 2020 09:08:36 -0700
In-Reply-To: <20200609124610.3445662-18-kieran.bingham+renesas@ideasonboard.com>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
         <20200609124610.3445662-18-kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.36.2-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 2020-06-09 at 13:46 +0100, Kieran Bingham wrote:
> After coming across the s/decriptors/descriptors/ spelling error twice,
> a scan of the tree showed it was a pervasive mistake.
[]
> diff --git a/scripts/spelling.txt b/scripts/spelling.txt
[]
> @@ -404,6 +404,7 @@ decendants||descendants
>  decompres||decompress
>  decsribed||described
>  decription||description
> +decriptors||descriptors

spelling.txt does not check singular and plural
uses unless each is described separately so please
add the singular one too:

decriptor|descriptor

$ git grep -i -w decriptor | wc -l
18
$ git grep -i -w decriptors | wc -l
12

