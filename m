Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D18C51F50EC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Jun 2020 11:09:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727074AbgFJJJp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Jun 2020 05:09:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgFJJJo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Jun 2020 05:09:44 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D841C03E96B;
        Wed, 10 Jun 2020 02:09:44 -0700 (PDT)
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46A4029E;
        Wed, 10 Jun 2020 11:09:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1591780180;
        bh=x/1WGCYPX9wQegZ9rXJrtiwtlR3b2ASX7G+NGvgVKVA=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=fU6nJzNW910hSS6BxGkwYlQ9H1AN5gcEKblZhCdLSSuaQ0IHG2lJcRpTnvTGS23Tx
         68COWHb73PGvNoS1OWt5h7SXGRce4a2KHTboa624X4L7+spsbEaUwtfe91Au/99Xh4
         DaBuaSEzHCPFL+0iuEQwxN5N9iSgLa/m6m8LITo0=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 17/17] scripts/spelling.txt: Add descriptors correction
To:     Joe Perches <joe@perches.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Colin Ian King <colin.king@canonical.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Xiong <xndchn@gmail.com>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        open list <linux-kernel@vger.kernel.org>
References: <20200609124610.3445662-1-kieran.bingham+renesas@ideasonboard.com>
 <20200609124610.3445662-18-kieran.bingham+renesas@ideasonboard.com>
 <77778948acc1f475e82ad36d015ba76dc96352ff.camel@perches.com>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c65821d4-43bf-d6df-d485-9ad4febd6466@ideasonboard.com>
Date:   Wed, 10 Jun 2020 10:09:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <77778948acc1f475e82ad36d015ba76dc96352ff.camel@perches.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Joe,

On 09/06/2020 17:08, Joe Perches wrote:
> On Tue, 2020-06-09 at 13:46 +0100, Kieran Bingham wrote:
>> After coming across the s/decriptors/descriptors/ spelling error twice,
>> a scan of the tree showed it was a pervasive mistake.
> []
>> diff --git a/scripts/spelling.txt b/scripts/spelling.txt
> []
>> @@ -404,6 +404,7 @@ decendants||descendants
>>  decompres||decompress
>>  decsribed||described
>>  decription||description
>> +decriptors||descriptors
> 
> spelling.txt does not check singular and plural
> uses unless each is described separately so please
> add the singular one too:
> 
> decriptor|descriptor
> 
> $ git grep -i -w decriptor | wc -l
> 18
> $ git grep -i -w decriptors | wc -l
> 12

I believe my conversion was based on the non-pluralised version, so I
think I changed all occurences, but then foolishly somehow ended up
using the plural for the commit message, which translated into being the
entry I put in spelling.txt. Sorry ... :-S

I'll fix up, and re-validate any missing fixups after the rebase. I
think I originally did this at about v5.0, and I already picked up a
couple extra when I did the rebase, and now you've highlighted the
plural - I bet I missed some non-plural versions too ;-)

Will re-check and correct.

Thanks.

--
Kieran



