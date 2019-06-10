Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4EA093B533
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2019 14:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389680AbfFJMsR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jun 2019 08:48:17 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:38375 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389474AbfFJMsR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jun 2019 08:48:17 -0400
Received: by mail-lf1-f65.google.com with SMTP id b11so6525226lfa.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Jun 2019 05:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=GxX02qlv74k+jrbhmwl7ljpLPp5wSdmPlkd92jQyevA=;
        b=MapJEGaRzRHysf0KjzFXNQq64lkVQUP1tKl5FP1psUnaoA2/shwmZlbtgLGX6on6KN
         LH36fsZnVFEjZsjIP3B11KBSz824FQrZu2PoY+ZwHK9y75aObp1lYBtI0wRobv3HjNGV
         BTeIVTx1RYasj7tl8y4yEPT9Txfzsd0v1OFdKEqubzkyy0DkiWWF2f0lLxQ1TQ2Tcbig
         BNvrl2ncQDL95cZ6S+98UlcKvAM5pYFFLfn47GaW3DxQsaRUfRP5jOOGvkCAHYABss3Q
         Nu14wuB8U7p5MEghX/7oqDJjWM0YlbJO9y9y8awh92PTpV9Cw11gk2GOJooZyqE1GOFB
         rwmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=GxX02qlv74k+jrbhmwl7ljpLPp5wSdmPlkd92jQyevA=;
        b=iQAD6ZnWNaZaKy1tgPnI3FA21/BtkmKP0Qm9foVxuLT3b5XhQEAX04R5ZS7r0lHqKH
         LcRb3tdEqWwEvLRE+RRAdMUgolc7BDCj949bW1M/uulm93131T3gxEqvVs5CFPq3xi+D
         f5/lE7m1//AO+k2DgSMvJS8B/okUujhUUXdWpcei9k02Z9OEOB6hy2nd90niBnfBoC9S
         XvaBrztZMCev3du4I24bDuAQumrDs0Zx0iR7RmlRgFAoCs3kgQUIb3avxUOSMt1Fxnzo
         r+euixwfhAl1A5wCUJBoh7HNPaL8FhrQH44f8G9FsNktZYllMG1Qc3C0fZNKUul4USwa
         Dmig==
X-Gm-Message-State: APjAAAX1N27w3BRfi9ciHsCNHQPoN7RLUPBObSymbbHfMgCev5GDfbE4
        bvUG0hmq/WMoTr9Adz4tlW5xBIpdz5c=
X-Google-Smtp-Source: APXvYqzDYAdwsxK/xAATQrjOYW0BOeiNC2JlWpAVl5qJKSA18+AKyoZHzlekj92x6ePbq5aGZPuN0A==
X-Received: by 2002:a19:48c3:: with SMTP id v186mr34456400lfa.42.1560170895294;
        Mon, 10 Jun 2019 05:48:15 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id b25sm1969382lff.42.2019.06.10.05.48.14
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 10 Jun 2019 05:48:14 -0700 (PDT)
Date:   Mon, 10 Jun 2019 14:48:13 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH v2 0/3] mmc: sdhi: improve HS400 quirk handling
Message-ID: <20190610124813.GD1362@bigcity.dyn.berto.se>
References: <20190606113537.8869-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190606113537.8869-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi (again) Wolfram,

I now see there was a v2 of this series which addressed Geert's 
comments. Sorry for missing this and replying to v1. For the whole 
series,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

On 2019-06-06 13:35:34 +0200, Wolfram Sang wrote:
> There are some more SoCs which cannot handle HS400. Add them and clean up the
> quirk handling a bit. So, patch 1 is suitable for stable, the rest isn't.
> 
> Note that I don't have that HW, so I am relying on the provided information.
> 
> Changes since v1 (thanks Geert and Fabrizio!):
> 	* use '[012]' to specify the range instead of single entries
> 	* add RZ/G2M to the list
> 
> Wolfram Sang (3):
>   mmc: sdhi: disallow HS400 for M3-W ES1.2, RZ/G2M, and V3H
>   mmc: sdhi: improve quirk descriptions
>   mmc: sdhi: remove unneeded initialization
> 
>  drivers/mmc/host/renesas_sdhi_core.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
> 
> -- 
> 2.11.0
> 

-- 
Regards,
Niklas Söderlund
